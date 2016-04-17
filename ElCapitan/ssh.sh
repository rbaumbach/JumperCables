#!/usr/bin/env bash

echo
echo "Setting up ssh keys..."

NEW_SSH_DIR="$(dirname "$0")/.ssh"
CURRENT_SSH_DIR="~/.ssh"
CURRENT_SSH_DIR_BAK="~/.ssh_bak"
HOME_DIR="~/"

if [ -d "$NEW_SSH_DIR" ]
then
    if [ -d "$CURRENT_SSH_DIR" ]
        echo
        echo "Found existing $CURRENT_SSH_DIR, renaming to $CURRENT_SSH_DIR_BAK"
        mv ${CURRENT_SSH_DIR} ${CURRENT_SSH_DIR_BAK}
        
        echo
        echo "Copying over $NEW_SSH_DIR to $CURRENT_SSH_DIR"
        cp -avR #{NEW_SSH_DIR} #{HOME_DIR} 
    then
    else
        echo
        echo "Starting proces to generate ssh keys"
        ssh-keygen -t rsa -b 4096 -C "baumbach@ryan.codes"
        eval "$(ssh-agent -s)"
        ssh-add $CURRENT_SSH_DIR/id_rsa
    fi
fi