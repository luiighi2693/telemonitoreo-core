-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2016 a las 06:55:58
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `telemonitoreo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipomedico`
--

CREATE TABLE `equipomedico` (
  `id` int(11) NOT NULL,
  `EM_idhistoriaclinica` int(11) DEFAULT NULL,
  `EM_tipoequipo` varchar(100) DEFAULT NULL,
  `EM_nombre` varchar(100) NOT NULL,
  `EM_marca` varchar(100) NOT NULL,
  `EM_modelo` varchar(100) NOT NULL,
  `EM_tipoconexion` varchar(50) NOT NULL,
  `EM_ip` varchar(100) NOT NULL,
  `EM_moduloconexion` varchar(100) DEFAULT NULL,
  `EM_serial` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipomedico`
--

INSERT INTO `equipomedico` (`id`, `EM_idhistoriaclinica`, `EM_tipoequipo`, `EM_nombre`, `EM_marca`, `EM_modelo`, `EM_tipoconexion`, `EM_ip`, `EM_moduloconexion`, `EM_serial`) VALUES
(1, 1, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'ASINCRONA', 'http://10.1.201.10:8080', 'modulo de conexion de estetoscopios', '4123'),
(2, 1, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'SINCRONA', 'http://10.1.201.11:8080', 'modulo de conexion de estetoscopios', '4124'),
(3, NULL, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'SINCRONA', 'http://10.1.201.12:8080', 'modulo de conexion de estetoscopios', '4125'),
(4, 1, 'Electrocardiografo', 'ECG', 'bionet', 'v1.1', 'SINCRONA', 'http://192.168.0.1', 'modulo de conexion de electrocardiografos', 'AERFSDF152321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiaclinica`
--

CREATE TABLE `historiaclinica` (
  `id` int(11) NOT NULL,
  `HC_codigo` varchar(50) NOT NULL,
  `HC_nombrepaciente` varchar(100) NOT NULL,
  `HC_cedulapaciente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historiaclinica`
--

INSERT INTO `historiaclinica` (`id`, `HC_codigo`, `HC_nombrepaciente`, `HC_cedulapaciente`) VALUES
(1, '1234564', 'luis rodriguez', '24995059'),
(2, '12345678', 'pedro', '12634564');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicos`
--

CREATE TABLE `historicos` (
  `id` int(11) NOT NULL,
  `HI_nombreusuario` varchar(100) DEFAULT NULL,
  `HI_accion` varchar(100) DEFAULT NULL,
  `HI_fecha` date DEFAULT NULL,
  `HI_idhistoriaclinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historicos`
--

INSERT INTO `historicos` (`id`, `HI_nombreusuario`, `HI_accion`, `HI_fecha`, `HI_idhistoriaclinica`) VALUES
(1, 'luighi2693', 'CREATE', '2016-10-17', 1),
(2, 'luighi2693', 'UPDATE', '2016-10-18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patronpatologico`
--

CREATE TABLE `patronpatologico` (
  `id` int(11) NOT NULL,
  `PP_descripcion` varchar(500) NOT NULL,
  `PP_variables` varchar(100) NOT NULL,
  `PP_tipoequipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='irregularidad en las variables medicas';

--
-- Volcado de datos para la tabla `patronpatologico`
--

INSERT INTO variableclinica (`id`, VC_nombre, VC_rango, VC_rangoparticular) VALUES
(1, 'ejemplo de patron patologico', '10-60', 'estetoscopio'),
(2, 'ejemplo de patron 2', '10-60, 20-60', 'estetoscopio'),
(3, 'ejemplo de patron', '123456', 'Estetoscopio'),
(4, 'fkvndfkgndfkn', 'fgndfjkn', 'Electrocardiografo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id` int(11) NOT NULL,
  `RE_idequipo` int(11) DEFAULT NULL,
  `RE_fecha` date NOT NULL,
  `RE_duracion` time DEFAULT NULL,
  `RE_tipoarchivo` varchar(50) NOT NULL COMMENT 'extension del archivo',
  `RE_uriarchivo` varchar(100) NOT NULL COMMENT 'direccion fisica del archivo en servidor',
  `RE_modulovisualizacion` varchar(100) DEFAULT NULL,
  `RE_idhistoriaclinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `RE_idequipo`, `RE_fecha`, `RE_duracion`, `RE_tipoarchivo`, `RE_uriarchivo`, `RE_modulovisualizacion`, `RE_idhistoriaclinica`) VALUES
(1, 1, '2016-10-18', '00:03:53', 'wav', '/resourses/records/record1.wav', 'modulo de visualizacion de estetoscopios', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_has_patronpatologico`
--

CREATE TABLE `registro_has_patronpatologico` (
  `id` int(11) NOT NULL,
  `RP_idregistro` int(11) DEFAULT NULL,
  `RP_idpatronpatologico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoresvariables`
--

CREATE TABLE `valoresvariables` (
  `id` int(11) NOT NULL,
  `VV_codigo` int(11) DEFAULT NULL,
  `VV_valor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipomedico`
--
ALTER TABLE `equipomedico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipoMedico_paciente_id_fk` (`EM_idhistoriaclinica`);

--
-- Indices de la tabla `historiaclinica`
--
ALTER TABLE `historiaclinica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historicos`
--
ALTER TABLE `historicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `historicos_id_uindex` (`id`),
  ADD KEY `historicos_historiaclinica_id_fk` (`HI_idhistoriaclinica`);

--
-- Indices de la tabla `patronpatologico`
--
ALTER TABLE variableclinica
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registro_historiaclinica_id_fk` (`RE_idhistoriaclinica`),
  ADD KEY `registro_equipomedico_id_fk` (`RE_idequipo`);

--
-- Indices de la tabla `registro_has_patronpatologico`
--
ALTER TABLE `registro_has_patronpatologico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registro_has_patronpatologico_id_uindex` (`id`),
  ADD KEY `registro_has_patronpatologico_registro_id_fk` (`RP_idregistro`),
  ADD KEY `registro_has_patronpatologico_patron patologico_id_fk` (`RP_idpatronpatologico`);

--
-- Indices de la tabla `valoresvariables`
--
ALTER TABLE parametro
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `valoresvariables_id_uindex` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipomedico`
--
ALTER TABLE `equipomedico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `historiaclinica`
--
ALTER TABLE `historiaclinica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `historicos`
--
ALTER TABLE `historicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `patronpatologico`
--
ALTER TABLE variableclinica
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `registro_has_patronpatologico`
--
ALTER TABLE `registro_has_patronpatologico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `valoresvariables`
--
ALTER TABLE parametro
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historicos`
--
ALTER TABLE `historicos`
  ADD CONSTRAINT `historicos_historiaclinica_id_fk` FOREIGN KEY (`HI_idhistoriaclinica`) REFERENCES `historiaclinica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_equipomedico_id_fk` FOREIGN KEY (`RE_idequipo`) REFERENCES `equipomedico` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_historiaclinica_id_fk` FOREIGN KEY (`RE_idhistoriaclinica`) REFERENCES `historiaclinica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro_has_patronpatologico`
--
ALTER TABLE `registro_has_patronpatologico`
  ADD CONSTRAINT `registro_has_patronpatologico_patron patologico_id_fk` FOREIGN KEY (`RP_idpatronpatologico`) REFERENCES variableclinica (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_has_patronpatologico_registro_id_fk` FOREIGN KEY (`RP_idregistro`) REFERENCES `registro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
