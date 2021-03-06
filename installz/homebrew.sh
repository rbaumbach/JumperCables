#!/usr/bin/env bash

if hash brew 2>/dev/null; then
    echo
    echo "Homebrew is already installed!"
else
    echo
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

echo
echo "Adding Homebrew versions"
brew tap homebrew/versions

echo
echo "Disabling Homebrew Tracking"
echo "# Homebrew" >> ~/.bash_profile
echo "" >> ~/.bash_profile
echo "export HOMEBREW_NO_ANALYTICS=$HOMEBREW_NO_ANALYTICS" >> ~/.bash_profile
echo "" >> ~/.bash_profile

echo
echo "Adding Homebrew Github API token scaffolding."
echo "# export HOMEBREW_GITHUB_API_TOKEN=$HOMEBREW_GITHUB_API_TOKEN" >> ~/.bash_profile
echo "" >> ~/.bash_profile
