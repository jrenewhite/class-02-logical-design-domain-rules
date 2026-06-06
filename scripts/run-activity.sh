#!/usr/bin/env bash
set -euo pipefail

if [[ -n ${SCRIPT_PATH-} ]]; then
  script_source="$SCRIPT_PATH"
elif [[ -n ${BASH_SOURCE[0]-} ]]; then
  script_source="${BASH_SOURCE[0]}"
else
  script_source="$0"
fi
script_dir="$(cd "$(dirname "$script_source")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

usage() {
  echo "Uso: $(basename "$0") <activity-name>" >&2
  exit 1
}

require_file() {
  local path="$1"
  if [[ ! -f "$path" ]]; then
    echo "ERROR: falta '$path'." >&2
    exit 1
  fi
}

require_nonempty() {
  local path="$1"
  if [[ ! -s "$path" ]]; then
    echo "ERROR: '$path' esta vacio." >&2
    exit 1
  fi
}

require_section() {
  local heading="$1"
  local path="$2"
  if ! grep -Eq "^##[[:space:]]+${heading}[[:space:]]*$" "$path"; then
    echo "ERROR: falta la seccion '## $heading' en '$path'." >&2
    exit 1
  fi
}

extract_section() {
  local heading="$1"
  local path="$2"
  awk -v heading="## ${heading}" '
    $0 == heading { in_section=1; next }
    in_section && /^## / { exit }
    in_section { print }
  ' "$path"
}

count_markdown_rows() {
  awk '
    /^\|/ {
      if ($0 ~ /^\|[[:space:]-]+\|/) next
      rows++
    }
    END {
      if (rows >= 2) {
        print rows - 1
      } else {
        print 0
      }
    }
  '
}

count_nonempty_lines() {
  awk 'NF { count++ } END { print count + 0 }'
}

activity_name="${1:-}"
[[ -n "$activity_name" ]] || usage

activity_dir="$repo_root/activities/$activity_name"
submission_md="$activity_dir/submission.md"
report_md="$activity_dir/REPORT.md"
actual_dir="$activity_dir/actual"
validation_report="$actual_dir/validation.txt"

if [[ ! -d "$activity_dir" ]]; then
  echo "ERROR: no existe la actividad '$activity_name'." >&2
  exit 1
fi

require_file "$submission_md"
require_file "$report_md"
require_nonempty "$submission_md"
require_nonempty "$report_md"

mkdir -p "$actual_dir"

case "$activity_name" in
  class-activity-01)
    require_section "Entidades" "$submission_md"
    require_section "Relaciones" "$submission_md"
    entities_count="$(extract_section "Entidades" "$submission_md" | count_markdown_rows)"
    relations_count="$(extract_section "Relaciones" "$submission_md" | count_markdown_rows)"
    if (( entities_count < 4 )); then
      echo "ERROR: se esperaban al menos 4 entidades; se encontraron $entities_count." >&2
      exit 1
    fi
    if (( relations_count < 3 )); then
      echo "ERROR: se esperaban al menos 3 relaciones; se encontraron $relations_count." >&2
      exit 1
    fi
    {
      echo "Actividad: $activity_name"
      echo "Entidades detectadas: $entities_count"
      echo "Relaciones detectadas: $relations_count"
      echo "Estado: validacion publica aprobada"
    } > "$validation_report"
    ;;
  class-activity-02)
    require_section "Reglas" "$submission_md"
    require_section "Regla más importante" "$submission_md"
    rules_count="$(extract_section "Reglas" "$submission_md" | count_markdown_rows)"
    importance_lines="$(extract_section "Regla más importante" "$submission_md" | count_nonempty_lines)"
    if (( rules_count < 5 )); then
      echo "ERROR: se esperaban al menos 5 reglas; se encontraron $rules_count." >&2
      exit 1
    fi
    if (( importance_lines < 1 )); then
      echo "ERROR: la seccion 'Regla mas importante' no debe estar vacia." >&2
      exit 1
    fi
    {
      echo "Actividad: $activity_name"
      echo "Reglas detectadas: $rules_count"
      echo "Regla más importante: presente"
      echo "Estado: validacion publica aprobada"
    } > "$validation_report"
    ;;
  home-activity)
    require_section "Reglas extendidas" "$submission_md"
    require_section "Reflexión final" "$submission_md"
    rules_count="$(extract_section "Reglas extendidas" "$submission_md" | count_markdown_rows)"
    reflection_lines="$(extract_section "Reflexión final" "$submission_md" | count_nonempty_lines)"
    if (( rules_count < 8 )); then
      echo "ERROR: se esperaban al menos 8 reglas; se encontraron $rules_count." >&2
      exit 1
    fi
    if (( reflection_lines < 1 )); then
      echo "ERROR: la seccion 'Reflexión final' no debe estar vacia." >&2
      exit 1
    fi
    {
      echo "Actividad: $activity_name"
      echo "Reglas extendidas detectadas: $rules_count"
      echo "Reflexión final: presente"
      echo "Estado: validacion publica aprobada"
    } > "$validation_report"
    ;;
  *)
    echo "ERROR: actividad no soportada '$activity_name'." >&2
    exit 1
    ;;
esac

echo "OK: $activity_name -> $validation_report"
