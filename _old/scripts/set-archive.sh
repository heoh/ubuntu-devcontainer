#!/bin/bash

# Change archive url
if [ -n "${ubuntu_archive_url}" ]; then
  sed -i "s@http://archive.ubuntu.com/ubuntu/@${ubuntu_archive_url}@g" /etc/apt/sources.list
fi
