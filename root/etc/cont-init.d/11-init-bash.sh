#!/usr/bin/with-devcontenv bash

# Add scripts for bash
if [ -f ${USER_HOME}/.bashrc ]; then
  # .bash_logout is only called when the user exits normally.
  # .bash_exit expects to detect abnormal exit as well.
  touch ${USER_HOME}/.bash_exit
  chown ${PUID}:${PGID} ${USER_HOME}/.bash_exit

  echo '
# detect exit not only logout
handle_exit() {
  if [ -f ~/.bash_exit ]; then
    . ~/.bash_exit
  fi
}
if [ "$SHLVL" = 1 ]; then
  trap handle_exit EXIT
fi' >> ${USER_HOME}/.bashrc
fi
