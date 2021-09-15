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
rm -rf $HOME/*bash*
chmod -w $HOME

dot_install alacritty
dot_install ctags
dot_install dfk
dot_install git
way_install mako
dot_install mutt
dot_install npm
dot_install nvim
dot_install scripts
way_install sway
dot_install tmux
dot_install urlview
dot_install yarn
way_install waybar
dot_install zathura

dot_install apps
dot_install way-apps
