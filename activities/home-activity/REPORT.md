# Reporte - Home Activity

## 1. ¿Qué reglas agregaste que no estaban claras al inicio?

Agregué reglas relacionadas con la validez de los pedidos, pagos, productos y estados. Por ejemplo, que un pedido debe tener al menos un producto, que no debe enviarse si no tiene pago confirmado y que un producto inactivo no debe venderse.

## 2. ¿Cuál regla sería más peligrosa de ignorar?

La regla más peligrosa sería permitir enviar pedidos sin pago confirmado, porque el negocio podría entregar productos sin asegurar el ingreso correspondiente.

## 3. ¿Cuál regla implementarías en base de datos y por qué?

Implementaría en base de datos la regla de que un item de pedido debe tener cantidad mayor a cero, porque es una validación simple y obligatoria que puede controlarse con una restricción. Así se evita guardar información inválida desde cualquier aplicación o proceso.

## 4. ¿Cuál regla dejarías en aplicación o proceso y por qué?

Dejaría en aplicación o proceso la regla de que un producto inactivo no debe venderse, porque puede depender del flujo del negocio. Por ejemplo, tal vez algunos usuarios autorizados sí podrían vender productos en liquidación o bajo condiciones especiales.

## 5. ¿Qué duda te queda sobre reglas de dominio?

Me queda la duda de cómo decidir exactamente qué reglas deben ir en la base de datos y cuáles en la aplicación, sobre todo cuando una regla depende de varias condiciones del negocio.
