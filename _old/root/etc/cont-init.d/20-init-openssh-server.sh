#!/usr/bin/with-devcontenv bash

# Check initialized
if [ "${DEVCONT_INITIALIZED}" = true ]; then
  exit 0
fi

# Check enabled
if [ "${use_openssh_server}" != true ]; then
  touch /etc/services.d/openssh-server/down
  exit 0
fi

# Prepare user config dir
mkdir -p /mnt/data/ssh/config
mkdir -p /mnt/data/ssh/.ssh

# Copy default config
if [ ! -e "/mnt/data/ssh/config/sshd_config" ]; then
  sed -i 's/#\?\(X11UseLocalhost\s*\).*$/\1 no/' /etc/ssh/sshd_config

  cp -a /etc/ssh/sshd_config /mnt/data/ssh/config/sshd_config
fi
if [ ! -e "/mnt/data/ssh/.ssh/authorized_keys" ]; then
  touch /mnt/data/ssh/.ssh/authorized_keys
fi

# Link to user config
if [ ! -L "/etc/ssh" ]; then
  rm -Rf /etc/ssh
  ln -s /mnt/data/ssh/config /etc/ssh
fi
if [ ! -L "${USER_HOME}/.ssh" ]; then
  ln -s /mnt/data/ssh/.ssh ${USER_HOME}/.ssh
fi

# Initialize openssh-server
mkdir -p /run/sshd
ssh-keygen -A

# Set permissions
chown -R ${PUID}:${PGID} /mnt/data/ssh
chmod -R go-w /etc/ssh
chown -h ${PUID}:${PGID} ${USER_HOME}/.ssh
chmod 0700 ${USER_HOME}/.ssh
chmod 0600 ${USER_HOME}/.ssh/authorized_keys
