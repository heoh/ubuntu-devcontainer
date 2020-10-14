#!/usr/bin/with-contenv bash

# Environment
if [ ${PUID} -eq 0 ]; then
  export PUID=0
  export PGID=0
  export USER_NAME=root
  export GROUP_NAME=root
  export USER_HOME=/root
else
  export PUID=${PUID:-1000}
  export PGID=${PGID:-1000}
  export USER_NAME=${USER_NAME:-user}
  export GROUP_NAME=${GROUP_NAME:-user}
  export USER_HOME=/home/${USER_NAME}
fi

# Update container environment
s6-dumpenv /var/run/s6/container_environment
rm -rf /var/run/s6/container_environment/{PWD,SHLVL,_}

# Update build environment
cp /var/run/s6/container_environment/* /var/run/devcontainer/build_environment
