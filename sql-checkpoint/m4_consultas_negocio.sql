-- ============================================================================
-- Consultas de métricas clave sobre la tabla 'ventas' (Ventas_Tech_DB)
-- ============================================================================

-- Consulta 1: Resumen ejecutivo mensual
-- Obtiene el total facturado, cantidad de pedidos y ticket promedio por mes.
SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- Consulta 2: Ranking de productos (Top 5)
-- Identifica los 5 productos con mayor facturación y el total de unidades vendidas.
SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;


-- Consulta 3: Clientes recurrentes
-- Muestra los clientes con más de un pedido, su total de compras y gasto acumulado.
SELECT 
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC, total_gastado DESC;


-- Consulta 4: Meses por encima/por debajo del promedio
-- Compara el total facturado de cada mes contra el promedio mensual general.
WITH facturacion_mensual AS (
    SELECT 
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT 
    mes,
    total_facturado,
    CASE 
        WHEN total_facturado > (SELECT AVG(total_facturado) FROM facturacion_mensual) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS relacion_promedio_general
FROM facturacion_mensual
ORDER BY mes;


-- ============================================================================
-- BLOQUE DE CIERRE: Hallazgos de negocio
-- ============================================================================
/*
HALLAZGOS CONCRETOS DE LA REVISIÓN DE RESULTADOS:

1. Alta concentración de facturación en el Producto 1: El producto id_producto 1 
   (Laptop Pro 15) generó $3.600,00 sobre el total de $6.444,00, lo que representa 
   aproximadamente el 55,86% de toda la facturación con solo 3 unidades vendidas.

2. Recurrencia perfecta de la base de clientes: Todos los clientes registrados 
   (del id_cliente 1 al 5) realizaron exactamente 2 pedidos en la plataforma. 
   Destaca el cliente 1 como el de mayor valor acumulado con $2.640,00 gastados.

3. Temporalidad concentrada en marzo (Mes 3): La totalidad de las 10 transacciones 
   registradas corresponden exclusivamente al mes 3 (marzo de 2024), acumulando un 
   ticket promedio general de $644,40 por pedido.
*/