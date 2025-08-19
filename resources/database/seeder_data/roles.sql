-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 10, 2025 at 07:50 AM
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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `uid`, `created_by`, `updated_by`, `name`, `slug`, `permissions`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'SuperAdmin', 'superadmin', '[{\"admin\": [\"view_admin\", \"update_profile\", \"create_admin\", \"update_admin\", \"delete_admin\"]}, {\"language\": [\"view_languages\", \"create_languages\", \"update_languages\", \"delete_languages\"]}, {\"role\": [\"view_roles\", \"create_roles\", \"update_roles\", \"delete_roles\"]}, {\"dashboard\": [\"view_dashboard\"]}, {\"order\": [\"view_order\", \"update_order\", \"delete_order\"]}, {\"configuration\": [\"view_configuration\", \"update_configuration\", \"delete_configuration\"]}, {\"settings\": [\"view_settings\", \"update_settings\", \"create_settings\"]}, {\"support\": [\"view_support\", \"update_support\", \"create_support\", \"delete_support\"]}, {\"Payment System\": [\"view_method\", \"update_method\", \"create_method\", \"delete_method\"]}, {\"brand\": [\"view_brand\", \"update_brand\", \"create_brand\", \"delete_brand\"]}, {\"category\": [\"view_category\", \"update_category\", \"create_category\", \"delete_category\"]}, {\"product\": [\"view_product\", \"update_product\", \"create_product\", \"delete_product\"]}, {\"promote\": [\"manage_deal\", \"manage_offer\", \"manage_cuppon\", \"manage_campaign\"]}, {\"log\": [\"view_log\", \"update_log\", \"delete_log\"]}, {\"blog\": [\"manage_blog\"]}, {\"seller\": [\"view_seller\", \"update_seller\", \"delete_seller\"]}, {\"customer\": [\"manage_customer\"]}, {\"delivery_man\": [\"manage_delivery_man\"]}, {\"pos_system\": [\"manage_pos_system\"]}, {\"frontend\": [\"manage_frontend\"]}, {\"countries\": [\"manage_countries\"]}, {\"states\": [\"manage_states\"]}, {\"cities\": [\"manage_cities\"]}, {\"zones\": [\"manage_zones\"]}, {\"tax\": [\"manage_taxes\"]}]', '1', '2023-03-14 14:09:00', '2025-07-23 10:04:31'),
(4, '8vw2-mcnUob6E-iC9f', 1, NULL, 'Manager', 'manager', '[{\"admin\": [\"view_admin\", \"update_profile\"]}, {\"language\": [\"update_languages\", \"delete_languages\"]}, {\"role\": [\"update_roles\", \"delete_roles\"]}, {\"dashboard\": [\"view_dashboard\"]}, {\"order\": [\"delete_order\"]}, {\"configuration\": [\"update_configuration\"]}, {\"settings\": [\"view_settings\", \"update_settings\", \"create_settings\"]}, {\"support\": [\"view_support\", \"update_support\", \"create_support\", \"delete_support\"]}, {\"Payment System\": [\"view_method\", \"delete_method\"]}, {\"brand\": [\"view_brand\", \"update_brand\"]}, {\"category\": [\"view_category\", \"update_category\", \"create_category\"]}, {\"product\": [\"view_product\", \"create_product\"]}, {\"promote\": [\"manage_deal\"]}, {\"log\": [\"view_log\", \"delete_log\"]}]', '1', '2024-01-23 05:54:48', '2024-02-15 05:10:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
