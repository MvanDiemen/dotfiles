#!/bin/bash
if xrandr --query | grep "HDMI-1 connected"; then
  if xrandr --query | grep "3840x2160"; then
    xrandr --auto --output "HDMI-1" --dpi 120 --mode "3840x2160" --output "eDP1" --off
  else
    xrandr --auto --output "HDMI-1" --dpi 96 --mode "1920x1080" --output "eDP-1" --off --auto
  fi
else
  xrandr --auto --output "eDP-1" --dpi 96 --mode "1920x1080"
fi
