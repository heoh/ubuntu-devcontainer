#!/usr/bin/with-devcontenv bash

# Check initialized
if [ "${DEVCONT_INITIALIZED}" = true ]; then
  exit 0
fi

arg_id="^[a-z0-9_]+$"

for name in $(IFS= compgen -e); do
  if [[ "$name" =~ $arg_id ]]; then
    source devcont-unset $name
  fi
done
