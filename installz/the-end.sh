#!/usr/bin/env bash

MY_DIR="$(dirname "$0")"
JUNK_DIR=${MY_DIR}/../junk

# Delete junk directory if it exists

if [ -d $JUNK_DIR ]
then
  rm -rf $JUNK_DIR
fi

echo
echo "Restart or close the Terminal now to complete the installation"

echo
echo "FIN!"
