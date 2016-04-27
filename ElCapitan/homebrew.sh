#!/bin/bash

if hash brew 2>/dev/null; then
    echo
    echo "Homebrew is already installed!"
else
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
    echo
    echo "Ensuring your Homebrew directory is writable..."
    chown -R $(whoami) /usr/local/bin
fi

echo
echo "Ensuring you have the latest Homebrew..."
brew update

echo
echo "Upgrading existing brews..."
brew upgrade

echo 
echo "Ensuring you have a healthy Homebrew environment..."
brew doctor

echo
echo "Cleaning up your Homebrew installation..."
brew cleanup

