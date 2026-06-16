# Home Activity - Reglas extendidas y validaciones

## Reglas extendidas

| Regla | Tipo | Entidades involucradas | Posible implementación | Consecuencia si se ignora |
|---|---|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido, cliente | restricción de base de datos | Pedidos anónimos, pérdidas de contacto con el comprador y fallos en la facturación. |
| Un pedido debe tener al menos un producto. | operación | pedido, item de pedido | validación en aplicación | Ventas vacías con montos en cero que distorsionan las estadísticas de la tienda. |
| Un producto inactivo no debe venderse. | disponibilidad | producto, item de pedido | validación en aplicación | Ventas de artículos descontinuados, cancelaciones forzadas y reembolsos manuales. |
| Un pedido no debe enviarse sin pago confirmado. | estado | pedido, pago, envío | trigger o proceso | Pérdida material directa del producto y un impacto financiero crítico para el negocio. |
| Un item de pedido debe tener cantidad mayor a cero. | integridad | item de pedido | restricción de base de datos | Cálculos matemáticos rotos, inconsistencias contables y totales en negativo. |
| Un pedido cancelado no debe enviarse. | estado | pedido, envío | validación en aplicación | Despacho accidental de mercancía que no se va a cobrar y gastos en costos de envío. |
| Un pago debe pertenecer a un pedido existente. | integridad | pago, pedido | restricción de base de datos | Dinero anonimo en el sistema que no se puede asociar a ninguna venta real. |
| Un pedido entregado no debe volver a estado pendiente. | auditoría | pedido | proceso o regla de estado | Fraudes internos, alteración del historial de entregas y descontrol en la contabilidad. |

## Reflexión final

Al pasar de simples entidades y relaciones a definir reglas de dominio, aprendí que una base de datos no es solo un almacén pasivo de información, sino el motor de reglas que mantiene vivo y seguro a un negocio.

Las entidades son solo las piezas del rompecabezas, pero las reglas de dominio son las instrucciones que definen cómo deben encajar esas piezas correctamente. Entendí también que proteger los datos requiere una estrategia compartida: la base de datos se encarga de los candados matemáticos e inquebrantables (como cantidades mayores a cero), mientras que la aplicación controla el flujo de las pantallas y la experiencia del usuario. Sin reglas de dominio claras, el sistema colapsaría rápidamente guardando información basura o inconsistente.
