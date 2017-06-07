if xrandr --query | grep "3840x2160"; then
  terminator --profile 4ksetup
else
  terminator
fi

