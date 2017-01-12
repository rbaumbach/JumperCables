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

  echo
  echo "Generating default ssh key"
  ssh-keygen -t rsa -b 4096 -C $SSH_KEY_EMAIL -f $SSH_KEY_FILE
fi

# echo
# echo "Starting ssh-agent..."
# eval "$(ssh-agent -s)"
#
# echo
# echo "Adding $DEFAULT_KEY_FILE to ssh-agent"
# ssh-add $DEFAULT_KEY_FILE
