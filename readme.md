# 🗄️ Portafolio de Prácticas - Bases de Datos en la Nube (`db_test`)

**Estudiante:** Yuliana Mendoza (Matrícula: 240808)  
**Periodo:** Septiembre - Diciembre 2026  
**Motor de Base de Datos:** MySQL 8.0 (Engine: InnoDB)  

---

## 📋 Tabla de Prácticas de la Materia

| No | Nombre | Descripción | Potenciador | Estado | Acceso Directo |
| :---: | :--- | :--- | :---: | :---: | :---: |
| 1 | Metodología de Evaluación de la Materia | Transcribir en libreta y comprender la metodología y fechas de evaluación de la asignatura. | 5 | 🟢 Concluida | [Ver Carpeta](./Practica01) |
| 2 | Conexiones remotas para bases de datos SQL | Crear y administrar usuarios y privilegios para conexiones desde internet o redes locales. | 60 | 🟢 Concluida | [Ver Carpeta](./Practica02) |
| 3 | Manipulación de Datos, Relaciones, Procedimientos, Funciones y Eventos en Conexiones Remotas | Implementación de BD E-Commerce (`db_test`) en VPS con 25 tablas, 72 activadores, 25+ vistas, 7 roles remotos, procedimientos parametrizables, simulación masiva (7,500 usuarios y +7,000 productos), respaldos y documentación. | 100 | 🟢 Concluida | [Ver Carpeta](./Practica03) • [Diccionario Web](https://yuly120.github.io/Practica_BDN_240808/Practica03/Docs/diccionario.html) |

---

## 📌 1. Descripción General de la Práctica 03 (`db_test`)

El propósito de esta práctica fue diseñar, normalizar, poblar y auditar una base de datos relacional completa orientada a una plataforma de comercio electrónico (*E-commerce*) desplegada en un servidor remoto (**VPS**). El esquema integra entidades para la gestión de usuarios, catálogos de productos, carritos de compra, transacciones financieras, métodos de pago, envíos, control de acceso por roles y un sistema automatizado de **auditoría y trazabilidad**.

### Objetivos Clave:
- Modelar una arquitectura relacional sólida hasta **3ra Forma Normal (3FN)**.
- Administrar seguridad y control de acceso mediante **7 roles remotos** con privilegios específicos.
- Implementar mecanismos automatizados de auditoría mediante **Triggers DML** (`INSERT`, `UPDATE`, `DELETE`).
- Automatizar lógica de negocio con **Procedimientos Almacenados parametrizables, Funciones y Eventos**.
- Construir una herramienta web interactiva para explorar el **Diccionario de Datos** hospedado en GitHub Pages.

---

## 🛠️ 2. Actividades Realizadas

1. **Diseño Estructurado de Entidades (25 Tablas Físicas):**
   * Creación de tablas primarias y relacionales con integridad referencial (`FOREIGN KEY`), claves primarias (`PRIMARY KEY`) y restricciones de unicidad (`UNIQUE KEY`).
2. **Automatización de Auditoría (72 Activadores / Triggers):**
   * Programación de disparadores (`AFTER INSERT`, `AFTER UPDATE`, `AFTER DELETE`) para registrar movimientos y cambios críticos en bitácora, capturando tabla afectada, operación, usuario de conexión (`USER()`), fecha/hora (`NOW()`) e identificador del registro.
3. **Desarrollo de Vistas (25+ Vistas SQL):**
   * Creación de vistas analíticas y de trazabilidad para consultar resúmenes de inventario, ventas por categoría y cruzamiento de auditoría sin exponer directamente las tablas base.
4. **Programación en Servidor y Simulación Masiva:**
   * Implementación de procedimientos almacenados parametrizables, funciones y eventos programados para poblar y simular carga real con **7,500 usuarios** y **+7,000 productos**, además de respaldos SQL y exportación del diccionario interactivo.

---

## 📊 3. Métricas y Resultados del Esquema `db_test`

| Métrica | Cantidad / Valor | Descripción |
| :--- | :---: | :--- |
| **Tablas Físicas** | `25` | Estructuras relacionales bajo motor InnoDB |
| **Activadores (Triggers)** | `72` | Auditoría y reglas automáticas sobre operaciones DML |
| **Vistas SQL** | `25+` | Consultas analíticas y vistas de trazabilidad |
| **Roles Remotos** | `7` | Perfiles de seguridad y permisos diferenciados en VPS |
| **Volumen Simulado** | `+14,500 registros` | 7,500 usuarios y +7,000 productos generados |
| **Forma Normal** | `3FN` | Integridad referencial y cero redundancia |

---

## 📂 4. Estructura del Repositorio

```text
Practica_BDN_240808/
 ├── Practica01/                      # Metodología de evaluación
 ├── Practica02/                      # Conexiones remotas, usuarios y privilegios SQL
 ├── Practica03/                      # Proyecto integral E-Commerce (db_test)
 │    ├── backups/                    # Respaldos SQL de estructura y datos
 │    ├── Docs/
 │    │    └── diccionario.html       # Diccionario de Datos interactivo (GitHub Pages)
 │    └── scripts/                    # Scripts DDL, DML, triggers, vistas, SP y roles
 └── README.md                        # Documentación principal del repositorio