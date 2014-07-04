#!/bin/sh

if [ -e /etc/SSHFLAG ]; then
  /usr/sbin/update-rc.d -f ssh defaults
  /bin/rm /etc/SSHFLAG
  /sbin/shutdown -r now
fi
