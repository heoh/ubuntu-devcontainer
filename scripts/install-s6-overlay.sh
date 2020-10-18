#!/bin/bash

apt-get update
apt-get install -y wget
rm -rf /var/lib/apt/lists/*

version=${s6_overlay_version:-v2.1.0.0}

wget -O /tmp/s6-overlay-amd64.tar.gz https://github.com/just-containers/s6-overlay/releases/download/${version}/s6-overlay-amd64.tar.gz
tar xzf /tmp/s6-overlay-amd64.tar.gz -C / --exclude='./bin'
tar xzf /tmp/s6-overlay-amd64.tar.gz -C /usr ./bin
rm /tmp/s6-overlay-amd64.tar.gz
