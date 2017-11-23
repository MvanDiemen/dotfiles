#!/bin/bash
if xrandr --query | grep "HDMI-1 connected"; then
    xrandr --auto --output "HDMI-1" --dpi 120 --mode "3840x2160" --output "eDP-1" --off --auto
    # /usr/local/libexec/hotplug_polybar.sh
    /usr/bin/notify-send --urgency=low -t 500 "Switched to HDMI-1"
elif xrandr --query | grep "DP-2 connected"; then
    xrandr --auto --output "DP-2" --dpi 96 --mode "2560x1440" --output "eDP-1" --off --auto
    # /usr/local/libexec/hotplug_polybar.sh
    /usr/bin/notify-send --urgency=low -t 500 "Switched to DP-2"
else
  xrandr --auto --output "eDP-1" --dpi 120 --mode "2560x1440"
  # /usr/local/libexec/hotplug_polybar.sh
  /usr/bin/notify-send --urgency=low -t 500 "Switched to eDP-1"
fi
