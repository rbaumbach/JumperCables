#!/usr/bin/env bash

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

echo
echo "Installing ruby version 2.1.9"
rbenv install 2.1.9 --skip-existing

echo
echo "Installing ruby version 2.2.4"
rbenv install 2.2.4 --skip-existing

echo
echo "Installing ruby version 2.3.0"
rbenv install 2.3.0 --skip-existing

echo
echo "Setting global version of ruby to 2.3.0"
rbenv global 2.3.0

echo
echo "Installing bundler...."
gem install bundler
rbenv rehash
