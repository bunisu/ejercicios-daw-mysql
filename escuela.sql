DROP DATABASE IF EXISTS escuela;
CREATE DATABASE escuela CHARACTER SET utf8mb4;
USE escuela;

CREATE TABLE alumno (
    id_alumno INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    curso VARCHAR(10) NOT NULL
);

INSERT INTO alumno (nombre, apellidos, curso) VALUES 
("Ana", "Pérez López", "1ºESO"),
("Juan", "Torres Ruíz", "1ºESO"),
("Lucía", "Martínez Gil", "2ºESO");

CREATE TABLE profesores (
    id_profesores INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);

INSERT INTO profesores (id_profesores, nombre, apellidos, especialidad) VALUES 
(10, "María", "Gómez Castro", "Matemáticas"),
(11, "José", "Romero Díaz", "Historia");

CREATE TABLE alumno_profesor (
    id_profesor INT UNSIGNED,
    id_alumno INT UNSIGNED,
    asignatura VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_alumno, id_profesor, asignatura),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesores)
);

INSERT INTO alumno_profesor (id_profesor, id_alumno, asignatura) VALUES 
(10, 1, 'Matemáticas'),
(10, 2, 'Matemáticas'),
(11, 1, 'Historia'),
(11, 3, 'Historia');

Select * from alumno_profesor; 
SHOW TABLES;

CREATE TABLE alumno_profesor_2 (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_profesor INT UNSIGNED,
    id_alumno INT UNSIGNED,
    asignatura VARCHAR(50) NOT NULL,
    UNIQUE (id_alumno, id_profesor),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesores)
);

INSERT INTO alumno_profesor_2 (id_profesor, id_alumno, asignatura) VALUES 
(10, 1, 'Matemáticas'),
(10, 2, 'Matemáticas'),
(11, 1, 'Historia'),
(11, 3, 'Historia');

Select * from alumno_profesor_2;                      