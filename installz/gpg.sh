#!/usr/bin/env bash

echo
echo "Installing GPG"

FILEZ_DIR="$(dirname "$0")"/../filez

echo
echo "Adding Homebrew versions for gpg 2.1x"
brew tap homebrew/versions

echo
echo "Installing gpg2.1..."
brew install gnupg21

echo "Installing pinentry-mac..."
brew install pinentry-mac

echo
echo "Checking if .gnupg directory exists in filez directory..."
if [ -d ${FILEZ_DIR}/.gnupg ]
then
    echo
    echo ".ssh directory exists, copying it to ~/"
    cp -r ${FILEZ_DIR}/.gnupg ~/
else
  echo
  echo ".gnupg directory not found, will generate default gpg key"
  gpg2 --verbose --batch --gen-key ${CONFIGZ_DIR}/gpg.txt
fi

echo
echo "Hook up pinentry-mac to gpg-agent"
echo 'pinentry-program /usr/local/bin/pinentry-mac' >> ~/.gnupg/gpg-agent.conf

echo
echo "Kill gpg-agent"
gpgconf --kill gpg-agent

echo
echo "Listing keys..."
gpg2 --list-keys

echo
echo "Update git global config to use generated gpg public key"
public_key=$(gpg2 --list-keys | sed 's: ::g' | sed -n 4p)
git config --global user.signingkey $public_key

echo
echo "Update git global config to use gpg2 and sign commits automatically"
git config --global gpg.program gpg2
git config --global commit.gpgsign true
