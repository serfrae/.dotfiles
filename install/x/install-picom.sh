#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/picom"
ln -sf "$DOTFILES/x/picom/picom.conf" "$XDG_CONFIG_HOME/picom/picom.conf"
