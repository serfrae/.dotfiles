#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/picom"
ln -sf "$DOTFILES/picom/picom.conf" "$XDG_CONFIG_HOME/picom/picom.conf"
