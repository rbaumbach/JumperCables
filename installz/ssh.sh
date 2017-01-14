#!/usr/bin/env bash

echo
echo "Setting up ssh keys..."

FILEZ_DIR="$(dirname "$0")"/../filez

echo
echo "Checking if .ssh directory exists in filez directory..."
if [ -d ${FILEZ_DIR}/.ssh ]
then
    echo
    echo ".ssh directory exists, copying it to ~/"
    cp -r ${FILEZ_DIR}/.ssh ~/
else
  echo
  echo ".ssh directory not found, will generate default ssh key"

  # eval is needed or else the ssh passphrase includes the double quotes
  # in the passphrase

  echo
  echo "Generating default ssh key"
  SSH_KEYGEN_COMMAND="ssh-keygen -t rsa -b 4096 -C $SSH_KEY_EMAIL -N "\"$SSH_KEY_PASSPHRASE"\" -f $SSH_KEY_NAME"
  eval $SSH_KEYGEN_COMMAND
fi

if [ ! -f ${FILEZ_DIR}/config ]
then
  echo
  echo "ssh config file doesn't exist, creating it..."
  echo "Host *" >> ~/.ssh/config
  echo "  IdentitiesOnly yes" >> ~/.ssh/config
  echo "  VisualHostKey yes" >> ~/.ssh/config
fi

echo
echo "Starting ssh-agent..."
eval "$(ssh-agent -s)"
