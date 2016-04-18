#!/usr/bin/env bash

echo
echo "Installing gpg2..."
brew install gpg2

echo
echo "Staring gpg-agent"
gpg-agent --daemon --use-standard-socket
echo 'use-standard-socket' >> ~/.gnupg/gpg-agent.conf

echo '# gpg2' >> ~/.bash_profile
echo '' >> ~/.bash_profile
echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile
echo '' >> ~/.bash_profile

NEW_GPG_DIR="$(dirname "$0")/.gnupg"
CURRENT_GPG_DIR="~/.gnupg"
CURRENT_GPG_DIR_BAK="~/.gnupg_bak"
HOME_DIR="~/"

if [ -d "$NEW_GPG_DIR" ]
then
    if [ -d "$CURRENT_GPG_DIR" ]
    then
        echo
        echo "Found existing $CURRENT_GPG_DIR, renaming to $CURRENT_GPG_DIR_BAK"
        mv ${CURRENT_GPG_DIR} ${CURRENT_GPG_DIR_BAK}
    fi
    
    echo
    echo "Copying over $NEW_GPG_DIR to $CURRENT_GPG_DIR"
    cp -avR #{NEW_GPG_DIR} #{HOME_DIR}
    
    echo
    echo "Staring gpg-agent"
    gpg-agent --daemon    
fi