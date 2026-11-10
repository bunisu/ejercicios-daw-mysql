-- Sohaila Sara Chelbat Peral

-- Parte A 
-- Crea base de datos sistema_bibloteca
CREATE DATABASE  sistema_biblioteca  CHARACTER SET UTF8;

use sistema_biblioteca;

-- Tabla socios
 CREATE TABLE  socios (
 id_socios INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 dni CHAR(9) NOT NULL UNIQUE,
 fecha_alta DATE NOT NULL,
 tipo_socio ENUM ('Infantil, Adulto, Senior') NOT NULL
 );
 
 
 -- Tabla libros
 CREATE TABLE libros(
 id_libros INT AUTO_INCREMENT PRIMARY KEY,
 titulo VARCHAR(100) NOT NULL,
 autor VARCHAR(100) NOT NULL,
 isbn CHAR(13) UNIQUE,
 fecha_publicacion YEAR,
 estado ENUM('Disponible, Pretado, Extraviado') NOT NULL
 );
 
 -- Tabla prestamos
 CREATE TABLE prestamos(
 id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
 id_socio  INT AUTO_INCREMENT PRIMARY KEY,
 id_libro INT AUTO_INCREMENT PRIMARY KEY,
     CONSTRAINT fk_id_socio FOREIGN KEY (id_socio) REFERENCES socios(id_socio),
    CONSTRAINT fk_id_libro FOREIGN KEY (id_libro) REFERENCES libros(id_libro),
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE
    );
    
    -- Parte B 
    
    -- Crear usuario
 CREATE USER 'biblioteca_app'@'localhost' IDENTIFIED BY 'LibPass$2026';
 

-- Crear rol y dar permisos
CREATE ROLE rol_consulta;
GRANT SELECT ON sistema_biblioteca.* TO rol_consulta ;

-- Crear rol y dar permisos 
CREATE ROLE rol_gestion;
GRANT INSERT, UPDATE ON sistema_biblioteca.* TO rol_gestion  ;

-- Asignar ambos roles 
GRANT rol_consulta, rol_gestion TO 'biblioteca_app'@'localhost' ;

SET DEFAULT ROLE rol_consulta TO 'biblioteca_app'@'localhost';
-- Eliminar 
DROP USER 'biblioteca_app'@'localhost';
DROP ROLE rol_consulta;
DROP ROLE rol_gestion;


