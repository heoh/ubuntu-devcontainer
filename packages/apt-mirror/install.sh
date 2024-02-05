#!/usr/local/sbin/with-devcontenv bash

# [Dockerfile]
# ARG APT_ARCHIVE_URL=http://archive.ubuntu.com/ubuntu

if [ -z "$APT_ARCHIVE_URL" ]; then
  exit 0
fi

sed -i "s@http://archive.ubuntu.com/ubuntu@$APT_ARCHIVE_URL@g" /etc/apt/sources.list

apt update
rm -rf /var/lib/apt/lists/*
