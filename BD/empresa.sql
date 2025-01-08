-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2023 a las 22:51:32
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `NumeroE` int(5) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Departamento` varchar(10) NOT NULL,
  `FechaI` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`NumeroE`, `Nombre`, `Departamento`, `FechaI`) VALUES
(100, 'Jorgue Gonzalez', 'Ventas', '2023-02-09'),
(101, 'Jose Lopez', 'Mostrador', '2022-02-11'),
(103, 'Luis Lopez', 'Técnico', '2023-03-14'),
(104, 'Raquel', 'Gerente', '2023-03-01'),
(105, 'Rogelio Guzman	', 'Operador', '2023-02-13'),
(102, 'Israel Flores', 'Ingeniero', '2023-01-04'),
(106, 'Teddy  Forges', 'Limpieza', '2022-12-14');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
