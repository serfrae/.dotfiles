#!/bin/sh

mkdir -p $XDG_CONFIG_HOME/sway

ln -sf "$DOTFILES/sway/config" "$XDG_CONFIG_HOME/sway/config"
