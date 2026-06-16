# Reporte - Class Activity 02

## 1. ¿Qué regla protege mejor la operación del negocio?

La regla de Pago antes que Envío. Protege directamente las finanzas de FamilyMarket, evitando pérdidas materiales reales e irreversibles por entregar mercancía que no ha sido cobrada.

## 2. ¿Qué regla evitaría datos inconsistentes?

La regla de Pedidos sin Productos y Pedidos sin Cliente. Al obligar a que todo Pedido tenga un cliente_id válido y al menos un Ítem de Pedido asociado, se evita que la base de datos se llene de registros basura, incompletos o con totales en cero que alteren las métricas reales de venta.

## 3. ¿Qué regla podría convertirse en restricción, trigger o validación?

La Validación de Stock Agotado. Esta regla se puede automatizar mediante un trigger: cuando la cantidad disponible de un artículo llegue a cero (0), el disparador cambiará automáticamente su estado a "Inactivo". De esta forma, la base de datos bloquea de inmediato cualquier intento posterior de agregar ese producto a un nuevo pedido.

## 4. ¿Qué regla depende más del negocio que de la base de datos?

La Consistencia de estados por cancelación (qué pasa operativamente cuando un cliente cancela un pedido que ya está en camino).
Aunque la base de datos puede bloquear el cambio de estado, la logística real  de como gestionar la devolución de la guía con la paquetería, el reingreso manual del producto al estante físico y las políticas de reembolso del dinero  depende totalmente de los procesos humanos y operativos del negocio de FamilyMarket.
