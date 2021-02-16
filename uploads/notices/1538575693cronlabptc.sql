-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2018 at 07:02 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cronlabptc`
--

-- --------------------------------------------------------

--
-- Table structure for table `adverts`
--

CREATE TABLE `adverts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ptc_id` int(10) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `charge` decimal(15,2) UNSIGNED NOT NULL,
  `net_amount` decimal(15,2) UNSIGNED NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `support_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fixed` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `percent` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `ex_percent` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `val1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `name`, `image`, `account`, `fixed`, `percent`, `ex_percent`, `val1`, `val2`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PayPal', 'uploads/gateways/PayPal.png', 'taznin19@icloud.com', '2.00', '2.50', '3.50', 'ASTPuRTCMIZii5CqgZ7-vx5MFH7Fit-C36cber3O-2A1ioDr2onThe5fnT5VPs6TppS2vsjUvISSlLwa', 'EIc0ScmIRJBDcPAkV8aJQcsPHinTvRhiFvl3ecd1Wo7mMaqfSqYxYHbKsU4c2_SfGJeHUc1RfUiHglQh', NULL, 1, '2018-02-14 05:55:52', '2018-02-14 05:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `inboxes`
--

CREATE TABLE `inboxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `invest_id` int(10) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `made_time` datetime DEFAULT NULL,
  `total_repeat` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interest_logs`
--

CREATE TABLE `interest_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `invest_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invests`
--

CREATE TABLE `invests` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `plan_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyc2s`
--

CREATE TABLE `kyc2s` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `front` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `back` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_limit` int(11) NOT NULL,
  `price` decimal(10,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `duration` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `name`, `details`, `ad_limit`, `price`, `duration`, `created_at`, `updated_at`) VALUES
(1, 'Free', 'This a free membership. Your Daily Earn up to 0.01$', 40, '0.0000', 10000, '2018-02-14 05:55:51', '2018-02-14 05:55:51'),
(2, 'Gold', 'This a Gold membership. Your Daily Earn up to 1.01$', 20, '20.0000', 12, '2018-02-14 05:55:51', '2018-02-14 05:55:51'),
(3, 'Diamond', 'This a Diamond membership. Your Daily Earn up to 2.01$', 30, '40.0000', 24, '2018-02-14 05:55:52', '2018-02-14 05:55:52'),
(4, 'Vip', 'This a Vip membership. Your Daily Earn up to 5.51$', 40, '50.6000', 30, '2018-02-14 05:55:52', '2018-02-14 05:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(375, '2014_10_12_000000_create_users_table', 1),
(376, '2014_10_12_100000_create_password_resets_table', 1),
(377, '2017_12_18_124540_create_posts_table', 1),
(378, '2017_12_18_125025_create_categories_table', 1),
(379, '2017_12_19_200820_create_tags_table', 1),
(380, '2017_12_19_201926_create_post_tag_table', 1),
(381, '2017_12_20_162035_create_profiles_table', 1),
(382, '2017_12_22_163903_create_settings_table', 1),
(383, '2017_12_23_125216_create_testimonials_table', 1),
(384, '2017_12_24_195423_create_memberships_table', 1),
(385, '2017_12_26_221210_create_ptcs_table', 1),
(386, '2017_12_27_113252_create_ppvs_table', 1),
(387, '2017_12_30_195057_create_gateways_table', 1),
(388, '2018_01_02_023228_create_deposits_table', 1),
(389, '2018_01_03_143034_create_withdraws_table', 1),
(390, '2018_01_06_193246_create_adverts_table', 1),
(391, '2018_01_06_220134_create_videos_table', 1),
(392, '2018_01_08_203835_create_oauth_identities_table', 1),
(393, '2018_01_10_040132_create_reflinks_table', 1),
(394, '2018_01_10_041048_create_referrals_table', 1),
(395, '2018_01_10_101234_create_pages_table', 1),
(396, '2018_01_10_200226_create_kycs_table', 1),
(397, '2018_01_10_204110_create_kyc2s_table', 1),
(398, '2018_01_12_180141_create_supports_table', 1),
(399, '2018_01_13_102411_create_faqs_table', 1),
(400, '2018_01_13_175523_create_discussions_table', 1),
(401, '2018_01_14_112850_create_plans_table', 1),
(402, '2018_01_14_125846_create_styles_table', 1),
(403, '2018_01_15_111027_create_user_logs_table', 1),
(404, '2018_01_16_221146_create_invests_table', 1),
(405, '2018_01_16_231341_create_interests_table', 1),
(406, '2018_01_18_043130_create_interest_logs_table', 1),
(407, '2018_01_18_200832_create_offlines_table', 1),
(408, '2018_01_20_061439_create_inboxes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_identities`
--

CREATE TABLE `oauth_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider_user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offlines`
--

CREATE TABLE `offlines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fixed` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `percent` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `ex_percent` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `val1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offlines`
--

INSERT INTO `offlines` (`id`, `name`, `image`, `account`, `fixed`, `percent`, `ex_percent`, `val1`, `val2`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PerfectMoney', 'uploads/gateways/PerfectMoney.png', 'U5220203', '1.00', '3.50', '4.50', 'reg4e54h1grt1j', NULL, NULL, 1, '2018-02-14 05:55:52', '2018-02-14 05:55:52'),
(2, 'Bank Transfer', 'uploads/gateways/BankTransfer.png', '2114554420203', '50.00', '1.50', '3.50', NULL, NULL, '<p>Our Bank Name:&nbsp;<b>BarClays</b></p><p>Account Holders Name: <b>Sherlock Holmes</b><br></p><p>Account Number:&nbsp;<b>5262 0216 3566 5746 </b></p><p>Sort Code:&nbsp;<b>66693861</b></p><p> SWIFT Code: <b>TD11 1XZ </b></p><p>IBAN&nbsp;Code:&nbsp;<b>3130752327</b></p>', 1, '2018-02-14 05:55:52', '2018-02-14 05:55:52'),
(3, 'bKash', 'uploads/gateways/bKash.png', '01744236585', '0.00', '2.00', '3.50', NULL, NULL, 'Please Send Money With Fee', 1, '2018-02-14 05:55:52', '2018-02-14 05:55:52'),
(4, 'Payza', 'uploads/gateways/Payza.png', 'cronlabin@gmail.com', '1.00', '1.50', '1.50', NULL, NULL, 'Please Send Money With Fee', 1, '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(5, 'BitCoin', 'uploads/gateways/BitCoin.png', '1F1tAaz5x1HUXrCNLbtMDqcw6o5GNn4xqX', '7.00', '2.50', '3.50', NULL, NULL, 'Please Send Money With Fee', 1, '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(6, 'BitCoin Cash', 'uploads/gateways/BitCoinCash.png', '35qL43qYwLdKtnR7yMfGNDvzv6WyZ8yT2n', '5.00', '0.50', '5.50', NULL, NULL, 'Please Send Money With Fee', 1, '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(7, 'Cash On Delivery', 'uploads/gateways/CashOnDelevery.png', 'Direct Deposit', '1.00', '0.00', '0.00', NULL, NULL, 'Come Our Office & Pay Money', 1, '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(8, 'Ethereum', 'uploads/gateways/Ethereum.png', '0x123f681646d4a755815f9cb19e1acc8565a0c2ac', '2.00', '10.00', '2.00', NULL, NULL, 'Please Send Money With Fee', 1, '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(9, 'Lite Coin', 'uploads/gateways/LiteCoin.png', '3CDJNfdWX8m2NwuGUV3nhXHXEeLygMXoAj', '3.00', '5.00', '10.00', NULL, NULL, 'Please Send Money With Fee', 1, '2018-02-14 05:55:53', '2018-02-14 05:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Anti Money Laundering Policy', '<p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Money laundering is defined as the process where the identity of the proceeds of crime are so disguised that it gives the appearance of legitimate income. Criminals specifically target financial services firms through which they attempt to launder criminal proceeds without the firm\'s knowledge or suspicions.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Within the UK alone it is estimated that L23 billion is laundered on an annual basis and on globally in revenue terms the amount of money laundered would make it the third largest industry.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">In response to the scale and effect of money laundering the United Kingdom, in common with many other countries, has passed legislation designed to prevent money laundering and to combat terrorism. This legislation, together with regulations, rules and industry guidance, forms the cornerstone of AML/CTF obligations for UK firms and outline the offences and penalties for failing to comply.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Whilst Bitstamp are currently unregulated and do not fall with the scope of the AML/CTF obligations in the UK the senior management have implemented systems and procedures that meet the UK AML legislation. This decision reflects the senior managements desire to prevent money laundering and not be used by criminals to launder proceeds of crime.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">UK AML LEGAL AND REGULATORY FRAMEWORK:</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The UK AML regime is set out in the following legislation and regulations:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The Proceeds of Crime Act 2002 (POCA), as amended by the:<ul style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style: none;\"><li style=\"padding: 0px; margin: 0px; list-style: none;\">i. Serious Organised Crime and Police Act 2005 (SOCPA); and the</li><li style=\"padding: 0px; margin: 0px; list-style: none;\">ii. Proceeds of Crime Act (Amendment) Regulations 2007;</li></ul></li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The Terrorism Act 2000, as amended by the:<ul style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style: none;\"><li style=\"padding: 0px; margin: 0px; list-style: none;\">i. The Anti Terrorism, Crime &amp; Security Act 2001; and the</li><li style=\"padding: 0px; margin: 0px; list-style: none;\">ii. Terrorism Act (Amendment) Regulations 2007;</li></ul></li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The Terrorism Act 2006;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The Money Laundering Regulations 2007; and</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The Joint Money Laundering Steering Group (JMLSG) Guidance for the UK Financial Sector on the prevention of money laundering/combating terrorist financing.</li></ul><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">ANTI-MONEY LAUNDERING (AML) POLICY:</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The Bitstamp AML Policy is designed to prevent money laundering by meeting the UK AML legislation obligations including the need to have adequate systems and controls in place to mitigate the risk of the firm being used to facilitate financial crime. This AML Policy sets out the minimum standards which must be complied with and includes:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The appointment of a Money Laundering Reporting Officer (MLRO) who has sufficient level of seniority and independence and who has responsibility for oversight of compliance with relevant legislation, regulations, rules and industry guidance;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Establishing and maintaining a Risk Based Approach (RBA) towards assessing and managing the money laundering and terrorist financing risks to the company;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Establishing and maintaining risk-based customer due diligence, identification, verification and know your customer (KYC) procedures, including enhanced due diligence for those customers presenting higher risk, such as Politically Exposed Persons (PEPs);</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Establishing and maintaining risk based systems and procedures to monitor on-going customer activity;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Procedures for reporting suspicious activity internally and to the relevant law enforcement authorities as appropriate;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The maintenance of appropriate records for the minimum prescribed periods;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Training and awareness for all relevant employees</li></ul><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">SANCTIONS POLICY:</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp is prohibited from transacting with individuals, companies and countries that are on prescribed Sanctions lists. Bitstamp will therefore screen against United Nations, European Union, UK Treasury and US Office of Foreign Assets Control (OFAC) sanctions lists in all jurisdictions in which we operate.</p>', 1, 'anti-money-laundering-policy', '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(2, 'Know Your Customer (KYC) Policy ', '<h3 style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(28, 28, 28); font-size: 24px; line-height: 1.461em; font-family: Raleway, sans-serif;\">Know Your Customer (KYC) procedures are a critical function to assess and monitor customer risk and a legal requirement to comply with Anti-Money Laundering (AML) Laws.</h3><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">Do you know your customer? You better, if you’re a financial institution (FI) or you face possible fines, sanctions and maybe even public ridicule if you do business with a money launderer or terrorist. More importantly, it’s a fundamental practice to protect your FI from fraud and losses due to illegal funds and transactions.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">“KYC” refers to the steps taken by a financial institution (or business) to:</p><ul style=\"list-style-position: inside; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin: 15px 0px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px;\"><li style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; -webkit-tap-highlight-color: transparent;\">Establish customer identity</li><li style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; -webkit-tap-highlight-color: transparent;\">Understand the nature of the customer’s activities (primary goal is to satisfy that the source of the customer’s funds is legitimate)</li><li style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; -webkit-tap-highlight-color: transparent;\">Assess money laundering risks associated with that customer for purposes of monitoring the customer’s activities</li></ul><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">To create and run an effective KYC program requires the following elements:</p><h2 style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: baseline; outline: 0px; font-family: Raleway; font-size: 30px; line-height: 1.4em; color: rgb(28, 28, 28);\">1) Customer Identification Program&nbsp;(CIP)</h2><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">How do you know someone is who they say they are? After all, identity theft is widespread, affecting over 13 million US consumers and accounting for 15 billion dollars stolen in 2015.&nbsp;If you’re a US financial institution, it’s more than a financial risk; it’s the Law.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">The&nbsp;<a href=\"https://www.trulioo.com/blog/ensure-cip-runs-smooth/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent;\">CIP</a>&nbsp;mandates that any individual conducting financial transactions needs to have their identity verified. As a provision in the Patriot Act, it’s designed to limit money laundering, terrorism funding, corruption and other illegal activities. The desired outcome is that financial institutions accurately identify their customers:</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">A critical element to a successful CIP is a risk assessment, both on the institutional level and on procedures for each account. While the CIP provides guidance, it’s up to the individual institution to determine the exact level of risk and policy for that risk level.</p><h2 style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: baseline; outline: 0px; font-family: Raleway; font-size: 30px; line-height: 1.4em; color: rgb(28, 28, 28);\">2) Customer Due Diligence</h2><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">For any financial institution,&nbsp;one of the first analysis made is to determine if you can trust a potential client. You need to make sure any potential customer&nbsp;is worthy; customer due diligence (CDD) is a critical element of effectively managing your risks and protecting yourself against criminals, terrorists, and corrupt Politically Exposed Persons (PEPs).</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">There are three levels of due diligence:</p><ul style=\"list-style-position: inside; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin: 15px 0px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px;\"><li style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; -webkit-tap-highlight-color: transparent;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\">Simplified Due Diligence</strong>&nbsp;(“SDD”) are situations where the risk for money laundering or terrorist funding is low and a full CDD is not necessary. For example, low value accounts or accounts where checks are being on other levels</li></ul><ul style=\"list-style-position: inside; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin: 15px 0px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px;\"><li style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; -webkit-tap-highlight-color: transparent;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\">Basic Customer Due Diligence&nbsp;</strong>(“CDD”) is information obtained for all customers to verify the identity of a customer and asses the risks associated with that customer.</li></ul><ul style=\"list-style-position: inside; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin: 15px 0px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px;\"><li style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; -webkit-tap-highlight-color: transparent;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\">Enhanced Due Diligence&nbsp;</strong>(“EDD”) is additional information collected for higher-risk customers to provide a deeper understanding of customer activity to mitigate associated risks. In the end, while some EDD factors are specifically enshrined in a countries legislations, it’s up to a financial institution to determine their risk and take measures to ensure that they are not dealing with bad customers.</li></ul><h2 style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: baseline; outline: 0px; font-family: Raleway; font-size: 30px; line-height: 1.4em; color: rgb(28, 28, 28);\">3) Ongoing Monitoring</h2><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">It’s not enough to just check your customer once, you need to have a program that knows your customer on an ongoing basis. The ongoing monitoring function includes oversight of financial transactions and accounts based on thresholds developed as part of a customer’s risk profile.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">Up to now, regulations call for a risk-based assessment. However, as of January 1, 2017 The New York Department of Financial Services (NYDFS) requires specific measures of&nbsp;<a href=\"https://www.trulioo.com/blog/aml-transaction-monitoring-filtering/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent;\">transaction monitoring and filtering</a>.</p><h2 style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: baseline; outline: 0px; font-family: Raleway; font-size: 30px; line-height: 1.4em; color: rgb(28, 28, 28);\">KYC News Around the World</h2><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><a href=\"https://www.pymnts.com/data-drivers/2017/kyc-know-your-onboarding-and-compliance-costs/\" target=\"_blank\" rel=\"noopener\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent;\">KYC: Knowing Your (Onboarding) Costs<strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"></strong></a></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">$60 million. $300 million. One month, four months? Welcome to the well-meaning but truly inefficient world of onboarding and KYC — where financial services firms are mired in manual processes and where wait times are forever, and expensive.</p><p class=\"left fullWidth\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"https://www.finextra.com/blogposting/14463/the-unquenched-longing-for-a-transformed-kyc-and-aml-solution\" target=\"_blank\" rel=\"noopener\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">The unquenched longing for a transformed KYC and AML solution</a></strong></p><p class=\"left fullWidth\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">In spite of heavy investments, FIs have been unable to optimally counter the growing peril of money laundering. Regulatory fines on FIs for KYC/AML related violations continue to rise.</p><p class=\"heading1\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"http://timesofindia.indiatimes.com/india/push-for-aadhaar-enabled-e-kyc-for-digital-transactions/articleshow/60240251.cms\" target=\"_blank\" rel=\"noopener\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">Push for Aadhaar-enabled e-KYC for digital transactions</a></strong></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">Aadhaar-enabled electronic know your customer (KYC) process should be “firmly established” as the acceptable&nbsp;KYC, a panel with representatives from all financial sector regulators has proposed.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"http://www.insurancebusinessmag.com/us/news/breaking-news/us-insurers-lagging-behind-in-fight-against-financial-crimes-75949.aspx\" target=\"_blank\" rel=\"noopener\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">US insurers ‘lagging behind’ in fight against financial crimes</a></strong></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">Money laundering is an ever expanding problem for the American insurance industry. An increasing number of individuals are using insurance accounts to hide money from federal taxation agencies – and the industry needs to step up and tackle the situation head-on.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"https://www.finextra.com/newsarticle/30332/mas-to-roll-out-national-kyc-utility-for-singapore\" target=\"_blank\" rel=\"noopener\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">MAS to roll out national KYC utility for Singapore</a></strong></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">The Monetary Authority of Singapore (MAS) is piloting a national know-your-customer (KYC) utility for financial services, based on the MyInfo digital identity service, jointly developed by the Ministry of Finance and GovTech, the lead agency for digital and data strategy in Singapore.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"https://www.finextra.com/newsarticle/30734/4th-eu-aml-directive-will-make-curbing-crime-easier-but-cost-banks-millions\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">Average UK bank wastes £5 million a year on manual and inefficient KYYC processes</a></strong></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">“The message to all financial institutions is clear: The cost of KYC checks is much too high, placing too much reliance on inefficient and error-prone manual processes,” says Steve Pannifer, COO, Consult Hyperion.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"https://www.euromoney.com/article/b13fz25ztyw3ds/kyc-obstacles-hamper-mifid-ii-preparations\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">KYC obstacles hamper Mifid II preparations in Europe</a></strong></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">Alan Samuels, vice-president and head of product strategy for reference data services at Alacra, said: “<em style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\">There is a clear regulatory need for meeting high standards. This is creating more and more challenges for operational managers to build flexible, scalable processes and systems to be able to address use cases that have not yet even been articulated</em>.”</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"https://www.rbi.org.in/scripts/FAQView.aspx?Id=82\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">India KYC updates</a></strong></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">The Government of India has notified six documents as ‘Officially Valid Documents’ (OVDs) for the purpose of producing proof of identity. These six documents are Passport, Driving Licence, Voters’ Identity Card, PAN Card, Aadhaar Card issued by UIDAI and NREGA Job Card.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"http://www.philstar.com/headlines/2016/03/17/1563955/amla-know-your-customer-rules-review\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">Philippines KYC under review</a></strong></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">Under Republic Act 9160 or the Anti-Money Laundering Act (AMLA), banks and other financial institutions, including remittance centers and pawnshops, are mandated to institute “know your customer” (KYC) rules that ensure the legitimate source of funds.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"https://complispace.wordpress.com/2016/09/28/here-we-go-again-austrac-updates-kyc-requirements/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">Revisions in Australia</a></strong></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">AUSTRAC has revised Chapter 4 of the AML/CTF Rules in a few small but significant ways. These changes came into effect on 16 September 2016.</p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\"><strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\"><a href=\"https://globalcompliancenews.com/electronic-know-your-customer-e-kyc-anti-money-laundering-in-digital-era-20160915/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(27, 165, 234); border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; transition: color 0.15s ease-out; -webkit-tap-highlight-color: transparent; font-weight: 500;\">e-KYC in Thailand</a></strong></p><p style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px; margin-top: 10px; padding: 0px; vertical-align: baseline; outline: 0px; color: rgb(68, 68, 68); font-family: Raleway; font-size: 16px; line-height: 28px;\">The Bank of Thailand (”&nbsp;<strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\">BOT&nbsp;</strong>“) has introduced a new regulation to facilitate the Know-Your-Customer (KYC) process by using an electronic means (”&nbsp;<strong style=\"background: 0px 0px; border: 0px; margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px;\">e-KYC&nbsp;</strong>“) for account opening for deposit acceptance or fund acceptance from public.</p>', 1, 'know-your-customer-kyc-policy', '2018-02-14 05:55:53', '2018-02-14 05:55:53');
INSERT INTO `pages` (`id`, `title`, `content`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(3, 'Terms and Conditions', '<h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">ACCEPTANCE OF TERMS OF USE</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">By using this website (“Site”), registering for a Bitstamp Account (“Account”), or using any of our other Bitstamp Services, you (\"you, your, or yourself\") are agreeing to accept and comply with the terms and conditions of use stated below (\"Terms of Use\"). You should read the entire Terms of Use carefully before you use this Site or any of the Bitstamp Services.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">As used in this Terms of Use, “Bitstamp\" refers to the company Bitstamp Limited with registered address at 5 New Street Square, EC4A 3TW London, United Kingdom, including, without limitation, its owners, directors, investors, employees or other related parties. Depending upon the context, \"Bitstamp\" may also refer to the services, products, website, content or other materials (collectively, \"Bitstamp Services\") provided by Bitstamp.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The Service operated by Bitstamp allows buyers (\"Buyers\") and sellers (\"Sellers\"), to buy and sell the Internet currency known as \"Bitcoins\" (see http://bitcoin.org).</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The Service operated by Bitstamp also allows all registered users of the Service (\"Members\") to:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Transfer Bitcoins to other Members or other users of Bitcoin outside the Bitstamp site.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Use Bitcoins for purchasing goods.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Buy the Internet currency known as XRP.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Access and use the Ripple system.</li></ul><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Depending on your country of residence, you may not be able to use all the functions of the Site. It is your responsibility to follow those rules and laws in your country of residence and/or country from which you access this Site and Services. As long as you agree to and comply with these Terms of Use, Bitstamp grants to you a personal, non-exclusive, non-transferable, non-sublicensable and limited right to enter and use the Site and the Service.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">IF YOU DO NOT ACCEPT THE TERMS OF USE AND CONDITIONS OUTLINED IN THIS AGREEMENT, DO NOT ACCESS THIS SITE AND DO NOT USE THIS SERVICE.</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">By opening an Account, you expressly represent and warrant:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">1. You have accepted these Terms; and</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">2. You are at least 18 years of age and have the full capacity to accept these Terms and enter into a transaction involving Bitcoins.</li></ul><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">RISKS</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The trading of goods and products, real or virtual, as well as virtual currencies involves significant risk. Prices can and do fluctuate on any given day. Due to such price fluctuations, you may increase or lose value in your assets at any given moment. Any currency - virtual or not - may be subject to large swings in value and may even become worthless. There is an inherent risk that losses will occur as a result of buying, selling or trading anything on a market.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitcoin trading also has special risks not generally shared with official currencies or goods or commodities in a market. Unlike most currencies, which are backed by governments or other legal entities, or by commodities such as gold or silver, Bitcoin is a unique kind of \"fiat\" currency, backed by technology and trust. There is no central bank that can take corrective measure to protect the value of Bitcoins in a crisis or issue more currency.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Instead, Bitcoin is an as-yet autonomous and largely unregulated worldwide system of currency firms and individuals. Traders put their trust in a digital, decentralised and partially anonymous system that relies on peer-to-peer networking and cryptography to maintain its integrity.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitcoin trading is probably susceptible to irrational (or rational) bubbles or loss of confidence, which could collapse demand relative to supply. For example, confidence might collapse in Bitcoin because of unexpected changes imposed by the software developers or others, a government crackdown, the creation of superior competing alternative currencies, or a deflationary or inflationary spiral. Confidence might also collapse because of technical problems: if the anonymity of the system is compromised, if money is lost or stolen, or if hackers or governments are able to prevent any transactions from settling.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">There may be additional risks that we have not foreseen or identified in our Terms of Use.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">You should carefully assess whether your financial situation and tolerance for risk is suitable for buying, selling or trading Bitcoins.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We use our banking providers in order to receive client moneys and making payments. Our banking providers DO NOT transfer Bitcoins, exchange Bitcoins, or provide any services in connection with Bitcoins.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">LIMITED RIGHT OF USE</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Unless otherwise specified, all Materials on this Site are the property of Bitstamp and are protected by copyright, trademark and other applicable laws. You may view, print and/or download a copy of the Materials from this Site on any single computer solely for your personal, informational, non-commercial use, provided you keep intact all copyright and other proprietary notices.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The trademarks, service marks and logos of Bitstamp and others used in this Site (\"Trademarks\") are the property of Bitstamp and their respective owners. The software, text, images, graphics, data, prices, trades, charts, graphs, video and audio used on this Site belong to Bitstamp. The Trademarks and Material should not be copied, reproduced, modified, republished, uploaded, posted, transmitted, scraped, collected or distributed in any form or by any means, whether manual or automated. The use of any such Materials on any other Site or networked computer environment for any other purpose is strictly prohibited; any such unauthorised use may violate copyright, trademark and other applicable laws and could result in criminal or civil penalties.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">MAINTAINING YOUR ACCOUNT: OUR RULES</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">This Site is for your personal and non-commercial use only. We are vigilant in maintaining the security of our Site and the Service. By registering with us, you agree to provide Bitstamp with current, accurate, and complete information about yourself as prompted by the registration process, and to keep such information updated. You further agree that you will not use any Account other than your own, or access the Account of any other Member at any time, or assist others in obtaining unauthorised access.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The creation or use of Accounts without obtaining the prior express permission from Bitstamp will result in the immediate suspension of all said Accounts, as well as all pending purchase/sale offers. Any attempt to do so or to assist others (Members or otherwise), or the distribution of instructions, software or tools for that purpose, will result in the Accounts of such Members being terminated. Termination is not the exclusive remedy for such a violation, and Bitstamp may elect to take further action against you.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">You also are responsible for maintaining the confidentiality of your Account information, including your password, safeguarding your own Bitcoin, and for all activity including Transactions that are posted to your Account. If there is suspicious activity related to your Account, we may, but are not obligated, to request additional information from you, including authenticating documents, and to freeze any transactions pending our review. You are obligated to comply with these security requests, or accept termination of your Account. You are required to notify Bitstamp immediately of any unauthorised use of your Account or password, or any other breach of security by email addressed to&nbsp;<a href=\"mailto:support@bitstamp.net\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">support@bitstamp.net</a>. Any Member who violates these rules may be terminated, and thereafter held liable for losses incurred by Bitstamp or any user of the Site.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp similarly reserves the right to freeze Ripple accounts in accordance with the new policy announced by Ripple Labs set to take effect September 15, 2014. As explained by Ripple Labs:</p><p style=\"padding: 0px 0px 15px 3em; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The freeze protocol extension gives gateways the ability to 1) globally freeze all their issued funds, or 2) freeze funds issued to a particular user. Frozen funds may only be sent back to the gateway who issued them. The global freeze feature allows a gateway to freeze all balances issued by it. The gateway may still issue payments. Accounts holding frozen balances may return the funds to the gateway. This feature is useful for migrating users from one account to another and to safeguard users in the event of a compromise of the gateway account. The individual freeze is intended primarily for complying with regulatory requirements which may vary from one jurisdiction to another. It also allows gateways to freeze individual accounts issuances in order to investigate suspicious activity. These features allow gateways to better operate in compliance of laws and regulations.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Finally, you agree that you will not use the Service to perform criminal activity of any sort, including but not limited to, money laundering, illegal gambling operations, terrorist financing, or malicious hacking.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The minimum allowable trade is $5.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">TERMINATION AND ESCROW OF UNVERIFIED ACCOUNTS</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">You may terminate this agreement with Bitstamp, and close your Account at any time, following settlement of any pending transactions.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">You also agree that Bitstamp may, by giving notice, in its sole discretion terminate your access to the Site and to your Account, including without limitation, our right to: limit, suspend or terminate the service and Members\' Accounts, prohibit access to the Site and its content, services and tools, delay or remove hosted content, and take technical and legal steps to keep Members off the Site if we think that they are creating problems or possible legal liabilities, infringing the intellectual property rights of third parties, or acting inconsistently with the letter or spirit of these Terms. Additionally, we may, in appropriate circumstances and at our discretion, suspend or terminate Accounts of Members for any reason, including without limitation: (1) attempts to gain unauthorised access to the Site or another Member\'s account or providing assistance to others\' attempting to do so, (2) overcoming software security features limiting use of or protecting any content, (3) usage of the Service to perform illegal activities such as money laundering, illegal gambling operations, financing terrorism, or other criminal activities, (4) violations of these Terms of Use, (5) failure to pay or fraudulent payment for Transactions, (6) unexpected operational difficulties, or (7) upon the request of law enforcement or other government agencies, if deemed to be legitimate and compelling by Bitstamp, acting in its sole discretion.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We expressly reserve the right to cancel and/or terminate Accounts that have not been verified by the Client despite our good faith efforts to contact you seeking such verification (“Unverified Accounts”). All Unverified Accounts which have been inactive for a period of 6 months or more are further subject to transfer to a third-party escrow (the \"Unverified Escrow”), and will no longer be maintained or be the legal responsibility of Bitstamp Ltd. The administrator/trustee of the Unverified Escrow shall make any and all additional reasonable efforts required by law to determine and contact each Unverified Account owner and, after suitable effort and time, will donate any residual Bitcoin or cash in these unclaimed Unverified Accounts to a nonprofit group or groups involved in the Bitcoin ecosystem.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The suspension of an Account shall not affect the payment of the commissions due for past Transactions. Upon termination, Members shall communicate a valid bank account to allow for the transfer of any currencies credited to their account. Said bank account shall be held by the Member. Bitcoins may be transferred to a valid bank account only after conversion into a currency. Bitstamp shall transfer the currencies as soon as possible following the Member\'s request in the time frames specified by Bitstamp.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp will send to you the credit balance of your Account, however in circumstances a number of intermediaries may be involved in an international payment and these or the beneficiary bank may deduct charges. We will use reasonable efforts to ensure that such charges are disclosed to you prior to sending your payment, however where they cannot be avoided, you acknowledge that these charges cannot always be calculated in advance, and that you agree to be responsible for such charges.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Upon Account closing, any amount less than $5 in value will not be returned.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">AVAILABILITY OF SERVICES</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">All services are provided without warranty of any kind, either express or implied. We do not represent that this Site will be available 100% of the time to meet your needs. We will strive to provide you with the Service as soon as possible but there are no guarantees that access will not be interrupted, or that there will be no delays, failures, errors, omissions or loss of transmitted information.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We will use reasonable endeavours to ensure that the Site can normally be accessed by you in accordance with these Terms of Use. We may suspend use of the Site for maintenance and will make reasonable efforts to give you notice. You acknowledge that this may not be possible in an emergency.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">APIS AND WIDGETS</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We may provide access to certain parties to access specific data and information through our API (Application Programming Interface) or through widgets. We also may provide widgets for your use to put our data on your Site. You are free to use these in their original unmodified and un-altered state.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">EXTERNAL WEBSITES</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp makes no representations whatsoever about any outside or third party website which you may access through the Site. Occasionally, the Bitstamp website may provide references or links to other websites (\"External Websites\"). We do not control these External Websites third party sites or any of the content contained therein. You agree that we are in no way responsible or liable for External Websites referenced or linked from the Bitstamp website, including, but not limited to, website content, policies, failures, promotions, products, opinions, advice, statements, prices, activities and advertisements, services or actions and/or any damages, losses, failures or problems caused by, related to, or arising from those sites. You shall bear all risks associated with the use of such content.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">External Websites have separate and independent terms of use and related policies. We request that you review the policies, rules, terms, and regulations of each site that you visit. It is up to you to take precautions to ensure that whatever you select for your use is free of such items as viruses, worms, Trojan horses and other items of a destructive nature.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">FINANCIAL ADVICE</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">For the avoidance of doubt we do not provide any investment advice in connection with the Services contemplated by these Terms of Use. We may provide information on the price, range, volatility of Bitcoins and events that have affected the price of Bitcoins but this is not considered investment advice and should not be construed as such. Any decision to purchase or sell Bitcoins is your decision and we will not be liable for any loss suffered.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">FINANCIAL REGULATION</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Our business model, and our Service, consists of facilitating the buying, selling and trading of Bitcoins and their use to purchase goods in an unregulated, international open payment system. The Services we provide are currently unregulated within the UK.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">EMAIL</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Email messages sent over the Internet are not secure and Bitstamp is not responsible for any damages incurred by the result of sending email messages over the Internet. We suggest sending email in encrypted formats; you are welcome to send PGP encrypted emails to us. The instructions and keys to do so are available upon request.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">DISCLOSURES TO LEGAL AUTHORITIES AND AUTHORIZED FINANCIAL INSTITUTIONS</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We may share your Personal Information with law enforcement, data protection authorities, government officials, and other authorities when:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Required by law;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Compelled by subpoena, court order, or other legal procedure;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">We believe that the disclosure is necessary to prevent physical harm or financial loss;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Disclosure is necessary to report suspected illegal activity; or</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Disclosure is necessary to investigate violations of our Terms of Use or&nbsp;<a href=\"https://www.bitstamp.net/privacy-policy/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Privacy Policy</a>.</li></ul><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">With respect to US residents, we also may share your information with other financial institutions as authorized under Section 314(b) of the US Patriot Act, and with tax authorities, including the US Internal Revenue Service, pursuant to the Foreign Account Tax Compliance Act (\"FATCA\"), to the extent that this statute may be determined to apply to Bitstamp Ltd. \"Personal Information\" refers to information that identifies an individual, such as name, address, e-mail address, trading information, and banking details. “Personal Information” does not include anonymised and/or aggregated data that does not identify a specific user.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">INTERNATIONAL TRANSFERS OF PERSONAL INFORMATION</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We store and process your Personal Information in data centres around the world, wherever Bitstamp facilities or service providers are located. As such, we may transfer your Personal Information outside of the European Economic Area (“EEA”). Such transfers are undertaken in accordance with our legal and regulatory obligations.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">JURISDICTION</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The Terms of Use shall be governed and construed in accordance with English Law. The parties agree to irrevocably submit to the exclusive jurisdiction of the English Courts.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">LIMITATION OF LIABILITY</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">To the extent permitted by law, Bitstamp will not be held liable for any damages, loss of profit, loss of revenue, loss of business, loss of opportunity, loss of data, indirect or consequential loss unless the loss suffered arising from negligence or wilful deceit or fraud. Nothing in these terms excludes or limits the liability of either party for fraud, death or personal injury caused by its negligence, breach of terms implied by operation of law, or any other liability which may not by law be limited or excluded.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Subject to the foregoing, Bitstamp\'s aggregate liability in respect of claims based on events arising out of or in connection with any single Member\'s use of the Site and/or Service, whether in contract or tort (including negligence) or otherwise, shall in no circumstances exceed the greater of either (a) the total amount held on Account for the Member making a claim less any amount of Commission that may be due and payable in respect of such Account; or (b) 125% of the amount of the Transaction(s) that are the subject of the claim less any amount of Commission that may be due and payable in respect of such Transaction(s).</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">INDEMNITY</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">To the full extent permitted by applicable law, you hereby agree to indemnify Bitstamp, and its partners against any action, liability, cost, claim, loss, damage, proceeding or expense suffered or incurred if direct or not directly arising from your use of Bitstamp\'s Sites, your use of the Service, or from your violation of these Terms of Use.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">MISCELLANEOUS</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">If we are unable to perform the Services outlined in the Terms of Use due to factors beyond our control including but not limited to an event of Force Majeure, change of law or change in sanctions policy we will not have any liability to you with respect to the Services provided under this agreement and for a time period coincident with the event.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">MODIFICATION OF TERMS</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp reserves the right to change, add or remove portions of these Terms, at any time, in an exercise of its sole discretion. You will be notified of any changes in advance through your Account. Upon such notification, it is your responsibility to review the amended Terms. Your continued use of the Site following the posting of a notice of changes to the Terms signifies that you accept and agree to the changes, and that all subsequent transactions by you will be subject to the amended Terms.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">DEFINITIONS</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Account. The contractual arrangement wherein a Bitstamp Member has accepted our Terms of Use and&nbsp;<a href=\"https://www.bitstamp.net/privacy-policy/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Privacy Policy</a>, and received approval to use the Bitstamp Services, including the purchase and sale of Bitcoins and to perform associated Transactions.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitcoins. The Peer-to-Peer internet currency further described at http://bitcoin.org.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Buyer(s). Member(s) that are submitting an offer to buy Bitcoins through the Service.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Commission. Refers to the fee which is payable to Bitstamp on each Transaction, such as a Bitcoin Purchase Transaction.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Member(s). Refers to Buyers and Sellers as well as any holder of an Account.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Personal Information. Information that identifies an individual, such as name, address, e-mail address, trading information, and banking details. “Personal Information” does not include anonymised and/or aggregated data that does not identify a specific user.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Price. The \"price per coin\" for which Members are willing to purchase or sell Bitcoins, using the Service in a Bitcoin Purchase Transaction. The Price may be expressed in any of the currencies deposited by Members in their Account and supported by the Service. See our Site for a full list of currencies.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Seller(s). Member(s) that are submitting an offer to sell Bitcoins through the Service.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Service(s). The technological platform, functional rules and market managed by Bitstamp Ltd. to permit Sellers and Buyers to perform purchase and sale transactions of Bitcoins.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Transaction. Includes the following:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The agreement between the Buyer and the Seller to exchange Bitcoins through the Service for currencies at a commonly agreed rate (\"Bitcoin Purchase Transaction\");</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The conversion of currencies into Bitcoins deposited by Members on their Account (\"Conversion Transaction\");</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The transfer of Bitcoins among Members (\"Bitcoin Transfer Transaction\");</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The transfer of currencies among Members (\"Currency Transfer Transaction\"); and</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The purchase of ancillary products (\"Purchase Transactions\").</li></ul><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp may not offer all of these types of transactions at this time or in all places.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Transaction Price. The total price paid by the Buyer in respect of each Transaction performed through the Service.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">CONTACT US</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">If you have any questions relating to these Terms of Use, your rights and obligations arising from these Terms and/or your use of the Site and the Service, your Account, or any other matter, please contact&nbsp;</p>', 1, 'terms-and-conditions', '2018-02-14 05:55:53', '2018-02-14 05:55:53');
INSERT INTO `pages` (`id`, `title`, `content`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(4, 'Privacy Policy', '<h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">GENERAL</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">This Privacy Policy, together with our&nbsp;<a href=\"https://www.bitstamp.net/terms-of-use/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Terms of Use</a>, governs Bitstamp’s collection, processing and use of your Personal Information. As used in this Privacy Policy, \"Bitstamp\" refers to the company Bitstamp Limited, including, without limitation, its owners, directors, investors, employees or other related parties. Depending upon the context, \"Bitstamp\" may also refer to the services, products, website, content or other materials (collectively, \"Bitstamp Services\") provided by Bitstamp.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">\"Personal Information\" refers to information that identifies an individual, such as name, address, e-mail address, trading information, and banking details. “Personal Information” does not include anonymised and/or aggregated data that does not identify a specific user.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp and its affiliates (hereinafter, \"Bitstamp\", \"we\", \"us\" or \"our\") are committed to protecting and respecting your privacy. The purpose of this Privacy Policy is to describe:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The types of Personal Information we collect and how it may be used;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Our use of cookies and similar technology;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">How and why we may disclose your Personal Information to third parties;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The transfer of your Personal Information within and outside of the European Economic Area (“EEA”);</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Your right to access, correct, update, and delete your Personal Information;</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The security measures we use to protect and prevent the loss, misuse, or alteration of Personal Information; and</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Bitstamp’s retention of your Personal Information.</li></ul><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">COLLECTION AND USE OF PERSONAL INFORMATION</h2><h3 style=\"padding: 0px; margin-top: 0px; margin-right: 0px; margin-left: 0px; font-weight: bold; color: rgb(142, 201, 25); font-size: 1.2em; text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">A.	PERSONAL INFORMATION WE COLLECT</h3><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We collect the Personal Information you provide directly to us when you open a Bitstamp Account, perform any transactions on the Bitstamp Platform, or use other Bitstamp Services. This may include:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Contact information, such as name, home address, and email address.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Account information, such as username and password.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Financial information, such as bank account numbers, bank statement, and trading information.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Identity verification information, such as images of your government issued ID, passport, national ID card, or driving license. Note: US residents may be asked to provide their social security numbers.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Residence verification information, such as Utility bill details or similar information.</li></ul><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We also automatically collect certain computer, device, and browsing information when you access the Bitstamp website or use Bitstamp Services. This information is aggregated to provide statistical data about our users\' browsing actions and patterns, and does not personally identify individuals. This information may include:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Computer or mobile device information, including IP address, operating system, browser type.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Website usage information.</li></ul><h3 style=\"padding: 0px; margin-top: 0px; margin-right: 0px; margin-left: 0px; font-weight: bold; color: rgb(142, 201, 25); font-size: 1.2em; text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">B.	USE OF COOKIES AND SIMILAR TECHNOLOGY</h3><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">The Bitstamp site is using cookies. Cookies are small text files that are placed on your computer by websites that you visit. They are widely used in order to make websites work, or work more efficiently, as well as to provide information to the owners of the site.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Cookies are typically stored on your computer\'s hard drive. Information collected from cookies is used by us to evaluate the effectiveness of our Site, analyze trends, and administer the Platform. The information collected from cookies allows us to determine such things as which parts of our Site are most visited and difficulties our visitors may experience in accessing our Site. With this knowledge, we can improve the quality of your experience on the Platform by recognizing and delivering more of the most desired features and information, as well as by resolving access difficulties. We also use cookies and/or a technology known as web bugs or clear gifs, which are typically stored in emails to help us confirm your receipt of, and response to, our emails and to provide you with a more personalized experience when using our Site.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We use third party service provider(s), to assist us in better understanding the use of our Site. Our service provider(s) will place cookies on the hard drive of your computer and will receive information that we select that will educate us on such things as how visitors navigate around our site, what products are browsed, and general Transaction information. Our service provider(s) analyses this information and provides us with aggregate reports. The information and analysis provided by our service provider(s) will be used to assist us in better understanding our visitors\' interests in our Site and how to better serve those interests. The information collected by our service provider(s) may be linked to and combined with information that we collect about you while you are using the Platform. Our service provider(s) is/are contractually restricted from using information they receive from our Site other than to assist us.</p><h3 style=\"padding: 0px; margin-top: 0px; margin-right: 0px; margin-left: 0px; font-weight: bold; color: rgb(142, 201, 25); font-size: 1.2em; text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">C.	HOW WE USE YOUR PERSONAL INFORMATION</h3><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We may use your Personal Information to:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Process your Bitstamp transactions. We will process your Personal Information only for the purpose(s) for which it has been provided to us.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Verify your identity in accordance with the Money Laundering Regulations 2007 and the&nbsp;<a href=\"https://www.bitstamp.net/aml-policy/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Bitstamp Anti Money Laundering policy</a>, as well as address other law enforcement needs as more fully described in our&nbsp;<a href=\"https://www.bitstamp.net/terms-of-use/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Terms of Use</a>. With respect to US residents, we also may share your information with other financial institutions as authorized under Section 314(b) of the US Patriot Act, and with tax authorities, including the US Internal Revenue Service, pursuant to the Foreign Account Tax Compliance Act (\"FATCA\"), to the extent that this statute may be determined to apply to Bitstamp Ltd.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Personalise your Bitstamp Services experience.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Analyse Bitstamp website usage, and improve our website and website offerings.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Help us respond to your customer service requests and support needs.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Contact you about Bitstamp Services. The email address you provide may be used to communicate information and updates related to your use of the Bitstamp Services. We may also occasionally communicate company news, updates, promotions, and related information relating to similar products and services provided by Bitstamp.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Administer a contest, promotion, survey or other site features as will be more explained on the website.</li></ul><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We do not perform behavioral tracking of a customer\'s activities on our Website or across different Websites, nor do we allow third-party data collection through our Service.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">If you wish to stop receiving marketing communications from us, please contact us at&nbsp;<a href=\"mailto:support@bitstamp.net\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">support@bitstamp.net</a>to opt-out.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">DISCLOSING AND TRANSFERRING PERSONAL INFORMATION</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We may disclose your Personal Information to third parties and legal and regulatory authorities, and transfer your Personal Information outside the EEA, as described below.</p><h3 style=\"padding: 0px; margin-top: 0px; margin-right: 0px; margin-left: 0px; font-weight: bold; color: rgb(142, 201, 25); font-size: 1.2em; text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">A.	DISCLOSURES TO THIRD PARTIES</h3><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">In processing your transactions, we may share some of your Personal Information with third party service providers who help with our business operations. Your information will not be sold, exchanged, or shared with any third parties without your consent, except to provide Bitstamp Services or as required by law. By using our Services and accepting our&nbsp;<a href=\"https://www.bitstamp.net/terms-of-use/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Terms of Use</a>, you consent to the disclosure of your Personal Information as described in this Privacy Policy.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Non-personally identifiable visitor information may be provided to third parties for marketing, advertising, or other uses.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp’s third party service providers are contractually bound to protect and use such information only for the purposes for which it was disclosed, except as otherwise required or permitted by law. We ensure that such third parties will be bound by terms no less protective those described in this Privacy Policy, or those we are subject to under applicable data protection laws.</p><h3 style=\"padding: 0px; margin-top: 0px; margin-right: 0px; margin-left: 0px; font-weight: bold; color: rgb(142, 201, 25); font-size: 1.2em; text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">B.	DISCLOSURES TO LEGAL AUTHORITIES</h3><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We may share your Personal Information with law enforcement, data protection authorities, government officials, and other authorities when:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Compelled by subpoena, court order, or other legal procedure.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">We believe that the disclosure is necessary to prevent physical harm or financial loss.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Disclosure is necessary to report suspected illegal activity.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Disclosure is necessary to investigate violations of this Privacy Policy or our&nbsp;<a href=\"https://www.bitstamp.net/terms-of-use/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Terms of Use</a>.</li></ul><h3 style=\"padding: 0px; margin-top: 0px; margin-right: 0px; margin-left: 0px; font-weight: bold; color: rgb(142, 201, 25); font-size: 1.2em; text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">C.	INTERNATIONAL TRANSFERS OF PERSONAL INFORMATION</h3><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We store and process your Personal Information in data centres around the world, wherever Bitstamp facilities or service providers are located. As such, we may transfer your Personal Information outside of the EEA. Such transfers are undertaken in accordance with our legal and regulatory obligations.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">EXTERNAL WEBSITES</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Occasionally, the Bitstamp website may provide references or links to other websites (\"External Websites\"). We do not control these External Websites third party sites or any of the content contained therein. You agree that we are in no way responsible or liable for External Websites referenced or linked from the Bitstamp website, including, but not limited to, website content, policies, failures, promotions, products, services or actions and/or any damages, losses, failures or problems caused by, related to, or arising from those sites.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">External Websites have separate and independent privacy policies. We encourage you to review the policies, rules, terms, and regulations of each site that you visit. We seek to protect the integrity of our site and welcome any feedback about External Website information provided on the Bitstamp website.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">ACCESS RIGHTS TO PERSONAL INFORMATION</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">You have the right to access your Personal Information to correct, update, and block inaccurate and/or incorrect data. To exercise this right, contact us at&nbsp;<a href=\"mailto:support@bitstamp.net\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">support@bitstamp.net</a>.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp will respond to your request only where this is not inconsistent with our&nbsp;<a href=\"https://www.bitstamp.net/terms-of-use/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Terms of Use</a>&nbsp;and other legal and regulatory obligations. Within 40 days of receipt of your written request and payment of a £10 fee, we will provide you with your Personal Information, including the purposes for which it was used and to whom it was disclosed to in accordance with your Subject Access Request rights under the Data Protection Act 1998.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">SECURITY OF PERSONAL INFORMATION</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We use a variety of security measures to ensure the confidentiality of your Personal Information, and to protect your Personal Information from loss, theft, unauthorised access, misuse, alteration or destruction. These security measures include, but are not limited to:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Password protected directories and databases.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">Secure Sockets Layered (SSL) technology to ensure that your information is fully encrypted and sent across the Internet securely.</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">PCI Scanning to actively protect our servers from hackers and other vulnerabilities.</li></ul><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">All financially sensitive and/or credit information is transmitted via SSL technology and encrypted in our database. Only authorised Bitstamp personnel are permitted access to your Personal Information, and these personnel are required to treat the information as highly confidential. The security measures will be reviewed regularly in light of new and relevant legal and technical developments.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">RETENTION OF PERSONAL INFORMATION</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">We retain Personal Information for as long as necessary to fulfil purposes described in this Privacy Policy, subject to our own legal and regulatory obligations. In accordance with our record keeping obligations, we will retain Account and other Personal Information for at least five years after an Account is closed.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">UPDATES TO THIS PRIVACY POLICY</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">This Privacy Policy may be revised, modified, updated and/or supplemented at any time, without prior notice, at the sole discretion of Bitstamp. When we make changes to this Privacy Policy, we will notify all users on our website, and make the amended Privacy Policy available on our website.</p><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">DEFINITIONS</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Account. The contractual arrangement wherein a Bitstamp Member has accepted our&nbsp;<a href=\"https://www.bitstamp.net/terms-of-use/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Terms of Use</a>&nbsp;and Privacy Policy, and received approval to use the Bitstamp Services, including the purchase and sale of Bitcoins and to perform associated Transactions.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Bitstamp Platform. Hardware and software technologies used by Bitstamp to provide the Service as set out in our&nbsp;<a href=\"https://www.bitstamp.net/terms-of-use/\" style=\"padding: 0px; margin: 0px; color: rgb(117, 177, 3);\">Terms of Use</a>.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Personal Information. Information that identifies an individual, such as name, address, e-mail address, trading information, and banking details. “Personal Information” does not include anonymised and/or aggregated data that does not identify a specific user.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Service(s). The technological platform, functional rules and market managed by Bitstamp Ltd. to permit Sellers and Buyers to perform purchase and sale transactions of Bitcoins.</p><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Transaction. Includes the following:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style: none; float: left; width: 660px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px; background-color: rgb(240, 240, 235);\"><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The agreement between the Buyer and the Seller to exchange Bitcoins through the Service for currencies at a commonly agreed rate (\"Bitcoin Purchase Transaction\");</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The conversion of currencies into Bitcoins deposited by Members on their account (\"Conversion Transaction\");</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The transfer of Bitcoins among Members (\"Bitcoin Transfer Transaction\");</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The transfer of currencies among Members (\"Currency Transfer Transaction\"); and</li><li style=\"padding: 0px 0px 0px 10px; margin: 0px 0px 5px 20px; list-style: disc; line-height: 1.6em;\">The purchase of ancillary products (\"Purchase Transactions\").</li></ul><h2 style=\"padding: 0px; margin-top: 0px; margin-bottom: 15px; font-weight: bold; font-size: 1.4em; color: rgb(142, 201, 25); text-transform: uppercase; float: left; width: 660px; font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">CONTACT US</h2><p style=\"padding: 0px 0px 15px; margin-bottom: 0px; float: left; width: 660px; line-height: 1.8em; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(240, 240, 235);\">Please contact us with questions, comments, or concerns regarding our Privacy Policy and/or practices at&nbsp;</p>', 1, 'privacy-policy', '2018-02-14 05:55:53', '2018-02-14 05:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `style_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum` decimal(15,2) UNSIGNED NOT NULL,
  `maximum` decimal(15,2) UNSIGNED NOT NULL,
  `percentage` decimal(15,2) UNSIGNED NOT NULL,
  `start_duration` int(10) UNSIGNED NOT NULL,
  `repeat` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ppvs`
--

CREATE TABLE `ppvs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membership_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rewards` decimal(10,4) UNSIGNED NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_balance` decimal(15,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `deposit_balance` decimal(15,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `referral_balance` decimal(15,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `avatar`, `main_balance`, `deposit_balance`, `referral_balance`, `occupation`, `mobile`, `address`, `address2`, `city`, `state`, `postcode`, `country`, `about`, `facebook`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/avatars/default.jpg', '500000.0500', '500000.0500', '500000.0500', 'Full-Stack Web Developer', '880-1744-236585', 'Zero Point', 'Shaheb Bazaar', 'Rajshahi', 'Rajshahi', '6520', 'Bangladesh', 'My Name is Robi. I am Web Developer.', 'https://www.facebook.com/robihasanforyou', '2018-02-14 05:55:52', '2018-02-14 05:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `ptcs`
--

CREATE TABLE `ptcs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membership_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rewards` decimal(10,4) UNSIGNED NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `reflink_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reflinks`
--

CREATE TABLE `reflinks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reflinks`
--

INSERT INTO `reflinks` (`id`, `user_id`, `link`, `created_at`, `updated_at`) VALUES
(1, 1, 'ltmW1F3Tv', '2018-02-14 05:55:52', '2018-02-14 05:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disqus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_deposit` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `minimum_withdraw` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `self_transfer` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `other_transfer` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `signup_bonus` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `link_share` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `referral_signup` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `referral_deposit` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `referral_advert` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `referral_upgrade` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `ptc` tinyint(1) NOT NULL,
  `membership_upgrade` tinyint(1) NOT NULL,
  `ppv` tinyint(1) NOT NULL,
  `payment_proof` tinyint(1) NOT NULL,
  `latest_deposit` tinyint(1) NOT NULL,
  `transfer` tinyint(1) NOT NULL,
  `invest` tinyint(1) NOT NULL,
  `live_chat` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `site_title`, `company_name`, `contact_email`, `contact_number`, `app_contact`, `address`, `disqus`, `chat_code`, `minimum_deposit`, `minimum_withdraw`, `self_transfer`, `other_transfer`, `signup_bonus`, `link_share`, `referral_signup`, `referral_deposit`, `referral_advert`, `referral_upgrade`, `ptc`, `membership_upgrade`, `ppv`, `payment_proof`, `latest_deposit`, `transfer`, `invest`, `live_chat`, `created_at`, `updated_at`) VALUES
(1, 'CronLab PTC', 'No. 1 PTC Script In The Market', 'Cron Lab, Inc.', 'cronlab@icloud.com', '+880-1744-236585', 'no-reply@cronlab.xyz', '6 Finch House, <br> Cowkhali Road, <br>Rajshahi, <br>Bangladesh, <br>6520', 'cronlab', '5a25377bd0795768aaf8d39c', '50.00', '20.00', '10.00', '20.00', '5.50', '20.50', '10.50', '40.00', '50.00', '10.00', 1, 1, 1, 1, 1, 1, 1, 1, '2018-02-14 05:55:51', '2018-02-14 05:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `styles`
--

CREATE TABLE `styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compound` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `styles`
--

INSERT INTO `styles` (`id`, `name`, `compound`, `created_at`, `updated_at`) VALUES
(1, 'Hourly', 1, '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(2, 'Daily', 24, '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(3, 'Weekly', 168, '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(4, 'Monthly', 720, '2018-02-14 05:55:53', '2018-02-14 05:55:53'),
(5, 'Yearly', 8760, '2018-02-14 05:55:53', '2018-02-14 05:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `membership_started` date NOT NULL,
  `membership_expired` date NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `d_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `admin`, `email`, `password`, `membership_id`, `membership_started`, `membership_expired`, `token`, `d_code`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sherlock Holmes', 1, 'admin@cronlab.io', '$2y$10$vcMX1S3HX.w.ptoP9BgyAO2dA2nhUVlYRcsm/MeINa6euFKNkC2Wi', 1, '2018-02-14', '2020-12-31', NULL, NULL, 1, NULL, '2018-02-14 05:55:52', '2018-02-14 05:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ppv_id` int(10) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `charge` decimal(15,2) UNSIGNED NOT NULL,
  `net_amount` decimal(15,2) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adverts`
--
ALTER TABLE `adverts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adverts_user_id_index` (`user_id`),
  ADD KEY `adverts_ptc_id_index` (`ptc_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_index` (`user_id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussions_user_id_index` (`user_id`),
  ADD KEY `discussions_support_id_index` (`support_id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interests_user_id_index` (`user_id`),
  ADD KEY `interests_invest_id_index` (`invest_id`);

--
-- Indexes for table `interest_logs`
--
ALTER TABLE `interest_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interest_logs_user_id_index` (`user_id`),
  ADD KEY `interest_logs_invest_id_index` (`invest_id`);

--
-- Indexes for table `invests`
--
ALTER TABLE `invests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invests_user_id_index` (`user_id`),
  ADD KEY `invests_plan_id_index` (`plan_id`);

--
-- Indexes for table `kyc2s`
--
ALTER TABLE `kyc2s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyc2s_user_id_index` (`user_id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kycs_user_id_index` (`user_id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_identities`
--
ALTER TABLE `oauth_identities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_identities_user_id_index` (`user_id`);

--
-- Indexes for table `offlines`
--
ALTER TABLE `offlines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_index` (`category_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppvs`
--
ALTER TABLE `ppvs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ppvs_membership_id_index` (`membership_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_index` (`user_id`);

--
-- Indexes for table `ptcs`
--
ALTER TABLE `ptcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ptcs_membership_id_index` (`membership_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrals_reflink_id_index` (`reflink_id`),
  ADD KEY `referrals_user_id_index` (`user_id`);

--
-- Indexes for table `reflinks`
--
ALTER TABLE `reflinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reflinks_user_id_index` (`user_id`),
  ADD KEY `reflinks_link_index` (`link`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `styles`
--
ALTER TABLE `styles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supports_user_id_index` (`user_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_logs_user_id_index` (`user_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_user_id_index` (`user_id`),
  ADD KEY `videos_ppv_id_index` (`ppv_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adverts`
--
ALTER TABLE `adverts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inboxes`
--
ALTER TABLE `inboxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interest_logs`
--
ALTER TABLE `interest_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invests`
--
ALTER TABLE `invests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyc2s`
--
ALTER TABLE `kyc2s`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;

--
-- AUTO_INCREMENT for table `oauth_identities`
--
ALTER TABLE `oauth_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offlines`
--
ALTER TABLE `offlines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ppvs`
--
ALTER TABLE `ppvs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ptcs`
--
ALTER TABLE `ptcs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reflinks`
--
ALTER TABLE `reflinks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `styles`
--
ALTER TABLE `styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adverts`
--
ALTER TABLE `adverts`
  ADD CONSTRAINT `adverts_ptc_id_foreign` FOREIGN KEY (`ptc_id`) REFERENCES `ptcs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adverts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `interests_invest_id_foreign` FOREIGN KEY (`invest_id`) REFERENCES `invests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interest_logs`
--
ALTER TABLE `interest_logs`
  ADD CONSTRAINT `interest_logs_invest_id_foreign` FOREIGN KEY (`invest_id`) REFERENCES `invests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interest_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invests`
--
ALTER TABLE `invests`
  ADD CONSTRAINT `invests_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyc2s`
--
ALTER TABLE `kyc2s`
  ADD CONSTRAINT `kyc2s_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kycs`
--
ALTER TABLE `kycs`
  ADD CONSTRAINT `kycs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_identities`
--
ALTER TABLE `oauth_identities`
  ADD CONSTRAINT `oauth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ppvs`
--
ALTER TABLE `ppvs`
  ADD CONSTRAINT `ppvs_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ptcs`
--
ALTER TABLE `ptcs`
  ADD CONSTRAINT `ptcs_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_reflink_id_foreign` FOREIGN KEY (`reflink_id`) REFERENCES `reflinks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reflinks`
--
ALTER TABLE `reflinks`
  ADD CONSTRAINT `reflinks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supports`
--
ALTER TABLE `supports`
  ADD CONSTRAINT `supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `user_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ppv_id_foreign` FOREIGN KEY (`ppv_id`) REFERENCES `ppvs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
