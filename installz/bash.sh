#!/bin/bash

echo
echo "Installing latest bash..."
brew install bash

echo
echo "Adding /usr/local/bin/bash to /etc/shells"
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells

echo
echo "Changing default shell to latest bash..."
chsh -s /usr/local/bin/bash
