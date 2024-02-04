#!/usr/local/sbin/with-devcont bash

export DEBIAN_FRONTEND=noninteractive

unminimize

apt update
apt install -y ubuntu-minimal ubuntu-standard ubuntu-desktop
