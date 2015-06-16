#!/usr/bin/ruby

require 'rubygems'
require 'bundler/setup'

require 'yaml'
require 'net/http'
require 'net/ssh'
require 'net/scp'
require 'tzinfo'

#YAML::ENGINE.yamler = 'syck'

class LCConfig
    def self.load
        @@config = YAML.load_file("#{File.dirname(File.expand_path($0))}/../doorbots-config/config.yaml")
        @@tz = nil
        if @@config["settings"] and @@config["settings"]["timezone"]
          @@tz = TZInfo::Timezone.get(@@config["settings"]["timezone"])
        end
    end

    def self.door_open_minimum
      min = LCConfig.env["door_open_minimum"]
      if min.nil? and LCConfig.config["settings"]
        min = LCConfig.config["settings"]["door_open_minimum"]
      end
      if min.nil?
        min = 2
      end
      min
    end

    def self.config
        @@config
    end

    def self.tz
        @@tz
    end

    def self.env
      @@config["environments"][ARGV[0]]
    end

    def self.setup_signal
        Signal.trap("HUP") do
            begin
                LCConfig.load
                puts LCConfig.config.inspect
            rescue Exception => e
                puts "erk: #{e.inspect}"
            end
        end
    end
end

# Flag to remember if we have to reboot the pi at the end
need_reboot = false

change_ssh_port = ARGV.include?("-s")
ARGV.delete("-s")

LCConfig.load
LCConfig.setup_signal

if ARGV.length < 1
  puts "usage: remote-setup.rb <environment>"
  exit
end

if LCConfig.env.nil?
  puts "Invalid environment specified: #{ARGV[0]}"
end

if change_ssh_port
  puts "Changing SSH port"
  Net::SSH.start(LCConfig.env["hostname"], 'pi') do |ssh|
    ssh.exec!("sudo sed -i 's/^Port 22$/Port #{LCConfig.env["port"]}/' /etc/ssh/sshd_config")
    ssh.exec!("sudo /etc/init.d/ssh restart")

    ssh.loop
  end
end

# Set up the common base system
# We'll set up the Kindle, screens, etc. if needed later 
Net::SSH.start(LCConfig.env["hostname"], 'pi', :port => LCConfig.env["port"].to_i ) do |ssh|
  ssh.exec!("sudo apt-get update; sudo apt-get upgrade -y") do |channel, stream, data|
    puts data if stream == :stdout
  end
  ssh.exec!("sudo sed -i 's/^blacklist i2c-bcm2708/#blacklist i2c-bcm2708/' /etc/modprobe.d/raspi-blacklist.conf") do |channel, stream, data|
    puts data if stream == :stdout
  end
  ssh.exec!("sudo bash -c \"echo 'i2c-dev' >> /etc/modules\"") do |channel, stream, data|
    puts data if stream == :stdout
  end
  ssh.exec!("sudo modprobe i2c-dev") do |channel, stream, data|
    puts data if stream == :stdout
  end
  ssh.exec!("sudo bash -c \"echo 'export DOORBOT_ENV=\"#{ARGV[0]}\"' > /etc/doorbot-env\"") do |channel, stream, data|
    puts data if stream == :stdout
  end
  ssh.exec!("sudo apt-get install -y screen ruby espeak") do |channel, stream, data|
    puts data if stream == :stdout
  end
  ssh.exec!("sudo gem install bundle") do |channel, stream, data|
    puts data if stream == :stdout
  end
  ssh.exec!("rm -rf logcards; git clone https://github.com/DoESLiverpool/logcards.git; cd logcards; bundle install") do |channel, stream, data|
    puts data if stream == :stdout
  end

  ssh.exec!("rm /home/pi/.ssh/id_rsa; rm /home/pi/.ssh/id_rsa.pub; ssh-keygen -q -f /home/pi/.ssh/id_rsa -N ''") do |channel, stream, data|
    puts data if stream == :stdout
  end

  puts "SSH keys generated, please add this public key to bitbucket:"
  ssh.exec!("cat /home/pi/.ssh/id_rsa.pub") do |channel, stream, data|
    puts data if stream == :stdout
  end
  puts "Press enter when you have added key to bitbucket"
  $stdin.gets

  ssh.exec!("cd /home/pi/logcards/; git clone git@bitbucket.org:doesliverpool/doorbots-config.git") do |channel, stream, data|
    puts data if stream == :stdout
  end

  ssh.exec!("ln -s /home/pi/logcards/doorbots-config/config.yaml /home/pi/logcards/config.yaml") do |channel, stream, data|
    puts data if stream == :stdout
  end

  

  ssh.exec!("sudo cp /home/pi/logcards/init/logcards /etc/init.d/") do |channel, stream, data|
    puts data if stream == :stdout
  end

  ssh.exec!("sudo /usr/sbin/update-rc.d -f logcards defaults") do |channel, stream, data|
    puts data if stream == :stdout
  end

  ssh.exec!("sudo /etc/init.d/logcards start") do |channel, stream, data|
    puts data if stream == :stdout
  end

  ssh.loop
end
Net::SCP.start(LCConfig.env["hostname"], 'pi', :port => LCConfig.env["port"].to_i ) do |scp|
  scp.upload! "../scripts/reload-local-config.sh", "/home/pi/"
  scp.upload! "../scripts/reload-all-config.sh", "/home/pi/"
  scp.upload! "../scripts/ssh_config", "/home/pi/.ssh/config"
end

# See if we need to pull in a web browser and doesscreens
if LCConfig.env["doesscreens"]
  puts "Setting up the browser screen"
  Net::SCP.start(LCConfig.env["hostname"], 'pi', :port => LCConfig.env["port"].to_i ) do |scp|
    scp.upload! "../scripts/doesscreens_browser", "/home/pi/"
  end
  Net::SSH.start(LCConfig.env["hostname"], 'pi', :port => LCConfig.env["port"].to_i ) do |ssh|
    # Get the content to display
    ssh.exec!("rm -rf doesscreens; git clone https://github.com/DoESLiverpool/doesscreens.git") do |channel, stream, data|
      puts data if stream == :stdout
    end
    ssh.exec!("ln -s ../logcards/doorbots-config/passwords.js doesscreens/passwords.js") do |channel, stream, data|
      puts data if stream == :stdout
    end
  
    # Install Kweb3 web browser and a window manager to run it in
    ssh.exec!("sudo apt-get install -y matchbox-window-manager") do |channel, stream, data|
      puts data if stream == :stdout
    end
    ssh.exec!("wget http://steinerdatenbank.de/software/kweb-1.6.3.tar.gz; tar -xzf kweb-1.6.3.tar.gz; cd kweb-1.6.3; ./debinstall") do |channel, stream, data|
      puts data if stream == :stdout
    end

    # Set it to start on boot
    ssh.exec!('sudo perl -p -i -e \'s/su -l pi -c \"xinit .\/doesscreens_browser\"\n//g; s/^exit 0$/su -l pi -c \"xinit .\/doesscreens_browser\"\nexit 0/\' /etc/rc.local') do |channel, stream, data|
      puts data if stream == :stdout
    end

    # Get rid of the mouse cursor
    ssh.exec!("sudo apt-get install -y unclutter") do |channel, stream, data|
      puts data if stream == :stdout
    end

    # Rotate the screen
    ssh.exec!('sudo sed -i \'$a # Portrait mode for the display\ndisplay_rotate=3\' /boot/config.txt') do |channel, stream, data|
      puts data if stream == :stdout
    end
    # Now we're rotated the screen, we need to reboot for it to take effect
    need_reboot = true
  
    ssh.loop
  end
end

if need_reboot
  puts "All done, but the Raspberry Pi needs rebooting, so doing that now."
  Net::SSH.start(LCConfig.env["hostname"], 'pi', :port => LCConfig.env["port"].to_i ) do |ssh|
    ssh.exec!("sudo reboot") do |channel, stream, data|
      puts data if stream == :stdout
    end
    ssh.loop
  end
end
