#!/bin/sh

mkdir -p "$XDG_CONFIG_HOME/git"
touch "$XDG_CONFIG_HOME/git/config"

echo "Git Username:"
read USER
echo "Git Email:"
read EMAIL

git config --global user.name "$USER"
echo "Git username set as $USER"

git config --global user.email "$EMAIL"
echo "Git email set as $EMAIL"

git config --global init.defaultBranch main
echo "Default branch name is 'main'"
