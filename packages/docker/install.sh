#!/usr/local/sbin/with-devcontenv bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

cp -r "$SCRIPT_DIR"/dist/* /

# Reference: https://docs.docker.com/engine/install/ubuntu/
# Install Docker Engine on Ubuntu: Install using the apt repository

# 1. Set up Docker's apt repository.
# Add Docker's official GPG key:
apt update
apt install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update

# 2. Install the Docker packages.
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

rm -rf /var/lib/apt/lists/*
