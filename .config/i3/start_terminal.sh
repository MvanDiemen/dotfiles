if xrandr --query | grep "^DP-1 connected"; then
  terminator --profile 4ksetup
else
  terminator
fi
