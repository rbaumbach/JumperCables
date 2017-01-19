#!/usr/bin/env bash

MY_DIR="$(dirname "$0")"
JUNK_DIR=${MY_DIR}/../junk

echo
echo "Installing latest bash..."
brew install bash

#TODO: These require sudo, figure out how to handle this

# Get password from encrypted file

I_GOTZ_CRED=$(openssl rsautl -decrypt -inkey $JUNK_DIR/junk_rsa -in $JUNK_DIR/.mi.6)

echo
echo "Adding /usr/local/bin/bash to /etc/shells"
echo $I_GOTZ_CRED | sudo -S sh -c 'echo "/usr/local/bin/bash" >> /etc/shells'

echo
echo "Changing default shell to latest bash..."
$I_GOTZ_CRED | sudo -S chsh -s /usr/local/bin/bash

# Immediately unset the I_GOTZ_CRED variable

unset I_GOTZ_CRED
