#!/bin/bash
if xrandr | grep "^HDMI-1 connected"; then
  PROFILE="default"
elif xrandr | grep "^DP-1 connected"; then
  PROFILE="default"
elif xrandr | grep "^DP-2 connected"; then
  if xrandr | grep "3840x2160"; then
    PROFILE="4ksetup"
  else
    PROFILE="default"
  fi
elif xrandr | grep "^DP-2-3 connected"; then
  PROFILE="default"
elif xrandr | grep "^DP-1-3 connected"; then
  PROFILE="default"
else
  PROFILE="laptop"
fi

if [ -n "$PROFILE" ]; then
  terminator --profile $PROFILE
else
  terminator
fi
