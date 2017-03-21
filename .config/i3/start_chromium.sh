if xrandr --query | grep "HDMI-1 connected"; then
  chromium
else
  chromium --force-device-scale-factor=1.5
fi
