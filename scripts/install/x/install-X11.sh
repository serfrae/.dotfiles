#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/X11"
ln -sf "$DOTFILES/x/X11/xinitrc" $XINITRC
ln -sf "$DOTFILES/x/X11/xmodmap" "$XDG_CONFIG_HOME/X11/xmodmap"
ln -sf "$DOTFILES/x/X11/xresources" "$XDG_CONFIG_HOME/X11/xresources"
