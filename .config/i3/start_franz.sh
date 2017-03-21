if xrandr --query | grep "HDMI-1 connected"; then
  franz-bin
else
  franz-bin --force-device-scale-factor=1.5
fi
