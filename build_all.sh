#!/usr/bin/env sh
set -e
cd chopper
bundle install
bundle exec rake
cd ..
cd piedra_papel_tijera
bundle install
bundle exec rake
cd ..
cd batalla_naval
bundle install
bundle exec rake
cd ..
cd padrino_quickstart
bundle install
bundle exec rake
