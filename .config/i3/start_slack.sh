#!/bin/bash
if xrandr | grep "^HDMI-1 connected"; then
  ZOOM="1.5"
elif xrandr | grep "^DP-1 connected"; then
  ZOOM="1.0"
elif xrandr | grep "^DP-2 connected"; then
  if xrandr | grep "3840x2160"; then
    ZOOM="1.5"
  else
    ZOOM="1.0"
  fi
elif xrandr | grep "^DP-2-3 connected"; then
  ZOOM="1.0"
elif xrandr | grep "^DP-1-3 connected"; then
  ZOOM="1.0"
else
  ZOOM="1.5"
fi

if [ -n "$ZOOM" ]; then
  slack --force-device-scale-factor=$ZOOM
else
  slack
fi
