-- ============================================================================
-- Descripción: Consultas con JOINs y UNION ALL para cruce y consolidación de datos.
-- ============================================================================

USE Ventas_Tech_DB;
GO

-- ============================================================================
-- Consulta 1 — Vista base del proyecto (INNER JOIN)
-- Descripción: Une las ventas con las tablas de clientes, productos y categorías
--              para generar una vista enriquecida con información descriptiva,
--              ciudad/región, segmento y total de venta.
-- ============================================================================
SELECT 
    v.id_venta,
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;


-- ============================================================================
-- Consulta 2 — Clientes sin ventas (LEFT JOIN)
-- Descripción: Identifica clientes registrados en la base de datos que aún
--              no han realizado ninguna compra.
-- ============================================================================
SELECT 
    c.nombre AS nombre_cliente,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;


-- ============================================================================
-- Consulta 3 — Productos sin ventas (LEFT JOIN)
-- Descripción: Identifica los productos del catálogo que no tienen ninguna
--              venta registrada.
-- ============================================================================
SELECT 
    p.nombre_producto,
    cat.nombre_categoria,
    p.precio
FROM productos p
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;


-- ============================================================================
-- Consulta 4 — Consolidado por canal (UNION ALL)
-- Descripción: Crea la columna literal 'canal' asignando 'Venta Directa' a compras
--              de 2 o más unidades y 'Venta Minorista' a compras individuales, 
--              uniéndolas con UNION ALL y agrupando el total generado por canal.
-- ============================================================================
SELECT 
    canal, 
    SUM(total) AS total_canal
FROM (
    -- Subconsulta 1: Canal Venta Directa (compras de 2 o más unidades)
    SELECT 
        fecha_venta, 
        cantidad * precio_unitario AS total, 
        'Venta Directa' AS canal
    FROM ventas 
    WHERE cantidad >= 2

    UNION ALL

    -- Subconsulta 2: Canal Venta Minorista (compras de 1 unidad)
    SELECT 
        fecha_venta, 
        cantidad * precio_unitario AS total, 
        'Venta Minorista' AS canal
    FROM ventas 
    WHERE cantidad < 2
) AS consolidado
GROUP BY canal;