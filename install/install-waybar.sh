#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/waybar"

ln -sf "$DOTFILES/waybar/config" "$XDG_CONFIG_HOME/waybar/config"
ln -sf "$DOTFILES/waybar/style.css" "$XDG_CONFIG_HOME/waybar/style.css"
