# Walkthrough de la sesión

## Objetivo

Usar FamilyMarket para recorrer esta cadena:

```txt
problema de negocio
-> dominio
-> entidades
-> relaciones
-> reglas de negocio
-> primer modelo lógico
```

## Antes de empezar

Si ya estás dentro del devcontainer:

```bash
connection-info
```

Si estás fuera del devcontainer:

```bash
./scripts/session.sh up
```

## Paso 1 - Lee el escenario

Abre:

- `demo/scenario.md`

Busca sustantivos importantes y anota qué cosas necesita recordar el negocio.

## Paso 2 - Marca entidades candidatas

Pregúntate:

- ¿cliente es una entidad?
- ¿pedido es una entidad?
- ¿producto es una entidad?
- ¿pago y envío merecen existir por separado?

En esta etapa no busques perfección. Busca una primera versión defendible.

## Paso 3 - Piensa en relaciones

Ahora conecta las entidades:

- cliente -> pedido
- pedido -> item de pedido
- item de pedido -> producto
- pedido -> pago
- pedido -> envío

La pregunta no es solo “si se pueden conectar”, sino **por qué importa que se conecten**.

## Paso 4 - Revisa reglas de negocio

Lee la lista de errores que FamilyMarket quiere evitar:

- enviar pedidos sin pago confirmado
- vender productos inactivos
- registrar pedidos sin cliente
- permitir cantidades inválidas

Cada uno de esos puntos sugiere una regla del dominio.

## Paso 5 - Conecta con el entorno PostgreSQL

La base y el seed existen para mantener continuidad con el curso.
Puedes explorar el esquema si quieres, pero no es obligatorio para resolver las actividades.

Ejemplos opcionales:

```sql
\dt
SELECT * FROM customers LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM products LIMIT 5;
```

## Paso 6 - Transición a actividades

- `class-activity-01`: identificar entidades y relaciones
- `class-activity-02`: identificar reglas de dominio
- `home-activity`: extender reglas y pensar implementaciones posibles

## Qué no hacer todavía

- no convertir la clase en SQL 101
- no resolver técnicamente el proyecto final
- no intentar optimizar el modelo demasiado pronto
