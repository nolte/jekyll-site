#!/usr/bin/env bash
set -e # halt script on error

cd $(pwd)/../content

bundle install
bundle exec jekyll build
bundle exec htmlproofer ./_site
