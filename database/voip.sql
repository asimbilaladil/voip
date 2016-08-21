-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 20, 2016 at 08:46 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voip`
--

-- --------------------------------------------------------

--
-- Table structure for table `_administrator`
--

CREATE TABLE `_administrator` (
  `idAdmin` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `show_price` int(11) NOT NULL DEFAULT '1',
  `idCurrency` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) CHARACTER SET macce COLLATE macce_bin NOT NULL,
  `is_paypal` int(11) NOT NULL DEFAULT '1',
  `order_mail_to` varchar(250) NOT NULL,
  `paypal_link` varchar(250) NOT NULL,
  `paypal_business_mail` varchar(250) NOT NULL,
  `is_smtp` int(11) NOT NULL DEFAULT '0',
  `smtp_host` varchar(250) NOT NULL,
  `smtp_user` varchar(250) NOT NULL,
  `smtp_password` varchar(250) NOT NULL,
  `smtp_port` bigint(20) NOT NULL,
  `page_bottom_content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_administrator`
--

INSERT INTO `_administrator` (`idAdmin`, `Name`, `email`, `show_price`, `idCurrency`, `username`, `password`, `is_paypal`, `order_mail_to`, `paypal_link`, `paypal_business_mail`, `is_smtp`, `smtp_host`, `smtp_user`, `smtp_password`, `smtp_port`, `page_bottom_content`) VALUES
(1, 'Test', 'admin@mail.com', 1, 227, 'admin', 'admin', 1, 'admin@mail.com', 'https://www.sandbox.paypal.com/cgi-bin/webscr', '', 0, '', '', '', 0, '<p><img src=img/pay-img.jpg></p>\r\n<p>By clicking the ORDER NOW button, you agree <br> to the <a target=`_blank` href=`#`>Terms & Conditions</a>.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `_category`
--

CREATE TABLE `_category` (
  `idCategory` bigint(20) NOT NULL,
  `idParent` bigint(20) NOT NULL,
  `catName` varchar(250) NOT NULL,
  `catDescription` longtext NOT NULL,
  `catImage` varchar(250) NOT NULL,
  `catPrice` double(15,2) NOT NULL DEFAULT '0.00',
  `is_image` int(11) NOT NULL DEFAULT '0' COMMENT '1 for image 2 for icon 0 for none'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_category`
--

INSERT INTO `_category` (`idCategory`, `idParent`, `catName`, `catDescription`, `catImage`, `catPrice`, `is_image`) VALUES
(1, 0, 'PSD to Responsive HTML5', 'PSD to Responsive HTML5', 'fa fa-html5', 0.00, 2),
(2, 0, 'PSD to CMS / ecommerce', 'PSD to CMS / ecommerce', 'fa fa-shopping-cart', 0.00, 2),
(4, 0, 'Other Services', ' Other Services', 'fa fa-lightbulb-o', 0.00, 2),
(5, 0, 'TEST', 'NNNN ', '', 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_cms`
--

CREATE TABLE `_cms` (
  `idCms` bigint(20) NOT NULL,
  `content` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `_coupon`
--

CREATE TABLE `_coupon` (
  `idCoupon` bigint(20) NOT NULL,
  `couponCode` varchar(250) NOT NULL,
  `discountType` enum('P','C') NOT NULL,
  `discountValue` varchar(200) NOT NULL,
  `dateFrom` date NOT NULL,
  `dateTo` date NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `_coupon_products`
--

CREATE TABLE `_coupon_products` (
  `idProductcoupon` bigint(20) NOT NULL,
  `idCoupon` bigint(20) NOT NULL,
  `idProduct` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `_currency`
--

CREATE TABLE `_currency` (
  `idCurrency` int(3) UNSIGNED NOT NULL,
  `country` varchar(200) DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `currency_name` varchar(32) DEFAULT NULL,
  `currrency_symbol` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_currency`
--

INSERT INTO `_currency` (`idCurrency`, `country`, `currency_code`, `currency_name`, `currrency_symbol`) VALUES
(13, 'Australia', 'AUD', 'Dollar', '$'),
(30, 'Brazil', 'BRL', 'Real', 'R$'),
(39, 'Canada', 'CAD', 'Dollar', '$'),
(46, 'Christmas Island', 'AUD', 'Dollar', '$'),
(47, 'Cocos Islands', 'AUD', 'Dollar', '$'),
(50, 'Cook Islands', 'NZD', 'Dollar', '$'),
(55, 'Czech Republic', 'CZK', 'Koruna', 'KÃ„'),
(57, 'Denmark', 'DKK', 'Krone', 'kr'),
(61, 'East Timor', 'USD', 'Dollar', '$'),
(62, 'Ecuador', 'USD', 'Dollar', '$'),
(70, 'Faroe Islands', 'DKK', 'Krone', 'kr'),
(72, 'Finland', 'EUR', 'Euro', 'Ã¢â'),
(73, 'France', 'EUR', 'Euro', 'Ã¢â'),
(74, 'French Guiana', 'EUR', 'Euro', 'Ã¢â'),
(76, 'French Southern Territories', 'EUR', 'Euro  ', 'Ã¢â'),
(80, 'Germany', 'EUR', 'Euro', 'Ã¢â'),
(83, 'Greece', 'EUR', 'Euro', 'Ã¢â'),
(84, 'Greenland', 'DKK', 'Krone', 'kr'),
(86, 'Guadeloupe', 'EUR', 'Euro', 'Ã¢â'),
(87, 'Guam', 'USD', 'Dollar', '$'),
(93, 'Heard Island and McDonald Islands', 'AUD', 'Dollar', '$'),
(95, 'Hong Kong', 'HKD', 'Dollar', '$'),
(96, 'Hungary', 'HUF', 'Forint', 'Ft'),
(102, 'Ireland', 'EUR', 'Euro', 'Ã¢â'),
(103, 'Israel', 'ILS', 'Shekel', 'Ã¢â'),
(104, 'Italy', 'EUR', 'Euro', 'Ã¢â'),
(107, 'Japan', 'JPY', 'Yen', 'Ã‚Â'),
(111, 'Kiribati', 'AUD', 'Dollar', '$'),
(120, 'Liechtenstein', 'CHF', 'Franc', 'CHF'),
(122, 'Luxembourg', 'EUR', 'Euro', 'Ã¢â'),
(127, 'Malaysia', 'MYR', 'Ringgit', 'RM'),
(128, 'Maldives', 'MVR', 'Rufiyaa', 'Rf'),
(131, 'Marshall Islands', 'USD', 'Dollar', '$'),
(132, 'Martinique', 'EUR', 'Euro', 'Ã¢â'),
(135, 'Mayotte', 'EUR', 'Euro', 'Ã¢â'),
(136, 'Mexico', 'MXN', 'Peso', '$'),
(137, 'Micronesia', 'USD', 'Dollar', '$'),
(139, 'Monaco', 'EUR', 'Euro', 'Ã¢â'),
(146, 'Nauru', 'AUD', 'Dollar', '$'),
(148, 'Netherlands', 'EUR', 'Euro', 'Ã¢â'),
(151, 'New Zealand', 'NZD', 'Dollar', '$'),
(155, 'Niue', 'NZD', 'Dollar', '$'),
(156, 'Norfolk Island', 'AUD', 'Dollar', '$'),
(158, 'Northern Mariana Islands', 'USD', 'Dollar', '$'),
(159, 'Norway', 'NOK', 'Krone', 'kr'),
(162, 'Palau', 'USD', 'Dollar', '$'),
(163, 'Palestinian Territory', 'ILS', 'Shekel', 'Ã¢â'),
(168, 'Philippines', 'PHP', 'Peso', 'Php'),
(169, 'Pitcairn', 'NZD', 'Dollar', '$'),
(170, 'Poland', 'PLN', 'Zloty', 'zÃ…'),
(171, 'Portugal', 'EUR', 'Euro', 'Ã¢â'),
(172, 'Puerto Rico', 'USD', 'Dollar', '$'),
(175, 'Reunion', 'EUR', 'Euro', 'Ã¢â'),
(182, 'Saint Pierre and Miquelon', 'EUR', 'Euro', 'Ã¢â'),
(185, 'San Marino', 'EUR', 'Euro', 'Ã¢â'),
(192, 'Singapore', 'SGD', 'Dollar', '$'),
(194, 'Slovenia', 'EUR', 'Euro', 'Ã¢â'),
(198, 'South Georgia and the South Sandwich Islands', 'GBP', 'Pound', 'Ã‚Â'),
(200, 'Spain', 'EUR', 'Euro', 'Ã¢â'),
(204, 'Svalbard and Jan Mayen', 'NOK', 'Krone', 'kr'),
(206, 'Sweden', 'SEK', 'Krona', 'kr'),
(207, 'Switzerland', 'CHF', 'Franc', 'CHF'),
(209, 'Taiwan', 'TWD', 'Dollar', 'NT$'),
(210, 'Tajikistan', 'TJS', 'Somoni', NULL),
(212, 'Thailand', 'THB', 'Baht', 'Ã Â'),
(214, 'Tokelau', 'NZD', 'Dollar', '$'),
(218, 'Turkey', 'TRY', 'Lira', 'YTL'),
(220, 'Turks and Caicos Islands', 'USD', 'Dollar', '$'),
(221, 'Tuvalu', 'AUD', 'Dollar', '$'),
(222, 'U.S. Virgin Islands', 'USD', 'Dollar', '$'),
(226, 'United Kingdom', 'GBP', 'Pound', 'Ã‚Â'),
(227, 'United States', 'USD', 'Dollar', '$'),
(228, 'United States Minor Outlying Islands', 'USD', 'Dollar ', '$'),
(232, 'Vatican', 'EUR', 'Euro', 'Ã¢â');

-- --------------------------------------------------------

--
-- Table structure for table `_mailtemplate`
--

CREATE TABLE `_mailtemplate` (
  `idTemplate` bigint(20) NOT NULL,
  `templateName` varchar(250) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `mailContent` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_mailtemplate`
--

INSERT INTO `_mailtemplate` (`idTemplate`, `templateName`, `subject`, `mailContent`) VALUES
(1, 'Order confirmation (to customer)', 'Your order completed', ' Hello {name} \r\nThis is the confirmation email from yourwebsite.com to inform you that we have received your request successfully. Soon you will receive a response from one of our technical support expert. We try to keep our response time as fast as possible but sometime it may take upto 24 hours.\r\nOrder Details \r\n{items}\r\n\r\nRegards,\r\nYOUR BUSINESS NAME\r\nemail: YOUR EMAIL\r\nskype: YOUR SKYPE\r\nWebsite :YOUR WEBSITE'),
(2, 'Order confirmation (to admin)', 'We got new order from yourwebsite.com ', ' Hello Team, \r\n\r\nWe have new order successfully received and please analyze this order and send order confirmation mail asap.\r\nOrder Details \r\n{items}\r\nCustomer Details\r\n{customer}\r\n\r\nRegards,\r\nYOUR BUSINESS NAME\r\nemail: YOUR EMAIL\r\nskype: YOUR SKYPE\r\nWebsite :YOUR WEBSITE'),
(3, 'User request ', 'We have received a requst from customer', ' Hello Team, \r\n We have received a request from customer.\r\n\r\nCustomer Details\r\n{customer}\r\n\r\nRegards,\r\nYOUR BUSINESS NAME\r\nemail: YOUR EMAIL\r\nskype: YOUR SKYPE\r\nWebsite :YOUR WEBSITE');

-- --------------------------------------------------------

--
-- Table structure for table `_options`
--

CREATE TABLE `_options` (
  `idOption` bigint(20) NOT NULL,
  `optionname` varchar(200) NOT NULL,
  `optionPrice` varchar(200) NOT NULL,
  `productImage` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_options`
--

INSERT INTO `_options` (`idOption`, `optionname`, `optionPrice`, `productImage`, `description`) VALUES
(6, 'Dynamic Menus ', '18', '', ''),
(7, 'Commented HTML5 ', '8', '', ''),
(8, 'CSS3 Animations ', '9', '', ''),
(9, 'Jquery Implementation', '9', '', ''),
(10, 'SEO semantic coding', '9', '', ''),
(11, 'Load speed optimization', '9', '', ''),
(12, 'Internet Explorer 8 compatibility ', '19', '', ''),
(13, 'Link all pages', '5', '', ''),
(14, 'CSS3 Animations ', '9', '', ''),
(15, 'Optimized for Retina Displays', '18', '', ''),
(16, 'Commented HTML5', '8', '', ''),
(17, 'Contact Form', '18', '', ''),
(18, 'Slider ', '8', '', ''),
(19, 'Cache Plugin', '9', '', ''),
(20, 'Jquery Implementation', '9', '', ''),
(21, 'Testimonial ', '8', '', ''),
(22, 'Gallery ', '9', '', ''),
(23, 'VirtueMart ', '48', '', ''),
(24, 'JEvents ', '16', '', ''),
(25, 'AdsManager ', '20', '', ''),
(26, 'JCE Editor', '5', '', ''),
(27, 'Newsletter ', '5', '', ''),
(28, 'EasyBlog ', '15', '', ''),
(29, 'Event Booking ', '16', '', ''),
(30, 'Video gallery', '9', '', ''),
(31, 'Contact Enhanced Component', '9', '', ''),
(32, 'PayPal IPN ', '10', '', ''),
(33, 'Backup and Migrate', '10', '', ''),
(34, 'File Upload', '9', '', ''),
(35, 'Statistics ', '5', '', ''),
(36, 'Views Slideshow', '6', '', ''),
(37, 'Multiple Table Rates Extension ', '10', '', ''),
(38, 'AddThis ', '5', '', ''),
(39, 'Magento-Wordpress Integration', '35', '', ''),
(40, 'Product Reviews ', '10', '', ''),
(41, 'Social Commerce Platform ', '13', '', ''),
(42, 'Stock manager', '13', '', ''),
(43, 'Video Gallery', '12', '', ''),
(44, 'Social Login & Sharing ', '12', '', ''),
(45, 'Shipping Module', '8', '', ''),
(46, 'Subscriptions manager ', '12', '', ''),
(47, 'Subscriptions manager ', '12', '', ''),
(48, 'Product rating and review module', '15', '', ''),
(49, 'Newsletter Module', '10', '', ''),
(50, 'Data Migration Module', '12', '', ''),
(51, 'Payment Gateway ', '16', '', ''),
(52, 'Sitemap ', '10', '', ''),
(53, 'Module Manager', '10', '', ''),
(54, 'Product purchase and sales report ', '15', '', ''),
(55, 'Shipping Methods', '20', '', ''),
(56, 'Newsletter Subscription', '10', '', ''),
(57, 'Categories Module', '16', '', ''),
(58, 'Multilanguage ', '15', '', ''),
(59, 'Advanced inventory manager', '15', '', ''),
(60, 'Customer Reviews', '15', '', ''),
(61, 'hello', '22', '', ''),
(62, 'myTes', '333', 'mytest.net', 'hello Test date'),
(63, 'hellooo', '444', 'custom-web-scraping-services.png', 'hellloooooo ooooo'),
(64, 'ehello', '33', 'eBookReaderAndroid.jpg', 'eee'),
(65, 'ehellor', '33', 'web-scraping-services.png', '4'),
(66, 'fff', '33', 'prod_130816100304custom-web-scraping-services.png', '444'),
(67, 'Skype', '300', 'prod_130816062022Thank-You-Payment-Received.jpg', 'Hello world test skype');

-- --------------------------------------------------------

--
-- Table structure for table `_orders`
--

CREATE TABLE `_orders` (
  `idOrder` bigint(20) NOT NULL,
  `customer_details` longtext NOT NULL,
  `cart` longtext NOT NULL,
  `customer_email` varchar(250) NOT NULL,
  `Items` varchar(250) NOT NULL,
  `subTotal` varchar(250) NOT NULL,
  `discount` varchar(250) NOT NULL,
  `total` varchar(250) NOT NULL,
  `orderType` varchar(50) NOT NULL DEFAULT '0',
  `payment_status` varchar(250) NOT NULL,
  `txn_id` varchar(250) NOT NULL,
  `mailStatus` varchar(250) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_orders`
--

INSERT INTO `_orders` (`idOrder`, `customer_details`, `cart`, `customer_email`, `Items`, `subTotal`, `discount`, `total`, `orderType`, `payment_status`, `txn_id`, `mailStatus`, `date`) VALUES
(1, 'Mirza Wajid Ali Baig<br>asim@mail.com<br>+923333908980<br><b>Message</b><br>xzzxzx<br>', '', 'asim@mail.com', '', '$0.00', '$', '$', 'mail', 'NA', 'NA', 'Not sent', '2016-08-18 17:13:52'),
(2, 'Mirza Wajid Ali Baig<br>asim@mail.com<br>+923333908980<br><b>Message</b><br>xzzxzx<br>', '', 'asim@mail.com', '', '$0.00', '$', '$', 'mail', 'NA', 'NA', 'Not sent', '2016-08-18 17:14:04');

-- --------------------------------------------------------

--
-- Table structure for table `_product`
--

CREATE TABLE `_product` (
  `idproduct` bigint(20) NOT NULL,
  `idCategory` bigint(20) NOT NULL,
  `productName` varchar(250) NOT NULL,
  `productDesc` longtext NOT NULL,
  `is_image` int(11) NOT NULL DEFAULT '0' COMMENT '1 for image 2 for icon 0 for none',
  `productImage` varchar(250) NOT NULL,
  `productPrice` double(15,2) NOT NULL,
  `purchaseSummary` longtext NOT NULL,
  `productDate` datetime NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_product`
--

INSERT INTO `_product` (`idproduct`, `idCategory`, `productName`, `productDesc`, `is_image`, `productImage`, `productPrice`, `purchaseSummary`, `productDate`, `status`) VALUES
(1, 1, 'Basic Package', '    (  home page )<br/>\r\n<p class=high-cont>$49 - per inner page</p>\r\n<p>W3C Valid HTML5, Optimized CSS3,\r\nCustom Fonts</p>', 0, '', 89.00, ' Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '0000-00-00 00:00:00', '0'),
(2, 1, 'Hi-End Package', '<p>   ( home page ) </p>\r\n<p class=high-cont>$49 - per inner page</p>\r\n                    <p><strong>Basic Package +</strong> <br>Responsive Bootstrap, SEO, Speed Optimization</p>', 0, '', 129.00, ' Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '0000-00-00 00:00:00', '0'),
(3, 2, 'WordPress', 'WordPress details', 2, 'fa fa-wordpress', 190.00, ' Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '0000-00-00 00:00:00', '0'),
(4, 2, 'Joomla', ' Joomla Details', 2, 'fa fa-joomla', 185.00, ' Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '0000-00-00 00:00:00', '0'),
(5, 2, 'Drupal', 'Drupal details', 2, 'fa fa-drupal', 199.00, ' Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '0000-00-00 00:00:00', '0'),
(6, 2, 'Magento', ' Magento details', 2, 'fa fa-magento', 350.00, ' Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '0000-00-00 00:00:00', '0'),
(13, 2, 'Shopify', ' Shopify Details', 2, 'fa-shopify', 300.00, ' ', '0000-00-00 00:00:00', '0'),
(14, 2, 'Prestashop', 'Prestashop details', 2, 'fa-prestashop', 260.00, ' ', '0000-00-00 00:00:00', '0'),
(15, 2, 'Opencart', ' Opencart Details', 2, 'fa-opencart', 250.00, ' ', '0000-00-00 00:00:00', '0'),
(16, 2, 'Virtuemart', ' ', 2, 'fa-virtuemart', 256.00, ' ', '0000-00-00 00:00:00', '0'),
(17, 2, 'test', 'heh ', 1, 'prod_130816094747CRBONV6.png', 3.00, ' jj', '0000-00-00 00:00:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `_product_options`
--

CREATE TABLE `_product_options` (
  `idProductoption` bigint(20) NOT NULL,
  `idOption` bigint(20) NOT NULL,
  `idProduct` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_product_options`
--

INSERT INTO `_product_options` (`idProductoption`, `idOption`, `idProduct`) VALUES
(37, 17, 3),
(38, 18, 3),
(39, 19, 3),
(40, 20, 3),
(41, 21, 3),
(42, 22, 3),
(53, 17, 4),
(54, 23, 4),
(55, 24, 4),
(56, 25, 4),
(57, 26, 4),
(58, 27, 4),
(59, 28, 4),
(60, 29, 4),
(61, 30, 4),
(62, 31, 4),
(63, 28, 5),
(64, 32, 5),
(65, 33, 5),
(66, 34, 5),
(67, 35, 5),
(68, 36, 5),
(74, 17, 6),
(75, 36, 6),
(76, 37, 6),
(77, 38, 6),
(78, 39, 6),
(86, 17, 13),
(87, 40, 13),
(88, 41, 13),
(89, 42, 13),
(90, 43, 13),
(91, 44, 13),
(92, 45, 13),
(93, 28, 14),
(94, 47, 14),
(95, 48, 14),
(96, 49, 14),
(97, 50, 14),
(98, 49, 15),
(99, 51, 15),
(100, 52, 15),
(101, 53, 15),
(102, 54, 15),
(103, 55, 15),
(104, 49, 16),
(105, 57, 16),
(106, 58, 16),
(107, 59, 16),
(108, 60, 16),
(137, 12, 2),
(138, 13, 2),
(139, 14, 2),
(140, 15, 2),
(141, 16, 2),
(148, 6, 1),
(149, 7, 1),
(150, 8, 1),
(151, 9, 1),
(152, 10, 1),
(153, 11, 1),
(154, 61, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `_administrator`
--
ALTER TABLE `_administrator`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `_category`
--
ALTER TABLE `_category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indexes for table `_cms`
--
ALTER TABLE `_cms`
  ADD PRIMARY KEY (`idCms`);

--
-- Indexes for table `_coupon`
--
ALTER TABLE `_coupon`
  ADD PRIMARY KEY (`idCoupon`);

--
-- Indexes for table `_coupon_products`
--
ALTER TABLE `_coupon_products`
  ADD PRIMARY KEY (`idProductcoupon`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idCoupon` (`idCoupon`);

--
-- Indexes for table `_currency`
--
ALTER TABLE `_currency`
  ADD PRIMARY KEY (`idCurrency`);

--
-- Indexes for table `_mailtemplate`
--
ALTER TABLE `_mailtemplate`
  ADD PRIMARY KEY (`idTemplate`);

--
-- Indexes for table `_options`
--
ALTER TABLE `_options`
  ADD PRIMARY KEY (`idOption`);

--
-- Indexes for table `_orders`
--
ALTER TABLE `_orders`
  ADD PRIMARY KEY (`idOrder`);

--
-- Indexes for table `_product`
--
ALTER TABLE `_product`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `idCategory` (`idCategory`),
  ADD KEY `idCategory_2` (`idCategory`);

--
-- Indexes for table `_product_options`
--
ALTER TABLE `_product_options`
  ADD PRIMARY KEY (`idProductoption`),
  ADD KEY `idOption` (`idOption`),
  ADD KEY `idProduct` (`idProduct`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `_administrator`
--
ALTER TABLE `_administrator`
  MODIFY `idAdmin` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `_category`
--
ALTER TABLE `_category`
  MODIFY `idCategory` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `_cms`
--
ALTER TABLE `_cms`
  MODIFY `idCms` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_coupon`
--
ALTER TABLE `_coupon`
  MODIFY `idCoupon` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_coupon_products`
--
ALTER TABLE `_coupon_products`
  MODIFY `idProductcoupon` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_currency`
--
ALTER TABLE `_currency`
  MODIFY `idCurrency` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;
--
-- AUTO_INCREMENT for table `_mailtemplate`
--
ALTER TABLE `_mailtemplate`
  MODIFY `idTemplate` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `_options`
--
ALTER TABLE `_options`
  MODIFY `idOption` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `_orders`
--
ALTER TABLE `_orders`
  MODIFY `idOrder` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `_product`
--
ALTER TABLE `_product`
  MODIFY `idproduct` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `_product_options`
--
ALTER TABLE `_product_options`
  MODIFY `idProductoption` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `_coupon_products`
--
ALTER TABLE `_coupon_products`
  ADD CONSTRAINT `_coupon_products_ibfk_2` FOREIGN KEY (`idCoupon`) REFERENCES `_coupon` (`idCoupon`) ON DELETE CASCADE,
  ADD CONSTRAINT `_coupon_products_ibfk_3` FOREIGN KEY (`idProduct`) REFERENCES `_product` (`idproduct`) ON DELETE CASCADE;

--
-- Constraints for table `_product`
--
ALTER TABLE `_product`
  ADD CONSTRAINT `_product_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `_category` (`idCategory`) ON DELETE CASCADE;

--
-- Constraints for table `_product_options`
--
ALTER TABLE `_product_options`
  ADD CONSTRAINT `_product_options_ibfk_1` FOREIGN KEY (`idOption`) REFERENCES `_options` (`idOption`) ON DELETE CASCADE,
  ADD CONSTRAINT `_product_options_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `_product` (`idproduct`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
