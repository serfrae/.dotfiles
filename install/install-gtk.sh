#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/gtk-3.0"

ln -sf $DOTFILES/gtk-3.0/settings.ini $XDG_CONFIG_HOME/gtk-3.0/settings.ini
ln -sf $DOTFILES/gtk-3.0/gtk.css $XDG_CONFIG_HOME/gtk-3.0/gtk.css
