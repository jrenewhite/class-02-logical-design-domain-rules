# Class Activity 02 - Reglas de dominio

## Reglas
| Regla | Tipo | Entidades |
|---|---|---|
| Un pedido no puede existir sin cliente. | integridad | pedido |
| Un pedido debe tener al menos un producto. | operacion | pedido |
| Un producto inactivo no debe venderse. | disponibilidad | producto |
| Un pedido no debe enviarse sin pago. | estado | pago |
| Un item debe tener cantidad mayor a cero. | integridad | item |

## Regla más importante
La regla de pago confirmado es critica porque protege directamente el dinero y el inventario fisico del negocio.
