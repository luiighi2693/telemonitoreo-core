-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2016 a las 19:21:42
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
(1, 1, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'ASINCRONA', 'http://10.1.201.10:8080', 'modulo de conexion de estetoscopios', '5555'),
(2, NULL, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'SINCRONA', 'http://10.1.201.11:8080', 'modulo de conexion de estetoscopios', '4124'),
(3, NULL, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'SINCRONA', 'http://10.1.201.12:8080', 'modulo de conexion de estetoscopios', '4125'),
(4, 1, 'Electrocardiografo', 'ECG', 'bionet', 'v1.1', 'SINCRONA', 'http://192.168.0.1', 'modulo de conexion de electrocardiografos', 'AERFSDF152321'),
(7, NULL, 'Electrocardiografo', 'ejemplo', 'ejemplo', 'ejemplo', 'SINCRONA', 'http://6515616', 'conexion Estetoscopios v1', 'ejemplo');

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
  `HI_observacionpaciente` varchar(300) DEFAULT NULL,
  `HI_hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historicos`
--

INSERT INTO `historicos` (`id`, `HI_nombreusuario`, `HI_accion`, `HI_fecha`, `HI_observacionpaciente`, `HI_hora`) VALUES
(1, 'luighi2693', 'CREATE', '2016-10-17', '1', NULL),
(2, 'luighi2693', 'UPDATE', '2016-10-18', '1', NULL),
(3, 'luighi2693', 'CREATE', '2016-10-21', 'paciente NOMBRE CEDULA con valores ALL', NULL),
(4, 'luighi2693', 'CREATE', '2016-10-21', 'paciente NOMBRE CEDULA con valores ALL', NULL),
(5, 'luighi2693', 'CREATE', '2016-10-21', 'paciente NOMBRE CEDULA con valores ALL', '17:23:39'),
(6, 'luighi2693', 'CREATE', '2016-02-10', 'paciente NOMBRE CEDULA con valores ALL', '17:37:40'),
(7, 'luighi2693', 'CREATE', '2016-02-10', 'paciente NOMBRE CEDULA con valores ALL', '11:38:01'),
(8, 'luighi2693', 'CREATE', '2016-10-21', 'paciente NOMBRE CEDULA con valores ALL', '11:00:00'),
(9, 'luighi2693', 'CREATE', '2016-10-21', 'paciente NOMBRE CEDULA con valores ALL', '12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

CREATE TABLE `parametro` (
  `id` int(11) NOT NULL,
  `PA_nombre` varchar(50) DEFAULT NULL,
  `PA_codigo` varchar(50) DEFAULT NULL,
  `PA_valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametro`
--

INSERT INTO `parametro` (`id`, `PA_nombre`, `PA_codigo`, `PA_valor`) VALUES
(1, 'Electrocardiografo', 'Equipo_Medico', 1),
(2, 'Estetoscopio', 'Equipo_Medico', 2),
(3, 'Espirometro', 'Equipo_Medico', 3),
(4, 'conexion Estetoscopios v1', 'Modulo_Conexion', 1),
(5, 'conexion estetoscopios v2.0', 'Modulo_Conexion', 2),
(6, 'visulizacion estetoscopios', 'Modulo_Visualizacion', 1),
(9, 'aaa', 'vvvv', 4),
(10, 'Osciloscopio', 'Equipo_Medico', 4);

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
-- Estructura de tabla para la tabla `variableclinica`
--

CREATE TABLE `variableclinica` (
  `id` int(11) NOT NULL,
  `VC_nombre` varchar(100) DEFAULT NULL,
  `VC_rango` varchar(50) DEFAULT NULL,
  `VC_rangoparticular` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='irregularidad en las variables medicas';

--
-- Volcado de datos para la tabla `variableclinica`
--

INSERT INTO `variableclinica` (`id`, `VC_nombre`, `VC_rango`, `VC_rangoparticular`) VALUES
(1, 'temperatura', '10-20', NULL),
(2, 'ritmo cardiaco', '10-80', '20-100'),
(7, 'var', '10-20', '20-30'),
(9, 'var33', '10-100', '50-160');

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
  ADD KEY `historicos_historiaclinica_id_fk` (`HI_observacionpaciente`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `valoresvariables_id_uindex` (`id`);

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
-- Indices de la tabla `variableclinica`
--
ALTER TABLE `variableclinica`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipomedico`
--
ALTER TABLE `equipomedico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `historiaclinica`
--
ALTER TABLE `historiaclinica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `historicos`
--
ALTER TABLE `historicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `parametro`
--
ALTER TABLE `parametro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
-- AUTO_INCREMENT de la tabla `variableclinica`
--
ALTER TABLE `variableclinica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Restricciones para tablas volcadas
--

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
  ADD CONSTRAINT `registro_has_patronpatologico_patron patologico_id_fk` FOREIGN KEY (`RP_idpatronpatologico`) REFERENCES `variableclinica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_has_patronpatologico_registro_id_fk` FOREIGN KEY (`RP_idregistro`) REFERENCES `registro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
