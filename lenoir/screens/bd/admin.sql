/* Entrando a la sesión "lenoir" */
SHOW CREATE TABLE `lenoir`.`adminlog`;
SELECT * FROM `lenoir`.`adminlog` LIMIT 1000;
INSERT INTO `lenoir`.`adminlog` (`idadmin`) VALUES (1);
SELECT `idadmin`, `user`, `password` FROM `lenoir`.`adminlog` WHERE  `idadmin`=1;
UPDATE `lenoir`.`adminlog` SET `user`='memo', `password`='lenoirmemo' WHERE  `idadmin`=1;
SELECT `idadmin`, `user`, `password` FROM `lenoir`.`adminlog` WHERE  `idadmin`=1;