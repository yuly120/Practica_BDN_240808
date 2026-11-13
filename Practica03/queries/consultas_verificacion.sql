-- ============================================================================
-- PRÁCTICA 03: CONSULTAS SQL DE VERIFICACIÓN Y VALIDACIÓN
-- Base de datos: db_test
-- Autora: Yuliana Mendoza (Matrícula: 240808)
-- ============================================================================

USE db_test;

/* 1. Cantidad total de tablas en db_test (Deben ser 25 tablas base) */
SHOW FULL TABLES WHERE Table_type = 'BASE TABLE';
SELECT COUNT(*) AS total_tablas 
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA = 'db_test' AND TABLE_TYPE = 'BASE TABLE';

/* 2. Cantidad total de triggers implementados (Deben ser 72 triggers en 24 tablas) */
SHOW TRIGGERS FROM db_test;
SELECT COUNT(*) AS total_triggers 
FROM information_schema.TRIGGERS 
WHERE TRIGGER_SCHEMA = 'db_test';

/* 3. Cantidad total de vistas SQL (24 de trazabilidad + 1 de Productos por Categoría) */
SHOW FULL TABLES WHERE Table_type = 'VIEW';
SELECT COUNT(*) AS total_vistas 
FROM information_schema.VIEWS 
WHERE TABLE_SCHEMA = 'db_test';

/* 4. Procedimientos almacenados, funciones y eventos programados */
SHOW PROCEDURE STATUS WHERE Db = 'db_test';
SHOW FUNCTION STATUS WHERE Db = 'db_test';
SHOW EVENTS FROM db_test;

/* 5. Contabilizar productos por categoría y estado de disponibilidad */
SELECT * 
FROM vw_products_by_category
ORDER BY category_id IS NULL, total_products DESC;

/* 6. Validación de los 7,500 usuarios acumulados y relación 1:1 con tb_people */
SELECT COUNT(*) AS total_usuarios FROM tb_users;
SELECT COUNT(*) AS total_personas FROM tb_people;

-- Escenario Test 1: Usuarios masculinos originarios de Estados Unidos
SELECT COUNT(*) AS test1_hombres_usa
FROM tb_people
WHERE gender = 'M' AND country IN ('Estados Unidos', 'USA', 'United States');

-- Escenario Test 2: Usuarios con edades entre 19 y 35 años
SELECT COUNT(*) AS test2_edad_19_35
FROM tb_people
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 19 AND 35;

-- Escenario Test 3: Proporción de cuentas activas vs inactivas (80% / 20%)
SELECT 
    status,
    COUNT(*) AS cantidad,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM tb_users), 2) AS porcentaje
FROM tb_users
GROUP BY status;

/* 7. Validación de productos (+7,000), productos descontinuados y distribución por vendedor */
SELECT COUNT(*) AS total_productos FROM tb_products;

-- Productos activos vs descontinuados
SELECT 
    CASE WHEN current_stock > 0 THEN 'Disponible' ELSE 'Sin Stock / Baja' END AS disponibilidad,
    COUNT(*) AS total
FROM tb_products
GROUP BY disponibilidad;

-- Categorías / Subcategorías con menos de 5 productos asignados
SELECT 
    c.id AS category_id,
    c.name AS categoria,
    COUNT(p.id) AS total_productos
FROM tb_categories c
LEFT JOIN tb_subcategories s ON c.id = s.category_id
LEFT JOIN tb_products p ON s.id = p.subcategory_id
GROUP BY c.id, c.name
HAVING COUNT(p.id) < 5;

/* 8. Auditoría y trazabilidad de operaciones por usuarios remotos (SuperAdmin y Sellers) */
SELECT 
    table_name,
    operation_type,
    user_connection,
    COUNT(*) AS total_operaciones
FROM tb_logs
GROUP BY table_name, operation_type, user_connection
ORDER BY total_operaciones DESC;

/* 9. Comprobación de integridad referencial (Ausencia de registros huérfanos) */
SELECT COUNT(*) AS huerfanos_people_sin_user
FROM tb_people p
LEFT JOIN tb_users u ON p.user_id = u.id
WHERE p.user_id IS NOT NULL AND u.id IS NULL;

SELECT COUNT(*) AS huerfanos_productos_sin_subcategoria
FROM tb_products pr
LEFT JOIN tb_subcategories sc ON pr.subcategory_id = sc.id
WHERE pr.subcategory_id IS NOT NULL AND sc.id IS NULL;

