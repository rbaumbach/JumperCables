#!/bin/bash

echo
echo "Customizing OS X configurations"

echo
echo "Updating Dock configurations"

echo
echo "Hide the Dock"
defaults write com.apple.dock autohide -bool YES

echo
echo "Update Dock minimize effect to 'Scale'"
defaults write com.apple.dock mineffect -string scale

echo
echo "Reloading Dock"
killall Dock

echo
echo "Updating Finder configurations"

echo
echo "Display full path in title bar"
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool YES

echo
echo "Show hard drives on the desktop"
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES

echo
echo "Show mounted servers on the desktop"
defaults write com.apple.finder ShowMountedServersOnDesktop -bool YES

echo
echo "Show file extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool YES

echo
echo "Show status bar"
defaults write com.apple.finder ShowStatusBar -bool YES

echo
echo "Reloading Finder"
killall Finder

echo
echo "Updating System Preferences"

echo
echo "Disable Gatekeeper auto renewal"
sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO

echo
echo "Updating Safari Configurations"

echo
echo "Disable auto PDF opening..."
defaults write com.apple.Safari WebKitOmitPDFSupport -bool YES

echo
echo "Disable auto open safe filedownloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool NO

echo
echo "Updating other configurations"

echo
echo "Disable Photos from opening automatically"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

echo
echo "Disable 'smart' quotes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool NO

echo
echo "Disable 'smart' dashes"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool NO

echo
echo "Disable .DS_File writes on network stores"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool YES
