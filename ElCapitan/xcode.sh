#!/usr/bin/env bash

echo
echo "Accepting Xcode Software License Agreement..."
sudo xcodebuild -license accept

echo
echo "Installing Xcode command line developer tools"
xcode-select --install