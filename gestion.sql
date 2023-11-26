-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Nov 26, 2023 at 04:34 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+01:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion`
--

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id` int NOT NULL,
  `tipo_proveedor_id` int DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` int NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_alta` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `ultima_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`id`, `tipo_proveedor_id`, `nombre`, `email`, `telefono`, `activo`, `fecha_alta`, `ultima_modificacion`) VALUES
(1, 1, 'Catering Lucia', 'booking@cateringlucia.es', 977777777, 0, '2023-11-24 11:55:33', '2023-11-26 16:05:49'),
(2, 1, 'Hotel Paraíso', 'info@hotelparaiso.com', 1234567890, 1, '2023-01-15 00:00:00', '2023-09-28 00:00:00'),
(3, 2, 'Resort de Esquí Pico', 'contacto@resortesquipico.com', 1987654321, 0, '2023-02-20 00:00:00', '2023-11-26 10:06:12'),
(4, 3, 'Excursiones de Aventura Co.', 'hola@excursionesaventura.com', 2147483647, 1, '2023-03-10 00:00:00', '2023-11-15 00:00:00'),
(5, 1, 'Suites y Spa Frente al Mar', 'reservas@suitesfrentemar.com', 2147483647, 1, '2023-04-05 00:00:00', '2023-12-02 00:00:00'),
(6, 2, 'Lodge Valle Nevado', 'info@lodgevallenevado.com', 2147483647, 1, '2023-05-12 00:00:00', '2023-11-20 00:00:00'),
(7, 3, 'Tienda de Equipamiento para Viajes', 'ventas@equipamientoviajes.com', 2147483647, 1, '2023-06-18 00:00:00', '2023-10-30 00:00:00'),
(8, 1, 'Posada Vista a la Montaña', 'reservas@posadavistamontana.com', 2147483647, 1, '2023-07-25 00:00:00', '2023-11-10 00:00:00'),
(9, 2, 'Parque de Esquí Aventura', 'contacto@parqueaventuraesqui.com', 2147483647, 1, '2023-08-30 00:00:00', '2023-12-15 00:00:00'),
(10, 3, 'Artículos Esenciales para Viajes', 'soporte@articulosviaje.com', 2147483647, 1, '2023-09-10 00:00:00', '2023-12-20 00:00:00'),
(11, 1, 'Retiro Resort en la Orilla del Lago', 'info@retirolago.com', 2147483647, 1, '2023-10-15 00:00:00', '2023-12-25 00:00:00'),
(12, 1, 'Gran Hotel Montaña Azul', 'info@granhotelmontanaazul.com', 1122334455, 1, '2023-11-01 00:00:00', '2023-12-05 00:00:00'),
(13, 2, 'Estación de Esquí Nevada', 'contacto@estacionesquinevada.com', 2147483647, 1, '2023-11-15 00:00:00', '2023-12-20 00:00:00'),
(14, 3, 'Accesorios Viajeros Únicos', 'ventas@accesoriosviajerosunicos.com', 2147483647, 1, '2023-11-20 00:00:00', '2023-12-25 00:00:00'),
(15, 1, 'Hotel Boutique Oasis Playero', 'reservas@oasisplayero.com', 2147483647, 1, '2023-12-05 00:00:00', '2023-12-28 00:00:00'),
(16, 2, 'Centro de Esquí Alpino', 'info@centroesquialpino.com', 1122334455, 1, '2023-12-10 00:00:00', '2023-12-30 00:00:00'),
(17, 3, 'Gadgets para Aventuras Extremas', 'info@gadgetsaventura.com', 2147483647, 1, '2023-12-15 00:00:00', '2023-12-31 00:00:00'),
(18, 1, 'Resort Serenidad Costera', 'info@resortserenidad.com', 1122334455, 1, '2024-01-01 00:00:00', '2024-01-05 00:00:00'),
(19, 2, 'Valle de la Nieve Eterna', 'contacto@valledehielo.com', 2147483647, 1, '2024-01-10 00:00:00', '2024-01-15 00:00:00'),
(20, 3, 'Equipamiento Aventurero Universal', 'ventas@equipamientouniversal.com', 2147483647, 1, '2024-01-15 00:00:00', '2024-01-20 00:00:00'),
(21, 1, 'Hotel Montañas Encantadas', 'reservas@montanasencantadas.com', 2147483647, 1, '2024-01-20 00:00:00', '2024-01-25 00:00:00'),
(22, 1, 'Lavanderias Fast o-matic', 'pedro@fastomatic.es', 2147483647, 0, '2023-11-26 10:05:33', '2023-11-26 10:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `provider_type`
--

CREATE TABLE `provider_type` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_type`
--

INSERT INTO `provider_type` (`id`, `nombre`) VALUES
(1, 'hotel'),
(2, 'pista'),
(3, 'complemento');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_92C4739C78630373` (`tipo_proveedor_id`);

--
-- Indexes for table `provider_type`
--
ALTER TABLE `provider_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `provider_type`
--
ALTER TABLE `provider_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `provider`
--
ALTER TABLE `provider`
  ADD CONSTRAINT `FK_92C4739C78630373` FOREIGN KEY (`tipo_proveedor_id`) REFERENCES `provider_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
