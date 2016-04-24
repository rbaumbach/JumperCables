#!/usr/bin/env bash

echo
echo "Installing gpg2..."
brew install gpg2

echo '# gpg2' >> ~/.bash_profile
echo '' >> ~/.bash_profile
echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile
echo '' >> ~/.bash_profile
source ~/.bash_profile

echo
echo "Staring gpg-agent"
gpg-agent --daemon --use-standard-socket
echo 'use-standard-socket' >> ~/.gnupg/gpg-agent.conf

echo
echo "Generating gpg key"
gpg2 --gen-key

echo
echo "Update git global config to use gpg"
git config --global gpg.program gpg2
git config --global commit.gpgsign true