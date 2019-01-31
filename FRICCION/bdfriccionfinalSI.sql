-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-01-2019 a las 18:23:16
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
-- Base de datos: `bdfriccionfinal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbalmacen`
--

CREATE TABLE `tbalmacen` (
  `idalmacen` int(11) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `nombreref` varchar(50) NOT NULL,
  `tamano` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbalmacen`
--

INSERT INTO `tbalmacen` (`idalmacen`, `direccion`, `nombreref`, `tamano`) VALUES
(1, 'planta friccion', 'central', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcategoria`
--

CREATE TABLE `tbcategoria` (
  `idcategoria` int(255) NOT NULL,
  `nombrecategoria` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbcategoria`
--

INSERT INTO `tbcategoria` (`idcategoria`, `nombrecategoria`) VALUES
(4, 'electrico'),
(2, 'insumo'),
(3, 'mecanico'),
(5, 'hidraulico'),
(6, 'neumatico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbconteo`
--

CREATE TABLE `tbconteo` (
  `idconteo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `idcontrolador` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbconteoproducto`
--

CREATE TABLE `tbconteoproducto` (
  `idconteoproducto` int(11) NOT NULL,
  `cantidadfisica` int(50) NOT NULL,
  `idconteo` int(255) NOT NULL,
  `idproducto` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbentrada`
--

CREATE TABLE `tbentrada` (
  `costo` int(20) NOT NULL,
  `provedor` varchar(40) NOT NULL,
  `ubicacionenalmacen` varchar(40) NOT NULL,
  `idmovimiento` int(255) NOT NULL,
  `idestadoproducto` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbentrada`
--

INSERT INTO `tbentrada` (`costo`, `provedor`, `ubicacionenalmacen`, `idmovimiento`, `idestadoproducto`) VALUES
(57, 'lemans', 'bloque 2, repisa 4', 4, 1),
(45, 'ferreteria hermanos', 'bloque 1, repisa 7', 3, 1),
(60, 'lemans', 'bloque 3, repisa 1', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbestadoproducto`
--

CREATE TABLE `tbestadoproducto` (
  `idestadoproducto` int(255) NOT NULL,
  `nombreestado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbestadoproducto`
--

INSERT INTO `tbestadoproducto` (`idestadoproducto`, `nombreestado`) VALUES
(1, 'nuevo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbmaquina`
--

CREATE TABLE `tbmaquina` (
  `idmaquina` int(255) NOT NULL,
  `nombremaquina` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbmaquina`
--

INSERT INTO `tbmaquina` (`idmaquina`, `nombremaquina`) VALUES
(2, 'pr-pre-01'),
(3, 'pr-mau-02'),
(4, 'pr-per-04'),
(5, 'ta-tor-02'),
(6, 'pr-mol-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbmovimiento`
--

CREATE TABLE `tbmovimiento` (
  `idmovimiento` int(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `tipomovimiento` varchar(15) NOT NULL,
  `idalmacen` int(255) NOT NULL,
  `idproducto` int(255) NOT NULL,
  `idencargado` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbmovimiento`
--

INSERT INTO `tbmovimiento` (`idmovimiento`, `fecha`, `hora`, `cantidad`, `tipomovimiento`, `idalmacen`, `idproducto`, `idencargado`) VALUES
(4, '2019-01-23', '16:04:10.132117', 24, 'entrada', 1, 4, 3),
(3, '2019-01-17', '14:09:06.117164', 10, 'entrada', 1, 2, 3),
(5, '2019-01-24', '10:09:08.171156', 19, 'entrada', 1, 9, 3),
(6, '2019-01-21', '15:02:04.140132', 7, 'salida', 1, 4, 3),
(7, '2019-01-19', '13:06:07.156311', 8, 'salida', 1, 2, 3),
(8, '2019-01-16', '16:28:07.350405', 16, 'salida', 1, 9, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbpersona`
--

CREATE TABLE `tbpersona` (
  `idpersona` int(255) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidopaterno` varchar(25) NOT NULL,
  `apellidomaterno` varchar(25) NOT NULL,
  `cargo` varchar(60) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbpersona`
--

INSERT INTO `tbpersona` (`idpersona`, `nombres`, `apellidopaterno`, `apellidomaterno`, `cargo`, `telefono`, `email`) VALUES
(4, 'guido', 'andrade', 'gamarra', 'jefe contabilidad', '75035265', 'gandrade@friccion-bo.com'),
(3, 'erland', 'justiniano', 'cabrera', 'encargado almacen', '76372562', 'almacenmant@friccion-bo.com'),
(5, 'carlos roberto', 'franco', 'vacadolz', 'gerente', '75569123', 'cfranco@friccion-bo.com'),
(6, 'erica', 'arancibia', 'landivar', 'auditor', '78265369', 'earancibia@friccion-bo.com'),
(7, 'erwin', 'talamani', 'mamani', 'operario', '75087524', 'etalamani@friccion-bo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbproducto`
--

CREATE TABLE `tbproducto` (
  `idproducto` int(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `idcategoria` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbproducto`
--

INSERT INTO `tbproducto` (`idproducto`, `nombre`, `descripcion`, `idcategoria`) VALUES
(1, 'rodamiento', 'para piezas moviles', 1),
(2, 'electrodo', 'insumo para soldadura', 2),
(3, 'lija', 'quitar excesos para productos en general', 2),
(4, 'termico trifasico', 'protector electrico para maquinas', 4),
(5, 'tuerca m6', 'insumo para ajustar partes en general', 2),
(6, 'cilindro neumatico', 'empujador de piezas', 6),
(7, 'resistencia 200w', 'protector electrico de maquina', 4),
(8, 'motor electrico 11kw', 'motor para maquinas en general', 3),
(9, 'correa b58', 'correa para maquinas en general', 3),
(10, 'valvula reguladora', 'para maquinas en general', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbsalida`
--

CREATE TABLE `tbsalida` (
  `solicitante` int(40) NOT NULL,
  `idmovimiento` int(255) NOT NULL,
  `idmaquina` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbsalida`
--

INSERT INTO `tbsalida` (`solicitante`, `idmovimiento`, `idmaquina`) VALUES
(7, 6, 2),
(7, 7, 5),
(7, 8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbstock`
--

CREATE TABLE `tbstock` (
  `qoptimo` int(30) NOT NULL,
  `cantidadactual` int(30) NOT NULL,
  `costopromedio` int(30) NOT NULL,
  `idproducto` int(255) NOT NULL,
  `idalmacen` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbusuario`
--

CREATE TABLE `tbusuario` (
  `idpersona` int(255) NOT NULL,
  `usuario` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbusuario`
--

INSERT INTO `tbusuario` (`idpersona`, `usuario`, `password`) VALUES
(5, 'cfranco', '791d6e5db227071d13446a4f4befb3b2948ee167'),
(6, 'earancibia', '419a4458d447edb585f2635ef8be7c7a3a47e216'),
(3, 'ejustiniano', '6737f9471557150c789651d334330e9f6c2dacc4'),
(7, 'etalamani', '496850bcb6d9857d2ea239b09bf8811a814bf062'),
(4, 'gandrade', 'a01d9fc480ea028f5fc8be891160354871697097');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbalmacen`
--
ALTER TABLE `tbalmacen`
  ADD PRIMARY KEY (`idalmacen`);

--
-- Indices de la tabla `tbcategoria`
--
ALTER TABLE `tbcategoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `tbconteo`
--
ALTER TABLE `tbconteo`
  ADD PRIMARY KEY (`idconteo`),
  ADD KEY `idcontrolador` (`idcontrolador`);

--
-- Indices de la tabla `tbconteoproducto`
--
ALTER TABLE `tbconteoproducto`
  ADD PRIMARY KEY (`idconteoproducto`),
  ADD KEY `idconteo` (`idconteo`,`idproducto`);

--
-- Indices de la tabla `tbentrada`
--
ALTER TABLE `tbentrada`
  ADD PRIMARY KEY (`idmovimiento`),
  ADD KEY `idmovimiento` (`idmovimiento`),
  ADD KEY `idestadoproducto` (`idestadoproducto`);

--
-- Indices de la tabla `tbestadoproducto`
--
ALTER TABLE `tbestadoproducto`
  ADD PRIMARY KEY (`idestadoproducto`);

--
-- Indices de la tabla `tbmaquina`
--
ALTER TABLE `tbmaquina`
  ADD PRIMARY KEY (`idmaquina`);

--
-- Indices de la tabla `tbmovimiento`
--
ALTER TABLE `tbmovimiento`
  ADD PRIMARY KEY (`idmovimiento`),
  ADD KEY `idalmacen` (`idalmacen`),
  ADD KEY `idencargado` (`idencargado`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `tbpersona`
--
ALTER TABLE `tbpersona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `tbproducto`
--
ALTER TABLE `tbproducto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indices de la tabla `tbsalida`
--
ALTER TABLE `tbsalida`
  ADD PRIMARY KEY (`idmovimiento`),
  ADD KEY `idmovimiento` (`idmovimiento`),
  ADD KEY `idmaquina` (`idmaquina`);

--
-- Indices de la tabla `tbstock`
--
ALTER TABLE `tbstock`
  ADD KEY `idalmacen` (`idalmacen`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD PRIMARY KEY (`idpersona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbalmacen`
--
ALTER TABLE `tbalmacen`
  MODIFY `idalmacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbcategoria`
--
ALTER TABLE `tbcategoria`
  MODIFY `idcategoria` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbconteo`
--
ALTER TABLE `tbconteo`
  MODIFY `idconteo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbconteoproducto`
--
ALTER TABLE `tbconteoproducto`
  MODIFY `idconteoproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbestadoproducto`
--
ALTER TABLE `tbestadoproducto`
  MODIFY `idestadoproducto` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbmaquina`
--
ALTER TABLE `tbmaquina`
  MODIFY `idmaquina` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbmovimiento`
--
ALTER TABLE `tbmovimiento`
  MODIFY `idmovimiento` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbpersona`
--
ALTER TABLE `tbpersona`
  MODIFY `idpersona` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbproducto`
--
ALTER TABLE `tbproducto`
  MODIFY `idproducto` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbusuario`
--
ALTER TABLE `tbusuario`
  MODIFY `idpersona` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
