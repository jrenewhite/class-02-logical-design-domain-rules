# Class Activity 02 - Reglas de dominio

## Reglas

| Regla | Tipo | Entidades involucradas | Consecuencia si se ignora |
|---|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido, cliente | |
| Un pedido debe tener al menos un producto. | operación | pedido, item de pedido | |
| Un producto inactivo no debe venderse. | disponibilidad | producto, item de pedido | |
| Un pedido no debe enviarse sin pago confirmado. | estado | pedido, pago, envío | |
| Un item de pedido debe tener cantidad mayor a cero. | integridad | item de pedido | |
| Un pedido no puede ser modificado luego de ser enviado | estado | pedido, envio | inconcistencias entre lo enviado y registrado |
| Un pago debe estar relacionado a un pedido existente | integridad | pago, pedido | pagos huerfanos sin relacion comercial |
| El total del pedido debe coicidir con la suma de sus items | integridad | pedido, item de pedido | errores en reportes y facturas |

## Regla más importante

Explica cuál regla consideras más importante y por qué.

Un pedido no puede existir sin clientes, ya que es la principal entidad que se relaciona e interactua con los usuarios.