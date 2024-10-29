-- Active: 1729972723424@@127.0.0.1@3307@base
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2024 a las 15:50:02
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lenoir`
--

-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `base` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
--
-- Estructura de tabla para la tabla `entrega`
--
USE `base`;

CREATE TABLE `entrega` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `id_pedido_producto` int(11) NOT NULL,
    `id_oferta` int(11) NOT NULL,
    `fechahora_entrega` date NOT NULL,
    `estado` enum(
        'Cancelado',
        'En proceso',
        'En camino',
        'Entregado'
    ) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_pedido_detalle` (`id_pedido_producto`),
    KEY `fk_pedido_oferta` (`id_oferta`),
    CONSTRAINT `fk_pedido_detalle` FOREIGN KEY (`id_pedido_producto`) REFERENCES `pedido_detalle` (`id`),
    CONSTRAINT `fk_pedido_oferta` FOREIGN KEY (`id_oferta`) REFERENCES `pedido_oferta` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci

----------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--
CREATE TABLE `oferta` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `nombre` varchar(30) NOT NULL,
    `fechahora` date NOT NULL,
    `estado` enum('Inactivo', 'Activo') NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta_detalle`
--

CREATE TABLE `oferta_detalle` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `id_oferta` int(11) NOT NULL,
    `id_producto` int(11) NOT NULL,
    `cantidad` int(11) NOT NULL,
    `precio_total` float NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_oferta` (`id_oferta`),
    KEY `fk_producto_oferta` (`id_producto`),
    CONSTRAINT `fk_oferta` FOREIGN KEY (`id_oferta`) REFERENCES `oferta` (`id`),
    CONSTRAINT `fk_producto_oferta` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `id_pedido` int(11) NOT NULL,
    `id_producto` int(11) NOT NULL,
    `cantidad` int(11) NOT NULL,
    `precio` float NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_producto_pedido` (`id_pedido`),
    KEY `fk_producto_detalle` (`id_producto`),
    CONSTRAINT `fk_producto_detalle` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
    CONSTRAINT `fk_producto_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido_producto` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_oferta`
--

CREATE TABLE `pedido_oferta` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `id_usuario` int(11) NOT NULL,
    `id_oferta` int(11) NOT NULL,
    `fechahora_pedido` date NOT NULL,
    `precio_total` float NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_usuario_pedido` (`id_usuario`),
    KEY `fk_oferta_pedido` (`id_oferta`),
    CONSTRAINT `fk_oferta_pedido` FOREIGN KEY (`id_oferta`) REFERENCES `oferta` (`id`),
    CONSTRAINT `fk_usuario_pedido` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE `pedido_producto` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `id_usuario` int(11) NOT NULL,
    `fechahora_pedido` date NOT NULL,
    `preciototal` float NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_usuario` (`id_usuario`),
    CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `producto` varchar(30) NOT NULL,
    `categoria` enum(
        'Vinos',
        'Cervezas',
        'Sin alcohol',
        'Destilados',
        'Extras'
    ) NOT NULL,
    `marca` varchar(30) NOT NULL,
    `stock` int(11) NOT NULL,
    `precio` int(11) NOT NULL,
    `descprod` text NOT NULL,
    `img` varchar(300) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci
-----------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `usuario` varchar(30) NOT NULL,
    `nombre` varchar(45) NOT NULL,
    `apellido` varchar(45) NOT NULL,
    `mail` varchar(45) NOT NULL,
    `pass` int(30) NOT NULL,
    `telefono` int(15) NOT NULL,
    `nacimiento` date NOT NULL,
    `tipo_usuario` enum('Cliente', 'Admin') NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `mail` (`mail`),
    UNIQUE KEY `usuario` (`usuario`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
