/* CREACION DE USUARIOS REMOTOS */
CREATE USER IF NOT EXISTS 'hector.morales'@'%' IDENTIFIED BY '240763';
ALTER USER 'hector.morales'@'%' IDENTIFIED BY '240763';
CREATE USER IF NOT EXISTS 'sharely.gonzalez'@'%' IDENTIFIED BY '240428';
ALTER USER 'sharely.gonzalez'@'%' IDENTIFIED BY '240428';
CREATE USER IF NOT EXISTS 'yuliana.mendoza'@'%' IDENTIFIED BY '240808';
ALTER USER 'yuliana.mendoza'@'%' IDENTIFIED BY '240808';
CREATE USER IF NOT EXISTS 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
ALTER USER 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';

/* ASIGNACION DE PRIVILEGIOS DEL SUPER USUARIO */
GRANT ALL PRIVILEGES ON *.* TO 'yuliana.mendoza'@'%' WITH GRANT OPTION;

/* CREACION DE ROLES */
CREATE ROLE IF NOT EXISTS 'superadmin';
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'common_user';
CREATE ROLE IF NOT EXISTS 'user_not_registered';
CREATE ROLE IF NOT EXISTS 'support';

/* ASIGNAR PRIVILEGIOS A LOS ROLES */
GRANT ALL PRIVILEGES ON *.* TO 'superadmin' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON db_test.* TO 'admin';
GRANT SELECT, INSERT, UPDATE ON db_test.tb_users TO 'support';
GRANT SELECT, INSERT, UPDATE ON db_test.tb_products TO 'seller';
GRANT SELECT ON db_test.tbc_categories TO 'seller';
GRANT SELECT ON db_test.vw_trazabilidad_productos TO 'seller','support';
GRANT SELECT ON db_test.vw_trazabilidad_usuarios TO 'support';
GRANT EXECUTE ON PROCEDURE db_test.sp_soft_delete_user TO 'support';
GRANT EXECUTE ON FUNCTION db_test.fn_total_products_by_category TO 'seller','support';
GRANT SELECT ON db_test.vw_total_products_by_category TO 'seller','support';

/* ASIGNAR LOS ROLES Y ACTIVARLOS POR DEFECTO */
GRANT 'admin' TO 'marco.ramirez'@'%';
SET DEFAULT ROLE 'admin' TO 'marco.ramirez'@'%';
GRANT 'superadmin' TO 'yuliana.mendoza'@'%';
SET DEFAULT ROLE 'superadmin' TO 'yuliana.mendoza'@'%';
GRANT 'seller' TO 'hector.morales'@'%';
SET DEFAULT ROLE 'seller' TO 'hector.morales'@'%';
GRANT 'seller' TO 'sharely.gonzalez'@'%';
SET DEFAULT ROLE 'seller' TO 'sharely.gonzalez'@'%';

/* VERIFICAR LOS USUARIOS REMOTOS */
SELECT user,host FROM mysql.user WHERE host='%';
/* VERIFICAR LOS ROLES ASIGNADOS */
SELECT FROM_USER AS Rol,FROM_HOST AS Host_Rol,TO_USER AS Usuario,TO_HOST AS Host_Usuario FROM mysql.role_edges ORDER BY FROM_USER,TO_USER;
