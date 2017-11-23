if xrandr --query | grep "HDMI-1 connected"; then
  if xrandr --query | grep "3840x2160"; then
    terminator --profile 4ksetup
  else
    terminator
  fi
elif xrandr --query | grep "DP-2 connected"; then
  terminator
else
  terminator --profile laptop
fi

