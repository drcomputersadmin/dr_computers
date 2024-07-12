-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 12, 2024 at 05:54 PM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rcompute_drc_accounting`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('47f014a7af47fdc666d19de4c6375daacfe3697d', '31.219.159.39', 1720705224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732303730353232343b),
('1cd7edb494e94ccc8fd84e1188fb3ae286f9cefe', '217.164.154.197', 1720786336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732303738363333363b);

-- --------------------------------------------------------

--
-- Table structure for table `db_brands`
--

CREATE TABLE `db_brands` (
  `id` int(50) NOT NULL,
  `brand_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_brands`
--

INSERT INTO `db_brands` (`id`, `brand_code`, `brand_name`, `description`, `company_id`, `status`) VALUES
(3, 'CT0001', 'brand1', '', NULL, 1),
(4, 'CT0004', 'CK', 'PERFUME', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_category`
--

CREATE TABLE `db_category` (
  `id` int(50) NOT NULL,
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_category`
--

INSERT INTO `db_category` (`id`, `category_code`, `category_name`, `description`, `company_id`, `status`) VALUES
(10, 'CT0001', 'items do', '', NULL, 1),
(11, 'CT0011', 'PERFUME', 'BRANDED', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_ci_sessions`
--

CREATE TABLE `db_ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_ci_sessions`
--

INSERT INTO `db_ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('e6880995b30fc07105f1f0cad22c74e339c4237f', '199.45.154.22', 1716870582, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731363837303538323b),
('2340e6c64e30edd3ac76e4dfbd69eff8d5087aa4', '176.205.170.20', 1716875087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731363837353037393b696e765f757365726e616d657c733a353a2261646d696e223b696e765f7573657269647c733a313a2231223b6c6f676765645f696e7c623a313b726f6c655f69647c733a313a2231223b726f6c655f6e616d657c733a353a2241646d696e223b737563636573737c733a31353a2257656c636f6d652041646d696e2021223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d63757272656e63797c733a333a22414544223b63757272656e63795f706c6163656d656e747c733a343a224c656674223b63757272656e63795f636f64657c733a303a22223b766965775f646174657c733a31303a2264642d6d6d2d79797979223b766965775f74696d657c733a323a223132223b6c616e67756167657c733a373a22456e676c697368223b6c616e67756167655f69647c733a313a2231223b);

-- --------------------------------------------------------

--
-- Table structure for table `db_cobpayments`
--

CREATE TABLE `db_cobpayments` (
  `id` int(50) NOT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_company`
--

CREATE TABLE `db_company` (
  `id` int(50) NOT NULL,
  `company_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_website` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` text COLLATE utf8mb4_unicode_ci,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci,
  `upi_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_code` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` mediumtext COLLATE utf8mb4_unicode_ci,
  `cid` int(10) DEFAULT NULL,
  `category_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `supplier_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_view` int(5) DEFAULT NULL COMMENT '1=Standard,2=Indian GST',
  `status` int(1) DEFAULT NULL,
  `sms_status` int(1) DEFAULT NULL COMMENT '1=Enable 0=Disable',
  `sales_terms_and_conditions` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_company`
--

INSERT INTO `db_company` (`id`, `company_code`, `company_name`, `company_website`, `mobile`, `phone`, `email`, `website`, `company_logo`, `logo`, `upi_id`, `upi_code`, `country`, `state`, `city`, `address`, `postcode`, `gst_no`, `vat_no`, `pan_no`, `bank_details`, `cid`, `category_init`, `item_init`, `supplier_init`, `purchase_init`, `purchase_return_init`, `customer_init`, `sales_init`, `sales_return_init`, `expense_init`, `invoice_view`, `status`, `sms_status`, `sales_terms_and_conditions`) VALUES
(1, '', 'Dr. Computes', NULL, '971562346398', '', 'info@drcomputers.ae', 'https://drcomputers.ae', 'Untitled_design_(4).png', 'logo-0.png', '', '1.jpg', 'United Arab Emirates', 'Dubai', 'Oud Metha', 'Bin Dhahi umm Hurair Building\r\nArabian Business Centre\r\nOffice 17', '', '', '', '', '', 1, 'CT', 'IT', 'SP', 'PU', 'PR', 'CU', 'INV', 'PR', 'EX', 1, 1, 0, 'Commercial Terms and Condition:\r\n\r\n1) Pricing All prices are in UAE Dirhams. VAT 5% include \r\n2) Payment Terms Payment 50?vance, 30% on delivery, 20 on completion.\r\n3) Validity Proposal valid for a period of 7 Days from the date of issue.\r\n4) Pre-requisites Orders once placed cannot be cancelled as the Manufacturers are paid in advance by us.\r\n5) Any products whic is not mentioned in this quotation will charge extra.\r\n6) Any products which are mentioned in this quote and it will not used while installing will deduct from final invoice \r\n7) Installations is one time installation \r\n8) Warranty of the products are depends upon brand warranty that is one year. \r\n\r\nKindly requested to let us have your valuable acceptance of above quote and order confirmation so as to schedule the work and resources accordingly. Please do not hesitate to contact us if you require any further clarification / discussion in regards. \r\n');

-- --------------------------------------------------------

--
-- Table structure for table `db_country`
--

CREATE TABLE `db_country` (
  `id` int(50) NOT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_country`
--

INSERT INTO `db_country` (`id`, `country_code`, `country`, `added_on`, `company_id`, `status`) VALUES
(5, NULL, 'United Arab Emirates', NULL, NULL, 1),
(6, NULL, 'India', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_currency`
--

CREATE TABLE `db_currency` (
  `id` int(50) NOT NULL,
  `currency_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` blob,
  `symbol` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_currency`
--

INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES
(1, 'Bulgaria-Bulgarian lev(BGN)', NULL, 0xc390c2bbc390c2b2, NULL, 1),
(2, 'Switzerland \r-Swiss franc (CHF)', NULL, 0x434846, NULL, 1),
(3, 'Czechia-Czech koruna(CZK))', NULL, 0x4bc384c28d20, NULL, 1),
(4, 'Denmark-Danish krone(DKK)', NULL, 0x6b7220, NULL, 1),
(5, 'Euro area countries -Euro(EUR)', NULL, 0xc3a2e2809ac2ac20, NULL, 1),
(6, 'United Kingdom-Pounds sterling (GBP)', NULL, 0xc382c2a3, NULL, 1),
(7, 'Croatia -Croatian Kuna (HRK)', NULL, 0x6b6e, NULL, 1),
(8, 'Georgia -Georgian lari (GEL)', NULL, 0x2623383338323b, NULL, 1),
(9, 'Hungary -Hungarian forint (HUF)', NULL, 0x6674, NULL, 1),
(10, 'Norway -Norwegian krone (NOK)', NULL, 0x6b72, NULL, 1),
(11, 'Poland -Polish zloty (PLN)', NULL, 0x7ac385e2809a20, NULL, 1),
(12, 'Russia -Russian ruble (RUB)', NULL, 0x2623383338313b20, NULL, 1),
(13, 'Romania -Romanian leu (RON)', NULL, 0x6c6569, NULL, 1),
(14, 'Sweden - Swedish krona (SEK)', NULL, 0x6b72, NULL, 1),
(15, 'Turkey -Turkish lira (TRY)', NULL, 0x2623383337383b20, NULL, 1),
(16, 'Ukraine - Ukrainian hryvna  (UAH)', NULL, 0xc3a2e2809ac2b420, NULL, 1),
(17, 'UAE -Emirati dirham (AED)', '', 0x414544, NULL, 1),
(18, 'Israel - Israeli shekel (ILS)', NULL, 0x2623383336323b20, NULL, 1),
(19, 'Kenya - Kenyan shilling(KES)', NULL, 0x4b7368, NULL, 1),
(20, 'Morocco - Moroccan dirham (MAD)', NULL, 0x2ec398c2af2ec399e280a620, NULL, 1),
(21, 'Nigeria - Nigerian naira (NGN)', NULL, 0xc3a2e2809ac2a620, NULL, 1),
(22, 'South Africa -South african rand** (ZAR)', NULL, 0x52, NULL, 1),
(23, 'Brazil- Brazilian real(BRL)', NULL, 0x5224, NULL, 1),
(24, 'Canada-Canadian dollars (CAD)', NULL, 0x24, NULL, 1),
(25, 'Chile -Chilean peso (CLP)', NULL, 0x24, NULL, 1),
(26, 'Colombia -Colombian peso (COP)', NULL, 0x24, NULL, 1),
(27, 'Mexico - Mexican peso (MXN)', NULL, 0x24, NULL, 1),
(28, 'Peru -Peruvian sol(PEN)', NULL, 0x532f2e20, NULL, 1),
(29, 'USA -US dollar (USD)', NULL, 0x24, NULL, 1),
(30, 'Australia -Australian dollars (AUD)', NULL, 0x24, NULL, 1),
(31, 'Bangladesh -Bangladeshi taka (BDT) ', NULL, 0x2623323534373b20, NULL, 1),
(32, 'China - Chinese yuan (CNY)', NULL, 0x262332303830333b20, NULL, 1),
(33, 'Hong Kong - Hong Kong dollar(HKD)', NULL, 0x262333363b20, NULL, 1),
(34, 'Indonesia - Indonesian rupiah (IDR)', NULL, 0x5270, NULL, 1),
(35, 'India - Indian rupee', 'INR', 0xc3a2e2809ac2b9, '?', 1),
(36, 'Japan - Japanese yen (JPY)', NULL, 0xc382c2a5, NULL, 1),
(37, 'Malaysia - Malaysian ringgit (MYR)', NULL, 0x524d, NULL, 1),
(38, 'New Zealand - New Zealand dollar (NZD)', NULL, 0x24, NULL, 1),
(39, 'Philippines- Philippine peso (PHP)', NULL, 0xc3a2e2809ac2b120, NULL, 1),
(40, 'Pakistan- Pakistani rupee (PKR)', NULL, 0x527320, NULL, 1),
(41, 'Singapore - Singapore dollar (SGD)', NULL, 0x24, NULL, 1),
(42, 'South Korea - South Korean won (KRW)', NULL, 0x2623383336313b20, NULL, 1),
(43, 'Sri Lanka - Sri Lankan rupee (LKR)', NULL, 0x5273, NULL, 1),
(44, 'Thailand- Thai baht (THB)', NULL, 0x2623333634373b20, NULL, 1),
(45, 'Vietnam - Vietnamese dong', 'VND', 0xc3a2e2809ac2ab, NULL, 1),
(46, 'Bitcoin - BTC or XBT', 'BTC ', 0xc3a2e2809ac2bf, NULL, 1),
(47, 'Ripples', 'XRP', 0x585250, NULL, 1),
(48, 'Monero', 'XMR', 0xc389c2b1, NULL, 1),
(49, 'Litecoin', 'LTC', 0xc385c281, NULL, 1),
(50, 'Ethereum', 'ETH', 0xc38ec5be, NULL, 1),
(51, 'Euro', 'EUR', 0xc3a2e2809ac2ac, NULL, 1),
(52, 'Pounds sterling', 'GBP', 0xc382c2a3, NULL, 1),
(53, 'US dollar', 'USD', 0x24, NULL, 1),
(54, 'Japanese yen', 'JPY', 0xc382c2a5, NULL, 1),
(55, 'Omani rial', 'OMR', 0xc398c2b12ec398c2b92e, NULL, 1),
(56, 'Tanzania Shillings', 'Tzs', 0x547a73, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_customers`
--

CREATE TABLE `db_customers` (
  `id` int(50) NOT NULL,
  `customer_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(20,2) DEFAULT NULL,
  `sales_due` double(20,2) DEFAULT NULL,
  `sales_return_due` double(20,2) DEFAULT NULL,
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_customers`
--

INSERT INTO `db_customers` (`id`, `customer_code`, `customer_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `sales_due`, `sales_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`) VALUES
(1, 'CU0001', 'Walk-in customer', '', '', '', '', '', NULL, NULL, 8700.00, NULL, '1', '1', NULL, '', '', NULL, NULL, '2019-01-01', '10:55:54 pm', 'admin', NULL, 1),
(11, 'CU0002', 'Suhail', '5464585', '12345678', 'abc@gmail.com', '', '000000000000', NULL, 0.00, 3450.00, NULL, '5', '58', 'dubai', '000', 'Dubai ,UAE', '217.165.190.94', 'bba-217-165-190-94.alshamil.net.ae', '2024-05-02', '09:30:14 am', 'admin', NULL, 1),
(12, 'CU0012', 'Muhammad', '012345678', '102354789', 'a@gmail.com', '', '1234567', NULL, 0.00, 0.00, NULL, '5', '57', 'Abudhabi', '000', '', '::1', 'DESKTOP-A9ES73H', '2024-06-07', '03:06:20 pm', 'admin', NULL, 1),
(13, 'CU0013', 'fathima', '11235455445', '2444424789', 'abc@gmail.com', '', '', NULL, 0.00, 0.00, NULL, '5', NULL, '', '', '', '::1', 'DESKTOP-A9ES73H', '2024-06-07', '03:10:09 pm', 'admin', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_customer_payments`
--

CREATE TABLE `db_customer_payments` (
  `id` int(50) NOT NULL,
  `salespayment_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` text,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_customer_payments`
--

INSERT INTO `db_customer_payments` (`id`, `salespayment_id`, `customer_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`) VALUES
(68, 12, 11, '2024-06-06', 'Cash', 600.00, '', '::1', 'DESKTOP-A9ES73H', '03:22:40', '2024-06-06', 'admin', 1),
(84, 9, 1, '2024-06-05', 'Card', 3840.00, 'recieved', '::1', 'DESKTOP-A9ES73H', '11:48:34', '2024-06-05', 'admin', 1),
(85, 10, 1, '2024-06-05', 'Cash', 1250.00, '', '::1', 'DESKTOP-A9ES73H', '11:50:13', '2024-06-05', 'admin', 1),
(86, 11, 1, '2024-06-05', 'Cash', 4000.00, 'Recieved', '::1', 'DESKTOP-A9ES73H', '11:52:26', '2024-06-05', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_delivery_notes`
--

CREATE TABLE `db_delivery_notes` (
  `id` int(11) NOT NULL,
  `delivery_code` varchar(50) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `sales_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `delivery_status` varchar(50) NOT NULL,
  `delivery_address` text NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `delivery_note` text,
  `created_date` date NOT NULL,
  `created_time` time NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_delivery_notes`
--

INSERT INTO `db_delivery_notes` (`id`, `delivery_code`, `reference_no`, `delivery_date`, `sales_id`, `customer_id`, `warehouse_id`, `delivery_status`, `delivery_address`, `contact_person`, `contact_phone`, `delivery_note`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`, `signature`) VALUES
(3, 'INV0036', '555', '2024-06-05', 35, 11, 0, 'Delivered', 'Dubai ,UAE', 'Dubai ,UAE', '12345678', 'dfsfddff', '2024-06-05', '12:59:05', '0', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(4, 'INV0036', '555', '2024-06-05', 35, 11, 0, 'Delivered', 'Dubai ,UAE', 'Dubai ,UAE', '12345678', 'test', '2024-06-05', '04:55:10', '0', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(5, 'INV0036', '555', '2024-06-05', 33, 1, 0, 'Process', '', '', '', 'asdfdadaf', '2024-06-05', '05:01:28', '0', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(6, 'INV0036', '8745', '2024-06-06', 32, 1, 0, 'Process', '', '', '', 'Please ensure that all items are checked for damage upon receipt. Any damages should be reported immediately to our customer service team.', '2024-06-06', '12:38:22', '0', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(7, 'DN0039', '05555', '2024-06-07', 38, 11, 0, 'Delivered', 'Dubai ,UAE', 'Dubai ,UAE', '12345678', 'Please ensure that all items are checked for damage upon receipt. Any damages should be reported immediately to our customer service team.', '2024-06-07', '06:09:19', '0', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(8, 'DN0039', '05555', '2024-06-21', 38, 11, 0, 'Process', 'Dubai ,UAE', 'Dubai ,UAE', '12345678', ' ', '2024-06-21', '04:22:14', '0', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(9, 'DN0039', '', '2024-06-21', 37, 11, 0, 'Process', 'Dubai ,UAE', 'Dubai ,UAE', '12345678', ' ', '2024-06-21', '04:48:06', '0', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(10, 'DN0039', '', '2024-06-21', 36, 1, 0, 'Process', '', '', '', ' ', '2024-06-21', '04:49:35', '0', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(11, 'DN0040', '52225', '2024-06-21', 39, 13, 0, 'Process', '', '', '2444424789', 'hello', '2024-06-21', '04:55:32', '1', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(12, 'DN0040', '895', '2024-06-21', 34, 11, 0, 'Process', 'Dubai ,UAE', 'Dubai ,UAE', '12345678', ' ', '2024-06-21', '04:59:34', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(13, 'DN0041', '52225', '2024-06-21', 40, 1, 0, 'Process', '', '', '', ' ', '2024-06-21', '06:33:35', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(14, 'DN0041', '85858', '2024-06-21', 31, 1, 0, 'Process', '', '', '', ' ', '2024-06-21', '06:33:43', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(15, 'DN0042', '252', '2024-06-21', 41, 1, 0, 'Process', '', '', '', ' ', '2024-06-21', '06:34:07', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(16, 'DN0016', '14589', '2024-06-21', 42, 1, 0, 'Process', '', '', '', ' ', '2024-06-21', '06:47:51', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(17, 'DN0017', '252', '2024-06-21', 43, 1, 0, 'Process', '', '', '', ' ', '2024-06-21', '06:48:09', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_delivery_note_items`
--

CREATE TABLE `db_delivery_note_items` (
  `id` int(11) NOT NULL,
  `delivery_note_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` text,
  `delivery_qty` int(11) NOT NULL,
  `price_per_unit` decimal(10,2) DEFAULT NULL,
  `tax_type` varchar(50) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_amt` decimal(10,2) DEFAULT NULL,
  `discount_type` varchar(50) DEFAULT NULL,
  `discount_input` decimal(10,2) DEFAULT NULL,
  `discount_amt` decimal(10,2) DEFAULT NULL,
  `unit_total_cost` decimal(10,2) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `delivery_status` varchar(50) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_delivery_note_items`
--

INSERT INTO `db_delivery_note_items` (`id`, `delivery_note_id`, `item_id`, `description`, `delivery_qty`, `price_per_unit`, `tax_type`, `tax_id`, `tax_amt`, `discount_type`, `discount_input`, `discount_amt`, `unit_total_cost`, `total_cost`, `status`, `purchase_price`, `delivery_status`, `delivery_date`) VALUES
(4, 6, 3, '', 10, 256.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 256.00, 2560.00, NULL, 256.00, 'delivered', NULL),
(5, 7, 8, '', 4, 800.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 800.00, 3200.00, NULL, 800.00, 'delivered', NULL),
(6, 8, 8, '', 4, 800.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 800.00, 3200.00, NULL, 800.00, 'delivered', NULL),
(7, 9, 3, '', 2, 300.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 300.00, 600.00, NULL, 256.00, 'delivered', NULL),
(8, 10, 3, '', 2, 300.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 300.00, 600.00, NULL, 256.00, 'delivered', NULL),
(9, 10, 3, '', 2, 300.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 300.00, 600.00, NULL, 256.00, 'delivered', NULL),
(10, 11, 2, '', 1, 300.00, 'Exclusive', 2, 15.00, 'Percentage', NULL, 0.00, 315.00, 315.00, NULL, 105.00, 'delivered', NULL),
(11, 11, 5, '', 4, 25.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 25.00, 100.00, NULL, 25.00, 'delivered', NULL),
(12, 12, 3, '', 1, 250.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 250.00, 250.00, NULL, 256.00, 'delivered', NULL),
(13, 13, 5, '', 3, 25.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 25.00, 75.00, NULL, 25.00, 'delivered', NULL),
(14, 14, 3, '', 20, 200.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 200.00, 4000.00, NULL, 256.00, 'delivered', NULL),
(15, 15, 9, '', 3, 250.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 250.00, 750.00, NULL, 250.00, 'delivered', NULL),
(16, 16, 8, '', 3, 800.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 800.00, 2400.00, NULL, 800.00, 'delivered', NULL),
(17, 16, 8, '', 4, 800.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 800.00, 3200.00, NULL, 800.00, 'delivered', NULL),
(18, 17, 5, '', 3, 25.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 25.00, 75.00, NULL, 25.00, 'delivered', NULL),
(19, 17, 9, '', 4, 250.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 250.00, 1000.00, NULL, 250.00, 'delivered', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_expense`
--

CREATE TABLE `db_expense` (
  `id` int(50) NOT NULL,
  `expense_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_amt` double(20,2) DEFAULT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_expense_category`
--

CREATE TABLE `db_expense_category` (
  `id` int(50) NOT NULL,
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_expense_category`
--

INSERT INTO `db_expense_category` (`id`, `category_code`, `category_name`, `description`, `created_by`, `status`) VALUES
(12, 'EC0001', 'Fuel', 'Vehicle Fuel', 'drcdemo', 1),
(13, 'EC0013', 'SALARY', '', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_hold`
--

CREATE TABLE `db_hold` (
  `id` int(50) NOT NULL,
  `reference_id` varchar(50) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_status` varchar(50) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `sales_note` text,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `db_holditems`
--

CREATE TABLE `db_holditems` (
  `id` int(50) NOT NULL,
  `hold_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_items`
--

CREATE TABLE `db_items` (
  `id` int(50) NOT NULL,
  `item_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_barcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn` varbinary(50) DEFAULT NULL,
  `unit_id` int(10) DEFAULT NULL,
  `alert_qty` int(10) DEFAULT NULL,
  `brand_id` int(5) DEFAULT NULL,
  `lot_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `price` double(20,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit_margin` double(20,2) DEFAULT NULL,
  `sales_price` double(20,2) DEFAULT NULL,
  `final_price` double(20,2) DEFAULT NULL,
  `stock` double(20,2) DEFAULT NULL,
  `item_image` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `discount_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_items`
--

INSERT INTO `db_items` (`id`, `item_code`, `custom_barcode`, `item_name`, `description`, `category_id`, `sku`, `hsn`, `unit_id`, `alert_qty`, `brand_id`, `lot_number`, `expire_date`, `price`, `tax_id`, `purchase_price`, `tax_type`, `profit_margin`, `sales_price`, `final_price`, `stock`, `item_image`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`, `discount_type`, `discount`) VALUES
(3, 'IT0003', '123456789', 'Shirt', 'Blue Shirt', 10, '22222', '', 7, 40, 3, '256', '2024-05-14', 256.00, 1, 256.00, 'Exclusive', 0.00, 0.00, 0.00, 34.00, 'uploads/items/1716895846.jpg', '::1', 'DESKTOP-A9ES73H', '2024-05-28', '03:30:46 pm', 'admin', NULL, 1, 'Percentage', 0.00),
(4, 'IT0004', '', 'pants', '', 10, '', '', 10, 25, 3, '', NULL, 500.00, 2, 525.00, 'Exclusive', NULL, 525.00, 551.25, 0.00, NULL, '::1', 'DESKTOP-A9ES73H', '2024-06-07', '03:00:22 pm', 'admin', NULL, 1, '', 0.00),
(5, 'IT0005', '', 'Note Book', '', 10, '', '', 7, 25, 3, '', NULL, 25.00, 1, 25.00, 'Exclusive', NULL, 25.00, 25.00, -10.00, NULL, '::1', 'DESKTOP-A9ES73H', '2024-06-07', '03:05:20 pm', 'admin', NULL, 1, '', 0.00),
(6, 'IT0006', '', 'Bag', '', 10, '', '', 10, 25, 4, '', NULL, 850.00, 1, 850.00, 'Exclusive', NULL, 850.00, 850.00, 0.00, NULL, '::1', 'DESKTOP-A9ES73H', '2024-06-07', '03:06:51 pm', 'admin', NULL, 1, '', 0.00),
(7, 'IT0007', '', 'Pencil', '', 10, '', '', 10, 25, 4, '', NULL, 850.00, 1, 850.00, 'Exclusive', NULL, 850.00, 850.00, 0.00, NULL, '::1', 'DESKTOP-A9ES73H', '2024-06-07', '03:07:23 pm', 'admin', NULL, 1, '', 0.00),
(8, 'IT0008', '', 'Pen', '', 10, '', '', 9, 25, 4, '', NULL, 800.00, 1, 800.00, 'Exclusive', NULL, 800.00, 800.00, -11.00, NULL, '::1', 'DESKTOP-A9ES73H', '2024-06-07', '03:15:36 pm', 'admin', NULL, 1, '', 0.00),
(9, 'IT0009', '', 'Car', '', 0, '', '', 0, 25, 4, '', NULL, 250.00, 1, 250.00, 'Exclusive', NULL, 250.00, 250.00, -7.00, NULL, '::1', 'DESKTOP-A9ES73H', '2024-06-07', '03:20:31 pm', 'admin', NULL, 1, '', 0.00),
(10, 'IT0010', '', 'Shirt', '', 10, '', '', 7, 45, 3, '', NULL, 250.00, 2, 250.00, 'Inclusive', 25.00, 312.50, 312.50, 0.00, 'uploads/items/1718970668.png', '::1', 'DESKTOP-A9ES73H', '2024-06-21', '03:51:08 pm', 'admin', NULL, 1, '', 0.00),
(11, 'IT0011', '', 'shoes', '', 11, '', '', 9, 25, 4, '', NULL, 25.00, 1, 25.00, 'Inclusive', 25.00, 31.25, 31.25, 0.00, 'uploads/items/1718970709.png', '::1', 'DESKTOP-A9ES73H', '2024-06-21', '03:51:49 pm', 'admin', NULL, 1, '', 0.00),
(12, 'IT0012', '', 'tissue Box', '', 11, '', '', 7, 25, 4, '', NULL, 25.00, 1, 25.00, 'Exclusive', 25.00, 31.25, 31.25, 0.00, 'uploads/items/1718971198.jpg', '::1', 'DESKTOP-A9ES73H', '2024-06-21', '03:59:58 pm', 'admin', NULL, 1, '', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `db_languages`
--

CREATE TABLE `db_languages` (
  `id` int(50) NOT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_languages`
--

INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES
(1, 'English', 1),
(2, 'Hindi', 1),
(3, 'Kannada', 1),
(4, 'Indonesian', 1),
(5, 'Chinese', 1),
(6, 'Russian', 1),
(7, 'Spanish', 1),
(8, 'Arabic', 1),
(9, 'Albanian', 1),
(10, 'Dutch', 1),
(11, 'Bangla', 1),
(12, 'Urdu', 1),
(13, 'Italian', 1),
(14, 'Marathi', 1),
(15, 'Khmer', 1),
(16, 'French', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_paymenttypes`
--

CREATE TABLE `db_paymenttypes` (
  `id` int(50) NOT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_paymenttypes`
--

INSERT INTO `db_paymenttypes` (`id`, `payment_type`, `status`) VALUES
(1, 'Cash', 1),
(2, 'Card', 1),
(4, 'Finance', 1),
(5, 'CRDB Bank', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_permissions`
--

CREATE TABLE `db_permissions` (
  `id` int(50) NOT NULL,
  `role_id` int(5) DEFAULT NULL,
  `permissions` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_permissions`
--

INSERT INTO `db_permissions` (`id`, `role_id`, `permissions`) VALUES
(198, 4, 'users_edit'),
(199, 4, 'users_view'),
(200, 4, 'expense_view'),
(201, 4, 'items_view'),
(202, 4, 'suppliers_view'),
(203, 4, 'customers_view'),
(204, 4, 'purchase_view'),
(205, 4, 'sales_view'),
(206, 4, 'sales_payment_view'),
(207, 4, 'sales_report'),
(208, 4, 'purchase_report'),
(209, 4, 'expense_report'),
(210, 4, 'profit_report'),
(211, 4, 'stock_report'),
(212, 4, 'item_sales_report'),
(213, 4, 'purchase_payments_report'),
(214, 4, 'sales_payments_report'),
(215, 4, 'expired_items_report'),
(216, 4, 'items_category_view'),
(217, 4, 'print_labels'),
(218, 4, 'import_items'),
(219, 4, 'expense_category_view'),
(220, 4, 'dashboard_view'),
(221, 4, 'purchase_return_view'),
(222, 4, 'purchase_return_report'),
(223, 4, 'sales_return_view'),
(224, 4, 'sales_return_report'),
(225, 4, 'sales_return_payment_view'),
(226, 4, 'purchase_return_payment_view'),
(227, 4, 'purchase_payment_view'),
(228, 4, 'item_purchase_report'),
(229, 2, 'items_add'),
(230, 2, 'items_edit'),
(231, 2, 'items_view'),
(232, 2, 'brand_add'),
(233, 2, 'brand_edit'),
(234, 2, 'brand_view'),
(235, 2, 'suppliers_add'),
(236, 2, 'suppliers_edit'),
(237, 2, 'suppliers_view'),
(238, 2, 'customers_add'),
(239, 2, 'customers_edit'),
(240, 2, 'customers_view'),
(241, 2, 'purchase_add'),
(242, 2, 'purchase_edit'),
(243, 2, 'purchase_delete'),
(244, 2, 'purchase_view'),
(245, 2, 'sales_add'),
(246, 2, 'sales_edit'),
(247, 2, 'sales_delete'),
(248, 2, 'sales_view'),
(249, 2, 'sales_payment_view'),
(250, 2, 'sales_payment_add'),
(251, 2, 'sales_payment_delete'),
(252, 2, 'sales_report'),
(253, 2, 'purchase_report'),
(254, 2, 'expense_report'),
(255, 2, 'profit_report'),
(256, 2, 'stock_report'),
(257, 2, 'item_sales_report'),
(258, 2, 'purchase_payments_report'),
(259, 2, 'sales_payments_report'),
(260, 2, 'expired_items_report'),
(261, 2, 'items_category_add'),
(262, 2, 'items_category_edit'),
(263, 2, 'items_category_view'),
(264, 2, 'print_labels'),
(265, 2, 'import_items'),
(266, 2, 'dashboard_view'),
(267, 2, 'purchase_return_add'),
(268, 2, 'purchase_return_edit'),
(269, 2, 'purchase_return_delete'),
(270, 2, 'purchase_return_view'),
(271, 2, 'purchase_return_report'),
(272, 2, 'sales_return_add'),
(273, 2, 'sales_return_edit'),
(274, 2, 'sales_return_delete'),
(275, 2, 'sales_return_view'),
(276, 2, 'sales_return_report'),
(277, 2, 'sales_return_payment_view'),
(278, 2, 'sales_return_payment_add'),
(279, 2, 'sales_return_payment_delete'),
(280, 2, 'purchase_return_payment_view'),
(281, 2, 'purchase_return_payment_add'),
(282, 2, 'purchase_return_payment_delete'),
(283, 2, 'purchase_payment_view'),
(284, 2, 'purchase_payment_add'),
(285, 2, 'purchase_payment_delete'),
(286, 2, 'import_customers'),
(287, 2, 'import_suppliers'),
(288, 2, 'item_purchase_report'),
(574, 3, 'users_edit'),
(575, 3, 'users_view'),
(576, 3, 'tax_add'),
(577, 3, 'tax_edit'),
(578, 3, 'tax_view'),
(579, 3, 'expense_add'),
(580, 3, 'expense_edit'),
(581, 3, 'expense_view'),
(582, 3, 'expense_approve_partial'),
(583, 3, 'purchase_add'),
(584, 3, 'purchase_edit'),
(585, 3, 'purchase_view'),
(586, 3, 'sales_add'),
(587, 3, 'sales_edit'),
(588, 3, 'sales_view'),
(589, 3, 'sales_payment_view'),
(590, 3, 'sales_payment_add'),
(591, 3, 'sales_report'),
(592, 3, 'purchase_report'),
(593, 3, 'expense_report'),
(594, 3, 'profit_report'),
(595, 3, 'stock_report'),
(596, 3, 'item_sales_report'),
(597, 3, 'purchase_payments_report'),
(598, 3, 'sales_payments_report'),
(599, 3, 'expired_items_report'),
(600, 3, 'expense_category_add'),
(601, 3, 'expense_category_edit'),
(602, 3, 'expense_category_view'),
(603, 3, 'dashboard_view'),
(604, 3, 'purchase_return_add'),
(605, 3, 'purchase_return_edit'),
(606, 3, 'purchase_return_view'),
(607, 3, 'purchase_return_report'),
(608, 3, 'sales_return_add'),
(609, 3, 'sales_return_edit'),
(610, 3, 'sales_return_view'),
(611, 3, 'sales_return_report'),
(612, 3, 'sales_return_payment_view'),
(613, 3, 'sales_return_payment_add'),
(614, 3, 'purchase_return_payment_view'),
(615, 3, 'purchase_return_payment_add'),
(616, 3, 'purchase_payment_view'),
(617, 3, 'purchase_payment_add'),
(618, 3, 'payment_types_add'),
(619, 3, 'payment_types_edit'),
(620, 3, 'payment_types_view'),
(621, 3, 'item_purchase_report'),
(642, 5, 'tax_add'),
(643, 5, 'units_add'),
(644, 5, 'items_add'),
(645, 5, 'items_edit'),
(646, 5, 'customers_add'),
(647, 5, 'customers_edit'),
(648, 5, 'sales_add'),
(649, 5, 'sales_edit'),
(935, 6, 'users_view'),
(936, 6, 'tax_view'),
(937, 6, 'currency_view'),
(938, 6, 'company_edit'),
(939, 6, 'site_edit'),
(940, 6, 'units_view'),
(941, 6, 'roles_view'),
(942, 6, 'places_add'),
(943, 6, 'places_view'),
(944, 6, 'expense_add'),
(945, 6, 'expense_edit'),
(946, 6, 'expense_delete'),
(947, 6, 'expense_view'),
(948, 6, 'expense_approve_partial'),
(949, 6, 'items_add'),
(950, 6, 'items_edit'),
(951, 6, 'items_delete'),
(952, 6, 'items_view'),
(953, 6, 'brand_add'),
(954, 6, 'brand_edit'),
(955, 6, 'brand_delete'),
(956, 6, 'brand_view'),
(957, 6, 'suppliers_add'),
(958, 6, 'suppliers_edit'),
(959, 6, 'suppliers_delete'),
(960, 6, 'suppliers_view'),
(961, 6, 'customers_add'),
(962, 6, 'customers_edit'),
(963, 6, 'customers_delete'),
(964, 6, 'customers_view'),
(965, 6, 'purchase_add'),
(966, 6, 'purchase_edit'),
(967, 6, 'purchase_delete'),
(968, 6, 'purchase_view'),
(969, 6, 'sales_add'),
(970, 6, 'sales_edit'),
(971, 6, 'sales_delete'),
(972, 6, 'sales_view'),
(973, 6, 'sales_payment_view'),
(974, 6, 'sales_payment_add'),
(975, 6, 'sales_payment_delete'),
(976, 6, 'sales_report'),
(977, 6, 'purchase_report'),
(978, 6, 'expense_report'),
(979, 6, 'profit_report'),
(980, 6, 'stock_report'),
(981, 6, 'item_sales_report'),
(982, 6, 'purchase_payments_report'),
(983, 6, 'sales_payments_report'),
(984, 6, 'expired_items_report'),
(985, 6, 'items_category_add'),
(986, 6, 'items_category_edit'),
(987, 6, 'items_category_delete'),
(988, 6, 'items_category_view'),
(989, 6, 'print_labels'),
(990, 6, 'import_items'),
(991, 6, 'expense_category_add'),
(992, 6, 'expense_category_edit'),
(993, 6, 'expense_category_delete'),
(994, 6, 'expense_category_view'),
(995, 6, 'dashboard_view'),
(996, 6, 'purchase_return_add'),
(997, 6, 'purchase_return_edit'),
(998, 6, 'purchase_return_delete'),
(999, 6, 'purchase_return_view'),
(1000, 6, 'purchase_return_report'),
(1001, 6, 'sales_return_add'),
(1002, 6, 'sales_return_edit'),
(1003, 6, 'sales_return_delete'),
(1004, 6, 'sales_return_view'),
(1005, 6, 'sales_return_report'),
(1006, 6, 'sales_return_payment_view'),
(1007, 6, 'sales_return_payment_add'),
(1008, 6, 'sales_return_payment_delete'),
(1009, 6, 'purchase_return_payment_view'),
(1010, 6, 'purchase_return_payment_add'),
(1011, 6, 'purchase_return_payment_delete'),
(1012, 6, 'purchase_payment_view'),
(1013, 6, 'purchase_payment_add'),
(1014, 6, 'purchase_payment_delete'),
(1015, 6, 'payment_types_add'),
(1016, 6, 'payment_types_view'),
(1017, 6, 'import_customers'),
(1018, 6, 'import_suppliers'),
(1019, 6, 'item_purchase_report');

-- --------------------------------------------------------

--
-- Table structure for table `db_purchase`
--

CREATE TABLE `db_purchase` (
  `id` int(50) NOT NULL,
  `purchase_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,2) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,2) DEFAULT NULL,
  `purchase_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Purchase return raised'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchase`
--

INSERT INTO `db_purchase` (`id`, `purchase_code`, `reference_no`, `purchase_date`, `purchase_status`, `supplier_id`, `warehouse_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `purchase_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`, `return_bit`) VALUES
(1, 'PU0001', '', '2024-05-02', 'Received', 1, NULL, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 0.00, NULL, 0.00, '', 'Paid', 0.00, '2024-05-02', '09:59:37 am', 'admin', '217.165.190.94', 'bba-217-165-190-94.alshamil.net.ae', NULL, 1, NULL),
(2, 'PU0002', '454245', '2024-06-03', 'Received', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 10500.00, NULL, 10500.00, '', 'Unpaid', 0.00, '2024-06-03', '03:13:32 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(3, 'PU0003', '546', '2024-06-05', 'Received', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 25600.00, NULL, 25600.00, '', 'Paid', 25600.00, '2024-06-05', '11:21:50 am', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL),
(4, 'PU0004', '', '2024-06-06', 'Received', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 806.40, NULL, 806.40, '', 'Paid', 806.40, '2024-06-06', '03:16:04 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_purchaseitems`
--

CREATE TABLE `db_purchaseitems` (
  `id` int(50) NOT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `purchase_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_discount_per` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL,
  `profit_margin_per` double(20,2) DEFAULT NULL,
  `unit_sales_price` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `discount_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchaseitems`
--

INSERT INTO `db_purchaseitems` (`id`, `purchase_id`, `purchase_status`, `item_id`, `purchase_qty`, `price_per_unit`, `tax_id`, `tax_amt`, `tax_type`, `unit_discount_per`, `discount_amt`, `unit_total_cost`, `total_cost`, `profit_margin_per`, `unit_sales_price`, `status`, `description`, `discount_type`, `discount_input`) VALUES
(5, 1, 'Received', 1, 20.00, 0.00, 1, NULL, 'Exclusive', NULL, 0.00, 0.00, 0.00, NULL, NULL, 1, '', 'Percentage', 0.00),
(6, 2, 'Received', 2, 100.00, 100.00, 2, 500.00, 'Exclusive', NULL, 0.00, 105.00, 10500.00, NULL, NULL, 1, '', 'Percentage', 0.00),
(7, 3, 'Received', 3, 100.00, 256.00, 1, NULL, 'Exclusive', NULL, 0.00, 256.00, 25600.00, NULL, NULL, 1, '', 'Percentage', 0.00),
(8, 4, 'Received', 3, 3.00, 256.00, 2, 38.40, 'Exclusive', NULL, 0.00, 268.80, 806.40, NULL, NULL, 1, '', 'Percentage', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `db_purchaseitemsreturn`
--

CREATE TABLE `db_purchaseitemsreturn` (
  `id` int(50) NOT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_discount_per` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL,
  `profit_margin_per` double(20,2) DEFAULT NULL,
  `unit_sales_price` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `discount_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchaseitemsreturn`
--

INSERT INTO `db_purchaseitemsreturn` (`id`, `purchase_id`, `return_id`, `return_status`, `item_id`, `return_qty`, `price_per_unit`, `tax_id`, `tax_amt`, `tax_type`, `unit_discount_per`, `discount_amt`, `unit_total_cost`, `total_cost`, `profit_margin_per`, `unit_sales_price`, `status`, `description`, `discount_type`, `discount_input`) VALUES
(1, NULL, 1, 'Return', 1, 1.00, 250.00, 2, 11.90, 'Inclusive', NULL, 0.00, 250.00, 250.00, NULL, NULL, 1, '', 'Percentage', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasepayments`
--

CREATE TABLE `db_purchasepayments` (
  `id` int(50) NOT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchasepayments`
--

INSERT INTO `db_purchasepayments` (`id`, `purchase_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`) VALUES
(3, 3, '2024-06-05', 'Card', 25600.00, '', '::1', 'DESKTOP-A9ES73H', '11:21:50', '2024-06-05', 'admin', 1),
(4, 4, '2024-06-06', 'Cash', 806.40, '', '::1', 'DESKTOP-A9ES73H', '03:16:04', '2024-06-06', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasepaymentsreturn`
--

CREATE TABLE `db_purchasepaymentsreturn` (
  `id` int(50) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasereturn`
--

CREATE TABLE `db_purchasereturn` (
  `id` int(50) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,2) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,2) DEFAULT NULL,
  `return_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchasereturn`
--

INSERT INTO `db_purchasereturn` (`id`, `purchase_id`, `return_code`, `reference_no`, `return_date`, `return_status`, `supplier_id`, `warehouse_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `return_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`) VALUES
(1, NULL, 'PR0001', '', '2023-10-07', 'Return', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 250.00, NULL, 250.00, '', 'Unpaid', 0.00, '2023-10-07', '02:06:04 pm', 'admin', '::1', 'localhost', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_quoteitems`
--

CREATE TABLE `db_quoteitems` (
  `id` int(50) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `purchase_price` double(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_quoteitems`
--

INSERT INTO `db_quoteitems` (`id`, `sales_id`, `sales_status`, `item_id`, `description`, `sales_qty`, `price_per_unit`, `tax_type`, `tax_id`, `tax_amt`, `discount_type`, `discount_input`, `discount_amt`, `unit_total_cost`, `total_cost`, `status`, `purchase_price`) VALUES
(1, 4, 'Quotation', 2, '', 1.00, 300.00, 'Exclusive', 2, 15.00, 'Percentage', NULL, 0.00, 315.00, 315.00, 1, 105.00),
(5, 7, 'Quotation', 1, '', 4.00, 250.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 250.00, 1000.00, 1, 0.00),
(6, 8, 'Quotation', 1, '', 10.00, 250.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 250.00, 2500.00, 1, 0.00),
(7, 9, 'Quotation', 1, '', 8.00, 250.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 250.00, 2000.00, 1, 0.00),
(8, 10, 'Quotation', 2, '', 10.00, 300.00, 'Exclusive', 2, 150.00, 'Percentage', NULL, 0.00, 315.00, 3150.00, 1, 105.00),
(9, 11, 'Quotation', 2, '', 10.00, 300.00, 'Exclusive', 2, 150.00, 'Percentage', NULL, 0.00, 315.00, 3150.00, 1, 105.00),
(10, 12, 'Quotation', 2, '', 20.00, 300.00, 'Exclusive', 2, 300.00, 'Percentage', NULL, 0.00, 315.00, 6300.00, 1, 105.00),
(11, 13, 'Quotation', 2, '', 10.00, 300.00, 'Exclusive', 2, 150.00, 'Percentage', NULL, 0.00, 315.00, 3150.00, 1, 105.00),
(12, 12, 'Quotation', 3, '', 5.00, 400.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 400.00, 2000.00, 1, 256.00),
(13, 13, 'Quotation', 3, '', 4.00, 400.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 400.00, 1600.00, 1, 256.00),
(14, 1, 'Quotation', 3, '', 5.00, 520.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 520.00, 2600.00, 1, 256.00),
(15, 2, 'Quotation', 3, '', 10.00, 256.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 256.00, 2560.00, 1, 256.00),
(16, 3, 'Quotation', 3, '', 2.00, 300.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 300.00, 600.00, 1, 256.00),
(17, 4, 'Quotation', 5, '', 4.00, 25.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 25.00, 100.00, 1, 25.00),
(21, 5, 'Quotation', 7, '', 3.00, 850.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 850.00, 2550.00, 1, 850.00),
(22, 5, 'Quotation', 9, '', 3.00, 250.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 250.00, 750.00, 1, 250.00),
(24, 6, 'Quotation', 12, '', 2.00, 31.25, 'Exclusive', 1, NULL, '', NULL, 0.00, 31.25, 62.50, 1, 25.00);

-- --------------------------------------------------------

--
-- Table structure for table `db_roles`
--

CREATE TABLE `db_roles` (
  `id` int(50) NOT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_roles`
--

INSERT INTO `db_roles` (`id`, `role_name`, `description`, `status`) VALUES
(1, 'Admin', 'All Rights Permitted.', 1),
(2, 'Administrator', 'Administrator', 1),
(3, 'Accountant', 'Accountant', 1),
(4, 'Directors', 'Directors', 1),
(5, 'Sales', '', 1),
(6, 'Demo', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_sales`
--

CREATE TABLE `db_sales` (
  `id` int(50) NOT NULL,
  `sales_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `sales_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Unpaid',
  `paid_amount` double(20,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `transferred_to_delivery_note` tinyint(4) NOT NULL DEFAULT '0',
  `sale_origin` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT 'invoice',
  `return_bit` int(1) DEFAULT NULL COMMENT 'sales return raised'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_sales`
--

INSERT INTO `db_sales` (`id`, `sales_code`, `reference_no`, `sales_date`, `sales_status`, `customer_id`, `warehouse_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `sales_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `pos`, `status`, `transferred_to_delivery_note`, `sale_origin`, `return_bit`) VALUES
(30, 'INV0001', '1234', '2024-06-03', 'Pending', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 2600.00, NULL, 2600.00, '', 'Unpaid', NULL, '2024-06-03', '04:50:37 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 0, 'quotation', NULL),
(31, 'INV0031', '85858', '2024-06-03', 'Final', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 4000.00, NULL, 4000.00, '', 'Paid', 4000.00, '2024-06-03', '04:51:00 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL),
(32, 'INV0032', '8745', '2024-06-05', 'Pending', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 2560.00, NULL, 2560.00, '', 'Partial', 1250.00, '2024-06-05', '11:22:56 am', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'quotation', NULL),
(33, 'INV0033', '555', '2024-06-05', 'Final', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 3840.00, NULL, 3840.00, '', 'Paid', 3840.00, '2024-06-05', '11:23:40 am', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL),
(34, 'INV0034', '895', '2024-06-05', 'Final', 11, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 250.00, NULL, 250.00, '', 'Unpaid', 0.00, '2024-06-05', '12:38:14 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL),
(35, 'INV0035', '555', '2024-06-05', 'Final', 11, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 0.00, NULL, 0.00, '', 'Paid', 0.00, '2024-06-05', '12:39:35 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL),
(36, 'INV0036', '', '2024-06-06', 'Final', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 1200.00, NULL, 1200.00, '', 'Unpaid', 0.00, '2024-06-06', '03:17:16 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL),
(37, 'INV0037', '', '2024-06-06', 'Final', 11, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 600.00, NULL, 600.00, '', 'Paid', 600.00, '2024-06-06', '03:20:16 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'quotation', NULL),
(38, 'INV0038', '05555', '2024-06-07', 'Final', 11, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 3200.00, NULL, 3200.00, '', 'Unpaid', 0.00, '2024-06-07', '03:15:53 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL),
(39, 'INV0039', '52225', '2024-06-21', 'Final', 13, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 100.00, NULL, 100.00, '', 'Unpaid', NULL, '2024-06-21', '04:53:12 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'quotation', NULL),
(40, 'INV0040', '52225', '2024-06-21', 'Final', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 75.00, NULL, 75.00, '', 'Unpaid', 0.00, '2024-06-21', '06:33:20 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL),
(41, 'INV0041', '252', '2024-06-21', 'Final', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 750.00, NULL, 750.00, '', 'Unpaid', 0.00, '2024-06-21', '06:34:02 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL),
(42, 'INV0042', '14589', '2024-06-21', 'Final', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 5600.00, NULL, 5600.00, '', 'Unpaid', 0.00, '2024-06-21', '06:47:16 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL),
(43, 'INV0043', '252', '2024-06-21', 'Final', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 1075.00, NULL, 1075.00, '', 'Unpaid', 0.00, '2024-06-21', '06:47:36 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, 'invoice', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_salesitems`
--

CREATE TABLE `db_salesitems` (
  `id` int(50) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `purchase_price` double(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_salesitems`
--

INSERT INTO `db_salesitems` (`id`, `sales_id`, `sales_status`, `item_id`, `description`, `sales_qty`, `price_per_unit`, `tax_type`, `tax_id`, `tax_amt`, `discount_type`, `discount_input`, `discount_amt`, `unit_total_cost`, `total_cost`, `status`, `purchase_price`) VALUES
(92, 30, 'Final', 3, '', 5.00, 520.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 520.00, 2600.00, 1, 256.00),
(93, 31, 'Final', 3, '', 20.00, 200.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 200.00, 4000.00, 1, 256.00),
(94, 32, 'Final', 3, '', 10.00, 256.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 256.00, 2560.00, 1, 256.00),
(95, 33, 'Final', 3, '', 15.00, 256.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 256.00, 3840.00, 1, 256.00),
(96, 34, 'Final', 3, '', 1.00, 250.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 250.00, 250.00, 1, 256.00),
(97, 35, 'Final', 3, '', 12.00, 0.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 0.00, NULL, 1, 256.00),
(98, 36, 'Final', 3, '', 2.00, 300.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 300.00, 600.00, 1, 256.00),
(99, 36, 'Final', 3, '', 2.00, 300.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 300.00, 600.00, 1, 256.00),
(100, 37, 'Final', 3, '', 2.00, 300.00, 'Exclusive', 1, NULL, 'Percentage', NULL, 0.00, 300.00, 600.00, 1, 256.00),
(101, 38, 'Final', 8, '', 4.00, 800.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 800.00, 3200.00, 1, 800.00),
(102, 39, 'Final', 2, '', 1.00, 300.00, 'Exclusive', 2, 15.00, 'Percentage', NULL, 0.00, 315.00, 315.00, 1, 105.00),
(103, 39, 'Final', 5, '', 4.00, 25.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 25.00, 100.00, 1, 25.00),
(104, 40, 'Final', 5, '', 3.00, 25.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 25.00, 75.00, 1, 25.00),
(105, 41, 'Final', 9, '', 3.00, 250.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 250.00, 750.00, 1, 250.00),
(106, 42, 'Final', 8, '', 3.00, 800.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 800.00, 2400.00, 1, 800.00),
(107, 42, 'Final', 8, '', 4.00, 800.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 800.00, 3200.00, 1, 800.00),
(108, 43, 'Final', 5, '', 3.00, 25.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 25.00, 75.00, 1, 25.00),
(109, 43, 'Final', 9, '', 4.00, 250.00, 'Exclusive', 1, NULL, '', NULL, 0.00, 250.00, 1000.00, 1, 250.00);

-- --------------------------------------------------------

--
-- Table structure for table `db_salesitemsreturn`
--

CREATE TABLE `db_salesitemsreturn` (
  `id` int(50) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,2) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,2) DEFAULT NULL,
  `discount_amt` double(20,2) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_total_cost` double(20,2) DEFAULT NULL,
  `total_cost` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `purchase_price` double(20,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_salespayments`
--

CREATE TABLE `db_salespayments` (
  `id` int(50) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `change_return` double(20,2) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_salespayments`
--

INSERT INTO `db_salespayments` (`id`, `sales_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `change_return`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`) VALUES
(9, 33, '2024-06-05', 'Card', 3840.00, 'recieved', NULL, '::1', 'DESKTOP-A9ES73H', '11:48:34', '2024-06-05', 'admin', 1),
(10, 32, '2024-06-05', 'Cash', 1250.00, '', NULL, '::1', 'DESKTOP-A9ES73H', '11:50:13', '2024-06-05', 'admin', 1),
(11, 31, '2024-06-05', 'Cash', 4000.00, 'Recieved', NULL, '::1', 'DESKTOP-A9ES73H', '11:52:26', '2024-06-05', 'admin', 1),
(12, 37, '2024-06-06', 'Cash', 600.00, '', NULL, '::1', 'DESKTOP-A9ES73H', '03:22:40', '2024-06-06', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_salespaymentsreturn`
--

CREATE TABLE `db_salespaymentsreturn` (
  `id` int(50) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `change_return` double(20,2) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_salesreturn`
--

CREATE TABLE `db_salesreturn` (
  `id` int(50) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `return_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Return raised or not 1 or null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_sales_quote`
--

CREATE TABLE `db_sales_quote` (
  `id` int(50) NOT NULL,
  `sales_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `sales_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `transferred_to_invoice` tinyint(1) DEFAULT '0',
  `return_bit` int(1) DEFAULT NULL COMMENT 'sales return raised'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_sales_quote`
--

INSERT INTO `db_sales_quote` (`id`, `sales_code`, `reference_no`, `sales_date`, `sales_status`, `customer_id`, `warehouse_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `sales_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `pos`, `status`, `transferred_to_invoice`, `return_bit`) VALUES
(1, 'QT0001', '1234', '2024-06-03', 'Quotation', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 2600.00, NULL, 2600.00, '', NULL, NULL, '2024-06-03', '04:50:30 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, NULL),
(2, 'QT0002', '8745', '2024-06-05', 'Quotation', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 2560.00, NULL, 2560.00, '', NULL, NULL, '2024-06-05', '11:22:27 am', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, NULL),
(3, 'QT0003', '', '2024-06-06', 'Quotation', 11, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 600.00, NULL, 600.00, '', NULL, NULL, '2024-06-06', '03:19:51 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, NULL),
(4, 'QT0004', '52225', '2024-06-21', 'Quotation', 13, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 100.00, NULL, 100.00, '', NULL, NULL, '2024-06-21', '03:25:33 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 1, NULL),
(5, 'QT0005', '12345', '2024-06-21', 'Quotation', 12, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 3300.00, NULL, 3300.00, '', NULL, NULL, '2024-06-21', '03:26:15 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 0, NULL),
(6, 'QT0006', '', '2024-06-21', 'Quotation', 1, NULL, NULL, 0, NULL, NULL, 'in_percentage', NULL, 62.50, NULL, 62.50, '', NULL, NULL, '2024-06-21', '04:00:10 pm', 'admin', '::1', 'DESKTOP-A9ES73H', NULL, NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_sitesettings`
--

CREATE TABLE `db_sitesettings` (
  `id` int(50) NOT NULL,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'path',
  `language_id` int(5) DEFAULT NULL,
  `currency_id` int(5) DEFAULT NULL,
  `currency_placement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` int(5) DEFAULT NULL,
  `sales_discount` double(20,2) DEFAULT NULL,
  `site_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` mediumtext COLLATE utf8mb4_unicode_ci,
  `meta_keywords` mediumtext COLLATE utf8mb4_unicode_ci,
  `currencysymbol_id` int(5) DEFAULT NULL,
  `regno_key` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` mediumtext COLLATE utf8mb4_unicode_ci,
  `facebook_url` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitter_url` mediumtext COLLATE utf8mb4_unicode_ci,
  `youtube_url` mediumtext COLLATE utf8mb4_unicode_ci,
  `analytic_code` mediumtext COLLATE utf8mb4_unicode_ci,
  `fav_icon` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'path',
  `footer_logo` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'path',
  `company_id` int(1) DEFAULT NULL,
  `purchase_code` mediumtext COLLATE utf8mb4_unicode_ci,
  `change_return` int(1) DEFAULT NULL COMMENT 'show in pos',
  `sales_invoice_format_id` int(5) DEFAULT NULL,
  `sales_invoice_footer_text` text COLLATE utf8mb4_unicode_ci,
  `round_off` int(1) DEFAULT NULL COMMENT '1=Enble, 0=Disable',
  `machine_id` text COLLATE utf8mb4_unicode_ci,
  `domain` text COLLATE utf8mb4_unicode_ci,
  `show_upi_code` int(1) DEFAULT '0',
  `unique_code` text COLLATE utf8mb4_unicode_ci,
  `disable_tax` int(1) DEFAULT '0' COMMENT 'If set Disable the tax from app',
  `number_to_words` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_sitesettings`
--

INSERT INTO `db_sitesettings` (`id`, `version`, `site_name`, `logo`, `language_id`, `currency_id`, `currency_placement`, `timezone`, `date_format`, `time_format`, `sales_discount`, `site_url`, `site_title`, `meta_title`, `meta_desc`, `meta_keywords`, `currencysymbol_id`, `regno_key`, `copyright`, `facebook_url`, `twitter_url`, `youtube_url`, `analytic_code`, `fav_icon`, `footer_logo`, `company_id`, `purchase_code`, `change_return`, `sales_invoice_format_id`, `sales_invoice_footer_text`, `round_off`, `machine_id`, `domain`, `show_upi_code`, `unique_code`, `disable_tax`, `number_to_words`) VALUES
(1, '2.3', 'Dr. Computers', 'logo_small.png', 1, 17, 'Left', 'Asia/Dubai\r\n', 'dd-mm-yyyy', 12, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'Thank you, Visit Again', 0, '1', 'project.rahamiagri.co.tz', 0, '8cpmk97gbjewh16tqzylds5o3fn420', 0, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `db_smsapi`
--

CREATE TABLE `db_smsapi` (
  `id` int(50) NOT NULL,
  `info` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_value` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_bit` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_smsapi`
--

INSERT INTO `db_smsapi` (`id`, `info`, `key`, `key_value`, `delete_bit`) VALUES
(156, 'url', 'weblink', 'http://www.example.in/api/sendhttp.php', NULL),
(157, 'mobile', 'mobiles', '', NULL),
(158, 'message', 'message', '', NULL),
(159, '', 'authkey', 'xxxxxxxxxxxxxxxxxxxx', NULL),
(160, '', 'sender', 'ULTPOS', NULL),
(161, '', 'route', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_smstemplates`
--

CREATE TABLE `db_smstemplates` (
  `id` int(50) NOT NULL,
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `variables` text COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `undelete_bit` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_smstemplates`
--

INSERT INTO `db_smstemplates` (`id`, `template_name`, `content`, `variables`, `company_id`, `status`, `undelete_bit`) VALUES
(1, 'GREETING TO CUSTOMER ON SALES', 'Hi {{customer_name}},\r\nYour sales Id is {{sales_id}},\r\nSales Date {{sales_date}},\r\nTotal amount  {{sales_amount}},\r\nYou have paid  {{paid_amt}},\r\nand customer total due amount is  {{cust_tot_due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>\r\n{{sales_id}}<br>\r\n{{sales_date}}<br>\r\n{{sales_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{cust_tot_due_amt}}<br>\r\n{{invoice_due_amt}}<br>\r\n{{company_name}}<br>\r\n{{company_mobile}}<br>\r\n{{company_address}}<br>\r\n{{company_website}}<br>\r\n{{company_email}}<br>', NULL, 1, 1),
(2, 'GREETING TO CUSTOMER ON SALES RETURN', 'Hi {{customer_name}},\r\nYour sales return Id is {{return_id}},\r\nReturn Date {{return_date}},\r\nTotal amount  {{return_amount}},\r\nWe paid  {{paid_amt}},\r\nand customer total due amount is  {{cust_tot_due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>\r\n{{return_id}}<br>\r\n{{return_date}}<br>\r\n{{return_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{cust_tot_due_amt}}<br>\r\n{{invoice_due_amt}}<br>\r\n{{company_name}}<br>\r\n{{company_mobile}}<br>\r\n{{company_address}}<br>\r\n{{company_website}}<br>\r\n{{company_email}}<br>', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_sobpayments`
--

CREATE TABLE `db_sobpayments` (
  `id` int(50) NOT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_states`
--

CREATE TABLE `db_states` (
  `id` int(50) NOT NULL,
  `state_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_states`
--

INSERT INTO `db_states` (`id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES
(57, NULL, 'Abu Dhabi', NULL, NULL, 'United Arab Emi', NULL, NULL, 1),
(58, NULL, 'Dubai', NULL, NULL, 'United Arab Emi', NULL, NULL, 1),
(59, NULL, 'Sharjah', NULL, NULL, 'United Arab Emi', NULL, NULL, 1),
(60, NULL, 'Ajman', NULL, NULL, 'United Arab Emi', NULL, NULL, 1),
(61, NULL, 'Ras Al Khaima', NULL, NULL, 'United Arab Emi', NULL, NULL, 1),
(62, NULL, 'Umm Al Quwain', NULL, NULL, 'United Arab Emi', NULL, NULL, 1),
(63, NULL, 'Fujairah', NULL, NULL, 'United Arab Emi', NULL, NULL, 1),
(64, NULL, 'Delhih', NULL, NULL, 'India', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_stockentry`
--

CREATE TABLE `db_stockentry` (
  `id` int(50) NOT NULL,
  `entry_date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_suppliers`
--

CREATE TABLE `db_suppliers` (
  `id` int(50) NOT NULL,
  `supplier_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(20,2) DEFAULT NULL,
  `purchase_due` double(20,2) DEFAULT NULL,
  `purchase_return_due` double(20,2) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `state_id` int(5) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_suppliers`
--

INSERT INTO `db_suppliers` (`id`, `supplier_code`, `supplier_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `purchase_due`, `purchase_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`) VALUES
(1, 'SP0001', 'ABC Supplier', '', '', '', '', '', NULL, 500.00, 10500.00, NULL, 5, 58, '', '', '', '217.165.190.94', 'bba-217-165-190-94.alshamil.net.ae', '2024-05-02', '09:59:20 am', 'admin', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_supplier_payments`
--

CREATE TABLE `db_supplier_payments` (
  `id` int(50) NOT NULL,
  `purchasepayment_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment` double(20,2) DEFAULT NULL,
  `payment_note` text,
  `system_ip` varchar(50) DEFAULT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `created_time` varchar(50) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_supplier_payments`
--

INSERT INTO `db_supplier_payments` (`id`, `purchasepayment_id`, `supplier_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`) VALUES
(4, 3, 1, '2024-06-05', 'Card', 25600.00, '', '::1', 'DESKTOP-A9ES73H', '11:21:50', '2024-06-05', 'admin', 1),
(5, 4, 1, '2024-06-06', 'Cash', 806.40, '', '::1', 'DESKTOP-A9ES73H', '03:16:04', '2024-06-06', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_tax`
--

CREATE TABLE `db_tax` (
  `id` int(50) NOT NULL,
  `tax_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `group_bit` int(1) DEFAULT NULL COMMENT '1=Yes, 0=No',
  `subtax_ids` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tax groups IDs',
  `status` int(1) DEFAULT NULL,
  `undelete_bit` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_tax`
--

INSERT INTO `db_tax` (`id`, `tax_name`, `tax`, `group_bit`, `subtax_ids`, `status`, `undelete_bit`) VALUES
(1, 'None', 0.00, NULL, NULL, 1, 1),
(2, 'VAT', 5.00, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `db_timezone`
--

CREATE TABLE `db_timezone` (
  `id` int(50) NOT NULL,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_timezone`
--

INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES
(1, 'Africa/Abidjan\r', 1),
(2, 'Africa/Accra\r', 1),
(3, 'Africa/Addis_Ababa\r', 1),
(4, 'Africa/Algiers\r', 1),
(5, 'Africa/Asmara\r', 1),
(6, 'Africa/Asmera\r', 1),
(7, 'Africa/Bamako\r', 1),
(8, 'Africa/Bangui\r', 1),
(9, 'Africa/Banjul\r', 1),
(10, 'Africa/Bissau\r', 1),
(11, 'Africa/Blantyre\r', 1),
(12, 'Africa/Brazzaville\r', 1),
(13, 'Africa/Bujumbura\r', 1),
(14, 'Africa/Cairo\r', 1),
(15, 'Africa/Casablanca\r', 1),
(16, 'Africa/Ceuta\r', 1),
(17, 'Africa/Conakry\r', 1),
(18, 'Africa/Dakar\r', 1),
(19, 'Africa/Dar_es_Salaam\r', 1),
(20, 'Africa/Djibouti\r', 1),
(21, 'Africa/Douala\r', 1),
(22, 'Africa/El_Aaiun\r', 1),
(23, 'Africa/Freetown\r', 1),
(24, 'Africa/Gaborone\r', 1),
(25, 'Africa/Harare\r', 1),
(26, 'Africa/Johannesburg\r', 1),
(27, 'Africa/Juba\r', 1),
(28, 'Africa/Kampala\r', 1),
(29, 'Africa/Khartoum\r', 1),
(30, 'Africa/Kigali\r', 1),
(31, 'Africa/Kinshasa\r', 1),
(32, 'Africa/Lagos\r', 1),
(33, 'Africa/Libreville\r', 1),
(34, 'Africa/Lome\r', 1),
(35, 'Africa/Luanda\r', 1),
(36, 'Africa/Lubumbashi\r', 1),
(37, 'Africa/Lusaka\r', 1),
(38, 'Africa/Malabo\r', 1),
(39, 'Africa/Maputo\r', 1),
(40, 'Africa/Maseru\r', 1),
(41, 'Africa/Mbabane\r', 1),
(42, 'Africa/Mogadishu\r', 1),
(43, 'Africa/Monrovia\r', 1),
(44, 'Africa/Nairobi\r', 1),
(45, 'Africa/Ndjamena\r', 1),
(46, 'Africa/Niamey\r', 1),
(47, 'Africa/Nouakchott\r', 1),
(48, 'Africa/Ouagadougou\r', 1),
(49, 'Africa/Porto-Novo\r', 1),
(50, 'Africa/Sao_Tome\r', 1),
(51, 'Africa/Timbuktu\r', 1),
(52, 'Africa/Tripoli\r', 1),
(53, 'Africa/Tunis\r', 1),
(54, 'Africa/Windhoek\r', 1),
(55, 'AKST9AKDT\r', 1),
(56, 'America/Adak\r', 1),
(57, 'America/Anchorage\r', 1),
(58, 'America/Anguilla\r', 1),
(59, 'America/Antigua\r', 1),
(60, 'America/Araguaina\r', 1),
(61, 'America/Argentina/Buenos_Aires\r', 1),
(62, 'America/Argentina/Catamarca\r', 1),
(63, 'America/Argentina/ComodRivadavia\r', 1),
(64, 'America/Argentina/Cordoba\r', 1),
(65, 'America/Argentina/Jujuy\r', 1),
(66, 'America/Argentina/La_Rioja\r', 1),
(67, 'America/Argentina/Mendoza\r', 1),
(68, 'America/Argentina/Rio_Gallegos\r', 1),
(69, 'America/Argentina/Salta\r', 1),
(70, 'America/Argentina/San_Juan\r', 1),
(71, 'America/Argentina/San_Luis\r', 1),
(72, 'America/Argentina/Tucuman\r', 1),
(73, 'America/Argentina/Ushuaia\r', 1),
(74, 'America/Aruba\r', 1),
(75, 'America/Asuncion\r', 1),
(76, 'America/Atikokan\r', 1),
(77, 'America/Atka\r', 1),
(78, 'America/Bahia\r', 1),
(79, 'America/Bahia_Banderas\r', 1),
(80, 'America/Barbados\r', 1),
(81, 'America/Belem\r', 1),
(82, 'America/Belize\r', 1),
(83, 'America/Blanc-Sablon\r', 1),
(84, 'America/Boa_Vista\r', 1),
(85, 'America/Bogota\r', 1),
(86, 'America/Boise\r', 1),
(87, 'America/Buenos_Aires\r', 1),
(88, 'America/Cambridge_Bay\r', 1),
(89, 'America/Campo_Grande\r', 1),
(90, 'America/Cancun\r', 1),
(91, 'America/Caracas\r', 1),
(92, 'America/Catamarca\r', 1),
(93, 'America/Cayenne\r', 1),
(94, 'America/Cayman\r', 1),
(95, 'America/Chicago\r', 1),
(96, 'America/Chihuahua\r', 1),
(97, 'America/Coral_Harbour\r', 1),
(98, 'America/Cordoba\r', 1),
(99, 'America/Costa_Rica\r', 1),
(100, 'America/Creston\r', 1),
(101, 'America/Cuiaba\r', 1),
(102, 'America/Curacao\r', 1),
(103, 'America/Danmarkshavn\r', 1),
(104, 'America/Dawson\r', 1),
(105, 'America/Dawson_Creek\r', 1),
(106, 'America/Denver\r', 1),
(107, 'America/Detroit\r', 1),
(108, 'America/Dominica\r', 1),
(109, 'America/Edmonton\r', 1),
(110, 'America/Eirunepe\r', 1),
(111, 'America/El_Salvador\r', 1),
(112, 'America/Ensenada\r', 1),
(113, 'America/Fort_Wayne\r', 1),
(114, 'America/Fortaleza\r', 1),
(115, 'America/Glace_Bay\r', 1),
(116, 'America/Godthab\r', 1),
(117, 'America/Goose_Bay\r', 1),
(118, 'America/Grand_Turk\r', 1),
(119, 'America/Grenada\r', 1),
(120, 'America/Guadeloupe\r', 1),
(121, 'America/Guatemala\r', 1),
(122, 'America/Guayaquil\r', 1),
(123, 'America/Guyana\r', 1),
(124, 'America/Halifax\r', 1),
(125, 'America/Havana\r', 1),
(126, 'America/Hermosillo\r', 1),
(127, 'America/Indiana/Indianapolis\r', 1),
(128, 'America/Indiana/Knox\r', 1),
(129, 'America/Indiana/Marengo\r', 1),
(130, 'America/Indiana/Petersburg\r', 1),
(131, 'America/Indiana/Tell_City\r', 1),
(132, 'America/Indiana/Vevay\r', 1),
(133, 'America/Indiana/Vincennes\r', 1),
(134, 'America/Indiana/Winamac\r', 1),
(135, 'America/Indianapolis\r', 1),
(136, 'America/Inuvik\r', 1),
(137, 'America/Iqaluit\r', 1),
(138, 'America/Jamaica\r', 1),
(139, 'America/Jujuy\r', 1),
(140, 'America/Juneau\r', 1),
(141, 'America/Kentucky/Louisville\r', 1),
(142, 'America/Kentucky/Monticello\r', 1),
(143, 'America/Knox_IN\r', 1),
(144, 'America/Kralendijk\r', 1),
(145, 'America/La_Paz\r', 1),
(146, 'America/Lima\r', 1),
(147, 'America/Los_Angeles\r', 1),
(148, 'America/Louisville\r', 1),
(149, 'America/Lower_Princes\r', 1),
(150, 'America/Maceio\r', 1),
(151, 'America/Managua\r', 1),
(152, 'America/Manaus\r', 1),
(153, 'America/Marigot\r', 1),
(154, 'America/Martinique\r', 1),
(155, 'America/Matamoros\r', 1),
(156, 'America/Mazatlan\r', 1),
(157, 'America/Mendoza\r', 1),
(158, 'America/Menominee\r', 1),
(159, 'America/Merida\r', 1),
(160, 'America/Metlakatla\r', 1),
(161, 'America/Mexico_City\r', 1),
(162, 'America/Miquelon\r', 1),
(163, 'America/Moncton\r', 1),
(164, 'America/Monterrey\r', 1),
(165, 'America/Montevideo\r', 1),
(166, 'America/Montreal\r', 1),
(167, 'America/Montserrat\r', 1),
(168, 'America/Nassau\r', 1),
(169, 'America/New_York\r', 1),
(170, 'America/Nipigon\r', 1),
(171, 'America/Nome\r', 1),
(172, 'America/Noronha\r', 1),
(173, 'America/North_Dakota/Beulah\r', 1),
(174, 'America/North_Dakota/Center\r', 1),
(175, 'America/North_Dakota/New_Salem\r', 1),
(176, 'America/Ojinaga\r', 1),
(177, 'America/Panama\r', 1),
(178, 'America/Pangnirtung\r', 1),
(179, 'America/Paramaribo\r', 1),
(180, 'America/Phoenix\r', 1),
(181, 'America/Port_of_Spain\r', 1),
(182, 'America/Port-au-Prince\r', 1),
(183, 'America/Porto_Acre\r', 1),
(184, 'America/Porto_Velho\r', 1),
(185, 'America/Puerto_Rico\r', 1),
(186, 'America/Rainy_River\r', 1),
(187, 'America/Rankin_Inlet\r', 1),
(188, 'America/Recife\r', 1),
(189, 'America/Regina\r', 1),
(190, 'America/Resolute\r', 1),
(191, 'America/Rio_Branco\r', 1),
(192, 'America/Rosario\r', 1),
(193, 'America/Santa_Isabel\r', 1),
(194, 'America/Santarem\r', 1),
(195, 'America/Santiago\r', 1),
(196, 'America/Santo_Domingo\r', 1),
(197, 'America/Sao_Paulo\r', 1),
(198, 'America/Scoresbysund\r', 1),
(199, 'America/Shiprock\r', 1),
(200, 'America/Sitka\r', 1),
(201, 'America/St_Barthelemy\r', 1),
(202, 'America/St_Johns\r', 1),
(203, 'America/St_Kitts\r', 1),
(204, 'America/St_Lucia\r', 1),
(205, 'America/St_Thomas\r', 1),
(206, 'America/St_Vincent\r', 1),
(207, 'America/Swift_Current\r', 1),
(208, 'America/Tegucigalpa\r', 1),
(209, 'America/Thule\r', 1),
(210, 'America/Thunder_Bay\r', 1),
(211, 'America/Tijuana\r', 1),
(212, 'America/Toronto\r', 1),
(213, 'America/Tortola\r', 1),
(214, 'America/Vancouver\r', 1),
(215, 'America/Virgin\r', 1),
(216, 'America/Whitehorse\r', 1),
(217, 'America/Winnipeg\r', 1),
(218, 'America/Yakutat\r', 1),
(219, 'America/Yellowknife\r', 1),
(220, 'Antarctica/Casey\r', 1),
(221, 'Antarctica/Davis\r', 1),
(222, 'Antarctica/DumontDUrville\r', 1),
(223, 'Antarctica/Macquarie\r', 1),
(224, 'Antarctica/Mawson\r', 1),
(225, 'Antarctica/McMurdo\r', 1),
(226, 'Antarctica/Palmer\r', 1),
(227, 'Antarctica/Rothera\r', 1),
(228, 'Antarctica/South_Pole\r', 1),
(229, 'Antarctica/Syowa\r', 1),
(230, 'Antarctica/Vostok\r', 1),
(231, 'Arctic/Longyearbyen\r', 1),
(232, 'Asia/Aden\r', 1),
(233, 'Asia/Almaty\r', 1),
(234, 'Asia/Amman\r', 1),
(235, 'Asia/Anadyr\r', 1),
(236, 'Asia/Aqtau\r', 1),
(237, 'Asia/Aqtobe\r', 1),
(238, 'Asia/Ashgabat\r', 1),
(239, 'Asia/Ashkhabad\r', 1),
(240, 'Asia/Baghdad\r', 1),
(241, 'Asia/Bahrain\r', 1),
(242, 'Asia/Baku\r', 1),
(243, 'Asia/Bangkok\r', 1),
(244, 'Asia/Beirut\r', 1),
(245, 'Asia/Bishkek\r', 1),
(246, 'Asia/Brunei\r', 1),
(247, 'Asia/Calcutta\r', 1),
(248, 'Asia/Choibalsan\r', 1),
(249, 'Asia/Chongqing\r', 1),
(250, 'Asia/Chungking\r', 1),
(251, 'Asia/Colombo\r', 1),
(252, 'Asia/Dacca\r', 1),
(253, 'Asia/Damascus\r', 1),
(254, 'Asia/Dhaka\r', 1),
(255, 'Asia/Dili\r', 1),
(256, 'Asia/Dubai\r', 1),
(257, 'Asia/Dushanbe\r', 1),
(258, 'Asia/Gaza\r', 1),
(259, 'Asia/Harbin\r', 1),
(260, 'Asia/Hebron\r', 1),
(261, 'Asia/Ho_Chi_Minh\r', 1),
(262, 'Asia/Hong_Kong\r', 1),
(263, 'Asia/Hovd\r', 1),
(264, 'Asia/Irkutsk\r', 1),
(265, 'Asia/Istanbul\r', 1),
(266, 'Asia/Jakarta\r', 1),
(267, 'Asia/Jayapura\r', 1),
(268, 'Asia/Jerusalem\r', 1),
(269, 'Asia/Kabul\r', 1),
(270, 'Asia/Kamchatka\r', 1),
(271, 'Asia/Karachi\r', 1),
(272, 'Asia/Kashgar\r', 1),
(273, 'Asia/Kathmandu\r', 1),
(274, 'Asia/Katmandu\r', 1),
(275, 'Asia/Kolkata\r', 1),
(276, 'Asia/Krasnoyarsk\r', 1),
(277, 'Asia/Kuala_Lumpur\r', 1),
(278, 'Asia/Kuching\r', 1),
(279, 'Asia/Kuwait\r', 1),
(280, 'Asia/Macao\r', 1),
(281, 'Asia/Macau\r', 1),
(282, 'Asia/Magadan\r', 1),
(283, 'Asia/Makassar\r', 1),
(284, 'Asia/Manila\r', 1),
(285, 'Asia/Muscat\r', 1),
(286, 'Asia/Nicosia\r', 1),
(287, 'Asia/Novokuznetsk\r', 1),
(288, 'Asia/Novosibirsk\r', 1),
(289, 'Asia/Omsk\r', 1),
(290, 'Asia/Oral\r', 1),
(291, 'Asia/Phnom_Penh\r', 1),
(292, 'Asia/Pontianak\r', 1),
(293, 'Asia/Pyongyang\r', 1),
(294, 'Asia/Qatar\r', 1),
(295, 'Asia/Qyzylorda\r', 1),
(296, 'Asia/Rangoon\r', 1),
(297, 'Asia/Riyadh\r', 1),
(298, 'Asia/Saigon\r', 1),
(299, 'Asia/Sakhalin\r', 1),
(300, 'Asia/Samarkand\r', 1),
(301, 'Asia/Seoul\r', 1),
(302, 'Asia/Shanghai\r', 1),
(303, 'Asia/Singapore\r', 1),
(304, 'Asia/Taipei\r', 1),
(305, 'Asia/Tashkent\r', 1),
(306, 'Asia/Tbilisi\r', 1),
(307, 'Asia/Tehran\r', 1),
(308, 'Asia/Tel_Aviv\r', 1),
(309, 'Asia/Thimbu\r', 1),
(310, 'Asia/Thimphu\r', 1),
(311, 'Asia/Tokyo\r', 1),
(312, 'Asia/Ujung_Pandang\r', 1),
(313, 'Asia/Ulaanbaatar\r', 1),
(314, 'Asia/Ulan_Bator\r', 1),
(315, 'Asia/Urumqi\r', 1),
(316, 'Asia/Vientiane\r', 1),
(317, 'Asia/Vladivostok\r', 1),
(318, 'Asia/Yakutsk\r', 1),
(319, 'Asia/Yekaterinburg\r', 1),
(320, 'Asia/Yerevan\r', 1),
(321, 'Atlantic/Azores\r', 1),
(322, 'Atlantic/Bermuda\r', 1),
(323, 'Atlantic/Canary\r', 1),
(324, 'Atlantic/Cape_Verde\r', 1),
(325, 'Atlantic/Faeroe\r', 1),
(326, 'Atlantic/Faroe\r', 1),
(327, 'Atlantic/Jan_Mayen\r', 1),
(328, 'Atlantic/Madeira\r', 1),
(329, 'Atlantic/Reykjavik\r', 1),
(330, 'Atlantic/South_Georgia\r', 1),
(331, 'Atlantic/St_Helena\r', 1),
(332, 'Atlantic/Stanley\r', 1),
(333, 'Australia/ACT\r', 1),
(334, 'Australia/Adelaide\r', 1),
(335, 'Australia/Brisbane\r', 1),
(336, 'Australia/Broken_Hill\r', 1),
(337, 'Australia/Canberra\r', 1),
(338, 'Australia/Currie\r', 1),
(339, 'Australia/Darwin\r', 1),
(340, 'Australia/Eucla\r', 1),
(341, 'Australia/Hobart\r', 1),
(342, 'Australia/LHI\r', 1),
(343, 'Australia/Lindeman\r', 1),
(344, 'Australia/Lord_Howe\r', 1),
(345, 'Australia/Melbourne\r', 1),
(346, 'Australia/North\r', 1),
(347, 'Australia/NSW\r', 1),
(348, 'Australia/Perth\r', 1),
(349, 'Australia/Queensland\r', 1),
(350, 'Australia/South\r', 1),
(351, 'Australia/Sydney\r', 1),
(352, 'Australia/Tasmania\r', 1),
(353, 'Australia/Victoria\r', 1),
(354, 'Australia/West\r', 1),
(355, 'Australia/Yancowinna\r', 1),
(356, 'Brazil/Acre\r', 1),
(357, 'Brazil/DeNoronha\r', 1),
(358, 'Brazil/East\r', 1),
(359, 'Brazil/West\r', 1),
(360, 'Canada/Atlantic\r', 1),
(361, 'Canada/Central\r', 1),
(362, 'Canada/Eastern\r', 1),
(363, 'Canada/East-Saskatchewan\r', 1),
(364, 'Canada/Mountain\r', 1),
(365, 'Canada/Newfoundland\r', 1),
(366, 'Canada/Pacific\r', 1),
(367, 'Canada/Saskatchewan\r', 1),
(368, 'Canada/Yukon\r', 1),
(369, 'CET\r', 1),
(370, 'Chile/Continental\r', 1),
(371, 'Chile/EasterIsland\r', 1),
(372, 'CST6CDT\r', 1),
(373, 'Cuba\r', 1),
(374, 'EET\r', 1),
(375, 'Egypt\r', 1),
(376, 'Eire\r', 1),
(377, 'EST\r', 1),
(378, 'EST5EDT\r', 1),
(379, 'Etc./GMT\r', 1),
(380, 'Etc./GMT+0\r', 1),
(381, 'Etc./UCT\r', 1),
(382, 'Etc./Universal\r', 1),
(383, 'Etc./UTC\r', 1),
(384, 'Etc./Zulu\r', 1),
(385, 'Europe/Amsterdam\r', 1),
(386, 'Europe/Andorra\r', 1),
(387, 'Europe/Athens\r', 1),
(388, 'Europe/Belfast\r', 1),
(389, 'Europe/Belgrade\r', 1),
(390, 'Europe/Berlin\r', 1),
(391, 'Europe/Bratislava\r', 1),
(392, 'Europe/Brussels\r', 1),
(393, 'Europe/Bucharest\r', 1),
(394, 'Europe/Budapest\r', 1),
(395, 'Europe/Chisinau\r', 1),
(396, 'Europe/Copenhagen\r', 1),
(397, 'Europe/Dublin\r', 1),
(398, 'Europe/Gibraltar\r', 1),
(399, 'Europe/Guernsey\r', 1),
(400, 'Europe/Helsinki\r', 1),
(401, 'Europe/Isle_of_Man\r', 1),
(402, 'Europe/Istanbul\r', 1),
(403, 'Europe/Jersey\r', 1),
(404, 'Europe/Kaliningrad\r', 1),
(405, 'Europe/Kiev\r', 1),
(406, 'Europe/Lisbon\r', 1),
(407, 'Europe/Ljubljana\r', 1),
(408, 'Europe/London\r', 1),
(409, 'Europe/Luxembourg\r', 1),
(410, 'Europe/Madrid\r', 1),
(411, 'Europe/Malta\r', 1),
(412, 'Europe/Mariehamn\r', 1),
(413, 'Europe/Minsk\r', 1),
(414, 'Europe/Monaco\r', 1),
(415, 'Europe/Moscow\r', 1),
(416, 'Europe/Nicosia\r', 1),
(417, 'Europe/Oslo\r', 1),
(418, 'Europe/Paris\r', 1),
(419, 'Europe/Podgorica\r', 1),
(420, 'Europe/Prague\r', 1),
(421, 'Europe/Riga\r', 1),
(422, 'Europe/Rome\r', 1),
(423, 'Europe/Samara\r', 1),
(424, 'Europe/San_Marino\r', 1),
(425, 'Europe/Sarajevo\r', 1),
(426, 'Europe/Simferopol\r', 1),
(427, 'Europe/Skopje\r', 1),
(428, 'Europe/Sofia\r', 1),
(429, 'Europe/Stockholm\r', 1),
(430, 'Europe/Tallinn\r', 1),
(431, 'Europe/Tirane\r', 1),
(432, 'Europe/Tiraspol\r', 1),
(433, 'Europe/Uzhgorod\r', 1),
(434, 'Europe/Vaduz\r', 1),
(435, 'Europe/Vatican\r', 1),
(436, 'Europe/Vienna\r', 1),
(437, 'Europe/Vilnius\r', 1),
(438, 'Europe/Volgograd\r', 1),
(439, 'Europe/Warsaw\r', 1),
(440, 'Europe/Zagreb\r', 1),
(441, 'Europe/Zaporozhye\r', 1),
(442, 'Europe/Zurich\r', 1),
(443, 'GB\r', 1),
(444, 'GB-Eire\r', 1),
(445, 'GMT\r', 1),
(446, 'GMT+0\r', 1),
(447, 'GMT0\r', 1),
(448, 'GMT-0\r', 1),
(449, 'Greenwich\r', 1),
(450, 'Hong Kong\r', 1),
(451, 'HST\r', 1),
(452, 'Iceland\r', 1),
(453, 'Indian/Antananarivo\r', 1),
(454, 'Indian/Chagos\r', 1),
(455, 'Indian/Christmas\r', 1),
(456, 'Indian/Cocos\r', 1),
(457, 'Indian/Comoro\r', 1),
(458, 'Indian/Kerguelen\r', 1),
(459, 'Indian/Mahe\r', 1),
(460, 'Indian/Maldives\r', 1),
(461, 'Indian/Mauritius\r', 1),
(462, 'Indian/Mayotte\r', 1),
(463, 'Indian/Reunion\r', 1),
(464, 'Iran\r', 1),
(465, 'Israel\r', 1),
(466, 'Jamaica\r', 1),
(467, 'Japan\r', 1),
(468, 'JST-9\r', 1),
(469, 'Kwajalein\r', 1),
(470, 'Libya\r', 1),
(471, 'MET\r', 1),
(472, 'Mexico/BajaNorte\r', 1),
(473, 'Mexico/BajaSur\r', 1),
(474, 'Mexico/General\r', 1),
(475, 'MST\r', 1),
(476, 'MST7MDT\r', 1),
(477, 'Navajo\r', 1),
(478, 'NZ\r', 1),
(479, 'NZ-CHAT\r', 1),
(480, 'Pacific/Apia\r', 1),
(481, 'Pacific/Auckland\r', 1),
(482, 'Pacific/Chatham\r', 1),
(483, 'Pacific/Chuuk\r', 1),
(484, 'Pacific/Easter\r', 1),
(485, 'Pacific/Efate\r', 1),
(486, 'Pacific/Enderbury\r', 1),
(487, 'Pacific/Fakaofo\r', 1),
(488, 'Pacific/Fiji\r', 1),
(489, 'Pacific/Funafuti\r', 1),
(490, 'Pacific/Galapagos\r', 1),
(491, 'Pacific/Gambier\r', 1),
(492, 'Pacific/Guadalcanal\r', 1),
(493, 'Pacific/Guam\r', 1),
(494, 'Pacific/Honolulu\r', 1),
(495, 'Pacific/Johnston\r', 1),
(496, 'Pacific/Kiritimati\r', 1),
(497, 'Pacific/Kosrae\r', 1),
(498, 'Pacific/Kwajalein\r', 1),
(499, 'Pacific/Majuro\r', 1),
(500, 'Pacific/Marquesas\r', 1),
(501, 'Pacific/Midway\r', 1),
(502, 'Pacific/Nauru\r', 1),
(503, 'Pacific/Niue\r', 1),
(504, 'Pacific/Norfolk\r', 1),
(505, 'Pacific/Noumea\r', 1),
(506, 'Pacific/Pago_Pago\r', 1),
(507, 'Pacific/Palau\r', 1),
(508, 'Pacific/Pitcairn\r', 1),
(509, 'Pacific/Pohnpei\r', 1),
(510, 'Pacific/Ponape\r', 1),
(511, 'Pacific/Port_Moresby\r', 1),
(512, 'Pacific/Rarotonga\r', 1),
(513, 'Pacific/Saipan\r', 1),
(514, 'Pacific/Samoa\r', 1),
(515, 'Pacific/Tahiti\r', 1),
(516, 'Pacific/Tarawa\r', 1),
(517, 'Pacific/Tongatapu\r', 1),
(518, 'Pacific/Truk\r', 1),
(519, 'Pacific/Wake\r', 1),
(520, 'Pacific/Wallis\r', 1),
(521, 'Pacific/Yap\r', 1),
(522, 'Poland\r', 1),
(523, 'Portugal\r', 1),
(524, 'PRC\r', 1),
(525, 'PST8PDT\r', 1),
(526, 'ROC\r', 1),
(527, 'ROK\r', 1),
(528, 'Singapore\r', 1),
(529, 'Turkey\r', 1),
(530, 'UCT\r', 1),
(531, 'Universal\r', 1),
(532, 'US/Alaska\r', 1),
(533, 'US/Aleutian\r', 1),
(534, 'US/Arizona\r', 1),
(535, 'US/Central\r', 1),
(536, 'US/Eastern\r', 1),
(537, 'US/East-Indiana\r', 1),
(538, 'US/Hawaii\r', 1),
(539, 'US/Indiana-Starke\r', 1),
(540, 'US/Michigan\r', 1),
(541, 'US/Mountain\r', 1),
(542, 'US/Pacific\r', 1),
(543, 'US/Pacific-New\r', 1),
(544, 'US/Samoa\r', 1),
(545, 'UTC\r', 1),
(546, 'WET\r', 1),
(547, 'W-SU\r', 1),
(548, 'Zulu\r', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_units`
--

CREATE TABLE `db_units` (
  `id` int(50) NOT NULL,
  `unit_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_units`
--

INSERT INTO `db_units` (`id`, `unit_name`, `description`, `company_id`, `status`) VALUES
(7, 'Box', 'Box Information', NULL, 1),
(9, 'Pieces', 'Pieces Information', NULL, 1),
(10, 'Set', '', NULL, 1),
(11, 'Dozen', '', NULL, 1),
(12, 'Bag', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_users`
--

CREATE TABLE `db_users` (
  `id` int(50) NOT NULL,
  `username` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` blob,
  `member_of` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(405) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` blob,
  `gender` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(1620) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(1620) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` blob,
  `postcode` varchar(270) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `profile_picture` text COLLATE utf8mb4_unicode_ci,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_users`
--

INSERT INTO `db_users` (`id`, `username`, `password`, `member_of`, `firstname`, `lastname`, `mobile`, `email`, `photo`, `gender`, `dob`, `country`, `state`, `city`, `address`, `postcode`, `role_name`, `role_id`, `profile_picture`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`) VALUES
(1, 'admin', 0x6663656139323066373431326235646137626530636634326238633933373539, '', NULL, NULL, '0694387905', 'admin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'uploads/users/1.jpg', '2018-11-27', '::1', NULL, NULL, NULL, 1, 1),
(5, 'admin', 0x37633461386430396361333736326166363165353935323039343364633236343934663839343162, NULL, NULL, NULL, NULL, 'admin@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Account', 0x6531306164633339343962613539616262653536653035376632306638383365, NULL, NULL, NULL, '971555721144', 'suhaildsm@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '', '2023-11-26', '07:49:07 am', 'admin', '::1', 'Suhoos', NULL, 1),
(11, 'drcdemo', 0x6531306164633339343962613539616262653536653035376632306638383365, NULL, NULL, NULL, '1234567890', 'info@drcomputers.ae', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, '', '2023-12-31', '05:56:42 pm', 'admin', '92.98.55.34', 'bba-92-98-55-34.alshamil.net.ae', NULL, 1),
(12, 'riyas', 0x6333333336373730313531316234663630323065633631646564333532303539, NULL, NULL, NULL, '0565251000', 'riyas@drcomputers.ae', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '2024-01-01', '07:30:48 pm', 'admin', '103.161.55.133', 'keralavisionisp-dynamic-133.55.161.103.keralavisionisp.com', NULL, 1),
(13, 'suhail', 0x6333333336373730313531316234663630323065633631646564333532303539, NULL, NULL, NULL, '23232232323', 'suhail@drcomputers.ae', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '2024-01-01', '07:35:06 pm', 'admin', '103.161.55.133', 'keralavisionisp-dynamic-133.55.161.103.keralavisionisp.com', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_warehouse`
--

CREATE TABLE `db_warehouse` (
  `id` int(50) NOT NULL,
  `warehouse_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_warehouse`
--

INSERT INTO `db_warehouse` (`id`, `warehouse_name`, `mobile`, `email`, `status`) VALUES
(1, 'Tegeta', '255656943399', 'seifjawa77@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `temp_holdinvoice`
--

CREATE TABLE `temp_holdinvoice` (
  `id` int(5) NOT NULL,
  `invoice_id` int(5) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `reference_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `item_qty` int(5) DEFAULT NULL,
  `item_price` double(10,2) DEFAULT NULL,
  `tax` double(10,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `db_brands`
--
ALTER TABLE `db_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_category`
--
ALTER TABLE `db_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_ci_sessions`
--
ALTER TABLE `db_ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `db_cobpayments`
--
ALTER TABLE `db_cobpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_company`
--
ALTER TABLE `db_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_country`
--
ALTER TABLE `db_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_currency`
--
ALTER TABLE `db_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_customers`
--
ALTER TABLE `db_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_customer_payments`
--
ALTER TABLE `db_customer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `salespayment_id` (`salespayment_id`);

--
-- Indexes for table `db_delivery_notes`
--
ALTER TABLE `db_delivery_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_delivery_note_items`
--
ALTER TABLE `db_delivery_note_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_expense`
--
ALTER TABLE `db_expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_expense_category`
--
ALTER TABLE `db_expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_hold`
--
ALTER TABLE `db_hold`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `db_holditems`
--
ALTER TABLE `db_holditems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_id` (`hold_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `db_items`
--
ALTER TABLE `db_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_languages`
--
ALTER TABLE `db_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_paymenttypes`
--
ALTER TABLE `db_paymenttypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_permissions`
--
ALTER TABLE `db_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchase`
--
ALTER TABLE `db_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchaseitems`
--
ALTER TABLE `db_purchaseitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchaseitemsreturn`
--
ALTER TABLE `db_purchaseitemsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchasepayments`
--
ALTER TABLE `db_purchasepayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchasepaymentsreturn`
--
ALTER TABLE `db_purchasepaymentsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchasereturn`
--
ALTER TABLE `db_purchasereturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_quoteitems`
--
ALTER TABLE `db_quoteitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_roles`
--
ALTER TABLE `db_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sales`
--
ALTER TABLE `db_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salesitems`
--
ALTER TABLE `db_salesitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salesitemsreturn`
--
ALTER TABLE `db_salesitemsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salespayments`
--
ALTER TABLE `db_salespayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salespaymentsreturn`
--
ALTER TABLE `db_salespaymentsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salesreturn`
--
ALTER TABLE `db_salesreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sales_quote`
--
ALTER TABLE `db_sales_quote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sitesettings`
--
ALTER TABLE `db_sitesettings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencysymbol_id` (`currencysymbol_id`);

--
-- Indexes for table `db_smsapi`
--
ALTER TABLE `db_smsapi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_smstemplates`
--
ALTER TABLE `db_smstemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sobpayments`
--
ALTER TABLE `db_sobpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_states`
--
ALTER TABLE `db_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_stockentry`
--
ALTER TABLE `db_stockentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_suppliers`
--
ALTER TABLE `db_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_supplier_payments`
--
ALTER TABLE `db_supplier_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `purchasepayment_id` (`purchasepayment_id`);

--
-- Indexes for table `db_tax`
--
ALTER TABLE `db_tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_timezone`
--
ALTER TABLE `db_timezone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_units`
--
ALTER TABLE `db_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_users`
--
ALTER TABLE `db_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_warehouse`
--
ALTER TABLE `db_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_holdinvoice`
--
ALTER TABLE `temp_holdinvoice`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_brands`
--
ALTER TABLE `db_brands`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `db_cobpayments`
--
ALTER TABLE `db_cobpayments`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_company`
--
ALTER TABLE `db_company`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_country`
--
ALTER TABLE `db_country`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `db_currency`
--
ALTER TABLE `db_currency`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `db_customers`
--
ALTER TABLE `db_customers`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `db_customer_payments`
--
ALTER TABLE `db_customer_payments`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `db_delivery_notes`
--
ALTER TABLE `db_delivery_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `db_delivery_note_items`
--
ALTER TABLE `db_delivery_note_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `db_expense`
--
ALTER TABLE `db_expense`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_expense_category`
--
ALTER TABLE `db_expense_category`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `db_hold`
--
ALTER TABLE `db_hold`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_holditems`
--
ALTER TABLE `db_holditems`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_items`
--
ALTER TABLE `db_items`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `db_languages`
--
ALTER TABLE `db_languages`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `db_paymenttypes`
--
ALTER TABLE `db_paymenttypes`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_permissions`
--
ALTER TABLE `db_permissions`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1020;

--
-- AUTO_INCREMENT for table `db_purchase`
--
ALTER TABLE `db_purchase`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_purchaseitems`
--
ALTER TABLE `db_purchaseitems`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `db_purchaseitemsreturn`
--
ALTER TABLE `db_purchaseitemsreturn`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_purchasepayments`
--
ALTER TABLE `db_purchasepayments`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_purchasepaymentsreturn`
--
ALTER TABLE `db_purchasepaymentsreturn`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_purchasereturn`
--
ALTER TABLE `db_purchasereturn`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_quoteitems`
--
ALTER TABLE `db_quoteitems`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `db_roles`
--
ALTER TABLE `db_roles`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `db_sales`
--
ALTER TABLE `db_sales`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `db_salesitems`
--
ALTER TABLE `db_salesitems`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `db_salesitemsreturn`
--
ALTER TABLE `db_salesitemsreturn`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_salespayments`
--
ALTER TABLE `db_salespayments`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `db_salespaymentsreturn`
--
ALTER TABLE `db_salespaymentsreturn`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_salesreturn`
--
ALTER TABLE `db_salesreturn`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_sales_quote`
--
ALTER TABLE `db_sales_quote`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `db_sitesettings`
--
ALTER TABLE `db_sitesettings`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_smsapi`
--
ALTER TABLE `db_smsapi`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `db_smstemplates`
--
ALTER TABLE `db_smstemplates`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_sobpayments`
--
ALTER TABLE `db_sobpayments`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_states`
--
ALTER TABLE `db_states`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `db_stockentry`
--
ALTER TABLE `db_stockentry`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_suppliers`
--
ALTER TABLE `db_suppliers`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_supplier_payments`
--
ALTER TABLE `db_supplier_payments`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_tax`
--
ALTER TABLE `db_tax`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_timezone`
--
ALTER TABLE `db_timezone`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;

--
-- AUTO_INCREMENT for table `db_units`
--
ALTER TABLE `db_units`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `db_users`
--
ALTER TABLE `db_users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `db_warehouse`
--
ALTER TABLE `db_warehouse`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `temp_holdinvoice`
--
ALTER TABLE `temp_holdinvoice`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `db_customer_payments`
--
ALTER TABLE `db_customer_payments`
  ADD CONSTRAINT `db_customer_payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_customer_payments_ibfk_2` FOREIGN KEY (`salespayment_id`) REFERENCES `db_salespayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_hold`
--
ALTER TABLE `db_hold`
  ADD CONSTRAINT `db_hold_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_holditems`
--
ALTER TABLE `db_holditems`
  ADD CONSTRAINT `db_holditems_ibfk_2` FOREIGN KEY (`hold_id`) REFERENCES `db_hold` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_holditems_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_supplier_payments`
--
ALTER TABLE `db_supplier_payments`
  ADD CONSTRAINT `db_supplier_payments_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_supplier_payments_ibfk_2` FOREIGN KEY (`purchasepayment_id`) REFERENCES `db_purchasepayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
