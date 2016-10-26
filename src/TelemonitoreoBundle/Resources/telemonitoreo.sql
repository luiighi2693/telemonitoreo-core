-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2016 a las 16:59:57
-- Versión del servidor: 5.7.9
-- Versión de PHP: 5.6.16

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

DROP TABLE IF EXISTS `equipomedico`;
CREATE TABLE IF NOT EXISTS `equipomedico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EM_idhistoriaclinica` int(11) DEFAULT NULL,
  `EM_tipoequipo` varchar(100) DEFAULT NULL,
  `EM_nombre` varchar(100) NOT NULL,
  `EM_marca` varchar(100) NOT NULL,
  `EM_modelo` varchar(100) NOT NULL,
  `EM_tipoconexion` varchar(50) NOT NULL,
  `EM_ip` varchar(100) NOT NULL,
  `EM_moduloconexion` varchar(100) DEFAULT NULL,
  `EM_serial` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipoMedico_paciente_id_fk` (`EM_idhistoriaclinica`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipomedico`
--

INSERT INTO `equipomedico` (`id`, `EM_idhistoriaclinica`, `EM_tipoequipo`, `EM_nombre`, `EM_marca`, `EM_modelo`, `EM_tipoconexion`, `EM_ip`, `EM_moduloconexion`, `EM_serial`) VALUES
(1, NULL, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'ASINCRONA', 'http://10.1.201.10:8080', 'modulo de conexion de estetoscopios', '5555'),
(2, 1, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'SINCRONA', 'http://10.1.201.11:8080', 'modulo de conexion de estetoscopios', '4124'),
(3, 1, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'SINCRONA', 'http://10.1.201.12:8080', 'modulo de conexion de estetoscopios', '4125'),
(4, 1, 'Electrocardiografo', 'ECG', 'bionet', 'v1.1', 'SINCRONA', 'http://192.168.0.1', 'modulo de conexion de electrocardiografos', 'AERFSDF152321'),
(7, NULL, 'Electrocardiografo', 'ejemplo', 'ejemplo', 'ejemplo', 'SINCRONA', 'http://6515616', 'conexion Estetoscopios v1', 'ejemplo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiaclinica`
--

DROP TABLE IF EXISTS `historiaclinica`;
CREATE TABLE IF NOT EXISTS `historiaclinica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HC_codigo` varchar(50) NOT NULL,
  `HC_nombrepaciente` varchar(100) NOT NULL,
  `HC_cedulapaciente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historiaclinica`
--

INSERT INTO `historiaclinica` (`id`, `HC_codigo`, `HC_nombrepaciente`, `HC_cedulapaciente`) VALUES
(1, '1234564', 'luis rodriguez', '24995059'),
(2, '12345678', 'pedro', '12634564'),
(7, 'algo', 'algo', 'algo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicos`
--

DROP TABLE IF EXISTS `historicos`;
CREATE TABLE IF NOT EXISTS `historicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HI_nombreusuario` varchar(100) DEFAULT NULL,
  `HI_accion` varchar(100) DEFAULT NULL,
  `HI_fecha` varchar(100) DEFAULT NULL,
  `HI_observacionpaciente` varchar(300) DEFAULT NULL,
  `HI_idhistoriaclinica` int(11) DEFAULT NULL,
  `HI_cedulapaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `historicos_id_uindex` (`id`),
  KEY `historicos_historiaclinica_id_fk` (`HI_observacionpaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historicos`
--

INSERT INTO `historicos` (`id`, `HI_nombreusuario`, `HI_accion`, `HI_fecha`, `HI_observacionpaciente`, `HI_idhistoriaclinica`, `HI_cedulapaciente`) VALUES
(1, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', '1', 1, NULL),
(2, 'luighi2693', 'UPDATE', '21/10/2016  21:12:31', '1', 1, NULL),
(3, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', 'paciente NOMBRE CEDULA con valores ALL', NULL, NULL),
(4, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', 'paciente NOMBRE CEDULA con valores ALL', NULL, NULL),
(5, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', 'paciente NOMBRE CEDULA con valores ALL', NULL, NULL),
(6, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', 'paciente NOMBRE CEDULA con valores ALL', 1, NULL),
(7, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', 'paciente NOMBRE CEDULA con valores ALL', NULL, NULL),
(8, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', 'paciente NOMBRE CEDULA con valores ALL', NULL, NULL),
(9, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', 'paciente NOMBRE CEDULA con valores ALL', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

DROP TABLE IF EXISTS `parametro`;
CREATE TABLE IF NOT EXISTS `parametro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PA_nombre` varchar(50) DEFAULT NULL,
  `PA_codigo` varchar(50) DEFAULT NULL,
  `PA_valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valoresvariables_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `registro`;
CREATE TABLE IF NOT EXISTS `registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RE_idequipo` int(11) DEFAULT NULL,
  `RE_fecha` varchar(100) DEFAULT NULL,
  `RE_duracion` varchar(50) DEFAULT NULL,
  `RE_tipoarchivo` varchar(50) DEFAULT NULL COMMENT 'extension del archivo',
  `RE_uriarchivo` varchar(100) DEFAULT NULL COMMENT 'direccion fisica del archivo en servidor',
  `RE_modulovisualizacion` varchar(100) DEFAULT NULL,
  `RE_idhistoriaclinica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registro_historiaclinica_id_fk` (`RE_idhistoriaclinica`),
  KEY `registro_equipomedico_id_fk` (`RE_idequipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `RE_idequipo`, `RE_fecha`, `RE_duracion`, `RE_tipoarchivo`, `RE_uriarchivo`, `RE_modulovisualizacion`, `RE_idhistoriaclinica`) VALUES
(1, 1, '2016-10-18', '00:03:10', 'wav', '/resourses/records/record1.wav', 'modulo de visualizacion de estetoscopios', 1),
(3, 1, '2016-10-21', NULL, '123', '12', '12', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_has_irregularidad`
--

DROP TABLE IF EXISTS `registro_has_irregularidad`;
CREATE TABLE IF NOT EXISTS `registro_has_irregularidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RP_idregistro` int(11) DEFAULT NULL,
  `RP_idpatronpatologico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registro_has_patronpatologico_id_uindex` (`id`),
  KEY `registro_has_patronpatologico_registro_id_fk` (`RP_idregistro`),
  KEY `registro_has_patronpatologico_patron patologico_id_fk` (`RP_idpatronpatologico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `US_nombre` varchar(100) DEFAULT NULL,
  `US_password` varchar(100) DEFAULT NULL,
  `US_rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id_uindex` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `US_nombre`, `US_password`, `US_rol`) VALUES
(1, 'luighi2693', '123456', 'Administrador'),
(2, 'juan1234', '123456', 'Medico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variableclinica`
--

DROP TABLE IF EXISTS `variableclinica`;
CREATE TABLE IF NOT EXISTS `variableclinica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VC_nombre` varchar(100) DEFAULT NULL,
  `VC_rango` varchar(50) DEFAULT NULL,
  `VC_rangoparticular` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COMMENT='irregularidad en las variables medicas';

--
-- Volcado de datos para la tabla `variableclinica`
--

INSERT INTO `variableclinica` (`id`, `VC_nombre`, `VC_rango`, `VC_rangoparticular`) VALUES
(1, 'temperatura', '10-20', NULL),
(2, 'ritmo cardiaco', '10-80', '20-100'),
(7, 'var', '10-20', '20-30'),
(10, 'var1', '1234567', '02312'),
(11, 'var2', '1234567', '132456'),
(12, 'var3', '1234567', '213218'),
(20, 'asdasdas', 'dasd', 'asdas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variable_has_paciente`
--

DROP TABLE IF EXISTS `variable_has_paciente`;
CREATE TABLE IF NOT EXISTS `variable_has_paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VP_idhistoriaclinica` int(11) DEFAULT NULL,
  `VP_idvariableclinica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variable_has_paciente_id_uindex` (`id`),
  KEY `variable_has_paciente_historiaclinica_id_fk` (`VP_idhistoriaclinica`),
  KEY `variable_has_paciente_variableclinica_id_fk` (`VP_idvariableclinica`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `variable_has_paciente`
--

INSERT INTO `variable_has_paciente` (`id`, `VP_idhistoriaclinica`, `VP_idvariableclinica`) VALUES
(11, 1, 20);

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
-- Filtros para la tabla `registro_has_irregularidad`
--
ALTER TABLE `registro_has_irregularidad`
  ADD CONSTRAINT `registro_has_patronpatologico_patron patologico_id_fk` FOREIGN KEY (`RP_idpatronpatologico`) REFERENCES `variableclinica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_has_patronpatologico_registro_id_fk` FOREIGN KEY (`RP_idregistro`) REFERENCES `registro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `variable_has_paciente`
--
ALTER TABLE `variable_has_paciente`
  ADD CONSTRAINT `variable_has_paciente_historiaclinica_id_fk` FOREIGN KEY (`VP_idhistoriaclinica`) REFERENCES `historiaclinica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `variable_has_paciente_variableclinica_id_fk` FOREIGN KEY (`VP_idvariableclinica`) REFERENCES `variableclinica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
