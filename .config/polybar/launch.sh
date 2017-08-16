#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done


# Launch bar1 and bar2
if xrandr --query | grep "3840x2160"; then
  polybar top4k
else
  # Launch bar1 and bar2
  DISPLAY1="$(xrandr -q | grep 'DP-1-2' | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY1" ]] && MONITOR="$DISPLAY1" polybar top &

  DISPLAY3="$(xrandr -q | grep 'eDP-1' | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY3" ]] && MONITOR="$DISPLAY3" polybar top &

  DISPLAY2="$(xrandr -q | grep 'DP-1-1' | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY2" ]] && MONITOR="$DISPLAY2" polybar top &
fi

echo "Bars launched..."
