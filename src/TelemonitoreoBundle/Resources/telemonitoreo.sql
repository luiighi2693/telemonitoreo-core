-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-02-2017 a las 02:52:28
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

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
  `EM_tipoequipo` varchar(100) NOT NULL,
  `EM_nombre` varchar(100) NOT NULL,
  `EM_marca` varchar(100) NOT NULL,
  `EM_modelo` varchar(100) NOT NULL,
  `EM_tipoconexion` varchar(50) NOT NULL,
  `EM_ip` varchar(100) NOT NULL,
  `EM_modulodeteccionirregularidades` varchar(100) NOT NULL,
  `EM_serial` varchar(50) NOT NULL,
  `RE_modulovisualizacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipomedico`
--

INSERT INTO `equipomedico` (`id`, `EM_idhistoriaclinica`, `EM_tipoequipo`, `EM_nombre`, `EM_marca`, `EM_modelo`, `EM_tipoconexion`, `EM_ip`, `EM_modulodeteccionirregularidades`, `EM_serial`, `RE_modulovisualizacion`) VALUES
(1, 2, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'ASINCRONA', 'http://10.1.201.10:8080', 'conexion Estetoscopios v1', '5555', 'visulizacion estetoscopios'),
(2, 1, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'SINCRONA', 'http://10.1.201.11:8080', 'modulo de conexion de estetoscopios', '4124', ''),
(3, 1, 'Estetoscopio', 'estetoscopio', 'auscullete', 'v2', 'SINCRONA', 'http://10.1.201.12:8080', 'modulo de conexion de estetoscopios', '4125', ''),
(4, 5, 'Electrocardiografo', 'ECG', 'bionet', 'v1.1', 'SINCRONA', 'http://192.168.0.1', 'modulo de conexion de electrocardiografos', 'AERFSDF152321', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiaclinica`
--

CREATE TABLE `historiaclinica` (
  `id` int(11) NOT NULL,
  `HC_codigo` varchar(50) NOT NULL,
  `HC_nombrepaciente` varchar(100) NOT NULL,
  `HC_cedulaPaciente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historiaclinica`
--

INSERT INTO `historiaclinica` (`id`, `HC_codigo`, `HC_nombrepaciente`, `HC_cedulaPaciente`) VALUES
(1, '1234564', 'luis rodriguez', '24995059'),
(2, '12345678', 'pedro', '12634564'),
(3, 'ERTEDF1568', 'pedro pablo', '241414155'),
(5, '12345678', 'test', '12345678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicos`
--

CREATE TABLE `historicos` (
  `id` int(11) NOT NULL,
  `HI_nombreusuario` varchar(100) NOT NULL,
  `HI_accion` varchar(100) NOT NULL,
  `HI_fecha` varchar(100) NOT NULL,
  `HI_observacionpaciente` varchar(765) NOT NULL,
  `HI_idhistoriaclinica` int(11) NOT NULL,
  `HI_cedulapaciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historicos`
--

INSERT INTO `historicos` (`id`, `HI_nombreusuario`, `HI_accion`, `HI_fecha`, `HI_observacionpaciente`, `HI_idhistoriaclinica`, `HI_cedulapaciente`) VALUES
(1, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', '1', 1, 24995059),
(2, 'luighi2693', 'UPDATE', '21/10/2016  21:12:31', '1', 1, 24995059),
(6, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', 'paciente NOMBRE CEDULA con valores ALL', 1, 24995059),
(9, 'luighi2693', 'CREATE', '21/10/2016  21:12:31', 'paciente NOMBRE CEDULA con valores ALL', 1, 24995059),
(13, 'luighi2693', 'CREATE', '18/1/2017  16:35:59', 'Se ha Vinculado el equipo: estetoscopio, marca: auscullete, modelo: v2, serial: 5555   al paciente: pedro, cedula: 12634564, historia clinica: 12345678', 2, 12634564),
(14, 'juan1234', 'CREATE', '19/2/2017  13:15:11', 'Se ha Creado el usuario: pedro pablo, cedula: 241414155, historia clinica: ERTEDF1568', 3, 241414155),
(15, 'juan1234', 'DELETE', '19/2/2017  13:21:58', 'Se ha Elminado el equipo: ECG bionet v1.1 AERFSDF152321   del paciente: luis rodriguez, cedula: 24995059, historia clinica: 1234564', 1, 24995059),
(16, 'juan1234', 'CREATE', '19/2/2017  13:26:18', 'Se ha Vinculado el equipo: ECG, marca: bionet, modelo: v1.1, serial: AERFSDF152321   al paciente: pedro pablo, cedula: 241414155, historia clinica: ERTEDF1568', 3, 241414155),
(17, 'juan1234', 'CREATE', '19/2/2017  14:24:13', 'Se ha Creado el usuario: prueba, cedula: 13245678, historia clinica: 12345678', 4, 13245678),
(18, 'juan1234', 'DELETE', '19/2/2017  14:32:56', 'Se ha Elminado el usuario: prueba, cedula: 13245678, historia clinica: 12345678', 4, 13245678),
(19, 'juan1234', 'CREATE', '19/2/2017  21:23:44', 'Se ha Creado el usuario: test, cedula: 12345678, historia clinica: 12345678', 5, 12345678),
(20, 'juan1234', 'DELETE', '19/2/2017  21:24:18', 'Se ha Elminado el equipo: ECG bionet v1.1 AERFSDF152321   del paciente: pedro pablo, cedula: 241414155, historia clinica: ERTEDF1568', 3, 241414155),
(21, 'juan1234', 'CREATE', '19/2/2017  21:24:31', 'Se ha Vinculado el equipo: ECG, marca: bionet, modelo: v1.1, serial: AERFSDF152321   al paciente: test, cedula: 12345678, historia clinica: 12345678', 5, 12345678);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

CREATE TABLE `parametro` (
  `id` int(11) NOT NULL,
  `PA_nombre` varchar(50) NOT NULL,
  `PA_codigo` varchar(50) NOT NULL,
  `PA_valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametro`
--

INSERT INTO `parametro` (`id`, `PA_nombre`, `PA_codigo`, `PA_valor`) VALUES
(1, 'Electrocardiografo', 'Equipo_Medico', 1),
(2, 'Estetoscopio', 'Equipo_Medico', 2),
(3, 'Espirometro', 'Equipo_Medico', 3),
(4, 'conexion Estetoscopios v1', 'Modulo_Deteccion_Irregularidades', 1),
(5, 'conexion estetoscopios v2.0', 'Modulo_Deteccion_Irregularidades', 2),
(6, 'visulizacion estetoscopios', 'Modulo_Visualizacion', 1),
(9, 'aaa', 'vvvv', 4),
(10, 'Osciloscopio', 'Equipo_Medico', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id` int(11) NOT NULL,
  `RE_idequipo` int(11) NOT NULL,
  `RE_fecha` varchar(100) NOT NULL,
  `RE_tipoarchivo` varchar(50) NOT NULL,
  `RE_uriarchivo` varchar(100) NOT NULL,
  `RE_idhistoriaclinica` int(11) NOT NULL,
  `RE_data` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `RE_idequipo`, `RE_fecha`, `RE_tipoarchivo`, `RE_uriarchivo`, `RE_idhistoriaclinica`, `RE_data`) VALUES
(1, 1, '2016-10-18', 'wav', '/resourses/records/record1.wav', 1, ''),
(3, 1, '2016-10-21', '123', '12', 1, ''),
(4, 1, '2016-10-18', 'wav22', '/resourses/records/record1.wav', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `US_nombre` varchar(100) NOT NULL,
  `US_password` varchar(100) NOT NULL,
  `US_rol` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `US_nombre`, `US_password`, `US_rol`) VALUES
(1, 'luighi2693', '123456', 'Administrador'),
(2, 'juan1234', '123456', 'Medico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_paciente`
--

CREATE TABLE `usuario_has_paciente` (
  `id` int(11) NOT NULL,
  `UP_idhistoriaclinica` int(11) DEFAULT NULL,
  `UP_idusuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_has_paciente`
--

INSERT INTO `usuario_has_paciente` (`id`, `UP_idhistoriaclinica`, `UP_idusuario`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 2),
(7, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variableclinica`
--

CREATE TABLE `variableclinica` (
  `id` int(11) NOT NULL,
  `VC_nombre` varchar(100) NOT NULL,
  `VC_rango` varchar(50) NOT NULL,
  `VC_rangoparticular` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='irregularidad en las variables medicas';

--
-- Volcado de datos para la tabla `variableclinica`
--

INSERT INTO `variableclinica` (`id`, `VC_nombre`, `VC_rango`, `VC_rangoparticular`) VALUES
(1, 'temperatura', '10-20', 'undefined'),
(2, 'ritmo cardiaco', '10-80', '20-100'),
(7, 'var', '10-20', '20-30'),
(10, 'var1', '1234567', '02312'),
(11, 'var2', '1234567', '132456'),
(22, 'prueba', '123456', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variable_has_equipo`
--

CREATE TABLE `variable_has_equipo` (
  `id` int(11) NOT NULL,
  `VE_idvariableclinica` int(11) NOT NULL,
  `VE_idequipomedico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `variable_has_equipo`
--

INSERT INTO `variable_has_equipo` (`id`, `VE_idvariableclinica`, `VE_idequipomedico`) VALUES
(17, 1, 2),
(18, 1, 1),
(19, 1, 3),
(23, 22, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variable_has_paciente`
--

CREATE TABLE `variable_has_paciente` (
  `id` int(11) NOT NULL,
  `VP_idhistoriaclinica` int(11) NOT NULL,
  `VP_idvariableclinica` int(11) NOT NULL,
  `VP_rangoparticular` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `variable_has_paciente`
--

INSERT INTO `variable_has_paciente` (`id`, `VP_idhistoriaclinica`, `VP_idvariableclinica`, `VP_rangoparticular`) VALUES
(24, 1, 1, '80-90'),
(25, 3, 1, '91-99'),
(28, 3, 22, '1-2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipomedico`
--
ALTER TABLE `equipomedico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historiaclinica`
--
ALTER TABLE `historiaclinica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historicos`
--
ALTER TABLE `historicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario_has_paciente`
--
ALTER TABLE `usuario_has_paciente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_has_paciente_id_uindex` (`id`);

--
-- Indices de la tabla `variableclinica`
--
ALTER TABLE `variableclinica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `variable_has_equipo`
--
ALTER TABLE `variable_has_equipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `variable_has_paciente`
--
ALTER TABLE `variable_has_paciente`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `historicos`
--
ALTER TABLE `historicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `parametro`
--
ALTER TABLE `parametro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario_has_paciente`
--
ALTER TABLE `usuario_has_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `variableclinica`
--
ALTER TABLE `variableclinica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `variable_has_equipo`
--
ALTER TABLE `variable_has_equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `variable_has_paciente`
--
ALTER TABLE `variable_has_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
