-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 14, 2025 at 07:44 AM
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
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active: 1, Inactive: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `uid`, `role_id`, `created_by`, `updated_by`, `name`, `user_name`, `email`, `phone`, `image`, `address`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, '9k8l-dQaLRVk3-1GiC', 1, NULL, NULL, 'SuperAdmin', 'admin', 'admin@cartuser.com', NULL, NULL, NULL, '$2y$10$HD03SCabNlppjQIpf3MymeJ8vWt39P1epQj4AHJQF5eS82FDy9GBy', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '2' COMMENT 'Active: 1, Inactive: 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_id` int DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active: 1, Inactive: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `post` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active: 1, Inactive: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int DEFAULT NULL,
  `name` json DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active: 1, Inactive: 2',
  `top` tinyint NOT NULL DEFAULT '1' COMMENT 'No: 1, Yes: 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` json DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `discount_type` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Percent: 1, Flat: 0',
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_home_page` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Yes: 1, No: 0',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active: 1, Inactive: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_products`
--

CREATE TABLE `campaign_products` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `discount_type` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Percent: 1, Flat: 0',
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `campaign_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `currency_id` bigint DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double(20,8) NOT NULL DEFAULT '0.00000000',
  `total_taxes` double(20,8) NOT NULL DEFAULT '0.00000000',
  `total` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_price` double(20,8) NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxes` longtext COLLATE utf8mb4_unicode_ci,
  `attribute` json DEFAULT NULL,
  `attributes_value` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int NOT NULL DEFAULT '1',
  `name` json DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'No: 0, Yes: 1',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active: 1, Inactive: 0',
  `top` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'No: 0, Yes: 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_fee` double(25,8) NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Visible: 1, hidden: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compare_product_lists`
--

CREATE TABLE `compare_product_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Visible: 1, hidden: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(2, 'Åland Islands', 'AX', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(3, 'Albania', 'AL', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(4, 'Algeria', 'DZ', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(5, 'American Samoa', 'AS', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(6, 'AndorrA', 'AD', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(7, 'Angola', 'AO', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(8, 'Anguilla', 'AI', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(9, 'Antarctica', 'AQ', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(10, 'Antigua and Barbuda', 'AG', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(11, 'Argentina', 'AR', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(12, 'Armenia', 'AM', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(13, 'Aruba', 'AW', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(14, 'Australia', 'AU', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(15, 'Austria', 'AT', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(16, 'Azerbaijan', 'AZ', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(17, 'Bahamas', 'BS', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(18, 'Bahrain', 'BH', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(19, 'Bangladesh', 'BD', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(20, 'Barbados', 'BB', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(21, 'Belarus', 'BY', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(22, 'Belgium', 'BE', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(23, 'Belize', 'BZ', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(24, 'Benin', 'BJ', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(25, 'Bermuda', 'BM', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(26, 'Bhutan', 'BT', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(27, 'Bolivia', 'BO', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(28, 'Bosnia and Herzegovina', 'BA', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(29, 'Botswana', 'BW', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(30, 'Bouvet Island', 'BV', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(31, 'Brazil', 'BR', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(32, 'British Indian Ocean Territory', 'IO', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(33, 'Brunei Darussalam', 'BN', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(34, 'Bulgaria', 'BG', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(35, 'Burkina Faso', 'BF', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(36, 'Burundi', 'BI', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(37, 'Cambodia', 'KH', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(38, 'Cameroon', 'CM', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(39, 'Canada', 'CA', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(40, 'Cape Verde', 'CV', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(41, 'Cayman Islands', 'KY', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(42, 'Central African Republic', 'CF', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(43, 'Chad', 'TD', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(44, 'Chile', 'CL', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(45, 'China', 'CN', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(46, 'Christmas Island', 'CX', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(47, 'Cocos (Keeling) Islands', 'CC', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(48, 'Colombia', 'CO', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(49, 'Comoros', 'KM', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(50, 'Congo', 'CG', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(51, 'Congo, The Democratic Republic of the', 'CD', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(52, 'Cook Islands', 'CK', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(53, 'Costa Rica', 'CR', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(54, 'Cote D\'Ivoire', 'CI', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(55, 'Croatia', 'HR', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(56, 'Cuba', 'CU', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(57, 'Cyprus', 'CY', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(58, 'Czech Republic', 'CZ', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(59, 'Denmark', 'DK', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(60, 'Djibouti', 'DJ', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(61, 'Dominica', 'DM', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(62, 'Dominican Republic', 'DO', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(63, 'Ecuador', 'EC', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(64, 'Egypt', 'EG', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(65, 'El Salvador', 'SV', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(66, 'Equatorial Guinea', 'GQ', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(67, 'Eritrea', 'ER', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(68, 'Estonia', 'EE', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(69, 'Ethiopia', 'ET', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(70, 'Falkland Islands (Malvinas)', 'FK', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(71, 'Faroe Islands', 'FO', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(72, 'Fiji', 'FJ', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(73, 'Finland', 'FI', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(74, 'France', 'FR', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(75, 'French Guiana', 'GF', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(76, 'French Polynesia', 'PF', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(77, 'French Southern Territories', 'TF', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(78, 'Gabon', 'GA', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(79, 'Gambia', 'GM', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(80, 'Georgia', 'GE', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(81, 'Germany', 'DE', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(82, 'Ghana', 'GH', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(83, 'Gibraltar', 'GI', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(84, 'Greece', 'GR', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(85, 'Greenland', 'GL', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(86, 'Grenada', 'GD', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(87, 'Guadeloupe', 'GP', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(88, 'Guam', 'GU', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(89, 'Guatemala', 'GT', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(90, 'Guernsey', 'GG', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(91, 'Guinea', 'GN', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(92, 'Guinea-Bissau', 'GW', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(93, 'Guyana', 'GY', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(94, 'Haiti', 'HT', '1', '2025-08-14 14:37:46', '2025-08-14 14:37:46'),
(95, 'Heard Island and Mcdonald Islands', 'HM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(96, 'Holy See (Vatican City State)', 'VA', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(97, 'Honduras', 'HN', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(98, 'Hong Kong', 'HK', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(99, 'Hungary', 'HU', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(100, 'Iceland', 'IS', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(101, 'India', 'IN', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(102, 'Indonesia', 'ID', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(103, 'Iran, Islamic Republic Of', 'IR', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(104, 'Iraq', 'IQ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(105, 'Ireland', 'IE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(106, 'Isle of Man', 'IM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(107, 'Israel', 'IL', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(108, 'Italy', 'IT', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(109, 'Jamaica', 'JM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(110, 'Japan', 'JP', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(111, 'Jersey', 'JE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(112, 'Jordan', 'JO', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(113, 'Kazakhstan', 'KZ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(114, 'Kenya', 'KE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(115, 'Kiribati', 'KI', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(116, 'Korea, Democratic People\'S Republic of', 'KP', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(117, 'Korea, Republic of', 'KR', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(118, 'Kuwait', 'KW', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(119, 'Kyrgyzstan', 'KG', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(120, 'Lao People\'S Democratic Republic', 'LA', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(121, 'Latvia', 'LV', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(122, 'Lebanon', 'LB', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(123, 'Lesotho', 'LS', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(124, 'Liberia', 'LR', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(125, 'Libyan Arab Jamahiriya', 'LY', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(126, 'Liechtenstein', 'LI', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(127, 'Lithuania', 'LT', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(128, 'Luxembourg', 'LU', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(129, 'Macao', 'MO', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(130, 'Macedonia, The Former Yugoslav Republic of', 'MK', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(131, 'Madagascar', 'MG', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(132, 'Malawi', 'MW', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(133, 'Malaysia', 'MY', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(134, 'Maldives', 'MV', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(135, 'Mali', 'ML', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(136, 'Malta', 'MT', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(137, 'Marshall Islands', 'MH', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(138, 'Martinique', 'MQ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(139, 'Mauritania', 'MR', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(140, 'Mauritius', 'MU', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(141, 'Mayotte', 'YT', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(142, 'Mexico', 'MX', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(143, 'Micronesia, Federated States of', 'FM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(144, 'Moldova, Republic of', 'MD', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(145, 'Monaco', 'MC', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(146, 'Mongolia', 'MN', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(147, 'Montserrat', 'MS', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(148, 'Morocco', 'MA', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(149, 'Mozambique', 'MZ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(150, 'Myanmar', 'MM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(151, 'Namibia', 'NA', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(152, 'Nauru', 'NR', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(153, 'Nepal', 'NP', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(154, 'Netherlands', 'NL', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(155, 'Netherlands Antilles', 'AN', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(156, 'New Caledonia', 'NC', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(157, 'New Zealand', 'NZ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(158, 'Nicaragua', 'NI', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(159, 'Niger', 'NE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(160, 'Nigeria', 'NG', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(161, 'Niue', 'NU', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(162, 'Norfolk Island', 'NF', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(163, 'Northern Mariana Islands', 'MP', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(164, 'Norway', 'NO', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(165, 'Oman', 'OM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(166, 'Pakistan', 'PK', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(167, 'Palau', 'PW', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(168, 'Palestinian Territory, Occupied', 'PS', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(169, 'Panama', 'PA', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(170, 'Papua New Guinea', 'PG', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(171, 'Paraguay', 'PY', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(172, 'Peru', 'PE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(173, 'Philippines', 'PH', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(174, 'Pitcairn', 'PN', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(175, 'Poland', 'PL', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(176, 'Portugal', 'PT', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(177, 'Puerto Rico', 'PR', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(178, 'Qatar', 'QA', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(179, 'Reunion', 'RE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(180, 'Romania', 'RO', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(181, 'Russian Federation', 'RU', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(182, 'RWANDA', 'RW', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(183, 'Saint Helena', 'SH', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(184, 'Saint Kitts and Nevis', 'KN', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(185, 'Saint Lucia', 'LC', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(186, 'Saint Pierre and Miquelon', 'PM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(187, 'Saint Vincent and the Grenadines', 'VC', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(188, 'Samoa', 'WS', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(189, 'San Marino', 'SM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(190, 'Sao Tome and Principe', 'ST', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(191, 'Saudi Arabia', 'SA', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(192, 'Senegal', 'SN', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(193, 'Serbia and Montenegro', 'CS', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(194, 'Seychelles', 'SC', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(195, 'Sierra Leone', 'SL', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(196, 'Singapore', 'SG', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(197, 'Slovakia', 'SK', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(198, 'Slovenia', 'SI', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(199, 'Solomon Islands', 'SB', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(200, 'Somalia', 'SO', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(201, 'South Africa', 'ZA', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(202, 'South Georgia and the South Sandwich Islands', 'GS', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(203, 'Spain', 'ES', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(204, 'Sri Lanka', 'LK', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(205, 'Sudan', 'SD', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(206, 'Suriname', 'SR', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(207, 'Svalbard and Jan Mayen', 'SJ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(208, 'Swaziland', 'SZ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(209, 'Sweden', 'SE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(210, 'Switzerland', 'CH', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(211, 'Syrian Arab Republic', 'SY', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(212, 'Taiwan, Province of China', 'TW', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(213, 'Tajikistan', 'TJ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(214, 'Tanzania, United Republic of', 'TZ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(215, 'Thailand', 'TH', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(216, 'Timor-Leste', 'TL', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(217, 'Togo', 'TG', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(218, 'Tokelau', 'TK', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(219, 'Tonga', 'TO', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(220, 'Trinidad and Tobago', 'TT', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(221, 'Tunisia', 'TN', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(222, 'Turkey', 'TR', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(223, 'Turkmenistan', 'TM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(224, 'Turks and Caicos Islands', 'TC', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(225, 'Tuvalu', 'TV', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(226, 'Uganda', 'UG', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(227, 'Ukraine', 'UA', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(228, 'United Arab Emirates', 'AE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(229, 'United Kingdom', 'GB', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(230, 'United States', 'US', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(231, 'United States Minor Outlying Islands', 'UM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(232, 'Uruguay', 'UY', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(233, 'Uzbekistan', 'UZ', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(234, 'Vanuatu', 'VU', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(235, 'Venezuela', 'VE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(236, 'Viet Nam', 'VN', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(237, 'Virgin Islands, British', 'VG', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(238, 'Virgin Islands, U.S.', 'VI', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(239, 'Wallis and Futuna', 'WF', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(240, 'Western Sahara', 'EH', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(241, 'Yemen', 'YE', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(242, 'Zambia', 'ZM', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47'),
(243, 'Zimbabwe', 'ZW', '1', '2025-08-14 14:37:47', '2025-08-14 14:37:47');

-- --------------------------------------------------------

--
-- Table structure for table `country_zone`
--

CREATE TABLE `country_zone` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` bigint UNSIGNED NOT NULL,
  `zone_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint DEFAULT NULL COMMENT 'Fixed: 1, Percent: 2',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Enable: 1, Disable: 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `customer_deliveryman_conversations`
--

CREATE TABLE `customer_deliveryman_conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `deliveryman_id` bigint UNSIGNED NOT NULL,
  `sender_role` enum('customer','deliveryman') COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` text COLLATE utf8mb4_unicode_ci,
  `is_seen` tinyint NOT NULL DEFAULT '0' COMMENT 'Yes: 1, No: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_seller_conversations`
--

CREATE TABLE `customer_seller_conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `sender_role` enum('customer','seller') COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` text COLLATE utf8mb4_unicode_ci,
  `is_seen` tinyint NOT NULL DEFAULT '0' COMMENT 'Yes: 1, No: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_earning_logs`
--

CREATE TABLE `deliveryman_earning_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `assigned_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `deliveryman_id` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_password_resets`
--

CREATE TABLE `deliveryman_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_conversations`
--

CREATE TABLE `delivery_man_conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `sender_id` bigint UNSIGNED NOT NULL,
  `receiver_id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` text COLLATE utf8mb4_unicode_ci,
  `is_seen` tinyint NOT NULL DEFAULT '0' COMMENT 'Yes: 1, No: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_orders`
--

CREATE TABLE `delivery_man_orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `assign_by` int UNSIGNED DEFAULT NULL,
  `deliveryman_id` int UNSIGNED DEFAULT NULL,
  `pickup_location` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `feedback` longtext COLLATE utf8mb4_unicode_ci,
  `rejected_reason` longtext COLLATE utf8mb4_unicode_ci,
  `time_line` longtext COLLATE utf8mb4_unicode_ci,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_ratings`
--

CREATE TABLE `delivery_man_ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `delivery_men_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `rating` tinyint NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint UNSIGNED NOT NULL,
  `referral_id` bigint UNSIGNED DEFAULT NULL,
  `country_id` bigint UNSIGNED NOT NULL,
  `referral_code` text COLLATE utf8mb4_unicode_ci,
  `fcm_token` longtext COLLATE utf8mb4_unicode_ci,
  `phone_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(25,8) NOT NULL DEFAULT '0.00000000',
  `enable_push_notification` tinyint DEFAULT NULL,
  `order_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kyc_data` text COLLATE utf8mb4_unicode_ci,
  `last_login_time` timestamp NULL DEFAULT NULL,
  `is_kyc_verified` tinyint DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `is_online` tinyint DEFAULT NULL,
  `point` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `digital_product_attributes`
--

CREATE TABLE `digital_product_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `short_details` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Available : 1, Sold : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `digital_product_attribute_values`
--

CREATE TABLE `digital_product_attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digital_product_attribute_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active : 1, Inactive : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `uid`, `name`, `slug`, `subject`, `body`, `sms_body`, `codes`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Password Reset', 'PASSWORD_RESET', 'Password Reset', 'Your password reset code : {{code}}\r\nRequested Time : {{time}}', 'Your Reset Password {{code}} and time {{time}}', '{\"code\":\"Password Reset Code\", \"time\":\"Time\"}', 1, NULL, '2024-02-15 06:08:24'),
(2, NULL, 'Admin Support Reply', 'SUPPORT_TICKET_REPLY', 'Support Ticket Reply', NULL, 'NOT NOW', '{\"ticket_number\":\"Support Ticket Number\",\"link\":\"Ticket URL For relpy\"}', 1, NULL, '2022-12-04 13:33:45'),
(3, NULL, 'Withdraw Request ', 'WITHDRAW_REQUEST_AMOUNT', 'Withdraw request amount', NULL, NULL, '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Withdraw Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Withdraw Method Name\",\"method_currency\":\"Withdraw Method Currency\",\"method_amount\":\"Withdraw Method Amount After Conversion\", \"user_balance\":\"Users Balance After process\"}', 1, NULL, NULL),
(4, NULL, 'Withdraw Cancel', 'WITHDRAW_CANCEL', 'Withdraw cancelled by admin', NULL, 'Admin can cancel any unwanted withdrawal transaction.', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Withdraw Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Withdraw Method Name\",\"method_currency\":\"Withdraw Method Currency\",\"method_amount\":\"Withdraw Method Amount After Conversion\", \"user_balance\":\"Users Balance After process\"}', 1, NULL, '2022-10-31 05:29:38'),
(5, NULL, 'Withdraw Approved', 'WITHDRAW_APPROVED', 'Withdraw Approved', NULL, NULL, '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Withdraw Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Withdraw Method Name\",\"method_currency\":\"Withdraw Method Currency\",\"method_amount\":\"Withdraw Method Amount After Conversion\", \"user_balance\":\"Users Balance After process\"}', 1, NULL, NULL),
(6, NULL, 'Order Confirmation ', 'ORDER_CONFIRMED', 'Order Confirmed', 'Your Order Number {{order_number}}', NULL, '{\"customer_name\":\"Customer name\",\"customer_email\":\"Customer email\",\"customer_phone\":\"Customer phone\",\"customer_address\":\"Customer address\",\"order_number\":\"Order Number\",\"amount\":\"Total amount\",\"payment_status\":\"Payment status\",\"time\":\"Order time\"}', 1, NULL, '2024-04-29 10:48:23'),
(7, NULL, 'Order Delivered ', 'ORDER_DELIVERED', 'Order Delivery', 'Your Order Number {{order_number}}', NULL, '{\"customer_name\":\"Customer name\",\"customer_email\":\"Customer email\",\"customer_phone\":\"Customer phone\",\"customer_address\":\"Customer address\",\"order_number\":\"Order Number\",\"amount\":\"Total amount\",\"payment_status\":\"Payment status\",\"time\":\"Order time\"}', 1, NULL, '2024-04-29 10:48:23'),
(8, NULL, 'Order Cancel', 'ORDER_CANCEL', 'Order Cancel', 'Your Order Number {{order_number}}', 'NOT NOW', '{\"customer_name\":\"Customer name\",\"customer_email\":\"Customer email\",\"customer_phone\":\"Customer phone\",\"customer_address\":\"Customer address\",\"order_number\":\"Order Number\",\"amount\":\"Total amount\",\"payment_status\":\"Payment status\",\"time\":\"Order time\"}', 1, NULL, '2024-04-29 10:48:23'),
(9, NULL, 'Order Placed', 'ORDER_PLACED', 'Order Placed', 'Your Order Number  {{order_number}}', NULL, '{\"customer_name\":\"Customer name\",\"customer_email\":\"Customer email\",\"customer_phone\":\"Customer phone\",\"customer_address\":\"Customer address\",\"order_number\":\"Order Number\",\"amount\":\"Total amount\",\"payment_status\":\"Payment status\",\"time\":\"Order time\"}', 1, NULL, '2024-04-29 10:48:23'),
(10, NULL, 'Payment Confirmation', 'PAYMENT_CONFIRMED', 'Payment confirm', NULL, NULL, '{\"trx\":\"Transaction Number\",\"amount\":\"Payment Amount\",\"charge\":\"Payment Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Payment Method name\",\"method_currency\":\"Payment Method Currency\"}', 1, NULL, NULL),
(11, NULL, 'Digital Product Order', 'DIGITAL_PRODUCT_ORDER', 'Digital Product Order', NULL, NULL, '{\"customer_name\":\"Customer name\",\"customer_email\":\"Customer email\",\"customer_phone\":\"Customer phone\",\"customer_address\":\"Customer address\",\"order_number\":\"Order Number\",\"amount\":\"Total amount\",\"payment_status\":\"Payment status\",\"time\":\"Order time\"}', 1, NULL, '2024-04-29 10:48:23'),
(12, NULL, 'Admin Password Reset', 'ADMIN_PASSWORD_RESET', 'Admin Password Reset', 'We have received a request to reset the password for your account on {{code}} and Request time {{time}}', 'NOT NOW', '{\"code\":\"Password Reset Code\", \"time\":\"Time\"}', 1, NULL, '2024-02-15 06:10:59'),
(13, NULL, 'Password Reset Confirm', 'ADMIN_PASSWORD_RESET_CONFIRM', 'Admin Password Reset Confirm', '<p>We have received a request to reset the password for your account on {{code}} and Request time {{time}}</p>', NULL, '{\"time\":\"Time\"}', 1, NULL, '2022-05-30 04:48:02'),
(14, NULL, 'Seller Password Reset', 'SELLER_PASSWORD_RESET', 'Seller Password Reset', '<p>We have received a request to reset the password for your account on {{code}} and Request time {{time}}</p>', NULL, '{\"code\":\"Password Reset Code\", \"time\":\"Time\"}', 1, NULL, '2022-05-30 04:48:02'),
(15, NULL, 'Seller Password Reset Confirm', 'SELLER_PASSWORD_RESET_CONFIRM', 'Seller Password Reset Confirm', '<p>We have received a request to reset the password for your account on {{code}} and Request time {{time}}</p>', NULL, '{\"time\":\"Time\"}', 1, NULL, '2022-05-30 04:48:02'),
(16, '7UPy-uKdwxsRt-NfeK', 'OTP Verificaton', 'otp_verification', 'OTP Verificaton', 'Your Otp {{otp_code}} and request time {{time}}', 'Your Otp {{otp_code}} and request time {{time}}', '{\"otp_code\":\"OTP (One time password)\",\"time\":\"Time\"}', 1, '2024-03-18 08:08:23', '2024-03-18 08:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `exclusive_offers`
--

CREATE TABLE `exclusive_offers` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` int DEFAULT NULL,
  `serial` int DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_products`
--

CREATE TABLE `feature_products` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` longtext COLLATE utf8mb4_unicode_ci,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active: 1, Inactive: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `following_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `name`, `slug`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Service Sections', 'service-section', '{\"service_1\":{\"heading\":\"FREE SHIPPING & RETURN\",\"sub_heading\":\"On all orders over $99\",\"icon\":\"<i class=\\\"fa-solid fa-truck-arrow-right\\\"><\\/i>\"},\"service_2\":{\"heading\":\"FREE SHIPPING & RETURN\",\"sub_heading\":\"On all orders over $99\",\"icon\":\"<i class=\\\"fa-solid fa-truck-arrow-right\\\"><\\/i>\"},\"service_3\":{\"heading\":\"FREE SHIPPING & RETURN\",\"sub_heading\":\"On all orders over $99\",\"icon\":\"<i class=\\\"fa-solid fa-truck-arrow-right\\\"><\\/i>\"},\"service_4\":{\"heading\":\"FREE SHIPPING & RETURN\",\"sub_heading\":\"On all orders over $99\",\"icon\":\"<i class=\\\"fa-solid fa-truck-arrow-right\\\"><\\/i>\"}}', '1', NULL, '2024-01-31 09:30:08'),
(2, 'Today\'s Deals', 'todays-deals', '{\"heading\":{\"type\":\"text\",\"value\":\"Today\'s Deal\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Choose your necessary products from this collection\"},\"banner_title\":{\"type\":\"text\",\"value\":\"70% Off\"},\"banner_description\":{\"type\":\"textarea\",\"value\":\"Visit our showroom today for exclusive offers on premium products. Discover unbeatable deals and elevate your lifestyle with our curated selection. Limited time, extraordinary savings await you\"},\"image\":{\"type\":\"file\",\"size\":\"330x625\",\"value\":\"641db01a6580f1679667226.png\"}}', '1', NULL, '2024-02-15 05:53:27'),
(3, 'Top Category', 'top-category', '{\"heading\":{\"type\":\"text\",\"value\":\"Top Category\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Special products in this month.\"}}', '1', NULL, '2023-03-28 06:12:25'),
(4, 'Campaigns', 'campaign', '{\"heading\":{\"type\":\"text\",\"value\":\"Campaign\"}}', '1', NULL, '2024-01-27 07:45:25'),
(5, 'New Arrivals', 'new-arrivals', '{\"heading\":{\"type\":\"text\",\"value\":\"New Arrivals\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Newly Arrive Product In This Month\"}}', '1', NULL, '2024-02-15 05:35:33'),
(6, 'Best Selling Products', 'best-selling-products', '{\"heading\":{\"type\":\"text\",\"value\":\"Best Selling Products\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Best Selling products in this month.\"}}', '1', NULL, '2024-02-15 05:35:46'),
(7, 'Menu Category', 'menu-category', '{\"sub_heading\":{\"type\":\"text\",\"value\":\"Special products in this month.\"}}', '1', NULL, NULL),
(8, 'Our Top Products', 'top-products', '{\"heading\":{\"type\":\"text\",\"value\":\"Top Products\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Top products in this month.\"}}', '1', NULL, '2024-02-15 05:37:33'),
(9, 'Best Shops', 'best-shops', '{\"heading\":{\"type\":\"text\",\"value\":\"Best Shops\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Best Selling Store\"}}', '1', NULL, '2024-02-15 05:37:24'),
(10, 'Top Brands', 'top-brands', '{\"heading\":{\"type\":\"text\",\"value\":\"Top Brands\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Our Top Brands\"}}', '1', NULL, '2024-02-15 05:37:45'),
(11, 'Trending Products', 'trending-products', '{\"heading\":{\"type\":\"text\",\"value\":\"Trending Products\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Special products in this month\"}}', '1', NULL, NULL),
(12, 'Floating Header', 'floating-header', '{\"heading\":{\"type\":\"text\",\"value\":\"Cartuser - Your Ultimate Shopping Destination\"}}', '1', NULL, '2024-03-05 11:02:29'),
(13, 'Digital Products', 'digital-products', '{\"heading\":{\"type\":\"text\",\"value\":\"Digital Products\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Explore our Digital Collection\"},\"image\":{\"type\":\"file\",\"size\":\"330x540\",\"value\":\"641c207737a4e1679564919.png\"}}', '1', NULL, '2024-02-15 05:52:37'),
(14, 'Footer App', 'app-section', '{\"heading\":{\"type\":\"text\",\"value\":\"Download the EmergeCart App\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Take your shopping experience to the next level with the cartuser mobile app. Enjoy exclusive deals, seamless browsing, and faster checkout on-the-go. Available for iOS and Android.\"},\"play_store_link\":{\"type\":\"text\",\"value\":\"@@\"},\"apple_store_link\":{\"type\":\"text\",\"value\":\"@@\"}}', '1', NULL, '2024-03-05 11:02:20'),
(21, 'Newsletter', 'news-latter', '{\"heading\":{\"type\":\"text\",\"value\":\"Stay Connected with cartuser Updates\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Subscribe to our newsletter and stay up-to-date with the latest trends, exclusive offers, and exciting news from cartuser. Don\'t miss out on our special promotions and product launches \\u2013 sign up today\"},\"image\":{\"type\":\"file\",\"size\":\"577x642\",\"value\":\"641c3a17702201679571479.png\"}}', '1', NULL, '2024-03-05 11:02:12'),
(23, 'Product Offer', 'product-offer', '{\"heading\":{\"type\":\"text\",\"value\":\"Women\'s Fashion\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Get 20% off on your purchase over $99\"},\"body\":{\"type\":\"textarea\",\"value\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, quod minus! Voluptatem, repellendus rxccatione. Quaxerat in asperiores hic voluptatibus corporis?cccc\"},\"button_text\":{\"type\":\"text\",\"value\":\"view\"},\"button_url\":{\"type\":\"text\",\"value\":\"@@\"},\"image\":{\"type\":\"file\",\"size\":\"850x450\",\"value\":\"641c20114a26d1679564817.png\"}}', '1', NULL, '2024-01-31 09:29:35'),
(26, 'Promotional Offer 2', 'promotional-offer-2', '{\"position\":{\"type\":\"select\",\"value\":\"best-shops\"},\"image\":{\"type\":\"file\",\"size\":\"1000x200\",\"url\":\"@@@@\",\"value\":\"6422a3c87484b1679991752.png\"},\"image_2\":{\"type\":\"file\",\"size\":\"1000x200\",\"url\":\"@@@@\",\"value\":\"6422a3c8acb471679991752.png\"}}', '1', NULL, '2024-01-25 10:42:51'),
(27, 'Promotional Offer', 'promotional-offer', '{\"position\":{\"type\":\"select\",\"value\":\"new-arrivals\"},\"image\":{\"type\":\"file\",\"size\":\"1000x200\",\"url\":\"@@@@\",\"value\":\"64227f229c4761679982370.png\"},\"image_2\":{\"type\":\"file\",\"size\":\"1000x200\",\"url\":\"@@@@\",\"value\":\"64227f22b47181679982370.png\"}}', '1', NULL, '2024-01-31 10:56:03'),
(133, 'Footer Text', 'footer-text', '{\"heading\":{\"type\":\"text\",\"value\":\"Your go-to destination for seamless online shopping experiences. Explore curated collections, discover new trends, and enjoy hassle-free transactions. Shop with confidence at EmergeCart\"}}', '1', NULL, '2024-02-15 05:38:41'),
(212, 'Seo Section', 'seo-section', '{\"seo_image\":\"65af65405f73f1705993536.png\",\"meta_keywords\":[\"Online\",\"Shopping\",\"E-commerce\",\"Platform\",\"Buy\",\"Cart\",\"Webstore\",\"Shop\",\"Secure\",\"Transactions\",\"Convenient\",\"Products\",\"Innovative\",\"Features\",\"Exceptional\"],\"meta_description\":\"<!DOCTYPE html PUBLIC \\\"-\\/\\/W3C\\/\\/DTD HTML 4.0 Transitional\\/\\/EN\\\" \\\"http:\\/\\/www.w3.org\\/TR\\/REC-html40\\/loose.dtd\\\">\\n<html><head><meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\"><meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\">\\r\\n<meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\"><meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\">\\r\\n<meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\">\\r\\n<meta http-equiv=\\\"Content-Type\\\" content=\\\"text\\/html; charset=utf-8\\\"><link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1706511848&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1709629248&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1709629248&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1709629248&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<link rel=\\\"stylesheet\\\" type=\\\"text\\/css\\\" property=\\\"stylesheet\\\" href=\\\"\\/\\/localhost\\/gencommerz\\/_debugbar\\/assets\\/stylesheets?v=1709629248&theme=auto\\\" data-turbolinks-eval=\\\"false\\\" data-turbo-eval=\\\"false\\\">\\r\\n<style> .phpdebugbar pre.sf-dump { display: block; white-space: pre; padding: 5px; overflow: initial !important; } .phpdebugbar pre.sf-dump:after { content: \\\"\\\"; visibility: hidden; display: block; height: 0; clear: both; } .phpdebugbar pre.sf-dump span { display: inline; } .phpdebugbar pre.sf-dump a { text-decoration: none; cursor: pointer; border: 0; outline: none; color: inherit; } .phpdebugbar pre.sf-dump img { max-width: 50em; max-height: 50em; margin: .5em 0 0 0; padding: 0; background: url(data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAHUlEQVQY02O8zAABilCaiQEN0EeA8QuUcX9g3QEAAjcC5piyhyEAAAAASUVORK5CYII=) #D3D3D3; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis { display: inline-block; overflow: visible; text-overflow: ellipsis; max-width: 5em; white-space: nowrap; overflow: hidden; vertical-align: top; } .phpdebugbar pre.sf-dump .sf-dump-ellipsis+.sf-dump-ellipsis { max-width: none; } .phpdebugbar pre.sf-dump code { display:inline; padding:0; background:none; } .sf-dump-public.sf-dump-highlight, .sf-dump-protected.sf-dump-highlight, .sf-dump-private.sf-dump-highlight, .sf-dump-str.sf-dump-highlight, .sf-dump-key.sf-dump-highlight { background: rgba(111, 172, 204, 0.3); border: 1px solid #7DA0B1; border-radius: 3px; } .sf-dump-public.sf-dump-highlight-active, .sf-dump-protected.sf-dump-highlight-active, .sf-dump-private.sf-dump-highlight-active, .sf-dump-str.sf-dump-highlight-active, .sf-dump-key.sf-dump-highlight-active { background: rgba(253, 175, 0, 0.4); border: 1px solid #ffa500; border-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-hidden { display: none !important; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper { font-size: 0; white-space: nowrap; margin-bottom: 5px; display: flex; position: -webkit-sticky; position: sticky; top: 5px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > * { vertical-align: top; box-sizing: border-box; height: 21px; font-weight: normal; border-radius: 0; background: #FFF; color: #757575; border: 1px solid #BBB; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > input.sf-dump-search-input { padding: 3px; height: 21px; font-size: 12px; border-right: none; border-top-left-radius: 3px; border-bottom-left-radius: 3px; color: #000; min-width: 15px; width: 100%; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous { background: #F2F2F2; outline: none; border-left: none; font-size: 0; line-height: 0; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next { border-top-right-radius: 3px; border-bottom-right-radius: 3px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-next > svg, .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-input-previous > svg { pointer-events: none; width: 12px; height: 12px; } .phpdebugbar pre.sf-dump .sf-dump-search-wrapper > .sf-dump-search-count { display: inline-block; padding: 0 5px; margin: 0; border-left: none; line-height: 21px; font-size: 12px; }.phpdebugbar pre.sf-dump, .phpdebugbar pre.sf-dump .sf-dump-default{word-wrap: break-word; white-space: pre-wrap; word-break: normal}.phpdebugbar pre.sf-dump .sf-dump-num{font-weight:bold; color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-const{font-weight:bold}.phpdebugbar pre.sf-dump .sf-dump-str{font-weight:bold; color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-note{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ref{color:#7B7B7B}.phpdebugbar pre.sf-dump .sf-dump-public{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-protected{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-private{color:#000000}.phpdebugbar pre.sf-dump .sf-dump-meta{color:#B729D9}.phpdebugbar pre.sf-dump .sf-dump-key{color:#3A9B26}.phpdebugbar pre.sf-dump .sf-dump-index{color:#1299DA}.phpdebugbar pre.sf-dump .sf-dump-ellipsis{color:#A0A000}.phpdebugbar pre.sf-dump .sf-dump-ns{user-select:none;}.phpdebugbar pre.sf-dump .sf-dump-ellipsis-note{color:#1299DA}<\\/style>\\r\\n<\\/head><body><span style=\\\"color: rgb(13, 13, 13); font-family: S\\u00f6hne, ui-sans-serif, system-ui, -apple-system, \\\" segoe=\\\"\\\" ui=\\\"\\\" roboto=\\\"\\\" ubuntu=\\\"\\\" cantarell=\\\"\\\" sans=\\\"\\\" sans-serif=\\\"\\\" neue=\\\"\\\" arial=\\\"\\\" color=\\\"\\\" emoji=\\\"\\\" symbol=\\\"\\\" font-size:=\\\"\\\" white-space-collapse:=\\\"\\\" preserve=\\\"\\\">cartuser offers a seamless online shopping experience, where convenience meets quality. Discover a curated selection of products, innovative features, and exceptional service. cartuser\\u2013 Where your shopping journey begin<\\/span><\\/body><\\/html>\\n\",\"social_title\":\"\\\"cartuser: Where Every Purchase Tells a Story\\\"\",\"social_description\":\"Experience the future of online shopping with cartuser. Discover a world of possibilities, where every click leads to new adventures. Shop smart, shop seamlessly, shop cartuser.\",\"social_image\":\"65af6576751c11705993590.png\"}', '1', NULL, '2024-03-05 11:10:27'),
(213, 'Support', 'support', '{\"heading\":{\"type\":\"text\",\"value\":\"How can we help you?\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"SWe are glad having you here looking for the answer. As our team hardly working on the\"}}', '1', NULL, NULL),
(214, 'Login', 'login', '{\"heading\":{\"type\":\"text\",\"value\":\"Get In Touch\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Want to get in touch? We\'d love to hear from you. Here\'s how you can reach us...!\"}}', '1', NULL, NULL),
(215, 'Contact', 'contact', '{\"heading\":{\"type\":\"text\",\"value\":\"How can we help you?\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"SWe are glad having you here looking for the answer. As our team hardly working on the\"}}', '1', NULL, NULL),
(216, 'Social Icon', 'social-icon', '{\"heading\":{\"type\":\"text\",\"value\":\"Social Icon\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"We are on Social media you can also follow here for more updates.\"},\"facebook\":{\"icon\":\"<i class=\\\"fa-brands fa-facebook-f\\\"><\\/i>\",\"url\":\"@@\",\"type\":\"text\"},\"google\":{\"icon\":\"<i class=\\\"fa-brands fa-google\\\"><\\/i>\",\"url\":\"@@\",\"type\":\"text\"},\"linkedin\":{\"icon\":\"<i class=\\\"fa-brands fa-linkedin\\\"><\\/i>\",\"url\":\"@@\",\"type\":\"text\"},\"whatsapp\":{\"icon\":\"<i class=\\\"fa-brands fa-whatsapp\\\"><\\/i>\",\"url\":\"@@\",\"type\":\"text\"}}', '1', NULL, '2024-02-15 05:34:12'),
(217, 'Payment Image', 'payment-image', '{\"image\":{\"type\":\"file\",\"size\":\"430x35\",\"value\":\"642278e37d2771679980771.png\"}}', '1', NULL, '2023-03-28 05:19:31'),
(219, 'Cookie', 'cookie', '{\"heading\":{\"type\":\"text\",\"value\":\"Cookie Preferences\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Manage your cookie preferences to enhance your browsing experience. We use cookies to personalize content, provide social media features, and analyze our traffic. By clicking \'Accept All Cookies,\' you agree to the storing of cookies on your device to improve site navigation, analyze site usage, and assist in our marketing efforts. You can also customize your cookie settings below.\"}}', '1', NULL, '2024-02-15 05:35:09'),
(220, 'Breadcrumb Banner', 'breadcrumb', '{\"image\":{\"type\":\"file\",\"size\":\"1900x190\",\"value\":\"6423d8deed4101680070878.png\"}}', '1', NULL, '2023-03-29 06:21:19'),
(221, 'Testimonial', 'testimonial', '{\"title\":{\"type\":\"text\",\"value\":\"Let\'s explore customer sentiments towards our offerings.\"},\"description\":{\"type\":\"textarea\",\"value\":\"Discover what customers are saying about our products. Dive into the feedback on the quality and performance of our offerings. Gain insights into how our customers perceive our products and their overall satisfaction. Your opinions matter, and we\'re here to listen.\"}}', '1', NULL, '2024-02-05 06:59:49'),
(222, 'Flash Deals', 'flash-deals', '{\"heading\":{\"type\":\"text\",\"value\":\"50% OFF\"},\"sub_heading\":{\"type\":\"text\",\"value\":\"Choose your necessary products from this feature categories\"}}', '1', NULL, '2024-02-15 05:33:59');

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

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyc_logs`
--

CREATE TABLE `kyc_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED DEFAULT NULL,
  `deliveryman_id` bigint UNSIGNED DEFAULT NULL,
  `custom_data` longtext COLLATE utf8mb4_unicode_ci,
  `feedback` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'default : 1,Not default : 0',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `uid`, `created_by`, `updated_by`, `name`, `code`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, NULL, 'English', 'en', '1', '1', '2023-03-14 14:09:00', '2023-03-14 14:09:00'),
(3, '4HbZ-JFFyiq1s-sZ28', NULL, NULL, 'Bengali', 'bn', '0', '1', '2024-01-23 10:31:12', '2024-01-23 10:31:12'),
(5, '7HuT-Xpc5KM3Y-H3QJ', NULL, NULL, 'Dutch', 'nl', '0', '1', '2024-01-23 10:31:39', '2024-01-23 10:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `mails`
--

CREATE TABLE `mails` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Active : 1 Inactive : 2',
  `driver_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mails`
--

INSERT INTO `mails` (`id`, `uid`, `name`, `status`, `driver_information`, `created_at`, `updated_at`) VALUES
(1, NULL, 'SMTP', 1, '{\"driver\":\"@@\",\"host\":\"@@\",\"port\":\"@@\",\"from\":{\"address\":\"@@\",\"name\":\"@@\"},\"encryption\":\"@@\",\"username\":\"@@\",\"password\":\"@@\"}', NULL, '2024-03-19 03:25:14'),
(2, NULL, 'PHP MAIL', 1, NULL, NULL, '2022-08-03 06:52:48'),
(3, NULL, 'SendGrid Api', 1, '{\"app_key\":\"@@@@@@@@@@\"}', NULL, '2024-02-15 05:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Default : 1,Not Default : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_categories`
--

CREATE TABLE `menu_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `serial` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_08_09_155532_create_admins_table', 1),
(2, '2025_08_09_155542_create_admin_password_resets_table', 1),
(3, '2025_08_09_155551_create_attributes_table', 1),
(4, '2025_08_09_155600_create_attribute_values_table', 1),
(5, '2025_08_09_155608_create_banners_table', 1),
(6, '2025_08_09_155617_create_blogs_table', 1),
(7, '2025_08_09_155623_create_brands_table', 1),
(8, '2025_08_09_155631_create_campaigns_table', 1),
(9, '2025_08_09_155638_create_campaign_products_table', 1),
(10, '2025_08_09_155645_create_carts_table', 1),
(11, '2025_08_09_161231_create_categories_table', 1),
(12, '2025_08_09_161237_create_cities_table', 1),
(13, '2025_08_09_161243_create_compare_product_lists_table', 1),
(14, '2025_08_09_161248_create_contact_us_table', 1),
(15, '2025_08_09_161254_create_countries_table', 1),
(16, '2025_08_09_161300_create_country_zone_table', 1),
(17, '2025_08_09_161306_create_coupons_table', 1),
(18, '2025_08_09_161319_create_customer_deliveryman_conversations_table', 1),
(19, '2025_08_09_161325_create_customer_seller_conversations_table', 1),
(20, '2025_08_09_162905_create_deliveryman_earning_logs_table', 1),
(21, '2025_08_09_162912_create_deliveryman_password_resets_table', 1),
(22, '2025_08_09_162919_create_delivery_man_conversations_table', 1),
(23, '2025_08_09_162925_create_delivery_man_orders_table', 1),
(24, '2025_08_09_162931_create_delivery_man_ratings_table', 1),
(25, '2025_08_09_162939_create_delivery_men_table', 1),
(26, '2025_08_09_165544_create_digital_product_attributes_table', 1),
(27, '2025_08_09_165715_create_digital_product_attribute_values_table', 1),
(28, '2025_08_09_174114_create_exclusive_offers_table', 1),
(29, '2025_08_09_180252_create_failed_jobs_table', 1),
(30, '2025_08_09_180458_create_faqs_table', 1),
(31, '2025_08_09_181028_create_feature_products_table', 1),
(32, '2025_08_09_181340_create_flash_deals_table', 1),
(33, '2025_08_09_181446_create_followers_table', 1),
(34, '2025_08_09_181818_create_jobs_table', 1),
(35, '2025_08_09_181842_create_kyc_logs_table', 1),
(36, '2025_08_09_182151_create_menus_table', 1),
(37, '2025_08_09_182303_create_menu_categories_table', 1),
(38, '2025_08_09_182424_create_news_latters_table', 1),
(39, '2025_08_09_182457_create_orders_table', 1),
(40, '2025_08_09_182610_create_order_details_table', 1),
(41, '2025_08_09_182645_create_order_statuses_table', 1),
(42, '2025_08_09_183109_create_password_resets_table', 1),
(43, '2025_08_09_183223_create_payment_logs_table', 1),
(44, '2025_08_09_183339_create_personal_access_tokens_table', 1),
(45, '2025_08_09_183429_create_plan_subscriptions_table', 1),
(46, '2025_08_09_183501_create_plugin_settings_table', 1),
(47, '2025_08_09_183544_create_pos_carts_table', 1),
(48, '2025_08_09_183702_create_pos_cart_holds_table', 1),
(49, '2025_08_09_183733_create_pricing_plans_table copy', 1),
(50, '2025_08_09_183837_create_products_table', 1),
(51, '2025_08_09_183931_create_product_images_table', 1),
(52, '2025_08_09_184000_create_product_ratings_table', 1),
(53, '2025_08_09_184103_create_product_shipping_deliveries_table', 1),
(54, '2025_08_09_184133_create_product_stocks_table', 1),
(55, '2025_08_09_184217_create_product_taxes_table', 1),
(56, '2025_08_09_184646_create_refunds_table', 1),
(57, '2025_08_09_184726_create_refund_methods_table', 1),
(58, '2025_08_09_184814_create_reward_point_logs_table', 1),
(59, '2025_08_09_184919_create_sellers_table', 1),
(60, '2025_08_09_185013_create_seller_password_resets_table', 1),
(61, '2025_08_09_185055_create_seller_shop_settings_table', 1),
(62, '2025_08_09_185240_create_shipping_deliveries_table', 1),
(63, '2025_08_09_185326_create_shipping_methods_table', 1),
(64, '2025_08_09_185416_create_states_table', 1),
(65, '2025_08_09_185512_create_subscribers_table', 1),
(66, '2025_08_09_185552_create_supports_table', 1),
(67, '2025_08_09_185715_create_support_files_table', 1),
(68, '2025_08_09_190014_create_support_messages_table', 1),
(69, '2025_08_09_190045_create_support_tickets_table', 1),
(70, '2025_08_09_190110_create_taxes_table', 1),
(71, '2025_08_09_190203_create_testimonials_table', 1),
(72, '2025_08_09_190233_create_transactions_table', 1),
(73, '2025_08_09_190300_create_translations_table', 1),
(74, '2025_08_09_190335_create_users_table', 1),
(75, '2025_08_09_190422_create_user_addresses_table', 1),
(76, '2025_08_09_190452_create_user_login_infos_table', 1),
(77, '2025_08_09_190521_create_visitors_table', 1),
(78, '2025_08_09_190605_create_wish_lists_table', 1),
(79, '2025_08_09_190637_create_withdraws_table', 1),
(80, '2025_08_09_190709_create_withdraw_methods_table', 1),
(81, '2025_08_09_190746_create_zones_table', 1),
(82, '2025_08_11_154722_create_tutorials_table', 1),
(83, '2025_08_12_122845_add_total_coupons_to_pricing_plans_table', 1),
(84, '2025_08_12_123531_add_seller_id_to_coupons_table', 1),
(85, '2025_08_12_131352_add_total_coupons_to_plan_subscriptions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_latters`
--

CREATE TABLE `news_latters` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `time_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_percentage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_code` mediumtext COLLATE utf8mb4_unicode_ci,
  `shipping_deliverie_id` int UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint UNSIGNED DEFAULT NULL,
  `payment_id` text COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint UNSIGNED DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` bigint UNSIGNED DEFAULT NULL,
  `qty` tinyint DEFAULT NULL,
  `shipping_charge` decimal(18,8) DEFAULT NULL,
  `payment_info` text COLLATE utf8mb4_unicode_ci,
  `discount` decimal(18,8) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `original_amount` double(28,8) NOT NULL DEFAULT '0.00000000',
  `total_taxes` double(28,8) NOT NULL DEFAULT '0.00000000',
  `delivery_man_charge` double NOT NULL DEFAULT '0',
  `billing_information` text COLLATE utf8mb4_unicode_ci,
  `payment_details` longtext COLLATE utf8mb4_unicode_ci,
  `payment_status` tinyint NOT NULL DEFAULT '1' COMMENT 'Unpaid : 1, Paid : 2',
  `wallet_payment` tinyint DEFAULT NULL,
  `order_type` tinyint NOT NULL DEFAULT '1' COMMENT 'Digital : 101, Physical : 102',
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `payment_type` tinyint NOT NULL DEFAULT '1' COMMENT 'Cash On Delivery : 1, Payment method : 2',
  `custom_information` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Placed : 1, Confirmed : 2, Processing : 3, Shipped : 4, Delivered : 5 Cancel : 6',
  `customer_type` enum('walk_in','existing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'existing' COMMENT 'WALKIN: walkin , EXISTING : existing',
  `delivery_option` enum('pickup','shipping') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping' COMMENT 'PICKUP: pick up in store , SHIPPING : ship tp address',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `digital_product_attribute_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_price` decimal(18,8) DEFAULT NULL,
  `shipping_fee` double(20,8) NOT NULL DEFAULT '0.00000000',
  `original_price` double(28,8) NOT NULL,
  `tax_amount` longtext COLLATE utf8mb4_unicode_ci,
  `taxes` double(28,8) NOT NULL DEFAULT '0.00000000',
  `total_taxes` double NOT NULL DEFAULT '0',
  `discount` double(28,8) NOT NULL DEFAULT '0.00000000',
  `attribute` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Placed : 1, Confirmed : 2, Processing : 3, Shipped : 4, Delivered : 5 Cancel : 6',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `payment_status` tinyint DEFAULT NULL COMMENT 'Unpaid : 1, Paid : 2',
  `payment_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_status` tinyint DEFAULT NULL COMMENT 'Placed : 1, Confirmed : 2, Processing : 3, Shipped : 4, Delivered : 5 Cancel : 6',
  `delivery_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_setups`
--

CREATE TABLE `page_setups` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_setups`
--

INSERT INTO `page_setups` (`id`, `uid`, `name`, `body`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, '1dRR-7BkgK045-kV4k', 'Terms and Conditions', NULL, '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\r\n<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head><body><h1 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 0.888889em; margin-left: 0px; line-height: 1.11111; color: rgb(13, 13, 13); font-size: 2.25em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"background-color: var(--ig-card-bg); font-family: var(--ig-body-font-family); font-size: var(--ig-body-font-size); font-weight: var(--ig-body-font-weight); text-align: var(--ig-body-text-align);\">Last Updated: 02-03-2024</span><br></h1><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 1.25em 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">Please read these terms and conditions carefully before using the CartUser e-commerce platform.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">1. Acceptance of Terms</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">By accessing or using the CartUser website and its related services, you agree to comply with and be bound by these terms and conditions. If you disagree with any part of these terms, please refrain from using our platform.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">2. User Accounts</h2><ol segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; list-style-type: none; list-style-position: initial; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(13, 13, 13);\"><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Account Information:</span> Users are responsible for maintaining the confidentiality of their account information and passwords.</p></li><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Account Termination:</span> CartUser reserves the right to terminate or suspend user accounts without prior notice if there is a violation of these terms.</p></li></ol><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">3. Products and Services</h2><ol segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; list-style-type: none; list-style-position: initial; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(13, 13, 13);\"><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Product Information:</span> While we strive for accuracy, we do not guarantee the completeness or reliability of product information on CartUser. Users are encouraged to verify details independently.</p></li><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Pricing:</span> Prices are subject to change without notice. CartUser reserves the right to modify or discontinue any product or service without prior notice.</p></li></ol><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">4. Privacy Policy</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">Your use of CartUser is also governed by our <a target=\"_new\" style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Privacy Policy</a>, which outlines how we collect, use, and protect your personal information.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">5. Intellectual Property</h2><ol segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; list-style-type: none; list-style-position: initial; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(13, 13, 13);\"><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Ownership:</span> All content and materials on CartUser, including but not limited to text, graphics, logos, and images, are the property of [Your Company Name] and are protected by intellectual property laws.</p></li><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Use Restrictions:</span> Users are prohibited from using, reproducing, or distributing any content from CartUser without explicit permission.</p></li></ol><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">6. Disclaimers</h2><ol segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; list-style-type: none; list-style-position: initial; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(13, 13, 13);\"><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Availability:</span> CartUser strives to maintain uninterrupted service, but we do not guarantee continuous, error-free operation of the platform.</p></li><li style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 0px; margin-top: 0px; padding-left: 0.375em; counter-increment: list-number 1; display: block; min-height: 28px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><span style=\"border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Content Accuracy:</span> We do our best to provide accurate and up-to-date information, but we make no warranties or representations regarding the accuracy of the content on CartUser.</p></li></ol><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">7. Limitation of Liability</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">CartUser, its affiliates, and partners are not liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">8. Changes to Terms</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">CartUser reserves the right to modify these terms and conditions at any time. Users are responsible for regularly reviewing these terms, and continued use of the platform constitutes acceptance of any changes.</p><h2 segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin: 2rem 0px 1rem; line-height: 1.33333; color: rgb(13, 13, 13); font-size: 1.5em; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Contact Information</h2><p segoe=\"\" ui=\"\" roboto=\"\" ubuntu=\"\" cantarell=\"\" sans=\"\" sans-serif=\"\" neue=\"\" arial=\"\" color=\"\" emoji=\"\" symbol=\"\" font-size:=\"\" white-space-collapse:=\"\" preserve=\"\" style=\"margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; border: 0px solid rgb(227, 227, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(13, 13, 13);\">If you have any questions or concerns regarding these terms and conditions, please contact us.</p></body></html>\r\n', '1', NULL, '2024-03-14 09:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `order_type` int NOT NULL COMMENT 'Digital : 101, Physical : 102',
  `user_id` int DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  `method_id` int DEFAULT NULL,
  `charge` decimal(18,8) DEFAULT NULL,
  `rate` decimal(18,8) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `final_amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `trx_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Pending : 1, Success : 2, Cancel : 3',
  `type` tinyint DEFAULT '0',
  `custom_info` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int UNSIGNED DEFAULT NULL,
  `percent_charge` decimal(18,8) DEFAULT NULL,
  `rate` decimal(18,8) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Inactive : 2',
  `type` tinyint NOT NULL DEFAULT '1',
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `uid`, `currency_id`, `percent_charge`, `rate`, `name`, `unique_code`, `image`, `payment_parameter`, `status`, `type`, `owner_type`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 4, 0.00000000, 1.00000000, 'Stripe', 'STRIPE101', '6363c927654fb1667483943.png', '{\"secret_key\":\"@@@@@@@@\",\"publishable_key\":\"@@@@@@@@\",\"note\":\"Payment with Stripe with 0% charge\"}', 1, 1, NULL, NULL, NULL, '2024-02-15 05:47:19'),
(3, NULL, 4, 1.00000000, 1.00000000, 'Paypal', 'PAYPAL102', '62a02c1256fcf1654664210.png', '{\"environment\":\"sandbox\",\"client_id\":\"@@@@@@@@@@@@@\",\"secret\":\"@@@@@@@@@@\",\"note\":\"Payment with  Paypal with 0% charge\"}', 1, 1, NULL, NULL, NULL, '2024-02-15 05:47:39'),
(4, NULL, 7, 1.00000000, 1.00000000, 'Paystack', 'PAYSTACK103', '62a02c97aee411654664343.png', '{\"public_key\":\"@@@@@@@@\",\"secret_key\":\"@@@@@\",\"note\":\"Payment to Paystack with 0% charge\"}', 1, 1, NULL, NULL, NULL, '2024-02-15 05:47:55'),
(6, NULL, 4, 1.00000000, 1.00000000, 'Flutterwave', 'FLUTTERWAVE105', '6363c8ed594cc1667483885.jpg', '{\"public_key\":\"@@@@@@@@\",\"secret_key\":\"@@@@@@@@\",\"secret_hash\":\"@@@@@@@\",\"note\":\"Payment with Flutterwave with 0% charge\"}', 1, 1, NULL, NULL, NULL, '2024-02-15 05:48:19'),
(7, NULL, 2, 1.00000000, 78.00000000, 'Razorpay', 'RAZORPAY106', '6363c8b0065b61667483824.png', '{\"razorpay_key\":\"@@@@@@\",\"razorpay_secret\":\"@@@@@@\",\"note\":\"Payment with Razorpay with 0% charge\"}', 1, 1, NULL, NULL, NULL, '2024-02-15 05:48:47'),
(10, NULL, 4, 1.00000000, 1.00000000, 'Instamojo', 'INSTA106', '65b49a4b60c881706334795.png', '{\"api_key\":\"@@@@@@@@@\",\"auth_token\":\"@@@@@@@@@\",\"salt\":\"@@@@@@@@@\",\"note\":\"Payment with Instamojo\"}', 1, 1, NULL, NULL, '2022-09-14 12:25:24', '2024-02-15 05:46:56'),
(11, NULL, 1, 1.00000000, 100.00000000, 'bkash', 'BKASH102', '63cfdc863c7011674566790.png', '{\"environment\":\"sandbox\",\"user_name\":\"@@@@@@\",\"password\":\"@@@@@@\",\"api_key\":\"@@@@@@\",\"api_secret\":\"@@@@@@\",\"note\":\"Payment with  bkash with 0% charge\"}', 1, 1, NULL, NULL, NULL, '2024-02-15 05:49:11'),
(12, NULL, 1, 1.00000000, 100.00000000, 'Nagad', 'NAGAD104', '63cfdc96088d01674566806.png', '{\"environment\":\"sandbox\",\"public_key\":\"@@@@@@@@\",\"private_key\":\"@@@@@@@@\",\"merchant_id\":\"@@@@@@@@\",\"merchant_number\":\"@@@@@@@@\",\"note\":\"Payment to nagad with 0% charge\"}', 1, 1, NULL, NULL, NULL, '2024-02-15 05:49:29'),
(13, 'zG8G-kjAHIiQm-Fq62', 4, 1.00000000, 1.00000000, 'Mercadopago', 'MERCADO101', NULL, '{\"access_token\":\"@@@@\"}', 1, 1, NULL, NULL, '2024-05-30 07:13:53', '2024-05-30 07:13:53'),
(14, 'jHS9-xDwD1l2t-gOp6', 4, 1.00000000, 1.00000000, 'Payeer', 'PAYEER105', NULL, '{\"merchant_id\":\"@@@@\",\"secret_key\":\"@@@@\"}', 1, 1, NULL, NULL, '2024-05-30 07:13:53', '2024-05-30 07:13:53'),
(15, 'S5DA-sPAVEj3T-mRJ8', 4, 1.00000000, 1.00000000, 'Aamarpay', 'AAMARPAY107', NULL, '{\"store_id\":\"@@@@\",\"signature_key\":\"@@@@\",\"is_sandbox\":\"1\"}', 1, 1, NULL, NULL, '2024-07-03 06:28:14', '2024-07-03 06:28:14'),
(16, '07rI-vB2uywm9-d8Yb', 4, 1.00000000, 1.00000000, 'Payu money', 'PAYU101', NULL, '{\"merchant_key\":\"@@\",\"salt\":\"@@\"}', 1, 1, NULL, NULL, '2024-07-03 06:28:14', '2024-07-03 06:28:14'),
(17, '45Lm-QQrGAwgW-CNc0', 4, 1.00000000, 1.00000000, 'Payhere', 'PAYHERE101', NULL, '{\"merchant_id\":\"@@\",\"secret_key\":\"@@\"}', 1, 1, NULL, NULL, '2024-07-03 06:28:14', '2024-07-03 06:28:14'),
(18, '3nCn-r30PExBh-UgD2', 4, 1.00000000, 1.00000000, 'Payku', 'PAYKU108', NULL, '{\"base_url\":\"@@\",\"public_token\":\"@@\",\"private_token\":\"@@\"}', 1, 1, NULL, NULL, '2024-07-03 06:28:14', '2024-07-03 06:28:14'),
(19, 'ipx2-jCPSv1rN-DtT0', 4, 1.00000000, 1.00000000, 'PhonePe', 'PHONEPE102', NULL, '{\"merchant_id\":\"@@\",\"salt_key\":\"@@\",\"salt_index\":\"@@\"}', 1, 1, NULL, NULL, '2024-07-03 06:28:14', '2024-07-03 06:28:14'),
(20, '8HrT-lPVJqhRs-aUYA', 4, 1.00000000, 1.00000000, 'Senangpay', 'SENANGPAY107', NULL, '{\"callback_url\":\"callback_url\",\"merchant_id\":\"@@\",\"secret_key\":\"@@\"}', 1, 1, NULL, NULL, '2024-07-03 06:28:14', '2024-07-03 06:28:14'),
(21, 'ntXp-kRpgb7az-Dce4', 4, 1.00000000, 1.00000000, 'NGENIUS', 'NGENIUS111', NULL, '{\"outlet_id\":\"@@\",\"api_key\":\"@@\"}', 1, 1, NULL, NULL, '2024-07-03 06:28:14', '2024-07-03 06:28:14'),
(22, '0Zcq-imvnocsd-umGx', 1, 1.00000000, 1.00000000, 'eSewa', 'ESEWA107', NULL, '{\"environment\":\"live\",\"secret_key\":\"@@@@\",\"product_code\":\"@@@\",\"client_id\":\"@@@\",\"client_secret\":\"@@@\",\"note\":\"Payment to eSewa with 0% charge\"}', 1, 1, NULL, NULL, '2024-07-30 07:57:01', '2024-07-30 07:57:01'),
(23, 'XFG6-YV7EUaPU-JMP4', 1, 1.00000000, 1.00000000, 'Webxpay', 'WEBXPAY109', NULL, '{\"public_key\":\"@@@@\",\"secret_key\":\"@@@@\",\"api_username\":\"@@@\",\"api_password\":\"@@@\",\"callback_url\":\"@@@\",\"is_sandbox\":0}', 1, 1, NULL, NULL, '2024-09-22 09:46:59', '2024-09-22 11:54:55'),
(24, '4a5daa41-27a0-407f-91a9-51b7dc3d9edd', NULL, 0.00000000, 1.00000000, 'Cash', 'CASH', NULL, '{}', 1, 3, NULL, NULL, '2025-07-23 10:04:02', '2025-07-23 10:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan_subscriptions`
--

CREATE TABLE `plan_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` int UNSIGNED DEFAULT NULL,
  `plan_id` int UNSIGNED DEFAULT NULL,
  `total_product` int NOT NULL DEFAULT '0',
  `total_coupon` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL COMMENT 'Running : 1, Expired : 2, Requested : 3',
  `expired_date` datetime(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_settings`
--

CREATE TABLE `plugin_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_carts`
--

CREATE TABLE `pos_carts` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `seller_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double(20,8) NOT NULL DEFAULT '0.00000000',
  `total_taxes` double(20,8) NOT NULL DEFAULT '0.00000000',
  `total` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_price` double(20,8) NOT NULL DEFAULT '0.00000000',
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxes` longtext COLLATE utf8mb4_unicode_ci,
  `attribute` json DEFAULT NULL,
  `attributes_value` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_cart_holds`
--

CREATE TABLE `pos_cart_holds` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `seller_id` bigint UNSIGNED DEFAULT NULL,
  `cart_items` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary_meta` longtext COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pricing_plans`
--

CREATE TABLE `pricing_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `total_product` int DEFAULT NULL,
  `total_coupon` int NOT NULL DEFAULT '0',
  `duration` int DEFAULT NULL,
  `module_access` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Inactive : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricing_plans`
--

INSERT INTO `pricing_plans` (`id`, `uid`, `name`, `amount`, `total_product`, `total_coupon`, `duration`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'LBU0-tWU1JxZw-euB5', 'Free', 0.00000000, 10, 0, 10, NULL, 1, '2023-03-28 06:58:17', '2023-03-28 07:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` int DEFAULT NULL COMMENT 'Digital Product : 101,  Physical Product : 102',
  `seller_id` int UNSIGNED DEFAULT NULL,
  `warranty_policy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `sub_category_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(18,8) DEFAULT '0.00000000',
  `shipping_fee` double(20,8) NOT NULL DEFAULT '0.00000000',
  `shipping_fee_multiply` tinyint DEFAULT NULL,
  `discount` decimal(18,8) DEFAULT NULL,
  `discount_percentage` decimal(18,8) DEFAULT NULL,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `shipping_country` text COLLATE utf8mb4_unicode_ci,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `variant_product` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes_value` text COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `minimum_purchase_qty` int DEFAULT NULL,
  `maximum_purchase_qty` int DEFAULT NULL,
  `top_status` tinyint NOT NULL DEFAULT '1' COMMENT 'No : 1, Yes : 2',
  `featured_status` tinyint NOT NULL DEFAULT '1' COMMENT 'No : 1, Yes : 2',
  `best_selling_item_status` tinyint NOT NULL DEFAULT '1' COMMENT 'No : 1, Yes : 2',
  `is_suggested` tinyint NOT NULL DEFAULT '0' COMMENT 'Yes:1 , No :0',
  `weight` double(20,8) DEFAULT '0.00000000',
  `point` mediumint NOT NULL DEFAULT '0',
  `custom_fileds` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'New : 0, Published : 1, Inactive : 2',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE `product_ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `rating` decimal(18,8) NOT NULL,
  `review` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1 ,Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_shipping_deliveries`
--

CREATE TABLE `product_shipping_deliveries` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `shipping_delivery_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `attribute_id` int UNSIGNED DEFAULT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_taxes`
--

CREATE TABLE `product_taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `tax_id` int UNSIGNED DEFAULT NULL,
  `amount` double(20,8) NOT NULL DEFAULT '0.00000000',
  `type` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `method_id` bigint UNSIGNED DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_info` json DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Pending : 0,Success : 1,Failed : 2,Declined : 3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_methods`
--

CREATE TABLE `refund_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_point_logs`
--

CREATE TABLE `reward_point_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `post_point` mediumint NOT NULL DEFAULT '0',
  `point` mediumint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `expired_at` timestamp NULL DEFAULT NULL,
  `redeemed_at` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `balance` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_status` tinyint NOT NULL DEFAULT '1' COMMENT 'No : 1, Yes : 2',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Banned : 0',
  `kyc_status` smallint DEFAULT NULL,
  `pos_balance` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_password_resets`
--

CREATE TABLE `seller_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_shop_settings`
--

CREATE TABLE `seller_shop_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` int NOT NULL,
  `seller_id` int UNSIGNED NOT NULL,
  `short_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_order` varchar(121) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_site_logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `shop_first_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_second_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_third_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logoicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '2' COMMENT 'Enable : 1, Disable : 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1,Deactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Cartuser', '1', NULL, NULL),
(2, 'logo', 'fsad', '1', NULL, NULL),
(3, 'loder_logo', 'loder_logo.jpg', '1', NULL, NULL),
(4, 'admin_logo_sm', NULL, '1', NULL, NULL),
(5, 'admin_logo_lg', 'admin_site_logo.jpg', '1', NULL, NULL),
(6, 'site_logo', NULL, '1', NULL, NULL),
(7, 'address', '1210 Bingamon Road ,Garfield Heights', '1', NULL, NULL),
(8, 'copyright_text', '©cartuser.com | All brands and registered hallmarks belongings to the right owners.', '1', NULL, NULL),
(9, 'site_favicon', 'fs', '1', NULL, NULL),
(10, 'primary_color', 'E40046', '1', NULL, NULL),
(11, 'secondary_color', '094966', '1', NULL, NULL),
(12, 'font_color', 'fff', '1', NULL, NULL),
(13, 'commission', '2.00000000', '1', NULL, NULL),
(14, 'mail_from', 'cartuser@gmail.com', '1', NULL, NULL),
(15, 'phone', '+15678781998', '1', NULL, NULL),
(16, 'order_prefix', 'cartuser', '1', NULL, NULL),
(17, 'email_template', 'Hello {{username}}\r\n{{message}}', '1', NULL, NULL),
(18, 'sms_template', 'hi {{name}}, {{message}}', '1', NULL, NULL),
(19, 'search_min', '20.00000000', '1', NULL, NULL),
(20, 'search_max', '7000.00000000', '1', NULL, NULL),
(21, 'app_version', '2.6', '1', NULL, NULL),
(22, 'last_cron_run', NULL, '1', NULL, NULL),
(23, 'cod', 'active', '1', NULL, NULL),
(24, 'seller_mode', 'active', '1', NULL, NULL),
(25, 'system_installed_at', '2025-08-14 14:37:50', '1', NULL, NULL),
(26, 's_login_google_info', '{\"g_client_id\":\"@@@@@@@@\",\"g_client_secret\":\"@@@@@@@@\",\"g_status\":\"2\"}', '1', NULL, NULL),
(27, 's_login_facebook_info', '{\"f_client_id\":\"@@@@@@@@\",\"f_client_secret\":\"@@@@@@@@\",\"f_status\":\"2\"}', '1', NULL, NULL),
(28, 'app_settings', '{\"page_-1\":{\"image\":null,\"heading\":\"Welcome to Fluute: Your Ultimate Music Companion\",\"description\":\"Get ready to elevate your music experience with Fluute \\u2013 the ultimate music companion. Dive into a world of endless tunes, curated playlists, and personalized recommendations. Join Fluute today and let the music take you on a journey.\"},\"page_2\":{\"image\":null,\"heading\":\"Personalized Recommendations Just for You\\\"\",\"description\":\"Get ready to elevate your music experience with Fluute \\u2013 the ultimate music companion. Dive into a world of endless tunes, curated playlists, and personalized recommendations. Join Fluute today and let the music take you on a journey.\\\"\"}}', '1', NULL, NULL),
(29, 'tawk_to', '{\"property_id\":\"@@@\",\"widget_id\":\"@@@\",\"status\":\"0\"}', '1', NULL, NULL),
(30, 'invoice_logo', '{\"Cash On Delivery\":\"64046349de2aa1678009161.png\",\"unpaid\":\"6404635f52c081678009183.png\",\"paid\":\"640463728b0d31678009202.png\",\"Delivered\":\"6404637290b261678009202.png\"}', '1', NULL, NULL),
(31, 'security_settings', '{\"dos_attempts\":\"2000\",\"dos_attempts_in_second\":\"2\",\"dos_security\":\"captcha\"}', '1', NULL, NULL),
(32, 'open_ai_setting', '{\"key\":\"@@@@@@@@@@\",\"status\":\"1\"}', '1', NULL, NULL),
(33, 'otp_configuration', '{\"phone_otp\":\"0\",\"email_otp\":\"0\",\"login_with_password\":\"1\"}', '1', NULL, NULL),
(34, 'task_config', NULL, '1', NULL, NULL),
(35, 'refund_time_limit', '0', '1', NULL, NULL),
(36, 'seller_reg_allow', '1', '1', NULL, NULL),
(37, 'email_notification', '1', '1', NULL, NULL),
(38, 'sms_notification', '2', '1', NULL, NULL),
(39, 'refund', NULL, '1', NULL, NULL),
(40, 'preloader', '1', '1', NULL, NULL),
(41, 'sms_gateway_id', '13', '1', NULL, NULL),
(42, 'email_gateway_id', '1', '1', NULL, NULL),
(43, 'guest_checkout', '1', '1', NULL, NULL),
(44, 'status_expiry', '10', '1', NULL, NULL),
(45, 'maintenance_mode', '0', '1', NULL, NULL),
(46, 'strong_password', '1', '1', NULL, NULL),
(47, 'country', 'AU', '1', NULL, NULL),
(48, 'time_zone', '\'Asia/Hovd\'', '1', NULL, NULL),
(49, 'latitude', '-33.871646161728215', '1', NULL, NULL),
(50, 'longitude', '151.2120756454468', '1', NULL, NULL),
(51, 'currency_position', '1', '1', NULL, NULL),
(52, 'digit_after_decimal', '1', '1', NULL, NULL),
(53, 'pagination_number', '20', '1', NULL, NULL),
(54, 'digital_payment', '1', '1', NULL, NULL),
(55, 'offline_payment', '0', '1', NULL, NULL),
(56, 'cash_on_delivery', '1', '1', NULL, NULL),
(57, 'whatsapp_order_notification', '0', '1', NULL, NULL),
(58, 'email_order_notification', '0', '1', NULL, NULL),
(59, 'sms_order_notification', '0', '1', NULL, NULL),
(60, 'wp_access_token', '@@@@@@@@@', '1', NULL, NULL),
(61, 'wp_business_account_id', '@@@@@@@@@', '1', NULL, NULL),
(62, 'wp_business_phone', '@@@@@@@@', '1', NULL, NULL),
(63, 'wp_receiver_id', '@@@@@@@@@', '1', NULL, NULL),
(64, 'multi_vendor', '1', '1', NULL, NULL),
(65, 'seller_commission_status', '1', '1', NULL, NULL),
(66, 'seller_commission', '2', '1', NULL, NULL),
(67, 'seller_registration', '1', '1', NULL, NULL),
(68, 'email_otp_login', '0', '1', NULL, NULL),
(69, 'phone_otp_login', '0', '1', NULL, NULL),
(70, 'login_with_password', '1', '1', NULL, NULL),
(71, 'recaptcha_public_key', '@@@@@@@@@@', '1', NULL, NULL),
(72, 'recaptcha_secret_key', '@@@@@@@@@@@@', '1', NULL, NULL),
(73, 'recaptcha_status', '0', '1', NULL, NULL),
(74, 'gmap_client_key', '@@@@@@@@@@', '1', NULL, NULL),
(75, 'gmap_server_key', '@@@@@@@@@@', '1', NULL, NULL),
(76, 'google_tracking_id', '@@@@@@@@@@', '1', NULL, NULL),
(77, 'google_analytics', '0', '1', NULL, NULL),
(78, 'whats_app_number', '0XXXXXX', '1', NULL, NULL),
(79, 'whats_app_plugin', '1', '1', NULL, NULL),
(80, 'wp_order_message', 'Product Name : [product_name]\r\nVariant Name : [variant_name]\r\nprice : [price]\r\nProduct Link : [link]', '1', NULL, NULL),
(81, 'wp_digital_order_message', 'Product Name : [product_name]\r\nProduct Link : [link]', '1', NULL, NULL),
(82, 'whatsapp_order', '0', '1', NULL, NULL),
(83, 'item_variable', '[quantity] x [product_name]- [variant_name]  = [item_total]', '1', NULL, NULL),
(84, 'order_message', 'Order No : [order_no]\r\nCustomer Name : [customer_name]\r\nBilling Address : [billing_address]\r\nBilling Country : [billing_country]\r\nBilling City : [billing_city]\r\nBilling Zip Code : [billing_zip_code]\r\nBilling State : [billing_state]\r\nItem Variable : [item_variable]\r\nSub Total : [sub_total]\r\nDiscount Amount : [discount_amount]\r\nShipping Amount : [shipping_amount]\r\nTax Amount : [tax_amount]\r\nFinal Total : [final_total]\r\nOrder Details link : [link]\r\nOrder Time : [time]', '1', NULL, NULL),
(85, 'order_email_message', '<ul style=\"display: grid; gap: 4px; color: rgb(104, 109, 130); font-size: 13.2px; padding-left: 0px !important;\"><li style=\"list-style: none; color: var(--ig-gray-700);\">Order No :&nbsp;<span style=\"color: var(--ig-primary);\">[order_no]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Customer Name :&nbsp;<span style=\"color: var(--ig-primary);\">[customer_name]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Billing Address :&nbsp;<span style=\"color: var(--ig-primary);\">[billing_address]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Billing Country :&nbsp;<span style=\"color: var(--ig-primary);\">[billing_country]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Billing City :&nbsp;<span style=\"color: var(--ig-primary);\">[billing_city]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Billing Zip Code :&nbsp;<span style=\"color: var(--ig-primary);\">[billing_zip_code]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Billing State :&nbsp;<span style=\"color: var(--ig-primary);\">[billing_state]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Item Variable :&nbsp;<span style=\"color: var(--ig-primary);\">[item_variable]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Sub Total :&nbsp;<span style=\"color: var(--ig-primary);\">[sub_total]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Discount Amount :&nbsp;<span style=\"color: var(--ig-primary);\">[discount_amount]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Shipping Amount :&nbsp;<span style=\"color: var(--ig-primary);\">[shipping_amount]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Tax Amount :&nbsp;<span style=\"color: var(--ig-primary);\">[taxt_amount]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Final Total :&nbsp;<span style=\"color: var(--ig-primary);\">[final_total]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Order Details link :&nbsp;<span style=\"color: var(--ig-primary);\">[link]</span></li><li style=\"list-style: none; color: var(--ig-gray-700);\">Order Time :&nbsp;<span style=\"color: var(--ig-primary);\">[time]</span></li></ul>', '1', NULL, NULL),
(86, 'shipping_configuration', '{\"shipping_option\":\"FLAT\",\"standard_shipping_fee\":\"20\"}', '1', NULL, NULL),
(87, 'deliveryman_app_settings', '{\"page_1\":{\"image\":null,\"heading\":\"Welcome to Fluute: Your Ultimate Music Companion\",\"description\":\"Get ready to elevate your music experience with Fluute \\u2013 the ultimate music companion. Dive into a world of endless tunes, curated playlists, and personalized recommendations. Join Fluute today and let the music take you on a journey.\"},\"page_2\":{\"image\":null,\"heading\":\"Personalized Recommendations Just for You\\\"\",\"description\":\"Get ready to elevate your music experience with Fluute \\u2013 the ultimate music companion. Dive into a world of endless tunes, curated playlists, and personalized recommendations. Join Fluute today and let the music take you on a journey.\\\"\"}}', '1', NULL, NULL),
(88, 'whats_app_number_int_message', 'Hello there', '1', NULL, NULL),
(89, 'seller_kyc_settings', '[{\"labels\":\"name\",\"placeholder\":\"Enter your name\",\"default\":\"0\",\"multiple\":\"0\",\"name\":\"name\",\"type\":\"text\",\"required\":\"1\"}]', '1', NULL, NULL),
(90, 'seller_product_status_update_permission', '0', '1', NULL, NULL),
(91, 'seller_kyc_verification', '0', '1', NULL, NULL),
(92, 'seller_captcha', '0', '1', NULL, NULL),
(93, 'facebook_pixel_id', '@@@@@@@@', '1', NULL, NULL),
(94, 'facebook_pixel', '0', '1', NULL, NULL),
(95, 'delivery_man_module', '1', '1', NULL, NULL),
(96, 'chat_with_customer', '1', '1', NULL, NULL),
(97, 'chat_with_deliveryman', '1', '1', NULL, NULL),
(98, 'order_assign', '1', '1', NULL, NULL),
(99, 'deliveryman_registration', '1', '1', NULL, NULL),
(100, 'deliveryman_kyc_verification', '0', '1', NULL, NULL),
(101, 'deliveryman_assign_cancel', '1', '1', NULL, NULL),
(102, 'order_verification', '0', '1', NULL, NULL),
(103, 'deliveryman_referral_system', '0', '1', NULL, NULL),
(104, 'deliveryman_referral_reward_point', '10', '1', NULL, NULL),
(105, 'deliveryman_club_point_system', '0', '1', NULL, NULL),
(106, 'deliveryman_default_reward_point', '0', '1', NULL, NULL),
(107, 'deliveryman_reward_point_configuration', '[{\"min_amount\":\"0\",\"less_than_eq\":\"200\",\"point\":\"10\"},{\"min_amount\":\"201\",\"less_than_eq\":\"300\",\"point\":\"15\"}]', '1', NULL, NULL),
(108, 'deliveryman_reward_amount_configuration', '[{\"name\":\"Gold\",\"min_amount\":\"0\",\"less_than_eq\":\"500\",\"amount\":\"40\"}]', '1', NULL, NULL),
(109, 'delivery_faq', '{\"delivery_faq_1\":{\"question\":\"Demo FAQ\",\"answer\":\"DEMO ANSWER\"},\"delivery_faq_2\":{\"question\":\"Demo FAQ 1\",\"answer\":\"DEMO ANSWER 1\"}}', '1', NULL, NULL),
(110, 'deliveryman_kyc_settings', '[{\"labels\":\"dob\",\"placeholder\":\"Enter dob\",\"default\":\"0\",\"multiple\":\"0\",\"name\":\"dob\",\"type\":\"date\",\"required\":\"1\"}]', '1', NULL, NULL),
(111, 'app_version', '2.4', '1', NULL, NULL),
(112, 'system_installed_at', '2025-07-23 16:04:02', '1', NULL, NULL),
(113, 'app_version', '2.5', '1', NULL, NULL),
(114, 'system_installed_at', '2025-07-23 16:04:14', '1', NULL, NULL),
(115, 'is_domain_verified', '1', '1', NULL, NULL),
(116, 'next_verification', '2025-08-15 14:37:50', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_deliveries`
--

CREATE TABLE `shipping_deliveries` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_id` int UNSIGNED DEFAULT NULL,
  `duration` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `price_configuration` longtext COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Inactive : 0',
  `free_shipping` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_type` enum('price_wise','weight_wise') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active: 1, Inactive: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Visible: 1, Hidden: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_files`
--

CREATE TABLE `support_files` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_message_id` int UNSIGNED DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_ticket_id` int UNSIGNED DEFAULT NULL,
  `admin_id` int UNSIGNED DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `seller_id` int UNSIGNED DEFAULT NULL,
  `deliveryman_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Running : 1, Answered : 2, Replied : 3, closed : 4',
  `priority` tinyint NOT NULL DEFAULT '1' COMMENT 'Low : 1, medium : 2 high: 3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1, Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quote` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT 'Active : 1, Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` int UNSIGNED DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `deliveryman_id` bigint UNSIGNED DEFAULT NULL,
  `guest_user` longtext COLLATE utf8mb4_unicode_ci,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `post_balance` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `post_balance_pos` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `transaction_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `transaction_number` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `code`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'en', 'admin_login', 'Admin Login', '2025-08-14 14:37:52', '2025-08-14 14:37:52'),
(2, 'en', 'sign_in_to_continue_to', 'Sign in to continue to', '2025-08-14 14:37:52', '2025-08-14 14:37:52'),
(3, 'en', 'username', 'Username', '2025-08-14 14:37:52', '2025-08-14 14:37:52'),
(4, 'en', 'enter_username', 'Enter username', '2025-08-14 14:37:52', '2025-08-14 14:37:52'),
(5, 'en', 'forgot_password', 'Forgot password', '2025-08-14 14:37:52', '2025-08-14 14:37:52'),
(6, 'en', 'password', 'Password', '2025-08-14 14:37:52', '2025-08-14 14:37:52'),
(7, 'en', 'enter_password', 'Enter Password', '2025-08-14 14:37:52', '2025-08-14 14:37:52'),
(8, 'en', 'remember_me', 'Remember me', '2025-08-14 14:37:52', '2025-08-14 14:37:52'),
(9, 'en', 'sign_in', 'Sign In', '2025-08-14 14:37:52', '2025-08-14 14:37:52'),
(10, 'en', 'admin_dashboard', 'Admin Dashboard', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(11, 'en', 'wellcome_back', 'Wellcome back', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(12, 'en', 'last_cron_run', 'Last Cron Run', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(13, 'en', 'tasks_to_be_done', 'Tasks to be done!', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(14, 'en', 'setup', 'Setup', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(15, 'en', 'mail_configuration__used_for_sending_emails', 'Mail Configuration - used for sending emails', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(16, 'en', 'ai_configuration__used_for_generating_content_using_open_ai', 'AI Configuration - used for generating content using open AI', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(17, 'en', 'total_earnings', 'Total Earnings', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(18, 'en', 'view_all', 'View All', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(19, 'en', 'subscription_payment', 'Subscription Payment', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(20, 'en', 'order_payment', 'Order Payment', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(21, 'en', 'withdraw_amount', 'Withdraw Amount', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(22, 'en', 'inhouse_products', 'Inhouse Products', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(23, 'en', 'digital_products', 'Digital Products', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(24, 'en', 'total_customers', 'Total Customers', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(25, 'en', 'total_sellers', 'Total Sellers', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(26, 'en', 'inhouse_orders', 'Inhouse Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(27, 'en', 'delivered_orders', 'Delivered Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(28, 'en', 'shipped_orders', 'Shipped Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(29, 'en', 'canceld_orders', 'Canceld Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(30, 'en', 'monthly_order_insight', 'Monthly Order Insight', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(31, 'en', 'sorry_no_result_found', 'Sorry! No Result Found', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(32, 'en', 'latest_orders', 'Latest Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(33, 'en', 'order_id', 'Order ID', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(34, 'en', 'qty', 'Qty', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(35, 'en', 'time', 'Time', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(36, 'en', 'customer_info', 'Customer Info', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(37, 'en', 'amount', 'Amount', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(38, 'en', 'delivery', 'Delivery', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(39, 'en', 'action', 'Action', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(40, 'en', 'best_selling_products', 'Best Selling Products', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(41, 'en', 'product', 'Product', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(42, 'en', 'categories__sold_item', 'Categories - Sold Item', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(43, 'en', 'info', 'Info', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(44, 'en', 'top_item__todays_deal', 'Top Item - Todays Deal', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(45, 'en', 'time__status', 'Time - Status', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(46, 'en', 'top_category', 'Top Category', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(47, 'en', 'orders_insight', 'Orders Insight', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(48, 'en', 'total_orders', 'Total Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(49, 'en', 'physical_orders', 'Physical Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(50, 'en', 'digital_orders', 'Digital Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(51, 'en', 'product_insight', 'Product Insight', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(52, 'en', 'total_product', 'Total Product', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(53, 'en', 'inhouse_product', 'Inhouse Product', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(54, 'en', 'digital_product', 'Digital Product', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(55, 'en', 'latest_transactions', 'Latest Transactions', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(56, 'en', 'date', 'Date', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(57, 'en', 'customerselller', 'Customer/Selller', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(58, 'en', 'transaction_id', 'Transaction ID', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(59, 'en', 'earning_insight', 'Earning Insight', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(60, 'en', 'web_visitors_insight', 'Web Visitors Insight', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(61, 'en', 'total_order', 'Total Order', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(62, 'en', 'digital_order', 'Digital Order', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(63, 'en', 'physical_order', 'Physical Order', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(64, 'en', 'physical_product', 'Physical Product', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(65, 'en', 'total_sell', 'Total Sell', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(66, 'en', 'payment_charge', 'Payment Charge', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(67, 'en', 'withdraw_charge', 'Withdraw Charge', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(68, 'en', 'add_new', 'Add New', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(69, 'en', 'new_product', 'New Product', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(70, 'en', 'new_brand', 'New Brand', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(71, 'en', 'new_category', 'New Category', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(72, 'en', 'clear_cache', 'Clear Cache', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(73, 'en', 'browse_frontend', 'Browse Frontend', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(74, 'en', 'pos', 'POS', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(75, 'en', 'placed_order', 'Placed Order', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(76, 'en', 'welcome', 'Welcome', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(77, 'en', 'settings', 'Settings', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(78, 'en', 'logout', 'Logout', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(79, 'en', 'dashboard', 'Dashboard', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(80, 'en', 'ecommerce_management', 'E-commerce Management', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(81, 'en', 'orders', 'Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(82, 'en', 'physical', 'Physical', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(83, 'en', 'inhouse', 'Inhouse', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(84, 'en', 'seller', 'Seller', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(85, 'en', 'digital', 'Digital', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(86, 'en', 'products', 'Products', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(87, 'en', 'catalogs', 'Catalogs', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(88, 'en', 'categories', 'Categories', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(89, 'en', 'brands', 'Brands', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(90, 'en', 'attributes', 'Attributes', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(91, 'en', 'taxes', 'Taxes', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(92, 'en', 'user_management', 'User Management', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(93, 'en', 'customer', 'Customer', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(94, 'en', 'list', 'List', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(95, 'en', 'wallet', 'Wallet', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(96, 'en', 'rewards_program', 'Rewards Program', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(97, 'en', 'shop_analytics', 'Shop Analytics', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(98, 'en', 'seller_accounts', 'Seller Accounts', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(99, 'en', 'subscription_plans', 'Subscription Plans', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(100, 'en', 'active_subscriptions', 'Active Subscriptions', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(101, 'en', 'pricing_plans', 'Pricing Plans', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(102, 'en', 'delivery_personnel', 'Delivery Personnel', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(103, 'en', 'referral_program', 'Referral Program', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(104, 'en', 'configuration', 'Configuration', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(105, 'en', 'kyc_configuration', 'KYC Configuration', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(106, 'en', 'app_settings', 'App Settings', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(107, 'en', 'staff', 'Staff', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(108, 'en', 'staff_list', 'Staff List', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(109, 'en', 'roles__permissions', 'Roles & Permissions', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(110, 'en', 'business_operations', 'Business Operations', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(111, 'en', 'pos_system', 'POS System', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(112, 'en', 'pos_dashboard', 'POS Dashboard', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(113, 'en', 'point_of_sale', 'Point of Sale', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(114, 'en', 'pos_orders', 'POS Orders', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(115, 'en', 'payment_methods', 'Payment Methods', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(116, 'en', 'payment_logs', 'Payment Logs', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(117, 'en', 'marketing__promotions', 'Marketing & Promotions', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(118, 'en', 'coupon_management', 'Coupon Management', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(119, 'en', 'campaign_management', 'Campaign Management', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(120, 'en', 'flash_deals', 'Flash Deals', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(121, 'en', 'support__analytics', 'Support & Analytics', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(122, 'en', 'support_tickets', 'Support Tickets', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(123, 'en', 'reports__analytics', 'Reports & Analytics', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(124, 'en', 'financial_reports', 'Financial Reports', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(125, 'en', 'transaction_reports', 'Transaction Reports', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(126, 'en', 'payment_reports', 'Payment Reports', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(127, 'en', 'wallet_management', 'Wallet Management', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(128, 'en', 'deposits', 'Deposits', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(129, 'en', 'withdrawals', 'Withdrawals', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(130, 'en', 'website__content', 'Website & Content', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(131, 'en', 'website_management', 'Website Management', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(132, 'en', 'frontend_content', 'Frontend Content', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(133, 'en', 'frontend_sections', 'Frontend Sections', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(134, 'en', 'testimonials', 'Testimonials', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(135, 'en', 'home_categories', 'Home Categories', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(136, 'en', 'banner_management', 'Banner Management', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(137, 'en', 'promotional_banners', 'Promotional Banners', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(138, 'en', 'section_banners', 'Section Banners', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(139, 'en', 'content_management', 'Content Management', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(140, 'en', 'navigation_menus', 'Navigation Menus', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(141, 'en', 'custom_pages', 'Custom Pages', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(142, 'en', 'blog_posts', 'Blog Posts', '2025-08-14 14:38:02', '2025-08-14 14:38:02'),
(143, 'en', 'faq_management', 'FAQ Management', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(144, 'en', 'customer_engagement', 'Customer Engagement', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(145, 'en', 'newsletter_subscribers', 'Newsletter Subscribers', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(146, 'en', 'contact_messages', 'Contact Messages', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(147, 'en', 'system_configuration', 'System Configuration', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(148, 'en', 'system', 'System', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(149, 'en', 'general', 'General', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(150, 'en', 'vendor_kyc', 'Vendor KYC', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(151, 'en', 'mobile_app', 'Mobile App', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(152, 'en', 'seo', 'SEO', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(153, 'en', 'currency', 'Currency', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(154, 'en', 'language', 'Language', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(155, 'en', 'payment', 'Payment', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(156, 'en', 'payment_gateways', 'Payment Gateways', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(157, 'en', 'withdrawal_methods', 'Withdrawal Methods', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(158, 'en', 'communication', 'Communication', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(159, 'en', 'notification_templates', 'Notification Templates', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(160, 'en', 'email_configuration', 'Email Configuration', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(161, 'en', 'mail_gateway', 'Mail Gateway', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(162, 'en', 'global_template', 'Global Template', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(163, 'en', 'sms_configuration', 'SMS Configuration', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(164, 'en', 'sms_gateway', 'SMS Gateway', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(165, 'en', 'security', 'Security', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(166, 'en', 'visitor_management', 'Visitor Management', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(167, 'en', 'dos_protection', 'DoS Protection', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(168, 'en', 'miscellaneous', 'Miscellaneous', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(169, 'en', 'shipping_configuration', 'Shipping Configuration', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(170, 'en', 'general_configuration', 'General Configuration', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(171, 'en', 'location_management', 'Location Management', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(172, 'en', 'countries', 'Countries', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(173, 'en', 'statesprovinces', 'States/Provinces', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(174, 'en', 'cities', 'Cities', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(175, 'en', 'shipping_zones', 'Shipping Zones', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(176, 'en', 'delivery_methods', 'Delivery Methods', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(177, 'en', 'ai_configuration', 'AI Configuration', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(178, 'en', 'system_maintenance', 'System Maintenance', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(179, 'en', 'system_updates', 'System Updates', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(180, 'en', 'addon_manager', 'Addon Manager', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(181, 'en', 'system_information', 'System Information', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(182, 'en', 'v', 'V', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(183, 'en', 'ai_assistance', 'AI Assistance', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(184, 'en', 'result', 'Result', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(185, 'en', 'copy', 'Copy', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(186, 'en', 'download', 'Download', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(187, 'en', 'your_content', 'Your Content', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(188, 'en', 'your_prompt_goes_here__', 'Your prompt goes here .... ', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(189, 'en', 'what_do_you_want_to_do', 'What do you want to do', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(190, 'en', 'here_are_some_ideas', 'Here are some ideas', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(191, 'en', 'more', 'More', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(192, 'en', 'translate', 'Translate', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(193, 'en', 'back', 'Back', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(194, 'en', 'rewrite_it', 'Rewrite It', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(195, 'en', 'adjust_tone', 'Adjust Tone', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(196, 'en', 'choose_language', 'Choose Language', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(197, 'en', 'select_language', 'Select Language', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(198, 'en', 'or', 'OR', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(199, 'en', 'write_your_custom_prompt', 'Write your custom prompt', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(200, 'en', 'ex_make_it_more_friendly_', 'Ex: Make It more friendly ', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(201, 'en', 'insert', 'Insert', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(202, 'en', 'cancel', 'Cancel', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(203, 'en', 'do_not_close_window_while_proecessing', 'Do not close window while proecessing', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(204, 'en', 'select_country', 'Select Country', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(205, 'en', 'this_function_is_not_avaialbe_for_website_demo_mode', 'This Function is Not Avaialbe For Website Demo Mode', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(206, 'en', 'generate_with_ai', 'Generate With AI', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(207, 'en', 'text_copied_to_clipboard', 'Text copied to clipboard!', '2025-08-14 14:38:03', '2025-08-14 14:38:03'),
(208, 'en', 'marketing', 'Marketing', '2025-08-14 14:40:37', '2025-08-14 14:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active: 1, Inactive: 0',
  `platform` enum('web','app','both') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audience` enum('seller','customer','delivery_man') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `files` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `billing_address` longtext COLLATE utf8mb4_unicode_ci,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` mediumint NOT NULL DEFAULT '0',
  `otp_code` mediumint DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Active : 1, Inactive : 0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint UNSIGNED NOT NULL,
  `state_id` bigint UNSIGNED NOT NULL,
  `city_id` bigint UNSIGNED NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_login_infos`
--

CREATE TABLE `user_login_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_info` longtext COLLATE utf8mb4_unicode_ci,
  `is_blocked` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Yes: 1, No: 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` int UNSIGNED DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `deliveryman_id` bigint DEFAULT NULL,
  `method_id` int UNSIGNED DEFAULT NULL,
  `currency_id` int UNSIGNED DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `rate` double(20,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(18,8) DEFAULT NULL,
  `trx_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `withdraw_information` text COLLATE utf8mb4_unicode_ci,
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'success : 1, pending : 2, reject : 3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `name` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `max_limit` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `duration` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `user_information` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'Active : 1, Inactive : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Visible : 1, Hidden : 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_uid_index` (`uid`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_password_resets_uid_index` (`uid`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_name_unique` (`name`),
  ADD KEY `attributes_uid_index` (`uid`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_uid_index` (`uid`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_uid_index` (`uid`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_uid_index` (`uid`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_uid_index` (`uid`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaigns_name_unique` (`name`),
  ADD UNIQUE KEY `campaigns_slug_unique` (`slug`),
  ADD KEY `campaigns_uid_index` (`uid`);

--
-- Indexes for table `campaign_products`
--
ALTER TABLE `campaign_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_products_uid_index` (`uid`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_uid_index` (`uid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_uid_index` (`uid`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compare_product_lists`
--
ALTER TABLE `compare_product_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `compare_product_lists_uid_unique` (`uid`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_us_uid_index` (`uid`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_zone`
--
ALTER TABLE `country_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_uid_index` (`uid`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `customer_deliveryman_conversations`
--
ALTER TABLE `customer_deliveryman_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_seller_conversations`
--
ALTER TABLE `customer_seller_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_earning_logs`
--
ALTER TABLE `deliveryman_earning_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_password_resets`
--
ALTER TABLE `deliveryman_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveryman_password_resets_identifier_index` (`identifier`),
  ADD KEY `deliveryman_password_resets_uid_index` (`uid`),
  ADD KEY `deliveryman_password_resets_token_index` (`token`);

--
-- Indexes for table `delivery_man_conversations`
--
ALTER TABLE `delivery_man_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_man_conversations_sender_id_index` (`sender_id`),
  ADD KEY `delivery_man_conversations_receiver_id_index` (`receiver_id`);

--
-- Indexes for table `delivery_man_orders`
--
ALTER TABLE `delivery_man_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_ratings`
--
ALTER TABLE `delivery_man_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_man_ratings_rating_index` (`rating`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `digital_product_attributes`
--
ALTER TABLE `digital_product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `digital_product_attribute_values`
--
ALTER TABLE `digital_product_attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `exclusive_offers`
--
ALTER TABLE `exclusive_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_products`
--
ALTER TABLE `feature_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frontends_name_unique` (`name`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyc_logs`
--
ALTER TABLE `kyc_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_categories`
--
ALTER TABLE `menu_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_latters`
--
ALTER TABLE `news_latters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_setups`
--
ALTER TABLE `page_setups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_unique_code_unique` (`unique_code`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_carts`
--
ALTER TABLE `pos_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_cart_holds`
--
ALTER TABLE `pos_cart_holds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing_plans`
--
ALTER TABLE `pricing_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_shipping_deliveries`
--
ALTER TABLE `product_shipping_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_methods`
--
ALTER TABLE `refund_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_point_logs`
--
ALTER TABLE `reward_point_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_password_resets`
--
ALTER TABLE `seller_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_shop_settings`
--
ALTER TABLE `seller_shop_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_deliveries`
--
ALTER TABLE `shipping_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_files`
--
ALTER TABLE `support_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tutorials_uid_unique` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login_infos`
--
ALTER TABLE `user_login_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_products`
--
ALTER TABLE `campaign_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compare_product_lists`
--
ALTER TABLE `compare_product_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `country_zone`
--
ALTER TABLE `country_zone`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer_deliveryman_conversations`
--
ALTER TABLE `customer_deliveryman_conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_seller_conversations`
--
ALTER TABLE `customer_seller_conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_earning_logs`
--
ALTER TABLE `deliveryman_earning_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_password_resets`
--
ALTER TABLE `deliveryman_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_conversations`
--
ALTER TABLE `delivery_man_conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_orders`
--
ALTER TABLE `delivery_man_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_ratings`
--
ALTER TABLE `delivery_man_ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `digital_product_attributes`
--
ALTER TABLE `digital_product_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `digital_product_attribute_values`
--
ALTER TABLE `digital_product_attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `exclusive_offers`
--
ALTER TABLE `exclusive_offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_products`
--
ALTER TABLE `feature_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1112;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyc_logs`
--
ALTER TABLE `kyc_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mails`
--
ALTER TABLE `mails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_categories`
--
ALTER TABLE `menu_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `news_latters`
--
ALTER TABLE `news_latters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_setups`
--
ALTER TABLE `page_setups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugin_settings`
--
ALTER TABLE `plugin_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_carts`
--
ALTER TABLE `pos_carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_cart_holds`
--
ALTER TABLE `pos_cart_holds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pricing_plans`
--
ALTER TABLE `pricing_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_shipping_deliveries`
--
ALTER TABLE `product_shipping_deliveries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_taxes`
--
ALTER TABLE `product_taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_methods`
--
ALTER TABLE `refund_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_point_logs`
--
ALTER TABLE `reward_point_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_password_resets`
--
ALTER TABLE `seller_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_shop_settings`
--
ALTER TABLE `seller_shop_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `shipping_deliveries`
--
ALTER TABLE `shipping_deliveries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_files`
--
ALTER TABLE `support_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login_infos`
--
ALTER TABLE `user_login_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
