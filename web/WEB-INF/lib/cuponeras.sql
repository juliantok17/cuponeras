-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 01, 2017 at 03:00 AM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cuponeras`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nom` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`cat_id`, `cat_nom`) VALUES
(1, 'Computación-Celulares'),
(2, 'Electrodomésticos'),
(3, 'Bazar'),
(4, 'Muebles'),
(5, 'Restaurantes'),
(6, 'Tecnología');

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_nom` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `emp_web` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`emp_id`, `emp_nom`, `emp_web`) VALUES
(1, 'groupon', 'https://www.groupon.com.ar/');

-- --------------------------------------------------------

--
-- Table structure for table `imagenes`
--

CREATE TABLE IF NOT EXISTS `imagenes` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_pro_id` int(11) NOT NULL,
  `image` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`img_id`),
  UNIQUE KEY `img_pro_id` (`img_pro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `imagenes`
--

INSERT INTO `imagenes` (`img_id`, `img_pro_id`, `image`) VALUES
(1, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_nom` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre producto',
  `pro_pre` float DEFAULT NULL,
  `pro_des` text COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcion producto',
  `pro_emp` int(11) NOT NULL,
  `pro_fecha_pub` date NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `FK_IDproducto_emp` (`pro_emp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`pro_id`, `pro_nom`, `pro_pre`, `pro_des`, `pro_emp`, `pro_fecha_pub`) VALUES
(2, 'Parlantes Genius', NULL, 'Dolor sit amet, consectetur adipiscing elit. Mauris lobortis at mauris ac accumsan. Etiam luctus arcu sed mi bibendum, non luctus quam rutrum dolor sit amet, consectetur adipiscing elit.', 1, '2017-02-14'),
(3, 'Mouse Genius', 52, 'Dolor sit amet, consectetur adipiscing elit. Mauris lobortis at mauris ac accumsan. Etiam luctus arcu sed mi bibendum, non luctus quam rutrum dolor sit amet, consectetur adipiscing elit.', 1, '2017-03-31'),
(4, 'Pendrive kingston', 156, 'Dolor sit amet, consectetur adipiscing elit. Mauris lobortis at mauris ac accumsan. Etiam luctus arcu sed mi bibendum, non luctus quam rutrum dolor sit amet, consectetur adipiscing elit.', 1, '2017-04-17'),
(5, 'Samsung Galaxy', 5844, 'Dolor sit amet, consectetur adipiscing elit. Mauris lobortis at mauris ac accumsan. Etiam luctus arcu sed mi bibendum, non luctus quam rutrum dolor sit amet, consectetur adipiscing elit.', 1, '2017-05-25'),
(6, 'Samsung Smart TV', 8562, 'Dolor sit amet, consectetur adipiscing elit. Mauris lobortis at mauris ac accumsan. Etiam luctus arcu sed mi bibendum, non luctus quam rutrum dolor sit amet, consectetur adipiscing elit.', 1, '2017-05-27'),
(7, 'NetBook HP', 10562, 'Dolor sit amet, consectetur adipiscing elit. Mauris lobortis at mauris ac accumsan. Etiam luctus arcu sed mi bibendum, non luctus quam rutrum dolor sit amet, consectetur adipiscing elit.', 1, '2017-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `productos_categorias`
--

CREATE TABLE IF NOT EXISTS `productos_categorias` (
  `id_pro` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  PRIMARY KEY (`id_pro`,`id_cat`),
  KEY `FK_cat_idCat` (`id_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `productos_categorias`
--

INSERT INTO `productos_categorias` (`id_pro`, `id_cat`) VALUES
(4, 1),
(2, 2),
(7, 2),
(2, 3),
(6, 4),
(3, 5),
(5, 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `FK_IDimgpro_proid` FOREIGN KEY (`img_pro_id`) REFERENCES `productos` (`pro_id`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_IDproducto_emp` FOREIGN KEY (`pro_emp`) REFERENCES `empresas` (`emp_id`);

--
-- Constraints for table `productos_categorias`
--
ALTER TABLE `productos_categorias`
  ADD CONSTRAINT `FK_cat_idCat` FOREIGN KEY (`id_cat`) REFERENCES `categorias` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_IDpro_pro` FOREIGN KEY (`id_pro`) REFERENCES `productos` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
