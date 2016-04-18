#!/usr/bin/env bash

echo
echo "Installing Git using homebrew"
brew install git

echo
echo "Setting global Git configurations"
git config --global color.ui auto
git config --global user.name Ryan
git config --global user.email github@ryan.codes
git config --global gpg.program gpg2
git config --global commit.gpgsign true

echo
echo "Installing git-aware-prompt"
mkdir ~/.bash
git clone https://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt
echo '# git-aware-prompt' >> ~/.bash_profile
echo '' >> ~/.bash_profile
echo 'GITAWAREPROMPT=~/.bash/git-aware-prompt' >> ~/.bash_profile
echo 'export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> ~/.bash_profile
echo 'export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "' >> ~/.bash_profile
echo '' >> ~/.bash_profile
