# Home Activity - Reglas extendidas y validaciones

## Reglas extendidas

| Regla | Tipo | Entidades involucradas | Posible implementación | Consecuencia si se ignora |
|---|---|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido, cliente | restricción de base de datos |Se generarían pedidos huérfanos sin un cliente asociado. |
| Un pedido debe tener al menos un producto. | operación | pedido, item de pedido | validación en aplicación |Podrían registrarse pedidos vacíos sin valor comercial. |
| Un producto inactivo no debe venderse. | disponibilidad | producto, item de pedido | validación en aplicación |Se podrían vender productos descontinuados o no disponibles. |
| Un pedido no debe enviarse sin pago confirmado. | estado | pedido, pago, envío | trigger o proceso |La empresa podría enviar productos sin recibir el pago correspondiente. |
| Un item de pedido debe tener cantidad mayor a cero. | integridad | item de pedido | restricción de base de datos |Se registrarían cantidades inválidas que afectarían inventarios y cálculos. |
| Un pedido cancelado no debe enviarse. | estado | pedido, envío | validación en aplicación |Se realizarían envíos innecesarios, generando costos y errores operativos. |
| Un pago debe pertenecer a un pedido existente. | integridad | pago, pedido | restricción de base de datos |Existirían pagos sin relación con ningún pedido válido. |
| Un pedido entregado no debe volver a estado pendiente. | auditoría | pedido | proceso o regla de estado |Se perdería la consistencia del historial y seguimiento del pedido. |

## Reflexión final

Explica qué aprendiste al pasar de entidades y relaciones a reglas de dominio.

Las entidades representan los objetos principales del problema a resolver, las relaciones serían los conectores que definen como interactúan entre entidades y las reglas funcionan como fail safes para eventos que pudieran ocurrir que resulten en operaciones inválidas.