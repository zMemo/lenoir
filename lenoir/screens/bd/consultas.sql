-- SQLBook: Code

--CONSULTAS LENOIR
show DATABASES;

use base;show tables;


DESCRIBE usuario;

select * from usuario;


--CONSULTAS TABLA "USUARIO"

select * from usuario;

DESCRIBE usuario;

insert into usuario
(idUsuario, usuario, nombre, apellido, mail, pass, telefono, nacimiento, tipo_usuario)
VALUES
(NULL, "fentatres", "juan", "fentanes", "fenta@gmail.com", "fenta1234", "1134562325", "1999-09-09", "Cliente"),
(NULL, "fentatres", "juan", "fentanes", "fenta@gmail.com", "fenta1234", "1134562325", "1999-09-09", "Cliente");

update usuario SET nombre= "Ignaciown" where id=2;


delete from usuario where id=1;



--CONSULTAS TABLA "PRODUCTOS"
SELECT * from productos;

DESCRIBE productos;

insert into productos
(id, producto, categoria, marca, precio, stock, descripcion)
VALUES
(NULL, "Vino Bianchi", "Vinos", "Bianchi", "8000", "100", "x" )
(NULL, "Cerveza Heineken", "Cervezas", "Heineken", "3000", "150", "x" )
(NULL, "Fernet", "Destilados", "Branca", "15000", "50", "x" )
(NULL, "Cerveza Corona", "Cervezas", "Corona", "3000", "150", "x" )


update producto SET stock = stock-2 where id=1;


--CONSULTAS TABLA "OFERTA"
SELECT * from oferta;

DESCRIBE oferta;

insert into oferta
(id, nombre, fechahora, estado)
VALUES
(NULL,"fenta1234", "1999-09-09", "activo"),
(NULL,"fenta1234", "1999-09-09", "inactivo"),;

update oferta SET nombre= "Ignaciown" where id=2;


delete from oferta where id=1;

--CONSULTAS TABLA "OFERTA-DETALLE"

SELECT * from oferta_detalle;

DESCRIBE oferta;

--CONSULTAS TABLA "PEDIDO-OFERTA"
SELECT * from pedido_oferta;

DESCRIBE pedido_oferta;

insert into pedido_oferta
(id, id_usuario, fechahora_pedido, precio_total, id_oferta)
VALUES
(NULL,"1", "1999-09-09", "1000", "1"),
(NULL,"2", "1999-09-09", "2000","2"),;

update pedido_oferta SET precio_total= "20000" where id=2;


delete from pedido_oferta where id=1;

--CONSULTAS TABLA "PEDIDO-PRODUCTO"
select * from pedido_producto;

DESCRIBE pedido_producto;

INSERT INTO pedido_producto 
(id, id_pedido, fechahora_pedido, precio)
VALUES
(NULL, "4", "04/10/24 20:10", "50000")
(NULL, "3", "29/09/24 18:44", "38000")
(NULL, "2", "18/09/24 14:08", "80000")
(NULL, "1", "13/09/24 23:39", "56500")

--CONSULTAS TABLA "PEDIDO-DETALLE"
SELECT * from pedido_detalle;

DESCRIBE pedido_detalle;

insert into pedido_detalle
(id, id_pedido, id_producto, cantidad, precio)
VALUES
(NULL,"1", "3", "1000", "12222"),
(NULL,"2", "4", "2000","21111"),;

update pedido_detalle SET precio= "20000" where id=2;


delete from pedido_detalle where id=1;
--CONSULTAS TABLA "ENTREGA"
SELECT * from entrega;

DESCRIBE entrega;

insert into entrega
(id, id_pedido_producto, id_oferta, fechahora_entrega, estado)
VALUES
(NULL,"1", "3", "1999-09-09", "cancelado"),
(NULL,"2", "4", "1999-09-09","en proceso"),;
update entrega SET estado= "20000" where id=2;
delete from entrega where id=1;



--superconsulta no la usamos ni la aplicamos aun
SELECT usuario.nombre AS nombre,
producto.nombre AS producto,
compra.fecha AS Fecha,
listacompra.cantidad AS Cantidad
from usuario
inner join compra on usuario.id=compra.id_usuario
inner join listacompra on compra.id=listacompra.id_compra
inner join producto ON listacompra.id_producto=producto.id; 
