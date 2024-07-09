#!/bin/sh

current_wallpaper=$(hyperctl hyprpaper wallpaper | awk '{print $3}')
sed -i "s|path =.*|path = $current_wallpaper|" ~/.config/hypr/hyprlock.conf
