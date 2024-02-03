#!/usr/bin/with-devcontenv bash

# Check initialized
if [ "${DEVCONT_INITIALIZED}" = true ]; then
  exit 0
fi

# Check enabled
if [ "${use_docker}" != true ]; then
  touch /etc/services.d/docker/down
  exit 0
fi

# Prepare docker.sock
if [ ! -e /var/run/docker.sock ] && [ -e /mnt/host/var/run/docker.sock ]; then
  ln -s /mnt/host/var/run/docker.sock /var/run/docker.sock
fi

if [ -e /var/run/docker.sock ]; then
  echo "It works as Docker-out-of-Docker."
  touch /etc/services.d/docker/down
else
  echo "It works as Docker-in-Docker."
  mkdir -p /mnt/data/docker
  chown ${PUID}:${PGID} /mnt/data/docker
fi

# Set permissions
if [ -n "${DOCKER_GID}" ]; then
  groupmod -g ${DOCKER_GID} docker
fi
if [ "${DOCKER_ALLOWS_NON_ROOT}" = true ]; then
  usermod -a -G docker ${USER_NAME}
fi
