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
brew cask install Caskroom/versions/java6

echo
echo "Installing Java 7"
brew cask install Caskroom/versions/java7

echo
echo "Installing Java 8"
brew cask install java

echo
echo "Hooking up Java 6/7/8 to jEnv"

JAVA_VM_DIR="/Library/Java/JavaVirtualMachines/*"

for jvm_dir in ${JAVA_VM_DIR}
do
    full_jvm_dir=${jvm_dir}/Contents/Home
    jvm_dir_name=${jvm_dir##*/}

    echo
    echo "Adding ${jvm_dir_name} to jEnv"
    jenv add ${full_jvm_dir}
done

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
