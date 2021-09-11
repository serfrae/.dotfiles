#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/sway"
mkdir -p "$XDG_CONFIG_HOME/waybar"

ln -sf "$DOTFILES/way/sway/config" "$XDG_CONFIG_HOME/sway/config"
ln -sf "$DOTFILES/way/waybar/config" "$XDG_CONFIG_HOME/waybar/config"
ln -sf "$DOTFILES/way/waybar/style.css" "$XDG_CONFIG_HOME/waybar/style.css"
