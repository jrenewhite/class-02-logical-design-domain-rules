# Home Activity - Reglas extendidas y validaciones

## Reglas extendidas

| Regla | Tipo | Entidades involucradas | Posible implementación | Consecuencia si se ignora |
|---|---|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido, cliente | restricción de base de datos | |
| Un pedido debe tener al menos un producto. | operación | pedido, item de pedido | validación en aplicación | |
| Un producto inactivo no debe venderse. | disponibilidad | producto, item de pedido | validación en aplicación | |
| Un pedido no debe enviarse sin pago confirmado. | estado | pedido, pago, envío | trigger o proceso | |
| Un item de pedido debe tener cantidad mayor a cero. | integridad | item de pedido | restricción de base de datos | |
| Un pedido cancelado no debe enviarse. | estado | pedido, envío | validación en aplicación | |
| Un pago debe pertenecer a un pedido existente. | integridad | pago, pedido | restricción de base de datos | |
| Un pedido entregado no debe volver a estado pendiente. | auditoría | pedido | proceso o regla de estado | |

## Reflexión final

Explica qué aprendiste al pasar de entidades y relaciones a reglas de dominio.
