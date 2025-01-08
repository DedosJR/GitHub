-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2023 a las 17:06:20
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
-- Base de datos: `mibodega`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `NumClie` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Direccion` char(60) NOT NULL,
  `Telefono` char(11) NOT NULL,
  `RFC` varchar(15) DEFAULT NULL,
  `LimiteCre` decimal(8,2) NOT NULL,
  `Correo` varchar(20) NOT NULL,
  `id_pedido` int(10) DEFAULT NULL,
  `Vendedor` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`NumClie`, `Nombre`, `Direccion`, `Telefono`, `RFC`, `LimiteCre`, `Correo`, `id_pedido`, `Vendedor`) VALUES
(1, 'Abarrotes Javi', 'Calle Nora #334 Col. Lomas del porvenir', '6641902345', 'ABJA980210B23', 20000.00, 'abajavi@gmail.com', 100, 1601),
(2, 'Norma Bustamante', 'Lomas #2309 Col. Juarez Tijuana B.C', '6641907654', 'NOBUS879001N12', 20000.00, 'norma@gmail.com', NULL, NULL),
(3, 'Maxi', 'Leon Num. 1002 Col. Mariano', '6641234567', 'MAXI123456p09', 23000.00, 'maxi@gmail.com', 101, 1602),
(4, 'Brenda Matamoros ', 'Tona Num.203 Col.Lomas de la presa', '6651234567', 'BRE125673J08', 15000.00, 'brenda@gmail.com', 102, 1603),
(5, 'Abarrotes JS', 'Tapa Num 201 Col.Lopez Portillo', '6631234567', 'ABJS124562p87', 17000.00, 'abajs@gmail.com', 103, 1604),
(6, 'Lacteos Baja', 'vebta num. 22325 Mariano Matamoros', '6643418931', 'LACT123456', 20000.00, 'lacti@gmail.com', 104, 1604),
(7, 'Abarrotes Lola', 'Calle None Num. 20 Col. Jibarito', '6637654387', 'LOJE129876k09', 13000.00, 'Lola@gmail.com', 105, 1601),
(8, 'Merril', 'Bank Num. 1002 Col. Holla', '6641289076', 'MERR012345l98', 12000.00, 'Merril@gmail.com', 106, 1605),
(9, 'Nancy', 'Nataly Num.12 Col.Canon', '6641236789', 'NANX129876jk9', 12000.00, 'nancy@gmail.com', 107, 1603),
(10, 'Felipe ', 'Calle Chichimecas #902', '664 235678', 'FEL23456', 12000.00, 'feli@gmail.com', NULL, NULL),
(11, 'Jose de jesus', 'Calle lomas de Tijuana Num. 12 Col Nueva Tijuana', '6642347898', 'JOJY098765M12', 12000.00, 'jose@gmail.com', 108, 1601);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `Numpedido` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`Numpedido`) VALUES
(100),
(101),
(102),
(103),
(104),
(105),
(106),
(107),
(108);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE `pedido_producto` (
  `id_pedido` int(10) DEFAULT NULL,
  `id_producto` varchar(10) DEFAULT NULL,
  `Cantidad` int(10) DEFAULT NULL,
  `Importe` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido_producto`
--

INSERT INTO `pedido_producto` (`id_pedido`, `id_producto`, `Cantidad`, `Importe`) VALUES
(100, '1001', NULL, NULL),
(102, '1002', NULL, NULL),
(100, '1009', NULL, NULL),
(100, '1008', NULL, NULL),
(100, '1010', NULL, NULL),
(100, '1001', 4, 106.00),
(104, '1008', 5, 25.00),
(107, '1011', 4, 144.00),
(108, '1011', 7, 252.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Codigo_Producto` varchar(10) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Descripcion` varchar(60) NOT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Codigo_Producto`, `Nombre`, `Descripcion`, `Precio`, `Stock`) VALUES
('', '', '', 0.00, 0),
('1001', 'Coca Cola', '1lt', 26.50, 20),
('1002', 'Coca Cola', '600ml', 16.00, 12),
('1003', 'Sabritas ', 'papas de sal 350gr', 16.50, 25),
('1004', 'Huevo blanco', 'Cartera 30pz', 10.00, 50),
('1005', 'Azucar ', 'Zulka 1kg', 13.00, 20),
('1006', 'Papel sanitario', 'Paquete de 12 rollos', 15.00, 25),
('1007', 'Jamon', 'Paquete de 400gr', 28.00, 5),
('1008', 'Paleta', 'TutsiPop', 5.00, 10),
('1009', 'Pepsi', '500ml', 16.00, 15),
('1010', 'Bolsas de plastico ', '20pz', 26.00, 15),
('1011', 'Doritos', '146gr', 36.00, 35),
('1012', 'Rufles', '210gr', 46.00, 50),
('1013', 'Dr Pepper', 'Soda tipo cola 600ml', 16.00, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pass` text NOT NULL,
  `Rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Nombre`, `username`, `pass`, `Rol`) VALUES
(1, 'Israel Flores', 'dedosjr@gmail.com', '15ra3lif', 'Admin'),
(2, 'estephany flores', 'estephany@gmail.com', '160408', 'Editor'),
(3, 'Brenda Matamoros', 'matamoros@gmail.com', '111', 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `NumEmp` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Contrato` varchar(10) DEFAULT NULL,
  `Cuota` decimal(8,2) DEFAULT NULL,
  `Ventas` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`NumEmp`, `Nombre`, `Contrato`, `Cuota`, `Ventas`) VALUES
(1601, 'Javier Lopez', '12-02-2008', 60000.00, 75000.00),
(1602, 'Gabriel Mancera', '15-02-2010', 60000.00, 80000.00),
(1603, 'Norma Cervantez', '20-07-2010', 60000.00, 35000.00),
(1604, 'Betzabe Ornelas', '2009-02-12', 60000.00, 80500.00),
(1605, 'Vanesa Martinez', '25-09-2012', 60000.00, 25000.00),
(1606, 'Manuel Torres', '12-03-2019', 30000.00, 15000.00),
(1607, 'Jose Lopez', '2023-04-11', 10000.00, 3000.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`NumClie`),
  ADD KEY `Vendedor` (`Vendedor`),
  ADD KEY `clientes_ibfk_1` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Numpedido`);

--
-- Indices de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Codigo_Producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`NumEmp`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `NumClie` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Numpedido` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `NumEmp` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1608;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`Vendedor`) REFERENCES `ventas` (`NumEmp`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Numpedido`) REFERENCES `clientes` (`id_pedido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `pedido_producto_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`Numpedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`Codigo_Producto`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
