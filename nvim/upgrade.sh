#!/usr/bin/env bash

set -e

system_type=$(uname -s)
# MacOS setup
if [ "$system_type" = "Darwin" ]; then
  brew install shellcheck
  brew install shfmt
  brew install llvm
  fd 'clangd$' /usr/local/ --exec ln -s '{}' "$HOME"/.local/bin | :

  curl -L https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-mac.gz | gunzip -f > "$HOME"/.local/bin/rust-analyzer && chmod +x "$HOME"/.local/bin/rust-analyzer

else # Ubuntu
  sudo apt  install -y\
    shellcheck \
    clang-tools \
    golang \
    clang-format \
    clangd\
    ;

  curl -L https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-linux.gz | gunzip -f > "$HOME"/.local/bin/rust-analyzer && chmod +x "$HOME"/.local/bin/rust-analyzer
fi

sudo npm install -g -f \
  pyright \
  lua-fmt \
  prettier \
  prettier-plugin-toml \
  markdownlint \
  diagnostic-languageserver \
  bash-language-server\
  typescript\
  typescript-language-server \
  dockerfile-language-server-nodejs \
  ;

pip3 install --upgrade \
  cmake-language-server \
  ;

GO111MODULE=on go get golang.org/x/tools/gopls@latest
