#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/tmux";
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
