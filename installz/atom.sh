#!/bin/bash

echo
echo "Installing atom"

brew cask install atom

echo
echo "Installing atom packages"

apm install atom-html-preview
apm install atom-bootstrap3 
