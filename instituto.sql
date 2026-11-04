-- Sohaila Sara Chelbat Peral
-- BLOQUE 1: Base de Datos «Instituto»
-- 1. Creación e Inicialización de la Base de Datos

-- 1.1. Borrado previo:
DROP DATABASE IF EXISTS instituto;

-- 1.2. Creación de la base de datos:
CREATE DATABASE instituto CHARSET utf8mb4;

-- 1.3. Selección de la base de datos:
USE instituto;

-- 2. Creación de Tablas y Restricciones de Integridad

-- 2.1. Tabla `profesores`:
CREATE TABLE profesores(
dni CHAR(9) PRIMARY KEY,
nombre VARCHAR(40) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(15) NOT NULL
);

-- 2.2. Tabla `modulos`:
CREATE TABLE modulos (
codigo VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(40) NOT NULL,
curso VARCHAR(10) NOT NULL,
DNI_profesor CHAR(9),
CONSTRAINT dni_profesor_fk FOREIGN KEY (DNI_profesor) 
REFERENCES profesores(dni)
);

-- 2.3. Tabla `alumnos`:
CREATE TABLE alumnos (
n_exp VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(40) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
fecha_nac DATE NOT NULL,
n_exp_delegado VARCHAR(10),
grupo VARCHAR(10) NOT NULL,
CONSTRAINT n_exp_delegado_fk FOREIGN KEY  (n_exp_delegado) 
REFERENCES alumnos(n_exp)
);

-- 2.4. Tabla `matriculaciones`:
CREATE TABLE matriculaciones (
n_exp_alumno VARCHAR(10),
codigo_modulo VARCHAR(10) NOT NULL,
PRIMARY KEY (n_exp_alumno, codigo_modulo),
FOREIGN KEY (n_exp_alumno) REFERENCES alumnos(n_exp),
FOREIGN KEY (codigo_modulo) REFERENCES modulos(Codigo)
);

--  3. Modificación de Estructura y Definición de Tipos (ALTER TABLE)

-- 3.1. Eliminación de Clave Foránea en `modulos`:
ALTER TABLE modulos DROP FOREIGN KEY dni_profesor_fk;

-- 3.2. Eliminación de Clave Primaria en `modulos`:
SHOW CREATE TABLE matriculaciones;
ALTER TABLE matriculaciones DROP FOREIGN KEY matriculaciones_ibfk_2;
ALTER TABLE modulos DROP PRIMARY KEY ;

-- 3.3. Modificación de Tipo de Dato en `modulos`:
ALTER TABLE modulos MODIFY codigo INT(4) ZEROFILL;
DESCRIBE modulos;

-- 3.4. Redefinición de Clave Primaria en `modulos`: 
ALTER TABLE modulos ADD PRIMARY KEY (codigo);

-- 3.5. Recreación de Clave Foránea en `modulos`:
ALTER TABLE modulos ADD CONSTRAINT dni_profesor_fk 
FOREIGN KEY (DNI_profesor) REFERENCES profesores(dni);

-- 3.6. Ajuste de Clave Foránea en `matriculaciones`:
ALTER TABLE matriculaciones
MODIFY codigo_modulo INT(4) ZEROFILL NOT NULL;
DESCRIBE matriculaciones;

-- 3.7. Creación de Clave Foránea en `matriculaciones`:
ALTER TABLE matriculaciones ADD CONSTRAINT Codigo_modulo_fk 
FOREIGN KEY (codigo_modulo) REFERENCES modulos(codigo);

-- BLOQUE 2: Sentencias ALTER TABLE

-- 1. Creación e Inicialización de la Base de Datos

-- 1.1. Borrado previo:
DROP DATABASE IF EXISTS ejemplos_alter;

-- 1.2. Creación de la base de datos:
CREATE DATABASE ejemplos_alter CHARSET utf8mb4;

-- 1.3. Selección de la base de datos:
USE ejemplos_alter;

-- 2. Creación de la Tabla Inicial

-- 2.1. Tabla `usuario`:
CREATE TABLE usuario(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_de_usuario VARCHAR(25),
rol ENUM ('Estudiante', 'Profesor') NOT NULL 
);

-- 3. Modificación y Renombrado de Columnas

-- 3.1. Modificación de Tipo y Restricción: 
ALTER TABLE usuario
MODIFY nombre_de_usuario VARCHAR(50) NOT NULL;
DESCRIBE usuario;

-- 3.2. Renombrado de Columna: 
ALTER TABLE usuario CHANGE nombre_de_usuario nombre
VARCHAR(50) NOT NULL;

-- 4. Gestión de Valores por Defecto (DEFAULT)

-- 4.1. Asignación de Valor por Defecto:
ALTER TABLE usuario ALTER COLUMN rol SET DEFAULT 'Profesor';

-- 4.2. Eliminación de Valor por Defecto:
ALTER TABLE usuario ALTER COLUMN rol DROP DEFAULT;

-- 5. Adición y Posicionamiento de Columnas

-- 5.1. Añadir fecha de nacimiento:
ALTER TABLE usuario ADD fecha_nac DATE;

-- 5.2. Añadir primer apellido con posición específica:
ALTER TABLE usuario ADD apellido1 VARCHAR(50) AFTER nombre;

-- 5.3. Añadir segundo apellido con posición específica:
ALTER TABLE usuario ADD apellido2 VARCHAR(50) AFTER apellido1;

-- 6. Eliminación de Columnas y Consultas de Catálogo DDL

-- 6.1. Eliminación de Columna:
ALTER TABLE usuario DROP COLUMN fecha_nac;

-- 6.2. Inspección de Estructura:
DESCRIBE usuario;

-- 6.3. Listado de Tablas:
SHOW TABLES;

-- 6.4. Consulta de Sentencia de Creación:
SHOW CREATE TABLE usuario;
 
 
 
 
 
 





