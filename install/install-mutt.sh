#!/bin/sh

mkdir -p $XDG_CONFIG_HOME/mutt
ln -sf "$DOTFILES/mutt/a7raser.gpg" "$XDG_CONFIG_HOME/mutt/a7raser.gpg"
ln -sf "$DOTFILES/mutt/synchrony.gpg" "$XDG_CONFIG_HOME/mutt/synchrony.gpg"
ln -sf "$DOTFILES/mutt/muttrc" "$XDG_CONFIG_HOME/mutt/muttrc"
ln -sf "$DOTFILES/mutt/theme" "$XDG_CONFIG_HOME/mutt/theme"
ln -sf "$DOTFILES/mutt/sidebar" "$XDG_CONFIG_HOME/mutt/sidebar"
ln -sf "$DOTFILES/mutt/certificates" "$XDG_CONFIG_HOME/mutt/certificates"
