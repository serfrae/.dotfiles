#!/bin/sh

source ./zsh/zshenv

function dot_install() {
  echo -e "Installing ${1} config"
  $DOTFILES/install/install-${1}.sh
}

dot_install dirs
dot_install zsh
chmod -w $HOME

dot_install alacritty
dot_install bspwm
dot_install ctags
dot_install dunst
dot_install git
dot_install gtk
dot_install npm
dot_install nvim
dot_install picom
dot_install polybar
dot_install rofi
dot_install scripts
dot_install sxhkd
dot_install tmux
dot_install X11
dot_install yarn

dot_install apps
