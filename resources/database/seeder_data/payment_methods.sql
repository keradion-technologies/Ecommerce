-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 10, 2025 at 07:51 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_unique_code_unique` (`unique_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
