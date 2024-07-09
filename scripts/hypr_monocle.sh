#!/bin/sh

current_gaps=$(hyprctl getoptions general:gaps_out | head -n 1 | awk '{print $3}')

if [ "$current_gaps" -eq 0 ]; then
    hyprctl dispatch exec "hyprctl keyword general:gaps_out 2"
    hyprctl dispatch exec "hyprctl keyword general:border_size 1"
    notify-send "Monocle Mode Off"
else
    hyprctl dispatch exec "hyprctl keyword general:gaps_out 0"
    hyprctl dispatch exec "hyprctl keyword general:border_size 0"
    notify-send "Monocle Mode On"
fi

if [ "$1" == "f" ]
then
    hyprctl dispatch fullscreen 0
else
    hyprctl dispatch fullscreen 1
fi
