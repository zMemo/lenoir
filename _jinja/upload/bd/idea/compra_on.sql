-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 20:17:13
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `compra_on`
--

CREATE DATABASE IF NOT EXISTS `compra_on` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `compra_on`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_ope`
--

CREATE TABLE `estado_ope` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `estado_ope`
--

INSERT INTO `estado_ope` (`id`, `nombre`) VALUES
(1, 'enCarrito'),
(2, 'Comprado'),
(3, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pro`
--

CREATE TABLE `estado_pro` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `estado_pro`
--

INSERT INTO `estado_pro` (`id`, `nombre`) VALUES
(1, 'Sin Stock'),
(2, 'Pausado'),
(3, 'Disponible'),
(4, 'Cancelado'),
(5, 'Baja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listacompra`
--

CREATE TABLE `listacompra` (
  `id` int(11) NOT NULL,
  `id_operacion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `preciounidad` float NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `listacompra`
--

INSERT INTO `listacompra` (`id`, `id_operacion`, `cantidad`, `preciounidad`, `id_producto`) VALUES
(1, 1, 2, 250, 3),
(2, 1, 3, 750, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE `operacion` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fechahora` datetime NOT NULL,
  `codigopago` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `total` float NOT NULL,
  `id_estado_ope` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `operacion`
--

INSERT INTO `operacion` (`id`, `id_usuario`, `fechahora`, `codigopago`, `total`, `id_estado_ope`) VALUES
(1, 13, '2022-11-22 14:55:00', 'pago_16/11/2022_999923', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_estado_pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `nombre`, `precio`, `cantidad`, `descripcion`, `id_usuario`, `id_estado_pro`) VALUES
(1, '12345', 'Lampaso', 200, 38, 'Cepillo para pisos', 12, 3),
(2, '45678', 'El molino', 180, 30, 'Harina000 ', 13, 3),
(3, 'AXK120RP', 'Harina', 250, 73, 'Trigo 1 kilo', 12, 1),
(4, 'WER678BG', 'Yerba', 750, 77, 'Suave 1/2 kilo', 13, 1),
(5, 'UYT754CV', 'Azúcar', 100, 250, 'Ultra refinada. 1 kilo', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `direccion` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `email`, `dni`, `direccion`) VALUES
(11, 'Mariano', 'Trigila', 'pepe@sapo.com', 111111, '1648 Balbin'),
(12, 'Lucina', 'Laurens Padovano', 'lulaupa@gmail.com', 65464464, 'Calle 123'),
(13, 'Roque', 'Perez', 'perez_roque@gmail.com', 11501453, 'Av Córdoba 4202.Caba');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado_ope`
--
ALTER TABLE `estado_ope`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_pro`
--
ALTER TABLE `estado_pro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `listacompra`
--
ALTER TABLE `listacompra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_operacion_listacompra` (`id_operacion`),
  ADD KEY `fk_producto_listacompra` (`id_producto`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_operacion` (`id_usuario`),
  ADD KEY `fk_estado_ope_operacion` (`id_estado_ope`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_codigo_producto` (`codigo`),
  ADD KEY `fk_usuario_producto` (`id_usuario`),
  ADD KEY `fk_estado_pro_producto` (`id_estado_pro`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un1_email` (`email`),
  ADD UNIQUE KEY `un2_dni` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado_ope`
--
ALTER TABLE `estado_ope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_pro`
--
ALTER TABLE `estado_pro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `listacompra`
--
ALTER TABLE `listacompra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `listacompra`
--
ALTER TABLE `listacompra`
  ADD CONSTRAINT `fk_operacion_listacompra` FOREIGN KEY (`id_operacion`) REFERENCES `operacion` (`id`),
  ADD CONSTRAINT `fk_producto_listacompra` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD CONSTRAINT `fk_estado_ope_operacion` FOREIGN KEY (`id_estado_ope`) REFERENCES `estado_ope` (`id`),
  ADD CONSTRAINT `fk_usuario_operacion` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_estado_pro_producto` FOREIGN KEY (`id_estado_pro`) REFERENCES `estado_pro` (`id`),
  ADD CONSTRAINT `fk_usuario_producto` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
