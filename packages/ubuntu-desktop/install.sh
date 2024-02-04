#!/usr/local/sbin/with-devcont bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

apt update
apt install -y openssh-server
