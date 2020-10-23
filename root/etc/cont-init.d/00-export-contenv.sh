#!/usr/bin/with-contenv bash

ignored="CWD HOME PATH PWD SHLVL"

for name in $(IFS= compgen -e); do
  if [[ ! " $ignored " =~ " $name " ]]; then
    source devcont-export $name
  fi
done
