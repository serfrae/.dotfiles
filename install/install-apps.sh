#!/bin/sh

# Install packages
pacman -S alacritty alsa-utils bluez bluz-utils bspwm dunst cargo exa feh fzf maim neovim openssh picom python pulseaudio ripgrep rofi rustup sxhkd tmux ttf-jetbrains-mono ttf-nerd-fonts-symbols xcape xclip xdg-user-dirs xorg xorg-xinit xsel zsh zsh-syntax-highlighting zsh-autosuggestions

# Install Rust
rustup nightly default
rustup +nightly component add rust-analyzer

# Install yay
mkdir -p $XDG_CONFIG_HOME/aur
cd $XDG_CONFIG_HOME/aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install ZPRS
cd $DOTFILES
git clone https://github.com/a7raser/zprs.git
cd zprs
cargo build --release

# Change shell
chsh /bin/zsh

# Install AUR packages
yay -S polybar brave-nightly-bin
