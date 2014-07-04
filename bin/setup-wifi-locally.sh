#!/bin/sh

usage() {
    echo "usage: setup-wifi-locally.sh <path-to-sd>"
}

if [ "$1" = "" ]; then
    usage
    exit
fi

SDPATH="$1"

echo "Please enter SSID or leave blank for DoESLiverpool."
read USER_SSID
if [ "$USER_SSID" == "" ]; then
    SSID="DoESLiverpool"
else
    SSID="$USER_SSID"
fi
echo "Please enter password for WiFi - $SSID"
read PASSWORD

sed 's/wpa-roam/#wpa-roam/' "$SDPATH/etc/network/interfaces"

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

