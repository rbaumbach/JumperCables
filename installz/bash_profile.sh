#!/usr/bin/env bash

echo
echo "Create some aliases..."
echo '# Aliases' >> ~/.bash_profile
echo '' >> ~/.bash_profile
echo 'alias l='\''ls -la'\' >> ~/.bash_profile
echo 'alias be='\''bundle exec'\' >> ~/.bash_profile
echo 'alias gst='\''git status'\' >> ~/.bash_profile
echo 'alias gadd='\''git add -p'\' >> ~/.bash_profile
echo 'alias gcommit='\''git commit -m'\' >> ~/.bash_profile
echo '' >> ~/.bash_profile

echo
echo "Disable fastlane tracking"
echo 'export FASTLANE_OPT_OUT=1' >> ~/.bash_profile
echo '' >> ~/.bash_profile
