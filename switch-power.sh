#!/bin/bash

STATUS=$(cat /sys/class/power_supply/AC/online)

if [ "$STATUS" -eq 0 ]; then
    # AC unplugged → switch to power-saver
    /usr/bin/powerprofilesctl set power-saver
else
    # AC plugged → switch back to balanced
    /usr/bin/powerprofilesctl set balanced
fi
