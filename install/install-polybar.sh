#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/polybar";
mkdir -p "$XDG_CONFIG_HOME/polybar/scripts";
ln -sf "$DOTFILES/polybar/config" "$XDG_CONFIG_HOME/polybar/config"
ln -sf "$DOTFILES/polybar/scripts/" "$XDG_CONFIG_HOME/polybar/scripts"
