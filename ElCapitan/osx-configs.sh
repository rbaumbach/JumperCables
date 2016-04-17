#!/usr/bin/env bash

echo
echo "Customizing OS X configurations"

echo
echo "Updating Finder configurations"

echo
echo "Hiding the Dock"
defaults write com.apple.dock autohide -bool true
killall Dock

echo
echo "Displaying full path in title bar"
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true
killall Finder

echo
echo "Updating Safari Configurations"

echo
echo "Disabling PDF opening..."
defaults write com.apple.Safari WebKitOmitPDFSupport -bool YES

echo
echo "Disabling auto open safe downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool NO