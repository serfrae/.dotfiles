#!/bin/sh

# Update keyring
sudo pacman -S archlinux-keyring

# Install packages
sudo pacman -S alacritty alsa-utils bluez bluez-utils bspwm cargo clang cmake dunst exa fd fzf
github-cli libnotify maim mutt neovim npm openssh picom python python-pip pulseaudio qutebrowser
ripgrep rofi rustup rust-analyzer sxhkd the_silver_searcher texlive-core tmux ttf-font-awesome ttf-jetbrains-mono ttf-nerd-fonts-symbols unzip wget xcape xclip xdg-user-dirs xorg xorg-xinit xsel zip zsh zsh-syntax-highlighting zsh-autosuggestions

# Install Rust
rustup install nightly
rustup default nightly
rustup target add wasm32-unknown-unknown --toolchain nightly
cargo install wasm-pack
cargo install cargo-outdated

# Install ZPRS
"$DOTFILES/install/install-zprs.sh"

# Change shell
chsh -s /usr/bin/zsh
chsh -s /bin/zsh

zsh

# Install feh
git clone "git@github.com:a7rs/feh.git" "$XDG_DATA_HOME/feh"
cd "$XDG_DATA_HOME/feh"
make
sudo make install

# Install yay
git clone "https://aur.archlinux.org/yay.git" "$XDG_DATA_HOME/yay"
cd yay
makepkg -si

# Install AUR packages
yay -S brave-nightly-bin polybar betterlockscreen autojump-rs urlview

# Install crypto ticker
"$DOTFILES/install/install-crypto.sh"

# Install PIP packages
pip install --user --upgrade pynvim

# Install NPM Packages
npm install -g yarn
npm install -g typescript

