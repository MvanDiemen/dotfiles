if xrandr --query | grep "HDMI-1 connected"; then
  terminator
else
  terminator --profile 4ksetup
fi

