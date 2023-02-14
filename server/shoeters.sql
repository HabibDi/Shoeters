-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 26 jan. 2023 à 15:49
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shoeters`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
CREATE TABLE IF NOT EXISTS `adresses` (
  `adress_id` int(11) NOT NULL,
  `firstname` varchar(128) NOT NULL,
  `lastname` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `adress` varchar(256) NOT NULL,
  `zip_code` int(11) NOT NULL,
  PRIMARY KEY (`adress_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(64) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'Nike'),
(2, 'Puma'),
(3, 'Adidas');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL,
  `parent_category` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `genders`
--

DROP TABLE IF EXISTS `genders`;
CREATE TABLE IF NOT EXISTS `genders` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(64) NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_name`) VALUES
(1, 'Men'),
(2, 'Women'),
(3, 'Children');

-- --------------------------------------------------------

--
-- Structure de la table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
CREATE TABLE IF NOT EXISTS `orders_details` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_total` decimal(5,2) NOT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(256) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_img` varchar(512) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL DEFAULT '10',
  `category_id` int(11) NOT NULL DEFAULT '1',
  `gender_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `fk_brand_id` (`brand_id`),
  KEY `fk_gender_id` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `brand_id`, `product_img`, `price`, `quantity_in_stock`, `category_id`, `gender_id`) VALUES
(2, 'Nike Dunk Low Retro', 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTWoDh1GEHz0xNAIjxEyZMU_1UV-bSIDTQ9g&usqp=CAU', '99.99', 10, 1, 1),
(3, 'Puma wild Rider layers', 2, 'https://media.gqmagazine.fr/photos/60ace6ec59feb6bf2d96e9bb/master/w_1920,h_1280,c_limit/25052021_JAY_01.jpg', '99.99', 10, 1, 1),
(4, 'Adidas Niteball', 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAIRixflZv7TSILjVds0O6cm9ZsOeYLIcXPA&usqp=CAU ', '99.99', 10, 1, 1),
(5, 'Puma Slipstream', 2, 'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_450,h_450/global/388634/03/sv01/fnd/EEA/fmt/png/Baskets-Slipstream-Suede-FS', '89.99', 10, 1, 2),
(6, 'Nike Blazer Bordeaux', 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI62tRQBAOH7XVNRdhSFWOcgZ9INzdQkJBXrbd6xRP0UQXAVkrcIbUZpq6MJtNSwxS3WA&usqp=CAU', '89.99', 10, 1, 2),
(7, 'Adidas Nmd Light Gray', 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWmQWd4EDgpOsVJLhLDX7cnxXMeRoHm1ZxRg&usqp=CAU', '89.99', 10, 1, 2),
(8, 'Nike Huarache Big Run', 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ98J4ZWpKfcCfxMArVtbWL6MUjlowNEwg_LQ&usqp=CAU', '49.99', 10, 1, 3),
(9, 'Puma Rs-x Toys', 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRCdfefjY4_adVx87Mlel1fhCmXsJ5NUJ_nQ&usqp=CAU', '49.99', 10, 1, 3),
(10, ' Adidas High Top Postmove', 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgPYXt_SGQ-1IQywi4I20lHtcybzh7BXnblA&usqp=CAU', '49.99', 10, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`email`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_id_2` (`user_id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `creation_date`) VALUES
(2, 'habib2@gmail.com', 'hello', '2023-01-24 12:16:47'),
(3, 'habib3@gmail.com', '$2b$10$BRgaiHIlwtHo9rvAvT1esOEiohKwnasUmCRCn0sT9Z6jWeO2XAWwe', '2023-01-24 17:11:19'),
(4, 'habib4@gmail.com', '$2b$10$JDz2stJJJpxxpEzZH8QQBO7jb65wImrG4SORfBE5fFbmZXMEH1R.m', '2023-01-24 17:27:46'),
(1, 'habib@gmail.com', 'hello', '2023-01-24 12:11:00');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
