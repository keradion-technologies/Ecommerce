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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
