SELECT 
    c.segmento AS segmento_cliente,
    SUM(p.monto_total) AS ingreso_confirmado
FROM 
    clientes c
JOIN 
    pedidos p ON c.id_cliente = p.id_cliente
WHERE 
    p.estado = 'confirmado'
GROUP BY 
    c.segmento
ORDER BY 
    ingreso_confirmado DESC;
