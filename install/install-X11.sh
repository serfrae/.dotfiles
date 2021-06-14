#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/X11"
ln -sf "$DOTFILES/X11/xinitrc" $XINITRC
ln -sf "$DOTFILES/X11/xmodmap" "$XDG_CONFIG_HOME/X11/xmodmap"
