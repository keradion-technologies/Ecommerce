-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 10, 2025 at 07:49 AM
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
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `gateway_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credential` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active : 1, Inactive : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `gateway_code`, `name`, `credential`, `status`, `created_at`, `updated_at`) VALUES
(13, '101VON', 'vonage', '{\"api_key\":\"@@\",\"api_secret\":\"@@\",\"sender_id\":\"@@\"}', 1, '2024-03-18 08:08:37', '2024-03-18 08:08:37'),
(14, '103BIRD', 'messagebird', '{\"access_key\":\"@@\",\"sender_id\":\"@@\"}', 1, '2024-03-18 08:08:37', '2024-03-18 08:08:37'),
(15, '102TWI', 'twilio', '{\"account_sid\":\"@@\",\"auth_token\":\"@@\",\"from_number\":\"@@\"}', 1, '2024-03-18 08:08:37', '2024-03-18 08:08:37'),
(16, '104INFO', 'infobip', '{\"sender_id\":\"@@\",\"infobip_api_key\":\"@@\",\"infobip_base_url\":\"@@\"}', 1, '2024-03-18 08:08:37', '2024-03-18 08:08:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
