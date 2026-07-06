# Home Activity - Reglas extendidas y validaciones

## Reglas extendidas

| Regla | Tipo | Entidades | Posible implementación | Consecuencia si se ignora |
|---|---|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido, cliente | base de datos | Pedidos huérfanos sin cobrar. |
| Un pedido debe tener al menos un producto. | operación | pedido, item | aplicación | Pedidos vacíos y basura. |
| Un producto inactivo no debe venderse. | disponibilidad | producto | aplicación | Quejas por falta de stock. |
| Un pedido no debe enviarse sin pago. | estado | pedido, pago | proceso | Pérdida financiera. |
| Un item debe tener cantidad mayor a cero. | integridad | item | base de datos | Errores matemáticos. |
| Un pedido cancelado no debe enviarse. | estado | pedido, envío | aplicación | Gastos de paquetería extra. |
| Un pago debe pertenecer a un pedido. | integridad | pago, pedido | base de datos | Ingresos no identificados. |
| Un pedido entregado no vuelve a pendiente. | auditoría | pedido | proceso | Doble envío logístico. |

## Reflexión final

Comprendí que el diagrama estructural es solo la mitad del sistema. Las reglas de dominio son las que protegen la lógica del negocio, definiendo qué acciones son válidas y determinando dónde colocar el límite (base de datos o código).
