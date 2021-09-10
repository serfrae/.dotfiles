#!/bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r bspwm &

ext_monitor=$(xrandr --query | rg 'DP-1')
if [[ $ext_monitor = *connected* ]]; then
      polybar ext &
fi
