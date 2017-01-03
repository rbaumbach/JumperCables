#!/usr/bin/env bash

echo
echo "Installing atom"

brew cask install atom

echo
echo "Installing atom packages"

apm install atom-bootstrap3
apm install atom-html-preview
apm install expose
apm install file-icons
apm install pigments
apm install highlight-selected
apm install rest-client
apm install todo-show

apm install linter
apm install linter-shellcheck
apm install linter-bootlint

apm install xkcd-comics
