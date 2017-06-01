-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 01, 2017 at 09:37 PM
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
(5, 'Gastronomía'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`emp_id`, `emp_nom`, `emp_web`) VALUES
(1, 'Groupon', 'https://www.groupon.com.ar/'),
(2, 'Cupónica', 'https://www.cuponica.com.ar'),
(3, 'Clickon', 'https://www.clickon.com.ar'),
(4, 'Agrupate', 'https://www.agrupate.com');

-- --------------------------------------------------------

--
-- Table structure for table `imagenes`
--

CREATE TABLE IF NOT EXISTS `imagenes` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_pro_id` int(11) NOT NULL,
  `image` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`img_id`),
  UNIQUE KEY `img_pro_id` (`img_pro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `imagenes`
--

INSERT INTO `imagenes` (`img_id`, `img_pro_id`, `image`) VALUES
(1, 2, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/tablet-samsung-tab-t113-7-spreadtrum-blanco-8-gb/228fc892cbdf2d6d41c1558722ec77fd6c56b3ac897635c4696dde094d8f5ca4_1000'),
(2, 3, 'http://images.samsung.com/is/image/samsung/ar-galaxy-j2-j200m-sm-j200mzkmaro-000000009-l-dynamic?$PD_GALLERY_JPG$'),
(3, 4, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/notebook-dell-inspiron-14-3000-3458-intel-core-i3/dc26587495bebbf7a67da28016d09874c810305d2567ccec9035f70df5ac51c6_1000'),
(4, 5, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/notebook-vaio-vjf155a0111b-intel-core-i3/21023cd8ddfa9465d47176642018c2320bab6db9be6bffe9d0609e64f0f467b8_1000'),
(5, 6, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/cafetera-nespresso-inissia-black-aeroccino-3/01c6ec93aae510a84ff1d64b8bec7d3ceb98e77b035bcb37492586a874e36678_1000'),
(6, 7, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/aspiradora-atma-as8912e-1700-w/47b48d47db6b0f91aa565e431d6c685a50f9da7f9f0ef43ff28261737ea41673_1000'),
(7, 8, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/heladera-no-frost-electrolux-df3500p-plata/062777ed82c2313eeba94420396cbe4f4fe36511d5d323dfd321f6a1a6010a6d_1000'),
(8, 9, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/lavarropas-automatico-drean-6-kg-next-6.08-blanco/dfe7207382512645b9511b1ad1b3d72703eefcce96d4ef9ee2f162c71c8e8f6d_1000'),
(9, 10, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/especiero-redondo-con-tapa-de-ceramica-liv-home-230ml/85ae5a906803474bd5742db3cdf2696aeb40e751aece33f9e047a4503c06f972_1000'),
(10, 11, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/cesto-de-residuos-acero-inoxidable-liv-home-ovalado-3lts/54f3165accbccefba86c179a119bdf1418390f3cbc3bc2ff7e3ed67b51ab3f92_1000'),
(11, 12, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/bateria-de-cocina-aluminio-hudson-valley-6pzs/2e25dbb09d86efd9e43bface00d563654c33c1705f070b2e9c4b2d507bdbf1c8_1000'),
(12, 13, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/tabla-de-picar-madera-nouvelle-cuisine/e1080762937256c8d9dde7408d000ea90cd9156493c94f9b27d3f0e8f16b886a_1000'),
(13, 14, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/comoda-chifonier-de-5-cajones-color-wengue/233b46a93a8568d9ed4609b411e8022017e434b88b400c5a2dda94d5ef157362_1000'),
(14, 15, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/mueble-botinero-para-24-pares-de-zapatos-color-wengue/c8a37951d7a2b5beb643f804468a5cf99931b7464e69769bd7043e5493262cf5_1000'),
(15, 16, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/mesa-de-luz-con-desayunador-color-wengue-precio-imbatible/34970de426d4bffa49295e48d322d35c52a66277e6a0fa6f57316d986a50eb12_1000'),
(16, 17, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/escritorio-roma-con-cajon-y-estante-color-blanco/cc0fdb44599631df05b33d7e8ea4c407289070e3dd31b10a765da3c241604ed8_1000'),
(17, 18, 'https://www.planetajoy.com/upload/image/600x6001360268080_miga2.jpg'),
(18, 19, 'http://orsimages.unileversolutions.com/ORS_Images/Knorr_es-AR/Canelones-de-verdura_13_3.6.2_326X580.Jpeg'),
(19, 20, 'http://www.gulp.pk/uploads/images/cover/cvr_4459_31268.jpg'),
(20, 21, 'http://freddo.com.ar/wp-content/uploads/2015/03/Ambientada-vasito-ok2_00034.png'),
(21, 22, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/camara-digital-kodak-az651-negra/56dbed2894b4888a994aa0bc81c204a3ed32b25ae636b5f651bb6ba832c46f83_1000'),
(22, 23, 'https://d3lfzbr90tctqz.cloudfront.net/epi/resource/r/smart-tv-samsung-32-full-hd-un32j5500agcdf/344f9076ed9cd7069fd4f60b96d0966ec6af1c3f0b2a0f533909eb680d249a09_1000');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`pro_id`, `pro_nom`, `pro_pre`, `pro_des`, `pro_emp`, `pro_fecha_pub`) VALUES
(2, 'Tablet Samsung', 2999, 'TAB T113 7 " Spreadtrum Blanco 8 GB', 1, '2017-02-14'),
(3, 'Celular Libre Samsung J2', 3999, 'PRIME SM-G532MZSMCTI Plateado IATEC', 3, '2017-03-31'),
(4, 'Notebook DELL', 10999, 'Inspiron 14 3000 - 3458 Intel Core i3', 1, '2017-04-17'),
(5, 'Notebook VAIO', 13999, 'VJF155A0111B Intel Core i3', 2, '2017-05-25'),
(6, 'Cafetera Nespresso', 3990, 'INISSIA BLACK + AEROCCINO 3', 1, '2017-05-27'),
(7, 'Aspiradora ATMA', 1399, 'AS8912E 1700 W', 4, '2017-05-28'),
(8, 'Heladera Electrolux', 15999, 'No Frost DF3500P Plata', 2, '2017-05-29'),
(9, 'Lavarropas Drean', 7499, 'Automático 6 KG NEXT 6.08 Blanco', 3, '2017-05-30'),
(10, 'Especiero', 89, 'Redondo con Tapa de Ceramica Liv Home 230ml', 1, '2017-05-31'),
(11, 'Cesto de Residuos', 379, 'Acero Inoxidable Liv Home Ovalado 3Lts', 4, '2017-06-01'),
(12, 'Batería de Cocina', 1309, 'Aluminio Hudson Valley 6pzs', 2, '2017-02-16'),
(13, 'Tabla de Picar', 219, 'Madera Nouvelle Cuisine', 3, '2017-01-27'),
(14, 'Comoda Chifonier', 999, 'Con 5 Cajones Color Wengue', 1, '2017-01-21'),
(15, 'Mueble Botinero', 1259, 'Para 24 Pares de Zapatos Color Wengue', 4, '2017-03-07'),
(16, 'Mesa de Luz', 519, 'Con Desayunador Color Wengue', 3, '2017-04-16'),
(17, 'Escritorio Roma', 879, 'Con Cajón y Estante Color Blanco', 1, '2017-02-23'),
(18, 'La Fábrica', 500, '50 sándwiches de miga triples livianos', 4, '2017-04-24'),
(19, 'La Espiga de Oro', 250, '24 canelones listos con salsa a elección + 1 kg de fetucchinis a la crema', 2, '2017-03-29'),
(20, 'Subway', 79, '15 o 30 cm a elección + gaseosa + paquete de papas o cookie', 3, '2017-03-12'),
(21, 'Freddo', 195, 'Promoción por 1 kg de helado', 4, '2017-04-11'),
(22, 'Kodak', 11999, 'Cámara Digital Kodak AZ651 Negra', 2, '2017-04-29'),
(23, 'Smart TV Samsung', 7199, '32 " Full HD. Un TV más inteligente que te acerca a tus contenidos en un instante ', 1, '2017-04-18');

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
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 5),
(19, 5),
(20, 5),
(21, 5),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(22, 6),
(23, 6);

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
