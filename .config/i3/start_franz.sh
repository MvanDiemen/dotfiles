if xrandr --query | grep "HDMI-1 connected"; then
  if xrandr --query | grep "3840x2160"; then
    franz-bin --force-device-scale-factor=1.5
  else
    franz-bin
  fi
elif xrandr --query | grep "DP-2 connected"; then
  franz-bin
else
  franz-bin
fi
