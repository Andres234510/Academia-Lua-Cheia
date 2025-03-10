-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2023 a las 19:38:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_deportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` bigint(20) NOT NULL COMMENT 'Codigo de la categoría (numero), Auto Incremento A.I./',
  `descripcion_categoria` text NOT NULL COMMENT 'Nombre de la categoria ( Hardware)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `descripcion_categoria`) VALUES
(1, 'Sénior'),
(2, 'Juvenil (16 a 18 años)'),
(3, 'Cadete(14 y 15 años)'),
(4, 'Infantil (12 y 13 años)'),
(5, 'Alevín(11 años)'),
(6, 'Benjamín(Hasta 10 años)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `tipo_documento` text NOT NULL COMMENT 'Tipo de documento, como Cedula, NIT, Pasaporte, Cedula extranjería',
  `id_estudiante` bigint(20) NOT NULL COMMENT 'Numero de identificacion del Cliente, ya sea el numero de la cedula, pasaportes, etc',
  `nombres` text NOT NULL COMMENT 'Nombre completo del cliente',
  `apellidos` text NOT NULL COMMENT 'Apellido completo del cliente',
  `direccion` text NOT NULL COMMENT 'Dirección del cliente',
  `celular` bigint(20) NOT NULL COMMENT 'Numero telefónico del cliente',
  `email` text DEFAULT NULL COMMENT 'Correo electrónico del cliente',
  `fecha_nacimiento` date DEFAULT NULL COMMENT 'Campo opcional, donde se le solicitara la fecha de nacimiento del cliente para enviarles alguna tarjeta de felicitaciones o articulo por ser cliente preferencial.',
  `eps` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`tipo_documento`, `id_estudiante`, `nombres`, `apellidos`, `direccion`, `celular`, `email`, `fecha_nacimiento`, `eps`) VALUES
('TI', 1095551216, 'Laura Daniela', 'Gutierrez Mejia', 'Vereda Calle Larga. Finca el Guayabo., Barcelona Quindio', 3218044538, 'lauragutierrezmejia6@gmail.com', '2006-04-23', 'EPS SURAMERICANA S.A.'),
('T.I.', 1096670929, 'Jhon Anderson', 'Rubiano Perez', 'Las Acacias Mz N casa N G', 3177086246, 'monroy@gmail.com', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

CREATE TABLE `instructores` (
  `tipo_documento` text NOT NULL,
  `id_instructor` bigint(20) NOT NULL,
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `direccion` text NOT NULL,
  `celular` bigint(20) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`tipo_documento`, `id_instructor`, `nombres`, `apellidos`, `direccion`, `celular`, `email`) VALUES
('', 41947136, 'Carolina', 'Gonzalez Pino', 'Calle 19 No. 30-50 Armenia', 0, ''),
('Cedula', 41947140, 'Cristian Camilo', 'Rodriguez Arias', 'Barcelona Centro', 1111, 'banolcristian27@gmail.com'),
('', 89004640, 'Ricardo Antonio', '0', 'Cra 14 No. 30-45 Armenia', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_competencias`
--

CREATE TABLE `registro_competencias` (
  `id_competencia` bigint(20) NOT NULL,
  `id_tipo_competencia` bigint(20) NOT NULL,
  `nombre_competencia` text NOT NULL,
  `fecha_competencia` date NOT NULL,
  `hora_competencia` time NOT NULL,
  `lugar_sitio` text NOT NULL,
  `municipio` text NOT NULL,
  `id_estudiante` bigint(20) NOT NULL,
  `camiseta_numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_competencias`
--

INSERT INTO `registro_competencias` (`id_competencia`, `id_tipo_competencia`, `nombre_competencia`, `fecha_competencia`, `hora_competencia`, `lugar_sitio`, `municipio`, `id_estudiante`, `camiseta_numero`) VALUES
(1, 2, 'Competencia Barcelona ROYAL', '2023-09-30', '12:47:27', 'Chancha de I.E. San Bernardo', 'Barcelona', 1095551216, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_evaluaciones`
--

CREATE TABLE `registro_evaluaciones` (
  `id_evaluacion` bigint(20) NOT NULL,
  `id_estudiante` bigint(20) NOT NULL,
  `id_tipo_evaluacion` bigint(20) NOT NULL,
  `fecha_evaluacion` date NOT NULL,
  `calificacion` float NOT NULL,
  `observaciones` text NOT NULL,
  `id_instructor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_evaluaciones`
--

INSERT INTO `registro_evaluaciones` (`id_evaluacion`, `id_estudiante`, `id_tipo_evaluacion`, `fecha_evaluacion`, `calificacion`, `observaciones`, `id_instructor`) VALUES
(1, 1095551216, 4, '2023-09-01', 4.3, 'Errores comunes en la ejecución del ataque\r\n\r\nAl saltar, no golpear el balón delante del cuerpo.\r\n\r\nNo ejecutar correctamente el desplazamiento en la net, muchas veces existe indecisión entre el despegue y el golpeo.\r\n\r\nSaltar con un solo pie y balancearse hacia delante.\r\n\r\nSaltar y golpear en falso, poco nivel de desarrollo de las percepciones biomotoras.', 41947136),
(2, 1095551216, 3, '2023-09-01', 3.5, 'Errores comunes en la ejecución del voleo-pase\n\nNo flexionar adecuadamente las piernas y los brazos al contacto del balón\n\nMala coordinación de brazos y piernas\n\nPoseer los dedos de las manos unidos al contacto con el balón\n\nTener codos muy separados o muy unidos al cuerpo\n\nRetirar la cabeza hacia detrás o a los lados, en el momento del contacto', 89004640);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_horarios`
--

CREATE TABLE `registro_horarios` (
  `id_horario` bigint(20) NOT NULL,
  `nombre_horario` text NOT NULL,
  `observaciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_horarios`
--

INSERT INTO `registro_horarios` (`id_horario`, `nombre_horario`, `observaciones`) VALUES
(1, 'Lunes 7 a 9 pm', 'Ninguna'),
(2, 'Martes 8 a 10 pm', 'Ningo'),
(3, 'Miercoles 7 a 10 pm', 'Ninguno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_matriculas`
--

CREATE TABLE `registro_matriculas` (
  `id_matricula` bigint(20) NOT NULL,
  `id_estudiante` bigint(20) NOT NULL,
  `fecha_matricula` date NOT NULL,
  `id_categoria` bigint(20) NOT NULL,
  `id_horario` bigint(20) NOT NULL,
  `valor_matricula` bigint(20) NOT NULL,
  `valor_mensualidad` bigint(20) NOT NULL,
  `id_instructor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_matriculas`
--

INSERT INTO `registro_matriculas` (`id_matricula`, `id_estudiante`, `fecha_matricula`, `id_categoria`, `id_horario`, `valor_matricula`, `valor_mensualidad`, `id_instructor`) VALUES
(1, 1095551216, '2023-09-01', 2, 2, 40000, 60000, 41947136),
(2, 1096670929, '2023-09-01', 2, 3, 0, 60000, 41947136);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_competencias`
--

CREATE TABLE `tipo_competencias` (
  `id_tipo_competencia` bigint(20) NOT NULL,
  `nombre_competencia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_competencias`
--

INSERT INTO `tipo_competencias` (`id_tipo_competencia`, `nombre_competencia`) VALUES
(1, 'Competiciones nacionales e internacionales'),
(2, 'Competiciones regionales y locales, entrenamiento alto nivel'),
(3, 'Entrenamiento, deporte escolar y recreativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_evaluacion`
--

CREATE TABLE `tipo_evaluacion` (
  `id_tipo_evaluacion` bigint(20) NOT NULL,
  `nombre_evaluacion` text NOT NULL,
  `observaciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_evaluacion`
--

INSERT INTO `tipo_evaluacion` (`id_tipo_evaluacion`, `nombre_evaluacion`, `observaciones`) VALUES
(1, 'Prueba del saque', 'Metodología. La presente prueba consiste en que las atletas deben realizar un total de 6 saques, donde se les dará una evaluación cuantitativa teniendo en cuenta la cantidad de errores fundamentales que ejecuten. Por otra parte, la puntuación táctica dependerá de la zona del terreno hacia la cual fue dirigida el saque.\n\nhttps://www.efdeportes.com/efd166/tests-tecnico-tacticos-para-talentos-en-el-voleibol.htm'),
(2, 'Prueba del recibo', 'Metodología. Cada estudiante realizará 6 recibos por abajo con dos manos, 2 recibos dirigidos hacia la zona Cuatro, 2 recibos dirigidos hacia la zona Seis y 2 recibos dirigidos hacia la zona Uno. La valoración táctica depende de la finalidad de cada recibo donde realice contacto según el Gráfico 2, siempre y cuando la recepción describa una parábola o trayectoria de vuelo por encima de la net, las acciones que se vayan de los límites y realicen contacto fuera de las marcas de puntuación obtienen 2 puntos de forma directa.\r\n\r\nErrores comunes a tener en cuenta en la recepción\r\n\r\nRealizar contacto del balón con los brazos a una altura por encima de la línea de los hombros.\r\n\r\nExtensión de las piernas anticipadamente.\r\n\r\nNo elevar los hombros al momento del contacto con el balón\r\n\r\nApoyar el cuerpo en la planta de los pies.\r\n\r\nPoca inclinación del tronco hacia el frente en espera del balón.\r\n\r\nhttps://www.efdeportes.com/efd166/tests-tecnico-tacticos-para-talentos-en-el-voleibol.htm'),
(3, 'Prueba de voleo pase', 'Metodología. Cada estudiante realizará 6 acciones de voleo pase (Colocación) con 2 manos por arriba desde zona 3-2, las cuales estarán antecedidas por un envío adecuado realizado por el entrenador o alumno aventajado, 2 hacia zona Cuatro, 2 hacia zona Tres y 2 hacia zona dos. En estos últimos el jugador debe colocarse de espalda hacia zona dos. La valoración táctica depende de la finalidad de cada Pase donde realice contacto con el terreno, según el Gráfico 3, siempre y cuando la altura en la trayectoria del mismo sea por encima de la net. Las acciones que se vayan de los límites y realicen contacto fuera de las marcas de puntuación obtienen 2 puntos de forma directa.\r\n\r\nErrores comunes en la ejecución del voleo-pase\r\n\r\nNo flexionar adecuadamente las piernas y los brazos al contacto del balón\r\n\r\nMala coordinación de brazos y piernas\r\n\r\nPoseer los dedos de las manos unidos al contacto con el balón\r\n\r\nTener codos muy separados o muy unidos al cuerpo\r\n\r\nRetirar la cabeza hacia detrás o a los lados, en el momento del contact'),
(4, 'Prueba de ataque', 'Metodología. Cada atleta realizará 2 ataques en todas las zonas delanteras (Zonas: cuatro; tres y dos), antecedido por un pase realizado por otro alumno o por el entrenador (Gráfico 4). La puntuación táctica depende de las zonas donde el balón realice contacto con el terreno después de ejecutado el remate, el cual debe realizarse con potencia. Por otra parte, la evaluación técnica depende de los errores cometidos por las atletas de forma reiterada.\r\n\r\nErrores comunes en la ejecución del ataque\r\n\r\nAl saltar, no golpear el balón delante del cuerpo.\r\n\r\nNo ejecutar correctamente el desplazamiento en la net, muchas veces existe indecisión entre el despegue y el golpeo.\r\n\r\nSaltar con un solo pie y balancearse hacia delante.\r\n\r\nSaltar y golpear en falso, poco nivel de desarrollo de las percepciones biomotoras.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD PRIMARY KEY (`id_instructor`);

--
-- Indices de la tabla `registro_competencias`
--
ALTER TABLE `registro_competencias`
  ADD PRIMARY KEY (`id_competencia`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_tipo_competencia` (`id_tipo_competencia`);

--
-- Indices de la tabla `registro_evaluaciones`
--
ALTER TABLE `registro_evaluaciones`
  ADD PRIMARY KEY (`id_evaluacion`),
  ADD KEY `id_tipo_evaluacion` (`id_tipo_evaluacion`),
  ADD KEY `id_instructor` (`id_instructor`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `registro_horarios`
--
ALTER TABLE `registro_horarios`
  ADD PRIMARY KEY (`id_horario`);

--
-- Indices de la tabla `registro_matriculas`
--
ALTER TABLE `registro_matriculas`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_registro_matricula` (`id_horario`),
  ADD KEY `id_instructor` (`id_instructor`);

--
-- Indices de la tabla `tipo_competencias`
--
ALTER TABLE `tipo_competencias`
  ADD PRIMARY KEY (`id_tipo_competencia`);

--
-- Indices de la tabla `tipo_evaluacion`
--
ALTER TABLE `tipo_evaluacion`
  ADD PRIMARY KEY (`id_tipo_evaluacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la categoría (numero), Auto Incremento A.I./', AUTO_INCREMENT=62996;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registro_competencias`
--
ALTER TABLE `registro_competencias`
  ADD CONSTRAINT `registro_competencias_ibfk_1` FOREIGN KEY (`id_tipo_competencia`) REFERENCES `tipo_competencias` (`id_tipo_competencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_competencias_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro_evaluaciones`
--
ALTER TABLE `registro_evaluaciones`
  ADD CONSTRAINT `registro_evaluaciones_ibfk_2` FOREIGN KEY (`id_instructor`) REFERENCES `instructores` (`id_instructor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_evaluaciones_ibfk_3` FOREIGN KEY (`id_tipo_evaluacion`) REFERENCES `tipo_evaluacion` (`id_tipo_evaluacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_evaluaciones_ibfk_4` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro_matriculas`
--
ALTER TABLE `registro_matriculas`
  ADD CONSTRAINT `registro_matriculas_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_matriculas_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_matriculas_ibfk_4` FOREIGN KEY (`id_horario`) REFERENCES `registro_horarios` (`id_horario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_matriculas_ibfk_5` FOREIGN KEY (`id_instructor`) REFERENCES `instructores` (`id_instructor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
