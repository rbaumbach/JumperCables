#!/usr/bin/env bash

echo
echo "Installing gpg2..."
brew cask install gpg2

echo 'use-standard-socket' >> ~/.gnupg/gpg-agent.conf

ececho '# gpg2' >> ~/.bash_profile
echo '' >> ~/.bash_profile
echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile
gpg-agent --daemon --use-standard-socket