#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

activities=(
  class-activity-01
  class-activity-02
  home-activity
)

for activity_name in "${activities[@]}"; do
  echo
  echo "=================================================="
  echo "Validando: $activity_name"
  echo "=================================================="
  if ! "$repo_root/scripts/run-activity.sh" "$activity_name"; then
    exit 1
  fi
done

echo
echo "OK: todas las actividades pasaron la validacion publica."
