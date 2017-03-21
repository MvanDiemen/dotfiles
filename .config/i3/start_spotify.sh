if xrandr --query | grep "HDMI-1 connected"; then
  spotify
else
  spotify --force-device-scale-factor=1.5
fi
