#!/usr/local/sbin/with-devcontenv bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

if [ "$DEVCONT_INITIALIZED" = true ]; then
  exit 0
fi

cp -r "$SCRIPT_DIR"/../.ssh $_HOME/.ssh
chown -R $_UID:$_GID $_HOME/.ssh
chmod 0700 $_HOME/.ssh
chmod 0600 $_HOME/.ssh/authorized_keys
