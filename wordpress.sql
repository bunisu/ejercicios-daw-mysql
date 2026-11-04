CREATE DATABASE IF NOT EXISTS wordpress;

SHOW DATABASES LIKE 'wordpress';

CREATE USER 'wp_local_user'@'localhost' IDENTIFIED BY 'Local_2026!Demo';

GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_local_user'@'localhost';

CREATE USER 'wp_remote_user'@'%' IDENTIFIED BY 'Remote_2026!Demo';

GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_remote_user'@'%';

CREATE USER 'wp_read_user'@'%' IDENTIFIED BY 'Read_2026!Demo';

GRANT SELECT ON wordpress.* TO 'wp_read_user'@'%';

ALTER USER 'wp_read_user'@'%' IDENTIFIED BY 'ReadNueva_2026!Demo';

GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_read_user'@'%';

REVOKE CREATE, DROP, INSERT, DELETE, UPDATE ON wordpress.* FROM 'wp_read_user'@'%';

SELECT User, Host FROM mysql.user WHERE User IN ('wp_local_user', 'wp_remote_user', 'wp_read_user') 
ORDER BY User, Host;

SHOW GRANTS FOR 'wp_read_user'@'%';

DROP USER 'wp_read_user'@'%';

SELECT User, Host FROM mysql.user WHERE User = 'wp_read_user';

USE wordpress;

CREATE TABLE IF NOT EXISTS prueba_roles (id INT PRIMARY KEY, nombre VARCHAR(50));

INSERT INTO prueba_roles (id, nombre) VALUES (1, 'Inicial') ON DUPLICATE KEY UPDATE nombre = 'Inicial';

CREATE ROLE 'rol_admin', 'rol_lector', 'rol_modificador';

GRANT ALL PRIVILEGES ON *.* TO 'rol_admin';

GRANT SELECT ON *.* TO 'rol_lector';

GRANT INSERT, UPDATE, DELETE ON *.* TO 'rol_modificador';

CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'Admin_2026!Demo';

GRANT 'rol_admin' TO 'administrador'@'localhost';

CREATE USER 'lector1'@'localhost' IDENTIFIED BY 'Lector1_2026!Demo';

CREATE USER 'lector2'@'localhost' IDENTIFIED BY 'Lector2_2026!Demo';

GRANT 'rol_lector' TO 'lector1'@'localhost', 'lector2'@'localhost';

CREATE USER 'modificador1'@'localhost' IDENTIFIED BY 'Mod1_2026!Demo';

CREATE USER 'modificador2'@'localhost' IDENTIFIED BY 'Mod2_2026!Demo';

GRANT 'rol_modificador' TO 'modificador1'@'localhost', 'modificador2'@'localhost';

SET DEFAULT ROLE 'rol_admin' TO 'administrador'@'localhost';

SET DEFAULT ROLE 'rol_lector' TO 'lector1'@'localhost', 'lector2'@'localhost';

SET DEFAULT ROLE 'rol_modificador' TO 'modificador1'@'localhost', 'modificador2'@'localhost';


-- En otra terminal: mysql -u lector1 -p -h localhost

SELECT * FROM wordpress.prueba_roles;

UPDATE wordpress.prueba_roles SET nombre = 'Cambio lector' WHERE id = 1;

-- Como administrador:

REVOKE DELETE ON *.* FROM 'rol_modificador';

-- En una sesión nueva: mysql -u modificador2 -p -h localhost

DELETE FROM wordpress.prueba_roles WHERE id = 1;

-- Como cuenta con permisos de administración:

DROP ROLE 'rol_admin', 'rol_lector', 'rol_modificador';

-- En una nueva sesión: mysql -u administrador -p -h localhost

SELECT * FROM wordpress.prueba_roles;
