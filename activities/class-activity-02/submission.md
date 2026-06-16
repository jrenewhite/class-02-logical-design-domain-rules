# Class Activity 02 - Reglas de dominio

## Reglas

| Regla | Tipo | Entidades involucradas | Consecuencia si se ignora |
|---|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido, cliente | Pedidos anonimos e imposibilidad de facturar o contactar al comprador. |
| Un pedido debe tener al menos un producto. | operación | pedido, item de pedido | Registros de ventas vacíos, transacciones con total en cero y métricas alteradas. |
| Un producto inactivo no debe venderse. | disponibilidad | producto, item de pedido | Problemas de inventario, cancelaciones forzadas y reembolsos manuales al cliente. |
| Un pedido no debe enviarse sin pago confirmado. | estado | pedido, pago, envío | Pérdida material directa del producto y daño financiero irreversible al negocio. |
| Un item de pedido debe tener cantidad mayor a cero. | integridad | item de pedido | Cálculos de precios inconsistentes, errores lógicos y totales en negativo. |

## Regla más importante

La regla más importante es: **"Un pedido no debe enviarse sin pago confirmado."**

**Por qué:** Mientras que los errores de stock, productos inactivos o pedidos vacíos son fallos lógicos internos que se pueden corregir mediante el sistema o servicio al cliente, entregar mercancía sin cobrar representa una **pérdida material real, física e irreversible** para FamilyMarket. Esta regla protege la rentabilidad y la supervivencia financiera del negocio, un error asi podria arruinar el negocio y generar muchisimas perdidas o que el negocio quiebre.
