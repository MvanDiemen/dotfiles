#!/bin/bash
if xrandr | grep "^HDMI-1 connected"; then
  xrandr --output HDMI-1 --mode "2560x1440" --auto --output eDP-1 --off
  # DISPLAY="HDMI-1"
elif xrandr | grep "^DP-1 connected"; then
  xrandr --output DP-1 --mode "2560x1440" --auto --output eDP-1 --off
  # DISPLAY="DP-1"
elif xrandr | grep "^DP-2 connected"; then
  if xrandr | grep "3840x2160"; then
    xrandr --output DP-2 --mode "3840x2160" --auto --output eDP-1 --off
  else
    xrandr --output DP-2 --mode "2560x1440" --auto --output eDP-1 --off
  fi
  # DISPLAY="DP-2"
elif xrandr | grep "^DP-2-3 connected"; then
  # DISPLAY="DP-2-3"
  xrandr --output DP-2-3 --mode "2560x1440" --auto --output eDP-1 --off
elif xrandr | grep "^DP-1-3 connected"; then
  # DISPLAY="DP-1-3"
  xrandr --output DP-1-3 --mode "2560x1440" --auto --output eDP-1 --off
else
  # DISPLAY="eDP-1"
  xrandr --auto --output eDP-1 --dpi 120 --mode "2560x1440"
fi

# if [ "$DISPLAY" == eDP1 ]; then
#   $(xrandr --auto --output "eDP1" --dpi 120 --mode "2560x1440")
# else
#   $(xrandr --output $DISPLAY --mode $SIZE --dpi 96 --output "eDP1" --off)
#   $(/usr/bin/notify-send --urgency=low -t 500 "Switched to $DISPLAY")
# fi
