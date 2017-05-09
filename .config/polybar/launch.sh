#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if xrandr --query | grep "^HDMI-1 connected"; then
  polybar top
else
  polybar top4k
fi

echo "Bars launched..."
