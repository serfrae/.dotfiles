#!/bin/sh

if [ ! -d $VIMCONFIG ]; then
  mkdir $VIMCONFIG
  curl -fLo ~/.dotfiles/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p "$VIMCONFIG/plugged"
mkdir -p "$VIMCONFIG/ftplugin"

ln -sf "$DOTFILES/nvim/init.vim" "$VIMCONFIG/init.vim"
ln -sf "$DOTFILES/nvim/coc-settings.json" "$VIMCONFIG/coc-settings.json"
ln -sf "$DOTFILES/nvim/ftplugin/qf.vim" "$VIMCONFIG/ftplugin/qf.vim"
ln -sf "$DOTFILES/nvim/ftplugin/fzf.vim" "$VIMCONFIG/ftplugin/fzf.vim"

nvim +'CocInstall -sync coc-rust coc-tsserver coc-pyright coc-clangd coc-html coc-css coc-json' +qall
