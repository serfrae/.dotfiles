#!/bin/sh
mkdir -p "$XDG_CONFIG_HOME/rofi";
ln -sf "$DOTFILES/x/rofi/config.rasi" "$XDG_CONFIG_HOME/rofi/config.rasi"
ln -sf "$DOTFILES/x/rofi/colors-rofi.rasi" "$XDG_CONFIG_HOME/rofi/colors-rofi.rasi"
