# Class Activity 01 - Entidades y relaciones

## Entidades

| Entidad | Descripción | Por qué importa |
|---|---|---|
| Cliente | Persona que realiza compras o solicita servicios. | Permite identificar a quién se le venden los productos y mantener un historial de compras. |
| Pedido | Registro de una compra realizada por un cliente. | Conecta al cliente con los productos adquiridos y permite dar seguimiento a la venta. |
| Producto | Artículo o servicio que ofrece la empresa. | Es el elemento principal de la venta y requiere control de inventario y disponibilidad. |
| Pago | Registro de la transacción económica de un pedido. | Confirma que la compra fue liquidada y facilita el control financiero. |

## Relaciones

| Origen | Relación | Destino | Tipo esperado | Justificación |
|---|---|---|---|---|
| Cliente | realiza | Pedido | uno a muchos | Un cliente puede realizar varios pedidos a lo largo del tiempo, pero cada pedido pertenece a un único cliente. |
| Pedido | contiene | Item de pedido | uno a muchos | Un pedido puede incluir varios productos, representados mediante múltiples ítems de pedido. Cada ítem pertenece a un solo pedido. |
| Item de pedido | referencia | Producto | muchos a uno | Varios ítems de pedido pueden hacer referencia al mismo producto, pero cada ítem corresponde a un único producto específico. |

## Diagrama opcional

Puedes agregar un diagrama Mermaid, PlantUML o una explicación textual.

