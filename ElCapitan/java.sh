#!/usr/bin/env bash

echo
echo "Installing Java"

echo
echo "Installing jEnv to handle Java versioning"
brew install jenv
echo '# jEnv' >> ~/.bash_profile
echo '' >> ~/.bash_profile
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
echo '' >> ~/.bash_profile

echo
echo "Adding Homebrew versions"
brew tap homebrew/versions

echo
echo "Installing Java 6"
brew cask install java6

echo
echo "Installing Java 7"
brew cask install java7

echo
echo "Installing Java 8"
brew cask install java8

echo
echo "Hooking up Java 6/7/8 to jEnv"
jenv add /Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
jenv add /Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home

echo
echo "Setting global version of Java to 1.8.0.66"
jenv global 1.8.0.66
jenv rehash

echo
echo "Installing some Java tools"

echo
echo "Installing Maven"
brew install maven

echo
echo "Installing Gradle"
brew install gradle
