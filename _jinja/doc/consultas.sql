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
(id, usuario, nombre, apellido, mail, pass, telefono, nacimiento, tipo_usuario)
VALUES
(NULL, "Prueba", "juan", "fentanes", "fentagod1@gmail.com", "prueba1234@", "1134562325", "1999-09-09", "Cliente"),
(NULL, "fentatres344", "juan", "fentanes", "fentanes2@gmail.com", "fenta1234", "1134562325", "1999-09-09", "Cliente");

update usuario SET nombre= "Ignaciown" where id=2;


delete from usuario where id=1;



--CONSULTAS TABLA "PRODUCTOS"
SELECT * from productos;

DESCRIBE productos;

insert into productos
(id, producto, categoria, marca, stock, precio, descprod, img)
VALUES
(NULL, "Vino Bianchi", "Vinos", "Bianchi", "100", "8000", "x", "/static/img/bianchimalbec.jpg" ),
(NULL, "Cerveza Heineken", "Cervezas", "Heineken", "10", "5000", "x", "/static/img/bianchimalbec.jpg"),
(NULL, "Fernet", "Destilados", "Branca", "100", "8000", "x", "/static/img/bianchimalbec.jpg" ),
(NULL, "hielo", "Extras", "rolito", "100", "8000", "x", "/static/img/bianchimalbec.jpg"),
(NULL, "Cocacola", "Sin alcohol", "Coca", "100", "8000", "x", "/static/img/bianchimalbec.jpg"),
(NULL, "Cerveza Corona", "Cervezas", "Corona", "100", "8000", "x", "/static/img/bianchimalbec.jpg");
update productos SET stock = stock-2 where id=1;

delete from productos where id=20;

--CONSULTAS TABLA "OFERTA"
SELECT * from oferta;

DESCRIBE oferta;

insert into oferta
(id, nombre, fechahora, estado)
VALUES
(NULL,'nonStop', '2025-02-26', 'activo'),
(NULL,'prueba', '2024-02-27', 'inactivo');

update oferta SET nombre= 'Ignaciown' where id=2;


delete from oferta where id=1;

--CONSULTAS TABLA "OFERTA-DETALLE"

SELECT * from oferta_detalle;

DESCRIBE oferta_detalle;

insert into oferta_detalle
(id, id_oferta, id_producto, cantidad, precio_total)
VALUES
(NULL,"6", "21", "3", "5000"),
(NULL,"6", "22", "3","1500"),
(NULL,"5", "23", "1", "2000"),
(NULL,"5", "24", "1","2000"),
(NULL,"5", "25", "2", "2000");

update oferta_detalle SET precio_total= "20000" where id=2;

delete from oferta_detalle where id=1;

--CONSULTAS TABLA "PEDIDO-OFERTA"
SELECT * from pedido_oferta;

DESCRIBE pedido_oferta;

insert into pedido_oferta
(id, id_usuario, id_oferta, fechahora_pedido, precio_total)
VALUES
(NULL,"12", "5", "2025-10-12", "6500"),
(NULL,"11", "6", "2000-09-09", "6000");

update pedido_oferta SET precio_total= "20000" where id=2;

delete from pedido_oferta where id=1;

--CONSULTAS TABLA "PEDIDO-PRODUCTO"
select * from pedido_producto;

DESCRIBE pedido_producto;

INSERT INTO pedido_producto 
(id, id_usuario, fechahora_pedido, preciototal)
VALUES
(NULL, "12", "04/10/24 20:10", "50000"),
(NULL, "11", "29/09/24 18:44", "38000"),
(NULL, "11", "18/09/24 14:08", "80000"),
(NULL, "12", "13/09/24 23:39", "56500");

--CONSULTAS TABLA "PEDIDO-DETALLE"
SELECT * from pedido_detalle;

DESCRIBE pedido_detalle;

insert into pedido_detalle
(id, id_pedido, id_producto, cantidad, precio)
VALUES
(NULL,"5", "21", "2", "5000"),
(NULL,"6", "22", "3","3000"),
(NULL,"7", "23", "5", "2000"),
(NULL,"8", "24", "1","1000");

update pedido_detalle SET precio= "20000" where id=2;


delete from pedido_detalle where id=2;



--CONSULTAS TABLA "ENTREGA"
SELECT * from entrega;

DESCRIBE entrega;

insert into entrega
(id, id_pedido_producto, id_pedido_oferta, fechahora_entrega, estado)
VALUES
(NULL,"5", "3", "1999-09-09", "cancelado"),
(NULL,"6", "4", "1999-09-09","en proceso"),
(NULL,"7", "3", "1999-09-09", "cancelado");
update entrega SET estado= "entregado" where id=2;
delete from entrega where id=1;



--superconsulta (no la usamos ni la aplicamos aun)
SELECT usuario.nombre AS nombre,
producto.nombre AS producto,
compra.fecha AS Fecha,
listacompra.cantidad AS Cantidad
from usuario
inner join compra on usuario.id=compra.id_usuario
inner join listacompra on compra.id=listacompra.id_compra
inner join producto ON listacompra.id_producto=producto.id; 
