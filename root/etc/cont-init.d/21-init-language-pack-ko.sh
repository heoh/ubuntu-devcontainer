#!/usr/bin/with-devcontenv bash

# Check enabled
if [ "${use_language_pack_ko}" != true ]; then
  exit 0
fi

ibus_installed=$( dpkg -s 'ibus' >/dev/null 2>&1 && echo true )

if [ "${ibus_installed}" = true ]; then
  su - ${USER_NAME} with-devcontenv bash -c \
    "dbus-run-session -- dconf write /desktop/ibus/general/preload-engines \"['hangul']\""
fi
