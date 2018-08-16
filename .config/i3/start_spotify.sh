if xrandr --query | grep "HDMI1 connected"; then
  if xrandr --query | grep "HDMI1" | grep "3840x2160"; then
    spotify --force-device-scale-factor=1.5
  else
    spotify
  fi
elif xrandr --query | grep "DP2 connected"; then
  spotify
else
  spotify --force-device-scale-factor=1.2
fi

# if xrandr --query | grep "HDMI-1 connected"; then
#   if xrandr --query | grep "3840x2160"; then
#     spotify --force-device-scale-factor=1.5
#   else
#     spotify
#   fi
# elif xrandr --query | grep "DP-2 connected"; then
#   spotify
# else
#   spotify --force-device-scale-factor=1.2
# fi
