#!/bin/bash

# Fail immediately if any errors occur

set -e

clear

INSTALLZ_SCRIPTS_DIR="$(dirname "$0")/installz"
${INSTALLZ_SCRIPTS_DIR}/setup.sh $1
