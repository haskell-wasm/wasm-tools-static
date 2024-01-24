#!/bin/sh

set -eu

cargo install \
  --all-features \
  --config 'profile.release.lto = "thin"' \
  --config 'profile.release.strip = "symbols"' \
  --root "$PWD" \
  wasm-tools wizer ${1+"$@"}

cargo install \
  --all-features \
  --config 'profile.release.lto = "thin"' \
  --root "$PWD" \
  --git https://github.com/bytecodealliance/wasmtime.git \
  --branch release-17.0.0 \
  wasmtime-cli ${1+"$@"}
