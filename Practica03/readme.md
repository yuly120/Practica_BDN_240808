# Práctica 03: Manipulación de Datos, Relaciones, Procedimientos, Funciones y Eventos en Conexiones Remotas

- **Asignatura:** Bases de Datos en la Nube
- **Docente:** M.T.I. Marco A. Ramírez Hernández
- **Alumna:** Yuliana Mendoza
- **Matrícula:** 240808
- **Base de Datos:** `db_test` (MySQL 8.0 / InnoDB en VPS `179.236.78.124`)

---

## Estructura de Entregables en `Practica03`

- `backups/respaldo_0710.sql`: Respaldo completo de la base de datos `db_test` (25 tablas, 72 triggers, vistas y registros poblados).
- `Docs/diccionario_datos_yuliana_mendoza.html`: Diccionario de Datos interactivo y Modelo Entidad-Relación Extendido (MERE) actualizado.
- `scripts/remote_users_privileges.sql`: Configuración de los 7 roles del sistema (`superadmin`, `admin`, `support`, `seller`, `buyer`, `common_user`, `user_not_registered`), cuentas remotas y privilegios.
- `queries/consultas_verificacion.sql`: Consultas SQL de auditoría, conteo de objetos, distribución demográfica de los 7,500 usuarios, validación de productos e integridad referencial.
- `seeds/`: Archivos CSV utilizados para la población inicial de categorías y catálogo de productos.

---

## Matriz de Usuarios y Roles Configurados

| Usuario | Nombre Completo | Rol Asignado | Rol MySQL |
| :--- | :--- | :--- | :--- |
| `yuliana_mendoza` | Yuliana Mendoza | Super Admin | `superadmin` / `rol_admin` |
| `marco_ramirez` | Marco Ramírez | Admin | `admin` / `rol_admin` |
| `hector_morales` | Héctor Morales | Seller | `seller` / `rol_vendedor` |
| `oscar_sampayo` | Óscar Sampayo | Seller | `seller` / `rol_vendedor` |
| `sharely_velazquez` | Sharely Velázquez | Seller | `seller` / `rol_vendedor` |
| `totis_soto` | Totis Soto | Seller / Support | `seller` / `support` |
| `adrian_rios` | Adrián Ríos | Buyer | `buyer` / `rol_cliente` |
| `app_web` | App Web | System / Buyer | `buyer` / `rol_cliente` |
| `app_movil` | App Móvil | System / Buyer | `buyer` / `rol_cliente` |