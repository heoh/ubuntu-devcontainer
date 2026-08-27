#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
workspace_dir="${script_dir}"
config_dir="$(cd -- "${workspace_dir}/.devcontainer" && pwd)"

if command -v devcontainer >/dev/null 2>&1; then
  devcontainer_cmd=(devcontainer)
elif command -v npx >/dev/null 2>&1; then
  devcontainer_cmd=(npx --yes @devcontainers/cli@latest)
else
  echo "Dev Container CLI or npx is required." >&2
  exit 1
fi

exec "${devcontainer_cmd[@]}" build --workspace-folder "${workspace_dir}" --config "${config_dir}/devcontainer.json"
