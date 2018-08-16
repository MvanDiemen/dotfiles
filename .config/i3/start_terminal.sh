if xrandr --query | grep "HDMI1 connected"; then
  if xrandr --query | grep "HDMI1" | grep "3840x2160"; then
    terminator --profile 4ksetup
    # alacritty
  else
    terminator
    # alacritty
  fi
elif xrandr --query | grep "DP2 connected"; then
  terminator
  # alacritty
else
  terminator --profile laptop
  # alacritty
fi
