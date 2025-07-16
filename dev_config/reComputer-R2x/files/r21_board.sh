#!/bin/bash

DETECT_PIN=578

echo $DETECT_PIN > /sys/class/gpio/export

echo in > /sys/class/gpio/gpio$DETECT_PIN/direction

cat /sys/class/gpio/gpio$DETECT_PIN/value

value=$(cat /sys/class/gpio/gpio$DETECT_PIN/value)

echo $value > /home/pi/result

if [ "$value" == "1" ]; then
    echo "start to dtoverlay reComputer-R21"
    dtoverlay reComputer-R21
fi
