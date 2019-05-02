-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-05-2019 a las 14:36:28
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `intligencias_multiples`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_inteligencia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `nombre`, `tipo_inteligencia_id`) VALUES
(1, 'Actividad Uno', 3),
(2, 'Actividad Dos', 3),
(3, 'Actividad Tres', 5),
(6, 'Actividad Cuatro', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `equipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombre`, `equipo_id`) VALUES
(1, 'Carlos Hernández Pérez', 3),
(2, 'Yara Hernández Pérez', 3),
(3, 'Alberto Hernández Pérez', 4),
(4, 'Andrea Hernández Pérez', 7),
(5, 'Virginia Hernández Pérez', 7),
(6, 'Santiago Hernández Pérez', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`) VALUES
(1, 'Rojo'),
(2, 'Verde'),
(3, 'Amarillo'),
(4, 'Azul'),
(5, 'Naranja'),
(6, 'Beige'),
(7, 'Fucsia'),
(8, 'Gris');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `id` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `subact_id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `evaluaciones`
--

INSERT INTO `evaluaciones` (`id`, `nota`, `subact_id`, `alumno_id`) VALUES
(71, 1, 1, 4),
(72, 2, 1, 5),
(73, 3, 1, 6),
(74, 1, 3, 4),
(75, 2, 3, 5),
(76, 3, 3, 6),
(77, 1, 5, 4),
(78, 2, 5, 5),
(79, 3, 5, 6),
(80, 1, 6, 4),
(81, 2, 6, 5),
(82, 3, 6, 6),
(83, 1, 8, 4),
(84, 2, 8, 5),
(85, 3, 8, 6),
(86, 2, 1, 1),
(87, 2, 1, 2),
(88, 2, 3, 1),
(89, 2, 3, 2),
(90, 2, 5, 1),
(91, 2, 5, 2),
(92, 1, 6, 1),
(93, 1, 6, 2),
(94, 1, 8, 1),
(95, 1, 8, 2),
(96, 1, 2, 4),
(97, 2, 2, 5),
(98, 3, 2, 6),
(99, 1, 4, 4),
(100, 2, 4, 5),
(101, 3, 4, 6),
(102, 1, 7, 4),
(103, 2, 7, 5),
(104, 3, 7, 6),
(105, 1, 9, 4),
(106, 2, 9, 5),
(107, 2, 9, 6),
(108, 3, 10, 4),
(109, 2, 10, 5),
(110, 1, 10, 6),
(111, 3, 2, 1),
(112, 3, 2, 2),
(113, 2, 4, 1),
(114, 3, 4, 2),
(115, 1, 7, 1),
(116, 3, 7, 2),
(117, 0, 9, 1),
(118, 3, 9, 2),
(119, 1, 10, 1),
(120, 2, 10, 2),
(121, 1, 1, 3),
(122, 2, 3, 3),
(123, 3, 5, 3),
(124, 1, 6, 3),
(125, 1, 8, 3),
(126, 2, 2, 3),
(127, 3, 4, 3),
(128, 1, 7, 3),
(129, 2, 9, 3),
(130, 3, 10, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha_evento`
--

CREATE TABLE `fecha_evento` (
  `id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `fecha_evento`
--

INSERT INTO `fecha_evento` (`id`, `fecha_inicio`, `fecha_fin`) VALUES
(1, '2019-06-24', '2019-06-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subact`
--

CREATE TABLE `subact` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `actividad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `subact`
--

INSERT INTO `subact` (`id`, `descripcion`, `actividad_id`) VALUES
(1, 'asasdgasgsadg', 1),
(2, 'sadgsdggs', 2),
(3, 'asdgsdggdg', 1),
(4, 'sdgsagsadg', 2),
(5, 'sssssssss', 1),
(6, 'sdgadsg', 1),
(7, 'asd', 2),
(8, 'sdag', 1),
(9, 'sdadgasdgasdg', 3),
(10, 'asdgsddddddddd', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_inteligencia`
--

CREATE TABLE `tipos_inteligencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_inteligencia`
--

INSERT INTO `tipos_inteligencia` (`id`, `nombre`) VALUES
(1, 'Corporal'),
(2, 'Lógico-Matemática'),
(3, 'Artística'),
(4, 'Naturalista'),
(5, 'Musical'),
(6, 'Lingüística'),
(7, 'Existencial'),
(8, 'Emocional');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Tipo_Inteligencia` (`tipo_inteligencia_id`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Equipo` (`equipo_id`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Alumno` (`alumno_id`),
  ADD KEY `FK_Subact` (`subact_id`);

--
-- Indices de la tabla `fecha_evento`
--
ALTER TABLE `fecha_evento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subact`
--
ALTER TABLE `subact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Actividad` (`actividad_id`);

--
-- Indices de la tabla `tipos_inteligencia`
--
ALTER TABLE `tipos_inteligencia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `fecha_evento`
--
ALTER TABLE `fecha_evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `subact`
--
ALTER TABLE `subact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipos_inteligencia`
--
ALTER TABLE `tipos_inteligencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `FK_Tipo_Inteligencia` FOREIGN KEY (`tipo_inteligencia_id`) REFERENCES `tipos_inteligencia` (`id`);

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `FK_Equipo` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`);

--
-- Filtros para la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `FK_Alumno` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `FK_Subact` FOREIGN KEY (`subact_id`) REFERENCES `subact` (`id`);

--
-- Filtros para la tabla `subact`
--
ALTER TABLE `subact`
  ADD CONSTRAINT `FK_Actividad` FOREIGN KEY (`actividad_id`) REFERENCES `actividades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
