#!/bin/bash

# Install common packages
apt-get update
apt-get install -y \
  curl \
  locales \
  nano \
  sudo \
  vim \
  wget
rm -rf /var/lib/apt/lists/*

# Set locale
source devcont-export LANG=C.UTF-8
source devcont-export LC_ALL=C.UTF-8
