#!/bin/sh

set -eu

cargo install \
  --all-features \
  --config 'profile.release.lto = "thin"' \
  --config 'profile.release.strip = "symbols"' \
  --root "$PWD" \
  --git https://github.com/haskell-wasm/wizer.git \
  wizer ${1+"$@"}

cargo install \
  --all-features \
  --config 'profile.release.lto = "thin"' \
  --config 'profile.release.strip = "symbols"' \
  --root "$PWD" \
  wasm-component-ld wasm-tools wit-bindgen-cli ${1+"$@"}

cargo install \
  --all-features \
  --config 'profile.release.lto = "thin"' \
  --root "$PWD" \
  wasmtime-cli ${1+"$@"}
