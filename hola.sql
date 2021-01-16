-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-01-2021 a las 18:36:18
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hola`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `NroBoleta` int(11) NOT NULL,
  `Fecha_Alquiler` date NOT NULL,
  `idClientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `boleta`
--

INSERT INTO `boleta` (`NroBoleta`, `Fecha_Alquiler`, `idClientes`) VALUES
(3, '2020-05-14', 29),
(4, '2020-05-25', 4),
(5, '2020-05-27', 5),
(6, '2020-06-30', 6),
(7, '2020-04-22', 7),
(8, '2020-04-19', 8),
(9, '2020-04-20', 9),
(10, '2020-05-20', 10),
(11, '2020-05-10', 11),
(12, '2020-08-10', 12),
(13, '2020-08-15', 13),
(14, '2020-08-20', 14),
(15, '2020-08-22', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idClientes` int(11) NOT NULL,
  `Nombre` tinytext NOT NULL,
  `Apellido1` tinytext NOT NULL,
  `Apellido2` tinytext NOT NULL,
  `Documento` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Celular` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idClientes`, `Nombre`, `Apellido1`, `Apellido2`, `Documento`, `Direccion`, `Telefono`, `Celular`) VALUES
(1, 'Manco', 'Matutue', 'Matutue', '1343252123', 'calle 190a cra43', '214325113', '2526332425'),
(2, 'juancarlos', 'fernanez', 'predroza', '12908372323', 'calle 109a-17 Barranquilla', '3106585441', '3002123134'),
(3, 'Jose Luis', 'Cera ', 'Marquez', '1023905301', 'calle 58 cra27a-50 Soledad', '3012569090', '1201241132'),
(4, 'Jerson Andres', 'Hernandez ', 'Fernandez', '1023905302', 'calle 83b cra32c-32 Soledad', '3102689540', '1241563453'),
(5, 'Carlos Junior', 'Rojano ', 'Pineda', '1023905303', 'calle 110 cra23c-34 Barranquilla', '3014567894', '4542435377'),
(6, 'Angel Jose', 'Wilches ', 'Melendez', '1023905304', 'calle 28 cra83-5 Barranquilla', '3108796574', '1241477423'),
(7, 'Ruben Antonio', 'Cante ', 'Molina', '1023905304', 'calle 109c cra32b-27 Baranquilla', '3168450345', '7457634521'),
(8, 'Juandaniel ', 'Gutierrez ', 'Alivera', '1023905305', 'calle 72 cra54 Barranquilla', '3425648976', '1536342435'),
(9, 'Guillermo Jose', 'Wilches ', 'Melendez', '1023905306', 'calle 83 cra23-43 Soledad', '3014536854', '6785524125'),
(10, 'Daniel Juan', 'Barcelo', ' Lavadera', '1023905307', 'calle 27 cra98c-34 Barranquilla', '3016584659', '46548555746'),
(11, 'Jose Angel', 'Chavez', ' Ladera', '1023905308', 'calle 49 cra64', '3109754533', '24145445768'),
(12, 'Nicolas Juanquin', 'Felix ', 'Ramos', '1023905309', 'calle 35 cr37a', '3108796574', '45265856442'),
(13, 'Josemanuel', 'Madera', 'Hernandez', '1023905310', 'calle 34 cra45a', '3225523636', '26463411467'),
(14, 'Rosman', 'Borelli', 'Junior', '1933720112', 'calle 54 cra30', '3114512125', '15231252411'),
(15, 'Juanfer', 'Gratos', 'Mendez', '1528796273', 'calle30 cra48a', '3124343623', '135474463523');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleboleta`
--

CREATE TABLE `detalleboleta` (
  `Id` int(11) NOT NULL,
  `NroBoleta` int(11) NOT NULL,
  `Idpeliculas` int(11) NOT NULL,
  `Precio_Alquilado` varchar(45) NOT NULL,
  `Devuelto` tinytext NOT NULL,
  `Fecha_Devolucion` date NOT NULL,
  `DiasMora` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleboleta`
--

INSERT INTO `detalleboleta` (`Id`, `NroBoleta`, `Idpeliculas`, `Precio_Alquilado`, `Devuelto`, `Fecha_Devolucion`, `DiasMora`) VALUES
(6, 6, 6, '4000', 'SI', '2020-04-07', '1'),
(7, 7, 7, '3600', 'SI', '2020-04-08', '1'),
(8, 8, 8, '3400', 'NO', '2020-04-09', '5'),
(9, 9, 9, '3300', 'NO', '2020-04-10', '2'),
(10, 10, 10, '2600', 'NO', '2020-04-11', '4'),
(11, 11, 11, '2200', 'NO', '2020-04-12', '1'),
(12, 12, 12, '2500', 'NO', '2020-04-13', '4'),
(13, 13, 13, '3600', 'NO', '2020-04-14', '2'),
(14, 14, 14, '5000', 'NO', '2020-04-15', '7'),
(15, 15, 15, '4600', 'SI', '2020-04-16', '4'),
(16, 16, 16, '5800', 'SI', '2020-04-17', '2'),
(17, 17, 17, '5600', 'SI', '2020-04-17', '3'),
(18, 18, 18, '7300', 'NO', '2020-04-18', '2'),
(19, 19, 19, '3700', 'SI', '2020-04-19', '2'),
(20, 20, 20, '2600', 'NO', '2020-04-20', '2'),
(21, 21, 21, '2800', 'SI', '2020-04-21', '1'),
(22, 22, 22, '2900', 'NO', '2020-04-22', '1'),
(23, 23, 23, '2200', 'SI', '2020-04-23', '2'),
(24, 24, 24, '3900', 'SI', '2020-04-24', '1'),
(25, 25, 25, '3800', 'NO', '2020-04-25', '2'),
(26, 26, 26, '3700', 'NO', '2020-04-26', '1'),
(27, 27, 27, '3600', 'NO', '2020-04-27', '5'),
(28, 28, 28, '3500', 'SI', '2020-04-28', '2'),
(29, 29, 29, '3400', 'SI', '2020-04-29', '6'),
(30, 30, 30, '3300', 'SI', '2020-04-30', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `Idpeliculas` int(11) NOT NULL,
  `Titulo` tinytext NOT NULL,
  `Tipo` tinytext NOT NULL,
  `Categoria` tinytext NOT NULL,
  `Actor_Principal` tinytext NOT NULL,
  `Precio_Actual` varchar(45) NOT NULL,
  `Stock` varchar(45) NOT NULL,
  `Saldo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`Idpeliculas`, `Titulo`, `Tipo`, `Categoria`, `Actor_Principal`, `Precio_Actual`, `Stock`, `Saldo`) VALUES
(2, 'Terminator Genesis', 'Estreno', 'Accion', 'Schewceneger', '30000', '1', '1000'),
(6, 'Farmagedon', 'Comedia', 'Normal', 'Shaun Sheep', '20000', '2', '10000'),
(7, 'Triple Amenaza', 'Accion', 'Estreno', 'Tonny Jar', '30000', '3', '0'),
(8, 'Las Reinas Del Crimen', 'Accion', 'Clasica', 'McCarthy', '29000', '2', '9000'),
(9, 'Superman Red Son', 'Accion', 'Clasica', 'Superman', '28000', '3', '8000'),
(10, 'El Informante', 'Accion', 'Estreno', 'Liam Hemsworth', '30000', '2', '3000'),
(11, 'The Invisible Man', 'Terror', 'Estreno', 'Elisabeth Moss', '29000', '3', '2000'),
(12, 'Unidos', 'Animada', 'Estreno', 'Pixar', '30000', '3', '2000'),
(13, 'Amenaza Profunda', 'Terror', 'Normal', 'Ira Miller', '28000', '2', '3000'),
(14, 'Timmy Failaure', 'Aventura', 'Normal', 'Disney', '24000', '3', '2000'),
(15, 'Mujercitas', 'Drama', 'Clasica', 'Florence Flich', '25000', '1', '3000'),
(16, 'To All The Boys', 'Romance', 'Normal', 'Netflix', '25000', '1', '4000'),
(17, 'Unicorked', 'Drama', 'Normal', 'Netflix', '30000', '2', '1000'),
(18, 'The Banker', 'Drama', 'Normal', 'Samuel L. Jackson', '29000', '2', '3000'),
(19, 'The Room', 'Misterio', 'Normal', 'Kevin Janseens', '27000', '3', '2000'),
(20, 'Jexi', 'Comedia', 'Normal', 'Adam Beyne', '27000', '2', '0'),
(21, 'The Gentlemen', 'Accion', 'Normal', 'Guy Ricehie', '25000', '2', '0'),
(22, 'BloodShot', 'Accion', 'Normal', 'Vin Diesel', '29000', '2', '0'),
(23, 'Dolittle', 'Aventura', 'Normal', 'Robert Downey', '30000', '3', '1000'),
(24, 'Aves De Presa', 'Accion', 'Normal', 'HArley Queen', '22000', '1', '3000'),
(25, 'Queen & Slim', 'Crimen', 'Normal', 'Daniel Kaluuva', '28000', '1', '5000'),
(26, 'Nueva York Sin Salida', 'Accion', 'Normal', 'Chadwick Boseman', '29000', '4', '2000'),
(27, 'Pokémon Mewtwo Contraataca', 'Animada', 'Normal', 'Mewtwo', '27000', '2', '3000'),
(28, 'El Precio De la Verdad', 'Drama', 'Normal', 'Nill Gibson', '30000', '2', '1000'),
(29, 'Espias A Escondidas', 'Animada', 'Estreno', 'Disney', '30000', '2', '3000'),
(30, 'Star Girl', 'Drama', 'Normal', 'Disney', '29000', '2', '3000'),
(31, 'Ant', 'Accion', 'Normal', 'Marvel', '30000', '2', '1000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`NroBoleta`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idClientes`);

--
-- Indices de la tabla `detalleboleta`
--
ALTER TABLE `detalleboleta`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `NroBoleta_idx` (`NroBoleta`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`Idpeliculas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idClientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `Idpeliculas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
