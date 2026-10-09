\## 🛠️ Herramientas Utilizadas

\- \*\*DBMS:\*\* Microsoft SQL Server 2022 / Azure Data Studio / SSMS

\- \*\*Lenguaje:\*\* T-SQL (Transact-SQL)

\- \*\*Documentación / Co-piloto:\*\* Google Gemini / ChatGPT



\## 📂 Estructura del Repositorio y Orden de Ejecución



Para desplegar la base de datos correctamente, ejecute los scripts en el siguiente orden secuencial:



1\. `ventas\_tech\_db.sql` — Creación de la base de datos `Ventas\_Tech\_DB`, esquema DDL (tablas, claves primarias y foráneas) e inserción de datos de prueba (DML).

2\. `m4\_consultas\_negocio.sql` — Consultas de agregación, ranking de productos y métricas ejecutivas mensuales.

3\. `m5\_consultas\_joins.sql` — Consultas relacionales avanzadas (`INNER JOIN`, `LEFT JOIN`, `UNION ALL`) y creación de la vista consolidada.



\## 🚀 Guía de Ejecución en SQL Server Management Studio (SSMS)



1\. Abra \*\*SQL Server Management Studio\*\* o \*\*Azure Data Studio\*\* y conéctese a su instancia.

2\. Abra y ejecute el archivo `ventas\_tech\_db.sql` presionando `F5`. Esto creará la base `Ventas\_Tech\_DB` y poblará las tablas.

3\. Ejecute los archivos `m4\_consultas\_negocio.sql` y `m5\_consultas\_joins.sql` para obtener los análisis comerciales y las vistas relacionales.



\## 📊 Modelo de Datos (Esquema Relacional)

El modelo relacional está compuesto por 4 tablas principales:

\- `categorias` (id\_categoria \[PK], nombre\_categoria, descripcion)

\- `clientes` (id\_cliente \[PK], nombre, email, ciudad, fecha\_registro)

\- `productos` (id\_producto \[PK], nombre\_producto, id\_categoria \[FK], precio, stock, activo)

\- `ventas` (id\_venta \[PK], id\_cliente \[FK], id\_producto \[FK], cantidad, precio\_unitario, fecha\_venta)



