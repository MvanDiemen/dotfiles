if xrandr --query | grep "3840x2160"; then
  franz-bin --force-device-scale-factor=1.5
else
  franz-bin
fi
