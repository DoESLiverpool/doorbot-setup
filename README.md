# Setup Doorbot

A set of scripts to set up a DoESLiverpool DoorBot.

Steps:

 * Manually install stock raspbian.
 * Enable SSH, ideally while SD card is plugged into local machine.
 * Set up networking, WiFi if necessary
 * Run apt-get update/upgrade
 * Set up the door entry system
  * Install ruby
  * Git clone the logcards repository
  * Copy the startup script into /etc/init/
 * If the env requires it, set up the door screen
  * Install chromium
  * Git clone the doesscreens repository
  * Copy the startup script into /etc/init
