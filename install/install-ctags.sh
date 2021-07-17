#!/bin/sh

git clone "git@github.com:universal-ctags/ctags.git" "$XDG_DATA_HOME/ctags" \\
cd "$XDG_DATA_HOME/ctags"
$XDG_DATA_HOME/ctags/autogen.sh \\
$XDG_DATA_HOME/configure --prefix=$HOME \\
make && make install \\
mkdir -p "$NOTES_DIR/.ctags.d"
ln -sf "$DOTFILES/ctags/md.ctags" "$NOTES_DIR/.ctags.d/md.ctags"
