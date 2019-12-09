#!/bin/bash
if xrandr | grep "^HDMI1 connected"; then
  PROFILE="4ksetup"
elif xrandr | grep "^DP1 connected"; then
  unset -v PROFILE
elif xrandr | grep "^DP2 connected"; then
  unset -v PROFILE
elif xrandr | grep "^DP2-3 connected"; then
  unset -v PROFILE
elif xrandr | grep "^DP1-3 connected"; then
  unset -v PROFILE
else
  PROFILE="laptop"
fi

if [ -n "$PROFILE" ]; then
  terminator --profile $PROFILE
else
  terminator
fi