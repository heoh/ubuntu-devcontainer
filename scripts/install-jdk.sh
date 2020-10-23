#!/bin/bash

apt-get update
apt-get install -y default-jdk
rm -rf /var/lib/apt/lists/*

source devcont-export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
