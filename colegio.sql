-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2022 a las 08:09:17
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellido` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellido2` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_alumno`, `nombre`, `apellido`, `apellido2`, `fecha_nacimiento`) VALUES
(5, 'Juan', 'Pardo', 'Palazon', '1990-11-15'),
(6, 'Manuel', 'Fernandez', 'Gomez', '1998-10-23'),
(7, 'Pedro', 'Lopez', 'Ruiz', '1986-08-04'),
(8, 'Maria', 'Gutierrez', 'Marquez', '2001-12-27'),
(9, 'Edwin', 'Mendez', 'Vanegas', '2022-04-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `nombre`) VALUES
(1, 'Matematicas'),
(2, 'Castellano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labor_extra`
--

CREATE TABLE `labor_extra` (
  `id_labor` int(11) NOT NULL,
  `puesto` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `labor_extra`
--

INSERT INTO `labor_extra` (`id_labor`, `puesto`, `id_alumno`) VALUES
(3, 'Director del centro', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `calificacion` float DEFAULT NULL,
  `fecha_examen` date DEFAULT NULL,
  `convocatoria` int(6) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `id_asignatura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`id_nota`, `calificacion`, `fecha_examen`, `convocatoria`, `id_alumno`, `id_asignatura`) VALUES
(3, 5, '2022-04-08', 1, 5, 1),
(4, 6, '2022-04-08', 1, 6, 1),
(5, 7, '2022-04-08', 1, 7, 2),
(6, 8, '2022-04-08', 1, 8, 2),
(7, 9, '2022-04-08', 1, 9, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_alumno`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `labor_extra`
--
ALTER TABLE `labor_extra`
  ADD PRIMARY KEY (`id_labor`),
  ADD KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_asignatura` (`id_asignatura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asignatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `labor_extra`
--
ALTER TABLE `labor_extra`
  MODIFY `id_labor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `labor_extra`
--
ALTER TABLE `labor_extra`
  ADD CONSTRAINT `labor_extra_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`);

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
