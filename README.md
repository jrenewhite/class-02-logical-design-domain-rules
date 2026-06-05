# Clase 02 - Diseño lógico y reglas de dominio

Repositorio student-facing de la segunda sesión de **Sistemas Avanzados de Bases de Datos**.

## Objetivo de la clase

Antes de diseñar tablas o escribir SQL complejo, necesitamos entender el negocio.

En esta sesión vas a practicar cómo pasar de un escenario real a:

- entidades
- relaciones
- reglas de dominio
- un modelo lógico defendible

El escenario común de la clase es **FamilyMarket**, una tienda en línea pequeña con clientes, pedidos, productos, pagos y envíos.

## Qué incluye este repo

- `slides/session.pdf`: PDF de la sesión para alumnos.
- `demo/`: escenario, walkthrough y notas de modelado.
- `activities/`: actividades guiadas y actividad de casa.
- `scripts/`: validación pública y utilidades de entorno.
- `docs/evaluation-check.md`: cómo se conectan resultados, procedimiento y pregunta.
- `docs/devblog-01.md`: primera escritura técnica breve del curso.
- `docs/final-project-selection.md`: instrucciones para elegir proyecto final por correo.
- `diagrams/`: diagramas de apoyo y ejemplos públicos.

## Quick Start para Windows

La forma recomendada es usar **VS Code + Dev Containers + Docker Desktop**.

### Prerrequisitos

- Docker Desktop abierto y funcionando
- VS Code
- extensión `Dev Containers`
- Git

### Flujo recomendado

1. Clona el repositorio.
2. Ábrelo en VS Code.
3. Ejecuta `Dev Containers: Reopen in Container`.
4. Espera a que arranquen `postgres`, `workspace` y `adminer`.
5. Abre una terminal dentro del devcontainer.
6. Si la pantalla ya se limpió, corre `connection-info`.
7. Lee `demo/walkthrough.md`.
8. Completa las actividades en este orden:
   - `class-activity-01`
   - `class-activity-02`
   - `home-activity`
9. Completa también `docs/devblog-01.md`.
10. Valida con `check class-activity-01`, `check class-activity-02`, `check home-activity` o `check all`.

## Extensiones útiles dentro del devcontainer

El devcontainer instala estas extensiones para ayudarte:

- PostgreSQL Client
- Rainbow CSV
- PowerShell
- Markdown All in One
- Docker

## Comandos recomendados dentro del devcontainer

```bash
connection-info
check class-activity-01
check class-activity-02
check home-activity
check all
```

Dentro del devcontainer no necesitas correr `up`. El entorno ya debería venir levantado.

## Comandos útiles fuera del devcontainer

Bash:

```bash
./scripts/session.sh up
./scripts/session.sh reset
./scripts/session.sh seed
./scripts/session.sh psql
./scripts/session.sh test
./scripts/run-activity.sh class-activity-01
./scripts/run-activity.sh class-activity-02
./scripts/run-activity.sh home-activity
./scripts/run-all.sh
```

PowerShell:

```powershell
.\scripts\session.ps1 up
.\scripts\session.ps1 reset
.\scripts\session.ps1 seed
.\scripts\session.ps1 psql
.\scripts\session.ps1 test
.\scripts\run-activity.ps1 class-activity-01
.\scripts\run-activity.ps1 class-activity-02
.\scripts\run-activity.ps1 home-activity
.\scripts\run-all.ps1
```

## Datos de conexión

PostgreSQL corre con:

- usuario: `developer`
- password: `developer`
- base de datos: `advanced_databases`

Dentro del devcontainer:

- host: `postgres`
- port: `5432`

Desde Windows o desde cualquier cliente fuera del contenedor:

- host: `localhost`
- port: `5432`

Si una nueva terminal no muestra el banner, vuelve a verlo con:

```bash
connection-info
```

## Cliente web opcional

Si la extensión de PostgreSQL no conecta, usa Adminer:

- URL: `http://localhost:8080`
- sistema: `PostgreSQL`
- servidor: `postgres`
- usuario: `developer`
- password: `developer`
- base de datos: `advanced_databases`

## Qué archivos debes editar

- `activities/class-activity-01/submission.md`
- `activities/class-activity-01/REPORT.md`
- `activities/class-activity-02/submission.md`
- `activities/class-activity-02/REPORT.md`
- `activities/home-activity/submission.md`
- `activities/home-activity/REPORT.md`

Además:

- lee y responde `docs/devblog-01.md`
- revisa `docs/final-project-selection.md`

## Qué entregar

Para cada actividad:

- `submission.md`
- `REPORT.md`

La validación pública también genera evidencia local en:

- `activities/<activity>/actual/validation.txt`

## Cómo funciona la evaluación de actividades

Cada actividad evaluada usa este modelo:

- Resultados: 4 puntos
- Procedimiento: 2 puntos
- Pregunta oral: 2 puntos
- Total: 8 puntos

En Clase 02, **resultados** significa que tu entrega:

- existe
- tiene la estructura pedida
- incluye el mínimo de entidades, relaciones o reglas
- pasa la validación pública

## Qué valida el script

El script revisa cosas formales, por ejemplo:

- que exista `submission.md`
- que exista `REPORT.md`
- que no estén vacíos
- que aparezcan las secciones obligatorias
- que haya el mínimo de entidades, relaciones o reglas

## Qué no valida el script

El script **no** sabe si tu modelo es el mejor posible.

No valida automáticamente:

- si tu entidad realmente debía ser entidad
- si una regla está bien razonada
- si una relación está completa
- si tu explicación demuestra comprensión profunda

Eso se revisa con:

- lectura del `REPORT.md`
- revisión del instructor
- pregunta oral breve

Por eso, pasar pruebas públicas **no garantiza calificación completa**.

## Flujo recomendado de trabajo

1. Lee `slides/session.pdf`.
2. Lee `demo/scenario.md`.
3. Sigue `demo/walkthrough.md`.
4. Completa `class-activity-01`.
5. Completa `class-activity-02`.
6. Completa `home-activity`.
7. Escribe `docs/devblog-01.md` según las instrucciones.
8. Revisa `docs/final-project-selection.md`.
9. Valida todo con `check all`.

## Proyecto final

En esta clase todavía **no** vas a trabajar técnicamente sobre tu proyecto final.

Lo que sí debes hacer es:

- conocer los 10 casos disponibles
- entender cómo funciona la asignación FIFO
- preparar un correo con 5 opciones en orden de interés

La guía está en:

- `docs/final-project-selection.md`

## Lecturas relacionadas

- PostgreSQL SELECT:
  `https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-select/`
- AWS - OLTP vs OLAP:
  `https://aws.amazon.com/compare/the-difference-between-olap-and-oltp/`
- IBM - What is ETL?:
  `https://www.ibm.com/think/topics/etl`

## Troubleshooting

### No puedo abrir el devcontainer

- confirma que Docker Desktop está abierto
- confirma que `docker compose version` funciona
- vuelve a abrir VS Code

### No veo datos de conexión en la terminal

Corre:

```bash
connection-info
```

### La extensión de PostgreSQL no conecta

Usa Adminer en `http://localhost:8080`.

### El script marca error en una sección

Revisa que el título coincida exactamente con el solicitado en la actividad.
Ejemplo:

- `## Entidades`
- `## Relaciones`
- `## Reglas`
- `## Regla más importante`
- `## Reglas extendidas`
- `## Reflexión final`

### Quiero usar Make

Hay un `Makefile` por compatibilidad, pero el flujo recomendado sigue siendo:

- `session.sh` o `session.ps1` fuera del devcontainer
- `connection-info` y `check` dentro del devcontainer

## IA responsable

La IA puede ayudarte a pensar mejor, ordenar ideas o revisar redacción.

Pero sigue siendo tu responsabilidad:

- decidir
- justificar
- validar
- explicar tu modelo
- responder preguntas orales
