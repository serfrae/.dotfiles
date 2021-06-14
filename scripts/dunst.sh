#!/bin/sh

#        -lf/nf/cf color
#            Defines the foreground color for low, normal and critical notifications respectively.
# 
#        -lb/nb/cb color
#            Defines the background color for low, normal and critical notifications respectively.
# 
#        -lfr/nfr/cfr color
#            Defines the frame color for low, normal and critical notifications respectively.

#[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

pidof dunst && killall dunst

dunst -lf  "${#ebdbb2}" \
      -lb  "${#282828}" \
      -lfr "${#282828}" \
      -nf  "${#ebdbb2}" \
      -nb  "${#282828}" \
      -nfr "${#282828}" \
      -cf  "${#ebdbb2}" \
      -cb  "${#282828}" \
      -cfr "${#282828}" > /dev/null 2>&1 &

