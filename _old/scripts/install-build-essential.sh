#!/bin/bash

apt-get update
apt-get install -y build-essential manpages-dev
rm -rf /var/lib/apt/lists/*
