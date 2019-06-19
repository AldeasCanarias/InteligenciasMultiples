-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-06-2019 a las 19:07:00
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.1.29

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
(2, '+Q Dibujo', 3),
(3, 'El/La Mejor Amigo/a', 4),
(4, 'El Secreto de las Formas', 2),
(5, 'Embarr-Arte', 3),
(6, 'Teatro', 6),
(7, 'Con las Manos en la Masa', 1),
(8, 'Laberinto Makey', 2),
(9, 'Laboratorio', 2),
(11, 'Con-Tacto', 3),
(12, 'Interpretando', 6),
(13, 'Emociónate', 8),
(14, 'Sintiendo', 7),
(15, 'El Poder de las Palabras', 6),
(16, 'Scape-Room', 2),
(17, 'Explora Radio', 6),
(18, 'Creyones', 3),
(19, 'El reino del reciclaje', 3);

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
(1, 'Antonio', 3),
(2, 'Suhaila', 3),
(3, 'Erik', 3),
(4, 'Misel', 3),
(5, 'Miguel', 3),
(6, 'Diego', 3),
(7, 'Santiago', 3),
(8, 'Aroa', 3),
(9, 'Ali', 3),
(10, 'Joel', 3),
(11, 'Nayara D.', 3),
(12, 'Dapfne', 3),
(13, 'Débora', 3),
(14, 'Javi', 5),
(15, 'Alejandro', 5),
(16, 'Patrik', 5),
(17, 'Namira', 5),
(18, 'Yendalina', 5),
(19, 'Aitor', 5),
(20, 'Pablo', 5),
(21, 'Neymara', 5),
(22, 'Yajdiel', 5),
(23, 'Nayara L.', 5),
(24, 'Joel', 5),
(25, 'Yael', 5),
(26, 'Azalia', 5),
(27, 'Yeriel', 7),
(28, 'Francisco', 7),
(29, 'Ainara', 7),
(31, 'Priscila', 7),
(32, 'Sabrina', 7),
(33, 'Aroa', 7),
(34, 'Zaire', 7),
(35, 'Julieta', 7),
(36, 'Yenedey', 7),
(37, 'Sara', 7),
(38, 'Keythya', 7),
(39, 'Neymar', 7),
(40, 'Simón', 7),
(41, 'José', 1),
(42, 'Sukaina', 1),
(43, 'Alexandra', 1),
(44, 'Jaqueline', 1),
(45, 'Alba', 1),
(46, 'Julia', 1),
(47, 'Naim', 1),
(48, 'Ada', 1),
(49, 'Yeray', 1),
(50, 'Iru', 1),
(51, 'Priscila', 1),
(52, 'Mariam', 1),
(53, 'Jairo', 1),
(54, 'Leyla', 2),
(55, 'Víctor', 2),
(56, 'Edgar', 2),
(57, 'Maria', 2),
(58, 'Magnolia', 2),
(59, 'Leo', 2),
(60, 'Praise', 2),
(61, 'Yashlín', 2),
(62, 'Aarón', 2),
(63, 'Jesús', 2),
(64, 'Samantha', 2),
(65, 'Galia', 2),
(66, 'Sullivan', 2),
(67, 'Maxi', 4),
(68, 'Jorge', 4),
(69, 'Godwin', 4),
(70, 'Tibisay', 4),
(71, 'Yaretzi', 4),
(72, 'Markel', 4),
(73, 'Adriana', 4),
(74, 'Evan', 4),
(75, 'Dayana', 4),
(76, 'Lindsay', 4),
(77, 'Víctor', 4),
(79, 'Deyanela', 4),
(80, 'Yazmina', 4),
(81, 'Mireya', 8),
(82, 'Nerea', 8),
(83, 'Kevin', 8),
(84, 'Cathaysa', 8),
(86, 'Miguel', 8),
(87, 'Nadia', 8),
(88, 'Azael', 8),
(89, 'Jhayco', 8),
(90, 'Luis', 8),
(91, 'Violet', 8),
(92, 'Amina', 8),
(93, 'Neysa', 8),
(94, 'Ariadna', 8),
(95, 'Rosaura', 6),
(96, 'Tivizay', 6),
(97, 'Alejandro', 6),
(98, 'Andrea', 6),
(99, 'Damián', 6),
(100, 'Darey', 6),
(101, 'Brahim', 6),
(102, 'Jeimy', 6),
(103, 'Layonel', 6),
(104, 'Nayeli', 6),
(105, 'Abdallah', 6),
(106, 'Nerea', 6),
(107, 'Koby', 6),
(108, 'Kenay', 3);

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
(10, 'Observa lo que tiene antes de empezar.', 2),
(11, 'Se lo pasa bien con la actividad y hace preguntas.', 2),
(12, 'Buena coordinación ojo-mano (trazos adecuados).', 2),
(13, 'Usa las herramientas adecuadas para hacer la tarea.', 2),
(14, 'Hace un dibujo limpio, ordenado y cuidado.', 2),
(15, 'Reproduce adecuadamente lo que dibuja el monitor.', 2),
(16, 'El trazo es tranquilo, seguro, buscando precisión.', 2),
(17, 'Combina colores y formas con cierta coherencia.', 2),
(18, 'Le gusta los animales de compañía.', 3),
(19, 'Tiene mascotas.', 3),
(20, 'Tiene conocimientos sobre temas relacionados con la naturaleza y los animales.', 3),
(21, 'Muestra empatía hacia los animales.', 3),
(22, 'Muestra interés por el medio ambiente y los seres vivos.', 3),
(23, 'Muestra interés por la actividad.', 3),
(24, 'Se interesa por el bienestar de los animales.', 3),
(25, 'Siente empatía por los animales abandonados/perdidos.', 3),
(26, 'Se interesa por el comportamiento animal.', 3),
(27, 'Sabe que debe hacer cuando encuentra un animal perdido.', 3),
(28, 'Reflexiona y/o aporta sus ideas sobre el cuidado y respeto hacia las mascotas.', 3),
(29, 'Utiliza movimiento plano.', 4),
(30, 'Utiliza movimiento en tercera dimensión.', 4),
(31, 'Soluciona rompecabezas con habilidad.', 4),
(32, 'Construye en 3 dimensiones con facilidad.', 4),
(33, 'Encaja bien las piezas (no deja espacios entre éstas).', 4),
(34, 'Busca el equilibrio en la figura.', 4),
(35, 'Ordena adecuadamente las acciones (puzle de imágenes).', 4),
(36, 'Disfruta construyendo los puzles.', 4),
(37, 'Explica a otros/as cómo realizar el puzle de forma clara.', 4),
(38, 'Realiza preguntas sobre las posibles dudas que se le plantean.', 4),
(39, 'Propone hacer las cosas de un modo diferente.', 5),
(40, 'Capacidad de concentración.', 5),
(41, 'Disfruta con el tacto del barro (no le importa ensuciarse las manos).', 5),
(42, 'Destreza para moldear la cerámica.', 5),
(43, 'Utiliza las herramientas adecuadas para la tarea.', 5),
(44, 'Armonía en su lenguaje corporal en la actividad a realizar.', 5),
(45, 'Se mantiene atento y participativo durante toda la actividad.', 5),
(46, 'Muestra interés y pregunta dudas.', 5),
(47, 'Es ágil en el movimiento y coordinación de mano-ojo-herramientas.', 5),
(48, 'Es proporcionado el uso de materiales con su capacidad para manipularlos y transfromarlos en objetos.', 5),
(49, 'Realiza una escucha activa de las instrucciones que se le dan.', 12),
(50, 'Realiza una escucha activa de las instrucciones que se le dan.', 6),
(51, 'Propone hacer las cosas de un modo diferente.', 11),
(52, 'Capacidad de concentración.', 11),
(53, 'Reproduce adecuadamente el dibujo de su compañero.', 11),
(54, 'El trazo es tranquilo, seguro, buscando precisión.', 11),
(55, 'Trabaja bien en pareja.', 11),
(56, 'Tiene iniciativa.', 11),
(57, 'Se lo pasa bien con la actividad y hace preguntas.', 11),
(58, 'Se muestra atento y concentrado.', 12),
(59, 'Muestra habilidades de comunicación verbal y no verbal.', 12),
(60, 'Encuentra, a través de su cuerpo, maneras de comunicarse y desfruta de ellas.', 12),
(61, 'Desarrolla la imaginación.', 12),
(62, 'Expresa emociones.', 12),
(63, 'Empatiza con sus compañeros.', 12),
(64, 'Se muestra atento y concentrado.', 6),
(65, 'Muestra habilidades de comunicación verbal y no verbal.', 6),
(66, 'Encuentra, a través de su cuerpo, maneras de comunicarse y desfruta de ellas.', 6),
(67, 'Desarrolla la imaginación.', 6),
(68, 'Expresa emociones.', 6),
(69, 'Empatiza con sus compañeros.', 6),
(70, 'Es capaz de resolver operaciones matemáticas simples.', 8),
(71, 'Capacidad de resolver un problema basandose en el panorama general y no en decisiones individuales.', 8),
(72, 'Capacidad de memorización.', 8),
(73, 'Demuestra interés por la tecnología y el funcionamiento del taller.', 8),
(74, 'Toma decisiones diferentes a los demás o distintas a lo esperado para solucionar el problema.', 8),
(75, 'Se divierte con la actividad.', 8),
(76, 'Observa lo que tiene antes de empezar.', 18),
(77, 'Se lo pasa bien con la actividad y hace preguntas.', 18),
(78, 'Buena coordinación ojo-mano (trazos adecuados).', 18),
(79, 'Usa las herramientas adecuadas para hacer la tarea.', 18),
(80, 'Hace un dibujo limpio, ordenado y cuidado.', 18),
(81, 'Reproduce adecuadamente lo que dibuja el monitor.', 18),
(82, 'El trazo es tranquilo, seguro, buscando precisión.', 18),
(83, 'Combina colores y formas con cierta coherencia.', 18),
(84, 'Se expresa hablando y escribiendo de manera fluida.', 15),
(85, 'Comprende al que habla.', 15),
(86, 'Comprende lo que se lea.', 15),
(87, 'Es capaz de reproducir una historia leída o escuchada.', 15),
(88, 'Tienes buen velocidad lectora.', 15),
(89, 'Sabe extraer las ideas principales.', 15),
(90, 'Maneja vocabulario abundante y apropiado.', 15),
(91, 'Conoce los usos sociales del lenguaje.', 15),
(92, 'Se muestra respetuoso/a con las opiniones de los compañeros/as.', 14),
(93, 'Expresa soluciones originales y es creativo.', 14),
(94, 'Es capaz de mantenerse en silencio.', 14),
(95, 'Se observa que se trata de un niño/a reflexivo.', 14),
(96, 'Se muestra participativo.', 14),
(97, 'Opina sobre las ideas y soluciones de los demás.', 14),
(98, 'Se concentra a la hora de hacer la meditación.', 14),
(99, 'El niño/a identifica correctamente las emociones.', 13),
(100, 'El niño/a relaciona de manera correcta una situación con la emoción apropiada.', 13),
(101, 'El niño/a escucha a sus compañeros.', 13),
(102, 'El niño/a identifica las emociones de otros.', 13),
(103, 'El niño/a sabe resolver correctamente una situación de conflicto proporcionando soluciones adecuadas.', 13),
(104, 'El niño/a realiza un dibujo coherente con su imagen.', 13),
(105, 'Es una persona observadora.', 9),
(106, 'Muestra curiosidad por lo que se habla, pese a no conocer los conceptos.', 9),
(107, 'Realiza investigaciones experimentales guiadas (individuales o guiadas).', 9),
(109, 'Utiliza con supervisión materiales e instrumentos de medida u observación.', 9),
(110, 'Reconoce el concepto de calor como transferencia de energía de un cuerpo a otro.', 9),
(111, 'Identifica algunas características y propiedades físicas y/o químicas observables mediante la realización de experiencias sencillas.', 9),
(112, 'Compara las experiencias observadas con otros fenómenos naturales de su entorno.', 9),
(113, 'Indica de manera algo razonada posibles explicaciones de las experiencias realizadas.', 9),
(114, 'Participa en las pequeñas investigaciones guiadas con ayuda, mostrando buena predisposición al aprendizaje.', 9),
(115, 'Disfruta aprendiendo.', 9),
(116, 'Conoce a sus compañeros/as y muestra interés por sus gustos.', 16),
(117, 'Genera confianza en sus compañeros y es elegido por la mayoría.', 16),
(118, 'La comunicación (verbal y no verbal) es clara y está enfocada a las soluciones.', 16),
(119, 'Muestra sensibilidad por el problema planteado y es empático con el afectado.', 16),
(120, 'Ejerce un liderazgo integrador (facilita la participación e involucra a todos/as.', 16),
(121, 'Muestra motivación por realizar acciones colectivas y disfruta con ellas.', 16),
(122, 'Es capaz de compartir de manera natural tanto aspectos materiales como información.', 16),
(123, 'Se involucra en la organización y en la coordinación del grupo.', 16),
(124, 'Coopera y ayuda a quien lo necesita.', 16),
(125, 'Escucha y respeta la opinión e ideas de los demás.', 16),
(127, 'Se atreve a expresarse en público.', 17),
(128, 'Interés en contar historias.', 17),
(129, 'Creatividad a la hora de contar historias.', 17),
(130, 'Capacidad de ordenar y secuenciar las historias.', 17),
(131, 'Cuida la entonación al hablar en grupo.', 17),
(132, 'Lenguaje rico y acorde a su edad.', 17),
(133, 'Trabaja en equipo.', 7),
(135, 'Se muestra creativo/a.', 7),
(136, 'Es ordenado/a.', 7),
(137, 'Muestra decisión y determinación.', 7),
(138, 'Muestra capacidad de adaptación.', 7),
(139, 'Le llaman la atención los olores y colores.', 7),
(140, 'Plantea otros platos alternativos.', 7),
(141, 'Capacidad de concentración.', 19),
(142, 'Disfruta con el reciclaje.', 19),
(143, 'Tiene iniciativa.', 19),
(144, 'Propone hacer las cosas de un modo diferente.', 19),
(145, 'Muestra interés por el medioambiente.', 19),
(146, 'Se muestra creativo/a.', 19);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fecha_evento`
--
ALTER TABLE `fecha_evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `subact`
--
ALTER TABLE `subact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

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
  ADD CONSTRAINT `FK_Alumno` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Subact` FOREIGN KEY (`subact_id`) REFERENCES `subact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `subact`
--
ALTER TABLE `subact`
  ADD CONSTRAINT `FK_Actividad` FOREIGN KEY (`actividad_id`) REFERENCES `actividades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
