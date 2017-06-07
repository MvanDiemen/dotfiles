if xrandr --query | grep "3840x2160"; then
  chromium --force-device-scale-factor=1.5
else
  chromium
fi
