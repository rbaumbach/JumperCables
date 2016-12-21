#!/bin/bash

# Fail immediately if any errors occur

set -e

echo

MY_DIR="$(dirname "$0")"
CONFIG_OS_DIR=${MY_DIR}/../sierra

if [ "$1" == "" ] || [ "$1" == "sierra" ]
then
    echo "Giving Sierra a jump..."
elif [ "$1" == "el-capitan" ]
then
    echo "Giving El Capitan a jump..."
    CONFIG_OS_DIR=${MY_DIR}/../${1}
else
    echo "Incorrect arguments"
    exit 1
fi

${MY_DIR}/xcode.sh
echo | ${MY_DIR}/homebrew.sh

${MY_DIR}/git.sh
${MY_DIR}/gpg.sh
${MY_DIR}/ruby.sh
${MY_DIR}/java.sh
${MY_DIR}/node.sh
${MY_DIR}/mongodb.sh
${MY_DIR}/misc-dev-tools.sh
${MY_DIR}/ssh.sh
${MY_DIR}/brews.sh
${MY_DIR}/brew-casks.sh
${MY_DIR}/atom.sh
${MY_DIR}/mac-app-store.sh

# Handling configurations separately since they can vary depending
# on the OS version

${CONFIG_OS_DIR}/osx-configs.sh

${MY_DIR}/the-end.sh
