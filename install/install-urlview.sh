#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/urlview"
ln -sf "$DOTFILES/urlview/config" "$XDG_CONFIG_HOME/urlview/config"
