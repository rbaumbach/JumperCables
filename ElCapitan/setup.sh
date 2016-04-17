#!/usr/bin/env bash

# Fail immediately if any errors occur

set -e

echo
echo "Giving El Capitan a jump..."

MY_DIR="$(dirname "$0")"

${MY_DIR}/xcode-license.sh
${MY_DIR}/homebrew.sh
${MY_DIR}/git.sh
${MY_DIR}/gpg.sh
${MY_DIR}/ruby.sh
${MY_DIR}/java.sh
${MY_DIR}/node.sh
${MY_DIR}/mongodb.sh
${MY_DIR}/ssh.sh
${MY_DIR}/brew-casks.sh
${MY_DIR}/osx-configs.sh
