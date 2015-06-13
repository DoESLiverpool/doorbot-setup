#!/bin/sh

usage() {
    echo "usage: sudo initial-local-setup.sh <path-to-sd-device>"
    echo "e.g. sudo initial-local-setup.sh /dev/mmcblk0"
}

if [ "$1" = "" ]; then
    usage
    exit
fi

SDPATH="$1"

echo "Looking for an existing Raspbian image in this directory"
RASPBIAN_IMG=`ls *.img | head -1`
echo $RASPIAN_IMG
if [ "$RASPBIAN_IMG" = "" ]; then
    echo "Couldn't find a Raspbian image."
    exit
fi
echo "Now installing Raspbian.  This will take a while."
dd bs=4M if=$RASPBIAN_IMG of=$SDPATH

# Mount the newly formatted SD card
MOUNTED_SD_PATH=/tmp/doorbot_sd
mkdir $MOUNTED_SD_PATH
mount ${SDPATH}p2 $MOUNTED_SD_PATH

touch "$MOUNTED_SD_PATH/etc/SSHFLAG"

cp scripts/enable-ssh.sh "$MOUNTED_SD_PATH/sbin/"

perl -p -i -e 's/sh \/sbin\/enable-ssh.sh//g; s/^exit 0$/sh \/sbin\/enable-ssh.sh\nexit 0/' "$MOUNTED_SD_PATH/etc/rc.local"

echo "Please enter SSID or leave blank for DoESLiverpool."
read USER_SSID
if [ "$USER_SSID" = "" ]; then
    SSID="DoESLiverpool"
else
    SSID="$USER_SSID"
fi
echo "Please enter password for WiFi - $SSID"
read PASSWORD

sed -i '1 a auto wlan0' "$MOUNTED_SD_PATH/etc/network/interfaces"
sed -i 's/wpa-roam/#wpa-roam/' "$MOUNTED_SD_PATH/etc/network/interfaces"
sed -i 's/iface wlan0 inet manual/iface wlan0 inet dhcp/' "$MOUNTED_SD_PATH/etc/network/interfaces"
echo "wpa-conf /etc/wpa.conf" >> "$MOUNTED_SD_PATH/etc/network/interfaces"

cat - > "$MOUNTED_SD_PATH/etc/wpa.conf" <<EOF
network={
ssid="$SSID"
proto=RSN
key_mgmt=WPA-PSK
pairwise=CCMP TKIP
group=CCMP TKIP
psk="$PASSWORD"
}
EOF

rm "$MOUNTED_SD_PATH/etc/profile.d/raspi-config.sh"

# Unmount ready for removal
umount $MOUNTED_SD_PATH
