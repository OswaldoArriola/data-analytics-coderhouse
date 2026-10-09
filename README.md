# RetailPro — Base de Datos y Análisis Comercial (Ventas_Tech_DB)

Proyecto de análisis de datos para **RetailPro**, diseñado sobre **Microsoft SQL Server**. Permite consolidar transacciones, clientes, productos y categorías para evaluar el rendimiento comercial y patrones de consumo.

## 🛠️ Herramientas Utilizadas
- **DBMS:** Microsoft SQL Server 2022 / Azure Data Studio / SSMS
- **Lenguaje:** T-SQL (Transact-SQL)
- **Documentación / Co-piloto:** Google Gemini / ChatGPT

## 📂 Estructura del Repositorio y Orden de Ejecución

Para desplegar la base de datos correctamente, ejecute los scripts en el siguiente orden secuencial:

1. `ventas_tech_db.sql` — Creación de la base de datos `Ventas_Tech_DB`, esquema DDL (tablas, claves primarias y foráneas) e inserción de datos de prueba (DML).
2. `m4_consultas_negocio.sql` — Consultas de agregación, ranking de productos y métricas ejecutivas mensuales.
3. `m5_consultas_joins.sql` — Consultas relacionales avanzadas (`INNER JOIN`, `LEFT JOIN`, `UNION ALL`) y creación de la vista consolidada.

## 🚀 Guía de Ejecución en SQL Server Management Studio (SSMS)

1. Abra **SQL Server Management Studio** o **Azure Data Studio** y conéctese a su instancia.
2. Abra y ejecute el archivo `ventas_tech_db.sql` presionando `F5`. Esto creará la base `Ventas_Tech_DB` y poblará las tablas.
3. Ejecute los archivos `m4_consultas_negocio.sql` y `m5_consultas_joins.sql` para obtener los análisis comerciales y las vistas relacionales.

## 📊 Modelo de Datos (Esquema Relacional)
El modelo relacional está compuesto por 4 tablas principales:
- `categorias` (id_categoria [PK], nombre_categoria, descripcion)
- `clientes` (id_cliente [PK], nombre, email, ciudad, fecha_registro)
- `productos` (id_producto [PK], nombre_producto, id_categoria [FK], precio, stock, activo)
- `ventas` (id_venta [PK], id_cliente [FK], id_producto [FK], cantidad, precio_unitario, fecha_venta)

