# Class Activity 01 - Entidades y relaciones

## Entidades

| Entidad | Descripción | Por qué importa |
|---|---|---|
| Cliente | Usuario registrado que compra en la tienda. | Para asociarlo obligatoriamente a los pedidos y evitar compras anónimas. |
| Pedido | La orden de compra general generada por el cliente. | Registra el estado de la transacción y coordina todo el flujo del negocio. |
| Producto | Artículos disponibles en el catálogo para la venta. | Permite controlar el precio, descripción y validar si está "Activo" antes de venderse. | Permite controlar el precio, descripción y validar si está "Activo" antes de venderse.
| Pago | El registro del dinero recibido por un pedido. | Permite validar que el dinero entró al negocio antes de autorizar la entrega logística. |

## Relaciones

| Origen | Relación | Destino | Tipo esperado | Justificación |
|---|---|---|---|---|
| Cliente | realiza | Pedido | uno a muchos | Un cliente puede comprar varias veces, pero un pedido pertenece a un solo cliente obligatorio. |
| Pedido | contiene | Item de pedido | uno a muchos | Un pedido debe tener mínimo un artículo para no estar vacío; el item desglosa cada producto. |
| Item de pedido | referencia | Producto | muchos a uno | Muchos items de distintas compras pueden apuntar al mismo producto del catálogo general. |

## Diagrama opcional

1. **Inicio del Proceso:** El `Cliente` inicia el flujo generando un `Pedido`.
2. **Desglose de Productos:** Este pedido no almacena los productos directamente, sino que se conecta con uno o varios `Item de Pedido`.
3. **Validación de Catálogo:** Cada item lee la información del `Producto` desde el catálogo general para verificar dos condiciones críticas:
   * Que el producto tenga el estado **Activo**.
   * Que exista **Stock suficiente** para cubrir la cantidad solicitada.
4. **Control Financiero y Logístico:** Finalmente, el `Pedido` genera un registro de `Pago`, el cual debe pasar a estado **Confirmado** de forma obligatoria antes de que el sistema permita generar el `Envío`.