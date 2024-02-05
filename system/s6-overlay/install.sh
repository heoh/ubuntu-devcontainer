#!/bin/bash

S6_OVERLAY_VERSION=${S6_OVERLAY_VERSION:-3.1.6.2}

apt update
apt install -y wget xz-utils

wget https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz -O /tmp/s6-overlay-noarch.tar.xz
tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
wget https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz -O /tmp/s6-overlay-x86_64.tar.xz
tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

rm -rf /var/lib/apt/lists/*
