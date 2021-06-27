#!/bin/sh

### Use wal to create a theme from wallpaper
#wal --iterative -i ~/media/images/wallpapers -o ~/bin/dunst.sh; \

feh --bg-fill --randomize $HOME/media/images/wallpapers/*; \

### Trim text in .fehbg to get path of current background
i=$(cat $XDG_CACHE_HOME/.fehbg | awk '{print $4}' | wc -c); \
i=$(($i-3)); \
WALLPAPER=$(cat $XDG_CACHE_HOME/.fehbg | awk '{print $4}' | cut -c2-$i); \

betterlockscreen -u $WALLPAPER
