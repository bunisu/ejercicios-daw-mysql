/*****************************
*GESTIÓN DE USUARIOS EN MYSQL *
******************************/

-- Crear una cuenta de usuario llamado miguel con contraseña 1234
CREATE USER IF NOT EXISTS 'miguel'@'localhost' IDENTIFIED BY '1234';
CREATE USER IF NOT EXISTS 'miguel'@'%' IDENTIFIED BY '1234'; -- Cualquier maquina

-- Borrar una cuenta de usuario
DROP USER IF  EXISTS 'miguel'@'localhost';

-- Consultar las cuentas de usuarios creadas en el servidor
SELECT user, host FROM mysql.user;

-- Para dar privilegios incluido "GRANT OPTION" para que pueda dar permisos
GRANT ALL PRIVILEGES ON world.* TO 'miguel'@'localhost' WITH GRANT OPTION ;

-- Revocar privilegios 
REVOKE SELECT, INSERT, UPDATE, DELETE   ON world.* FROM 'miguel'@'localhost' ;
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'miguel'@'localhost';

-- Creamos un usuario y le asignamos los permisos de lectura, inserción, actualización y borrado de registros de las tablas de world
-- y borrado de registros de las tablas de world
DROP USER IF EXISTS 'antonio'@'localhost';
CREATE USER 'antonio'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE   ON world.* TO 'antonio'@'localhost';
-- Vamos a asignar el permiso select sobre la tabla empleado de la base  de 
GRANT SELECT ON world.country TO 'antonio'@'localhost';

-- Vamos a eliminar el permiso de lectura sobre la tabla de empleado de la base de
REVOKE SELECT ON worl.empleado FROM 'antonio'@'localhost';

-- Refrescamos los privilegios si queremos que se apliquen los cambios inmediatamente 
FLUSH PRIVILEGES;

-- Creamos un usuario llamado pepe
DROP USER IF EXISTS 'pepe'@'localhost';
CREATE USER 'pepe'@'localhost' IDENTIFIED BY '1234';

-- Podra dar permiso a otros usuarios  y solo podra hacer select soble la tabla city de la base de datos world  y podra asignar perimisos a otros usuarios 
GRANT SELECT    ON world.city TO 'pepe'@'localhost'  WITH GRANT OPTION ;

-- Para eliminar el permiso de lectura sobre la tbala country de la base de datos world
REVOKE SELECT, INSERT, UPDATE, DELETE   ON world.country FROM 'antonio'@'localhost';

-- Vamos asignar  en especifico el permiso que queremos eliminar 
REVOKE SELECT ON world.country FROM 'antonio'@'localhost';

-- Mostrar los permisos que tiene el usuario
SHOW GRANTS FOR 'antonio'@'localhost';

/*********************************************************************************************************************

/********************************
*GESTIOÓN DE ROLES               *
*********************************/

-- Vamos a crear  tres roles: rol_lectura_escritura, rol_lectura y rol_escritura
DROP ROLE IF  EXISTS 'rol_lectura_escritura', 'rol_lectura', 'rol_escritura';
CREATE ROLE 'rol_lectura_escritura', 'rol_lectura', 'rol_escritura';


-- Vamos a asignar los privilegios que tendrá cada rol y sobre qué base de datos tendrá estos privilegios
GRANT ALL ON world.* TO 'rol_lectura_escritura';
GRANT SELECT ON world.* TO 'rol_lectura';
GRANT INSERT, UPDATE, DELETE ON world.* TO 'rol_escritura';

-- Creamos usuarios
DROP USER IF EXISTS 'admin'@'localhost';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password1';

DROP USER IF EXISTS 'usuario_lectura1'@'localhost';
CREATE USER 'usuario_lectura1'@'localhost' IDENTIFIED BY 'password2';

DROP USER IF EXISTS 'usuario_lectura2'@'localhost';
CREATE USER 'usuario_lectura2'@'localhost' IDENTIFIED BY 'password2';

DROP USER IF EXISTS 'usuario_escritura1'@'localhost';
CREATE USER 'usuario_escritura1'@'localhost' IDENTIFIED BY 'password4';










