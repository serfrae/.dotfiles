#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/npm"
ln -sf "$DOTFILES/npm/npmrc" "$XDG_CONFIG_HOME/npm/npmrc"
