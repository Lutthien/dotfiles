#!/bin/sh

export MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')
export TEMP_PATH=/sys/devices/platform/coretemp.0/hwmon/$(ls /sys/devices/platform/coretemp.0/hwmon)/temp1_input
killall polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar top -c ~/.config/polybar/config-top.ini &
polybar bottom -c ~/.config/polybar/config-bottom.ini &
