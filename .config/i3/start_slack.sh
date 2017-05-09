if xrandr --query | grep "HDMI-1 connected"; then
  slack
else
  slack --force-device-scale-factor=1.5
fi
