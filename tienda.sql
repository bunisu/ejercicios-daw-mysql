-- 1. Creación e inicio de la base de datos
CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- 2. Creación de tablas sin claves 
CREATE TABLE clientes ( 
    id_cliente INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT NOT NULL,
    fecha DATE NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    id_cliente INT NOT NULL
);

-- 3. Añadir claves CON CONSTRAINT (con nombre explícito)
ALTER TABLE clientes
ADD CONSTRAINT pk_clientes PRIMARY KEY (id_cliente);

ALTER TABLE pedidos
ADD CONSTRAINT pk_pedidos PRIMARY KEY (id_pedido);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_clientes
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente);

-- =============================================================
-- PASO A: ELIMINAR LAS CONSTRAINTS
-- ===================================================================

-- 1. Eliminar primero la clave foránea
ALTER TABLE pedidos
DROP FOREIGN KEY fk_pedidos_clientes;

-- 2. Eliminar las claves primarias
ALTER TABLE clientes
DROP PRIMARY KEY;

ALTER TABLE pedidos
DROP PRIMARY KEY;

-- =============================================================
-- B. AÑADIR LAS CLAVES SIN LA PALABRA CLAVE 'CONSTRAINT'
-- ===================================================================

-- 1. Añadir claves primarias directamente
ALTER TABLE clientes
ADD PRIMARY KEY (id_cliente);

ALTER TABLE pedidos
ADD PRIMARY KEY (id_pedido);

-- 2. Añadir clave foránea directamente (el motor genera un nombre interno automáticamente)
ALTER TABLE pedidos
ADD FOREIGN KEY (id_cliente) 
REFERENCES clientes(id_cliente);