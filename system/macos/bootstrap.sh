#!/usr/bin/env bash
# https://github.com/crispgm/dotfiles/blob/master/bootstrap

set -e

echo "Install Homebrew"
if test ! $(which brew); then
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Setup hostname"
sudo scutil --set HostName mac

echo "Install with Brew Bundle"
set +e
brew cleanup
brew uninstall openssl
brew bundle
set -e
