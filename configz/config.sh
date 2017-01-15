#!/usr/bin/env bash

# ENVs that will be used throughout Jumper Cables
# Make changes for your machine

# homebrew.sh

export HOMEBREW_GITHUB_API_TOKEN="<Your github api token for Homebrew>"
export HOMEBREW_NO_ANALYTICS=1

# git.sh

export GIT_USER_NAME="Ryan"
export GIT_USER_EMAIL="github@ryan.codes"

# gpg.sh

# See https://www.gnupg.org/documentation/manuals/gnupg/Unattended-GPG-key-generation.html
# for all the file constraints

#TODO:

# export GPG_KEY_TYPE="default"
# export GPG__KEY_USER_NAME="Ryan Baumbach"
# export GPG_KEY_COMMENT="GPG and what not"
# export GPG_KEY_EMAIL="github@ryan.codes"
# export GPG_KEY_EXPIRY_DATE="1y"
# export GPG_KEY_PASSPHRASE="<Enter your passphrase here>"

# ssh.sh

export SSH_KEY_EMAIL="github@ryan.codes"
export SSH_KEY_NAME=${HOME}/.ssh/id_rsa
export SSH_KEY_PASSPHRASE="<You can make this whatever you want>"

# bash_profile.sh

export FASTLANE_OPT_OUT_USAGE=1
