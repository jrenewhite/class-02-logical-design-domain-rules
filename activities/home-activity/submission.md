# Home Activity - Reglas extendidas y validaciones

## Reglas extendidas

| Regla | Tipo | Entidades involucradas | Posible implementación | Consecuencia si se ignora |
|---|---|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido, cliente | restricción de base de datos | Se podrían registrar pedidos sin responsable, afectando seguimiento, cobro y reportes. |
| Un pedido debe tener al menos un producto. | operación | pedido, item de pedido | validación en aplicación | Se podrían crear pedidos vacíos que no representan una venta real. |
| Un producto inactivo no debe venderse. | disponibilidad | producto, item de pedido | validación en aplicación | Se podrían vender productos descontinuados o no disponibles. |
| Un pedido no debe enviarse sin pago confirmado. | estado | pedido, pago, envío | trigger o proceso | Se podría entregar mercancía sin asegurar el ingreso. |
| Un item de pedido debe tener cantidad mayor que cero. | integridad | item de pedido | restricción de base de datos | Se generarían ventas inválidas con cantidades negativas o en cero. |
| Un pedido cancelado no debe enviarse. | estado | pedido, envío | validación en aplicación | Se podrían enviar productos que el cliente ya canceló. |
| Un pago debe pertenecer a un pedido existente. | integridad | pago, pedido | restricción de base de datos | Habría pagos sin relación clara con una venta. |
| Un pedido entregado no debe volver a estado pendiente. | auditoría | pedido | proceso o regla de estado | Se perdería claridad sobre el historial real del pedido. |

## Reflexión final

Aprendí que identificar entidades y relaciones solo muestra la estructura básica del sistema, pero las reglas de dominio explican cómo debe comportarse el negocio. En el caso de TiendaBrava, no basta con saber que existen clientes, pedidos, productos y pagos; también es necesario definir qué condiciones deben cumplirse para que una venta sea válida, cuándo puede enviarse un pedido y qué estados no deberían cambiarse sin control. Estas reglas ayudan a evitar errores, fraudes, inconsistencias y decisiones basadas en datos incorrectos.
