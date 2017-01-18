#!/usr/bin/env bash

# $1 optional input for OS version string, ex: "sierra"

# Fail immediately if any errors occur

set -e

MY_DIR="$(dirname "$0")"
CONFIG_OS_DIR=${MY_DIR}/../sierra
JUNK_DIR=${MY_DIR}/../junk

if [ "$1" == "" ] || [ "$1" == "sierra" ]
then
    echo
    echo "Giving Sierra a jump..."
elif [ "$1" == "el-capitan" ]
then
    echo
    echo "Giving El Capitan a jump..."
    CONFIG_OS_DIR=${MY_DIR}/../ElCapitan
else
    echo
    echo "Incorrect arguments"
    exit 1
fi

echo
echo "Loading up config ENVs"
source ${MY_DIR}/../configz/config.sh

echo
echo "... Starting ..."

# Delete junk directory if it exists

if [ -d $JUNK_DIR ]
then
  rm -rf $JUNK_DIR
fi

# Generate new junk directory

mkdir $JUNK_DIR

# Generating junk ssh key to encrypt password to use throughout the scripts

ssh-keygen -t rsa -b 4096 -C junk@junk.com -N "" -f $JUNK_DIR/junk_rsa >/dev/null
ssh-keygen -f $JUNK_DIR/junk_rsa.pub -e -m PKCS8 > $JUNK_DIR/junk_rsa.pub.pem

echo
echo "Enter your password so we can use it throughout Jumper Cables..."
read -sp Password: RAW_PASSWORD
echo

# Write to .mi file, and immediately unset variable

echo "$RAW_PASSWORD" > $JUNK_DIR/.mi
unset $RAW_PASSWORD

# Now let's encrypt that file

openssl rsautl -encrypt -pubin -inkey $JUNK_DIR/junk_rsa.pub.pem -ssl -in $JUNK_DIR/.mi -out $JUNK_DIR/.mi.6

# Finally, delete the plain text password file

rm $JUNK_DIR/.mi

echo
echo "Running our suite of scripts..."

${MY_DIR}/xcode.sh
echo | ${MY_DIR}/homebrew.sh

${MY_DIR}/git.sh
${MY_DIR}/gpg.sh
${MY_DIR}/ruby.sh
${MY_DIR}/node.sh
${MY_DIR}/mongodb.sh
${MY_DIR}/misc-dev-tools.sh
${MY_DIR}/ssh.sh
${MY_DIR}/brews.sh
${MY_DIR}/brew-casks.sh
${MY_DIR}/atom.sh
${MY_DIR}/bash_profile.sh
${MY_DIR}/bash.sh

if [ "$INSTALL_JAVA" = true ]
then
  ${MY_DIR}/java.sh
fi

if [ "$INSTALL_MAC_APPS" = true ]
then
  ${MY_DIR}/mac-app-store.sh
fi

# Handling configurations separately since they can vary depending
# on the OS version

${CONFIG_OS_DIR}/osx-configs.sh
${MY_DIR}/the-end.sh
