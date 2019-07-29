-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2019 at 01:02 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, '2018-12-15 00:00:00', '2019-03-06 12:03:26');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `title`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, '49926.jpg', 'Banner Image 1', 'products/t-shirts1', 1, '2018-08-05 14:33:27', '2019-04-06 15:01:59'),
(2, '62526.jpg', 'Banner Image', 'products/t-shirts', 1, '2018-08-05 14:34:06', '2019-04-06 15:02:11'),
(4, '59330.jpg', 'Test Banner', 'products/shoes', 1, '2018-08-07 16:13:25', '2019-04-06 15:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `product_name`, `product_code`, `product_color`, `size`, `price`, `quantity`, `user_email`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 20, 'Red Yshirt', 'Green-220', 'Red', 'Small', 50.00, 1, '', 'bdhmh24apYeaHSgxM3fLTlmGmRM6LknfET8hENTn', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `description`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 'T-Shirts', 'gfggh', 't-shirts', 'T-Shirts | E-shop', 'please read carefully in description', 'best tshirt', 1, NULL, '2018-03-26 09:20:29', '2019-04-20 14:04:01'),
(2, 0, 'Shoes', 'best showes', 'shoes', 'Shoes | E-shop', 'Shoes | E-shopShoes | E-shopShoes | E-shopShoes | E-shopShoes | E-shopShoes | E-shopShoes | E-shop', 'Shoes | E-shop', 1, NULL, '2018-03-26 10:25:46', '2019-04-20 14:07:42'),
(3, 1, 'Formal T-Shirts', 'test', 'format-tshirts', 'Formal T-Shirts | E-shop', 'please read carefully in description', 'formal t-shirt, e-shopper', 1, NULL, '2018-03-26 11:47:41', '2019-04-20 14:05:00'),
(4, 2, 'Formal Shoes', 'Formal Shoes', 'formal-shoes', 'Formal Shoes | E-shop', 'Formal Shoes | E-shopFormal Shoes | E-shopFormal Shoes | E-shopFormal Shoes | E-shopFormal Shoes | E-shop', 'Formal Shoes, E-shop', 1, NULL, '2018-05-02 08:58:00', '2019-04-20 14:05:34'),
(5, 1, 'Casual T-Shirts', 'Casual T-Shirts Casual T-Shirts', 'casual-t-shirts', 'Casual T-Shirts | E-shop', 'please read carefully in description', 'Casual T-Shirts, eshop', 1, NULL, '2018-05-02 09:00:27', '2019-04-20 14:08:18'),
(6, 1, 'Sports T-Shirts', 'test', 'sports-tshirts', '', '', '', 1, NULL, '2018-05-09 10:55:52', '2018-05-10 08:36:55'),
(7, 1, 'Test T-shirts', 'tet', 'test', '', '', '', 0, NULL, '2018-05-09 10:56:56', '2018-05-09 10:56:56'),
(8, 0, 'Electronics', 'Electronics ElectronicsElectronicsElectronicsElectronicsElectronics', 'electronics', 'Electronics | E-shop', 'please read carefully in description', 'Electronics, eshop', 1, NULL, '2019-03-13 12:30:21', '2019-04-20 14:10:23'),
(9, 8, 'Mobile Phone', 'mobile phone', 'mobile-phone', 'Mobile Phone | E-shop', 'please read carefully in description', 'Mobile Phone, E-shop', 1, NULL, '2019-03-13 12:31:20', '2019-04-20 14:09:04'),
(18, 0, 'Women\'s Clothing', 'hghg', 'women\'s-cloth', 'women\'s-cloth | E-shop', 'please read carefully in description', 'womes cloth', 1, NULL, '2019-04-20 13:45:21', '2019-04-20 14:01:45'),
(19, 18, 'Women\'s bag', 'cvdsvdf', 'women\'s-bag', 'Women\'s Bags | E-shopper', 'please read carefully in description', 'v', 1, NULL, '2019-04-20 13:45:41', '2019-04-20 13:45:41');

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(30) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `title`, `description`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(8, 'About Us', 'For a remarkable about page, all you need to do is figure out your company\'s unique identity, and then share it with the world. Easy, right? Of course not. Your \"About Us\" page is one of the most important pages on your website, and it needs to be well crafted. This profile also happens to be one of the most commonly overlooked pages, which is why you should make it stand out.\r\n\r\nThe good news? It can be done. In fact, there are some companies out there with remarkable \"About Us\" pages, the elements of which you can emulate on your own website.\r\n\r\nBy the end of this post, you\'ll know what makes some of today\'s best \"About Us\" and \"About Me\" pages so great, and how to make your own about page that shares your company\'s greatness.', 'about-us', 'About Us | E-shopper', 'please read carefully in description', 'about us, e-shopper', 1, '2019-03-11 21:20:14', '2019-04-18 15:37:13'),
(9, 'Terms & Condition', 'tedgfhfhg', 'terms-and-condition', 'Terms & Condition | E-shopper', 'please read carefully in description', 'Terms & Condition, e-shopper', 1, '2019-03-11 21:20:25', '2019-04-18 15:38:31'),
(11, 'Privacy  Policy', 'page comming soon', 'privacy-policy', 'privacy policy | E-shop', 'please read carefully in description', 'privacy policy,', 1, '2019-04-18 20:57:52', '2019-04-18 14:57:52'),
(12, 'Frequently Asked Questions', 'frequently-asked-questions page coming soon', 'frequently-asked-questions', 'FAQ | E-shop', 'please read carefully in description', 'frequently-asked-questions,e-shop', 1, '2019-04-18 21:08:14', '2019-04-18 15:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CK', 'Cook Islands'),
(51, 'CR', 'Costa Rica'),
(52, 'HR', 'Croatia (Hrvatska)'),
(53, 'CU', 'Cuba'),
(54, 'CY', 'Cyprus'),
(55, 'CZ', 'Czech Republic'),
(56, 'DK', 'Denmark'),
(57, 'DJ', 'Djibouti'),
(58, 'DM', 'Dominica'),
(59, 'DO', 'Dominican Republic'),
(60, 'TP', 'East Timor'),
(61, 'EC', 'Ecuador'),
(62, 'EG', 'Egypt'),
(63, 'SV', 'El Salvador'),
(64, 'GQ', 'Equatorial Guinea'),
(65, 'ER', 'Eritrea'),
(66, 'EE', 'Estonia'),
(67, 'ET', 'Ethiopia'),
(68, 'FK', 'Falkland Islands (Malvinas)'),
(69, 'FO', 'Faroe Islands'),
(70, 'FJ', 'Fiji'),
(71, 'FI', 'Finland'),
(72, 'FR', 'France'),
(73, 'FX', 'France, Metropolitan'),
(74, 'GF', 'French Guiana'),
(75, 'PF', 'French Polynesia'),
(76, 'TF', 'French Southern Territories'),
(77, 'GA', 'Gabon'),
(78, 'GM', 'Gambia'),
(79, 'GE', 'Georgia'),
(80, 'DE', 'Germany'),
(81, 'GH', 'Ghana'),
(82, 'GI', 'Gibraltar'),
(83, 'GK', 'Guernsey'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'IM', 'Isle of Man'),
(101, 'ID', 'Indonesia'),
(102, 'IR', 'Iran (Islamic Republic of)'),
(103, 'IQ', 'Iraq'),
(104, 'IE', 'Ireland'),
(105, 'IL', 'Israel'),
(106, 'IT', 'Italy'),
(107, 'CI', 'Ivory Coast'),
(108, 'JE', 'Jersey'),
(109, 'JM', 'Jamaica'),
(110, 'JP', 'Japan'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea, Democratic People\'s Republic of'),
(116, 'KR', 'Korea, Republic of'),
(117, 'XK', 'Kosovo'),
(118, 'KW', 'Kuwait'),
(119, 'KG', 'Kyrgyzstan'),
(120, 'LA', 'Lao People\'s Democratic Republic'),
(121, 'LV', 'Latvia'),
(122, 'LB', 'Lebanon'),
(123, 'LS', 'Lesotho'),
(124, 'LR', 'Liberia'),
(125, 'LY', 'Libyan Arab Jamahiriya'),
(126, 'LI', 'Liechtenstein'),
(127, 'LT', 'Lithuania'),
(128, 'LU', 'Luxembourg'),
(129, 'MO', 'Macau'),
(130, 'MK', 'Macedonia'),
(131, 'MG', 'Madagascar'),
(132, 'MW', 'Malawi'),
(133, 'MY', 'Malaysia'),
(134, 'MV', 'Maldives'),
(135, 'ML', 'Mali'),
(136, 'MT', 'Malta'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'TY', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia, Federated States of'),
(144, 'MD', 'Moldova, Republic of'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'ME', 'Montenegro'),
(148, 'MS', 'Montserrat'),
(149, 'MA', 'Morocco'),
(150, 'MZ', 'Mozambique'),
(151, 'MM', 'Myanmar'),
(152, 'NA', 'Namibia'),
(153, 'NR', 'Nauru'),
(154, 'NP', 'Nepal'),
(155, 'NL', 'Netherlands'),
(156, 'AN', 'Netherlands Antilles'),
(157, 'NC', 'New Caledonia'),
(158, 'NZ', 'New Zealand'),
(159, 'NI', 'Nicaragua'),
(160, 'NE', 'Niger'),
(161, 'NG', 'Nigeria'),
(162, 'NU', 'Niue'),
(163, 'NF', 'Norfolk Island'),
(164, 'MP', 'Northern Mariana Islands'),
(165, 'NO', 'Norway'),
(166, 'OM', 'Oman'),
(167, 'PK', 'Pakistan'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestine'),
(170, 'PA', 'Panama'),
(171, 'PG', 'Papua New Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Peru'),
(174, 'PH', 'Philippines'),
(175, 'PN', 'Pitcairn'),
(176, 'PL', 'Poland'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'RE', 'Reunion'),
(181, 'RO', 'Romania'),
(182, 'RU', 'Russian Federation'),
(183, 'RW', 'Rwanda'),
(184, 'KN', 'Saint Kitts and Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'VC', 'Saint Vincent and the Grenadines'),
(187, 'WS', 'Samoa'),
(188, 'SM', 'San Marino'),
(189, 'ST', 'Sao Tome and Principe'),
(190, 'SA', 'Saudi Arabia'),
(191, 'SN', 'Senegal'),
(192, 'RS', 'Serbia'),
(193, 'SC', 'Seychelles'),
(194, 'SL', 'Sierra Leone'),
(195, 'SG', 'Singapore'),
(196, 'SK', 'Slovakia'),
(197, 'SI', 'Slovenia'),
(198, 'SB', 'Solomon Islands'),
(199, 'SO', 'Somalia'),
(200, 'ZA', 'South Africa'),
(201, 'GS', 'South Georgia South Sandwich Islands'),
(202, 'SS', 'South Sudan'),
(203, 'ES', 'Spain'),
(204, 'LK', 'Sri Lanka'),
(205, 'SH', 'St. Helena'),
(206, 'PM', 'St. Pierre and Miquelon'),
(207, 'SD', 'Sudan'),
(208, 'SR', 'Suriname'),
(209, 'SJ', 'Svalbard and Jan Mayen Islands'),
(210, 'SZ', 'Swaziland'),
(211, 'SE', 'Sweden'),
(212, 'CH', 'Switzerland'),
(213, 'SY', 'Syrian Arab Republic'),
(214, 'TW', 'Taiwan'),
(215, 'TJ', 'Tajikistan'),
(216, 'TZ', 'Tanzania, United Republic of'),
(217, 'TH', 'Thailand'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad and Tobago'),
(222, 'TN', 'Tunisia'),
(223, 'TR', 'Turkey'),
(224, 'TM', 'Turkmenistan'),
(225, 'TC', 'Turks and Caicos Islands'),
(226, 'TV', 'Tuvalu'),
(227, 'UG', 'Uganda'),
(228, 'UA', 'Ukraine'),
(229, 'AE', 'United Arab Emirates'),
(230, 'GB', 'United Kingdom'),
(231, 'US', 'United States'),
(232, 'UM', 'United States minor outlying islands'),
(233, 'UY', 'Uruguay'),
(234, 'UZ', 'Uzbekistan'),
(235, 'VU', 'Vanuatu'),
(236, 'VA', 'Vatican City State'),
(237, 'VE', 'Venezuela'),
(238, 'VN', 'Vietnam'),
(239, 'VG', 'Virgin Islands (British)'),
(240, 'VI', 'Virgin Islands (U.S.)'),
(241, 'WF', 'Wallis and Futuna Islands'),
(242, 'EH', 'Western Sahara'),
(243, 'YE', 'Yemen'),
(244, 'ZR', 'Zaire'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `amount`, `amount_type`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(5, 'ABCDEF', 10, 'Fixed', '2019-06-14', 1, '2019-06-14 09:19:42', '2019-06-14 03:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `exchange_rate` float NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(7, 'EUR', 0.89, 1, '2019-07-10 09:04:55', '2019-07-10 03:04:55'),
(8, 'GBP', 0.8, 1, '2019-07-10 09:05:08', '2019-07-10 03:05:08'),
(9, 'BD', 84.5, 1, '2019-07-10 09:19:49', '2019-07-10 03:19:49');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 20, 'alaminrony100@gmail.com', 'alamin rony', '60/4/a', 'dhaka', 'dhaka', 'Bangladesh', 'BD', '01912168339', '2019-07-10 08:41:53', '2019-07-10 02:41:53');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_18_090951_create_category_table', 2),
(4, '2018_03_18_100532_add_url_to_categories', 3),
(5, '2018_03_29_144354_create_products_table', 4),
(6, '2018_04_16_135232_create_products_attributes_table', 5),
(7, '2018_06_21_174929_create_cart_table', 6),
(8, '2018_07_09_150844_create_coupons_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `shipping_charges` float NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_amount` float NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `grand_total` float NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `state`, `pincode`, `country`, `mobile`, `shipping_charges`, `coupon_code`, `coupon_amount`, `order_status`, `payment_method`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 20, 'alaminrony100@gmail.com', 'alamin rony', '60/4/a', 'dhaka', 'dhaka', 'BD', 'Bangladesh', '01912168339', 0, '', 0, 'New', 'COD', 100, '2019-06-21 11:56:04', '2019-06-21 05:56:04'),
(2, 20, 'alaminrony100@gmail.com', 'alamin rony', '60/4/a', 'dhaka', 'dhaka', 'BD', 'Bangladesh', '01912168339', 0, '', 0, 'New', 'COD', 50, '2019-07-10 08:43:17', '2019-07-10 02:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE `orders_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_size` varchar(255) NOT NULL,
  `product_color` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `user_id`, `product_id`, `product_code`, `product_name`, `product_size`, `product_color`, `product_price`, `product_qty`, `created_at`, `updated_at`) VALUES
(1, 34, 18, 23, 'GLXY-220', 'Samsung Galaxy', 'None', 'black', 100, 2, '2019-04-20 21:08:46', '2019-04-20 15:08:46'),
(2, 36, 18, 23, 'GLXY-220', 'Samsung Galaxy', 'None', 'black', 100, 1, '2019-04-20 21:14:12', '2019-04-20 15:14:12'),
(3, 41, 18, 23, 'GLXY-220', 'Samsung Galaxy', 'None', 'black', 100, 1, '2019-04-20 21:22:55', '2019-04-20 15:22:55'),
(4, 43, 18, 23, 'GLXY-220', 'Samsung Galaxy', 'None', 'black', 100, 1, '2019-04-21 09:24:56', '2019-04-21 03:24:56'),
(5, 44, 19, 23, 'GLXY-220', 'Samsung Galaxy', 'None', 'black', 100, 1, '2019-04-22 16:11:16', '2019-04-22 10:11:16'),
(6, 45, 18, 20, 'Green-220', 'Red Yshirt', 'Small', 'Red', 100, 1, '2019-06-14 09:21:25', '2019-06-14 03:21:25'),
(7, 46, 20, 20, 'Green-220', 'Red Yshirt', 'Small', 'Red', 100, 1, '2019-06-17 07:22:23', '2019-06-17 01:22:23'),
(8, 1, 20, 20, 'Green-220', 'Red Yshirt', 'Small', 'Red', 100, 1, '2019-06-21 11:56:04', '2019-06-21 05:56:04'),
(9, 2, 20, 20, 'Green-220', 'Red Yshirt', 'Small', 'Red', 50, 1, '2019-07-10 08:43:17', '2019-07-10 02:43:17');

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
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `country_name`, `code`, `created_at`, `updated_at`) VALUES
(2, 'Afghanistan', 'AF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Åland Islands', 'AX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Albania', 'AL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Algeria', 'DZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'American Samoa', 'AS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Andorra', 'AD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Angola', 'AO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Anguilla', 'AI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Antarctica', 'AQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Antigua and Barbuda', 'AG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Argentina', 'AR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Armenia', 'AM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Aruba', 'AW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Australia', 'AU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Austria', 'AT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Azerbaijan', 'AZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Bahamas', 'BS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Bahrain', 'BH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Bangladesh', 'BD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Barbados', 'BB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Belarus', 'BY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Belgium', 'BE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Belize', 'BZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Benin', 'BJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Bermuda', 'BM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Bhutan', 'BT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Bolivia, Plurinational State of', 'BO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Bonaire, Sint Eustatius and Saba', 'BQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Bosnia and Herzegovina', 'BA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Botswana', 'BW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Bouvet Island', 'BV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Brazil', 'BR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'British Indian Ocean Territory', 'IO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Brunei Darussalam', 'BN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Bulgaria', 'BG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Burkina Faso', 'BF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Burundi', 'BI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Cambodia', 'KH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Cameroon', 'CM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Canada', 'CA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Cape Verde', 'CV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Cayman Islands', 'KY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Central African Republic', 'CF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Chad', 'TD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'Chile', 'CL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'China', 'CN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Christmas Island', 'CX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Cocos (Keeling) Islands', 'CC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Colombia', 'CO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Comoros', 'KM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Congo', 'CG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Congo, the Democratic Republic of the', 'CD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Cook Islands', 'CK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Costa Rica', 'CR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Côte d\'Ivoire', 'CI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Croatia', 'HR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Cuba', 'CU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Curaçao', 'CW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Cyprus', 'CY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Czech Republic', 'CZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Denmark', 'DK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Djibouti', 'DJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Dominica', 'DM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Dominican Republic', 'DO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Ecuador', 'EC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Egypt', 'EG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'El Salvador', 'SV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Equatorial Guinea', 'GQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Eritrea', 'ER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Estonia', 'EE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Ethiopia', 'ET', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Falkland Islands (Malvinas)', 'FK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Faroe Islands', 'FO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Fiji', 'FJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Finland', 'FI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'France', 'FR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'French Guiana', 'GF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'French Polynesia', 'PF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'French Southern Territories', 'TF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Gabon', 'GA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Gambia', 'GM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Georgia', 'GE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Germany', 'DE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Ghana', 'GH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Gibraltar', 'GI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Greece', 'GR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Greenland', 'GL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Grenada', 'GD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Guadeloupe', 'GP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Guam', 'GU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Guatemala', 'GT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Guernsey', 'GG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Guinea', 'GN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Guinea-Bissau', 'GW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Guyana', 'GY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Haiti', 'HT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Heard Island and McDonald Islands', 'HM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Holy See (Vatican City State)', 'VA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Honduras', 'HN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Hong Kong', 'HK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Hungary', 'HU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Iceland', 'IS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'India', 'IN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Indonesia', 'ID', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Iran, Islamic Republic of', 'IR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Iraq', 'IQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Ireland', 'IE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Isle of Man', 'IM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Israel', 'IL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Italy', 'IT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Jamaica', 'JM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Japan', 'JP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Jersey', 'JE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Jordan', 'JO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Kazakhstan', 'KZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Kenya', 'KE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Kiribati', 'KI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Korea, Democratic People\'s Republic of', 'KP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Korea, Republic of', 'KR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Kuwait', 'KW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Kyrgyzstan', 'KG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Lao People\'s Democratic Republic', 'LA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Latvia', 'LV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Lebanon', 'LB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Lesotho', 'LS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Liberia', 'LR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Libya', 'LY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Liechtenstein', 'LI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Lithuania', 'LT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'Luxembourg', 'LU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'Macao', 'MO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Macedonia, the Former Yugoslav Republic of', 'MK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Madagascar', 'MG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Malawi', 'MW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'Malaysia', 'MY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'Maldives', 'MV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Mali', 'ML', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Malta', 'MT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Marshall Islands', 'MH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Martinique', 'MQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Mauritania', 'MR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Mauritius', 'MU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Mayotte', 'YT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Mexico', 'MX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Micronesia, Federated States of', 'FM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Moldova, Republic of', 'MD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Monaco', 'MC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Mongolia', 'MN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Montenegro', 'ME', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Montserrat', 'MS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Morocco', 'MA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Mozambique', 'MZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Myanmar', 'MM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Namibia', 'NA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'Nauru', 'NR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'Nepal', 'NP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'Netherlands', 'NL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'New Caledonia', 'NC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'New Zealand', 'NZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Nicaragua', 'NI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'Niger', 'NE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Nigeria', 'NG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Niue', 'NU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Norfolk Island', 'NF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'Northern Mariana Islands', 'MP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Norway', 'NO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Oman', 'OM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'Pakistan', 'PK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Palau', 'PW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Palestine, State of', 'PS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Panama', 'PA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Papua New Guinea', 'PG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Paraguay', 'PY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Peru', 'PE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Philippines', 'PH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Pitcairn', 'PN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Poland', 'PL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Portugal', 'PT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Puerto Rico', 'PR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Qatar', 'QA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Réunion', 'RE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Romania', 'RO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Russian Federation', 'RU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Rwanda', 'RW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Saint Barthélemy', 'BL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'Saint Kitts and Nevis', 'KN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Saint Lucia', 'LC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Saint Martin (French part)', 'MF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Saint Pierre and Miquelon', 'PM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Saint Vincent and the Grenadines', 'VC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'Samoa', 'WS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'San Marino', 'SM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Sao Tome and Principe', 'ST', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Saudi Arabia', 'SA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Senegal', 'SN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Serbia', 'RS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Seychelles', 'SC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Sierra Leone', 'SL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'Singapore', 'SG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Sint Maarten (Dutch part)', 'SX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Slovakia', 'SK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Slovenia', 'SI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Solomon Islands', 'SB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'Somalia', 'SO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'South Africa', 'ZA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'South Georgia and the South Sandwich Islands', 'GS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'South Sudan', 'SS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Spain', 'ES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Sri Lanka', 'LK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Sudan', 'SD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Suriname', 'SR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Svalbard and Jan Mayen', 'SJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Swaziland', 'SZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'Sweden', 'SE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'Switzerland', 'CH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Syrian Arab Republic', 'SY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Taiwan, Province of China', 'TW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Tajikistan', 'TJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Tanzania, United Republic of', 'TZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Thailand', 'TH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Timor-Leste', 'TL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Togo', 'TG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Tokelau', 'TK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Tonga', 'TO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'Trinidad and Tobago', 'TT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Tunisia', 'TN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Turkey', 'TR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'Turkmenistan', 'TM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Turks and Caicos Islands', 'TC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Tuvalu', 'TV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Uganda', 'UG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'Ukraine', 'UA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'United Arab Emirates', 'AE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'United Kingdom', 'GB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'United States', 'US', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'United States Minor Outlying Islands', 'UM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Uruguay', 'UY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'Uzbekistan', 'UZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Vanuatu', 'VU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Venezuela, Bolivarian Republic of', 'VE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'Viet Nam', 'VN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Virgin Islands, British', 'VG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Virgin Islands, U.S.', 'VI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'Wallis and Futuna', 'WF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'Western Sahara', 'EH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'Yemen', 'YE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Zambia', 'ZM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'Zimbabwe', 'ZW', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `care` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_item` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `product_color`, `description`, `care`, `price`, `image`, `video`, `feature_item`, `status`, `created_at`, `updated_at`) VALUES
(20, 3, 'Red Yshirt', 'Red001', 'Red', 'brgrfgrf', 'grgtrgr', 100.00, '54310.jpg', '', 1, 1, '2019-04-07 07:10:45', '2019-04-07 07:10:45'),
(21, 3, 'Green T shirt', 'Green001', 'Green', 'csdcvsdkvkk', 'vdfv,dfmkdf', 80.00, '39589.jpg', '', 1, 1, '2019-04-07 07:27:05', '2019-04-07 07:27:05'),
(22, 9, 'Iphone-X', 'IP-1010', 'silver', 'sdfdsvdfb', 'fdbfdbb', 1500.00, '20474.jpg', '', 1, 1, '2019-04-07 07:27:33', '2019-04-07 07:27:33'),
(23, 9, 'Samsung Galaxy', 'GLXY-220', 'black', 'gfdgbfdhb', 'fgbfdbfgbg', 500.00, '47726.png', '', 1, 1, '2019-04-07 07:29:07', '2019-04-07 07:29:07'),
(24, 19, 'bag', 'bag-1234', 'silver', 'bbvbvnn', 'nghnhgmnhg', 100.00, '5517.jpg', '', 0, 1, '2019-04-22 09:55:19', '2019-04-22 09:55:19'),
(28, 5, 'testing', 'blue', 'silver', 's', 'd', 100.00, '71782.jpg', 'SampleVideo_1280x720_1mb.mp4', 1, 1, '2019-06-26 06:10:06', '2019-06-27 11:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`id`, `product_id`, `sku`, `size`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(3, 9, 'GTS001-S', 'Small', 500.00, 30, '2018-04-18 12:18:02', '2019-03-06 12:13:14'),
(5, 9, 'GTS001-M', 'Medium', 1000.00, 2, '2018-04-18 12:18:23', '2019-03-06 12:13:14'),
(6, 10, 'BCT01-S', 'Small', 1500.00, 2, '2018-05-15 11:40:25', '2018-07-07 10:17:09'),
(7, 10, 'BCT01-M', 'Medium', 1800.00, 2, '2018-05-15 11:40:28', '2018-07-07 10:17:11'),
(8, 11, 'FTS001-S', 'Small', 1200.00, 10, '2018-06-26 09:18:35', '2018-06-26 09:18:35'),
(10, 23, 'GLXY-220', 'None', 100.00, 10, '2019-04-07 07:48:49', '2019-04-07 07:49:30'),
(11, 20, 'Green-220', 'Small', 50.00, 10, '2019-06-14 03:18:45', '2019-07-06 13:56:25'),
(12, 20, 'Green-221', 'Medium', 80.00, 10, '2019-07-06 13:56:59', '2019-07-06 13:56:59');

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(3, 9, '69412.jpg', '2018-05-26 17:32:58', '2018-05-26 12:02:58'),
(4, 9, '81426.png', '2018-05-26 17:32:59', '2018-05-26 12:02:59'),
(5, 9, '86890.jpg', '2018-05-26 17:33:00', '2018-05-26 12:03:00'),
(6, 9, '15927.jpg', '2018-06-02 14:30:10', '2018-06-02 09:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `email`, `password`, `admin`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(20, 'alamin rony', '60/4/a', 'dhaka', 'dhaka', 'Bangladesh', 'BD', '01912168339', 'alaminrony100@gmail.com', '$2y$10$MIDo0wyJRvH7JoMAp9DGOuGuoPNT46rCz/nCk8itOK4TByBvsOOxe', 0, 1, 'wMwGk202rpv6ycwm3K67ei35lIy7PKex91f3G62JXagSTyNyiPQcXi4HU2Qo', '2019-06-17 01:20:45', '2019-07-10 02:41:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
