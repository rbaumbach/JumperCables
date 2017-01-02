#!/bin/bash

echo
echo "Installing gpg2.1..."
brew install gnupg21

echo "Installing pinentry-mac..."
brew install pinentry-mac

echo
echo "Generating gpg key"
gpg2 --gen-key

echo
echo "Hook up pinentry-mac to gpg-agent"
echo 'pinentry-program /usr/local/bin/pinentry-mac' >> ~/.gnupg/gpg-agent.conf

echo
echo "Kill gpg-agent"
echo "When you attempt to use gpg2 in the future, gpg2 will restart it when it's needed"
gpgconf --kill gpg-agent

echo
echo "Update git global config to use generated gpg public key"
public_key=${gpg2 --list-keys | sed 's: ::g' | sed -n 4p}
git config --global user.signingkey ${public_key}

echo
echo "Update git global config to use gpg"
git config --global gpg.program gpg2
git config --global commit.gpgsign true
