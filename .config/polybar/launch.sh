#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if xrandr --query | grep "DP-2 connected" | grep "3840x2160"; then
  MONITOR="DP-2" polybar top4k
else
  DISPLAY1="$(xrandr -q | grep '^HDMI-1 connected' | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY1" ]] && MONITOR="$DISPLAY1" polybar top &

  DISPLAY2="$(xrandr -q | grep '^DP-1 connected' | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY2" ]] && MONITOR="DP-1" polybar top &

  DISPLAY3="$(xrandr -q | grep "^DP-2 connected" | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY3" ]] && MONITOR="DP-2" polybar top &

  DISPLAY4="$(xrandr -q | grep "^DP-2-3 connected" | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY4" ]] && MONITOR="DP-2-3" polybar top &

  DISPLAY5="$(xrandr -q | grep "^DP-1-3 connected" | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY5" ]] && MONITOR="DP-1-3" polybar top &

  DISPLAY6="$(xrandr -q | grep '^eDP-1 connected' | cut -d ' ' -f1)"
  [[ ! -z "$DISPLAY6" ]] && MONITOR="eDP-1" polybar laptop &
fi

echo "Bars launched..."
