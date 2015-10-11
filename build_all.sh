#!/usr/bin/env sh
set -e
bundle install
cd ejemplo_banco
bundle exec rake
cd ..
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


