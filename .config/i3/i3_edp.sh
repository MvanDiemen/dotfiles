#!/bin/bash
if xrandr --query | grep "DP-1-2 connected"; then
  if xrandr --query | grep "DP-1-1 connected"; then
    xrandr --auto --output "DP-1-2" --dpi 96 --mode "1920x1080" --output "DP-1-1" --mode "1920x1080" --left-of "DP-1-2" --output "eDP-1" --off --auto
    # xrandr --auto --output "DP-1-2" --dpi 96 --mode "1920x1080" --output "eDP-1" --off --auto --output "DP-1-1" --off --auto
  else
    xrandr --auto --output "DP-1-2" --dpi 96 --mode "1920x1080" --output "eDP-1" --off --auto --output "DP-1-1" --off --auto
  fi
elif xrandr --query | grep "HDMI-1 connected"; then
  xrandr --auto --output "HDMI-1" --dpi 120 --mode "3840x2160" --output "eDP-1" --off --auto
else
  xrandr --auto --output "eDP-1" --dpi 96 --mode "1920x1080"
fi
