-- PARTE A – DISEÑO FÍSICO DE BASES DE DATOS (6 puntos)

DROP DATABASE IF EXISTS plataforma_proyectos ;
CREATE DATABASE plataforma_proyectos CHARSET utf8mb4;


USE plataforma_proyectos;

-- 1. Tabla desarrolladores (2 puntos)

CREATE TABLE desarrolladores(
id_desarrollador INT  auto_increment PRIMARY KEY,
usuario VARCHAR(40)   NOT NULL UNIQUE,
email VARCHAR(50) NOT NULL,
fecha_registro DATE NOT NULL,
nivel_experiencia ENUM ('Junior', 'Mid', 'Senior') NOT NULL 
);

-- 2. Tabla proyectos (2 puntos)

CREATE TABLE  proyectos (
id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(100),
fecha_inicio DATE NOT NULL,
fecha_fin DATE,
estado ENUM ('Planificado', 'En desarrollo', 'Finalizado') NOT NULL
);

SHOW  CREATE TABlE desarrolladores;

-- 3. Tabla asignaciones (2 puntos)
CREATE TABLE asignaciones (
    id_asignaciones INT AUTO_INCREMENT PRIMARY KEY,
    id_desarrollador INT NOT NULL,
    id_proyecto INT NOT NULL,
    rol VARCHAR(50) NOT NULL,
    fecha_asignacion DATE NOT NULL UNIQUE,
    CONSTRAINT fk_desarrollador FOREIGN KEY (id_desarrollador) REFERENCES desarrolladores(id_desarrollador),
    CONSTRAINT fk_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyectos(id_proyecto)
);


-- PARTE B – GESTIÓN DE USUARIOS Y ROLES (4 puntos)
--  Crear un usuario llamado proyectos_app que solo pueda conectarse desde localhost y cuya contraseña sea
-- DevPass$2026 (0,5 puntos).
CREATE USER 'proyectos_app '@'localhost' IDENTIFIED BY 'DevPass$2026';

-- 2. Crear un rol llamado rol_lectura con permisos de consulta (SELECT) sobre todas las tablas de la base de
-- datos plataforma_proyectos (1 punto).
CREATE ROLE 'rol_lectura'@'localhost';

GRANT SELECT ON plataforma_proyectos.* TO 'rol_lectura '@'localhost' ;

-- Crear un rol llamado rol_edicion con permisos de inserción y actualización (INSERT, UPDATE) sobre
-- todas las tablas (1 punto).

CREATE ROLE 'rol_edicion '@'localhost' ;
GRANT INSERT, UPDATE ON plataforma_proyectos.* TO 'rol_edicion '@'localhost' ;

-- Asignar ambos roles al usuario proyectos_app y dejar activo por defecto únicamente el rol de lectura (1 


REVOKE INSERT, UPDATE ON plataforma_proyectos.* FROM 'rol_edicion '@'localhost' ;
GRANT SELECT, INSERT, UPDATE ON plataforma_proyectos TO 'proyectos_app '@'localhost';

-- 5. Elimina la cuenta del usuario proyectos_app y todos los roles creados anteriormente (0,5 puntos).

DROP USER 'proyectos_app '@'localhost', 'rol_lectura '@'localhost', 'rol_edicion '@'localhost' ;










