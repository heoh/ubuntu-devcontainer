#!/bin/bash

apt update
DEBIAN_FRONTEND=noninteractive \
  apt install -y xorg openbox
rm -rf /var/lib/apt/lists/*
