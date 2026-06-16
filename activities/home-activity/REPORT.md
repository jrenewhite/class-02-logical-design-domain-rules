# Reporte - Home Activity

## 1. ¿Qué reglas agregaste que no estaban claras al inicio?

Se agregaron las reglas de control de estados avanzados y de consistencia interna: "Un pedido cancelado no debe enviarse", "Un pago debe pertenecer a un pedido existente" y "Un pedido entregado no debe volver a estado pendiente".

## 2. ¿Cuál regla sería más peligrosa de ignorar?

La regla más peligrosa es "Un pedido no debe enviarse sin pago confirmado". Ignorarla atenta directamente contra las finanzas de FamilyMarket, ya que entregar mercancía sin cobrar representa una pérdida material física e irreversible. A nivel de datos puros, ignorar que "Un pago debe pertenecer a un pedido existente" también sería crítico, porque generaríamos dinero "Anónimo " en el sistema que nadie sabría a qué venta corresponde.

## 3. ¿Cuál regla implementarías en base de datos y por qué?

Implementaría "Un pago debe pertenecer a un pedido existente" y "Un item de pedido debe tener cantidad mayor a cero". Ambas deben vivir en la base de datos como restricciones físicas. Si la aplicación web llega a fallar o alguien intenta saltarse las pantallas del sistema, la base de datos rechazará el dato corrupto en el último segundo.

## 4. ¿Cuál regla dejarías en aplicación o proceso y por qué?

La regla de "Un producto inactivo no debe venderse" y la de "Un pedido entregado no debe volver a estado pendiente". La primera se maneja mejor en la aplicación para que el catálogo web oculte visualmente el producto y el cliente ni siquiera intente comprarlo. La segunda depende mucho del proceso, ya que si un pedido vuelve a pendiente después de entregado, suele requerir una auditoría humana o una política física de devoluciones antes de mover un botón en el sistema.

## 5. ¿Qué duda te queda sobre reglas de dominio?

Mi mayor duda es cómo balancear la carga de reglas en la base de datos cuando el equipo de desarrollo es pequeño y los recursos de infraestructura son limitados. Entiendo el valor de los candados simples (como números mayores a cero), pero implementar lógica compleja y muy propensa a cambios constantes (como cupones o reglas dinámicas de envío) mediante triggers o restricciones físicas puede volverse costoso de mantener.
