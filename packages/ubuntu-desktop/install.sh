#!/usr/local/sbin/with-devcontenv bash

export DEBIAN_FRONTEND=noninteractive

yes | unminimize

apt update
apt install -y ubuntu-minimal ubuntu-standard ubuntu-desktop

rm -rf /var/lib/apt/lists/*
