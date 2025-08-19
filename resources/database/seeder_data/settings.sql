-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 10, 2025 at 07:47 AM
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
(21, 'app_version', '2.3', '1', NULL, NULL),
(22, 'last_cron_run', NULL, '1', NULL, NULL),
(23, 'cod', 'active', '1', NULL, NULL),
(24, 'seller_mode', 'active', '1', NULL, NULL),
(25, 'system_installed_at', '2025-07-23 16:03:17', '1', NULL, NULL),
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
(113, 'app_version', '2.6', '1', NULL, NULL),
(114, 'system_installed_at', '2025-07-23 16:04:14', '1', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
