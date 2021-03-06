#!/usr/bin/env bash

echo
echo "Installing Ruby"

echo
echo "Installing rbenv to handle ruby versioning"
brew install rbenv

echo
echo "Adding rbenv initialization to .bash_profile..."
echo '# rbenv' >> ~/.bash_profile
echo '' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo '' >> ~/.bash_profile
source ~/.bash_profile

echo
echo "Installing ruby version 2.2.5"
rbenv install 2.2.5 --skip-existing

echo
echo "Installing ruby version 2.3.3"
rbenv install 2.3.3 --skip-existing

echo
echo "Setting global version of ruby to 2.3.3"
rbenv global 2.3.3
rbenv rehash

echo
echo "Installing bundler...."
gem install bundler
rbenv rehash

echo
echo "Setting up bundler global config"
bundle config --global gem.coc false
bundle config --global gem.mit false
