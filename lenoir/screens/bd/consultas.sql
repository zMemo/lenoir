-- SQLBook: Code
show DATABASES;

use base;show tables;


DESCRIBE usuario;

select * from usuario;


insert into usuario
(id, nombre, apellido, email, pass)
VALUES
(NULL, "ignacio", "Uliczki", "djtacoza2@gmail.com", "hh1234");

insert into usuario
(id, nombre, apellido, email, pass)
VALUES
(NULL, "Rossana", "Orlando", "lamamadeuliczki@gmail.com", "uli1234"),
(NULL, "ignacio", "Uliczki", "djtacozaa2@gmail.com", "hh1234");


update usuario SET nombre= "Ignaciown"
where id=5;

delete from usuario where id=4;




--agregar un producto
DESCRIBE producto;

SELECT * FROM producto;


INSERT into producto
(id, nombre, valor, stock)
VALUES
(NULL, "papel JUAN CRUZ FENTANES", 50, 4);
describe compra;

insert into compra
(id, fecha, id_usuario)
VALUES
(NULL, "2021-09-09", 3);

SELECT * FROM compra;



DESCRIBE listacompra;

INSERT INTO listacompra
(id, id_compra, id_producto, cantidad, valor)
VALUES
(NULL, 2, 1, 2, 100);

select * FROM listacompra;
--actualizar stock (comando update)-
update producto SET stock= stock-2 where id=1;


--superconsulta
SELECT usuario.nombre AS nombre,
producto.nombre AS producto,
compra.fecha AS Fecha,
listacompra.cantidad AS Cantidad
from usuario
inner join compra on usuario.id=compra.id_usuario
inner join listacompra on compra.id=listacompra.id_compra
inner join producto ON listacompra.id_producto=producto.id; 





--CONSULTAS LENOIR

--CONSULTAS TABLA "USUARIO"

--CONSULTAS TABLA "TAL"

--CONSULTAS TABLA "TAL"

--CONSULTAS TABLA "TAL"

--CONSULTAS TABLA "TAL"

--CONSULTAS TABLA "TAL"

--CONSULTAS TABLA "TAL"
--CONSULTAS TABLA "TAL"