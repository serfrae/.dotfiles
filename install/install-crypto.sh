#!/bin/sh

git clone "https://github.com/a7raser/polybar-crypto-rs.git" "$DOTFILES/polybar/polybar-crypto-rs"
cargo build --manifest-path "$DOTFILES/polybar/polybar-crypto-rs/Cargo.toml" --release
