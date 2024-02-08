#!/bin/sh
git clone "https://github.com/serfrae/zprs.git" "$DOTFILES/zprs"
cargo build --manifest-path "$DOTFILES/zprs/Cargo.toml" --release
