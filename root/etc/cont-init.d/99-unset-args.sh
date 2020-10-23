#!/usr/bin/with-devcontenv bash

arg_id="^[a-z0-9_]+$"

for name in $(IFS= compgen -e); do
  if [[ "$name" =~ $arg_id ]]; then
    source devcont-unset $name
  fi
done
