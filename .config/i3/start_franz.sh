if xrandr --query | grep "HDMI1 connected"; then
  if xrandr --query | grep "HDMI1" | grep "3840x2160"; then
    franz --force-device-scale-factor=1.5
  else
    franz
  fi
elif xrandr --query | grep "DP2 connected"; then
  franz
else
  franz
fi

# if xrandr --query | grep "HDMI-1 connected"; then
#   if xrandr --query | grep "3840x2160"; then
#     franz --force-device-scale-factor=1.5
#   else
#     franz
#   fi
# elif xrandr --query | grep "DP-2 connected"; then
#   franz
# else
#   franz
# fi
