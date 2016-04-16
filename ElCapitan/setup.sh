#!/usr/bin/env bash

# Fail immediately if any errors occur

set -e

echo
echo "Giving El Capitan a jump..."

MY_DIR="$(dirname "$0")"

${MY_DIR}/xcode-license.sh
${MY_DIR}/homebrew.sh
${MY_DIR}/git.sh
${MY_DIR}/brew-casks.sh
