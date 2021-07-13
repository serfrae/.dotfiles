#!/bin/sh

git clone "git@github.com:universal-ctags/ctags.git" "$XDG_DATA_HOME/ctags" \\
cd "$XDG_DATA_HOME/ctags"
$XDG_DATA_HOME/ctags/autogen.sh \\
$XDG_DATA_HOME/configure \\
make \\
sudo make install \\
mkdir -p "$XDG_CONFIG_HOME/ctags"
ln -sf "$DOTFILES/ctags/md.ctags" "$XDG_CONFIG_HOME/ctags/md.ctags"
