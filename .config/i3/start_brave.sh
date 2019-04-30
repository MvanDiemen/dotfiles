if xrandr --query | grep "HDMI1 connected"; then
  if xrandr --query | grep "3840x2160"; then
    brave --force-device-scale-factor=1.5
  else
    brave
  fi
elif xrandr --query | grep "DP2 connected"; then
  brave
else
  brave --force-device-scale-factor=1.5
fi
