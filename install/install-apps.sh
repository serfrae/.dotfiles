#!/bin/sh

# Update keyring
sudo pacman -S archlinux-keyring

# Install packages
sudo pacman -S alacritty alsa-utils bluez bluez-utils brightnessctl cargo clang cmake docker eza fd fzf github-cli htop interception-tools interception-dual-function-keys jq libnotify npm nnn openssh python python-pip ripgrep rustup sd texlive-core tmux ttf-font-awesome ttf-jetbrains-mono ttf-nerd-fonts-symbols wget xdg-user-dirs zsh zsh-syntax-highlighting zathura zathura-pdf-mupdf zsh-autosuggestions

# Install Rust
rustup install nightly
rustup default nightly
rustup target add wasm32-unknown-unknown --toolchain nightly
cargo install wasm-pack
cargo install cargo-outdated

# Install ZPRS
"$DOTFILES/install/install-zprs.sh"

# Install yay
git clone "https://aur.archlinux.org/yay.git" "$XDG_DATA_HOME/yay"
cd "$XDG_DATA_HOME/yay"
makepkg -si

yay -S autojump-rs

# Install PIP packages
pip install --user --upgrade pynvim

# Install NPM Packages
npm install -g yarn
npm install -g typescript

# Change shell
chsh -s /usr/bin/zsh
chsh -s /bin/zsh

zsh
