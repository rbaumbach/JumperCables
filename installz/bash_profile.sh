#!/usr/bin/env bash

echo
echo "Create some aliases..."
echo "# Aliases" >> ~/.bash_profile
echo "" >> ~/.bash_profile
echo 'alias l='\''ls -la'\' >> ~/.bash_profile
echo 'alias be='\''bundle exec'\' >> ~/.bash_profile
echo 'alias gst='\''git status'\' >> ~/.bash_profile
echo 'alias gadd='\''git add -p'\' >> ~/.bash_profile
echo 'alias gcommit='\''git commit -m'\' >> ~/.bash_profile
echo "" >> ~/.bash_profile

echo
echo "Disable fastlane tracking"
echo "# fastlane"
echo "" >> ~/.bash_profile
echo "export FASTLANE_OPT_OUT_USAGE=$FASTLANE_OPT_OUT_USAGE" >> ~/.bash_profile
echo "" >> ~/.bash_profile

echo
echo "Disable CocoaPods tracking"
echo "# CocoaPods"
echo "" >> ~/.bash_profile
echo "export COCOAPODS_DISABLE_STATS=$COCOAPODS_DISABLE_STATS" >> ~/.bash_profile
echo "" >> ~/.bash_profile