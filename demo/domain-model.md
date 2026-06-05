# Del escenario al modelo lógico

## Paso 1 - Identifica entidades candidatas

En FamilyMarket aparecen naturalmente estas entidades:

- cliente
- pedido
- item de pedido
- producto
- pago
- envío

No son la única respuesta posible, pero sí una base razonable para empezar.

## Paso 2 - Identifica relaciones

Preguntas útiles:

- ¿quién hace un pedido?
- ¿qué contiene un pedido?
- ¿cómo sabemos qué producto se vendió?
- ¿qué pago corresponde a qué pedido?
- ¿qué envío corresponde a qué pedido?

Relaciones candidatas:

- un cliente realiza muchos pedidos
- un pedido pertenece a un cliente
- un pedido contiene uno o más items
- un item referencia un producto
- un pedido genera un pago
- un pedido puede requerir un envío

## Paso 3 - Identifica reglas de dominio

Las reglas no son lo mismo que las entidades.

Una regla expresa una condición del negocio, por ejemplo:

- un pedido no puede existir sin cliente
- un pedido debe tener al menos un producto
- un producto inactivo no debe venderse
- un pedido no debe enviarse sin pago confirmado
- un pedido cancelado no debe seguir su flujo normal

## Paso 4 - Piensa en un modelo defendible

Todavía no necesitas optimizar ni programar todo.

Lo que sí necesitas es poder explicar:

- por qué elegiste ciertas entidades
- por qué una relación existe
- por qué una regla protege la operación
- cómo evitarías datos inconsistentes
