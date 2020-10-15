#!/usr/bin/with-buildenv bash

# Check enabled
if [ "${use_openssh_server}" != true ]; then
  touch /etc/services.d/openssh-server/down
  exit 0
fi

# Prepare user config dir
mkdir -p /mnt/data/ssh/config
mkdir -p /mnt/data/ssh/.ssh

# Copy default config
if [ ! -e /mnt/data/ssh/config/sshd_config ]; then
  cp -a /etc/ssh/sshd_config /mnt/data/ssh/config/sshd_config
fi
if [ ! -e /mnt/data/ssh/.ssh/authorized_keys ]; then
  touch /mnt/data/ssh/.ssh/authorized_keys
fi

# Link to user config
rm -Rf /etc/ssh
ln -s /mnt/data/ssh/config /etc/ssh
ln -s /mnt/data/ssh/.ssh ${USER_HOME}/.ssh

# Initialize openssh-server
mkdir -p /run/sshd
ssh-keygen -A

# Set permissions
chown -R ${PUID}:${PGID} /mnt/data/ssh
chmod -R go-w /etc/ssh
chown -h ${PUID}:${PGID} ${USER_HOME}/.ssh
chmod 0700 ${USER_HOME}/.ssh
chmod 0600 ${USER_HOME}/.ssh/authorized_keys
