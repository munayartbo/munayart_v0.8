-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2024 a las 05:09:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `munayart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `CodAdmi` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Usuario` varchar(50) DEFAULT NULL,
  `Contrasenia` varchar(50) DEFAULT NULL,
  `Rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`CodAdmi`, `Nombre`, `Email`, `Usuario`, `Contrasenia`, `Rol`) VALUES
(1, 'Abdul Castillo', 'iapalie@umsa.bo', 'Abdul', '*MaxCasty888*', 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplica`
--

CREATE TABLE `aplica` (
  `CodPromocion` int(11) NOT NULL,
  `CodProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artesano`
--

CREATE TABLE `artesano` (
  `CodArtesano` int(11) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `AniosExp` int(11) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT current_timestamp(),
  `Imagen` varchar(255) DEFAULT NULL,
  `CodComunidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artesano`
--

INSERT INTO `artesano` (`CodArtesano`, `Descripcion`, `AniosExp`, `FechaRegistro`, `Imagen`, `CodComunidad`) VALUES
(1, '', 0, '2024-09-23 18:29:06', NULL, NULL),
(3, 'Buen artesano', 8, '2024-10-07 00:48:11', '../views/images/art2.webp', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `califica`
--

CREATE TABLE `califica` (
  `CodCliente` int(11) NOT NULL,
  `CodArtesano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `CodCarrito` int(11) NOT NULL,
  `Fecha` datetime DEFAULT current_timestamp(),
  `Estado` varchar(50) DEFAULT NULL,
  `CodCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CodCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`CodCliente`) VALUES
(2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunidad`
--

CREATE TABLE `comunidad` (
  `CodComunidad` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `NroHabitantes` int(11) DEFAULT NULL,
  `Imagen` varchar(255) DEFAULT NULL,
  `CodAdmi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunidad`
--

INSERT INTO `comunidad` (`CodComunidad`, `Nombre`, `NroHabitantes`, `Imagen`, `CodAdmi`) VALUES
(1, 'Uyuni', 29000, 'images/uyuni.webp', 1),
(2, 'Tiwanaku', 14000, 'images/tiwanaku.webp', 1),
(3, 'Isla del Sol', 5000, 'images/islasol.webp', 1),
(4, 'Potosí', 175000, 'images/potosi.webp', 1),
(5, 'Copacabana', 6000, 'images/copacabana.webp', 1),
(6, 'Salar de Coipasa', 2000, 'images/salarcoipasa.webp', 1),
(7, 'Rurrenabaque', 19000, 'images/rurrenabaque.webp', 1),
(8, 'San Ignacio de Velasco', 53000, 'images/sanignacio.webp', 1),
(9, 'Toro Toro', 10000, 'images/torotoro.webp', 1),
(10, 'Tarabuco', 3000, 'images/tarabuco.webp', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery`
--

CREATE TABLE `delivery` (
  `CodDelivery` int(11) NOT NULL,
  `TipoVehiculo` varchar(50) DEFAULT NULL,
  `Placa` varchar(20) DEFAULT NULL,
  `ZonaCobertura` varchar(100) DEFAULT NULL,
  `HoraIngreso` time DEFAULT NULL,
  `HoraSalida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devuelve`
--

CREATE TABLE `devuelve` (
  `CodDelivery` int(11) NOT NULL,
  `CodProducto` int(11) NOT NULL,
  `Hora` datetime DEFAULT current_timestamp(),
  `Motivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `CodDelivery` int(11) NOT NULL,
  `CodProducto` int(11) NOT NULL,
  `Hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestiona`
--

CREATE TABLE `gestiona` (
  `CodAdmi` int(11) NOT NULL,
  `CodUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incluye`
--

CREATE TABLE `incluye` (
  `CodCarrito` int(11) NOT NULL,
  `CodProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `CodInventario` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT current_timestamp(),
  `CodProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `CodPago` int(11) NOT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Entidad` varchar(100) DEFAULT NULL,
  `Detalle` text DEFAULT NULL,
  `CodPedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `CodPedido` int(11) NOT NULL,
  `Fecha` datetime DEFAULT current_timestamp(),
  `Estado` varchar(50) DEFAULT NULL,
  `CodCarrito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `CodProducto` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Material` varchar(100) DEFAULT NULL,
  `Dimensiones` varchar(8) DEFAULT NULL,
  `Imagen` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `CodArtesano` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CodProducto`, `Nombre`, `Tipo`, `Precio`, `Material`, `Dimensiones`, `Imagen`, `Descripcion`, `CodArtesano`) VALUES
(1, 'Collar de Perlas', 'Collar', 25.99, 'Perlas', '45 cm', './img/collares/01.webp', 'Elegante collar de perlas naturales.', 1),
(2, 'Collar de Cuero', 'Collar', 15.99, 'Cuero', '50 cm', './img/collares/02.webp', 'Collar de cuero con colgante único.', 1),
(3, 'Aretes de Plata', 'Aretes', 19.99, 'Plata', '3 cm', './img/aretes/04.webp', 'Aretes de plata925, diseño clásico.', 1),
(4, 'Aretes de Esmalte', 'Aretes', 12.50, 'Esmalte', '2.5 cm', './img/aretes/03.webp', 'Aretes coloridos de esmalte.', 1),
(5, 'Chompa de Lana', 'Chompa', 59.99, 'Lana', 'M', './img/chompas/02.webp', 'Chompa cálida ideal para invierno.', 1),
(6, 'Chompa de Algodón', 'Chompa', 39.99, 'Algodón', 'L', './img/chompas/05.webp', 'Chompa ligera y cómoda para el día a día.', 1),
(7, 'Jarrón de Cerámica', 'Cerámica', 34.50, 'Cerámica', '20x30 cm', './img/ceramicas/06.webp', 'Jarrón decorativo hecho a mano.', 1),
(8, 'Taza de Cerámica', 'Cerámica', 18.00, 'Cerámica', '10x10 cm', './img/ceramicas/03.webp', 'Taza artesanal, ideal para café.', 1),
(17, 'Poncho', 'Chompa', 55.00, 'Lana', 'L', '../../views/productos/img/chompas/poncho.webp', 'Poncho de lana minimalista', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `CodPromocion` int(11) NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenia`
--

CREATE TABLE `resenia` (
  `CodResenia` int(11) NOT NULL,
  `Fecha` datetime DEFAULT current_timestamp(),
  `Comentario` text DEFAULT NULL,
  `Calificacion` int(11) DEFAULT NULL,
  `CodCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene`
--

CREATE TABLE `tiene` (
  `CodUsuario` int(11) NOT NULL,
  `CodUbicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `CodUbicacion` int(11) NOT NULL,
  `Departamento` varchar(100) DEFAULT NULL,
  `Provincia` varchar(100) DEFAULT NULL,
  `Calle` varchar(100) DEFAULT NULL,
  `Zona` varchar(100) DEFAULT NULL,
  `NroPuerta` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `CodUsuario` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `FechaNac` date DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `User` varchar(50) DEFAULT NULL,
  `Pass` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`CodUsuario`, `Nombre`, `Apellido`, `FechaNac`, `Celular`, `Email`, `User`, `Pass`, `reset_token`, `reset_expiration`) VALUES
(1, 'Natalia', 'Ugarte', '2002-12-10', '61104470', 'nata1@gmail.com', 'vaquitrash', '$2y$10$uH1hSGVEpV6kD.AO7arGBe.lo6ImRgNjBeB/mavW3IhYgCukGUWL2', NULL, NULL),
(2, 'Ismael', 'Palie', '2002-09-25', '69835506', 'ismacasty08@gmail.com', 'IsmaCasty', '$2y$10$jlpkfvTL4kgW7ahbYYRfzeFxu/TVggQ0ixkAzN0M0OsLLrj1uPNU.', '1764262213b565f0aee95d82cb67080c74249b24a3684b861b095d7c8d0f72482b36dc6987b8b6a6a5dcaece3541d02cc10c', '2024-10-07 01:32:39'),
(3, 'Axel', 'Vega', '2002-03-10', '70513854', 'axel@gmail.com', 'Axelillo', '$2y$10$He0GxQ/TlDoQ1u28r3ghdOnyjCaxUqJZ2igXBNIAsjkcEvzTWJ3Zq', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`CodAdmi`);

--
-- Indices de la tabla `aplica`
--
ALTER TABLE `aplica`
  ADD PRIMARY KEY (`CodPromocion`,`CodProducto`),
  ADD KEY `CodProducto` (`CodProducto`);

--
-- Indices de la tabla `artesano`
--
ALTER TABLE `artesano`
  ADD PRIMARY KEY (`CodArtesano`),
  ADD KEY `CodComunidad` (`CodComunidad`);

--
-- Indices de la tabla `califica`
--
ALTER TABLE `califica`
  ADD PRIMARY KEY (`CodCliente`,`CodArtesano`),
  ADD KEY `CodArtesano` (`CodArtesano`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`CodCarrito`),
  ADD KEY `fk_carrito_cliente` (`CodCliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CodCliente`);

--
-- Indices de la tabla `comunidad`
--
ALTER TABLE `comunidad`
  ADD PRIMARY KEY (`CodComunidad`),
  ADD KEY `CodAdmi` (`CodAdmi`);

--
-- Indices de la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`CodDelivery`);

--
-- Indices de la tabla `devuelve`
--
ALTER TABLE `devuelve`
  ADD PRIMARY KEY (`CodDelivery`,`CodProducto`),
  ADD KEY `CodProducto` (`CodProducto`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`CodDelivery`,`CodProducto`),
  ADD KEY `CodProducto` (`CodProducto`);

--
-- Indices de la tabla `gestiona`
--
ALTER TABLE `gestiona`
  ADD PRIMARY KEY (`CodAdmi`,`CodUsuario`),
  ADD KEY `CodUsuario` (`CodUsuario`);

--
-- Indices de la tabla `incluye`
--
ALTER TABLE `incluye`
  ADD PRIMARY KEY (`CodCarrito`,`CodProducto`),
  ADD KEY `CodProducto` (`CodProducto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`CodInventario`),
  ADD KEY `CodProducto` (`CodProducto`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`CodPago`),
  ADD UNIQUE KEY `CodPedido` (`CodPedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`CodPedido`),
  ADD UNIQUE KEY `CodCarrito` (`CodCarrito`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CodProducto`),
  ADD KEY `CodArtesano` (`CodArtesano`);

--
-- Indices de la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`CodPromocion`);

--
-- Indices de la tabla `resenia`
--
ALTER TABLE `resenia`
  ADD PRIMARY KEY (`CodResenia`),
  ADD KEY `fk_resenia_cliente` (`CodCliente`);

--
-- Indices de la tabla `tiene`
--
ALTER TABLE `tiene`
  ADD PRIMARY KEY (`CodUsuario`,`CodUbicacion`),
  ADD KEY `CodUbicacion` (`CodUbicacion`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`CodUbicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CodUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `CodAdmi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `CodCarrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comunidad`
--
ALTER TABLE `comunidad`
  MODIFY `CodComunidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `CodInventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `CodPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `CodPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `CodProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `promocion`
--
ALTER TABLE `promocion`
  MODIFY `CodPromocion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resenia`
--
ALTER TABLE `resenia`
  MODIFY `CodResenia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `CodUbicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `CodUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplica`
--
ALTER TABLE `aplica`
  ADD CONSTRAINT `aplica_ibfk_1` FOREIGN KEY (`CodPromocion`) REFERENCES `promocion` (`CodPromocion`),
  ADD CONSTRAINT `aplica_ibfk_2` FOREIGN KEY (`CodProducto`) REFERENCES `producto` (`CodProducto`);

--
-- Filtros para la tabla `artesano`
--
ALTER TABLE `artesano`
  ADD CONSTRAINT `artesano_ibfk_1` FOREIGN KEY (`CodArtesano`) REFERENCES `usuario` (`CodUsuario`),
  ADD CONSTRAINT `artesano_ibfk_2` FOREIGN KEY (`CodComunidad`) REFERENCES `comunidad` (`CodComunidad`);

--
-- Filtros para la tabla `califica`
--
ALTER TABLE `califica`
  ADD CONSTRAINT `califica_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`),
  ADD CONSTRAINT `califica_ibfk_2` FOREIGN KEY (`CodArtesano`) REFERENCES `artesano` (`CodArtesano`);

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_carrito_cliente` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`);

--
-- Filtros para la tabla `comunidad`
--
ALTER TABLE `comunidad`
  ADD CONSTRAINT `comunidad_ibfk_1` FOREIGN KEY (`CodAdmi`) REFERENCES `administrador` (`CodAdmi`);

--
-- Filtros para la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`CodDelivery`) REFERENCES `usuario` (`CodUsuario`);

--
-- Filtros para la tabla `devuelve`
--
ALTER TABLE `devuelve`
  ADD CONSTRAINT `devuelve_ibfk_1` FOREIGN KEY (`CodDelivery`) REFERENCES `delivery` (`CodDelivery`),
  ADD CONSTRAINT `devuelve_ibfk_2` FOREIGN KEY (`CodProducto`) REFERENCES `producto` (`CodProducto`);

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`CodDelivery`) REFERENCES `delivery` (`CodDelivery`),
  ADD CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`CodProducto`) REFERENCES `producto` (`CodProducto`);

--
-- Filtros para la tabla `gestiona`
--
ALTER TABLE `gestiona`
  ADD CONSTRAINT `gestiona_ibfk_1` FOREIGN KEY (`CodAdmi`) REFERENCES `administrador` (`CodAdmi`),
  ADD CONSTRAINT `gestiona_ibfk_2` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`);

--
-- Filtros para la tabla `incluye`
--
ALTER TABLE `incluye`
  ADD CONSTRAINT `incluye_ibfk_1` FOREIGN KEY (`CodCarrito`) REFERENCES `carrito` (`CodCarrito`),
  ADD CONSTRAINT `incluye_ibfk_2` FOREIGN KEY (`CodProducto`) REFERENCES `producto` (`CodProducto`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`CodProducto`) REFERENCES `producto` (`CodProducto`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`CodPedido`) REFERENCES `pedido` (`CodPedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`CodCarrito`) REFERENCES `carrito` (`CodCarrito`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`CodArtesano`) REFERENCES `artesano` (`CodArtesano`);

--
-- Filtros para la tabla `resenia`
--
ALTER TABLE `resenia`
  ADD CONSTRAINT `fk_resenia_cliente` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`);

--
-- Filtros para la tabla `tiene`
--
ALTER TABLE `tiene`
  ADD CONSTRAINT `tiene_ibfk_1` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`),
  ADD CONSTRAINT `tiene_ibfk_2` FOREIGN KEY (`CodUbicacion`) REFERENCES `ubicacion` (`CodUbicacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
