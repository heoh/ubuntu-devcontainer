#!/bin/bash

arg_id="^[a-z0-9_]+$"

for name in $(IFS= compgen -e); do
  if [[ "$name" =~ $arg_id ]]; then
    value="${!name}"
    source devcont-export $name
  fi
done
