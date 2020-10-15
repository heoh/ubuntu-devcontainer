#!/usr/bin/with-buildenv bash

if [ ${PUID} -eq 0 ]; then
  exit 0
fi

groupadd -g ${PGID} ${GROUP_NAME}
useradd -m -s /usr/bin/userbash -g ${GROUP_NAME} -u ${PUID} ${USER_NAME}
usermod -a -G sudo ${USER_NAME}

# Set default password (= username)
echo "${USER_NAME}:${USER_NAME}" | chpasswd
