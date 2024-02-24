#!/bin/sh

# Fucks sake seperate out the dot install from the x install - same for wayland
source ./zsh/zshenv

function dot_install() {
  echo -e "Installing ${1} config"
  $DOTFILES/install/install-${1}.sh
}

function x_install() {
  echo -e  "Installing ${1} config"
  $DOTFILES/install/x/install-${1}.sh
}

#dot_install dirs
#dot_install zsh
chmod -w $HOME

x_install bspwm
x_install dunst
x_install picom
x_install polybar
x_install rofi
x_install sxhkd
x_install X11

x_install x-apps
