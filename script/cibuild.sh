#!/usr/bin/env bash
set -e # halt script on error

cd ./content

bundle install
bundle exec jekyll build
