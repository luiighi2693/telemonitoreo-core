-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2016 a las 16:58:53
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
  `EM_idhistoriaclinica` int(11) NOT NULL,
  `EM_tipoequipo` varchar(100) DEFAULT NULL,
  `EM_nombre` varchar(100) NOT NULL,
  `EM_marca` varchar(100) NOT NULL,
  `EM_modelo` varchar(100) NOT NULL,
  `EM_tipoconexion` varchar(50) NOT NULL,
  `EM_ip` varchar(100) NOT NULL,
  `EM_moduloconexion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, '1234564', 'luis rodriguez', '24995059');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicos`
--

CREATE TABLE `historicos` (
  `id` int(11) NOT NULL,
  `HI_nombreUsuario` varchar(100) DEFAULT NULL,
  `HI_accion` varchar(100) DEFAULT NULL,
  `HI_fecha` date DEFAULT NULL,
  `HI_idhistoriaclinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patron patologico`
--

CREATE TABLE `patron patologico` (
  `id` int(11) NOT NULL,
  `PP_descripcion` varchar(500) NOT NULL,
  `PP_variables` varchar(100) NOT NULL,
  `PP_tipoequipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='irregularidad en las variables medicas';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id` int(11) NOT NULL,
  `RE_idequipo` int(11) NOT NULL,
  `RE_fecha` date NOT NULL,
  `RE_duracion` time DEFAULT NULL,
  `RE_tipoarchivo` varchar(50) NOT NULL COMMENT 'extension del archivo',
  `RE_uriarchivo` varchar(100) NOT NULL COMMENT 'direccion fisica del archivo en servidor',
  `RE_modulovisualizacion` varchar(100) DEFAULT NULL,
  `RE_idhistoriaclinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indices de la tabla `patron patologico`
--
ALTER TABLE `patron patologico`
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
ALTER TABLE `valoresvariables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `valoresvariables_id_uindex` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipomedico`
--
ALTER TABLE `equipomedico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `historiaclinica`
--
ALTER TABLE `historiaclinica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `historicos`
--
ALTER TABLE `historicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `patron patologico`
--
ALTER TABLE `patron patologico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `registro_has_patronpatologico`
--
ALTER TABLE `registro_has_patronpatologico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `valoresvariables`
--
ALTER TABLE `valoresvariables`
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
  ADD CONSTRAINT `registro_historiaclinica_id_fk` FOREIGN KEY (`RE_idhistoriaclinica`) REFERENCES `historiaclinica` (`id`);

--
-- Filtros para la tabla `registro_has_patronpatologico`
--
ALTER TABLE `registro_has_patronpatologico`
  ADD CONSTRAINT `registro_has_patronpatologico_patron patologico_id_fk` FOREIGN KEY (`RP_idpatronpatologico`) REFERENCES `patron patologico` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_has_patronpatologico_registro_id_fk` FOREIGN KEY (`RP_idregistro`) REFERENCES `registro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;