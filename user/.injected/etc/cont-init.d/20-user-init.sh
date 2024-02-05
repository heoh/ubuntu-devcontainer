#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

if [ -d /mnt/user/cont-init.d ]; then
  for i in /mnt/user/cont-init.d/*.sh; do
    if [ -r $i ]; then
      echo "user-init: info: running $i"
      "$i"
      echo "user-init: info: $i exited $?"
    fi
  done
  unset i
fi
