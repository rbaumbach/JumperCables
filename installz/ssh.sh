#!/bin/bash

echo
echo "Setting up ssh keys..."

SSH_EMAIL="baumbach@ryan.codes"
DEFAULT_KEY_FILE=${HOME}/.ssh/id_rsa
LOCAL_USER_SSH_DIR=${HOME}/.ssh
LOCAL_USER_SSH_DIR_BAK=${HOME}/.ssh_bak

echo
echo "Generating default ssh key"
ssh-keygen -t rsa -b 4096 -C $SSH_EMAIL -f $DEFAULT_KEY_FILE

echo
echo "Starting ssh-agent..."
eval "$(ssh-agent -s)"

echo
echo "Adding $DEFAULT_KEY_FILE to ssh-agent"
ssh-add $DEFAULT_KEY_FILE
