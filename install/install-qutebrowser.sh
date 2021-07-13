#!/bin/sh

CPATH="$XDG_CONFIG_HOME/qutebrowser"
mkdir -p $CPATH
ln -sf "$DOTFILES/qutebrowser/config.py" "$CPATH/config.py"
ln -sf "$DOTFILES/qutebrowser/gruvbox.py" "$CPATH/gruvbox.py"
ln -sf "$DOTFILES/qutebrowser/quickmarks" "$CPATH/quickmarks"
