#!/bin/bash
if xrandr | grep "^HDMI1 connected"; then
  ZOOM="1.5"
elif xrandr | grep "^DP1 connected"; then
  unset -v ZOOM
elif xrandr | grep "^DP2 connected"; then
  unset -v ZOOM
elif xrandr | grep "^DP2-3 connected"; then
  unset -v ZOOM
elif xrandr | grep "^DP1-3 connected"; then
  unset -v ZOOM
else
  ZOOM="1.5"
fi

if [ -n "$ZOOM" ]; then
  firefox --force-device-scale-factor=$ZOOM
else
  firefox
fi