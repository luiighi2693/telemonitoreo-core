-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-02-2017 a las 06:30:44
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
(4, 1, 'Electrocardiografo', 'ECG', 'bionet', 'v1.1', 'SINCRONA', 'http://192.168.0.1', 'modulo de conexion de electrocardiografos', 'AERFSDF152321', '');

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
(2, '12345678', 'pedro', '12634564');

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
(13, 'luighi2693', 'CREATE', '18/1/2017  16:35:59', 'Se ha Vinculado el equipo: estetoscopio, marca: auscullete, modelo: v2, serial: 5555   al paciente: pedro, cedula: 12634564, historia clinica: 12345678', 2, 12634564);

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
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(12, 'var3', '1234567', '213218'),
(20, 'asdasdas', 'dasd', 'asdas');

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
(10, 1, 3),
(11, 1, 1),
(12, 1, 2),
(13, 21, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variable_has_paciente`
--

CREATE TABLE `variable_has_paciente` (
  `id` int(11) NOT NULL,
  `VP_idhistoriaclinica` int(11) NOT NULL,
  `VP_idvariableclinica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `variable_has_paciente`
--

INSERT INTO `variable_has_paciente` (`id`, `VP_idhistoriaclinica`, `VP_idvariableclinica`) VALUES
(11, 1, 20),
(20, 1, 1),
(21, 2, 21);

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
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `historicos`
--
ALTER TABLE `historicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `variableclinica`
--
ALTER TABLE `variableclinica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `variable_has_equipo`
--
ALTER TABLE `variable_has_equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `variable_has_paciente`
--
ALTER TABLE `variable_has_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
