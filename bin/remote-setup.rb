#!/usr/bin/ruby

require 'rubygems'
require 'bundler/setup'

require 'yaml'
require 'net/http'
require 'net/ssh'
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
  Net::SSH.start(LCConfig.env["hostname"], 'pi') do |ssh|
    ssh.exec!("sudo sed -i 's/^Port 22$/Port #{LCConfig.env["port"]}/' /etc/ssh/sshd_config")
    ssh.exec!("sudo /etc/init.d/ssh restart")

    ssh.loop
  end
end

Net::SSH.start(LCConfig.env["hostname"], 'pi', :port => LCConfig.env["port"].to_i ) do |ssh|
  stdout = ""
  ssh.exec!("ls -l /home/pi/") do |channel, stream, data|
    stdout << data if stream == :stdout
  end
  puts stdout

  ssh.loop
end
