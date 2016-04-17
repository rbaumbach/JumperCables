#!/usr/bin/env bash

# Fail immediately if any errors occur

set -e

clear

EL_CAPITAN_SCRIPTS_DIR="$(dirname "$0")/ElCapitan"

if [ "$1" == "" ] || [ "$1" == "el-capitan" ]
then
    ${EL_CAPITAN_SCRIPTS_DIR}/setup.sh
else
    echo "Incorrect arguments"
fi
