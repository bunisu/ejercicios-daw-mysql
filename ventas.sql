drop database if exists ventas;
create database ventas character set latin1;
use ventas;

create table cliente (
id int unsigned auto_increment primary key,
nombre varchar(25),
primer_apellido varchar(15) not null,
ciudad varchar(100),
categoria int unsigned
);

create table comercial (
id int unsigned auto_increment primary key,
nombre varchar(100) not null,
apellido1 varchar(100) not null,
apellido2 varchar(100),
ciudad varchar(100),
comision float
);

-- una vez que ha ejecutado el script y ha creado la base de datos en MySQL, ¿qué sentencia SQL
-- debería ejecutar para modificar el encoding de la base de datos y utilizar utf8mb4 en lugar de latin 1?
alter database ventas character set utf8mb4;
show create database ventas;
-- Modifica la columna nombre de la tabla cliente para que pueda almacenar cadenas hasta de 100 
-- caracteres y para que no pueda ser null.

alter table cliente  modify nombre varchar (100) not null;
show create table cliente;
