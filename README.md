# Setup Doorbot

A set of scripts to set up a DoESLiverpool DoorBot.

## Structure

DoES Liverpool has three types of doorbot.  Most of the basics are shared between them all, and that is all contained within the `base-doorbot` role.  Other roles, such as the one running a web browser for doorbot1, are layered on top of that.

## Steps:

1. Install [Ansible](https://www.ansible.com/get-started) on your computer
1. Install the latest [Raspbian lite image](https://www.raspberrypi.org/downloads/raspbian/) onto a micro-SD card
1. Boot the Raspberry Pi with the micro-SD card, while plugged into a network via Ethernet
1. Find out the IP address of the Raspberry Pi
 * Use nmap (eg: `nmap -p 22 192.168.0.* --open`), router or monitor to find IP address of Pi once booted.
1. Copy your SSH credentials onto the Pi
  ```ssh-copy-id pi@<ip-address-of-the-pi>```
1. Edit the ```hosts``` file so ansible knows which computer to configure.  Change the IP address in it to match the one you just found out.
1. Check you can run commands on the Pi using Ansible
   ```ansible doorbot -i hosts -a "hostname" -u pi```
1. Create the hashed password file to use in a moment (if you don't already have it). At the prompt, provide the relevant password for the doorbot
   ```mkpasswd --method=sha-512 > protected_scripts/doorbot1-pwd.txt```
1. Change the SSH port and default password on the doorbot
   ```ansible-playbook ssh-config-doorbot1.yml -e pi_password=`cat protected_scripts/doorbot1-pwd.txt` -i hosts```
1. Copy `protected_scripts/wpa_supplicant.conf.example` to `protected_scripts/wpa_supplicant.conf` and update it to the correct WiFi SSID/password
1. Copy the SSH deploy keys to `protected_scripts`
1. Update the Pi, using the correct playbook for the doorbot you're creating, e.g.
   ```ansible-playbook doorbot1.yml -i hosts```


