-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 26, 2016 at 11:44 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orders`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `supermarket_id`       VARCHAR(200)          DEFAULT NULL,
  `category_name`        VARCHAR(100) NOT NULL,
  `category_description` TINYTEXT     NOT NULL,
  `category_icon`        TEXT,
  `created_at`           TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id`          INT(11)      NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`supermarket_id`, `category_name`, `category_description`, `category_icon`, `created_at`, `category_id`)
VALUES
  ('69bd04e3438a6929309bc3e9917a5fe11056ddcc', 'Beverages', 'Soda, cold drinks, fruit juice',
   'http://www.princess.com/images/ships-and-experience/food-and-dining/beverages/all_inclusive.jpg',
   '2016-08-14 16:47:16', 1),
  ('69bd04e3438a6929309bc3e9917a5fe11056ddcc', 'Canned goods', 'vegetables, spaghetti sauce, ketchup',
   'http://www.foodanddrinkeurope.com/var/plain_site/storage/images/publications/food-beverage-nutrition/foodproductiondaily.com/packaging/canned-foods-industry-in-decline/8255380-1-eng-GB/Canned-foods-industry-in-decline.jpg',
   '2016-08-14 16:47:16', 2),
  ('69bd04e3438a6929309bc3e9917a5fe11056ddcc', 'Frozen Foods', 'waffles, vegetables, individual meals, ice cream',
   'http://silvamkt.com/departments/frozen/frozen.jpg', '2016-08-14 16:47:40', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products`
--

CREATE TABLE `ordered_products` (
  `order_id`            INT(11)            DEFAULT NULL,
  `product_id`          INT(11)            DEFAULT NULL,
  `quantity`            INT(11)            DEFAULT NULL,
  `created_at`          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_ordered_products` INT(11)   NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `category_id`   INT(11)      NOT NULL,
  `product_name`  VARCHAR(100) NOT NULL,
  `product_price` FLOAT        NOT NULL,
  `created_at`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id`    INT(11)      NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`category_id`, `product_name`, `product_price`, `created_at`, `product_id`) VALUES
  (1, 'Apple Juice', 200, '2016-08-14 17:06:59', 1),
  (1, 'Milk', 50, '2016-08-14 17:06:59', 2),
  (1, 'Coffee', 150, '2016-08-14 17:06:59', 3),
  (1, 'Soda Bottle 500ML', 50, '2016-08-14 17:06:59', 4),
  (1, 'Keringet Water 500ML', 80, '2016-08-14 17:06:59', 5),
  (2, 'Chicken Noodle Soup, regular', 250, '2016-08-14 17:14:11', 6),
  (2, 'Honey 75ML', 1000, '2016-08-14 17:14:11', 7),
  (2, 'Mushrooms, stems/pieces', 750, '2016-08-14 17:14:11', 8),
  (2, 'Spaghetti Sauce', 560, '2016-08-14 17:14:11', 9),
  (2, 'Vanilla Extract, pure', 270, '2016-08-14 17:14:11', 10);

-- --------------------------------------------------------

--
-- Table structure for table `supermarkets`
--

CREATE TABLE `supermarkets` (
  `supermarket_id`   VARCHAR(200) NOT NULL,
  `place_id`         VARCHAR(150) NOT NULL,
  `supermarket_name` VARCHAR(100)          DEFAULT NULL,
  `reference`        LONGTEXT     NOT NULL,
  `created_at`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id`               INT(11)      NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `supermarkets`
--

INSERT INTO `supermarkets` (`supermarket_id`, `place_id`, `supermarket_name`, `reference`, `created_at`, `id`) VALUES
  ('69bd04e3438a6929309bc3e9917a5fe11056ddcc', 'ChIJszuZn9MQLxgRjRVyQDAYqvs', 'Nakumatt Lifestyle',
   'CnRmAAAAEgP2lMDgZ2OBvuIo7GjhVt2LACX2w5wQcwvu05PA7FD_SHNtf5_KgV_cYiAicO3Wj_g6FXotVveGEpXuKthSGHcPijfLT4bgoOLje0ptzflsmndsC1TDTiSPRHokh4zWnQicBS815tmguONtPAeyWhIQOkxQLqV_owjQey6oV0ZzNRoUI79bUXpNnRL1kLSQeHJF4SIMFQU',
   '2016-08-14 16:36:07', 1),
  ('39ce3210c0bdfb6929c531dbb3c18b740f8395e0', 'ChIJdxvD6RsXLxgRnkhjKpJiBW8', 'Nakumatt Highridge',
   'CnRlAAAAoOT-8BtZBYS30IUtjiR76k0tSgdyMgxfYursrDp_3ZvzJeV6QIuv7WoJ6xjx6xr5w8XU116dAmhTtU8bvp9f6TwzceMskqeDMeA3Qj62SwBCebp8MF2ZYLlenrKEl2mHjV5pJrnQaPrlKfBUF7IwOhIQ69OAPhG9jZw3Bb0jU9IXRBoUg9_QWihQbH3u6Yz2Nv5XNgK7RNI',
   '2016-08-14 16:36:07', 2),
  ('99da31841a68cc81978821a2880bf5a11fc19d7c', 'ChIJq23KtQIRLxgRxz7BZL1xmvg', 'Nakumatt Mega',
   'CnRhAAAA21qDHT_8B9QSCjSm8VP9qNonBro3FJNkNjN3rd29mvBcqWvZBXE52yeBzVQO4lHYYRfvg0lY_t2ety8rbWlHVrK514HBGtfgs8R0ozDZ80ZmUNs-UNpLrRD-P82xqgK34loGbgkwFKxRPxeJWoJKfRIQ1YIh5ijQ7c40fUp7eP1bcRoUSx_uLcmw1c4c9fzAkzrrHBMjgOo',
   '2016-08-14 16:38:05', 3),
  ('9b6944beefb7ee0f2e6f20756acfd55dd95a2933', 'ChIJz6zD_ScRLxgRwpts1DYUHr4', 'M-Pesa Uchumi Supermarket',
   'CnRtAAAAdftd3nhgUtGQQBdIWMHheuPWYNkaMUHDosXu5bINgnCqQ0N_bTzUqKShg0kpyBHd9pLGqKIbigUdu0uVG_G8AH1IMnQoYuM5xljXfRQjcylQgrfEFh29AnBU4NSd7y2leyUur5geb3ev5sRmHFsgwxIQ0_c4n1sUUhz4gc9R6XAA9xoUu-oGPFvdNOHlk1Ktt2UywCsy6Pk',
   '2016-07-01 18:35:12', 4),
  ('a50704affeb125005587388d4f214d69c6959ae7', 'ChIJw7SYqSkRLxgRnOOnrxiCVg4', 'Tuskys',
   'CmRZAAAAa2mqEiLcr27bk-dlu2RlhsDcw29WnYaaw58FYqf6GiVMBzW8BjPMQBWTntiRzh2qXF7hNjFUt_nmAFEE9TpphoPOQpjWpV62QjawyVsILxI4c71mvxRd5qkKBgqocFR8EhA0kZyRLRLbZG9E0VYOIDKDGhRXgBoV2-7ZxXxjeXQx7nPe9edqAw',
   '2016-07-01 18:35:12', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_number`    INT(11)            DEFAULT NULL,
  `full_name`    VARCHAR(100)       DEFAULT NULL,
  `gender`       VARCHAR(10)        DEFAULT NULL,
  `location`     TINYTEXT,
  `phone_number` VARCHAR(15)        DEFAULT NULL,
  `created_at`   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id`      INT(11)   NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_number`, `full_name`, `gender`, `location`, `phone_number`, `created_at`, `user_id`) VALUES
  (30776967, 'admin admin', 'female', 'nairobi sameer', '1000', '2016-08-26 13:40:02', 1),
  (100, 'kevin', 'male', 'naivasha\npub, near cheifs office', '100', '2016-08-26 20:13:08', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `user_id_number` INT(11)            DEFAULT NULL,
  `order_date`     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at`     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id`       INT(11)   NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_supermarket_supermarket_id_fk` (`supermarket_id`);

--
-- Indexes for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD PRIMARY KEY (`id_ordered_products`),
  ADD KEY `ordered_products_user_orders_order_id_fk` (`order_id`),
  ADD KEY `ordered_products_product_product_id_fk` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_category_category_id_fk` (`category_id`);

--
-- Indexes for table `supermarkets`
--
ALTER TABLE `supermarkets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supermarket_supermarket_id_uindex` (`supermarket_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_id_number_uindex` (`id_number`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `ordered_products_users_id_number_fk` (`user_id_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;
--
-- AUTO_INCREMENT for table `ordered_products`
--
ALTER TABLE `ordered_products`
  MODIFY `id_ordered_products` INT(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;
--
-- AUTO_INCREMENT for table `supermarkets`
--
ALTER TABLE `supermarkets`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;
--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `category_supermarket_supermarket_id_fk` FOREIGN KEY (`supermarket_id`) REFERENCES `supermarkets` (`supermarket_id`);

--
-- Constraints for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD CONSTRAINT `ordered_products_product_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `ordered_products_user_orders_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `user_orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD CONSTRAINT `ordered_products_users_id_number_fk` FOREIGN KEY (`user_id_number`) REFERENCES `users` (`id_number`);

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
