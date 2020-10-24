#!/usr/bin/with-devcontenv bash

# Initialize Environment
if [ ${PUID:-1000} -eq 0 ]; then
  source devcont-export PUID=0
  source devcont-export PGID=0
  source devcont-export USER_NAME=root
  source devcont-export GROUP_NAME=root
  source devcont-export USER_HOME=/root
else
  source devcont-export PUID=${PUID:-1000}
  source devcont-export PGID=${PGID:-1000}
  source devcont-export USER_NAME=${USER_NAME:-user}
  source devcont-export GROUP_NAME=${GROUP_NAME:-user}
  source devcont-export USER_HOME=/home/${USER_NAME}
fi

# Check enabled
if [ ${PUID} -eq 0 ]; then
  exit 0
fi

# Create user
groupadd -g ${PGID} ${GROUP_NAME}
useradd -md ${USER_HOME} -s /usr/bin/devcont-bash -g ${GROUP_NAME} -u ${PUID} ${USER_NAME}
usermod -a -G sudo ${USER_NAME}

# When not copied skel, manually copy
if [ -d "${USER_HOME}" ] && [ "$(stat -c "%U" "${USER_HOME}")" != "${USER_NAME}" ]; then
  chown ${PUID}:${PGID} ${USER_HOME}

  mkdir -p /tmp/devcont-skel
  cp -r -T /etc/skel /tmp/devcont-skel
  chown -R ${PUID}:${PGID} /tmp/devcont-skel
  cp -rp -T /tmp/devcont-skel ${USER_HOME}
  rm -rf /tmp/devcont-skel
fi

# Set default password (= username)
echo "${USER_NAME}:${USER_NAME}" | chpasswd
