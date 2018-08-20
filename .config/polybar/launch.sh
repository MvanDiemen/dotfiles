#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if xrandr --query | grep "HDMI1 connected" | grep "3840x2160"; then
  polybar top4k
else
  DISPLAY1="$(xrandr -q | grep '^HDMI1 connected' | cut -d ' ' -f1)"
  # [[ ! -z "$DISPLAY1" ]] && MONITOR="$DISPLAY1" polybar 4ktop &
  [[ ! -z "$DISPLAY1" ]] && MONITOR="$DISPLAY1" polybar top &

  DISPLAY3="$(xrandr -q | grep '^DP1 connected' | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY3" ]] && MONITOR="DP1" polybar top &

  DISPLAY4="$(xrandr -q | grep "^DP2 connected" | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY4" ]] && MONITOR="DP2" polybar top &

  DISPLAY2="$(xrandr -q | grep '^eDP1 connected' | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY2" ]] && MONITOR="eDP1" polybar laptop &
fi

echo "Bars launched..."
