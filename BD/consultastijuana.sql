-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2024 a las 05:41:21
-- Versión del servidor: 10.4.32-MariaDB-log
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consultastijuana`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCita` (IN `paciente` INT, IN `medico` INT, IN `fecha` DATE, IN `hora` TIME, IN `motivo` VARCHAR(255))   BEGIN
    START TRANSACTION;
    INSERT INTO Citas (paciente_id, medico_id, fecha, hora, motivo) VALUES (paciente, medico, fecha, hora, motivo);
    COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `medico_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `paciente_id`, `medico_id`, `fecha`, `hora`, `motivo`) VALUES
(1, 1, 2, '2024-08-05', '10:00:00', 'Consulta general');

--
-- Disparadores `citas`
--
DELIMITER $$
CREATE TRIGGER `after_insert_cita` AFTER INSERT ON `citas` FOR EACH ROW BEGIN
    INSERT INTO Consultas (cita_id, diagnostico, tratamiento) VALUES (NEW.id, '', '');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `cita_id` int(11) DEFAULT NULL,
  `diagnostico` text DEFAULT NULL,
  `tratamiento` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id`, `cita_id`, `diagnostico`, `tratamiento`) VALUES
(1, 1, 'Asma', 'Fluticazona Salmeterol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `padecimiento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id`, `nombre`, `padecimiento_id`) VALUES
(1, 'Losartan', 1),
(2, 'Metformina', 2),
(3, 'Fluticazona Salmeterol', 3),
(4, 'Leflunomida', 4),
(5, 'Amitriptilina', 5),
(6, 'Cetirizina', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicopadecimiento`
--

CREATE TABLE `medicopadecimiento` (
  `id` int(11) NOT NULL,
  `medico_id` int(11) DEFAULT NULL,
  `padecimiento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicopadecimiento`
--

INSERT INTO `medicopadecimiento` (`id`, `medico_id`, `padecimiento_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `nombre`, `apellido`, `especialidad`, `telefono`, `email`) VALUES
(1, 'Antonio', 'Garcia', 'Cardiología', '664-1111', 'antonio.garcia@consultastijuana.com'),
(2, 'Beatriz', 'Fernandez', 'Endocrinología', '664-2222', 'beatriz.fernandez@consultastijuana.com'),
(3, 'Carlos', 'Martinez', 'Neumología', '664-3333', 'carlos.martinez@consultastijuana.com'),
(4, 'Daniela', 'Gomez', 'Reumatología', '664-4444', 'daniela.gomez@consultastijuana.com'),
(5, 'Eduardo', 'Sanchez', 'Psicología', '664-5555', 'eduardo.sanchez@consultastijuana.com'),
(6, 'Francisca', 'Ruiz', 'Alergología', '664-6666', 'francisca.ruiz@consultastijuana.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientepadecimiento`
--

CREATE TABLE `pacientepadecimiento` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `padecimiento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientepadecimiento`
--

INSERT INTO `pacientepadecimiento` (`id`, `paciente_id`, `padecimiento_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 1),
(8, 8, 2),
(9, 9, 3),
(10, 10, 4),
(11, 11, 5),
(12, 12, 6),
(13, 13, 1),
(14, 14, 2),
(15, 15, 3),
(16, 16, 4),
(17, 17, 5),
(18, 18, 6),
(19, 19, 1),
(20, 20, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellido`, `fecha_nacimiento`, `telefono`, `direccion`) VALUES
(1, 'Juan', 'Perez', '1990-01-01', '664-123456', 'Zona Centro 22001'),
(2, 'Maria', 'Lopez', '1985-05-05', '664-567894', '10 de Mayo 22002'),
(3, 'Luis', 'Garcia', '1978-09-10', '664-234509', 'Zona Rio 22003'),
(4, 'Ana', 'Martinez', '1992-12-15', '664-678987', 'Otay 22004'),
(5, 'Pedro', 'Hernandez', '1980-03-22', '664-345676', 'Villafontana 22005'),
(6, 'Laura', 'Gonzalez', '1988-07-30', '664-789063', 'Villa del Sol 22006'),
(7, 'Carlos', 'Ramirez', '1975-11-11', '664-456723', 'Florido 22007'),
(8, 'Carmen', 'Flores', '1983-02-18', '664-890112', 'Mariano Matamoros 22008'),
(9, 'Jose', 'Gomez', '1995-05-25', '664-567854', 'Nido de las Águilas 22009'),
(10, 'Sofia', 'Diaz', '1991-08-08', '664-123483', 'Los Lobos 22010'),
(11, 'Miguel', 'Torres', '1986-10-19', '664-345693', 'Guaycura 22011'),
(12, 'Elena', 'Sanchez', '1982-01-23', '664-678909', 'Zona Centro 22012'),
(13, 'Diego', 'Cruz', '1994-04-04', '664-789098', '10 de Mayo 22013'),
(14, 'Patricia', 'Morales', '1979-06-14', '664-456776', 'Zona Rio 22014'),
(15, 'Jorge', 'Ortega', '1987-09-09', '664-890164', 'Otay 22015'),
(16, 'Natalia', 'Reyes', '1993-11-20', '664-234573', 'Villafontana 22016'),
(17, 'Ricardo', 'Mendoza', '1981-02-02', '664-567882', 'Villa del Sol 22017'),
(18, 'Gabriela', 'Vargas', '1990-05-15', '664-123492', 'Florido 22018'),
(19, 'Victor', 'Rios', '1984-08-25', '664-345641', 'Mariano Matamoros 22019'),
(20, 'Alejandra', 'Soto', '1996-12-12', '664-678991', 'Nido de las Águilas 22020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padecimientos`
--

CREATE TABLE `padecimientos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `padecimientos`
--

INSERT INTO `padecimientos` (`id`, `nombre`) VALUES
(1, 'Hipertensión'),
(2, 'Diabetes'),
(3, 'Asma'),
(4, 'Artritis'),
(5, 'Depresión'),
(6, 'Alergias');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `medico_id` (`medico_id`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cita_id` (`cita_id`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `padecimiento_id` (`padecimiento_id`);

--
-- Indices de la tabla `medicopadecimiento`
--
ALTER TABLE `medicopadecimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medico_id` (`medico_id`),
  ADD KEY `padecimiento_id` (`padecimiento_id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientepadecimiento`
--
ALTER TABLE `pacientepadecimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `padecimiento_id` (`padecimiento_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `padecimientos`
--
ALTER TABLE `padecimientos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `medicopadecimiento`
--
ALTER TABLE `medicopadecimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pacientepadecimiento`
--
ALTER TABLE `pacientepadecimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `padecimientos`
--
ALTER TABLE `padecimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`);

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`cita_id`) REFERENCES `citas` (`id`);

--
-- Filtros para la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`padecimiento_id`) REFERENCES `padecimientos` (`id`);

--
-- Filtros para la tabla `medicopadecimiento`
--
ALTER TABLE `medicopadecimiento`
  ADD CONSTRAINT `medicopadecimiento_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`),
  ADD CONSTRAINT `medicopadecimiento_ibfk_2` FOREIGN KEY (`padecimiento_id`) REFERENCES `padecimientos` (`id`);

--
-- Filtros para la tabla `pacientepadecimiento`
--
ALTER TABLE `pacientepadecimiento`
  ADD CONSTRAINT `pacientepadecimiento_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `pacientepadecimiento_ibfk_2` FOREIGN KEY (`padecimiento_id`) REFERENCES `padecimientos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
