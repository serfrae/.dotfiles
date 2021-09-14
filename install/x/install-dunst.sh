#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/dunst";
ln -sf "$DOTFILES/x/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"
