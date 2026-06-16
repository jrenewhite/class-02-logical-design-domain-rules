# Reporte - Class Activity 01

## 1. ¿Qué entidades identificaste primero?

Cliente, Pedido y Producto, item de Pedido para poder controlar las cantidades de cada producto por separado.

## 2. ¿Qué relación te pareció más importante y por qué?

Pedido con Item de Pedido. El escenario exige evitar "pedidos vacíos", por lo que un pedido no puede existir si no tiene al menos un producto.

## 3. ¿Qué elemento te generó duda: entidad, atributo o regla?

Me generó duda identificar reglas o entidades ocultas que el problema no describía explícitamente

## 4. Si tuvieras que convertir esto a tablas, ¿qué revisarías antes?

Revisaría las restricciones de clave foránea y los constraints. Específicamente, asegurarme de que la base de datos no permita crear un registro en la tabla `Envío` si el `Pago` asociado no está marcado estrictamente como 'Confirmado'.
