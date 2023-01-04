#!/bin/sh
xrandr --output DisplayPort-0 --primary --mode 3440x1440 --pos 0x365 --rotate normal -r 99.98 \
       --output DisplayPort-1 --off \
       --output HDMI-A-1 --off \
       --output HDMI-A-0 --off \
       --output DVI-D-0 --off
