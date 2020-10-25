#!/bin/bash

ibus_installed=$( dpkg -s 'ibus' >/dev/null 2>&1 && echo true )

apt update
DEBIAN_FRONTEND=noninteractive \
  apt install -y \
  language-pack-ko fonts-nanum fonts-nanum-coding fonts-nanum-extra

if [ "${ibus_installed}" = true ]; then
  apt install -y ibus-hangul
fi

rm -rf /var/lib/apt/lists/*
