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
source ~/.bash_profile

echo
echo "Adding Homebrew versions"
brew tap homebrew/versions

echo
echo "Installing Java 6"
brew cask install Caskroom/versions/java6

echo
echo "Installing Java 7"
brew cask install Caskroom/versions/java7

echo
echo "Installing Java 8"
brew cask install java

echo
echo "Hooking up Java 6/7/8 to jEnv"

JVM_DIR="/Library/Java/JavaVirtualMachines/"

for dir in ${JVM_DIR}/*
do
    jvm_dir_name=${dir##*/}
    full_jvm_dir=${dir}/Contents/Home

    echo
    echo "Adding ${jvm_dir_name} to jEnv"
    jenv add ${full_jvm_dir}
done

MOST_CURRENT_JVM=$(ls -t ${JVM_DIR} | head -1)
MOST_CURRENT_JVM__VERSION_NAME=$(echo ${MOST_CURRENT_JVM} | sed -e 's/jdk//' -e 's/_/./' -e 's/.jdk//')

echo
echo "Setting global version of Java to ${MOST_CURRENT_JVM__VERSION_NAME}"
jenv global ${MOST_CURRENT_JVM__VERSION_NAME}
jenv rehash

echo
echo "Installing some Java tools"

echo
echo "Installing Maven"
brew install maven

echo
echo "Installing Gradle"
brew install gradle
