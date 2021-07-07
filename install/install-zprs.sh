#!/bin/sh
git clone "https://github.com/a7raser/zprs.git" "$DOTFILES/zprs"
cargo build --manifest-path "$DOTFILES/zprs/Cargo.toml" --release
