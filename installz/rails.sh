#!/usr/bin/env bash

echo
echo "Installing Postgres.app"
brew cask install postgres

echo
echo "Fixing pg bundle error"
bundle config build.pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config

echo
echo "Installing rails"
gem install rails
