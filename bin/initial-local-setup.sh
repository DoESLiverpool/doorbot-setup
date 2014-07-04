#!/bin/sh

usage() {
    echo "usage: initial-local-setup.sh <path-to-sd>"
}

if [ "$1" = "" ]; then
    usage
    exit
fi

SDPATH="$1"

touch "$SDPATH/etc/SSHFLAG"

cp scripts/enable-ssh.sh "$SDPATH/sbin/"

perl -p -i -e 's/sh \/sbin\/enable-ssh.sh//g; s/^exit 0$/sh \/sbin\/enable-ssh.sh\nexit 0/' "$SDPATH/etc/rc.local"

echo "Please enter SSID or leave blank for DoESLiverpool."
read USER_SSID
if [ "$USER_SSID" = "" ]; then
    SSID="DoESLiverpool"
else
    SSID="$USER_SSID"
fi
echo "Please enter password for WiFi - $SSID"
read PASSWORD

sed -i '1 a auto wlan0' "$SDPATH/etc/network/interfaces"
sed -i 's/wpa-roam/#wpa-roam/' "$SDPATH/etc/network/interfaces"
sed -i 's/iface wlan0 inet manual/iface wlan0 inet dhcp/' "$SDPATH/etc/network/interfaces"
echo "wpa-conf /etc/wpa.conf" >> "$SDPATH/etc/network/interfaces"

cat - > "$SDPATH/etc/wpa.conf" <<EOF
network={
ssid="$SSID"
proto=RSN
key_mgmt=WPA-PSK
pairwise=CCMP TKIP
group=CCMP TKIP
psk="$PASSWORD"
}
EOF

rm "$SDPATH/etc/profile.d/raspi-config.sh"
