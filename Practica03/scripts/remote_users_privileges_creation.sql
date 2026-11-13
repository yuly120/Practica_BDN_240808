-- ============================================================================
-- PRÁCTICA 03: ADMINISTRACIÓN DE USUARIOS REMOTOS, ROLES Y PRIVILEGIOS
-- Base de datos: db_test
-- Autora: Yuliana Mendoza (Matrícula: 240808)
-- ============================================================================

USE db_test;

-- 1. Creación de los 7 roles establecidos en la Práctica 03 + roles operativos
CREATE ROLE IF NOT EXISTS 
    'superadmin', 
    'admin', 
    'support', 
    'seller', 
    'buyer', 
    'common_user', 
    'user_not_registered',
    'rol_admin',
    'rol_vendedor',
    'rol_cliente';

-- 2. Asignación de privilegios por rol sobre db_test
-- Super Admin y Admin (Control total sobre esquema, rutinas y usuarios)
GRANT ALL PRIVILEGES ON db_test.* TO 'superadmin' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON db_test.* TO 'rol_admin' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE, SHOW VIEW ON db_test.* TO 'admin';

-- Support (Consulta, soporte y auditoría sin eliminación estructural)
GRANT SELECT, UPDATE, SHOW VIEW ON db_test.* TO 'support';

-- Seller / rol_vendedor (Gestión de catálogo, productos, categorías, descuentos e inventario)
GRANT SELECT, INSERT, UPDATE ON db_test.tb_products TO 'seller', 'rol_vendedor';
GRANT SELECT, INSERT, UPDATE ON db_test.tb_categories TO 'seller', 'rol_vendedor';
GRANT SELECT, INSERT, UPDATE ON db_test.tb_subcategories TO 'seller', 'rol_vendedor';
GRANT SELECT, INSERT, UPDATE ON db_test.tb_discounts TO 'seller', 'rol_vendedor';
GRANT SELECT, INSERT ON db_test.tb_inventory_movements TO 'seller', 'rol_vendedor';
GRANT SELECT ON db_test.vw_products_by_category TO 'seller', 'rol_vendedor';
GRANT SELECT ON db_test.tb_suppliers TO 'seller', 'rol_vendedor';

-- Buyer / rol_cliente (Operaciones de compra, carrito, órdenes, pagos y reseñas)
GRANT SELECT ON db_test.tb_products TO 'buyer', 'rol_cliente';
GRANT SELECT ON db_test.tb_categories TO 'buyer', 'rol_cliente';
GRANT SELECT ON db_test.tb_subcategories TO 'buyer', 'rol_cliente';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_test.tb_carts TO 'buyer', 'rol_cliente';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_test.tb_cart_items TO 'buyer', 'rol_cliente';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_test.tb_wishlists TO 'buyer', 'rol_cliente';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_test.tb_wishlist_items TO 'buyer', 'rol_cliente';
GRANT SELECT, INSERT ON db_test.tb_orders TO 'buyer', 'rol_cliente';
GRANT SELECT, INSERT ON db_test.tb_order_details TO 'buyer', 'rol_cliente';
GRANT SELECT, INSERT ON db_test.tb_payments TO 'buyer', 'rol_cliente';
GRANT SELECT, INSERT, UPDATE ON db_test.tb_addresses TO 'buyer', 'rol_cliente';
GRANT SELECT, INSERT ON db_test.tb_reviews TO 'buyer', 'rol_cliente';

-- Common User & User Not Registered (Lectura restringida de catálogo público)
GRANT SELECT ON db_test.tb_products TO 'common_user', 'user_not_registered';
GRANT SELECT ON db_test.tb_categories TO 'common_user', 'user_not_registered';
GRANT SELECT ON db_test.tb_subcategories TO 'common_user', 'user_not_registered';
GRANT SELECT ON db_test.vw_products_by_category TO 'common_user', 'user_not_registered';

-- 3. Creación / Actualización de los 9 usuarios remotos del equipo
CREATE USER IF NOT EXISTS 'yuliana_mendoza'@'%' IDENTIFIED BY '240808';
CREATE USER IF NOT EXISTS 'hector_morales'@'%' IDENTIFIED BY '240764';
CREATE USER IF NOT EXISTS 'marco_ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER IF NOT EXISTS 'oscar_sampayo'@'%' IDENTIFIED BY '240428';
CREATE USER IF NOT EXISTS 'sharely_velazquez'@'%' IDENTIFIED BY '240639';
CREATE USER IF NOT EXISTS 'totis_soto'@'%' IDENTIFIED BY '240628';
CREATE USER IF NOT EXISTS 'adrian_rios'@'%' IDENTIFIED BY '240165';
CREATE USER IF NOT EXISTS 'app_web'@'%' IDENTIFIED BY 'pw_app';
CREATE USER IF NOT EXISTS 'app_movil'@'%' IDENTIFIED BY 'pw_app';

-- 4. Asignación de roles a cada cuenta de usuario
GRANT 'superadmin', 'rol_admin' TO 'yuliana_mendoza'@'%';
GRANT 'admin', 'rol_admin' TO 'marco_ramirez'@'%';
GRANT 'seller', 'rol_vendedor' TO 'hector_morales'@'%';
GRANT 'seller', 'rol_vendedor' TO 'oscar_sampayo'@'%';
GRANT 'seller', 'rol_vendedor' TO 'sharely_velazquez'@'%';
GRANT 'seller', 'support', 'rol_vendedor' TO 'totis_soto'@'%';
GRANT 'buyer', 'rol_cliente' TO 'adrian_rios'@'%';
GRANT 'buyer', 'common_user', 'rol_cliente' TO 'app_web'@'%';
GRANT 'buyer', 'common_user', 'rol_cliente' TO 'app_movil'@'%';

-- 5. Activación de roles predeterminados al iniciar sesión remota
SET DEFAULT ROLE ALL TO 
    'yuliana_mendoza'@'%',
    'marco_ramirez'@'%',
    'hector_morales'@'%',
    'oscar_sampayo'@'%',
    'sharely_velazquez'@'%',
    'totis_soto'@'%',
    'adrian_rios'@'%',
    'app_web'@'%',
    'app_movil'@'%';

FLUSH PRIVILEGES;

-- 6. Consultas de verificación de usuarios, roles y privilegios activos
SELECT User, Host FROM mysql.user WHERE User IN (
    'yuliana_mendoza','hector_morales','marco_ramirez','oscar_sampayo',
    'sharely_velazquez','totis_soto','adrian_rios','app_web','app_movil'
);
SELECT * FROM mysql.role_edges;
SHOW GRANTS FOR 'yuliana_mendoza'@'%';