-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2023 a las 17:06:08
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nautico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barcos`
--

CREATE TABLE `barcos` (
  `ID_Barco` int(11) NOT NULL,
  `ID_Socio` int(11) DEFAULT NULL,
  `Número_de_matrícula` varchar(20) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Número_del_amarre` varchar(20) DEFAULT NULL,
  `Cuota_de_amarre` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `barcos`
--

INSERT INTO `barcos` (`ID_Barco`, `ID_Socio`, `Número_de_matrícula`, `Nombre`, `Número_del_amarre`, `Cuota_de_amarre`) VALUES
(1, 1, 'ABC123', 'Barco1', 'A1', 100.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patron`
--

CREATE TABLE `patron` (
  `ID_Patrón` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Teléfono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `patron`
--

INSERT INTO `patron` (`ID_Patrón`, `Nombre`, `Direccion`, `Teléfono`) VALUES
(1, 'Jose Manrique', 'calle numero cp', '(661)- 3987654');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `ID_Salida` int(11) NOT NULL,
  `ID_Barco` int(11) DEFAULT NULL,
  `Fecha_y_hora_de_salida` datetime DEFAULT NULL,
  `Destino` varchar(100) DEFAULT NULL,
  `Nombre_del_patrón` varchar(50) DEFAULT NULL,
  `Apellido_del_patrón` varchar(50) DEFAULT NULL,
  `Teléfono_del_patrón` varchar(20) DEFAULT NULL,
  `ID_Patrón` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`ID_Salida`, `ID_Barco`, `Fecha_y_hora_de_salida`, `Destino`, `Nombre_del_patrón`, `Apellido_del_patrón`, `Teléfono_del_patrón`, `ID_Patrón`) VALUES
(1, 1, '2023-05-24 10:00:00', 'Destino1', 'Pedro', 'Gómez', '9876543210', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `ID_Socio` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Dirección` varchar(100) DEFAULT NULL,
  `Teléfono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`ID_Socio`, `Nombre`, `Apellido`, `Dirección`, `Teléfono`) VALUES
(1, 'Juan', 'Pérez', 'Calle Principal 123', '1234567890');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barcos`
--
ALTER TABLE `barcos`
  ADD PRIMARY KEY (`ID_Barco`),
  ADD KEY `ID_Socio` (`ID_Socio`);

--
-- Indices de la tabla `patron`
--
ALTER TABLE `patron`
  ADD PRIMARY KEY (`ID_Patrón`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`ID_Salida`),
  ADD KEY `ID_Barco` (`ID_Barco`),
  ADD KEY `ID_Patrón` (`ID_Patrón`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`ID_Socio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barcos`
--
ALTER TABLE `barcos`
  MODIFY `ID_Barco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `patron`
--
ALTER TABLE `patron`
  MODIFY `ID_Patrón` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `ID_Salida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `ID_Socio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barcos`
--
ALTER TABLE `barcos`
  ADD CONSTRAINT `barcos_ibfk_1` FOREIGN KEY (`ID_Socio`) REFERENCES `socios` (`ID_Socio`);

--
-- Filtros para la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD CONSTRAINT `salidas_ibfk_1` FOREIGN KEY (`ID_Barco`) REFERENCES `barcos` (`ID_Barco`),
  ADD CONSTRAINT `salidas_ibfk_2` FOREIGN KEY (`ID_Patrón`) REFERENCES `patron` (`ID_Patrón`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
