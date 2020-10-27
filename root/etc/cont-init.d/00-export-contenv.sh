#!/usr/bin/with-contenv bash

# Check initialized
source devcont-import DEVCONT_INITIALIZED
if [ "${DEVCONT_INITIALIZED}" = true ]; then
  exit 0
fi

ignored="CWD HOME PATH PWD SHLVL"

for name in $(IFS= compgen -e); do
  if [[ ! " $ignored " =~ " $name " ]]; then
    source devcont-export $name
  fi
done
