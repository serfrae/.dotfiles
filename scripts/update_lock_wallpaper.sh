#!/bin/sh

current_wallpaper=$(hyprctl hyprpaper wallpaper | awk '{print $3}')
sed -i "s|path =.*|path = $current_wallpaper|" ~/.config/hypr/hyprlock.conf
