#!/bin/sh

# Update keyring
sudo pacman -S archlinux-keyring

# Install packages
sudo pacman -S alacritty alsa-utils betterlockscreen bluez bluez-utils bspwm cargo clang dunst exa feh fzf libnotify maim neovim npm openssh picom python pulseaudio ripgrep rofi rustup rust-analyzer sxhkd tmux ttf-font-awesome ttf-jetbrains-mono ttf-nerd-fonts-symbols unzip wget xcape xclip xdg-user-dirs xorg xorg-xinit xsel zsh zsh-syntax-highlighting zsh-autosuggestions

# Install Rust
rustup install nightly
rustup default nightly
rustup target add wasm32-unknown-unknown --toolchain nightly

# Install NPM Packages
npm install -g yarn
npm install -g typescript

# Install yay
mkdir -p $XDG_CONFIG_HOME/aur
cd $XDG_CONFIG_HOME/aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install ZPRS
"$DOTFILES/install/install-zprs.sh"

# Change shell
chsh -s /usr/bin/zsh
chsh -s /bin/zsh

# Install AUR packages
yay -S polybar brave-nightly-bin
