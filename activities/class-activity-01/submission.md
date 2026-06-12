# Class Activity 01 - Entidades y relaciones

## Entidades

| Entidad | Descripción | Por qué importa |
|---|---|---|
| Cliente | es la entidad que identifica al usuario | es importante porque es la entidad que identifica al usuario |
| Pedido | es la entidad que muestra los articulos que el cliente quiere | es importante porque guarda la informacion de los productos y el estado del pedido |
| Producto | es la entidad que identifica los articulos | es importante para saber que se quiere adquirir |
| Pago | es la entidad que determina si un pedido es valido para envio | es importante porque determina si se realiza el pedido |

## Relaciones

| Origen | Relación | Destino | Tipo esperado | Justificación |
|---|---|---|---|---|
| Cliente | realiza | Pedido | uno a muchos | un cliente puede realizar muchos pedidos |
| Pedido | contiene | Item de pedido | uno a muchos | el pedido puede contener de uno a muchos item de pedido|
| Item de pedido | referencia | Producto | muchos a uno | el item de pedido puede hacer referencia de muchos productos o uno  |

## Diagrama opcional

Puedes agregar un diagrama Mermaid, PlantUML o una explicación textual.
