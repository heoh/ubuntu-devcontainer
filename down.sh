#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
workspace_dir="${script_dir}"

mapfile -t container_ids < <(
  docker ps -aq --filter "label=devcontainer.local_folder=${workspace_dir}"
)

if ((${#container_ids[@]} == 0)); then
  echo "No Dev Container was found." >&2
  exit 0
fi

docker rm --force "${container_ids[@]}"
