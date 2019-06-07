echo Opening door *once*
echo 1 > /sys/class/gpio/gpio25/value
sleep 1
echo 0 > /sys/class/gpio/gpio25/value
echo Door will now lock
