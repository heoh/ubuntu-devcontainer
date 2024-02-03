#!/bin/bash

apt-get update
apt-get install -y openssh-server
rm -rf /var/lib/apt/lists/*
