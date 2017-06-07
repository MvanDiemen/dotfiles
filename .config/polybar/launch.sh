#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if xrandr --query | grep "3840x2160"; then
  polybar top4k
else
  polybar top
fi

echo "Bars launched..."
