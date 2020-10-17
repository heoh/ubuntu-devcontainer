#!/bin/bash

apt-get update
apt-get install -y default-jdk
rm -rf /var/lib/apt/lists/*

echo "JAVA_HOME=\"/usr/lib/jvm/java-11-openjdk-amd64\"" >> /etc/environment
