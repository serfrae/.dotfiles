#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/sxhkd";
ln -sf "$DOTFILES/sxhkd/sxhkdrc" "$XDG_CONFIG_HOME/sxhkd/sxhkdrc"
