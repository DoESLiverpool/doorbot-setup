#!/bin/sh

usage() {
    echo "usage: setup-ssh-locally.sh <path-to-sd>"
}

if [ "$1" == "" ]; then
    usage
    exit
fi

SDPATH="$1"

touch $SDPATH/etc/SSHFLAG

cp scripts/enable-ssh.sh $SDPATH/sbin/

sed 's/exit 0/sh /sbin/enable-ssh.sh\nexit 0/' $SDPATH/etc/rc.local
