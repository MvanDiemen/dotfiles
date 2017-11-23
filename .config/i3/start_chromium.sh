if xrandr --query | grep "HDMI-1 connected"; then
  if xrandr --query | grep "3840x2160"; then
    chromium --force-device-scale-factor=1.5
  else
    chromium
  fi
elif xrandr --query | grep "DP-2 connected"; then
  chromium
else
  chromium --force-device-scale-factor=1.2
fi
