if xrandr --query | grep "3840x2160"; then
  slack --force-device-scale-factor=1.5
else
  slack
fi
