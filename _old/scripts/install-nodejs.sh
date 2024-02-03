#!/bin/bash

curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
apt-get update
apt-get install -y nodejs
rm -rf /var/lib/apt/lists/*
