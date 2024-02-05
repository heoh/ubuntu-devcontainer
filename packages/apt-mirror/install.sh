#!/usr/local/sbin/with-devcontenv bash

# [Dockerfile]
# ARG APT_MIRROR_HOST=archive.ubuntu.com

if [ -z "$APT_MIRROR_HOST" ]; then
  exit 0
fi

sed -i "s/archive.ubuntu.com/$APT_MIRROR_HOST/g" /etc/apt/sources.list

apt update
rm -rf /var/lib/apt/lists/*
