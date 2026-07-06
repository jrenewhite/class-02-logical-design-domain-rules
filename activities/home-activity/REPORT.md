# Reporte - Home Activity: Operacion vs Analisis

## Pregunta de negocio
¿Que segmentos de clientes generan mayor ingreso confirmado?

## Explicacion de la solucion
Se unio la tabla de clientes con la de pedidos, filtrando por estado 'confirmado' y sumando el monto total agrupado por segmento.

## Reflexion: OLTP vs OLAP
Esta es una operacion OLAP. A diferencia de OLTP que inserta transacciones individuales, OLAP agrega grandes volumenes de datos historicos.
