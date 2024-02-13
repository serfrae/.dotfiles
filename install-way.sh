#!/bin/sh

source ./zsh/zshenv

function dot_install() {
  echo -e "Installing ${1} config"
  $DOTFILES/install/install-${1}.sh
}

function way_install() {
  echo -e "Installing ${1} config"
  $DOTFILES/install/way/install-${1}.sh
}

dot_install dirs
dot_install zsh
chmod -w $HOME

way_install mako
way_install sway
way_install waybar

dot_install apps
way_install way-apps
rm $HOME/.bash*
