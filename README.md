# Setup Doorbot

A set of scripts to set up a DoESLiverpool DoorBot.

## Steps:

 * Clone repositories and setup ruby bundle:

```
git clone https://github.com/DoESLiverpool/doorbot-setup.git
cd doorbot-setup
bundle install
git clone https://bitbucket.org/doesliverpool/doorbots-config.git
```

 * On a local linux machine with the SD mounted, run `sh initial-local-setup.sh <path-to-sd>` which will:
  * Manually install stock raspbian.
  * Enable SSH, ideally while SD card is plugged into local machine.
  * Set up networking, WiFi if necessary
 * Set up Pi hardware and plug SD card into Pi
 * Use nmap (eg: `nmap -p 22 192.168.0.* --open`), router or monitor to find IP address of Pi once booted.
 * Set up SSH keys, ideally using ssh-copy-id or manually (place contents of your .ssh/id_rsa.pub into .ssh/authorized_keys on doorbot)
 * Run `ruby remote-setup.rb -s <doorbot-environment>` which will:
  * Set up SSH to run from alternative port
   * Leave off the `-s` option once this step has been completed if you need to re-run the script.
  * Run apt-get update/upgrade
  * Set up the kernel modules
  * Install required packages
  * Set up SSH.
   * *This will generate an SSH key for the doorbot which must be copied to BitBucket for the config repository*
  * Set up the door entry system
   * Git clone the logcards and config repositories
   * Copy the startup script into /etc/init/
  
## To be done
  * The following does not occur yet and needs to be added:
   * If the env requires it, set up the door screen
    * Install chromium
    * Git clone the doesscreens repository
    * Copy the startup script into /etc/init
