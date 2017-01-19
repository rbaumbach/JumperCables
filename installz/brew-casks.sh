#!/usr/bin/env bash

MY_DIR="$(dirname "$0")"
JUNK_DIR=${MY_DIR}/../junk

# Note the manual creation of the Caskroom is needed so the first installation
# of a cask doesn't prompt a user password

echo
echo "Creating /usr/local/Caskroom with proper permissions"

# Get password from encrypted file

I_GOTZ_CRED=$(openssl rsautl -decrypt -inkey $JUNK_DIR/junk_rsa -in $JUNK_DIR/.mi.6)

# These permissions are based on a bare bones macOS Sierra install and installing
# a brew cask with Homebrew installed on 01/18/2016.

$I_GOTZ_CRED | sudo -S mkdir /usr/local/Caskroom
$I_GOTZ_CRED | sudo -S chmod 755 /usr/local/Caskroom
$I_GOTZ_CRED | sudo -S chown $(whoami) /usr/local/Caskroom
$I_GOTZ_CRED | sudo -S chgrp admin /usr/local/Caskroom

# Immediately unset the I_GOTZ_CRED variable

unset I_GOTZ_CRED

echo
echo "Installing brew casks"

brew cask install alfred
brew cask install android-studio
brew cask install appcleaner
brew cask install carbon-copy-cloner
brew cask install ccmenu
brew cask install cyberduck
brew cask install dash
brew cask install docker
brew cask install firefox
brew cask install flux
brew cask install handbrake
brew cask install imageoptim
brew cask install Caskroom/versions/intellij-idea-ce
brew cask install iterm2
brew cask install kindle
brew cask install launchcontrol
brew cask install macdown
brew cask install opera
brew cask install pngyu
brew cask install skitch
brew cask install spectacle
brew cask install steam
brew cask install visual-studio-code
brew cask install vlc
brew cask install xscope
