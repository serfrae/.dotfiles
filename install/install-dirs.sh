#!/bin/sh

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.cache"
mkdir -p "$HOME/.ssh"

mkdir -p "$HOME/bin"
mkdir -p "$HOME/downloads"
mkdir -p "$HOME/docs"
mkdir -p "$HOME/projects"

mkdir -p "$HOME/docs/notes"
mkdir -p "$HOME/docs/todo"

mkdir -p "$HOME/media/audio"
mkdir -p "$HOME/media/images/pictures"
mkdir -p "$HOME/media/images/screenshots"
mkdir -p "$HOME/media/images/wallpapers"
mkdir -p "$HOME/media/video"

mkdir -p "$HOME/misc/.keys"

ln -sf "$DOTFILES/dirs/user-dirs.dirs" "$XDG_CONFIG_HOME/user-dirs.dirs"
