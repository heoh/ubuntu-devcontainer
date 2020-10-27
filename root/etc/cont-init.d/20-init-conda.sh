#!/usr/bin/with-devcontenv bash

# Check initialized
if [ "${DEVCONT_INITIALIZED}" = true ]; then
  exit 0
fi

# Check enabled
if [ "${use_conda}" != true ]; then
  exit 0
fi

su - ${USER_NAME} with-devcontenv bash -c "conda init"

if [ "${CONDA_AUTO_ACTIVATE_BASE:-true}" != true ]; then
  su - ${USER_NAME} with-devcontenv bash -c \
    "conda config --set auto_activate_base ${CONDA_AUTO_ACTIVATE_BASE}"
fi
