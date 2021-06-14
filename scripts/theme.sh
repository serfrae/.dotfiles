#!/bin/sh

#wal --iterative -i ~/media/images/wallpapers -o ~/bin/dunst.sh; \
feh --bg-fill --randomize $HOME/media/images/wallpapers/*; \
mv $HOME/.fehbg $XDG_CONFIG_HOME; \
COUNT=$(cat $XDG_CONFIG_HOME/.fehbg | awk '{print $4}' | wc -c); \
COUNT=$(($COUNT-3)); \
WALLPAPER=$(cat $XDG_CONFIG_HOME/.fehbg | awk '{print $4}' | cut -c2-$COUNT); \
betterlockscreen -u $WALLPAPER
