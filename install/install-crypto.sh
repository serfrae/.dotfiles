#!/bin/sh

git clone "https://github.com/a7raser/polybar-crypto-rs.git" "$DOTFILES/polybar"
cargo build --manifest-path "$DOTFILES/polybar/polybar-crypto-rs/Cargo.toml" --release
