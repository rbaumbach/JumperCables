#!/usr/bin/env bash

MY_DIR="$(dirname "$0")"
JUNK_DIR=${MY_DIR}/../junk

# Get password from encrypted file

I_GOTZ_CRED=$(openssl rsautl -decrypt -inkey $JUNK_DIR/junk_rsa -in $JUNK_DIR/.mi.6)

echo
echo "Accepting Xcode Software License Agreement..."
echo $I_GOTZ_CRED | sudo -S xcodebuild -license accept

# Immediately unset the I_GOTZ_CRED variable

unset I_GOTZ_CRED
