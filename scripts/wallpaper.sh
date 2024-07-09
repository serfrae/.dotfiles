#!/bin/sh

wallpaper=$(fd -t f -e png -e jpg -e jpeg . ~/media/images/wallpapers | shuf -n 1)
config_file="/tmp/hyprpaper.conf"
monitor_name=$(hyprctl monitors | grep -m 1 '^Monitor' | awk '{print $2}')

echo "preload = $wallpaper" > "$config_file"
echo "wallpaper =,${wallpaper}" >> "$config_file"

hyprpaper -c "$config_file"

~/bin/update_lock_wallpaper.sh
