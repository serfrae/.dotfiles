#!/bin/sh
git clone "git@github.com:a7raser/zprs.git" "$DOTFILES/zprs"
cargo build --manifest-path "$DOTFILES/zprs" --release
