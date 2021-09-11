#!/bin/sh
sudo mkdir /etc/interception
sudo ln -sf $DOTFILES/dual-function-keys/udevmon.yaml /etc/interception/udevmon.yaml
sudo systemctl enable udevmon
sudo systemctl start udevmon
