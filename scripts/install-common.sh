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
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
