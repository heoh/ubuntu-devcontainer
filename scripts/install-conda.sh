#!/bin/bash

CONDA_HOME=/opt/miniconda3

apt-get update
apt-get install -y \
  curl \
  libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
rm -rf /var/lib/apt/lists/*

curl -L -o /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash /tmp/miniconda.sh -b -p ${CONDA_HOME}
rm /tmp/miniconda.sh

source devcont-export PATH="${CONDA_HOME}/bin:$PATH"
