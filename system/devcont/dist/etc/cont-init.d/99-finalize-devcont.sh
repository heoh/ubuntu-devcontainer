#!/usr/local/sbin/with-devcontenv bash

. devcont-export DEVCONT_INITIALIZED=true

# Filter private variables
env -0 | while IFS='=' read -r -d '' name value; do
  if [[ "$name" == _* ]]; then
    . devcont-unset "$name"
  fi
done
