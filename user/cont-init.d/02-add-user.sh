#!/usr/local/sbin/with-devcontenv bash

if [ "$DEVCONT_INITIALIZED" = true ]; then
  exit 0
fi

# Initialize environments
. devcont-export _UID=${_UID:-0}
. devcont-export _GID=${_GID:-0}
. devcont-export _USER=${_USER:-root}
. devcont-export _HOME=$([ $_USER = root ] && echo /root || echo "/home/$_USER")

# Do nothing if root user
if [ $_USER = root ]; then
  exit 0
fi

# Add user
DEFAULT_PASSWORD=$_USER

groupadd -g $_GID $_USER
useradd -md $_HOME -s /bin/bash -g $_GID -u $_UID $_USER
usermod -aG sudo $_USER
echo "$_USER:$DEFAULT_PASSWORD" | chpasswd
