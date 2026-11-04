-- APUNTES DDL

-- MUESTRA TODAS LAS BASE DE DATOS EXISTEN EN EL SERVIDOR
SHOW DATABASES;

-- CREA UNA BASE DE DATOS LLAMADO EJEMPLO2 CON EL JUEGO DE CARACTERES UTF8
CREATE DATABASE EJEMPLO2 CHARACTER SET UTF8;
-- SELECCIONA LA BASE DE DATOS EJEMPLO2
USE ejemplo2;

-- MUESTRA LOS VALORES DE LAS VARIABLES DEL SISTEMA CHARACTER_SET_DATABASE Y COLLATION_DATABASE
-- ESTAS VARIABLES MUESTRAN EL CÓDIGO DE CARACTERES Y EL COTEJAMIENTO QUE USA LA BASE DE DATOS
SELECT @@character_set_database, @@collation_database;

-- VISUALIZA LA SENTENCIA SQL QUE CREÓ LA BASE DE DATOS EJEMPLO2
SHOW CREATE DATABASE ejemplo2;

-- BORRA LA BASE DE DATOS PROVEEDORES SI EXISTE
DROP DATABASE IF EXISTS proveedores;

-- CREA LA BASE DE DATOS PROVEEDORES CON EL JUEGO DE CARACTERES UTF8MB4
CREATE DATABASE proveedores CHARSET utf8mb4;

-- SELECCIONA LA BASE DE DATOS PROVEEDORES
USE proveedores;

-- CREA LA TABLA CATEGORÍA 
create table categoria (
	-- la columna id es una clave primaria entera sin signo son autoincremento
    id INT UNSIGNED auto_increment PRIMARY KEY,
    -- la columna nombre es un varchar de longitud 100 que no admite valores nulos
    nombre varchar(100) not null
    );
    
    create table pieza (
    -- la columna id es una clave primaria entera sin signo con autoincrento
    id INT UNSIGNED auto_increment PRIMARY KEY,
    -- la columna nombre es un varchar de longitud 100 que no admite valores nulos
    nombre varchar(100) not null,
    -- la columna color es un varchar de longitud 50 que no admite valores nulos
    color varchar(50) not null,
    -- la columna precio guarda cvalores deimales de 7 dígitos en total y 2 decimales.
    -- No admite valores nulos y estos valores serán mayores que 0.
    precio DECIMAL(7,2) NOT NULL CHECK (precio > 0),
    -- la columna id_catrgoria almacenará valores enteros sin signo.
    -- no admite valores nulos
    id_categoria int unsigned not null,
    -- la columna id_columna es una clave foranea que referencia a la columna id de la tablacategoría,
    -- que es clave primaria
    foreign key (id_categoria) references categoria(id)
    );
    
    insert into categoria (nombre) values ("herramientas");
    select  * from categoria;
    
 insert into pieza (nombre, color, precio, id_categoria) values ("martillo", "negro", "10.00", 1);
     select  * from pieza;

-- se crea la base de datos de una agencia de viajes
drop database if exists agencia;
create database agencia charset utf8mb4;
use agencia;

create table turista (
id int unsigned auto_increment primary key,
nombre varchar(50) not null,
apellidos varchar(100) not null,
direccion varchar(100) not null,
telefono varchar(9) not null
);

insert into turista ( nombre, apellidos, direccion, telefono) values ("PEPE", " MARTIN MARTIN", "CALLE VERNE 29300", "653028947"),
("PACA", "GOMEZ", "CALLE SUAREZ 28897", "666023478");
     select  * from turista;
     
create table hotel (
id int unsigned auto_increment primary key,
nombre varchar(50) not null,
direccion varchar(100) not null,
ciudad varchar(25) not null,
plazas int unsigned not null default 0,
telefono varchar(9) not null

);

  insert into hotel ( nombre, direccion, ciudad, plazas, telefono) values ("RIU", "CARIHUELA", "TORREMOLINOS", 100, 698430245),
  ("PEZ ESPADA", "CARIHUELA", "TORREMOLINOS", "300", 634525689);

 select  * from  hotel;
 
 create table reserva (
 id_turista int unsigned not null,
 id_hotel int unsigned not null,
 fecha_entrada datetime not null,
 fecha_salida datetime not null,
 regimen enum('MP', 'PC'),
 primary key (id_turista, id_hotel),
 foreign key (id_turista) references turista(id) ,
 foreign key (id_hotel) references hotel(id)
 );
 select  * from  reserva;
 
 insert into reserva ( id_turista, id_hotel,  fecha_entrada, fecha_salida ,  regimen) values (1, 1, "2026-02-14 12:30", "2026-02-20 12:00", 'MP'),
 (2, 2, "2026-08-05 13:30", "2026-08-10 13:30 ", 'PC');
 
  select  * from reserva;
  -- BASE DE DATOS AGENCIA CON LA OPCIÓN DE "ON DELETE" EN LAS CLAVES FORÁNEAS
  drop database if exists agencia;
create database agencia charset utf8mb4;
use agencia;
  create table turista (
id int unsigned auto_increment primary key,
nombre varchar(50) not null,
apellidos varchar(100) not null,
direccion varchar(100) not null,
telefono varchar(9) not null
);

insert into turista ( nombre, apellidos, direccion, telefono) values ("PEPE", " MARTIN MARTIN", "CALLE VERNE 29300", "653028947"),
("PACA", "GOMEZ", "CALLE SUAREZ 28897", "666023478");
     select  * from turista;
     
create table hotel (
id int unsigned auto_increment primary key,
nombre varchar(50) not null,
direccion varchar(100) not null,
ciudad varchar(25) not null,
plazas int unsigned not null default 0,
telefono varchar(9) not null

);

  insert into hotel ( nombre, direccion, ciudad, plazas, telefono) values ("RIU", "CARIHUELA", "TORREMOLINOS", 100, 698430245),
  ("PEZ ESPADA", "CARIHUELA", "TORREMOLINOS", "300", 634525689);

 select  * from  hotel;
 
 create table reserva (
 id_turista int unsigned not null,
 id_hotel int unsigned not null,
 fecha_entrada datetime not null,
 fecha_salida datetime not null,
 regimen enum('MP', 'PC'),
 primary key (id_turista, id_hotel),
 foreign key (id_turista) references turista(id) on delete cascade,
 foreign key (id_hotel) references hotel(id) on delete cascade
 );
 select  * from  reserva;
 
 insert into reserva ( id_turista, id_hotel,  fecha_entrada, fecha_salida ,  regimen) values (1, 1, "2026-02-14 12:30", "2026-02-20 12:00", 'MP'),
 (2, 2, "2026-08-05 13:30", "2026-08-10 13:30 ", 'PC');
 
  select  * from reserva;
  
  -- se crea la base de datos de una agencia de viajes
drop database if exists agencia;
create database agencia charset utf8mb4;
use agencia;

create table turista (
id int unsigned auto_increment primary key,
nombre varchar(50) not null,
apellidos varchar(100) not null,
direccion varchar(100) not null,
telefono varchar(9) not null
);

insert into turista ( nombre, apellidos, direccion, telefono) values ("PEPE", " MARTIN MARTIN", "CALLE VERNE 29300", "653028947"),
("PACA", "GOMEZ", "CALLE SUAREZ 28897", "666023478");
     select  * from turista;
     
create table hotel (
id int unsigned auto_increment primary key,
nombre varchar(50) not null,
direccion varchar(100) not null,
ciudad varchar(25) not null,
plazas int unsigned not null default 0,
telefono varchar(9) not null

);

  insert into hotel ( nombre, direccion, ciudad, plazas, telefono) values ("RIU", "CARIHUELA", "TORREMOLINOS", 100, 698430245),
  ("PEZ ESPADA", "CARIHUELA", "TORREMOLINOS", "300", 634525689);

 select  * from  hotel;
 
 create table reserva (
 id_turista int unsigned not null,
 id_hotel int unsigned not null,
 fecha_entrada datetime not null,
 fecha_salida datetime not null,
 regimen enum('MP', 'PC'),
 primary key (id_turista, id_hotel),
 foreign key (id_turista) references turista(id) on delete cascade,
 foreign key (id_hotel) references hotel(id) on delete cascade
 );
 select  * from  reserva;
 
 insert into reserva ( id_turista, id_hotel,  fecha_entrada, fecha_salida ,  regimen) values (1, 1, "2026-02-14 12:30", "2026-02-20 12:00", 'MP'),
 (2, 2, "2026-08-05 13:30", "2026-08-10 13:30 ", 'PC');
 
  select  * from reserva;
  -- BASE DE DATOS AGENCIA CON LA OPCIÓN DE "ON SET NULL" EN LAS CLAVES FORÁNEAS
  drop database if exists agencia;
create database agencia charset utf8mb4;
use agencia;
  create table turista (
id int unsigned auto_increment primary key,
nombre varchar(50) not null,
apellidos varchar(100) not null,
direccion varchar(100) not null,
telefono varchar(9) not null
);

insert into turista ( nombre, apellidos, direccion, telefono) values ("PEPE", " MARTIN MARTIN", "CALLE VERNE 29300", "653028947"),
("PACA", "GOMEZ", "CALLE SUAREZ 28897", "666023478");
     select  * from turista;
     
create table hotel (
id int unsigned auto_increment primary key,
nombre varchar(50) not null,
direccion varchar(100) not null,
ciudad varchar(25) not null,
plazas int unsigned not null default 0,
telefono varchar(9) not null

);

  insert into hotel ( nombre, direccion, ciudad, plazas, telefono) values ("RIU", "CARIHUELA", "TORREMOLINOS", 100, 698430245),
  ("PEZ ESPADA", "CARIHUELA", "TORREMOLINOS", "300", 634525689);

 select  * from  hotel;
 
 create table reserva (
 id int unsigned auto_increment primary key,
 id_turista int unsigned  ,
 id_hotel int unsigned ,
 fecha_entrada datetime not null,
 fecha_salida datetime not null,
 regimen enum('MP', 'PC'),
unique (id_turista, id_hotel),
 foreign key (id_turista) references turista(id) on  delete set NULL,
 foreign key (id_hotel) references hotel(id) on delete SET NULL
 );
 select  * from  reserva;
INSERT INTO reserva (id_turista, id_hotel, fecha_entrada, fecha_salida, regimen) 
VALUES 
  (1, 1, '2026-02-14 12:30:00', '2026-02-20 12:00:00', 'MP'),
  (2, 2, '2026-08-05 13:30:00', '2026-08-10 13:30:00', 'PC');
 
  select  * from reserva;
  
  delete from turista where id = 1;
  delete from hotel where id=1;
  
  -- hemos borrado las tablas turista y reserva--
   drop table agencia.reserva;
   
  drop table agencia.turista;
  
  -- la sentencia alter table permite modificat la estructura de una tabla
  -- se motidifica el tipo de datos de la columna
  alter table hotel modify nombre varchar(30) not null;
 
 -- para mostrar el cambio
  describe hotel;

-- para cambiar el nombre de una celda
alter table hotel change nombre nombre_hotel varchar(30) not null;

alter table hotel change nombre_hotel nombre varchar(30) not null;  

-- Se fija el valor por defecto de la columna regimen en 'MP'
ALTER TABLE reserva ALTER regimen SET DEFAULT 'MP';
describe reserva;

-- Se elimina el valor por defecto de la columna regimen de la tabla reserva
ALTER TABLE reserva ALTER regimen DROP DEFAULT;
describe reserva;

-- Se añade una columna nueva a la tabla hotel
ALTER TABLE hotel ADD num_estrellas int check (num_estrellas > 0 and num_estrellas <=5);
describe hotel;

insert hotel(nombre, direccion, ciudad, plazas, telefono, num_estrellas)
values ("Gran Hotel Miramar GL", "P.º Reding, 22, 24, Málaga-Este, 29016 Málaga", "Málaga", "80", 952603000, 4);

-- se borra la columna num_estrellas de la tabla hotel
alter table hotel drop num_estrellas;

-- Se añade una columna nueva a la tabla hotel despues de nombre
ALTER TABLE hotel ADD num_estrellas int check (num_estrellas > 0 and num_estrellas <=5) after nombre;
-- Muestra la estructura de la tabla hotel 
describe hotel;

-- se muestran las tablas de la base de datos
show tables;

-- Muestra la sentencia create table que creó la tabla hotel
show create table hotel;



  
  
  
  
 
 