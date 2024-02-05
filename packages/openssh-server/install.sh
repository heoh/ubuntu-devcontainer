#!/usr/local/sbin/with-devcontenv bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

cp -r "$SCRIPT_DIR"/dist/* /

apt update
apt install -y openssh-server

mkdir -p /run/sshd
ssh-keygen -A

rm -rf /var/lib/apt/lists/*
