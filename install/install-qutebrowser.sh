#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/qutebrowser"
ln -sf $DOTFILES/qutebrowser/config.py $XDG_CONFIG_HOME/qutebrowser/config.py
ln -sf $DOTFILES/qutebrowser/gruvbox.py $XDG_CONFIG_HOME/qutebrowser/gruvbox.py
ln -sf $DOTFILES/qutebrowser/quickmarks $XDG_CONFIG_HOME/qutebrowser/quickmarks
ln -sf $DOTFILES/qutebrowser/open_url_in_instance.sh $XDG_CONFIG_HOME/qutebrowser/open_url_in_instance.sh
