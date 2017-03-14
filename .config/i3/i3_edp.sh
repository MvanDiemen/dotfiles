#!/bin/bash

if xrandr --query | grep "HDMI1 connected"; then
  if xrandr --query | grep "HDMI2 connected"; then
    echo "2 external HDMI monitors found"
    xrandr --auto --output "HDMI2" --dpi 96 --mode "1920x1080" --output "eDP1" --off --output "HDMI1" --off
    # --auto --output "HDMI-2" --mode "1920x1080" --right-of "HDMI-1"
  fi
elif xrandr --query | grep "HDMI-1 connected"; then
  if xrandr --query | grep "HDMI-2 connected"; then
    echo "2 external HDMI- monitors found"
    xrandr --auto --output "HDMI-2" --dpi 96 --mode "1920x1080" --output "eDP-1" --off --auto --output "HDMI-1" --off
    #--output "HDMI-2" --mode "1920x1080" --right-of "HDMI-1"
  fi
elif xrandr --query | grep "^DP-1 connected"; then
  echo "1 external DP monitor found"
  xrandr --auto --output "DP-1" --dpi 120 --mode "3840x2160" --output "eDP-1" --off
elif xrandr --query | grep "^DP1 connected"; then
  echo "1 external DP monitor found"
  xrandr --auto --output "DP1" --dpi 120 --mode "3840x2160" --output "eDP1" --off
elif xrandr --query | grep "eDP-1 connected"; then
  echo "no external monitor found"
  xrandr --auto --output "eDP-1" --dpi 120 --mode "2560x1600"
else
  echo "no external monitor found"
  xrandr --auto --output "eDP1" --dpi 120 --mode "2560x1600"
fi
