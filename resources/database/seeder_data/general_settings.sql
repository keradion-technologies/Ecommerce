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
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loder_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'loder_logo.jpg',
  `invoice_logo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_logo_lg` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default.jpg',
  `admin_logo_sm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `guest_checkout` int NOT NULL DEFAULT '0' COMMENT 'Enable : 1,Disable :0',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seller_mode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `site_favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `font_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_gateway_id` int DEFAULT NULL,
  `commission` decimal(18,8) DEFAULT NULL,
  `mail_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_prefix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_gateway_id` int DEFAULT NULL,
  `email_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_notification` tinyint DEFAULT NULL COMMENT 'Yes : 1, No : 2',
  `sms_notification` tinyint DEFAULT '1' COMMENT 'Enable : 1, Disable : 2',
  `search_min` decimal(18,8) DEFAULT '0.00000000',
  `search_max` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `s_login_google_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `s_login_facebook_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refund` tinyint DEFAULT '0',
  `preloader` tinyint NOT NULL DEFAULT '0' COMMENT 'Active 1 , Inactive 0',
  `tawk_to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refund_time_limit` int NOT NULL DEFAULT '10',
  `app_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seller_reg_allow` tinyint DEFAULT '1' COMMENT 'ON : 1, OFF : 2',
  `status_expiry` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_section` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `app_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_installed_at` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maintenance_mode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strong_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_ai_setting` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `otp_configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `task_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `uid`, `site_name`, `logo`, `loder_logo`, `invoice_logo`, `admin_logo_lg`, `admin_logo_sm`, `site_logo`, `cod`, `guest_checkout`, `address`, `copyright_text`, `seller_mode`, `site_favicon`, `currency_name`, `currency_symbol`, `primary_color`, `secondary_color`, `font_color`, `sms_gateway_id`, `commission`, `mail_from`, `phone`, `order_prefix`, `email_gateway_id`, `email_template`, `sms_template`, `email_notification`, `sms_notification`, `search_min`, `search_max`, `s_login_google_info`, `s_login_facebook_info`, `refund`, `preloader`, `tawk_to`, `refund_time_limit`, `app_settings`, `seller_reg_allow`, `status_expiry`, `banner_section`, `app_version`, `system_installed_at`, `security_settings`, `maintenance_mode`, `strong_password`, `open_ai_setting`, `otp_configuration`, `task_config`, `last_cron_run`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Cartuser', 'fsad', 'loder_logo.jpg', '{\"Cash On Delivery\":\"64046349de2aa1678009161.png\",\"unpaid\":\"6404635f52c081678009183.png\",\"paid\":\"640463728b0d31678009202.png\",\"Delivered\":\"6404637290b261678009202.png\"}', 'admin_site_logo.jpg', NULL, NULL, 'active', 1, '1210 Bingamon Road ,Garfield Heights', '©cartuser.com | All brands and registered hallmarks belongings to the right owners.', 'active', 'fs', 'USD', '$', 'E40046', '094966', 'fff', 13, 2.00000000, 'cartuser@gmail.com', '+15678781998', 'cartuser', 1, 'Hello {{username}}\r\n{{message}}', 'hi {{name}}, {{message}}', 1, 2, 20.00000000, 7000.00000000, '{\"g_client_id\":\"@@@@@@@@\",\"g_client_secret\":\"@@@@@@@@\",\"g_status\":\"2\"}', '{\"f_client_id\":\"@@@@@@@@\",\"f_client_secret\":\"@@@@@@@@\",\"f_status\":\"2\"}', NULL, 0, '{\"property_id\":\"@@@\",\"widget_id\":\"@@@\",\"status\":\"0\"}', 0, '{\"page_-1\":{\"image\":null,\"heading\":\"Welcome to Fluute: Your Ultimate Music Companion\",\"description\":\"Get ready to elevate your music experience with Fluute \\u2013 the ultimate music companion. Dive into a world of endless tunes, curated playlists, and personalized recommendations. Join Fluute today and let the music take you on a journey.\"},\"page_2\":{\"image\":null,\"heading\":\"Personalized Recommendations Just for You\\\"\",\"description\":\"Get ready to elevate your music experience with Fluute \\u2013 the ultimate music companion. Dive into a world of endless tunes, curated playlists, and personalized recommendations. Join Fluute today and let the music take you on a journey.\\\"\"}}', 1, '10', 'Full_Width_Banner', '1.1', '2024-03-19 09:22:10', '{\"dos_attempts\":\"2000\",\"dos_attempts_in_second\":\"2\",\"dos_security\":\"captcha\"}', '2', '1', '{\"key\":\"@@@@@@@@@@\",\"status\":\"1\"}', '{\"phone_otp\":\"0\",\"email_otp\":\"0\",\"login_with_password\":\"1\"}', NULL, NULL, NULL, '2024-03-19 09:22:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
