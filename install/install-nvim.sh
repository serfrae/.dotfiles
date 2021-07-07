#!/bin/sh

if [ ! -d $VIMCONFIG ]; then
  mkdir $VIMCONFIG
  curl -fLo ~/.dotfiles/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

ln -sf "$DOTFILES/nvim/init.vim" "$VIMCONFIG/init.vim"
ln -sf "$DOTFILES/nvim/coc-settings.json" "$VIMCONFIG/coc-settings.json"

mkdir -p "$VIMCONFIG/plugged"

nvim +'CocInstall -sync coc-rust coc-tsserver coc-pyright coc-clangd coc-html coc-css coc-json' +qall
