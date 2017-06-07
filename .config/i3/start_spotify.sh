if xrandr --query | grep "3840x2160"; then
  spotify --force-device-scale-factor=1.5
else
  spotify
fi
