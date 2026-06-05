# Class Activity 02 - Reglas de dominio

## Reglas

| Regla | Tipo | Entidades involucradas | Consecuencia si se ignora |
|---|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido, cliente | |
| Un pedido debe tener al menos un producto. | operación | pedido, item de pedido | |
| Un producto inactivo no debe venderse. | disponibilidad | producto, item de pedido | |
| Un pedido no debe enviarse sin pago confirmado. | estado | pedido, pago, envío | |
| Un item de pedido debe tener cantidad mayor a cero. | integridad | item de pedido | |

## Regla más importante

Explica cuál regla consideras más importante y por qué.
