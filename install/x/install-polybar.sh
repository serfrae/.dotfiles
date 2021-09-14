#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/polybar";
mkdir -p "$XDG_CONFIG_HOME/polybar/scripts";
ln -sf "$DOTFILES/x/polybar/config" "$XDG_CONFIG_HOME/polybar/config"
ln -sf "$DOTFILES/x/polybar/scripts/" "$XDG_CONFIG_HOME/polybar/scripts"
