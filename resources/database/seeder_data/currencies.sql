-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 10, 2025 at 07:52 AM
-- Server version: 8.0.42
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cartuser`
--

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active : 1, Inactive : 2, default : 3',
  `default` tinyint DEFAULT NULL COMMENT 'yes: 1, no: 2	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `uid`, `name`, `symbol`, `rate`, `status`, `default`, `created_at`, `updated_at`) VALUES
(1, 'XDU0r=xopoii-pg9Av56z-4YQ4', 'BDT', '৳', 100.00000000, 1, 2, NULL, '2024-01-23 06:12:23'),
(2, 'XDU-xxuii-pg9Av56z-4YQ4', 'INR', 'Y', 77.71000000, 2, 2, NULL, '2024-01-23 06:12:23'),
(4, 'XDUi-pg9A44434-4v56z-4YQ4', 'USD', '$', 1.00000000, 1, 1, NULL, '2024-01-23 06:12:23'),
(7, '146D-CGPAx0if-OLcP', 'NGN', 'ngn', 1.00000000, 1, 2, '2023-04-06 06:07:31', '2024-01-23 06:12:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
