#!/bin/bash

# Fail immediately if any errors occur

set -e

echo
echo "Giving El Capitan a jump..."

MY_DIR="$(dirname "$0")"

${MY_DIR}/xcode.sh
echo | ${MY_DIR}/homebrew.sh
${MY_DIR}/git.sh
${MY_DIR}/gpg.sh
${MY_DIR}/ruby.sh
${MY_DIR}/java.sh
${MY_DIR}/node.sh
${MY_DIR}/mongodb.sh
${MY_DIR}/heroku.sh
${MY_DIR}/ssh.sh
${MY_DIR}/brew-casks.sh
${MY_DIR}/mac-app-store.sh

if [ "$1" == "" ] || [ "$1" == "sierra" ]
then
    ${MY_DIR}/../osx-configs.sh
elif [ "$1" == "el-capitan" ]
then
    ${MY_DIR}/../osx-configs.sh
else
    echo "Incorrect arguments"
fi

${MY_DIR}/the-end.sh
