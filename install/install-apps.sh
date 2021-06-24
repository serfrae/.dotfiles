#!/bin/sh

# Update keyring
sudo pacman -S archlinux-keyring

# Install packages
sudo pacman -S alacritty alsa-utils betterlockscreen bluez bluez-utils bspwm dunst cargo exa feh fzf libnotify maim neovim openssh picom python pulseaudio ripgrep rofi rustup sxhkd tmux ttf-jetbrains-mono ttf-nerd-fonts-symbols unzip wget xcape xclip xdg-user-dirs xorg xorg-xinit xsel zsh zsh-syntax-highlighting zsh-autosuggestions

# Install Rust
rustup install nightly
rustup default nightly
rustup +nightly component add rust-analyzer-preview

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
chsh -s /usr/bin/zsh
chsh -s /bin/zsh

# Install AUR packages
yay -S polybar brave-nightly-bin
