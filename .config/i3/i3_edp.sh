#!/bin/bash
SIZE="2560x1440"
if xrandr | grep "^HDMI1 connected"; then
  DISPLAY="HDMI1"
elif xrandr | grep "^DP1 connected"; then
  DISPLAY="DP1"
elif xrandr | grep "^DP2 connected"; then
  DISPLAY="DP2"
elif xrandr | grep "^DP2-3 connected"; then
  DISPLAY="DP2-3"
  xrandr --output DP2-3 --mode "2560x1440" --auto --output eDP1 --off
elif xrandr | grep "^DP1-3 connected"; then
  DISPLAY="DP1-3"
else
  DISPLAY="eDP1"
  xrandr --auto --output eDP1 --dpi 120 --mode "2560x1440"
fi

# if [ "$DISPLAY" == eDP1 ]; then
#   $(xrandr --auto --output "eDP1" --dpi 120 --mode "2560x1440")
# else
#   $(xrandr --output $DISPLAY --mode $SIZE --dpi 96 --output "eDP1" --off)
#   $(/usr/bin/notify-send --urgency=low -t 500 "Switched to $DISPLAY")
# fi
