#!/usr/bin/with-devcontenv bash

# Check enabled
if [ "${use_x11_server}" != true ]; then
  exit 0
fi

# Add scripts for bash
if [ -f ${USER_HOME}/.bashrc ]; then
  echo '# Start dbus-daemon
[ "$SHLVL" = 1 ] && export $( dbus-launch )
' >> ${USER_HOME}/.bashrc
  echo '# Start ibus-daemon
[ "$SHLVL" = 1 ] && ibus-daemon -drx
' >> ${USER_HOME}/.bashrc

  echo '# Stop ibus-daemon
[ "$SHLVL" = 1 ] && ibus exit
' >> ${USER_HOME}/.bash_exit
  echo '# Stop dbus-daemon
[ "$SHLVL" = 1 ] && kill -TERM $DBUS_SESSION_BUS_PID
' >> ${USER_HOME}/.bash_exit
fi

# Set default ime to ibus
source devcont-export XMODIFIERS="@im=ibus"
source devcont-export GTK_IM_MODULE="ibus"
source devcont-export QT_IM_MODULE="ibus"
