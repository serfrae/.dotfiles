#!/bin/sh

# Install packages
sudo pacman -S bspwm rofi sxhkd xclip xorg xorg-xinit xsel 

# Install feh
git clone "git@github.com:a7rs/feh.git" "$XDG_DATA_HOME/feh"
cd "$XDG_DATA_HOME/feh"
make
sudo make install

# Install AUR packages
yay -S polybar betterlockscreen slack-desktop telegram-desktop

# Install crypto ticker
"$DOTFILES/install/install-crypto.sh"
