#!/bin/bash

IDEA_IC_HOME=/opt/ideaIC

apt-get update
apt-get install -y curl
rm -rf /var/lib/apt/lists/*

curl -L -o /tmp/ideaIC.tar.gz "https://download.jetbrains.com/product?code=IIC&latest&distribution=linux"
mkdir -p ${IDEA_IC_HOME}
tar -xzf /tmp/ideaIC.tar.gz -C ${IDEA_IC_HOME} --strip-components 1
rm /tmp/ideaIC.tar.gz

ln -s "${IDEA_IC_HOME}/bin/idea.sh" "/usr/bin/intellij-idea-community"
