# Scripts de validación

Esta carpeta contiene los comandos para operar el entorno y validar formalmente las actividades de Clase 02.

## Comandos disponibles

- `session.sh <up|down|reset|seed|psql|test|run|run-all>`
- `session.ps1 <up|down|reset|seed|psql|test|run|run-all>`
- `run-activity.sh <activity-name>`
- `run-activity.ps1 <activity-name>`
- `run-all.sh`
- `run-all.ps1`
- `connection-info`
- `check <activity-name>`
- `check all`

## Flujo recomendado

Dentro del devcontainer:

- `connection-info`
- `check class-activity-01`
- `check class-activity-02`
- `check home-activity`
- `check all`

Fuera del devcontainer:

- usa `session.sh` o `session.ps1` para levantar o resetear el stack
- usa `run-activity.sh` o `run-activity.ps1` si quieres validar desde host

## Qué valida `run-activity`

El validador público de Clase 02 revisa solo estructura mínima.

### `class-activity-01`

- existe `submission.md`
- existe `REPORT.md`
- existe `## Entidades`
- existe `## Relaciones`
- al menos 4 entidades
- al menos 3 relaciones

### `class-activity-02`

- existe `submission.md`
- existe `REPORT.md`
- existe `## Reglas`
- existe `## Regla más importante`
- al menos 5 reglas

### `home-activity`

- existe `submission.md`
- existe `REPORT.md`
- existe `## Reglas extendidas`
- existe `## Reflexión final`
- al menos 8 reglas

## Qué no valida

El script no califica semántica profunda.

No decide si:

- una entidad era la mejor
- una regla está bien priorizada
- una relación está perfectamente modelada

Eso sigue en revisión del instructor.

## Evidencia generada

Cada corrida actualiza:

```txt
activities/<activity>/actual/validation.txt
```

## Entorno

El repositorio sigue usando PostgreSQL y Docker para mantener continuidad con el curso, pero la validación pública de esta clase es principalmente de Markdown y estructura.
