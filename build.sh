#!/bin/sh

set -eu

cargo install \
  --config 'profile.release.lto = "thin"' \
  --config 'profile.release.strip = "symbols"' \
  --root "$PWD" \
  wasm-tools ${1+"$@"}

cargo install \
  --all-features \
  --config 'profile.release.lto = "thin"' \
  --config 'profile.release.strip = "symbols"' \
  --root "$PWD" \
  wasm-component-ld wasmi_cli wit-bindgen-cli wizer ${1+"$@"}

cargo install \
  --all-features \
  --root "$PWD" \
  wasmtime-cli ${1+"$@"}
