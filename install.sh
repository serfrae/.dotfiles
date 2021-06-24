#!/bin/sh

source ./zsh/zshenv

function dot_install() {
  echo -e "Installing ${1} config"
  . $DOTFILES/install/install-${1}.sh
}

dot_install dirs
dot_install apps
dot_install zsh
dot_install X11
dot_install bspwm
dot_install sxhkd
dot_install picom
dot_install alacritty
dot_install polybar
dot_install rofi
dot_install nvim
dot_install tmux
dot_install dunst
dot_install scripts
