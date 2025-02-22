-- SQLBook: Code
SHOW DATABASES;
-- SELECT VERSION(), CURRENT_DATE;
use base;

describe usuario;
;

INSERT INTO usuario 
(id,nombre,apellido,email,pass)
VALUES
(NULL,"Claudia","Coli","clacoli@gmail.com","1234");


INSERT INTO usuario 
(id,nombre,apellido,email,pass)
VALUES
(NULL,"Alberto","Stein","elbeto@gmail.com","9999"),
(NULL,"Laura","Cortese","cortesec@gmail.com","1199");


DESCRIBE producto;
INSERT INTO producto 
(id,nombre,valor,stock)
VALUES
(NULL, "Fideos Matarazzo 500 gr",320.5,50 ),
(NULL, "Atun La campañola 300 gr",710.5,23 ),
(NULL, "Leche en polvo La Martona 100 gr",400,150 ),
(NULL, "Agua mineral Villa Vicencio 1L",250.3,200 ),
(NULL, "Huevos Blancos 1/2 Doc",130.5,16 );

DESCRIBE compra;
INSERT INTO compra 
(id,fecha,id_usuario)
VALUES
(NULL, "2023-03-18",1 );

INSERT INTO compra 
(id,fecha,id_usuario)
VALUES
(NULL, "2023/03/18",2 );


