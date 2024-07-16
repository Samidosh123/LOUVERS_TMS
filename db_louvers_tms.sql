-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2024 at 01:19 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_louvers_tms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(28,8) DEFAULT 0.00000000,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `balance`, `email_verified_at`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@admin.com', 'admin', '11640.00000000', NULL, '5ff1c3531ed3f1609679699.jpg', '$2y$10$T3ZxC09MQy.3B9exYL3Uluv34JpY.nmFhFyoTnfWEs/zHxQ6xO/Te', NULL, '2024-05-05 22:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `read_status`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'New member registered', 0, '/admin/user/detail/1', '2024-05-05 22:40:41', '2024-05-05 22:40:41'),
(2, 1, 'Payment request from customer', 0, '/admin/payment/details/1', '2024-05-05 22:41:59', '2024-05-05 22:41:59'),
(3, 1, 'New support ticket has opened', 0, '/admin/tickets/view/1', '2024-05-05 23:24:09', '2024-05-05 23:24:09'),
(4, 0, 'A new support ticket has opened ', 0, '/admin/tickets/view/2', '2024-05-05 23:50:17', '2024-05-05 23:50:17'),
(5, 1, 'Payment request from customer', 0, '/admin/payment/details/2', '2024-05-07 11:16:07', '2024-05-07 11:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assigned_vehicles`
--

CREATE TABLE `assigned_vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start_from` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assigned_vehicles`
--

INSERT INTO `assigned_vehicles` (`id`, `trip_id`, `vehicle_id`, `start_from`, `end_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '08:00:00', '16:00:00', 1, '2024-05-05 22:36:41', '2024-05-05 22:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `booked_tickets`
--

CREATE TABLE `booked_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `gender` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `trip_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `source_destination` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dropping_point` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `seats` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unit_price` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `sub_total` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `date_of_journey` date DEFAULT NULL,
  `pnr_number` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booked_tickets`
--

INSERT INTO `booked_tickets` (`id`, `user_id`, `gender`, `trip_id`, `source_destination`, `pickup_point`, `dropping_point`, `seats`, `ticket_count`, `unit_price`, `sub_total`, `date_of_journey`, `pnr_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '[\"1\",\"2\"]', 1, 2, '[\"1-C1\",\"1-C2\"]', 2, '1500.00000000', '3000.00000000', '2024-05-06', 'OEJSMEVSN2', 1, '2024-05-05 22:41:26', '2024-05-05 22:42:58'),
(2, 1, 1, 1, '[\"1\",\"2\"]', 1, 2, '[\"1-D2\"]', 1, '1500.00000000', '1500.00000000', '2024-05-10', 'HKV4FJR277', 1, '2024-05-07 11:15:23', '2024-05-07 11:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `name`, `city`, `location`, `mobile`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Counter 001(NRB)', 'Nairobi', 'Nairobi CBD', '0700100100', 1, '2024-05-05 22:26:13', '2024-05-05 22:37:47'),
(2, 'Counter 002(MSA)', 'Mombasa', 'Mombasa CBD', '0700100101', 1, '2024-05-05 22:27:02', '2024-05-05 22:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `booked_ticket_id` int(10) NOT NULL,
  `method_code` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `booked_ticket_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1000, '3000.00000000', 'KES', '310.00000000', '1.00000000', '3310.00000000', '{\"mpesa_code\":{\"field_name\":\"GGHSJHKJSKKSGJHJS\",\"type\":\"text\"},\"id_number\":{\"field_name\":\"37684545\",\"type\":\"text\"}}', '0', '', 'X8RTZZQ3K32J', 0, 1, 0, NULL, '2024-05-05 22:41:33', '2024-05-05 22:42:58'),
(2, 1, 2, 1000, '1500.00000000', 'KES', '75.00000000', '1.00000000', '1575.00000000', '{\"mpesa_code\":{\"field_name\":\"VHGDHJGSFD\",\"type\":\"text\"},\"id_number\":{\"field_name\":\"56253262\",\"type\":\"text\"}}', '0', '', '55OPS6JQ8N6H', 0, 1, 0, NULL, '2024-05-07 11:15:37', '2024-05-07 11:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mail_sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_logs`
--

INSERT INTO `email_logs` (`id`, `user_id`, `mail_sender`, `email_from`, `email_to`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'php', 'LOUVERS TMS do-not-reply@viserlab.com', 'customer@customer.com', 'Payment Request Submitted Successfully', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Customer M (customer)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>Your payment request of <b>3,000.00 KES</b> is via&nbsp; <b>LIPA NA MPESA </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : 3,000.00 KES</div><div>Charge: <font color=\"#FF0000\">310.00 KES</font></div><div><br></div><div>Conversion Rate : 1 KES = 1.00 KES</div><div>Payable : 3,310.00 KES <br></div><div>Pay via :&nbsp; LIPA NA MPESA</div><div><br></div><div>Transaction Number : X8RTZZQ3K32J</div><div><br></div><div><b>Pending Booking Information :<br></b></div><div><br></div><div>Date of Journey : 06 05, 2024</div><div>Seats: 1-C1,1-C2</div><div>Total Seats : 2</div><div>Starting Point : Counter 001(NRB)</div><div>Destination : Counter 002(MSA)</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', '2024-05-05 22:41:59', '2024-05-05 22:41:59'),
(2, 1, 'php', 'LOUVERS TMS do-not-reply@viserlab.com', 'customer@customer.com', 'Your payment is Approved', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Customer M (customer)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>Your payment request of <b>3,000.00 KES</b> is via&nbsp; <b>LIPA NA MPESA </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : 3,000.00 KES</div><div>Charge: <font color=\"#FF0000\">310.00 KES</font></div><div><br></div><div>Conversion Rate : 1 KES = 1.00 KES</div><div>Payable : 3,310.00 KES <br></div><div>Paid via :&nbsp; LIPA NA MPESA</div><div><br></div><div>Transaction Number : X8RTZZQ3K32J</div><div><br></div><div><b>Booking Information :<br></b></div><div><br></div><div>Date of Journey : 06 05, 2024</div><div>Seats: 1-C1,1-C2</div><div>Total Seats : 2</div><div>Starting Point : Counter 001(NRB)</div><div>Destination : Counter 002(MSA)</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', '2024-05-05 22:42:58', '2024-05-05 22:42:58'),
(3, 1, 'php', 'LOUVERS TMS do-not-reply@viserlab.com', 'customer@customer.com', 'Reply Support Ticket', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Customer M (customer@customer.com)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#131856] Payment Delay<br><br>Click here to reply:&nbsp; http://localhost/LOUVERS_TMS/ticket/view/131856</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> It has been resolved<br></p></div><div><br></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', '2024-05-05 23:25:33', '2024-05-05 23:25:33'),
(4, 1, 'php', 'LOUVERS TMS do-not-reply@viserlab.com', 'customer@customer.com', 'Payment Request Submitted Successfully', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Customer M (customer)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>Your payment request of <b>1,500.00 KES</b> is via&nbsp; <b>LIPA NA MPESA </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : 1,500.00 KES</div><div>Charge: <font color=\"#FF0000\">75.00 KES</font></div><div><br></div><div>Conversion Rate : 1 KES = 1.00 KES</div><div>Payable : 1,575.00 KES <br></div><div>Pay via :&nbsp; LIPA NA MPESA</div><div><br></div><div>Transaction Number : 55OPS6JQ8N6H</div><div><br></div><div><b>Pending Booking Information :<br></b></div><div><br></div><div>Date of Journey : 10 05, 2024</div><div>Seats: 1-D2</div><div>Total Seats : 1</div><div>Starting Point : Counter 001(NRB)</div><div>Destination : Counter 002(MSA)</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', '2024-05-07 11:16:07', '2024-05-07 11:16:07'),
(5, 1, 'php', 'LOUVERS TMS do-not-reply@viserlab.com', 'customer@customer.com', 'Your payment is Approved', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Customer M (customer)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>Your payment request of <b>1,500.00 KES</b> is via&nbsp; <b>LIPA NA MPESA </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : 1,500.00 KES</div><div>Charge: <font color=\"#FF0000\">75.00 KES</font></div><div><br></div><div>Conversion Rate : 1 KES = 1.00 KES</div><div>Payable : 1,575.00 KES <br></div><div>Paid via :&nbsp; LIPA NA MPESA</div><div><br></div><div>Transaction Number : 55OPS6JQ8N6H</div><div><br></div><div><b>Booking Information :<br></b></div><div><br></div><div>Date of Journey : 10 05, 2024</div><div>Seats: 1-D2</div><div>Total Seats : 1</div><div>Starting Point : Counter 001(NRB)</div><div>Destination : Counter 002(MSA)</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', '2024-05-07 11:18:07', '2024-05-07 11:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', 'Your account recovery code is: {{code}}', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-06 00:49:06'),
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\r\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', 'Your password has been changed successfully', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-07 10:23:47'),
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address.<br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-03 23:35:10'),
(4, 'SVER_CODE', 'SMS Verification ', 'Please verify your phone', 'Your phone verification code is: {{code}}', 'Your phone verification code is: {{code}}', '{\"code\":\"Verification code\"}', 0, 1, '2019-09-24 23:04:05', '2020-03-08 01:28:52'),
(16, 'ADMIN_SUPPORT_REPLY', 'Support Ticket Reply ', 'Reply Support Ticket', '<div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> {{reply}}<br></p></div><div><br></div>', '{{subject}}\r\n\r\n{{reply}}\r\n\r\n\r\nClick here to reply:  {{link}}', '{\"ticket_id\":\"Support Ticket ID\", \"ticket_subject\":\"Subject Of Support Ticket\", \"reply\":\"Reply from Staff/Admin\",\"link\":\"Ticket URL For relpy\"}', 1, 1, '2020-06-08 18:00:00', '2020-05-04 02:24:40'),
(217, 'PAYMENT_COMPLETE', 'Automated Payment - Successful', 'Payment Completed Successfully', '<div>Your payment of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Payment :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><b>Booking Information :<br></b></div><div><br></div><div>Date of Journey : {{journey_date}}</div><div>Seats: {{seats}}</div><div>Total Seats : {{total_seats}}</div><div>Starting Point : {{source}}</div><div>Destination : {{destination}}</div>', '{{amount}} {{currrency}} Payment successful by {{gateway_name}} .\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"journey_date\":\"journey date\",\"seats\":\"Seat Number\", \"total_seats\":\"Total Seats\",\"source\":\"Starting point\",\"destination\":\"Destination point\"\r\n}', 1, 1, '2020-06-24 18:00:00', '2020-11-17 03:10:00'),
(218, 'PAYMENT_REQUEST', 'Manual Payment - User Requested', 'Payment Request Submitted Successfully', '<div>Your payment request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><b>Pending Booking Information :<br></b></div><div><br></div><div>Date of Journey : {{journey_date}}</div><div>Seats: {{seats}}</div><div>Total Seats : {{total_seats}}</div><div>Starting Point : {{source}}</div><div>Destination : {{destination}}</div>', '{{amount}} Payment requested by {{method}}. Charge: {{charge}} . Trx: {{trx}} .\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"journey_date\":\"journey date\",\"seats\":\"Seat Number\", \"total_seats\":\"Total Seats\",\"source\":\"Starting point\",\"destination\":\"Destination point\"}', 1, 1, '2020-05-31 18:00:00', '2020-06-01 18:00:00'),
(219, 'PAYMENT_APPROVE', 'Manual Payment - Admin Approved', 'Your payment is Approved', '<div>Your payment request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><b>Booking Information :<br></b></div><div><br></div><div>Date of Journey : {{journey_date}}</div><div>Seats: {{seats}}</div><div>Total Seats : {{total_seats}}</div><div>Starting Point : {{source}}</div><div>Destination : {{destination}}</div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}.\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"journey_date\":\"journey date\",\"seats\":\"Seat Number\", \"total_seats\":\"Total Seats\",\"source\":\"Starting point\",\"destination\":\"Destination point\"}', 1, 1, '2020-06-16 18:00:00', '2020-06-14 18:00:00'),
(220, 'PAYMENT_REJECT', 'Manual Deposit - Admin Rejected', 'Your Payment Request is Rejected', '<div>Your payment request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><br></div><div><b>Rejected Booking Information :<br></b></div><div><br></div><div>Date of Journey : {{journey_date}}</div><div>Seats: {{seats}}</div><div>Total Seats : {{total_seats}}</div><div>Starting Point : {{source}}</div><div>Destination : {{destination}}</div><div><br></div><div>if you have any query, feel free to contact us.<br></div><br><div><br><br></div>\r\n\r\n\r\n\r\n{{rejection_message}}', 'Admin Rejected Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}}.\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"rejection_message\":\"Rejection message\",\"journey_date\":\"journey date\",\"seats\":\"Seat Number\", \"total_seats\":\"Total Seats\",\"source\":\"Starting point\",\"destination\":\"Destination point\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2022-02-19 06:16:49'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\r\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\r\n<div class=\"g-recaptcha\" data-sitekey=\"{{sitekey}}\" data-callback=\"verifyCaptcha\"></div>\r\n<div id=\"g-recaptcha-error\"></div>', '{\"sitekey\":{\"title\":\"Site Key\",\"value\":\"6Lfpm3cUAAAAAGIjbEJKhJNKS4X1Gns9ANjh8MfH\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2022-02-19 06:19:29'),
(3, 'custom-captcha', 'Custom Captcha', 'Just Put Any Random String', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, NULL, '2019-10-18 23:16:05', '2022-02-19 06:16:30'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, NULL, '2022-02-19 06:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `fleet_types`
--

CREATE TABLE `fleet_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seat_layout` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deck` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deck_seats` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facilities` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_ac` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fleet_types`
--

INSERT INTO `fleet_types` (`id`, `name`, `seat_layout`, `deck`, `deck_seats`, `facilities`, `has_ac`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BUS', '2 x 3', 1, '[\"50\"]', '[\"Soft Drinks\",\"Water Bottle\",\"Pillow\",\"Wifi\"]', 0, 1, '2024-05-05 22:29:08', '2024-05-05 22:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"ViserBus\",\"bus booking system\",\"bus booking php script\",\"single vendro bus booking system\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"ViserBus - Bus Ticket Booking System\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"6210e34d4726e1645273933.png\"}', '2020-07-04 23:42:52', '2022-02-19 06:32:13'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Know Few Words About Autobus\",\"short_description\":\"<div class=\\\"section-header\\\" style=\\\"margin-bottom:20px;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\"><font color=\\\"#424248\\\" face=\\\"Lato, sans-serif\\\"><span style=\\\"font-size:18px;\\\">LOUVERS TRANSPORT MANAGEMENT SYSTEM<\\/span><\\/font><br \\/><\\/p><\\/div>\",\"title\":\"About Us\",\"description\":\"<div class=\\\"item\\\" style=\\\"margin-bottom:30px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-bottom:10px;margin-left:0px;padding:0px;\\\"><span style=\\\"color:rgb(66,66,72);font-family:Georama, sans-serif;font-size:24px;font-weight:600;\\\">Why Make Bus Reservations With AutoBus<\\/span><\\/p><\\/div><div class=\\\"item\\\" style=\\\"margin-bottom:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><ul class=\\\"info\\\" style=\\\"margin-top:15px;margin-bottom:-7px;margin-left:15px;\\\"><li style=\\\"list-style:disc;padding:3px 0px;\\\">Free Cancellation<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">Instant Refunds<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">Easy &amp; Quick Bus Booking<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">Exciting Cashback &amp; Bus Offers<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">Best Price Assured<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">24\\/7 Customer Assistance<\\/li><\\/ul><\\/div><h2 class=\\\"title\\\" style=\\\"margin-top:-10px;margin-bottom:15px;font-weight:600;line-height:1.2;font-size:36px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h2>\",\"image\":\"61f24107cbedc1643266311.jpg\"}', '2020-10-28 00:51:20', '2024-05-05 23:00:35'),
(25, 'blog.content', '{\"heading\":\"Recent Blog Post\",\"sub_heading\":\"Have a look at our popular reason. why you should choose you bus. Just choose a Bus and get a ticket for your great journey. !\"}', '2020-10-28 00:51:34', '2022-01-26 11:59:36'),
(39, 'banner.content', '{\"heading\":\"Get Your Ticket Online, Easy and Safely\",\"link_title\":\"Get ticket now\",\"link\":\"tickets\",\"has_image\":\"1\",\"background_image\":\"61f118f07f1151643190512.png\",\"animation_image\":\"6209144de6ed01644762189.png\"}', '2021-05-02 06:09:30', '2022-02-19 20:05:54'),
(41, 'cookie.data', '{\"link\":\"#\",\"description\":\"<font face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size: 18px;\\\">We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.<\\/span><\\/font><br>\",\"status\":0}', '2020-07-04 23:42:52', '2024-05-05 22:17:24'),
(44, 'how_it_works.content', '{\"heading\":\"Get Your Tickets With Just 3 Steps\",\"sub_heading\":\"Have a look at our popular reason. why you should choose you bus. Just a Bus and get a ticket for your great journey. !\"}', '2022-01-26 09:40:32', '2022-01-26 09:40:32'),
(45, 'how_it_works.element', '{\"heading\":\"Search Your Bus\",\"sub_heading\":\"Choose your origin, destination,Just choose a Bus journey dates and search for buses\",\"icon\":\"<i class=\\\"las la-search\\\"><\\/i>\"}', '2022-01-26 09:41:18', '2022-01-26 09:41:18'),
(46, 'how_it_works.element', '{\"heading\":\"Choose The Ticket\",\"sub_heading\":\"Choose your origin, destination,Just a Bus for your great journey dates and search for buses\",\"icon\":\"<i class=\\\"las la-ticket-alt\\\"><\\/i>\"}', '2022-01-26 09:42:06', '2022-01-26 09:42:06'),
(47, 'how_it_works.element', '{\"heading\":\"Pay Bill\",\"sub_heading\":\"Choose your origin, destination,choose a Bus for your great journey dates and search for buses\",\"icon\":\"<i class=\\\"las la-money-bill-wave-alt\\\"><\\/i>\"}', '2022-01-26 09:42:57', '2022-01-26 09:42:57'),
(49, 'amenities.content', '{\"heading\":\"Our Amenities\",\"sub_heading\":\"Have a look at our popular reason. why you should choose you bus.Just choose a Bus and get a ticket for your great journey!\"}', '2022-01-26 10:40:00', '2022-01-26 10:40:00'),
(51, 'faq.content', '{\"heading\":\"Frequently Asked Questions\",\"sub_heading\":\"Frequently Asked Questions\"}', '2022-01-26 10:48:26', '2024-05-05 22:51:28'),
(55, 'testimonials.content', '{\"heading\":\"Our Testimonials\",\"sub_heading\":\"Have a look at our popular reason. why you should choose you bus. Just choose a Bus and get a ticket for your great journey!\"}', '2022-01-26 11:37:13', '2022-01-26 11:37:13'),
(61, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"61f14e10b48871643204112.jpg\"}', '2022-01-26 13:05:12', '2022-01-26 13:05:13'),
(63, 'contact.content', '{\"title\":\"Let\'s get in touch\",\"short_details\":\"We are open for any suggestion or just to have a chat\",\"address\":\"400 Nairobi CBD\",\"contact_number\":\"+254734772928\",\"email\":\"LOUVERS_TMS@GMAIL.COM\",\"latitude\":\"-1.2929064761882179\",\"longitude\":\"36.82334267269856\",\"form_title\":\"Have any Questions?\"}', '2022-01-27 05:45:27', '2024-05-05 22:57:06'),
(64, 'social_links.element', '{\"name\":\"Facebook\",\"icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2022-01-27 06:38:49', '2022-02-19 22:36:56'),
(65, 'social_links.element', '{\"name\":\"Twitter\",\"icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\\/\"}', '2022-01-27 06:40:02', '2024-05-05 22:46:36'),
(67, 'social_links.element', '{\"name\":\"Instagram\",\"icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', '2022-01-27 06:41:01', '2024-05-05 22:46:26'),
(68, 'footer.content', '{\"short_description\":\"LOUVERS TRANSPORT MANAGEMENT SYSTEM\"}', '2022-01-27 06:44:26', '2024-05-05 22:50:48'),
(69, 'policies.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h4 class=\\\"title\\\" style=\\\"margin:0px 0px 15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">LOUVERS TRANSPORT MANAGEMENT SYSTEM<\\/h4>\"}', '2022-01-27 07:01:56', '2024-05-05 22:49:38'),
(71, 'policies.element', '{\"title\":\"Terms and Conditions\",\"details\":\"<h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">LOUVERS TRANSPORT MANAGEMENT SYSTEM<\\/h4>\"}', '2022-01-27 07:02:26', '2024-05-05 22:49:54'),
(74, 'sign_in.content', '{\"has_image\":\"1\",\"heading\":\"Welcome to LOUVERS Booking\",\"sub_heading\":\"Sign In your Account\",\"background_image\":\"66380ff1996fd1714950129.jpg\"}', '2022-01-27 10:54:58', '2024-05-05 23:02:11'),
(75, 'sign_up.content', '{\"has_image\":\"1\",\"heading\":\"Welcome to LOUVERS Booking\",\"sub_heading\":\"Sign Up your Account\",\"background_image\":\"663810002d8811714950144.jpg\"}', '2022-01-27 10:55:28', '2024-05-05 23:02:25'),
(77, 'cookie_policy.content', '{\"title\":\"Cookie Policy\",\"details\":\"<h3 style=\\\"margin-top:15px;margin-bottom:15px;padding:0px;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\"><span style=\\\"font-size:14px;\\\"><b>LOUVERS TRANSPORT MANAGEMENT SYSTEM<\\/b><\\/span><\\/font><br \\/><\\/h3>\"}', '2022-01-30 13:27:14', '2024-05-05 22:52:14'),
(78, 'amenities.element', '{\"title\":\"Wifi\",\"icon\":\"<i class=\\\"las la-wifi\\\"><\\/i>\"}', '2022-02-10 00:07:40', '2022-02-10 00:07:40'),
(79, 'amenities.element', '{\"title\":\"Pillow\",\"icon\":\"<i class=\\\"las la-bed\\\"><\\/i>\"}', '2022-02-10 00:11:36', '2022-02-10 00:11:36'),
(80, 'amenities.element', '{\"title\":\"Water Bottle\",\"icon\":\"<i class=\\\"las la-prescription-bottle\\\"><\\/i>\"}', '2022-02-10 00:12:02', '2022-02-10 00:12:02'),
(81, 'amenities.element', '{\"title\":\"Soft Drinks\",\"icon\":\"<i class=\\\"fas fa-wine-glass-alt\\\"><\\/i>\"}', '2022-02-10 00:12:34', '2022-02-10 00:12:34'),
(83, 'forgot_password.content', '{\"has_image\":\"1\",\"heading\":\"Reset Password\",\"background_image\":\"66381037dfbc81714950199.jpg\"}', '2022-02-16 22:51:14', '2024-05-05 23:03:21'),
(84, 'verify_code.content', '{\"has_image\":\"1\",\"heading\":\"Account Recovery\",\"background_image\":\"663810112406b1714950161.jpg\"}', '2022-02-16 22:59:12', '2024-05-05 23:02:42'),
(85, 'reset_password.content', '{\"has_image\":\"1\",\"heading\":\"Reset Password page\",\"background_image\":\"663810247442a1714950180.jpg\"}', '2022-02-16 23:00:55', '2024-05-05 23:03:01'),
(90, 'policies.element', '{\"title\":\"Ticket Policies\",\"details\":\"<h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">LOUVERS TRANSPORT MANAGEMENT SYSTEM<\\/h4>\"}', '2022-02-19 19:53:30', '2024-05-05 22:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_form` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(37, 1000, 'LIPA NA MPESA', 'lipa_na_mpesa', '663813792871d1714951033.jpg', 1, '[]', '[]', 0, NULL, 'Go To Lipa Na MPESA<div>Paybill - 100100</div><div>A/C - Your Name</div>', '{\"mpesa_code\":{\"field_name\":\"mpesa_code\",\"field_level\":\"MPESA CODE\",\"type\":\"text\",\"validation\":\"required\"},\"id_number\":{\"field_name\":\"id_number\",\"field_level\":\"ID Number\",\"type\":\"text\",\"validation\":\"required\"}}', '2024-05-05 22:25:10', '2024-05-05 23:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(1, 'LIPA NA MPESA', 'KES', '', 1000, 'lipa_na_mpesa', '300.00000000', '10000.00000000', '5.00', '0.00000000', '1.00000000', '663813792871d1714951033.jpg', '{\"mpesa_code\":{\"field_name\":\"mpesa_code\",\"field_level\":\"MPESA CODE\",\"type\":\"text\",\"validation\":\"required\"},\"id_number\":{\"field_name\":\"id_number\",\"field_level\":\"ID Number\",\"type\":\"text\",\"validation\":\"required\"}}', '2024-05-05 22:25:10', '2024-05-05 23:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitename` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_version` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_api`, `base_color`, `mail_config`, `sms_config`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `secure_password`, `agree`, `registration`, `active_template`, `sys_version`, `created_at`, `updated_at`) VALUES
(1, 'LOUVERS TMS', 'KES', 'KES', 'do-not-reply@viserlab.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{name}}, {{message}}', '16d70c', '{\"name\":\"php\"}', '{\"clickatell_api_key\":\"----------------------------\",\"infobip_username\":\"--------------\",\"infobip_password\":\"----------------------\",\"message_bird_api_key\":\"-------------------\",\"nexmo_api_key\":\"----------------------\",\"nexmo_api_secret\":\"----------------------\",\"sms_broadcast_username\":\"----------------------\",\"sms_broadcast_password\":\"-----------------------------\",\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\",\"text_magic_username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\",\"name\":\"textMagic\"}', 0, 1, 0, 0, 0, 0, 1, 1, 'basic', NULL, NULL, '2024-05-06 00:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 1, '2020-07-06 03:47:55', '2022-02-19 06:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', 'home', 'templates.basic.', '[\"how_it_works\",\"amenities\",\"testimonials\",\"blog\"]', 1, '2020-07-11 06:23:58', '2022-02-19 22:35:26'),
(4, 'Blog', 'blog', 'templates.basic.', '[\"about\"]', 1, '2020-10-22 01:14:43', '2024-05-05 23:05:05'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_from` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `start_from`, `end_at`, `status`, `created_at`, `updated_at`) VALUES
(1, '08:00:00', '16:00:00', 1, '2024-05-05 22:33:36', '2024-05-05 22:33:36'),
(2, '10:00:00', '18:00:00', 1, '2024-05-05 22:34:06', '2024-05-05 22:34:47');

-- --------------------------------------------------------

--
-- Table structure for table `seat_layouts`
--

CREATE TABLE `seat_layouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `layout` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seat_layouts`
--

INSERT INTO `seat_layouts` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, '2 x 3', '2024-05-05 22:27:29', '2024-05-05 22:27:29'),
(2, '3 x 2', '2024-05-05 22:27:35', '2024-05-05 22:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_attachments`
--

INSERT INTO `support_attachments` (`id`, `support_message_id`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 2, '6638154484de31714951492.png', '2024-05-05 23:24:52', '2024-05-05 23:24:52');

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supportticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `supportticket_id`, `admin_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'I have paid for a ticket from nairobi to mombasa but it is still pending on the portal', '2024-05-05 23:24:09', '2024-05-05 23:24:09'),
(2, 1, 0, 'This is the error', '2024-05-05 23:24:52', '2024-05-05 23:24:52'),
(3, 1, 1, 'It has been resolved', '2024-05-05 23:25:33', '2024-05-05 23:25:33'),
(4, 1, 0, 'Thanks', '2024-05-05 23:26:22', '2024-05-05 23:26:22'),
(5, 2, 0, 'Test MSG', '2024-05-05 23:50:17', '2024-05-05 23:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `name`, `email`, `ticket`, `subject`, `status`, `priority`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, 1, 'Customer M', 'customer@customer.com', '131856', 'Payment Delay', 3, 3, '2024-05-06 02:26:22', '2024-05-05 23:24:09', '2024-05-05 23:26:43'),
(2, 0, 'Administrator', 'admin@admin.com', '43401192', 'Test', 0, 2, '2024-05-06 02:50:17', '2024-05-05 23:50:17', '2024-05-05 23:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_prices`
--

CREATE TABLE `ticket_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fleet_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_route_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_prices`
--

INSERT INTO `ticket_prices` (`id`, `fleet_type_id`, `vehicle_route_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1500.00', '2024-05-05 22:35:26', '2024-05-05 22:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_price_by_stoppages`
--

CREATE TABLE `ticket_price_by_stoppages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_price_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `source_destination` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_price_by_stoppages`
--

INSERT INTO `ticket_price_by_stoppages` (`id`, `ticket_price_id`, `source_destination`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, '[\"1\",\"2\"]', 1500.00, '2024-05-05 22:35:26', '2024-05-05 22:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleet_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_route_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `schedule_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_to` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `day_off` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `title`, `fleet_type_id`, `vehicle_route_id`, `schedule_id`, `start_from`, `end_to`, `day_off`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BUS - Counter 001 - Counter 002(NRB-MSA)', 1, 1, 1, 1, 2, '[\"0\"]', 1, '2024-05-05 22:36:27', '2024-05-05 22:36:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `password`, `address`, `status`, `ev`, `sv`, `ver_code`, `ver_code_send_at`, `tsc`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Customer', 'M', 'customer', 'customer@customer.com', 'KE', '254700100111', '$2y$10$vx1Rw57F9SraKy.YORwzseqZvTeHMTUkWuz86kXw2kGPsa8khSaDW', '{\"address\":\"30397\",\"state\":\"Kenya\",\"zip\":\"00100\",\"country\":\"Kenya\",\"city\":\"Nairobi\"}', 1, 1, 1, NULL, NULL, NULL, NULL, '2024-05-05 22:40:41', '2024-05-05 23:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Windows 10', '2024-05-05 22:40:41', '2024-05-05 22:40:41'),
(2, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Windows 10', '2024-05-05 23:22:02', '2024-05-05 23:22:02'),
(3, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Windows 10', '2024-05-07 11:11:39', '2024-05-07 11:11:39'),
(4, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Windows 10', '2024-05-07 11:14:07', '2024-05-07 11:14:07'),
(5, 1, '::1', NULL, NULL, NULL, NULL, NULL, 'Chrome', 'Windows 10', '2024-05-07 11:18:44', '2024-05-07 11:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nick_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleet_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `register_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chasis_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `nick_name`, `fleet_type_id`, `register_no`, `engine_no`, `chasis_no`, `model_no`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SCANIA', 1, 'KDM 001G', 'A83737M', 'A24323232L', 'SCANIA', 1, '2024-05-05 22:30:45', '2024-05-05 22:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_routes`
--

CREATE TABLE `vehicle_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_to` int(10) UNSIGNED DEFAULT 0,
  `stoppages` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_routes`
--

INSERT INTO `vehicle_routes` (`id`, `name`, `start_from`, `end_to`, `stoppages`, `distance`, `time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nairobi-Mombasa', 1, 2, '[\"1\",\"2\"]', '562km', '8hrs', 1, '2024-05-05 22:32:40', '2024-05-05 22:32:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assigned_vehicles`
--
ALTER TABLE `assigned_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booked_tickets`
--
ALTER TABLE `booked_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleet_types`
--
ALTER TABLE `fleet_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seat_layouts`
--
ALTER TABLE `seat_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
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
-- Indexes for table `ticket_prices`
--
ALTER TABLE `ticket_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_price_by_stoppages`
--
ALTER TABLE `ticket_price_by_stoppages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assigned_vehicles`
--
ALTER TABLE `assigned_vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booked_tickets`
--
ALTER TABLE `booked_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fleet_types`
--
ALTER TABLE `fleet_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seat_layouts`
--
ALTER TABLE `seat_layouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_prices`
--
ALTER TABLE `ticket_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_price_by_stoppages`
--
ALTER TABLE `ticket_price_by_stoppages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
