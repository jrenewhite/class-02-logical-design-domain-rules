# Home Activity - Reglas extendidas y validaciones

## Reglas extendidas

| Regla | Tipo | Entidades involucradas | Posible implementación | Consecuencia si se ignora |
|---|---|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido, cliente | restricción de base de datos | se generarian pedidos sin identificar al comprador |
| Un pedido debe tener al menos un producto. | operación | pedido, item de pedido | validación en aplicación | se generarian pedidos vacios |
| Un producto inactivo no debe venderse. | disponibilidad | producto, item de pedido | validación en aplicación | se venderian productos que no estan disponibles |
| Un pedido no debe enviarse sin pago confirmado. | estado | pedido, pago, envío | trigger o proceso | se corre el riesgo de enviar pedidos sin pago |
| Un item de pedido debe tener cantidad mayor a cero. | integridad | item de pedido | restricción de base de datos | se enviarian pedidos vacios e inconsitencias |
| Un pedido cancelado no debe enviarse. | estado | pedido, envío | validación en aplicación | se realizarian envios inecesarios |
| Un pago debe pertenecer a un pedido existente. | integridad | pago, pedido | restricción de base de datos | generaria pedidos pendientes y pagos inconsistentes |
| Un pedido entregado no debe volver a estado pendiente. | auditoría | pedido | proceso o regla de estado | afectaria la integridad del sistema y rastreo |

## Reflexión final

Explica qué aprendiste al pasar de entidades y relaciones a reglas de dominio.
Que las reglas son las que indican que pueden hacer o que escenarios no deben ocurrir para que las entidades y relaciones funcionen de forma correcta.