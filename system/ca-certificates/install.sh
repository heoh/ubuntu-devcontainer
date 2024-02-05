#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

apt update
apt install -y ca-certificates

cp -r "$SCRIPT_DIR"/certs /usr/local/share/ca-certificates
update-ca-certificates

rm -rf /var/lib/apt/lists/*
