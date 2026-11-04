SELECT @@GLOBAL.sql_mode;
 SELECT @@SESSION.sql_mode;
 
 
 create database tipo_de_datos;
 
 use tipo_de_datos;
 
 create table test (data tinyint unsigned);
 
 set sql_mode = '';
 
 insert into test values(256);
 
  set sql_mode = ' mode';
    set sql_mode = ' modes';