#!/bin/bash

echo
echo "Installing Ruby"

echo
echo "Installing rbenv to handle ruby versioning"
brew install rbenv
eval "$(rbenv init -)"

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
echo "Installing ruby version 2.3.0"
rbenv install 2.3.0 --skip-existing

echo
echo "Installing ruby version 2.3.1"
rbenv install 2.3.1 --skip-existing

echo
echo "Setting global version of ruby to 2.3.1"
rbenv global 2.3.1
rbenv rehash

echo
echo "Installing bundler...."
gem install bundler
