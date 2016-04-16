#!/usr/bin/env bash

# Fail immediately if any errors occur

set -e

MY_DIR="$(dirname "$0")"

echo
echo "Giving El Capitan a jump..."

${MY_DIR}/xcode-license.sh
