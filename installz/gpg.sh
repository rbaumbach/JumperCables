#!/usr/bin/env bash

CONFIGZ_DIR="$(dirname "$0")"/../configz

echo
echo "Installing GPG"

echo
echo "Installing gpg2.1..."
brew install gnupg21

echo "Installing pinentry-mac..."
brew install pinentry-mac

echo
echo "Checking if .gnupg directory exists in filez directory..."
if [ -d ${CONFIGZ_DIR}/.gnupg ]
then
    echo
    echo ".ssh directory exists, copying it to ~/"
    cp -r ${CONFIGZ_DIR}/.gnupg ~/
else
  echo
  echo ".gnupg directory not found, will generate default gpg key"

  # Delete gpg.txt if it already exists

  if [ -f ${CONFIGZ_DIR}/gpg.txt ]
  then
    echo "Previous gpg.txt file found, deleting it..."
    rm ${CONFIGZ_DIR}/gpg.txt
  fi

  # See https://www.gnupg.org/documentation/manuals/gnupg/Unattended-GPG-key-generation.html
  # for all the file constraints

  echo
  echo "Generating unattended GPG installation file"
  echo "Key-Type: RSA" >> ${CONFIGZ_DIR}/gpg.txt
  echo "Key-Length: 4096" >> ${CONFIGZ_DIR}/gpg.txt
  echo "Name-Real: $GPG_KEY_USER_NAME" >> ${CONFIGZ_DIR}/gpg.txt
  echo "Name-Comment: $GPG_KEY_COMMENT" >> ${CONFIGZ_DIR}/gpg.txt
  echo "Name-Email: $GPG_KEY_EMAIL" >> ${CONFIGZ_DIR}/gpg.txt
  echo "Expire-Date: $GPG_KEY_EXPIRY_DATE" >> ${CONFIGZ_DIR}/gpg.txt
  echo "Passphrase: $GPG_KEY_PASSPHRASE" >> ${CONFIGZ_DIR}/gpg.txt
  echo "%commit" >> ${CONFIGZ_DIR}/gpg.txt

  echo
  echo "Generating GPG key..."
  gpg2 --verbose --batch --gen-key ${CONFIGZ_DIR}/gpg.txt
fi

if [ ! -f ${CONFIGZ_DIR}/.gnupg/gpg-agent.conf ]
then
  echo
  echo "Hook up pinentry-mac to gpg-agent"
  echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
fi

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
