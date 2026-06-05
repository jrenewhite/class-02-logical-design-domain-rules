# Escenario - FamilyMarket

FamilyMarket es una tienda en línea pequeña que vende productos a clientes registrados.

Los clientes pueden hacer pedidos con uno o varios productos.

Cada pedido debe estar asociado a un cliente y debe tener al menos un item de pedido.

La tienda registra pagos y envíos para cada pedido.

El equipo quiere evitar problemas como:

- pedidos sin cliente
- pedidos sin productos
- cantidades inválidas
- productos inactivos que se siguen vendiendo
- pedidos enviados sin pago confirmado
- pedidos cancelados que todavía parecen activos
- cambios de estado que dejan datos inconsistentes

## Lo que debemos descubrir

Antes de hablar de tablas, piensa:

1. ¿Qué cosas necesita recordar el negocio?
2. ¿Cómo se relacionan entre sí?
3. ¿Qué reglas debe respetar el sistema para no producir datos imposibles?

Ese es el centro técnico de la clase.
