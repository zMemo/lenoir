SHOW DATABASES;
--DROP DATABASE compra_on;

/*
AMBC -> Alta   , Baja(eliminar),    Modificación, Consulta
CRUD -> Create , Delete        ,    Update      , Read
.............................................................
*/
-- ==============================================
-- USUARIO
-- ==============================================

-- Proceso: Alta de usuario -> altaUsuario();
INSERT INTO usuario
    (id, nombre, apellido, email, dni, direccion)
    VALUES 
    (NULL,'Lucina', 'Laurens Padovano', 'lulaupa@gmail.com', 65464464, 'Calle 123'),
    (NULL,'Roque', 'Perez','perez_roque@gmail.com', 11501453,  'Av Córdoba 4202.Caba');

INSERT INTO usuario
    (id, nombre, apellido, email, dni, direccion)
    VALUES 
    (NULL,'Carlitos', 'Bala, 'ehhapepe@gmail.com', 6669999, 'La salada 1234')


-- Proceso: Consultar Usuarios -> consultarUsuarios()
select * FROM usuario;


-- ==============================================
-- ESTADO de producto
-- ==============================================
-- Proceso: Alta de estado -> altaEstado();

INSERT INTO estado_pro 
(id,nombre)
VALUES
(NULL,'Sin Stock'),
(NULL,'Pausado'),
(NULL,'Disponible'),
(NULL,'Cancelado'),
(NULL,'Baja');

-- Proceso: Consultar Estados de Productos -> consultarEstadosProducto()
SELECT * FROM estado_pro;


-- ==============================================
-- PRODUCTOS 
-- ==============================================

-- Proceso: Alta de producto -> altaProducto();
INSERT INTO  producto 
    (id, codigo, nombre, precio, cantidad, descripcion, id_usuario, id_estado_pro)
VALUES
    (NULL,'12345','Lampaso',200,40,'Cepillo para pisos',12,3),
    (NULL,'45678','El molino',180,30,'Harina000 ',13,3);

INSERT INTO  producto 
    (id, codigo, nombre, precio, cantidad, descripcion, id_usuario, id_estado_pro)
VALUES
    (NULL, 'AXK120RP', 'Harina', 250, 75, 'Trigo 1 kilo', 12, 1),
    (NULL, 'WER678BG', 'Yerba', 750, 80, 'Suave 1/2 kilo', 13, 1), 
    (NULL, 'UYT754CV', 'Azúcar', 100, 250, 'Ultra refinada. 1 kilo', 11, 1);


-- Proceso: Consultar Productos -> consultarProducto()
SELECT * FROM producto;

-- Consulta de un producto específico
SELECT * FROM producto WHERE id=1;
-- Consulta del stock de un producto específico(ej: id=1)
SELECT cantidad FROM producto WHERE id=1;

-- Actualización del stock
-- https://www.w3schools.com/mysql/mysql_update.asp
    -- UPDATE table_name
    -- SET column1 = value1, column2 = value2, ...
    -- WHERE condition;

-- Descuenta en 1 el stock
UPDATE producto 
SET cantidad= cantidad-1
WHERE id=1;


-- ==============================================
-- ESTADO de operacion
-- ==============================================
-- Proceso: Alta de estado -> altaEstado();

INSERT INTO estado_ope
(id,nombre)
VALUES
(NULL,'enCarrito'),
(NULL,'Comprado'),
(NULL,'Cancelado');

SELECT * FROM estado_ope;


-- ==============================================
-- OPERACION DE COMPRA - VENTA
-- OPERACION - LISTA DE COMPRA - PRODUCTO
-- Se registra la operación de compra-venta
-- 1) Crear la operación (enCarrito / Comprado / cancelado)
-- 2) Cargar los productos en la lista de compra
-- 3) Descontar el stock del producto vendido ( si es comprado Comprado)
-- ==============================================

-- 1) Crear la operación (encarrito / Comprado / cancelado)

        INSERT INTO operacion 
            (id,id_usuario,fechahora,codigopago,total,id_estado_ope)
        VALUES
            (NULL,13,'2022-11-22 14:55:00',NULL,0,1);

        SELECT * FROM operacion;

-- 2) Cargar los productos en la lista de compra 
-- (AQUI está en carrito(chango) id_operacion=1)
        -- preguntar antes si hay stock (lo hacemos en python)
        INSERT INTO listacompra
            (id,id_operacion,cantidad,preciounidad,id_producto)
        VALUES
            (NULL,1,2,(SELECT precio from producto WHERE id=3),3);


    -- preguntar antes si hay stock (lo hacemos en python)
        INSERT INTO listacompra
            (id,id_operacion,cantidad,preciounidad,id_producto)
        VALUES
            (NULL,1,3,(SELECT precio from producto WHERE id=4),4);

        SELECT * FROM listacompra;


-- 3) Descontar el stock del producto vendido ( si es comprado Comprado)
-- (AQUI está en Comprado id_operacion=2)
-- 3A) Descontar del stock de los productos comprados
    SELECT listacompra.cantidad
    FROM operacion
    INNER JOIN listacompra ON operacion.id=listacompra.id_operacion
    WHERE operacion.id=1 and operacion.id_estado_ope=1
    AND listacompra.id_producto=3;

    -- DESCONTAR STOCK DEL PRODUCTO ID=3
    -- 
    UPDATE producto SET cantidad= cantidad-(
        SELECT listacompra.cantidad
            FROM operacion
            INNER JOIN listacompra ON operacion.id=listacompra.id_operacion
            WHERE operacion.id=1 and operacion.id_estado_ope=1
            AND listacompra.id_producto=3) 
    WHERE id=3;
    -- DESCONTAR STOCK DEL PRODUCTO ID=4
    UPDATE producto SET cantidad= cantidad-(
    SELECT listacompra.cantidad
        FROM operacion
        INNER JOIN listacompra ON operacion.id=listacompra.id_operacion
        WHERE operacion.id=1 and operacion.id_estado_ope=1
        AND listacompra.id_producto=4) 
    WHERE id=4;

-- 3B) Pasar el estado de operacion a comprado y colocar código de pago.

    UPDATE operacion 
    SET id_estado_ope=2, codigopago='pago_16/11/2022_999923'
    WHERE id=1;

    -- FALTA ACTUALIZAR EL VALOR TOTAL DE LA COMPRA
    -- ES UN JOIN CON FUNCIONES DE SUMA Y MULTIPLICACION
    


-- ==============================================
-- METADATOS
-- ==============================================
-- acceso a los metadatos para obtener 
-- los nombre de las columnas de una tabla.
USE information_schema; 
SELECT COLUMN_NAME from COLUMNS 
WHERE TABLE_SCHEMA='compra_online' and TABLE_NAME='listacompra';




