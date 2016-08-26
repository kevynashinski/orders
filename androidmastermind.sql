-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2016 at 12:35 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `androidmastermind`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id`             INT(11)      NOT NULL AUTO_INCREMENT,
  `category_name`  VARCHAR(100) NOT NULL,
  `supermarket_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_id_uindex` (`id`),
  UNIQUE KEY `products_category_name_uindex` (`category_name`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id`            INT(11)      NOT NULL AUTO_INCREMENT,
  `product_name`  VARCHAR(100) NOT NULL,
  `product_price` DOUBLE       NOT NULL,
  `category_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_category_name_uindex` (`category_name`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 1;

-- --------------------------------------------------------

--
-- Table structure for table `supermarket`
--

CREATE TABLE IF NOT EXISTS `supermarket` (
  `id`             INT(11)      NOT NULL AUTO_INCREMENT,
  `supermarket_id` VARCHAR(100) NOT NULL,
  `place_id`       TEXT         NOT NULL,
  `place_name`     TEXT         NOT NULL,
  `reference`      LONGTEXT     NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `supermarket_supermarket_id_uindex` (`supermarket_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  AUTO_INCREMENT = 5;

--
-- Dumping data for table `supermarket`
--

INSERT INTO supermarkets (`id`, `supermarket_id`, `place_id`, `place_name`, `reference`) VALUES
  (1, '39ce3210c0bdfb6929c531dbb3c18b740f8395e0', 'ChIJdxvD6RsXLxgRnkhjKpJiBW8', 'Nakumatt Lifestyle',
   'CnRmAAAAiAX2oDJR3FXS2WSCqroL0dsPoAKKwVl78cKA3YonlN8KDP5mOwVSvzS8Yv04Y9j_8IyiNVIEA-KWoADPSIfW016oX5SyOmqGsM2P8GueTRVL4quTDZBlaUrdARUsT5AgohPLTzQvIUcquP3YSpslUhIQybldu5oPBFCHCiPkNaUhPhoUIkWK83InAIV9gQSZm75b2ttk6Z4'),
  (2, '99da31841a68cc81978821a2880bf5a11fc19d7c', 'ChIJq23KtQIRLxgRxz7BZL1xmvg', 'Nakumatt Mega',
   'CnRhAAAAuufNs7vknEpwiWTJ9Svyir5BEcS4AibANouAtBl_GIIoZ3rFO7NMCc9IJ80N8vtspw3aUZ1U7fxHEQLK-eUO1T9zycciADghj5ObkPu1lR_j_jI-ViwvCyYUs_calovKV5bBOnM6WOmIy9EjqbyuWxIQoLPBjPc_sOQszM7VRuvL5RoUy5JBKoXoxg_oEiMeM1ps2Qpnad0'),
  (3, '9b6944beefb7ee0f2e6f20756acfd55dd95a2933', 'ChIJz6zD_ScRLxgRwpts1DYUHr4', 'M-Pesa Uchumi Supermarket',
   'CnRtAAAAdftd3nhgUtGQQBdIWMHheuPWYNkaMUHDosXu5bINgnCqQ0N_bTzUqKShg0kpyBHd9pLGqKIbigUdu0uVG_G8AH1IMnQoYuM5xljXfRQjcylQgrfEFh29AnBU4NSd7y2leyUur5geb3ev5sRmHFsgwxIQ0_c4n1sUUhz4gc9R6XAA9xoUu-oGPFvdNOHlk1Ktt2UywCsy6Pk'),
  (4, 'a50704affeb125005587388d4f214d69c6959ae7', 'ChIJw7SYqSkRLxgRnOOnrxiCVg4', 'Tuskys',
   'CmRZAAAAa2mqEiLcr27bk-dlu2RlhsDcw29WnYaaw58FYqf6GiVMBzW8BjPMQBWTntiRzh2qXF7hNjFUt_nmAFEE9TpphoPOQpjWpV62QjawyVsILxI4c71mvxRd5qkKBgqocFR8EhA0kZyRLRLbZG9E0VYOIDKDGhRXgBoV2-7ZxXxjeXQx7nPe9edqAw');

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
