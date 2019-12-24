-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 24, 2019 at 05:34 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isp-simonaroberts-com`
--

-- --------------------------------------------------------

--
-- Table structure for table `lists__addresses`
--

CREATE TABLE `lists__addresses` (
  `id` int(32) UNSIGNED NOT NULL,
  `types` varchar(255) NOT NULL DEFAULT '',
  `unit` varchar(10) NOT NULL DEFAULT '',
  `building` varchar(10) NOT NULL DEFAULT '',
  `street` varchar(64) NOT NULL DEFAULT '',
  `suburb` varchar(64) NOT NULL DEFAULT '',
  `state` varchar(64) NOT NULL DEFAULT '',
  `country` varchar(64) NOT NULL DEFAULT '',
  `country_iso2` varchar(2) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL DEFAULT '',
  `council` varchar(255) NOT NULL DEFAULT '',
  `google-placesid` varchar(255) NOT NULL DEFAULT '',
  `longitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `latitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `view_ne_longitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `view_nw_latitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `view_sw_longitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `view_sw_latitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `formatted` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__claimableservices`
--

CREATE TABLE `lists__claimableservices` (
  `id` bigint(32) UNSIGNED NOT NULL,
  `state` enum('bucky','claimed') NOT NULL DEFAULT 'bucky',
  `key-session` varchar(128) NOT NULL DEFAULT '',
  `key-host` varchar(128) NOT NULL DEFAULT '',
  `key-isp` varchar(128) NOT NULL DEFAULT '',
  `key-carrier` varchar(128) NOT NULL DEFAULT '',
  `key-registrar` varchar(128) NOT NULL DEFAULT '',
  `claimed-id` bigint(32) UNSIGNED DEFAULT '0',
  `hostnames` tinytext,
  `name` varchar(128) NOT NULL DEFAULT '',
  `nameurl` varchar(250) NOT NULL DEFAULT '',
  `nameemail` varchar(196) NOT NULL DEFAULT '',
  `nametwitterurl` varchar(250) NOT NULL DEFAULT '',
  `companyemails` tinytext,
  `companyname` varchar(128) NOT NULL DEFAULT '',
  `companyurl` varchar(250) NOT NULL DEFAULT '',
  `companyrbn` varchar(64) NOT NULL DEFAULT '',
  `companyrbntype` varchar(13) NOT NULL DEFAULT '',
  `companytype` varchar(64) NOT NULL DEFAULT '',
  `companytwitterurls` tinytext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `emailed` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `tweeted` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `updated` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `finished` int(12) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for Storage and Reporting on NTP Services';

--
-- Dumping data for table `lists__claimableservices`
--

INSERT INTO `lists__claimableservices` (`id`, `state`, `key-session`, `key-host`, `key-isp`, `key-carrier`, `key-registrar`, `claimed-id`, `hostnames`, `name`, `nameurl`, `nameemail`, `nametwitterurl`, `companyemails`, `companyname`, `companyurl`, `companyrbn`, `companyrbntype`, `companytype`, `companytwitterurls`, `created`, `emailed`, `tweeted`, `updated`, `finished`) VALUES
(1, 'bucky', '7fa8e3ad78e8d1d2dc05ed7f3bba7325', '', '', '', '', 0, '[\"runnet.sy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@runnet.sy\"]', 'RunNet', 'http://runnet.sy', '', '', '', '[\"https:\\/\\/twitter.com\\/RUNNET_ISP\",\"https:\\/\\/twitter.com\\/RUNNET_ISP\"]', '2019-07-11 13:16:22', 0, 0, 0, 0),
(2, 'bucky', 'daad2240eb9f8ef2be609f7c5153f372', '', '', '', '', 0, '[\"iwayafrica.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iwayafrica.com\"]', 'iWayAfrica', 'http://iwayafrica.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(3, 'bucky', 'ce4384dfa3d2ce902a96b971005b0962', '', '', '', '', 0, '[\"instatelecom.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@instatelecom.com\"]', 'AfSat', 'http://instatelecom.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(4, 'bucky', 'fe5ee173e77b36fc761c065f74ae1f1e', '', '', '', '', 0, '[\"neda.af\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@neda.af\"]', 'Neda', 'http://neda.af', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(5, 'bucky', '502df5d41eff8e6558dcb38d5944c236', '', '', '', '', 0, '[\"ranatech.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ranatech.com\"]', 'Rana Technologies', 'http://ranatech.com', '', '', '', '[\"https:\\/\\/twitter.com\\/RANATechnologie\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(6, 'bucky', 'de9a0cc98ad8f4bf77864101dadd07f4', '', '', '', '', 0, '[\"uatelecom.af\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@uatelecom.af\"]', 'Unique Atlantic Telecommunication', 'http://uatelecom.af', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(8, 'bucky', '13595ea65b99d0c689f75c32bd107faa', '', '', '', '', 0, '[\"abissnet.al\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@abissnet.al\"]', 'Abissnet', 'http://abissnet.al', '', '', '', '[\"https:\\/\\/twitter.com\\/Abissnet\",\"https:\\/\\/twitter.com\\/alAbissnet\",\"https:\\/\\/twitter.com\\/HRAbissnet\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(9, 'bucky', '0787730676f7aac48975b202d120f770', '', '', '', '', 0, '[\"adanet.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@adanet.net\"]', 'AdaNet', 'http://adanet.net', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(10, 'bucky', 'd786e7c1305363b2eb0e826c7f1949a2', '', '', '', '', 0, '[\"albaniaonline.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@albaniaonline.net\"]', 'Albania Online', 'http://albaniaonline.net', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(11, 'bucky', '3b528aa0c39358fedf22f6df02cd86f9', '', '', '', '', 0, '[\"amc.al\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@amc.al\"]', 'AMC', 'http://amc.al', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(13, 'bucky', '9fb93161601091f890eada520f2121ed', '', '', '', '', 0, '[\"cerist.dz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cerist.dz\"]', 'Cerist', 'http://cerist.dz', '', '', '', '[\"https:\\/\\/twitter.com\\/CERISTDZ\",\"https:\\/\\/twitter.com\\/CeristDL\",\"https:\\/\\/twitter.com\\/CeristWebtv\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(14, 'bucky', 'c8f23a444e0b7625d5ef2243fb6cdf5d', '', '', '', '', 0, '[\"dzsol.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@dzsol.com\"]', 'DZsol', 'http://dzsol.com', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/hebergement\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(15, 'bucky', '96c65fbd9f9b76fbc9f71534aeb92faf', '', '', '', '', 0, '[\"gecos.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@gecos.net\"]', 'Gecos', 'http://gecos.net', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(16, 'bucky', '75fb1b3fb111a7e096cebfbe2214b540', '', '', '', '', 0, '[\"isc-net.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@isc-net.com\"]', 'ISC', 'http://isc-net.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(18, 'bucky', '9a11862f6631ce32b80202c64ff35f39', '', '', '', '', 0, '[\"andorratelecom.ad\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@andorratelecom.ad\"]', 'Andorra Telecom: Inici', 'http://andorratelecom.ad', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(20, 'bucky', '66c1e6ca08aefd8a1789662758353b26', '', '', '', '', 0, '[\"acs.ao\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@acs.ao\"]', 'ACS', 'http://acs.ao', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(21, 'bucky', '5a50032d2c300aa511e49c236f2e2e98', '', '', '', '', 0, '[\"internet.ao\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@internet.ao\"]', 'ITA - Internet Technologies Angola', 'http://internet.ao', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(23, 'bucky', '37e8a42c55af68bbb081122612bd7aed', '', '', '', '', 0, '[\"multitel.co.ao\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@multitel.co.ao\"]', 'Multitel', 'http://multitel.co.ao', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(24, 'bucky', 'b500f60dd8df1b7aec10aad8d6653e33', '', '', '', '', 0, '[\"netone.co.ao\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netone.co.ao\"]', 'NetOne', 'http://netone.co.ao', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(25, 'bucky', '0b5cb4a9af2b15b475f453429b03372c', '', '', '', '', 0, '[\"tvcabo.co.ao\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tvcabo.co.ao\"]', 'TV-Cabo', 'http://tvcabo.co.ao', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(27, 'bucky', 'b12b30e0a294f18f6f9e363d60bf74c3', '', '', '', '', 0, '[\"arminco.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@arminco.com\"]', 'Arminco', 'http://arminco.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(29, 'bucky', '79da1ab45b2c6bedcb4155c8fb279639', '', '', '', '', 0, '[\"acw.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@acw.at\"]', 'ACW', 'http://acw.at', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(30, 'bucky', 'efd34c76ac5ca198910b7d241a504a3e', '', '', '', '', 0, '[\"bnet.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bnet.at\"]', 'B.net (Burgenland Telekom)', 'http://bnet.at', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(31, 'bucky', '4dbf01691a3e46a132ef0d0769170da3', '', '', '', '', 0, '[\"cnet.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cnet.at\"]', 'CNet (Fugger Computertechnik)', 'http://cnet.at', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(32, 'bucky', '748770526d40ddf5f7a643f651f90563', '', '', '', '', 0, '[\"empirion.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@empirion.at\"]', 'Empirion Telekommunikations', 'http://empirion.at', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(33, 'bucky', '71ec41f547357a2274c333bdcc27475e', '', '', '', '', 0, '[\"etel.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@etel.at\"]', 'eTel Austria', 'http://etel.at', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(34, 'bucky', 'dcaaf7ead05f5287af03257bde4f6e71', '', '', '', '', 0, '[\"innonet.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@innonet.at\"]', 'INNONET', 'http://innonet.at', '', '', '', '[\"https:\\/\\/twitter.com\\/myinnonet\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(35, 'bucky', '66cafd279a07f7caec6c0ac0b5d38c4f', '', '', '', '', 0, '[\"ipaustria.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ipaustria.com\"]', 'IP Austria', 'http://ipaustria.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(36, 'bucky', 'af4fecc5c78b5265868b803ce8e3f7c8', '', '', '', '', 0, '[\"miex.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@miex.at\"]', 'mieX', 'http://miex.at', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(37, 'bucky', 'cfc2c108ade098df186fd3f73b899f53', '', '', '', '', 0, '[\"net4you.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@net4you.net\"]', 'Net4You', 'http://net4you.net', '', '', '', '[\"https:\\/\\/twitter.com\\/Net4You\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(38, 'bucky', '9946cb30b05446b61af51c2aa4371bb3', '', '', '', '', 0, '[\"oebbtel.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@oebbtel.at\"]', 'ÃBB Tel', 'http://oebbtel.at', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(39, 'bucky', '4e2b5efd2dda5ca110e697e78ced9dfa', '', '', '', '', 0, '[\"onstage.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@onstage.at\"]', 'ON STAGE', 'http://onstage.at', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(40, 'bucky', '664de6a751ef698710ce02087a47ad5c', '', '', '', '', 0, '[\"sil.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sil.at\"]', 'Silver Server', 'http://sil.at', '', '', '', '[\"https:\\/\\/twitter.com\\/SilverServerAT\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(41, 'bucky', '3adab9f3fbe16f8ab17cb13a6a392048', '', '', '', '', 0, '[\"telekom.at\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telekom.at\"]', 'Telekom Austria', 'http://telekom.at', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(43, 'bucky', '92ea5c2fd853bd19075cd2f03f0ca5d7', '', '', '', '', 0, '[\"sazz.az\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sazz.az\"]', 'AzQTel', 'http://sazz.az', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(44, 'bucky', '5464ad7e9277f6bd1a0daec03dacd479', '', '', '', '', 0, '[\"castel.az\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@castel.az\"]', 'Caspian Telecom', 'http://castel.az', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/caspiantelecom\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(46, 'bucky', '873d09efda51f506b97afe00ab7cd120', '', '', '', '', 0, '[\"batelco.com.bh\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@batelco.com.bh\"]', 'Inet Batelco', 'http://batelco.com.bh', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(48, 'bucky', 'd498dc71760f673322282f49ba5cb2e7', '', '', '', '', 0, '[\"anitex.by\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@anitex.by\"]', 'Anitex', 'http://anitex.by', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(49, 'bucky', 'f866906ae4ebc10b2275e6c21a803506', '', '', '', '', 0, '[\"beltelecom.by\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@beltelecom.by\"]', 'Beltelecom', 'http://beltelecom.by', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/BeltelecomBy\",\"https:\\/\\/twitter.com\\/123beltelecom\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(50, 'bucky', 'cd88723afba58eef14d32c9c896e7b92', '', '', '', '', 0, '[\"life.com.by\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@life.com.by\"]', 'life', 'http://life.com.by', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(51, 'bucky', '0220608f90337f9203104164af3f05a9', '', '', '', '', 0, '[\"nsys.by\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nsys.by\"]', 'Network Systems', 'http://nsys.by', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(52, 'bucky', 'bd7f50bc41d9b9a2717749790cb0bec9', '', '', '', '', 0, '[\"ok.by\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ok.by\"]', 'Open Contact', 'http://ok.by', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(54, 'bucky', '916acd5a7f7ba2b716b1323f8ee51e92', '', '', '', '', 0, '[\"belizetelemedia.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@belizetelemedia.net\"]', 'Belize', 'http://belizetelemedia.net', '', '', '', '[\"https:\\/\\/twitter.com\\/BelizeTelemedia\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(55, 'bucky', 'e53209bebda624bd9c0fc3997e41a8cd', '', '', '', '', 0, '[\"speednet-wireless.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@speednet-wireless.com\"]', 'Speednet', 'http://speednet-wireless.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(56, 'bucky', '5902aa60fed458ee262398f550d565ec', '', '', '', '', 0, '[\"speednet-wireless.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@speednet-wireless.com\"]', 'Speednet', 'http://speednet-wireless.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(57, 'bucky', '6b3804b6f3a71883a3e5f30dceeba7fd', '', '', '', '', 0, '[\"alinktelecom.bj\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alinktelecom.bj\"]', 'Alink Telecom', 'http://alinktelecom.bj', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(58, 'bucky', 'ecc782558c896b1107e02ed241449707', '', '', '', '', 0, '[\"benintelecoms.bj\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@benintelecoms.bj\"]', 'BENIN TELECOMS', 'http://benintelecoms.bj', '', '', '', '[\"https:\\/\\/twitter.com\\/BeninTelecoms\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(59, 'bucky', '14feb5da6d2377e770981e869b7bc9b3', '', '', '', '', 0, '[\"firstnet.bj\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@firstnet.bj\"]', 'FIRSTNET', 'http://firstnet.bj', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(60, 'bucky', '9a6c3483d0b814e38d10214ddf3671d0', '', '', '', '', 0, '[\"hpcbenin.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hpcbenin.com\"]', 'HPC', 'http://hpcbenin.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(61, 'bucky', '7485cbb4055d1c79a49457e4d80c01ff', '', '', '', '', 0, '[\"isoceltelecom.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@isoceltelecom.com\"]', 'ISOCEL TELECOM', 'http://isoceltelecom.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(62, 'bucky', '2211a98fff96c9d1608c8dcddfbff22a', '', '', '', '', 0, '[\"otelecom.bj\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@otelecom.bj\"]', 'OTELECOM', 'http://otelecom.bj', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(63, 'bucky', '6f0309e3d664bcde118f1829978f6e33', '', '', '', '', 0, '[\"pharaon-telecom.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@pharaon-telecom.net\"]', 'PHARAON TELECOM', 'http://pharaon-telecom.net', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(64, 'bucky', 'a7043499bb2343de0b1f78f52d8ee962', '', '', '', '', 0, '[\"sobiex.bj\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sobiex.bj\"]', 'SOBIEX', 'http://sobiex.bj', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(66, 'bucky', '03003189befce50bf3c5a6b4cdb2335d', '', '', '', '', 0, '[\"telecom.net.bt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telecom.net.bt\"]', 'Bhutan Telecom Ltd', 'http://telecom.net.bt', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(67, 'bucky', '6091a93d5a7a7e75f53e06124c9cb616', '', '', '', '', 0, '[\"druknet.bt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@druknet.bt\"]', 'Druknet', 'http://druknet.bt', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(69, 'bucky', 'a2cd6f5b30fe71e9d4e3f670170cb261', '', '', '', '', 0, '[\"axsbolivia.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@axsbolivia.com\"]', 'AXS Bolivia', 'http://axsbolivia.com', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/axsbolivia\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(70, 'bucky', 'bf44570b26341f4b2b061709455d199c', '', '', '', '', 0, '[\"boliviatel.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@boliviatel.com\"]', 'BoliviaTel', 'http://boliviatel.com', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(71, 'bucky', '0e47d6e2f42729173cc52eaf80baedf9', '', '', '', '', 0, '[\"comteco.com.bo\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@comteco.com.bo\"]', 'Comteco', 'http://comteco.com.bo', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(72, 'bucky', '142454556a32c6d0718afa104d05b104', '', '', '', '', 0, '[\"cotas.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cotas.com\"]', 'Cotas', 'http://cotas.com', '', '', '', '[\"https:\\/\\/twitter.com\\/CotasConVos\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(73, 'bucky', '8304046bb61ffe1c971d43f7819dc1d3', '', '', '', '', 0, '[\"cotel.bo\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cotel.bo\"]', 'Cotel', 'http://cotel.bo', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(74, 'bucky', '79654aea0a8167a9388425bb2592847c', '', '', '', '', 0, '[\"entel.bo\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@entel.bo\"]', 'Entel Bolivia', 'http://entel.bo', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/EntelBolivia\",\"https:\\/\\/twitter.com\\/BoliviaEntel\",\"https:\\/\\/twitter.com\\/entelbo\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(76, 'bucky', '43aea9cf7458b6bb7c1191e14f8fd65b', '', '', '', '', 0, '[\"bhtelecom.ba\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bhtelecom.ba\"]', 'BH Telecom', 'http://bhtelecom.ba', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/bhtelecom\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(77, 'bucky', 'a6e1963553e6f9e3aa3560b204ae521b', '', '', '', '', 0, '[\"bhb.ba\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bhb.ba\"]', 'BHB CABLE TV', 'http://bhb.ba', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(78, 'bucky', '55c9880708b37c09c8dd282205dc53bd', '', '', '', '', 0, '[\"elta-kabel.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@elta-kabel.com\"]', 'ELTA-KABEL', 'http://elta-kabel.com', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/EltaKabel\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(79, 'bucky', '7fc40ab2b926deb7b23d3876923c173b', '', '', '', '', 0, '[\"europronet.ba\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@europronet.ba\"]', 'EuroproNet', 'http://europronet.ba', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(80, 'bucky', '341335977e9273c3f3987066275e52ea', '', '', '', '', 0, '[\"ht.ba\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ht.ba\"]', 'HT Mostar', 'http://ht.ba', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(81, 'bucky', '6d052d97ee8c42672ee0b7e8afc0719a', '', '', '', '', 0, '[\"hs-hkb.ba\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hs-hkb.ba\"]', 'M&H Company', 'http://hs-hkb.ba', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(82, 'bucky', '7345909bd5d1751a4a9d8d69df29dbd2', '', '', '', '', 0, '[\"telemach.ba\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telemach.ba\"]', 'Telemach', 'http://telemach.ba', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/BiHtelemach\",\"https:\\/\\/twitter.com\\/TelemachBiH\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(83, 'bucky', 'e60995905bd38e0a4d21c20306d0433a', '', '', '', '', 0, '[\"telemach.ba\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telemach.ba\"]', 'Telemach', 'http://telemach.ba', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/BiHtelemach\",\"https:\\/\\/twitter.com\\/TelemachBiH\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(84, 'bucky', '0a56814b780b25d27323a6370ed0c0dd', '', '', '', '', 0, '[\"botsnet.bw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@botsnet.bw\"]', 'Botsnet', 'http://botsnet.bw', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(85, 'bucky', 'a22548cb84e44c18da3a37342eb7b3d3', '', '', '', '', 0, '[\"btc.bw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@btc.bw\"]', 'BTC', 'http://btc.bw', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(86, 'bucky', '70c0fbcf94b4a8f43b10259a518f534e', '', '', '', '', 0, '[\"info.bw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@info.bw\"]', 'Ibis', 'http://info.bw', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(87, 'bucky', '2f683458b6b1b262cc625bb0d669411f', '', '', '', '', 0, '[\"mega.bw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mega.bw\"]', 'Mega Internet', 'http://mega.bw', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(88, 'bucky', '7e1a627d23fd068fed3d7e8206cf449b', '', '', '', '', 0, '[\"mega.bw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mega.bw\"]', 'Mega Internet', 'http://mega.bw', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(89, 'bucky', '4f8a034ed6b8b19c4c23754f85a0f9e5', '', '', '', '', 0, '[\"btc-net.bg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@btc-net.bg\"]', 'BTC-Net', 'http://btc-net.bg', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(90, 'bucky', 'cc81550b2725c942d5d9f52970980752', '', '', '', '', 0, '[\"digsys.bg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@digsys.bg\"]', 'Digital Systems', 'http://digsys.bg', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(91, 'bucky', '379aaf2e81497fd899c37d5a3161b78e', '', '', '', '', 0, '[\"einet.bg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@einet.bg\"]', 'Euro Integra', 'http://einet.bg', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(92, 'bucky', 'a6d412995fa6cd5ebe9e8c4c7b0252e3', '', '', '', '', 0, '[\"mtel.bg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mtel.bg\"]', 'MobilTel', 'http://mtel.bg', '', '', '', '[\"\"]', '2019-07-11 13:23:47', 0, 0, 0, 0),
(93, 'bucky', '9de5e28f9165e82673683fceee3754c6', '', '', '', '', 0, '[\"networx-bg.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@networx-bg.com\"]', 'Networx-BG', 'http://networx-bg.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(94, 'bucky', '8d6bdf7d36156d7a17bed2b576adbcac', '', '', '', '', 0, '[\"orbitel.bg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orbitel.bg\"]', 'Orbitel (Bulgarian company)', 'http://orbitel.bg', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(95, 'bucky', '9bde81eb974ceedd32646a169cbba960', '', '', '', '', 0, '[\"alinktelecom.bf\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alinktelecom.bf\"]', 'Alink Telecom', 'http://alinktelecom.bf', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(96, 'bucky', '6d273fe140770123a6b5ebf1c5265d72', '', '', '', '', 0, '[\"cenatrin.bf\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cenatrin.bf\"]', 'CENATRIN', 'http://cenatrin.bf', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(97, 'bucky', 'efa2f621df1aaac965a9088968e4e60b', '', '', '', '', 0, '[\"giganet.bf\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@giganet.bf\"]', 'GIGANET', 'http://giganet.bf', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(98, 'bucky', '6fc1d5a5d049af99d14798a2075059fe', '', '', '', '', 0, '[\"ipsys-bf.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ipsys-bf.com\"]', 'IPSYS', 'http://ipsys-bf.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(99, 'bucky', 'd75c3e4647bd9c3d29a86576b939d502', '', '', '', '', 0, '[\"onatel.bf\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@onatel.bf\"]', 'ONATEL', 'http://onatel.bf', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/ONATELBURKINA\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(100, 'bucky', '6af0dc6500c64906bc38e29ee54a370d', '', '', '', '', 0, '[\"river.bf\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@river.bf\"]', 'RIVER TELECOM', 'http://river.bf', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(102, 'bucky', '2317a2e463119bd6cc3ec5ef215818dd', '', '', '', '', 0, '[\"cbinf.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cbinf.com\"]', 'CBINET', 'http://cbinf.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(103, 'bucky', '07e1b830ab0781e82804c2a7495ec6a0', '', '', '', '', 0, '[\"usan-bu.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@usan-bu.net\"]', 'USAN', 'http://usan-bu.net', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(105, 'bucky', '5ba7edbc4ea32db8f33b556a7b47f8ff', '', '', '', '', 0, '[\"camnet.com.kh\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@camnet.com.kh\"]', 'Camnet Internet Service', 'http://camnet.com.kh', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(106, 'bucky', '689c2b7c7d9fdee5128263e656330cbd', '', '', '', '', 0, '[\"chuanwei.com.kh\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@chuanwei.com.kh\"]', 'Chuan Wei', 'http://chuanwei.com.kh', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/chuanweikh\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(108, 'bucky', '1ef0ced47b49c5878ed0dea4e3180245', '', '', '', '', 0, '[\"camtel.cm\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@camtel.cm\"]', 'CAMTEL', 'http://camtel.cm', '', '', '', '[\"https:\\/\\/twitter.com\\/Camtelonline\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(109, 'bucky', 'f89dd5ed5038d4d70ab4fc33b82474c5', '', '', '', '', 0, '[\"creolink.com.\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@creolink.com.\"]', 'CREOLINK', 'http://creolink.com.', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(110, 'bucky', 'e52d3cbac8ab52814e0f25611f6e574c', '', '', '', '', 0, '[\"equacomm.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@equacomm.com\"]', 'EQUACOMM', 'http://equacomm.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(111, 'bucky', '800da5c40a6d2022cc1bd90f709147a7', '', '', '', '', 0, '[\"mtncameroon.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mtncameroon.net\"]', 'MTN', 'http://mtncameroon.net', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(112, 'bucky', '5320ed506a55fc1244b83b3c30fdc3e5', '', '', '', '', 0, '[\"orange.cm\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orange.cm\"]', 'ORANGE', 'http://orange.cm', '', '', '', '[\"https:\\/\\/twitter.com\\/Orange_Cameroun\",\"https:\\/\\/twitter.com\\/OrangeCare_CMR\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(113, 'bucky', 'c40eb6934b2828cb5b332ca1b7f0e47c', '', '', '', '', 0, '[\"ringo-group.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ringo-group.com\"]', 'RINGO', 'http://ringo-group.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(114, 'bucky', 'd2a64632272522777a3660e687f579c9', '', '', '', '', 0, '[\"vodacom.co.za\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vodacom.co.za\"]', 'VODACOM', 'http://vodacom.co.za', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Vodacom\",\"https:\\/\\/twitter.com\\/Vodacom111\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(115, 'bucky', '26ec8a70863e7aba391909663e80b6ea', '', '', '', '', 0, '[\"yoomee.cm\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@yoomee.cm\"]', 'YOOMEE', 'http://yoomee.cm', '', '', '', '[\"https:\\/\\/twitter.com\\/yoomeemobilecm\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(116, 'bucky', '5e8f9efe2b808256162d33ef39e33648', '', '', '', '', 0, '[\"yoomee.cm\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@yoomee.cm\"]', 'YOOMEE', 'http://yoomee.cm', '', '', '', '[\"https:\\/\\/twitter.com\\/yoomeemobilecm\",\"https:\\/\\/twitter.com\\/yoomeemobilecm\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(117, 'bucky', '98a8f2e3f9d16f4df78e96d199298f74', '', '', '', '', 0, '[\"orange.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orange.com\"]', 'Orange', 'http://orange.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(118, 'bucky', '34e829c831d1cfcad9d6b389c930545b', '', '', '', '', 0, '[\"socatel.cf\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@socatel.cf\"]', 'Socatel', 'http://socatel.cf', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(119, 'bucky', '5e1c312747742b8bb6b898d79fabd435', '', '', '', '', 0, '[\"vimpelcom.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vimpelcom.com\"]', 'Telecel', 'http://vimpelcom.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(121, 'bucky', '32af1f1e11fab685a6ce75cd4ece2cb8', '', '', '', '', 0, '[\"saonet.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@saonet.net\"]', 'SAO NET', 'http://saonet.net', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(122, 'bucky', '9c9d0fc5c1d6888d3648250a9acbc8c2', '', '', '', '', 0, '[\"saonet.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@saonet.net\"]', 'SAO NET', 'http://saonet.net', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(123, 'bucky', '687fe7a633ba08893fb33e4386b4e740', '', '', '', '', 0, '[\"alinktelecom.cg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alinktelecom.cg\"]', 'Alink Telecom', 'http://alinktelecom.cg', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(124, 'bucky', 'dbe5ef1d568094d1f6c3b67c53511762', '', '', '', '', 0, '[\"gsi-congo.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@gsi-congo.com\"]', 'GSI CONGO', 'http://gsi-congo.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(125, 'bucky', 'a3e50d3bced651fe41670796fb5dfd06', '', '', '', '', 0, '[\"microcom.cd\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@microcom.cd\"]', 'Microcom', 'http://microcom.cd', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(126, 'bucky', 'c1ea209ae150670089b6d232876ee264', '', '', '', '', 0, '[\"mtncongo.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mtncongo.net\"]', 'MTN CONGO', 'http://mtncongo.net', '', '', '', '[\"https:\\/\\/twitter.com\\/MTN_123\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(127, 'bucky', '17e848f4821b3fce28ee494d39555ea0', '', '', '', '', 0, '[\"ofis-computers.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ofis-computers.com\"]', 'OFIS', 'http://ofis-computers.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(128, 'bucky', '31f290c050434a248db8e7a4b4af963e', '', '', '', '', 0, '[\"data.cr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@data.cr\"]', 'American Data Networks', 'http://data.cr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(129, 'bucky', 'f551178f202a8e8d9b00ff0edfd01be7', '', '', '', '', 0, '[\"data.cr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@data.cr\"]', 'American Data Networks', 'http://data.cr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(130, 'bucky', 'b6b45d2339d48c0c16316d87c450bf7b', '', '', '', '', 0, '[\"amis.hr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@amis.hr\"]', 'Amis Telekom', 'http://amis.hr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(131, 'bucky', '9918580cbb7505c51c04b4ec02c8b1fd', '', '', '', '', 0, '[\"carnet.hr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@carnet.hr\"]', 'CARNet', 'http://carnet.hr', '', '', '', '[\"https:\\/\\/twitter.com\\/CARNET_CUC\",\"https:\\/\\/twitter.com\\/CARNET_HR\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(132, 'bucky', 'bccdc200464c67e8aa49a2a7299ec031', '', '', '', '', 0, '[\"optima.hr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@optima.hr\"]', 'Optima Telekom', 'http://optima.hr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(133, 'bucky', 'b1d6c3a955734a80d7b4c051432b1447', '', '', '', '', 0, '[\"t-com.hr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@t-com.hr\"]', 'T-Com', 'http://t-com.hr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(134, 'bucky', '441caf6d14138beb0e4f9f563632f619', '', '', '', '', 0, '[\"tele2.hr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tele2.hr\"]', 'Tele2', 'http://tele2.hr', '', '', '', '[\"https:\\/\\/twitter.com\\/Tele2Croatia\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(135, 'bucky', '7e50bed1253c711be99092a5f063303e', '', '', '', '', 0, '[\"vip.hr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vip.hr\"]', 'VIPnet', 'http://vip.hr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(137, 'bucky', '660d8d5621ceaa564eb7e06b34bc459f', '', '', '', '', 0, '[\"primetel.com.cy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@primetel.com.cy\"]', 'PrimeTel', 'http://primetel.com.cy', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(138, 'bucky', '1ab49ba85c9c4374fd1ecce8d0b3d733', '', '', '', '', 0, '[\"comx.dk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@comx.dk\"]', 'ComX', 'http://comx.dk', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(139, 'bucky', '743717daef2b2b73078b2822ebcaed87', '', '', '', '', 0, '[\"cybercity.dk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cybercity.dk\"]', 'Cybercity', 'http://cybercity.dk', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(140, 'bucky', 'fa7f0045e2d45f1c01ae73a7b881a258', '', '', '', '', 0, '[\"fullrate.dk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@fullrate.dk\"]', 'Fullrate', 'http://fullrate.dk', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(141, 'bucky', 'f647e311774bdf43ea2ebe1c05d15ff3', '', '', '', '', 0, '[\"tdc.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tdc.com\"]', 'TDC (Tele-Danmark Communications)', 'http://tdc.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(142, 'bucky', 'a61e5f57033be6ad205a97b607dad5dc', '', '', '', '', 0, '[\"editorial.tele2.dk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@editorial.tele2.dk\"]', 'Tele2', 'http://editorial.tele2.dk', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(143, 'bucky', '4fb625084eb32066ccf17c99853e32ea', '', '', '', '', 0, '[\"telenor.dk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telenor.dk\"]', 'Telenor Denmark', 'http://telenor.dk', '', '', '', '[\"https:\\/\\/twitter.com\\/TelenorDanmark\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(144, 'bucky', 'a5f744ba372e5cfc6f64fa72c35c9db0', '', '', '', '', 0, '[\"telia.dk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telia.dk\"]', 'Telia Danmark', 'http://telia.dk', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/TeliaDanmark\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(145, 'bucky', '1823b263fea81643482ab0f9ab4d9fc9', '', '', '', '', 0, '[\"teliasonera.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@teliasonera.com\"]', 'TeliaSonera', 'http://teliasonera.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(147, 'bucky', 'e4c613b20604c989a22c48e0e2b2267e', '', '', '', '', 0, '[\"intnet.dj\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@intnet.dj\"]', 'STID', 'http://intnet.dj', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(148, 'bucky', 'd093fb5c6dbbfaa62917a23534f19483', '', '', '', '', 0, '[\"intnet.dj\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@intnet.dj\"]', 'STID', 'http://intnet.dj', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(149, 'bucky', 'd5f349c842e823d4abd80c1227b3a34d', '', '', '', '', 0, '[\"alegro.com.ec\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alegro.com.ec\"]', 'Alegro PCS', 'http://alegro.com.ec', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(150, 'bucky', 'c003e5256a3b3e8f2d94dfa363f89161', '', '', '', '', 0, '[\"etapatelecom.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@etapatelecom.net\"]', 'Etapatelecom', 'http://etapatelecom.net', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(152, 'bucky', '9e78172bf8c84aed4a03b6cafe0c4143', '', '', '', '', 0, '[\"123.com.sv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@123.com.sv\"]', 'Americatel', 'http://123.com.sv', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(153, 'bucky', 'c3a5805d749871dc1a23431dc4bae5f9', '', '', '', '', 0, '[\"navegante.com.sv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@navegante.com.sv\"]', 'NAVEGANTE', 'http://navegante.com.sv', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(154, 'bucky', '0aece09824ee16cc264370c6a4862c14', '', '', '', '', 0, '[\"telefonica.com.sv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telefonica.com.sv\"]', 'Telefonica', 'http://telefonica.com.sv', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(155, 'bucky', '639726445587eddb985eb3d7ff5a5d8a', '', '', '', '', 0, '[\"telemovil.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telemovil.com\"]', 'Telemovil', 'http://telemovil.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(156, 'bucky', '588245a9dfd9f561cec578f8b8b8222e', '', '', '', '', 0, '[\"tutopia.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tutopia.com\"]', 'Tutopia', 'http://tutopia.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(157, 'bucky', '672920520835dc5cb451540d0719d1c7', '', '', '', '', 0, '[\"tutopia.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tutopia.com\"]', 'Tutopia', 'http://tutopia.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(158, 'bucky', 'f46d8a383eb3ab4b8819fd159e44400f', '', '', '', '', 0, '[\"elion.ee\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@elion.ee\"]', 'Elion', 'http://elion.ee', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(159, 'bucky', '6c1184b6f7b8f80923bdbe535c990055', '', '', '', '', 0, '[\"elisa.ee\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@elisa.ee\"]', 'Elisa', 'http://elisa.ee', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(160, 'bucky', '79a30f12b9228c9e33af6890a29081a8', '', '', '', '', 0, '[\"starman.ee\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@starman.ee\"]', 'Starman', 'http://starman.ee', '', '', '', '[\"https:\\/\\/twitter.com\\/starman_as\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(161, 'bucky', '8ea9f0726e40848b121ab29ef403b958', '', '', '', '', 0, '[\"tele2.ee\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tele2.ee\"]', 'Tele2', 'http://tele2.ee', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(162, 'bucky', '6a3bc3e382862f6fb78992d72cdbb48b', '', '', '', '', 0, '[\"tele2.ee\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tele2.ee\"]', 'Tele2', 'http://tele2.ee', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(163, 'bucky', 'ee9f04e1b8e5e3fc6acc888884124075', '', '', '', '', 0, '[\"anvia.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@anvia.fi\"]', 'Anvia', 'http://anvia.fi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(164, 'bucky', '215e272f93d7998df155345138585f5d', '', '', '', '', 0, '[\"sgnet.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sgnet.fi\"]', 'Archipelago Networks', 'http://sgnet.fi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0);
INSERT INTO `lists__claimableservices` (`id`, `state`, `key-session`, `key-host`, `key-isp`, `key-carrier`, `key-registrar`, `claimed-id`, `hostnames`, `name`, `nameurl`, `nameemail`, `nametwitterurl`, `companyemails`, `companyname`, `companyurl`, `companyrbn`, `companyrbntype`, `companytype`, `companytwitterurls`, `created`, `emailed`, `tweeted`, `updated`, `finished`) VALUES
(165, 'bucky', '0a94bec6f720081d53913d89c18e334d', '', '', '', '', 0, '[\"dna.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@dna.fi\"]', 'DNA Oy', 'http://dna.fi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(166, 'bucky', 'c3ef729d9a4f9ce4d000af54576f2bf8', '', '', '', '', 0, '[\"elisa.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@elisa.com\"]', 'Elisa (company)', 'http://elisa.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(167, 'bucky', 'c0a062ff48b59ea11895269dd6bdd1e1', '', '', '', '', 0, '[\"finnet.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@finnet.fi\"]', 'Finnet (DNA)', 'http://finnet.fi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(168, 'bucky', '1d13a59a9a4b54b772ecea9b6704bc8f', '', '', '', '', 0, '[\"fsp.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@fsp.fi\"]', 'FSP (Forssa Telephone Company)', 'http://fsp.fi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(169, 'bucky', '465963cec21b5b6803712bd6286b7351', '', '', '', '', 0, '[\"lounea.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@lounea.fi\"]', 'Lounea', 'http://lounea.fi', '', '', '', '[\"https:\\/\\/twitter.com\\/LouneaOy\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(170, 'bucky', '00b2e01da44b0d27f13026c2eb555c68', '', '', '', '', 0, '[\"nette.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nette.fi\"]', 'Nette (ISP)', 'http://nette.fi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(171, 'bucky', '91350025c11743005d5a6efcc483b674', '', '', '', '', 0, '[\"saunalahti.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@saunalahti.fi\"]', 'Saunalahti', 'http://saunalahti.fi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(172, 'bucky', '62a40501c9120f8edff8f2a9cfe52d46', '', '', '', '', 0, '[\"sonera.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sonera.fi\"]', 'Sonera', 'http://sonera.fi', '', '', '', '[\"https:\\/\\/twitter.com\\/SoneraNG\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(174, 'bucky', 'a11cfcc9a9797fe93f33c527b3071dfd', '', '', '', '', 0, '[\"tele.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tele.fi\"]', 'Tele Finland', 'http://tele.fi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(175, 'bucky', '7c4d1d45a126161d4615093c966fe128', '', '', '', '', 0, '[\"teliasonera.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@teliasonera.com\"]', 'TeliaSonera', 'http://teliasonera.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(176, 'bucky', '0372e4011bd2c49309c760dd7f3f61db', '', '', '', '', 0, '[\"welho.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@welho.fi\"]', 'Welho', 'http://welho.fi', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Welho\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(177, 'bucky', '60006d001e6e4c6e623ae01f88e3a6f6', '', '', '', '', 0, '[\"welho.fi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@welho.fi\"]', 'Welho', 'http://welho.fi', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Welho\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(178, 'bucky', '6ca5b27c9b8ab9f6e8de891907690b08', '', '', '', '', 0, '[\"artel.ga\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@artel.ga\"]', 'ARTEL GABON', 'http://artel.ga', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(179, 'bucky', '6f32b70afdb69cecd5886abb9426f14a', '', '', '', '', 0, '[\"internetgabon.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@internetgabon.com\"]', 'INTERNET GABON', 'http://internetgabon.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(181, 'bucky', '90652e2a46852e4b7307fb9febf0e4b5', '', '', '', '', 0, '[\"accelonafrica.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@accelonafrica.com\"]', 'ACELON GHANA', 'http://accelonafrica.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(182, 'bucky', 'f6cf09867442f80bef6d0097156e59cf', '', '', '', '', 0, '[\"africaonline.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@africaonline.com\"]', 'Africa Online', 'http://africaonline.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(183, 'bucky', 'b1758bce04a29b02903a6277df0debd5', '', '', '', '', 0, '[\"afrinetcom.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@afrinetcom.net\"]', 'AFRINET COMMUNICATIONS', 'http://afrinetcom.net', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(184, 'bucky', '5e1c7b3a7cdfaccb67f023083186315a', '', '', '', '', 0, '[\"afripatelecom.gh\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@afripatelecom.gh\"]', 'AFRIPA TELECOM GHANA', 'http://afripatelecom.gh', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(185, 'bucky', '4b9334b17ad5c34958f800d7738c1c5f', '', '', '', '', 0, '[\"alinktelecom.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alinktelecom.net\"]', 'Alink Telecom', 'http://alinktelecom.net', '', '', '', '[\"https:\\/\\/twitter.com\\/AlinkTelecom\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(186, 'bucky', '2e4bd4b4b555b57ef2ca2b07ca55cee8', '', '', '', '', 0, '[\"busyinternet.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@busyinternet.com\"]', 'BUSYINTERNET', 'http://busyinternet.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(187, 'bucky', '2356c4ef335f15bde1943d0a25d8de47', '', '', '', '', 0, '[\"dart.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@dart.com\"]', 'DART COMMUNICATION', 'http://dart.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(188, 'bucky', '9ada27ad2e74075c58811b6d18bfb4c5', '', '', '', '', 0, '[\"discoverytelghana.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@discoverytelghana.net\"]', 'DISCOVERYTEL GHANA', 'http://discoverytelghana.net', '', '', '', '[\"https:\\/\\/twitter.com\\/DiscoverytelG\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(189, 'bucky', '79272033ef4ec7578fc0630ee039208a', '', '', '', '', 0, '[\"ecoband.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ecoband.net\"]', 'ECOBAND NETWORKS', 'http://ecoband.net', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(190, 'bucky', '7aeea1cd1d9433ae32c0720f97ac13eb', '', '', '', '', 0, '[\"iburstghana.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iburstghana.com\"]', 'IBURST GHANA', 'http://iburstghana.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(191, 'bucky', '7424d457de9b21c3f6d03b7f3d97f585', '', '', '', '', 0, '[\"internetghana.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@internetghana.com\"]', 'INTERNET GHANA', 'http://internetghana.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(192, 'bucky', '795e33581e357a1244f7f71490f3bf58', '', '', '', '', 0, '[\"iwayafrica.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iwayafrica.com\"]', 'iWayAfrica', 'http://iwayafrica.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(193, 'bucky', 'ef0719aa93a9357bca86106c3276395e', '', '', '', '', 0, '[\"knetgh.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@knetgh.com\"]', 'K NET MULTIMEDIA DATA NETWORK', 'http://knetgh.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(194, 'bucky', '0b28f764f2c4b42d1ef989b0e841bddb', '', '', '', '', 0, '[\"kaissin.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@kaissin.net\"]', 'KAISS INN', 'http://kaissin.net', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(195, 'bucky', '2d6fac2f3cf58c825e8148356f99816d', '', '', '', '', 0, '[\"linkserve.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@linkserve.net\"]', 'LINKSERVE', 'http://linkserve.net', '', '', '', '[\"https:\\/\\/twitter.com\\/Linkserve\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(196, 'bucky', '3bc24de0e64bcd9a81a142b9af8f6851', '', '', '', '', 0, '[\"mobile2i.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mobile2i.com\"]', 'MOBILE 2 I', 'http://mobile2i.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(197, 'bucky', '6a1ad51031c8b9b85393ce577d0a54fd', '', '', '', '', 0, '[\"nasglobal.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nasglobal.com\"]', 'NAS INTER GLOBAL NETWORKS', 'http://nasglobal.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(198, 'bucky', '22e8e9d056eeeb14cb9b636db9f3e65c', '', '', '', '', 0, '[\"nbteleworld.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nbteleworld.com\"]', 'NB TELEWORLD GHANA', 'http://nbteleworld.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(199, 'bucky', '122c2474f9b97a860156032adcd98438', '', '', '', '', 0, '[\"clickghana.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@clickghana.com\"]', 'NCS', 'http://clickghana.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(201, 'bucky', '11ca2152cd2ed267f7cf8a3e2a3e71f6', '', '', '', '', 0, '[\"cts-europe.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cts-europe.com\"]', 'CTS Gibraltar', 'http://cts-europe.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(202, 'bucky', '8f1f62514f3357eec350ba7e7d46935f', '', '', '', '', 0, '[\"gibnet.gi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@gibnet.gi\"]', 'GibNet', 'http://gibnet.gi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(203, 'bucky', '9500f2d59f4dc704fe6d12560d68c723', '', '', '', '', 0, '[\"gibtele.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@gibtele.com\"]', 'Gibtelecom', 'http://gibtele.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(204, 'bucky', '240b941811f0c142210d058c876e4949', '', '', '', '', 0, '[\"sapphire.gi\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sapphire.gi\"]', 'Sapphire Networks', 'http://sapphire.gi', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(206, 'bucky', '1621db939a2b51c5aabc9bdc080ccb31', '', '', '', '', 0, '[\"altectelecoms.gr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@altectelecoms.gr\"]', 'Altecnet', 'http://altectelecoms.gr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(207, 'bucky', '41522a701fa83d0c391f094d58b12c6f', '', '', '', '', 0, '[\"forthnet.gr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@forthnet.gr\"]', 'Forthnet', 'http://forthnet.gr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(208, 'bucky', '3b374c15b2527d41058199818f7d0da0', '', '', '', '', 0, '[\"hol.gr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hol.gr\"]', 'Hellas Online', 'http://hol.gr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(209, 'bucky', '91e655193d34840dbc6c56f0b61ee8bb', '', '', '', '', 0, '[\"netone.gr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netone.gr\"]', 'Net One', 'http://netone.gr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(210, 'bucky', '4b832b9ce9b81753a63aed80edeeac1b', '', '', '', '', 0, '[\"ontelecoms.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ontelecoms.com\"]', 'On Telecoms', 'http://ontelecoms.com', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(211, 'bucky', '4e686f0cb72ee7729fbae7ed8c37356c', '', '', '', '', 0, '[\"otenet.gr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@otenet.gr\"]', 'Otenet', 'http://otenet.gr', '', '', '', '[\"https:\\/\\/twitter.com\\/otenet_gr\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(212, 'bucky', '6632752cce6f7d00faf4cfe65c550520', '', '', '', '', 0, '[\"tellas.gr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tellas.gr\"]', 'Tellas', 'http://tellas.gr', '', '', '', '[\"\"]', '2019-07-11 13:23:48', 0, 0, 0, 0),
(213, 'bucky', 'bb0c6a8445f97da77acd3983e8d67374', '', '', '', '', 0, '[\"vivodi.gr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vivodi.gr\"]', 'Vivodi Telecoms', 'http://vivodi.gr', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(214, 'bucky', '54742c85d8ce9cca47cc12d217f1e3d0', '', '', '', '', 0, '[\"vodafone.gr\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vodafone.gr\"]', 'Vodafone', 'http://vodafone.gr', '', '', '', '[\"https:\\/\\/twitter.com\\/Vodafone_GR\",\"https:\\/\\/twitter.com\\/Vf_Amygdalewnas\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(216, 'bucky', '02b18c9efaec4409b7b4749fc1a51606', '', '', '', '', 0, '[\"telgua.com.gt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telgua.com.gt\"]', 'Telgua', 'http://telgua.com.gt', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(218, 'bucky', '1252b3619800a44a83909e4f39d2b571', '', '', '', '', 0, '[\"afribone.net.gn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@afribone.net.gn\"]', 'AFRIBONE GUINEE', 'http://afribone.net.gn', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(219, 'bucky', 'c2add77480eb31e0701ed81d49fcac7d', '', '', '', '', 0, '[\"alinktelecom.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alinktelecom.net\"]', 'Alink Telecom', 'http://alinktelecom.net', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/AlinkTelecom\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(220, 'bucky', 'e1b3cc7a99e4a49eb40c55a326571168', '', '', '', '', 0, '[\"eti.net.gn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@eti.net.gn\"]', 'ETI', 'http://eti.net.gn', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(221, 'bucky', 'b8504112a6afdca5879182bb15297004', '', '', '', '', 0, '[\"eti.net.gn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@eti.net.gn\"]', 'ETI', 'http://eti.net.gn', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(222, 'bucky', '8ef3a86242e9c715d859fbe33bfb561d', '', '', '', '', 0, '[\"gtt.co.gy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@gtt.co.gy\"]', 'GT and T Guyana Telephone and Telegraph', 'http://gtt.co.gy', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(223, 'bucky', '4d2d5ff2532fb466cbd105cb4770738c', '', '', '', '', 0, '[\"guyana.net.gy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@guyana.net.gy\"]', 'GuyanaNet', 'http://guyana.net.gy', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(224, 'bucky', 'e459ba3370a4e88ab4345170aa213d89', '', '', '', '', 0, '[\"inetguyana.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@inetguyana.net\"]', 'i-Net Communications', 'http://inetguyana.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(225, 'bucky', '65abd756c7ab82695cce051d79d14d42', '', '', '', '', 0, '[\"networksgy.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@networksgy.com\"]', 'Inter.Net.Works', 'http://networksgy.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(226, 'bucky', '0d0e0b56523d594942b0d867c902b1a7', '', '', '', '', 0, '[\"netcom.gy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netcom.gy\"]', 'Netcom Wireless', 'http://netcom.gy', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(227, 'bucky', '05b78d4bfc4aa3dbdff2cf67c9117ca4', '', '', '', '', 0, '[\"solutions2000.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@solutions2000.net\"]', 'Solutions2000', 'http://solutions2000.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(228, 'bucky', '9c0bf47c3855ad3c501ed3ec8c9a008e', '', '', '', '', 0, '[\"telsnetgy.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telsnetgy.net\"]', 'TelsNet', 'http://telsnetgy.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(229, 'bucky', 'bfeee217ec81444be04b87ffa1859e7a', '', '', '', '', 0, '[\"telsnetgy.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telsnetgy.net\"]', 'TelsNet', 'http://telsnetgy.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(230, 'bucky', '81304857eaca213e63cdf2a803dcaba5', '', '', '', '', 0, '[\"asianetcom.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@asianetcom.com\"]', 'Asia Netcom Asia Pacific Ltd', 'http://asianetcom.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(231, 'bucky', 'cbce903ca2e22e75d3da2260d73b6832', '', '', '', '', 0, '[\"hkabc.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hkabc.net\"]', 'C Net', 'http://hkabc.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(232, 'bucky', '81b2ae443b4034334c0e545988f88dfb', '', '', '', '', 0, '[\"ctinets.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ctinets.com\"]', 'City Telecom (HK) Ltd', 'http://ctinets.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(233, 'bucky', '285aefa6c0cbe8969a43390b004d4cd8', '', '', '', '', 0, '[\"cpcnet-hk.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cpcnet-hk.com\"]', 'CPCNet', 'http://cpcnet-hk.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(234, 'bucky', 'da52bc195f09a21c95012f48da680e37', '', '', '', '', 0, '[\"cyberec.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cyberec.com\"]', 'Cyber Express Communications Ltd.', 'http://cyberec.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(235, 'bucky', 'fbb4fb46b6579d484eb7b83a383863e2', '', '', '', '', 0, '[\"hknet.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hknet.com\"]', 'HKNet', 'http://hknet.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(236, 'bucky', '03bff24b2a54376a5b1e2c3deb5cf6c3', '', '', '', '', 0, '[\"hkbn.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hkbn.net\"]', 'Hong Kong Broadband Network', 'http://hkbn.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(237, 'bucky', '6dc3848bf08030f468811b33c71afeb0', '', '', '', '', 0, '[\"i-cablecomm.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@i-cablecomm.com\"]', 'I-Cable Communications', 'http://i-cablecomm.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(238, 'bucky', 'a8d66b5596c7abe3aab7cd9e9ff8faf5', '', '', '', '', 0, '[\"icare.com.hk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@icare.com.hk\"]', 'iCare.com Ltd.', 'http://icare.com.hk', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(239, 'bucky', '2df0975233149cf26d1ff8bbe064a10c', '', '', '', '', 0, '[\"netfront.ne\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netfront.ne\"]', 'NetFront Information Technology Ltd', 'http://netfront.ne', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(240, 'bucky', '1ed689cbf5e20ae2684c36fcb5b5abdc', '', '', '', '', 0, '[\"hkstar.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hkstar.com\"]', 'Netvigator', 'http://hkstar.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(241, 'bucky', 'd73aaf5c14595bc40e3faaf3134da3d9', '', '', '', '', 0, '[\"nwtbb.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nwtbb.com\"]', 'New World Telecommunications Ltd', 'http://nwtbb.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(242, 'bucky', 'd1f2b90958caddebb84d8c2252ccb7c9', '', '', '', '', 0, '[\"corporate.pacific.net.hk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@corporate.pacific.net.hk\"]', 'Pacific Internet (Hong Kong) Limited', 'http://corporate.pacific.net.hk', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(243, 'bucky', 'deb437dc14a16ce2b60cc292cd01fe07', '', '', '', '', 0, '[\"pacific-one.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@pacific-one.net\"]', 'Pacific One Net Limited', 'http://pacific-one.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(244, 'bucky', '76be720ab78c9801305fe2951c408869', '', '', '', '', 0, '[\"pccw.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@pccw.com\"]', 'PCCW', 'http://pccw.com', '', '', '', '[\"https:\\/\\/twitter.com\\/PCCWTigerKB\",\"https:\\/\\/twitter.com\\/PCCW_VF\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(245, 'bucky', '407358f75e12d0bd6926ceb6b3242851', '', '', '', '', 0, '[\"so-net.com.hk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@so-net.com.hk\"]', 'So-net Hong Kong', 'http://so-net.com.hk', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(246, 'bucky', 'd93b6c85825f91a3ed7114c461e508cf', '', '', '', '', 0, '[\"towngastelecom.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@towngastelecom.com\"]', 'Towngas Telecommunications Ltd', 'http://towngastelecom.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(248, 'bucky', '8a2fb9497135bb5efd76840c176a5f9d', '', '', '', '', 0, '[\"pannon.hu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@pannon.hu\"]', 'Pannon GSM Telecommunication', 'http://pannon.hu', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(249, 'bucky', 'fc9e4ca7bc6b27b184951775f7bad195', '', '', '', '', 0, '[\"t-home.hu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@t-home.hu\"]', 'T-Home', 'http://t-home.hu', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(250, 'bucky', '3165fa7801511dfde1a665771a0a80ad', '', '', '', '', 0, '[\"upc.hu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@upc.hu\"]', 'UPC', 'http://upc.hu', '', '', '', '[\"https:\\/\\/twitter.com\\/upc_online_hu\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(251, 'bucky', 'd548ea72ae61ed11f212b7558c8c6772', '', '', '', '', 0, '[\"vodafone.hu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vodafone.hu\"]', 'Vodafone', 'http://vodafone.hu', '', '', '', '[\"https:\\/\\/twitter.com\\/Vodafone_HU\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(253, 'bucky', '45576cdfe3836948c330652de8968e00', '', '', '', '', 0, '[\"hive.is\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hive.is\"]', 'HIVE (ISP)', 'http://hive.is', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(254, 'bucky', '5b77492067fc6340d93c31ef97f0ed8b', '', '', '', '', 0, '[\"netheimur.is\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netheimur.is\"]', 'Netheimur', 'http://netheimur.is', '', '', '', '[\"https:\\/\\/twitter.com\\/netheimur\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(255, 'bucky', '415f429d69fc18615a072d95e274fb7b', '', '', '', '', 0, '[\"siminn.is\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@siminn.is\"]', 'SÃ­minn', 'http://siminn.is', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(256, 'bucky', '7513389f0d99e7f87e3078ccce2f10f9', '', '', '', '', 0, '[\"snerpa.is\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@snerpa.is\"]', 'Snerpa', 'http://snerpa.is', '', '', '', '[\"https:\\/\\/twitter.com\\/snerpaEhf\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(257, 'bucky', '56dfef8709e99adc4dae08e19e667066', '', '', '', '', 0, '[\"vodafone.is\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vodafone.is\"]', 'Vodafone Iceland', 'http://vodafone.is', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(258, 'bucky', '9cc1a46f1a960800875920d6868a3b71', '', '', '', '', 0, '[\"hringidan.is\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hringidan.is\"]', 'Vortex (ISP)', 'http://hringidan.is', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(260, 'bucky', 'a757952d238f35e1d6807dc9dbda1255', '', '', '', '', 0, '[\"hayat-isp.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hayat-isp.net\"]', 'HaYaT Telecom LTD', 'http://hayat-isp.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(261, 'bucky', '30edab78bfa5e40fe6ebefe538b7b2af', '', '', '', '', 0, '[\"three.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@three.ie\"]', '3', 'http://three.ie', '', '', '', '[\"https:\\/\\/twitter.com\\/ThreeIreland\",\"https:\\/\\/twitter.com\\/ThreeCare\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(262, 'bucky', '478e8fe355b470dc36561f2da2253e7d', '', '', '', '', 0, '[\"accesstelecom.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@accesstelecom.ie\"]', 'Access Telecom', 'http://accesstelecom.ie', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(263, 'bucky', '7a7eb5e7b1ecde922cc3836836601817', '', '', '', '', 0, '[\"airspeed.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@airspeed.ie\"]', 'AirSpeed Communications', 'http://airspeed.ie', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(264, 'bucky', 'ee33efbfa3166a958b6245ef5501cdf9', '', '', '', '', 0, '[\"btireland.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@btireland.ie\"]', 'BT Communications Ireland', 'http://btireland.ie', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(265, 'bucky', 'f1e1e85dd3ba70d5f97c3d87bf1a7bb8', '', '', '', '', 0, '[\"eircom.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@eircom.ie\"]', 'Eircom', 'http://eircom.ie', '', '', '', '[\"https:\\/\\/twitter.com\\/Switch_2_eircom\",\"https:\\/\\/twitter.com\\/cometeircom\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(266, 'bucky', '84472d04e4d26b68f6eab08d1a106d1d', '', '', '', '', 0, '[\"homevision.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@homevision.ie\"]', 'HomeVision', 'http://homevision.ie', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(267, 'bucky', '96d0b327547faa32381f27176df8b470', '', '', '', '', 0, '[\"ispai.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ispai.ie\"]', 'Internet Service Providers Association of Ireland', 'http://ispai.ie', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(268, 'bucky', 'f9e004f7e3755ed8221b922f3e5b0b1e', '', '', '', '', 0, '[\"iol.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iol.ie\"]', 'Ireland On-Line', 'http://iol.ie', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(269, 'bucky', 'b2a6c7f92d4b844ce8bf9887c00df38b', '', '', '', '', 0, '[\"upc.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@upc.ie\"]', 'NTL Ireland', 'http://upc.ie', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(270, 'bucky', 'ad1eee70a80f495730b1fe55ef43652d', '', '', '', '', 0, '[\"perlico.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@perlico.com\"]', 'Perlico', 'http://perlico.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(271, 'bucky', '6a3f39b87130d68c8f83d96df9afdf72', '', '', '', '', 0, '[\"puretelecom.ie\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@puretelecom.ie\"]', 'Pure Telecom', 'http://puretelecom.ie', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/puretelecomirl\",\"https:\\/\\/twitter.com\\/puretelecombiz\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(273, 'bucky', '93dd3a0b6c17f0aa362b7378f1c3f5e2', '', '', '', '', 0, '[\"012.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@012.net\"]', '012 Smile', 'http://012.net', '', '', '', '[\"https:\\/\\/twitter.com\\/012_Smile\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(274, 'bucky', 'd4478aac956a0da51a518283df047429', '', '', '', '', 0, '[\"netvision.cellcom.co.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netvision.cellcom.co.il\"]', '013 Netvision', 'http://netvision.cellcom.co.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(275, 'bucky', '0c6342bcaaca0485574248dbc9850717', '', '', '', '', 0, '[\"bezeqint.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bezeqint.net\"]', '014 Bezeq International', 'http://bezeqint.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(276, 'bucky', '5e1de08ed97f2cc4ce488c59a7afb6db', '', '', '', '', 0, '[\"018.co.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@018.co.il\"]', '018 Internet', 'http://018.co.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(277, 'bucky', 'b356cbd3b9592201b428afaf896f7056', '', '', '', '', 0, '[\"telzar.co.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telzar.co.il\"]', '019 Internet', 'http://telzar.co.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(278, 'bucky', 'e21e103f44beaa8800b914a7610919c7', '', '', '', '', 0, '[\"comm.net.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@comm.net.il\"]', 'Comm.net', 'http://comm.net.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(279, 'bucky', 'f183aaf505b30c074ea0a669d8aa9035', '', '', '', '', 0, '[\"fast.net.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@fast.net.il\"]', 'Fast', 'http://fast.net.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(280, 'bucky', 'b8f78ccba7ac1c8dc07cae15220e6d7a', '', '', '', '', 0, '[\"interal.co.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@interal.co.il\"]', 'Interal - Eilat Inter', 'http://interal.co.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(281, 'bucky', 'a458beca88b66b1a747fd64622b133d4', '', '', '', '', 0, '[\"binat.net.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@binat.net.il\"]', 'Internet Binat', 'http://binat.net.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(282, 'bucky', '7c2e4a6debb44df0095ba90253ce0505', '', '', '', '', 0, '[\"kinneret.co.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@kinneret.co.il\"]', 'Kinneret', 'http://kinneret.co.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(283, 'bucky', 'c1a3afce81a3ca3da4673f8b44e364f4', '', '', '', '', 0, '[\"enativ.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@enativ.com\"]', 'Nativ', 'http://enativ.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(284, 'bucky', '3c55369b325e327025eaf8755e307e9c', '', '', '', '', 0, '[\"nettzach.co.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nettzach.co.il\"]', 'NetTzach', 'http://nettzach.co.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(285, 'bucky', 'f5dabd438eb8b2b8f5ea91830b34fbd9', '', '', '', '', 0, '[\"rimon.net.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@rimon.net.il\"]', 'Rimon', 'http://rimon.net.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(286, 'bucky', '7219f4cbe857d4308a33854346bdb657', '', '', '', '', 0, '[\"spotnet.co.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@spotnet.co.il\"]', 'Spotnet', 'http://spotnet.co.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(287, 'bucky', '6845f61c0d207d1369eb48d1733c7b54', '', '', '', '', 0, '[\"utm.co.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@utm.co.il\"]', 'UTM', 'http://utm.co.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(288, 'bucky', '8de8b32d3524319db85b8763a76a176e', '', '', '', '', 0, '[\"utm.co.il\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@utm.co.il\"]', 'UTM', 'http://utm.co.il', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(289, 'bucky', 'f5a39e1f6c7bc0dad027caee66fc0cad', '', '', '', '', 0, '[\"cyberia.jo\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cyberia.jo\"]', 'Cyberia', 'http://cyberia.jo', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(290, 'bucky', '9105fd47102fb5869c4541cd0af0fd4d', '', '', '', '', 0, '[\"ionet.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ionet.com\"]', 'IONet', 'http://ionet.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(291, 'bucky', 'f8ad773429e22300f7c4e70efe27ad0b', '', '', '', '', 0, '[\"umniah.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@umniah.com\"]', 'Umniah', 'http://umniah.com', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Umniah\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(292, 'bucky', 'ff60b9f28f4e682e255bb909ce0a4ae6', '', '', '', '', 0, '[\"wanadoo.jo\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@wanadoo.jo\"]', 'Wanadoo (Orange Jordan)', 'http://wanadoo.jo', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(293, 'bucky', '134a24c8d8163febdee03c9312bbeeb9', '', '', '', '', 0, '[\"jo.zain.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@jo.zain.com\"]', 'Zain', 'http://jo.zain.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(295, 'bucky', 'd3a4b54922866ff89e9e717c68e38ec9', '', '', '', '', 0, '[\"tishknet.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tishknet.com\"]', 'Tishknet', 'http://tishknet.com', '', '', '', '[\"https:\\/\\/twitter.com\\/tishknet4g\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(297, 'bucky', 'a329044cba61c8658219457fe9fe3f7e', '', '', '', '', 0, '[\"fasttelco.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@fasttelco.net\"]', 'Fast Telecommuncations Co WLL', 'http://fasttelco.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(298, 'bucky', '17232bb92cb15f2467a7562055c6d231', '', '', '', '', 0, '[\"www1.kems.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@www1.kems.net\"]', 'KEMS', 'http://www1.kems.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(299, 'bucky', '2647ed2a44ce2803f2e4ed0eb99ce7da', '', '', '', '', 0, '[\"mada.com.kw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mada.com.kw\"]', 'Mada Communications', 'http://mada.com.kw', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(300, 'bucky', 'cba9cb08628d62793c9d09acba2e996b', '', '', '', '', 0, '[\"qualitynet.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@qualitynet.net\"]', 'Qualitynet', 'http://qualitynet.net', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Qualitynet_q8\",\"https:\\/\\/twitter.com\\/qualitynet_net\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(301, 'bucky', '7234f741380f15f322514643f75d7560', '', '', '', '', 0, '[\"un.com.kw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@un.com.kw\"]', 'United Networks', 'http://un.com.kw', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(302, 'bucky', '11aeee0fefe9b830a0de72689de35a5f', '', '', '', '', 0, '[\"viva.com.kw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@viva.com.kw\"]', 'VIVA', 'http://viva.com.kw', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Dawriviva\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(303, 'bucky', '894410a649630267d771144b7550d187', '', '', '', '', 0, '[\"zajil.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@zajil.com\"]', 'Zajil International Telecom Co', 'http://zajil.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(304, 'bucky', '319c44e5918bfff5c8a5925846f7a76e', '', '', '', '', 0, '[\"zajil.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@zajil.com\"]', 'Zajil International Telecom Co', 'http://zajil.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(305, 'bucky', 'b97c39dc638e8764de97fd5854d78d3a', '', '', '', '', 0, '[\"aknet.kg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@aknet.kg\"]', 'AKNET', 'http://aknet.kg', '', '', '', '[\"https:\\/\\/twitter.com\\/Aknet_KG\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(306, 'bucky', 'cac586f947f2eac01f24721901357199', '', '', '', '', 0, '[\"asiainfo.kg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@asiainfo.kg\"]', 'ASIAINFO', 'http://asiainfo.kg', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(307, 'bucky', '2077ab367e78e79a974d94cb904b9795', '', '', '', '', 0, '[\"elcat.kg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@elcat.kg\"]', 'ElKat', 'http://elcat.kg', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(308, 'bucky', '81f67f1d98dd8325846d2094c1c01c84', '', '', '', '', 0, '[\"saimanet.kg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@saimanet.kg\"]', 'Saima Telecom', 'http://saimanet.kg', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(309, 'bucky', 'e35643c71453a121e97ba3ce55fe32ad', '', '', '', '', 0, '[\"totel.kg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@totel.kg\"]', 'TOTEL', 'http://totel.kg', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(310, 'bucky', '34b827fab1fa6442af1e11bca4a9514d', '', '', '', '', 0, '[\"transfer.kg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@transfer.kg\"]', 'Transfer Ltd', 'http://transfer.kg', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(312, 'bucky', '09954b09c210bdb1d0c46ce4bac6ce5c', '', '', '', '', 0, '[\"apollo.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@apollo.lv\"]', 'Apollo', 'http://apollo.lv', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(313, 'bucky', '34510968cbcbcf585f205c6bb8ddc959', '', '', '', '', 0, '[\"baltkom.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@baltkom.lv\"]', 'Baltkom', 'http://baltkom.lv', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(314, 'bucky', '47f8a0e7905054a49dfcc9827fbb57fe', '', '', '', '', 0, '[\"web.archive.org\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@web.archive.org\"]', 'EzerNet', 'http://web.archive.org', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(315, 'bucky', '6a26b0c653262ce50bc25aa585e949bd', '', '', '', '', 0, '[\"izzi.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@izzi.lv\"]', 'Izzi', 'http://izzi.lv', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(316, 'bucky', 'e439903831bf42be52b2e63059d3f7c8', '', '', '', '', 0, '[\"lmt.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@lmt.lv\"]', 'LMT Latvijas Mobilais Telefons', 'http://lmt.lv', '', '', '', '[\"https:\\/\\/twitter.com\\/mansLMT\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(317, 'bucky', '1575c59c682fc56cd0af19c014c4a0e3', '', '', '', '', 0, '[\"neonet.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@neonet.lv\"]', 'Neonets', 'http://neonet.lv', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(318, 'bucky', 'e9215478f9cded64ae4108b11f05bce2', '', '', '', '', 0, '[\"tele2.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tele2.lv\"]', 'Tele2', 'http://tele2.lv', '', '', '', '[\"https:\\/\\/twitter.com\\/Tele2Latvia\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(319, 'bucky', '7d1e5810835921925750075a0a693d6e', '', '', '', '', 0, '[\"telia.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telia.lv\"]', 'Telia Latvija', 'http://telia.lv', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0);
INSERT INTO `lists__claimableservices` (`id`, `state`, `key-session`, `key-host`, `key-isp`, `key-carrier`, `key-registrar`, `claimed-id`, `hostnames`, `name`, `nameurl`, `nameemail`, `nametwitterurl`, `companyemails`, `companyname`, `companyurl`, `companyrbn`, `companyrbntype`, `companytype`, `companytwitterurls`, `created`, `emailed`, `tweeted`, `updated`, `finished`) VALUES
(320, 'bucky', 'c913d9d7e7c6e31cf6bdc4a3b42c62be', '', '', '', '', 0, '[\"triatel.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@triatel.lv\"]', 'Triatel', 'http://triatel.lv', '', '', '', '[\"https:\\/\\/twitter.com\\/TM_ekspedicija\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(321, 'bucky', '4cd486d659b5eefc77f8308df3f9afc2', '', '', '', '', 0, '[\"vernet.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vernet.lv\"]', 'Versija Vernet', 'http://vernet.lv', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(322, 'bucky', '5691e434832f92836557e80fa6142eb8', '', '', '', '', 0, '[\"vernet.lv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vernet.lv\"]', 'Versija Vernet', 'http://vernet.lv', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(323, 'bucky', '32c86a87a514822cd3e118dd8f17f988', '', '', '', '', 0, '[\"bb-p.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bb-p.net\"]', 'Broadband Plus', 'http://bb-p.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(324, 'bucky', '853bc5deb70100acbd73bf0bab577e66', '', '', '', '', 0, '[\"cedarcom.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cedarcom.net\"]', 'Cedarcom', 'http://cedarcom.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(325, 'bucky', 'a7ab01a606c0fd5db05a1f7a6add3724', '', '', '', '', 0, '[\"comnetisp.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@comnetisp.com\"]', 'ComNet', 'http://comnetisp.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(326, 'bucky', '18f0ae64156a2490203f932a14abf8f8', '', '', '', '', 0, '[\"cyberia.net.lb\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cyberia.net.lb\"]', 'Cyberia', 'http://cyberia.net.lb', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(327, 'bucky', '57a272defaf26ad797cd262e7837fa50', '', '', '', '', 0, '[\"dataprolinks.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@dataprolinks.net\"]', 'Data Pro Links', 'http://dataprolinks.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(328, 'bucky', 'bab0bea66e4819f7f099b608b7f30091', '', '', '', '', 0, '[\"farahnet.ne\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@farahnet.ne\"]', 'Farah Net', 'http://farahnet.ne', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(329, 'bucky', '78528b2080086e25c0eb570896386915', '', '', '', '', 0, '[\"fiberlinknetworks.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@fiberlinknetworks.net\"]', 'Fiberlink Networks', 'http://fiberlinknetworks.net', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(330, 'bucky', '180c44894939117e1bfa421e93307763', '', '', '', '', 0, '[\"idm.net.lb\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@idm.net.lb\"]', 'IDM', 'http://idm.net.lb', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(331, 'bucky', 'b3edc09dc87fec5d63a211562c7b300d', '', '', '', '', 0, '[\"keblon.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@keblon.com\"]', 'Keblon', 'http://keblon.com', '', '', '', '[\"\"]', '2019-07-11 13:23:49', 0, 0, 0, 0),
(332, 'bucky', 'c9da749f80dbe7dffe398ca4a041cd6c', '', '', '', '', 0, '[\"lebol.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@lebol.net\"]', 'Lebanon Online', 'http://lebol.net', '', '', '', '[\"https:\\/\\/twitter.com\\/LebanonOnline\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(333, 'bucky', '230f8d7860f88a574815150cec155aa3', '', '', '', '', 0, '[\"mobi.net.lb\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mobi.net.lb\"]', 'Mobi', 'http://mobi.net.lb', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(334, 'bucky', '6a961cdf64682215f365b1984c6bfc22', '', '', '', '', 0, '[\"wise.net.lb\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@wise.net.lb\"]', 'Wise', 'http://wise.net.lb', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(335, 'bucky', '0bddee2994b05c9f8b4086e044f0076b', '', '', '', '', 0, '[\"pescotel.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@pescotel.net\"]', 'Pesco Telecom', 'http://pescotel.net', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(336, 'bucky', 'e277730a5005e5f89a29db8ece8c62c3', '', '', '', '', 0, '[\"sodetel.net.lb\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sodetel.net.lb\"]', 'Sodetel', 'http://sodetel.net.lb', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(337, 'bucky', 'ae592cbf68c9df9f85193f3497a96660', '', '', '', '', 0, '[\"spidernetlb.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@spidernetlb.com\"]', 'Spidernet', 'http://spidernetlb.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(338, 'bucky', 'b158adc60a2a6c6a5ba8b82e5e388124', '', '', '', '', 0, '[\"http\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@http\"]', 'TerraNet', 'http://http', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(339, 'bucky', 'eaa9dd8d155d46ec592a9b8d0574ab2d', '', '', '', '', 0, '[\"visp.net.lb\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@visp.net.lb\"]', 'Virtual ISP', 'http://visp.net.lb', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(340, 'bucky', '7aa3c6d8596073925f279327f980039f', '', '', '', '', 0, '[\"wise.net.lb\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@wise.net.lb\"]', 'Wise', 'http://wise.net.lb', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(341, 'bucky', 'bb281627d1af8523f983e4940c4202cf', '', '', '', '', 0, '[\"ilesotho.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ilesotho.com\"]', 'ILESOTHO', 'http://ilesotho.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(342, 'bucky', 'e7c89fd8bf58ab576899a69e15dc7fa4', '', '', '', '', 0, '[\"leo.co.ls\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@leo.co.ls\"]', 'LEO', 'http://leo.co.ls', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(344, 'bucky', '8f068d2377d63d1ccd6b5fb28aa104b5', '', '', '', '', 0, '[\"ltt.ly\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ltt.ly\"]', 'Libyian Arab Jamahiriya', 'http://ltt.ly', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(346, 'bucky', '734ca0e74c904b362fd895e916427f66', '', '', '', '', 0, '[\"tele2.li\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tele2.li\"]', 'Tele2 Internet', 'http://tele2.li', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(347, 'bucky', '2ba356879e6d2661e82eb9ac5d5fdfbd', '', '', '', '', 0, '[\"telecom.li\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telecom.li\"]', 'Telecom Liechtenstein', 'http://telecom.li', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(349, 'bucky', '68a44da8177febc6bbed2821b6b90520', '', '', '', '', 0, '[\"balt.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@balt.net\"]', 'Baltneta', 'http://balt.net', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Baltneta\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(350, 'bucky', 'c710c633289f4680aec795450f6d2199', '', '', '', '', 0, '[\"bite.lt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bite.lt\"]', 'Bite', 'http://bite.lt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(351, 'bucky', '75aba6a9d793d9247404617e41aa074a', '', '', '', '', 0, '[\"kavamedia.eu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@kavamedia.eu\"]', 'Kavamedia', 'http://kavamedia.eu', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(352, 'bucky', '94e2320512308615609352e2901c042b', '', '', '', '', 0, '[\"omnitel.lt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@omnitel.lt\"]', 'Omnitel', 'http://omnitel.lt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(353, 'bucky', '60389923130307e9613f31fcbe3f1d2c', '', '', '', '', 0, '[\"teo.lt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@teo.lt\"]', 'TEO', 'http://teo.lt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(354, 'bucky', '35a617f40bee707ced101a34553863c0', '', '', '', '', 0, '[\"teo.lt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@teo.lt\"]', 'TEO', 'http://teo.lt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(355, 'bucky', '31a3e65f03594788881da06b41f23b99', '', '', '', '', 0, '[\"tiscali.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tiscali.lu\"]', 'Alternet (Tiscali)', 'http://tiscali.lu', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(356, 'bucky', '3151070eed76b1d28a8d3d49afb43db3', '', '', '', '', 0, '[\"cegecom.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cegecom.lu\"]', 'Cegecom', 'http://cegecom.lu', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/CegecomSA\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(357, 'bucky', '6ddb76e94676d9be1a5fc9d1a2946167', '', '', '', '', 0, '[\"coditel.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@coditel.lu\"]', 'Coditel', 'http://coditel.lu', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(358, 'bucky', 'bb61a9293bb9edf33004807a601a72bc', '', '', '', '', 0, '[\"crosscomm.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@crosscomm.lu\"]', 'CrossComm', 'http://crosscomm.lu', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(359, 'bucky', 'b0de08f7f0391ac11ae6a69d0285b44b', '', '', '', '', 0, '[\"eltrona.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@eltrona.lu\"]', 'Eltrona', 'http://eltrona.lu', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(360, 'bucky', 'a88a08b0759f9c4202ce6eb34465c8f1', '', '', '', '', 0, '[\"freenet.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@freenet.lu\"]', 'Freenet', 'http://freenet.lu', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(361, 'bucky', '61edf4aa024dd9be4eb422889c9a825e', '', '', '', '', 0, '[\"internet.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@internet.lu\"]', 'Luxembourg Online', 'http://internet.lu', '', '', '', '[\"https:\\/\\/twitter.com\\/Lux_Online\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(362, 'bucky', 'b17771a835e25a7d7ea9cb5e380694b8', '', '', '', '', 0, '[\"internet.luxweb.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@internet.luxweb.com\"]', 'Luxweb', 'http://internet.luxweb.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(363, 'bucky', '5525bba10f9ad8145ea3e8a8f490dfae', '', '', '', '', 0, '[\"netline.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netline.lu\"]', 'Netline', 'http://netline.lu', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(364, 'bucky', '952e8a968a62bced17a135973ecfaf47', '', '', '', '', 0, '[\"tele2.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tele2.lu\"]', 'Tele2', 'http://tele2.lu', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(365, 'bucky', '1c4a587f9dbabeb21f4ad66742f69fe4', '', '', '', '', 0, '[\"vo.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vo.lu\"]', 'Visual Online', 'http://vo.lu', '', '', '', '[\"https:\\/\\/twitter.com\\/visualonline\",\"https:\\/\\/twitter.com\\/visualonline\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(366, 'bucky', '6cb2e65ff0b3661fac3acb7210cef7e7', '', '', '', '', 0, '[\"vox.lu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vox.lu\"]', 'VOXmobile', 'http://vox.lu', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(368, 'bucky', '7aa31971852834b050d021fa185ee225', '', '', '', '', 0, '[\"ctm.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ctm.net\"]', 'CTM', 'http://ctm.net', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(369, 'bucky', '3c3b98c757b61358b3481244ccbfef60', '', '', '', '', 0, '[\"ctm.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ctm.net\"]', 'CTM', 'http://ctm.net', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(370, 'bucky', '8c02dad8d5f0ca5c60c18cbc49289d1f', '', '', '', '', 0, '[\"euro.net.mk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@euro.net.mk\"]', 'Euronet', 'http://euro.net.mk', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(371, 'bucky', 'e8f0507ef40b66bb7f77cec4b21ac507', '', '', '', '', 0, '[\"inet.com.mk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@inet.com.mk\"]', 'INet', 'http://inet.com.mk', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(372, 'bucky', 'f09316307ea1ee58c62c9f7c73613c2f', '', '', '', '', 0, '[\"mol.com.mk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mol.com.mk\"]', 'MOL Macedonia On-Line', 'http://mol.com.mk', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(373, 'bucky', 'd9d75c50719a6bf1d820456a9e0f8637', '', '', '', '', 0, '[\"mt.net.mk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mt.net.mk\"]', 'MTnet (Makedonski Telekom)', 'http://mt.net.mk', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(374, 'bucky', '987036c12b5e7be0a22421d27e5fae01', '', '', '', '', 0, '[\"porta.com.mk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@porta.com.mk\"]', 'PORTA', 'http://porta.com.mk', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(375, 'bucky', '4271ce9acc075b4b89c83c905d08c7e3', '', '', '', '', 0, '[\"sonet.com.mk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sonet.com.mk\"]', 'SONET', 'http://sonet.com.mk', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(376, 'bucky', 'e2be9d0bc954061b54a4bd77c76f80bd', '', '', '', '', 0, '[\"unet.com.mk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@unet.com.mk\"]', 'UNet', 'http://unet.com.mk', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(377, 'bucky', 'e8fa68151e10523ee20f10e8c31c4991', '', '', '', '', 0, '[\"unet.com.mk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@unet.com.mk\"]', 'UNet', 'http://unet.com.mk', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(378, 'bucky', '3a80750163fd6747a97146f6700e6eab', '', '', '', '', 0, '[\"blueline.mg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@blueline.mg\"]', 'BLUELINE', 'http://blueline.mg', '', '', '', '[\"https:\\/\\/twitter.com\\/blueline_MG\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(379, 'bucky', '4280e377a2d1b17e60a227bf0b4a319d', '', '', '', '', 0, '[\"dts.mg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@dts.mg\"]', 'DATA TELECOM SERVICE', 'http://dts.mg', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(380, 'bucky', '4a6ecbf8702b0a29d8336de3c4f5f921', '', '', '', '', 0, '[\"orange.mg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orange.mg\"]', 'ORANGE MADAGASCAR', 'http://orange.mg', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/orange_mg\",\"https:\\/\\/twitter.com\\/DeglandMichel\",\"https:\\/\\/twitter.com\\/ErwanGelebart\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(382, 'bucky', 'f87c1e945d459788cf6f7a5347991cad', '', '', '', '', 0, '[\"burcomw.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@burcomw.com\"]', 'BURCO ELECTRONICS SYSTEMS', 'http://burcomw.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(383, 'bucky', '32ed5d2a307d1eb846daf6e7f9942594', '', '', '', '', 0, '[\"globemw.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@globemw.net\"]', 'GLOBE INTERNET', 'http://globemw.net', '', '', '', '[\"https:\\/\\/twitter.com\\/GlobeIntLimited\",\"https:\\/\\/twitter.com\\/globemalawi\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(384, 'bucky', 'de07ebe5e8533189e06db4816896be86', '', '', '', '', 0, '[\"malawi.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@malawi.net\"]', 'MALAWI NET', 'http://malawi.net', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(385, 'bucky', '4dd33f8cf813993a337e246c945489f6', '', '', '', '', 0, '[\"skyband.mw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@skyband.mw\"]', 'SKYBAND', 'http://skyband.mw', '', '', '', '[\"https:\\/\\/twitter.com\\/SkybandMalawi\",\"https:\\/\\/twitter.com\\/SkybandMalawi\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(386, 'bucky', 'c094ecda45f501699a3548346ac65f25', '', '', '', '', 0, '[\"skyband.mw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@skyband.mw\"]', 'SKYBAND', 'http://skyband.mw', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/SkybandMalawi\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(387, 'bucky', 'da32a2fb677cec5b304cbd44cf17002b', '', '', '', '', 0, '[\"dhiraagu.com.mv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@dhiraagu.com.mv\"]', 'Dhiraagu', 'http://dhiraagu.com.mv', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Dhiraagu\",\"https:\\/\\/twitter.com\\/DhiraaguHelp\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(388, 'bucky', 'e9f33c4d79a6f67308a956134fcdc99f', '', '', '', '', 0, '[\"rol.net.mv\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@rol.net.mv\"]', 'RaajjÃ© Online', 'http://rol.net.mv', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(390, 'bucky', 'd09ff67dc881f49de3e209b74dd06404', '', '', '', '', 0, '[\"afribone.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@afribone.com\"]', 'AFRIBONE MALI', 'http://afribone.com', '', '', '', '[\"https:\\/\\/twitter.com\\/Afribone\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(391, 'bucky', '75a4feca9c3f45f241776777b9916f8d', '', '', '', '', 0, '[\"alinktelecom.net.ml\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alinktelecom.net.ml\"]', 'Alink Telecom', 'http://alinktelecom.net.ml', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(392, 'bucky', '37f304c871aebd5181a7266e51dd864e', '', '', '', '', 0, '[\"datatech.net.ml\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@datatech.net.ml\"]', 'DATATECH', 'http://datatech.net.ml', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(393, 'bucky', '3686939ad076d67aa79305eddd9b83ed', '', '', '', '', 0, '[\"ikatel.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ikatel.net\"]', 'IKATEL', 'http://ikatel.net', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(394, 'bucky', '9fc4651286badf35dfe6ded71e933b23', '', '', '', '', 0, '[\"megasat.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@megasat.net\"]', 'MEGASAT', 'http://megasat.net', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(395, 'bucky', '8bede72f160fa889dc0798d458f147a1', '', '', '', '', 0, '[\"msnet.net.ml\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@msnet.net.ml\"]', 'MICRO SYSTEMS', 'http://msnet.net.ml', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(396, 'bucky', 'fcc79695e721cc0d8747edd3913d53c1', '', '', '', '', 0, '[\"sotelma.ml\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sotelma.ml\"]', 'SOTELMA', 'http://sotelma.ml', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(397, 'bucky', 'e00fb5e7127fc7a70abe66b42a3c013d', '', '', '', '', 0, '[\"sotelma.ml\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sotelma.ml\"]', 'SOTELMA', 'http://sotelma.ml', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(398, 'bucky', '9c6cb3966cc343f32a19c4f6a1bfbad1', '', '', '', '', 0, '[\"bell.net.mt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bell.net.mt\"]', 'Bell Net', 'http://bell.net.mt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(399, 'bucky', '2b18409528f3f9a9cef2bf19b5729a43', '', '', '', '', 0, '[\"go.com.mt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@go.com.mt\"]', 'GO Plus', 'http://go.com.mt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(400, 'bucky', '714704d66379b47f577c2f7bdbd328f6', '', '', '', '', 0, '[\"nextweb.net.mt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nextweb.net.mt\"]', 'NextWeb', 'http://nextweb.net.mt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(401, 'bucky', 'c16e2ce36e6272b73783c1a7d604229b', '', '', '', '', 0, '[\"ondnet.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ondnet.net\"]', 'OnDNet', 'http://ondnet.net', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(402, 'bucky', 'a21ff783cdeb4a9468c657d07e202ca1', '', '', '', '', 0, '[\"onvol.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@onvol.net\"]', 'Onvol (Melita Cable)', 'http://onvol.net', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(403, 'bucky', '67518e3a049073b560f1401599369064', '', '', '', '', 0, '[\"TE.com.mt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@TE.com.mt\"]', 'TE', 'http://TE.com.mt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(404, 'bucky', 'd537fcd0711d53568ea24590a11ce5c3', '', '', '', '', 0, '[\"vanilla.net.mt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vanilla.net.mt\"]', 'Vanilla Tecoms', 'http://vanilla.net.mt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(405, 'bucky', '89150d682064846a65d8809c9f474f3c', '', '', '', '', 0, '[\"waldonet.net.mt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@waldonet.net.mt\"]', 'Waldonet', 'http://waldonet.net.mt', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(407, 'bucky', '481830714ca0e7441709eedbfb8293ae', '', '', '', '', 0, '[\"isolutionsmr.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@isolutionsmr.com\"]', 'SOLUTIONS INFOR.', 'http://isolutionsmr.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(409, 'bucky', '75f6657f95db6a16aac5bb005379e747', '', '', '', '', 0, '[\"expertbyte.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@expertbyte.com\"]', 'EXPERTBYTE', 'http://expertbyte.com', '', '', '', '[\"https:\\/\\/twitter.com\\/Expertbyte\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(410, 'bucky', 'bfc3b5907c25722db9e70e8b541ab115', '', '', '', '', 0, '[\"iwayafrica.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iwayafrica.com\"]', 'iWayAfrica', 'http://iwayafrica.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(411, 'bucky', 'a94ea580c08c75109fcbde31246ba423', '', '', '', '', 0, '[\"stateinformatics.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@stateinformatics.com\"]', 'STATE INFORMATICS', 'http://stateinformatics.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(412, 'bucky', 'e630b9c82147d33ec5209362b9c5d7aa', '', '', '', '', 0, '[\"stateinformatics.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@stateinformatics.com\"]', 'STATE INFORMATICS', 'http://stateinformatics.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(413, 'bucky', 'f0effe462426002052dab009f4d14e92', '', '', '', '', 0, '[\"arax.md\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@arax.md\"]', 'Arax-Impex', 'http://arax.md', '', '', '', '[\"https:\\/\\/twitter.com\\/arax_impex\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(414, 'bucky', 'e3eb5d1dcfa532b871fbdf9f8e3c8485', '', '', '', '', 0, '[\"mango.telecom.md\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mango.telecom.md\"]', 'Mango Telecom', 'http://mango.telecom.md', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(415, 'bucky', '8d47a9e4a4491cc74117f87d35947b23', '', '', '', '', 0, '[\"moldtelecom.md\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@moldtelecom.md\"]', 'Moldtelecom', 'http://moldtelecom.md', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/moldtelecom\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(416, 'bucky', '6ea3b1e7e9ee23e0f93a39663d3b1d5a', '', '', '', '', 0, '[\"orange.md\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orange.md\"]', 'Orange Moldova', 'http://orange.md', '', '', '', '[\"https:\\/\\/twitter.com\\/OrangeMD\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(417, 'bucky', '97def60a1cd51670b27556bd8020cd23', '', '', '', '', 0, '[\"starnet.md\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@starnet.md\"]', 'StarNet', 'http://starnet.md', '', '', '', '[\"https:\\/\\/twitter.com\\/myStarNet\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(418, 'bucky', '7bf40fd575c9da391f5c4b577781e591', '', '', '', '', 0, '[\"suncommunications.md\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@suncommunications.md\"]', 'SunCommunications', 'http://suncommunications.md', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(420, 'bucky', '6626b1fb98de43d3cad93da47d1c254f', '', '', '', '', 0, '[\"galeforce.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@galeforce.com\"]', 'Gale Force', 'http://galeforce.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(421, 'bucky', '5b610b3cb6502b909d83d2cd2ac086ff', '', '', '', '', 0, '[\"monaco-internet.mc\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@monaco-internet.mc\"]', 'Monaco Internet', 'http://monaco-internet.mc', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(422, 'bucky', '08190890392b92e7b34bacf487987dd4', '', '', '', '', 0, '[\"monaco-telecom.mc\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@monaco-telecom.mc\"]', 'Monaco Telecom', 'http://monaco-telecom.mc', '', '', '', '[\"https:\\/\\/twitter.com\\/MonacoTelecom\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(423, 'bucky', '2ef5c8de5e993e6b0301093731254b0a', '', '', '', '', 0, '[\"mtn-ics.mc\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mtn-ics.mc\"]', 'MTN', 'http://mtn-ics.mc', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(424, 'bucky', '18f201e81cc74679be3bae0478fb88a6', '', '', '', '', 0, '[\"mtn-ics.mc\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mtn-ics.mc\"]', 'MTN', 'http://mtn-ics.mc', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(425, 'bucky', 'f37b6e1d294abd84429b3dbce89928f9', '', '', '', '', 0, '[\"digicom.mn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@digicom.mn\"]', 'Digicom', 'http://digicom.mn', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(426, 'bucky', '15235e09014e58448e4f93874643297d', '', '', '', '', 0, '[\"magicnet.mn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@magicnet.mn\"]', 'Magicnet (Datakom)', 'http://magicnet.mn', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(427, 'bucky', 'f71d514fd6d64c941f7a9b47e625beb1', '', '', '', '', 0, '[\"mobicom.mn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mobicom.mn\"]', 'Mobicom', 'http://mobicom.mn', '', '', '', '[\"https:\\/\\/twitter.com\\/MobicomOfficial\",\"https:\\/\\/twitter.com\\/mobicom_mn\",\"https:\\/\\/twitter.com\\/MobicomOfficial\",\"https:\\/\\/twitter.com\\/mobicom_mn\",\"https:\\/\\/twitter.com\\/mobicom_suppor1\",\"https:\\/\\/twitter.com\\/BBbyMobicom\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(428, 'bucky', '21c1bb521c7427ead6116b44249b95c7', '', '', '', '', 0, '[\"mtcone.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mtcone.net\"]', 'Mongolia Telecom', 'http://mtcone.net', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(429, 'bucky', '4edea0f1fe51a2d435f04e859eb8f996', '', '', '', '', 0, '[\"mcscom.mn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mcscom.mn\"]', 'Univision', 'http://mcscom.mn', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(430, 'bucky', 'df90fffd53342fbee82095a8018fb4f6', '', '', '', '', 0, '[\"mcscom.mn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mcscom.mn\"]', 'Univision', 'http://mcscom.mn', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(431, 'bucky', '13fd73d91b8078a67d76935eeffcc311', '', '', '', '', 0, '[\"telekom.me\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telekom.me\"]', 'Crnogorski Telekom', 'http://telekom.me', '', '', '', '[\"https:\\/\\/twitter.com\\/CTelekom\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(432, 'bucky', '839f908f2f08b205bf7589182f29ca53', '', '', '', '', 0, '[\"mtel-cg.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mtel-cg.com\"]', 'MTEL', 'http://mtel-cg.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(434, 'bucky', '439c4dff87a9547e44c767acd79e21ce', '', '', '', '', 0, '[\"iburstafrica.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iburstafrica.com\"]', 'iBurst Africa', 'http://iburstafrica.com', '', '', '', '[\"https:\\/\\/twitter.com\\/iburstafrica\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(435, 'bucky', '06794430c4b81269da3af7a057e6c3fc', '', '', '', '', 0, '[\"inmoz.co.mz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@inmoz.co.mz\"]', 'Inmoz', 'http://inmoz.co.mz', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(436, 'bucky', '37656ce825547cf7c1cd48ea0f592687', '', '', '', '', 0, '[\"mcel.co.mz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mcel.co.mz\"]', 'Mcel', 'http://mcel.co.mz', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(437, 'bucky', '8dff5ebd43c154ae5981f89bf4d01d90', '', '', '', '', 0, '[\"teledata.mz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@teledata.mz\"]', 'Teledata', 'http://teledata.mz', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(438, 'bucky', 'c7afc2e1f9a73461ef61a9ec3ae3efa1', '', '', '', '', 0, '[\"tropical.co.mz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tropical.co.mz\"]', 'TROPICALNET', 'http://tropical.co.mz', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(439, 'bucky', 'ed3995e15bb7234d5784b404afbd5300', '', '', '', '', 0, '[\"vodacom.co.mz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vodacom.co.mz\"]', 'Vodacom', 'http://vodacom.co.mz', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(441, 'bucky', 'd223e59d799fd4307facfeffb696e1f6', '', '', '', '', 0, '[\"africaonline.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@africaonline.com\"]', 'Africa Online', 'http://africaonline.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(442, 'bucky', '6198c798cbfc587e97376c24f9fa7a54', '', '', '', '', 0, '[\"internet.na\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@internet.na\"]', 'IT HOLDINGS', 'http://internet.na', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(443, 'bucky', 'd2947638e49f7d17c8bc8be0940d9339', '', '', '', '', 0, '[\"iway.na\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iway.na\"]', 'IWAY', 'http://iway.na', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(444, 'bucky', 'c24e3dfc8b7e037ac994c5f80739312c', '', '', '', '', 0, '[\"iwayafrica.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iwayafrica.com\"]', 'iWayAfrica', 'http://iwayafrica.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(445, 'bucky', '97a4cdff8bb07f57058b5dd3f2947d45', '', '', '', '', 0, '[\"orbit.com.na\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orbit.com.na\"]', 'ORBIT TECHNOLOGY HOLDINGS', 'http://orbit.com.na', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(446, 'bucky', 'edd435bfcb07fe2a4fff741b43152c12', '', '', '', '', 0, '[\"uunet.com.na\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@uunet.com.na\"]', 'UUNET NAMIBIA', 'http://uunet.com.na', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(448, 'bucky', 'f04ee7b0284ec4a63425a37cdcc7ab66', '', '', '', '', 0, '[\"callplus.co.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@callplus.co.nz\"]', 'CallPlus', 'http://callplus.co.nz', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/CallPlus_NZ\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(449, 'bucky', '2cf4a6cf5ae2e44bd088b41b1fc063ef', '', '', '', '', 0, '[\"iconz-webvisions.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iconz-webvisions.com\"]', 'ICONZ', 'http://iconz-webvisions.com', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(450, 'bucky', '798564dd8d5d2a3340e796e2841154e2', '', '', '', '', 0, '[\"vodafone.co.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vodafone.co.nz\"]', 'Vodafone New Zealand', 'http://vodafone.co.nz', '', '', '', '[\"\"]', '2019-07-11 13:23:50', 0, 0, 0, 0),
(451, 'bucky', '603ba6634f8e7f1fd2f128b8c390f21d', '', '', '', '', 0, '[\"ispanz.org.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ispanz.org.nz\"]', 'ISPANZ', 'http://ispanz.org.nz', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(452, 'bucky', '0eecf97211c49de45b69b606f7cf0d74', '', '', '', '', 0, '[\"lightwire.co.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@lightwire.co.nz\"]', 'Lightwire Limited', 'http://lightwire.co.nz', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(453, 'bucky', '5b139ba99d6f419e4397206da1919d4a', '', '', '', '', 0, '[\"netsmart.co.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netsmart.co.nz\"]', 'NetSmart', 'http://netsmart.co.nz', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/NetSmart_NZ\",\"https:\\/\\/twitter.com\\/netsmartnz\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(454, 'bucky', '66463a60ef559eff0fed25c7a4ecfb1e', '', '', '', '', 0, '[\"orcon.net.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orcon.net.nz\"]', 'Orcon Internet Limited', 'http://orcon.net.nz', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(455, 'bucky', '27e9bcfaefee7d4a39170cec1f68d94d', '', '', '', '', 0, '[\"paradise.net.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@paradise.net.nz\"]', 'Paradise.net', 'http://paradise.net.nz', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(456, 'bucky', '203c6639095d9ef1d25cff119db1ae71', '', '', '', '', 0, '[\"quicksilver.net.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@quicksilver.net.nz\"]', 'Quicksilver (ISP)', 'http://quicksilver.net.nz', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(457, 'bucky', '4b0f8e9f0725ef41d534ddd97f919a3f', '', '', '', '', 0, '[\"quik.co.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@quik.co.nz\"]', 'Quik Internet (NZ) Ltd', 'http://quik.co.nz', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(458, 'bucky', 'be53a0948118bdc3e587dcc8d45d1495', '', '', '', '', 0, '[\"slingshot.co.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@slingshot.co.nz\"]', 'Slingshot (ISP)', 'http://slingshot.co.nz', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(459, 'bucky', 'a2f3ec83322efd2ded89d3bdd95b72d2', '', '', '', '', 0, '[\"telecom.co.nz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telecom.co.nz\"]', 'Xtra (ISP)', 'http://telecom.co.nz', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(461, 'bucky', 'd73c420ead6cb477aed42ab2ab1daa27', '', '', '', '', 0, '[\"claro.com.ni\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@claro.com.ni\"]', 'Claro', 'http://claro.com.ni', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(462, 'bucky', '301c3bf866cb150da2d0f37d023d6eb3', '', '', '', '', 0, '[\"ibw.com.ni\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ibw.com.ni\"]', 'IBW Internet', 'http://ibw.com.ni', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(463, 'bucky', '519dc2755218bc249ca8936f2a7cddf0', '', '', '', '', 0, '[\"movistar.com.ni\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@movistar.com.ni\"]', 'Movistar (Telefonica)', 'http://movistar.com.ni', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(465, 'bucky', '6800a35635fdb2668cf0ab68d48fddd9', '', '', '', '', 0, '[\"alinktelecom.ne\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alinktelecom.ne\"]', 'Alink Telecom', 'http://alinktelecom.ne', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(466, 'bucky', 'eef43a67b63d316a3d3c913583c50008', '', '', '', '', 0, '[\"iniger.ne\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iniger.ne\"]', 'IX COM', 'http://iniger.ne', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(467, 'bucky', '4da1eb4ce9e8496f28e568f9bf232ccc', '', '', '', '', 0, '[\"liptinfor.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@liptinfor.net\"]', 'Liptinfor', 'http://liptinfor.net', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(468, 'bucky', '8e3ee43e89653a8ea4a2963a134d1ad1', '', '', '', '', 0, '[\"orange.ne\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orange.ne\"]', 'Orange', 'http://orange.ne', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(469, 'bucky', 'aecb90b76d2671c53777fc1cc0cee9e7', '', '', '', '', 0, '[\"sahelcom.ne\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sahelcom.ne\"]', 'Sahel Com', 'http://sahelcom.ne', '', '', '', '[\"https:\\/\\/twitter.com\\/SahelCom\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(470, 'bucky', 'bb89c7a6ee706ce533a45f4d7a31ad3d', '', '', '', '', 0, '[\"sonitel.ne\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sonitel.ne\"]', 'Sonitel', 'http://sonitel.ne', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(471, 'bucky', '4763c74187a5c3343942e0122879c15a', '', '', '', '', 0, '[\"sonitel.ne\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sonitel.ne\"]', 'Sonitel', 'http://sonitel.ne', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(472, 'bucky', '8ed466e886944a4b5216221a2350025c', '', '', '', '', 0, '[\"active24.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@active24.com\"]', 'Active 24', 'http://active24.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(473, 'bucky', '28bb28e8ca79a38e9a61a240e98e614c', '', '', '', '', 0, '[\"canaldigital.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@canaldigital.com\"]', 'Canal Digital', 'http://canaldigital.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(474, 'bucky', 'f90eb84a55e0c2829b6b735b59d0f781', '', '', '', '', 0, '[\"get.no\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@get.no\"]', 'Get AS', 'http://get.no', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(475, 'bucky', '3c74efbc9676dad1ace18e3f1349cdc7', '', '', '', '', 0, '[\"lysekonsern.no\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@lysekonsern.no\"]', 'Lyse Energi', 'http://lysekonsern.no', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0);
INSERT INTO `lists__claimableservices` (`id`, `state`, `key-session`, `key-host`, `key-isp`, `key-carrier`, `key-registrar`, `claimed-id`, `hostnames`, `name`, `nameurl`, `nameemail`, `nametwitterurl`, `companyemails`, `companyname`, `companyurl`, `companyrbn`, `companyrbntype`, `companytype`, `companytwitterurls`, `created`, `emailed`, `tweeted`, `updated`, `finished`) VALUES
(476, 'bucky', '9eb547415208fefcb0009b331e15328a', '', '', '', '', 0, '[\"nextgentel.no\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nextgentel.no\"]', 'NextGenTel', 'http://nextgentel.no', '', '', '', '[\"https:\\/\\/twitter.com\\/NextGenTel\",\"https:\\/\\/twitter.com\\/NextgenteFtth\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(477, 'bucky', 'a135d7c11583376f0a6659de21beede6', '', '', '', '', 0, '[\"nte.no\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nte.no\"]', 'Nord-TrÃ¸ndelag Elektrisitetsverk', 'http://nte.no', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(478, 'bucky', '2a0ac232e4cb4501da711e140965a57d', '', '', '', '', 0, '[\"oslo.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@oslo.net\"]', 'Oslonett', 'http://oslo.net', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(479, 'bucky', '88fa3e9698d8bc25cfab1028fdf663ed', '', '', '', '', 0, '[\"powertech.no\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@powertech.no\"]', 'PowerTech Information Systems', 'http://powertech.no', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(480, 'bucky', '54a9969d66fe31643adea058eb2b36c8', '', '', '', '', 0, '[\"start.no\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@start.no\"]', 'Start Network', 'http://start.no', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(481, 'bucky', '035be96124579da35af072e18f76fdc9', '', '', '', '', 0, '[\"telenor.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telenor.com\"]', 'Telenor', 'http://telenor.com', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Sigve_telenor\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(482, 'bucky', '09ecbf6e9f6b06c005cb2f31f959bfa6', '', '', '', '', 0, '[\"tromskraft.no\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tromskraft.no\"]', 'Troms Kraft', 'http://tromskraft.no', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(483, 'bucky', '03049f03cd24727ce4c0aa5667fe2563', '', '', '', '', 0, '[\"uninett.no\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@uninett.no\"]', 'Uninett', 'http://uninett.no', '', '', '', '[\"https:\\/\\/twitter.com\\/Uninett\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(485, 'bucky', '204ee36c1d21150de6a915fe0b4fceff', '', '', '', '', 0, '[\"friendimobile.om\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@friendimobile.om\"]', 'FRiENDi', 'http://friendimobile.om', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(486, 'bucky', 'a4696cfee23043ab3e60f51f3cf65d1f', '', '', '', '', 0, '[\"nawras.om\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nawras.om\"]', 'Nawras (Qtel)', 'http://nawras.om', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(487, 'bucky', 'a86a8a2d5661d370572b0118da8c2f6b', '', '', '', '', 0, '[\"omantel.om\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@omantel.om\"]', 'Omantel', 'http://omantel.om', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Omantel\",\"https:\\/\\/twitter.com\\/AskOmantel\",\"https:\\/\\/twitter.com\\/Omantel_om\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(488, 'bucky', '3745f31eb3cb2388c09d7c8663a47b4e', '', '', '', '', 0, '[\"rennamobile.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@rennamobile.com\"]', 'Renna (Majan Telecommunication)', 'http://rennamobile.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(490, 'bucky', '783bac65bf9a8cbfd8cb1526f64f3b80', '', '', '', '', 0, '[\"conexion.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@conexion.com.py\"]', 'Conexion', 'http://conexion.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(491, 'bucky', 'b8ecacd776821c4bd8c3695c5b344281', '', '', '', '', 0, '[\"itacom.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@itacom.com.py\"]', 'itacom Group', 'http://itacom.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(492, 'bucky', '23802fdca6c3ec5b1ab13ea7132912f5', '', '', '', '', 0, '[\"mediter.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mediter.com.py\"]', 'Mediter SRL', 'http://mediter.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(493, 'bucky', 'a91502c1076343a3fd402077274c01e9', '', '', '', '', 0, '[\"netvision.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netvision.com.py\"]', 'Netvision', 'http://netvision.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(494, 'bucky', 'a6d3a910b9934cf2d02a8dc92e9712d3', '', '', '', '', 0, '[\"personal.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@personal.com.py\"]', 'Personal', 'http://personal.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(495, 'bucky', '9067c3365fbbae54438f4b8dc199cf5c', '', '', '', '', 0, '[\"pla.net.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@pla.net.py\"]', 'Planet', 'http://pla.net.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(496, 'bucky', '357fe277ed6ef9ead9c4478225622766', '', '', '', '', 0, '[\"quanta.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@quanta.com.py\"]', 'Quanta-Neter', 'http://quanta.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(497, 'bucky', 'a3271ef4c09eba67b33891eef27c0237', '', '', '', '', 0, '[\"rieder.net.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@rieder.net.py\"]', 'Rieder Internet', 'http://rieder.net.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(498, 'bucky', 'f7384078e303c401afc96e3cd28348b7', '', '', '', '', 0, '[\"skytel.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@skytel.com.py\"]', 'Skytel', 'http://skytel.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(499, 'bucky', '4e2175314613b40480d5ed8e303ccea0', '', '', '', '', 0, '[\"tigo.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tigo.com.py\"]', 'Tigo', 'http://tigo.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(500, 'bucky', '31b817068aad5481e02105116fe8e709', '', '', '', '', 0, '[\"uninet.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@uninet.com.py\"]', 'Uninet', 'http://uninet.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(501, 'bucky', 'b77f353f11d83da0f3286fd16c91cae2', '', '', '', '', 0, '[\"vox.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vox.com.py\"]', 'VOX', 'http://vox.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(502, 'bucky', '00cb715a38e3f28e46a8d202a3b6846f', '', '', '', '', 0, '[\"vox.com.py\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vox.com.py\"]', 'VOX', 'http://vox.com.py', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(503, 'bucky', '920709975fbef8e66e75ba5b6a1fea4d', '', '', '', '', 0, '[\"artelecom.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@artelecom.pt\"]', 'AR Telecom', 'http://artelecom.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(504, 'bucky', 'c1a212a8dfcef2632dfeca876ec13041', '', '', '', '', 0, '[\"bragatel.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bragatel.pt\"]', 'Bragatel', 'http://bragatel.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(505, 'bucky', '6ccbab3327c0ec899a92ddd3f6bce9e3', '', '', '', '', 0, '[\"broadnet.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@broadnet.pt\"]', 'Broadnet Portugal', 'http://broadnet.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(506, 'bucky', '86af944ca29b83f301f435dffc8a4543', '', '', '', '', 0, '[\"cabotvm.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cabotvm.pt\"]', 'Cabo TV Madeirense', 'http://cabotvm.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(507, 'bucky', '9cb1deed236ab309aaab99d3df38d941', '', '', '', '', 0, '[\"cabovisao.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cabovisao.pt\"]', 'CabovisÃ£o', 'http://cabovisao.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(508, 'bucky', 'f6bdd784faa01a8fa761bd91ca090fc4', '', '', '', '', 0, '[\"claranet.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@claranet.pt\"]', 'Claranet Portugal', 'http://claranet.pt', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Claranet_PT\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(509, 'bucky', '27ace98aad515ee89d5cee69d82ea4ed', '', '', '', '', 0, '[\"colt-telecom.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@colt-telecom.pt\"]', 'COLT Telecom', 'http://colt-telecom.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(510, 'bucky', 'dd6b44329ee23f0c64ca6ed5a9b1e842', '', '', '', '', 0, '[\"fleximedia.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@fleximedia.pt\"]', 'FleximÃ©dia', 'http://fleximedia.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(511, 'bucky', 'd29d04a80b655db2cd5b3e2cab2ca7b8', '', '', '', '', 0, '[\"meo.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@meo.pt\"]', 'MEO (Portugal)', 'http://meo.pt', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/MEOpt\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(512, 'bucky', '445fc76684fb75d9eb43f7d2f0fdf451', '', '', '', '', 0, '[\"nfsi.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nfsi.pt\"]', 'NFSI Telecom', 'http://nfsi.pt', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/nfsi_telecom\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(513, 'bucky', 'a1d119323bca851a4263b8bcf477f1c4', '', '', '', '', 0, '[\"nortenet.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nortenet.pt\"]', 'Nortenet', 'http://nortenet.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(514, 'bucky', 'bff31a60e716bf0018d26a66db3017b2', '', '', '', '', 0, '[\"nos.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@nos.pt\"]', 'NOS ComunicaÃ§Ãµes', 'http://nos.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(515, 'bucky', '6aa97834bf1b515a3a552dceb5ff0915', '', '', '', '', 0, '[\"fibra.clix.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@fibra.clix.pt\"]', 'Optimus Clix', 'http://fibra.clix.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(516, 'bucky', 'ce60e856bd2acb796c01bf3e44b18d93', '', '', '', '', 0, '[\"sapo.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sapo.pt\"]', 'SAPO (company)', 'http://sapo.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(517, 'bucky', '4a41853c2e5454a3126f1b9e559b7d32', '', '', '', '', 0, '[\"tvtel.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tvtel.pt\"]', 'TVTEL', 'http://tvtel.pt', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(518, 'bucky', '2c29559372992bc72fb8852295a485db', '', '', '', '', 0, '[\"vodafone.pt\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vodafone.pt\"]', 'Vodafone Portugal', 'http://vodafone.pt', '', '', '', '[\"https:\\/\\/twitter.com\\/VodafonePT\",\"https:\\/\\/twitter.com\\/Vdf_pt\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(520, 'bucky', '14c58ee3e8914cf7644314ca65f9f0f9', '', '', '', '', 0, '[\"caribe.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@caribe.net\"]', 'caribe', 'http://caribe.net', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(521, 'bucky', '8dc69d6a88be090b3b18dc143e7d0487', '', '', '', '', 0, '[\"centennialpr.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@centennialpr.com\"]', 'Centennial Communications', 'http://centennialpr.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(522, 'bucky', '00abc75b1250eb5b56b74ced58703bc7', '', '', '', '', 0, '[\"choicecable.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@choicecable.com\"]', 'Choice cable (cable)', 'http://choicecable.com', '', '', '', '[\"https:\\/\\/twitter.com\\/ChoiceCableTV\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(523, 'bucky', 'c70096c49dcfd9508ce3a7a1656e5042', '', '', '', '', 0, '[\"clarotodo.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@clarotodo.com\"]', 'Claro (DSL)', 'http://clarotodo.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(524, 'bucky', '133d5652e322971dfb38845329f9959d', '', '', '', '', 0, '[\"libertypr.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@libertypr.com\"]', 'Liberty Cablevision', 'http://libertypr.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(525, 'bucky', 'e6d0f52acee03e2cdde0ab0167dbabf8', '', '', '', '', 0, '[\"libertymedia.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@libertymedia.com\"]', 'Liberty Media', 'http://libertymedia.com', '', '', '', '[\"https:\\/\\/twitter.com\\/gregmaffei\",\"https:\\/\\/twitter.com\\/corp_liberty\",\"https:\\/\\/twitter.com\\/MediaLibertyAwd\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(526, 'bucky', '66f5fc4a07872fab327d6ecd71d72cf4', '', '', '', '', 0, '[\"onelinkpr.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@onelinkpr.net\"]', 'OneLink Communications', 'http://onelinkpr.net', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(527, 'bucky', 'e5cc47f6a67e2a75e268b188c4006ac1', '', '', '', '', 0, '[\"worldnetpr.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@worldnetpr.com\"]', 'WorldNet Telecommunications', 'http://worldnetpr.com', '', '', '', '[\"https:\\/\\/twitter.com\\/WorldNetPR\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(529, 'bucky', '3446079992701e980b11afbec2f5afde', '', '', '', '', 0, '[\"qtel.qa\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@qtel.qa\"]', 'Qtel', 'http://qtel.qa', '', '', '', '[\"https:\\/\\/twitter.com\\/QtelFibre\",\"https:\\/\\/twitter.com\\/qtelqtr\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(530, 'bucky', '0c28f77daa17b0240dcdd356ca76d88e', '', '', '', '', 0, '[\"vodafone.qa\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vodafone.qa\"]', 'Vodafone', 'http://vodafone.qa', '', '', '', '[\"https:\\/\\/twitter.com\\/VodafoneQatar\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(532, 'bucky', 'bd6d138d20a2241a50bd119714c10d3c', '', '', '', '', 0, '[\"artelcommunications.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@artelcommunications.com\"]', 'ARTEL COMMUNICATIONS', 'http://artelcommunications.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(533, 'bucky', 'c9ccb3edd9a0ef087f22e01e64db6ebe', '', '', '', '', 0, '[\"rwandatel.rw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@rwandatel.rw\"]', 'RWANDATEL', 'http://rwandatel.rw', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(534, 'bucky', 'ef881d2c9eaf4842b711520ad1c61213', '', '', '', '', 0, '[\"terracom.rw\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@terracom.rw\"]', 'TERRACOM', 'http://terracom.rw', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(536, 'bucky', 'c0af94ab7edf649adb6df5c1c5e89abb', '', '', '', '', 0, '[\"att.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@att.com\"]', 'AT and T   U-verse', 'http://att.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(538, 'bucky', '4246b52678191ae662bf9464d58ed30b', '', '', '', '', 0, '[\"cstome.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cstome.net\"]', 'Companhia Santomense de TelecomunicaÃ§Ãµes', 'http://cstome.net', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(540, 'bucky', '7ae71661c06039d6c19912248f247ee0', '', '', '', '', 0, '[\"arc.sn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@arc.sn\"]', 'ARC INFORMATIQUE', 'http://arc.sn', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(541, 'bucky', '3f6f51151a2d5753f17adc644fc385da', '', '', '', '', 0, '[\"orange.sn\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orange.sn\"]', 'SONATEL MULTIMEDIA', 'http://orange.sn', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(543, 'bucky', '87ec67be5d15342834b67c36abe0b109', '', '', '', '', 0, '[\"beotel.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@beotel.net\"]', 'BeotelNet', 'http://beotel.net', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/BeotelNetISP\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(544, 'bucky', '4f5ef21aa228abd10d4c3a94379b009e', '', '', '', '', 0, '[\"bitsyu.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bitsyu.net\"]', 'Bitsyu', 'http://bitsyu.net', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(545, 'bucky', 'd6371f36c3b92cf33a688da8e3cd5326', '', '', '', '', 0, '[\"drenik.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@drenik.net\"]', 'DrenikNet', 'http://drenik.net', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(546, 'bucky', '3a5f5669463168079e4e0aeb1d32c328', '', '', '', '', 0, '[\"eunet.rs\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@eunet.rs\"]', 'EUnet', 'http://eunet.rs', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(547, 'bucky', '5f435786a356621c4e63eaae54934b10', '', '', '', '', 0, '[\"infosky.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@infosky.net\"]', 'InfoSky', 'http://infosky.net', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(548, 'bucky', '95d507840a37e031dcb69b91b2e870e7', '', '', '', '', 0, '[\"www3.ptt.rs\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@www3.ptt.rs\"]', 'PTTnet', 'http://www3.ptt.rs', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(549, 'bucky', 'cadbff1f04751f7116ea58be3b3d1651', '', '', '', '', 0, '[\"sbb.rs\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sbb.rs\"]', 'SBB Serbian Broadband', 'http://sbb.rs', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(550, 'bucky', '22b74e69e2fa5b7e194fee5480d20088', '', '', '', '', 0, '[\"scnet.yu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@scnet.yu\"]', 'SCnet', 'http://scnet.yu', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(551, 'bucky', 'ec90ca2b2662e5d3ef311d9c91365841', '', '', '', '', 0, '[\"sezampro.yu\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sezampro.yu\"]', 'SezamPro', 'http://sezampro.yu', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(552, 'bucky', '0145dd387f56e584561eb88b3cdf16fe', '', '', '', '', 0, '[\"telekom.rs\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telekom.rs\"]', 'Telekom Srbija', 'http://telekom.rs', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Telekom_Srbija\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(554, 'bucky', 'bd3a010b8afaafe29833688a010dde71', '', '', '', '', 0, '[\"iconz-webvisions.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iconz-webvisions.com\"]', 'ICONZ', 'http://iconz-webvisions.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(555, 'bucky', '4c2405499d0a2ca74f3d407cd8c7d1da', '', '', '', '', 0, '[\"m1.com.sg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@m1.com.sg\"]', 'M1 Limited', 'http://m1.com.sg', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(556, 'bucky', '85caf0b1c50bdb4adc0dddf6336ed72f', '', '', '', '', 0, '[\"pacific.net.sg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@pacific.net.sg\"]', 'Pacific Internet', 'http://pacific.net.sg', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(557, 'bucky', '02864de61b9bed1836d70491c1a2536d', '', '', '', '', 0, '[\"insing.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@insing.com\"]', 'SingNet', 'http://insing.com', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(558, 'bucky', '36e8fb3f0c423c4c023c0928302e7cc7', '', '', '', '', 0, '[\"starhub.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@starhub.com\"]', 'StarHub', 'http://starhub.com', '', '', '', '[\"https:\\/\\/twitter.com\\/StarHub\",\"https:\\/\\/twitter.com\\/StarHubCares\",\"https:\\/\\/twitter.com\\/SH_MobiTweet\",\"https:\\/\\/twitter.com\\/starhub2\",\"https:\\/\\/twitter.com\\/shanyang900\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(560, 'bucky', '70f312f121ca618ebc9fcee12e71142b', '', '', '', '', 0, '[\"alconet.sk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alconet.sk\"]', 'Alconet', 'http://alconet.sk', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(561, 'bucky', 'd89af37ee3b5b36935d94dd421760329', '', '', '', '', 0, '[\"att.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@att.com\"]', 'AT and T', 'http://att.com', '', '', '', '[\"https:\\/\\/twitter.com\\/ATT\",\"https:\\/\\/twitter.com\\/prestonjones\",\"https:\\/\\/twitter.com\\/ATTBusiness\",\"https:\\/\\/twitter.com\\/ATTexplore\",\"https:\\/\\/twitter.com\\/attshape\",\"https:\\/\\/twitter.com\\/ATTTHANKS\",\"https:\\/\\/twitter.com\\/ATTProTech\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(562, 'bucky', 'dfba2bb4b04c0b770b71d39e63c73edf', '', '', '', '', 0, '[\"dial.sk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@dial.sk\"]', 'Dial Tecom', 'http://dial.sk', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(563, 'bucky', 'ca270c42645ca2660ee44fd456bf6ca5', '', '', '', '', 0, '[\"gts.sk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@gts.sk\"]', 'GTS Slovakia', 'http://gts.sk', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(564, 'bucky', 'd9a215bb37f24c6907e5cf65d3542f51', '', '', '', '', 0, '[\"slovakTekom.sk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@slovakTekom.sk\"]', 'Slovak Tekom', 'http://slovakTekom.sk', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(565, 'bucky', 'afb10b6893bb487ebf406e86d93d1738', '', '', '', '', 0, '[\"slovanet.sk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@slovanet.sk\"]', 'Slovanet', 'http://slovanet.sk', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(566, 'bucky', 'ae25739e85904a0ea260459302a311a2', '', '', '', '', 0, '[\"upc.sk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@upc.sk\"]', 'UPC Boardband Slovakia', 'http://upc.sk', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(567, 'bucky', 'ef28b40acbf1f0154afb15ce76879175', '', '', '', '', 0, '[\"upc.sk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@upc.sk\"]', 'UPC Boardband Slovakia', 'http://upc.sk', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(568, 'bucky', '16d09dafae55931c269c10dd537cd480', '', '', '', '', 0, '[\"amis.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@amis.net\"]', 'AMIS (ISP)', 'http://amis.net', '', '', '', '[\"\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(569, 'bucky', '816cf109df5004b408280060fd8e9ecd', '', '', '', '', 0, '[\"arnes.si\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@arnes.si\"]', 'ARNES', 'http://arnes.si', '', '', '', '[\"https:\\/\\/twitter.com\\/ArnesInfo\"]', '2019-07-11 13:23:51', 0, 0, 0, 0),
(570, 'bucky', 'c71cc274f8c74320e71407324862a191', '', '', '', '', 0, '[\"telekom.si\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@telekom.si\"]', 'SiOL Internet (Telekom Slovenije)', 'http://telekom.si', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(571, 'bucky', 'ce2f5fbccb9f53196be1ce695cd77514', '', '', '', '', 0, '[\"softnet.si\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@softnet.si\"]', 'SoftNet', 'http://softnet.si', '', '', '', '[\"https:\\/\\/twitter.com\\/SoftNET_EU\",\"https:\\/\\/twitter.com\\/SoftNETSlo\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(572, 'bucky', 'adbebfacc3e66374c76cf838e6c8656d', '', '', '', '', 0, '[\"tustelekom.si\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tustelekom.si\"]', 'Volja.net (TuÅ¡ Telekom)', 'http://tustelekom.si', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(574, 'bucky', 'c56c1690224e4f689be321bcf56cb622', '', '', '', '', 0, '[\"airtel.lk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@airtel.lk\"]', 'Airtel (Sri Lanka)', 'http://airtel.lk', '', '', '', '[\"https:\\/\\/twitter.com\\/AirtelSrilanka\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(575, 'bucky', '82ff2c716dc40deebfbb0b1e21fc030e', '', '', '', '', 0, '[\"dialog.lk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@dialog.lk\"]', 'Dialog Broadband Networks', 'http://dialog.lk', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(576, 'bucky', 'fb47cf653565f08e55edfcea2417c0c5', '', '', '', '', 0, '[\"etisalat.lk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@etisalat.lk\"]', 'Etisalat (Sri Lanka)', 'http://etisalat.lk', '', '', '', '[\"https:\\/\\/twitter.com\\/EtisalatSL\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(577, 'bucky', '1bd8d87d99e5d53ed34d36260631ea3e', '', '', '', '', 0, '[\"hutch.lk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@hutch.lk\"]', 'Hutch (Sri Lanka)', 'http://hutch.lk', '', '', '', '[\"https:\\/\\/twitter.com\\/HutchSriLanka\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(578, 'bucky', 'f3f08358493b516770b9b1260438fa0f', '', '', '', '', 0, '[\"lankabell.lk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@lankabell.lk\"]', 'Lanka Bell', 'http://lankabell.lk', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(579, 'bucky', '403edaa4ccbc5247689f7c424c09a77d', '', '', '', '', 0, '[\"mobitel.lk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@mobitel.lk\"]', 'Mobitel (Sri Lanka)', 'http://mobitel.lk', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(580, 'bucky', 'd8da1fb5cefeaedc5fcb5702c53ff443', '', '', '', '', 0, '[\"slt.lk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@slt.lk\"]', 'Sri Lanka Telecom', 'http://slt.lk', '', '', '', '[\"https:\\/\\/twitter.com\\/SriLankaTelecom\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(581, 'bucky', 'd7135797041dcdb1d98625cebd6efbfc', '', '', '', '', 0, '[\"slt.lk\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@slt.lk\"]', 'Sri Lanka Telecom', 'http://slt.lk', '', '', '', '[\"https:\\/\\/twitter.com\\/SriLankaTelecom\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(582, 'bucky', 'c15bb64008f58af146222d20f990fa82', '', '', '', '', 0, '[\"cq-link.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cq-link.net\"]', 'CQ Link', 'http://cq-link.net', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(583, 'bucky', '3ee5589b54c8128c60c3f04a96d38306', '', '', '', '', 0, '[\"sr.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sr.net\"]', 'SrNet (Telesur)', 'http://sr.net', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(585, 'bucky', 'b5c11a0006e62a7451f95b5e5aea2c43', '', '', '', '', 0, '[\"sincomgroup.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sincomgroup.com\"]', 'SinCOM Switzerland', 'http://sincomgroup.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(586, 'bucky', '3e8a84546f2509b0f43e351e69077ff9', '', '', '', '', 0, '[\"sunrise.ch\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sunrise.ch\"]', 'Sunrise Communications AG', 'http://sunrise.ch', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(587, 'bucky', 'f7c042dc85b2ab658cd7ef7b9132f80e', '', '', '', '', 0, '[\"swisscom.ch\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@swisscom.ch\"]', 'Swisscom', 'http://swisscom.ch', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/Swisscom_de\",\"https:\\/\\/twitter.com\\/Swisscom_fr\",\"https:\\/\\/twitter.com\\/Swisscom_it\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(588, 'bucky', '014a463b7023c2bd9ad2d2e9c3cc7eb7', '', '', '', '', 0, '[\"upc-cablecom.ch\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@upc-cablecom.ch\"]', 'UPC Cablecom', 'http://upc-cablecom.ch', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(590, 'bucky', 'bdca70737bc67cf4fe8e0ae9cc8e4fb7', '', '', '', '', 0, '[\"aya.sy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@aya.sy\"]', 'AYA', 'http://aya.sy', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(591, 'bucky', 'ea0ce4e2a7669e67eb0b93f079ee3789', '', '', '', '', 0, '[\"e-lcom.sy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@e-lcom.sy\"]', 'e-lcom ISP', 'http://e-lcom.sy', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(592, 'bucky', '6a19cd337c296f0a2f502ede4f426ac5', '', '', '', '', 0, '[\"runnet.sy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@runnet.sy\"]', 'RunNet', 'http://runnet.sy', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/RUNNET_ISP\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(593, 'bucky', 'b2a603d87199527efddec43d9f8404d6', '', '', '', '', 0, '[\"ste.gov.sy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ste.gov.sy\"]', 'Syrian Telecom', 'http://ste.gov.sy', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(594, 'bucky', 'a14d1f010d1d006ef35fefed5010e906', '', '', '', '', 0, '[\"syriatel.sy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@syriatel.sy\"]', 'Syriatel', 'http://syriatel.sy', '', '', '', '[\"https:\\/\\/twitter.com\\/Syriatel\",\"https:\\/\\/twitter.com\\/RamiMakhlouf\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(596, 'bucky', '6a317ec94fb0238e0c871a2f91eeb621', '', '', '', '', 0, '[\"africaonline.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@africaonline.com\"]', 'Africa Online', 'http://africaonline.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(597, 'bucky', '5fc970447f09056006acccc58943b8fa', '', '', '', '', 0, '[\"africa.airtel.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@africa.airtel.com\"]', 'Airtel Tanzania', 'http://africa.airtel.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(598, 'bucky', 'b5f70c15c4436e91a6b8d0387fe71a2b', '', '', '', '', 0, '[\"alinktelecom.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@alinktelecom.net\"]', 'Alink Telecom', 'http://alinktelecom.net', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/AlinkTelecom\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(599, 'bucky', 'bfca5711b14c34f62a51d4e97c00b01e', '', '', '', '', 0, '[\"habari.co.tz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@habari.co.tz\"]', 'Habari Node', 'http://habari.co.tz', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/HabariNode\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(600, 'bucky', 'a04feac76ad6de226f68bf16477edce4', '', '', '', '', 0, '[\"iwayafrica.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iwayafrica.com\"]', 'iWayAfrica', 'http://iwayafrica.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(601, 'bucky', 'ed256a77d60481a5f23a593ca26e7c2e', '', '', '', '', 0, '[\"sasatel.co.tz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sasatel.co.tz\"]', 'Sasatel', 'http://sasatel.co.tz', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(602, 'bucky', '2808750bca36640986529f574acc0d11', '', '', '', '', 0, '[\"satconet.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@satconet.com\"]', 'SatCoNet', 'http://satconet.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(603, 'bucky', '86c603347388d7e94b312c499526cb36', '', '', '', '', 0, '[\"simbanet.co.tz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@simbanet.co.tz\"]', 'SimbaNET', 'http://simbanet.co.tz', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(604, 'bucky', '1207f87013598161b29ac82f8add89b9', '', '', '', '', 0, '[\"tigo.co.tz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tigo.co.tz\"]', 'Tigo', 'http://tigo.co.tz', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(605, 'bucky', '261efdf4deadb226bd05383d06284878', '', '', '', '', 0, '[\"vodacom.co.tz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@vodacom.co.tz\"]', 'Vodacom', 'http://vodacom.co.tz', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(606, 'bucky', '3acbefc8522e4888fb08cf28baf04b13', '', '', '', '', 0, '[\"zantel.co.tz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@zantel.co.tz\"]', 'Zantel', 'http://zantel.co.tz', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/zanteltz\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(608, 'bucky', '7b5b610c7bbd77d8c7c4414f1aa42da1', '', '', '', '', 0, '[\"bibway.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bibway.com\"]', 'BIB', 'http://bibway.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(609, 'bucky', '33dc9d6af40c2332280e18be788b5d30', '', '', '', '', 0, '[\"cafe.tg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cafe.tg\"]', 'CAFE', 'http://cafe.tg', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(610, 'bucky', '660c04fad4bba8823f9d3252b3fd030d', '', '', '', '', 0, '[\"ids.tg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ids.tg\"]', 'IDS', 'http://ids.tg', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(611, 'bucky', 'e453ec6c1f2fb834398bc72c111ce3c1', '', '', '', '', 0, '[\"togo-imet.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@togo-imet.com\"]', 'IMET', 'http://togo-imet.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(612, 'bucky', 'e10c0a5d33b997f368d67a136fbee5ef', '', '', '', '', 0, '[\"laposte.tg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@laposte.tg\"]', 'ISP LA POSTE ONLINE', 'http://laposte.tg', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(613, 'bucky', '34eff148a5ad540d833dce30432a23a2', '', '', '', '', 0, '[\"togotel.net.tg\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@togotel.net.tg\"]', 'TOGO TELECOM', 'http://togotel.net.tg', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(614, 'bucky', '4e1175efb77c35d0c06e6ec8e52e12a6', '', '', '', '', 0, '[\"woezon.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@woezon.com\"]', 'WOEZON COM', 'http://woezon.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(616, 'bucky', '6a84f24bdf4ef9e65771c04275515a3a', '', '', '', '', 0, '[\"online.tm\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@online.tm\"]', 'Turkmentelecom', 'http://online.tm', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(618, 'bucky', '924365e18f35896792c3069a527f09e8', '', '', '', '', 0, '[\"afsat.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@afsat.com\"]', 'AFSAT COMMUNICATIONS', 'http://afsat.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(619, 'bucky', '197f27697ad27b90bd583b7976226440', '', '', '', '', 0, '[\"bushnet.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@bushnet.net\"]', 'BUSHNET', 'http://bushnet.net', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(620, 'bucky', '78177079d6bf4121de1b2667e70d8602', '', '', '', '', 0, '[\"comnetservices.org\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@comnetservices.org\"]', 'COMNET', 'http://comnetservices.org', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(621, 'bucky', 'f3f3ff268d909a7f3f8f8dbbaf194662', '', '', '', '', 0, '[\"franscom.8m.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@franscom.8m.com\"]', 'FRANSCOM', 'http://franscom.8m.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(622, 'bucky', '67a38a5d4f51c054cc24b4bf6307635b', '', '', '', '', 0, '[\"infocom.co.ug\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@infocom.co.ug\"]', 'INFOCOM', 'http://infocom.co.ug', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(623, 'bucky', '2df0231c0d314cd325e09a4c88836d89', '', '', '', '', 0, '[\"iwayafrica.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iwayafrica.com\"]', 'iWayAfrica', 'http://iwayafrica.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(624, 'bucky', 'b8b100a65dcd4441aa54471d92bdc5a0', '', '', '', '', 0, '[\"netguide.co.ug\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@netguide.co.ug\"]', 'METROCOMIA', 'http://netguide.co.ug', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(625, 'bucky', '0b6d0a0fb52a929d52aca6b79d9a9f4d', '', '', '', '', 0, '[\"orange.ug\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@orange.ug\"]', 'Orange Telecom', 'http://orange.ug', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(626, 'bucky', '5c7fb014eac1570f168f5d569c06acc8', '', '', '', '', 0, '[\"roketelkom.co.ug\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@roketelkom.co.ug\"]', 'Roke Telkom', 'http://roketelkom.co.ug', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(627, 'bucky', 'e461bcd0b22234a4e323cfce36e1236a', '', '', '', '', 0, '[\"sanyutel.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@sanyutel.com\"]', 'SANYUTEL', 'http://sanyutel.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(628, 'bucky', '26dfe0f3bacb61514bfb3b147b43637a', '', '', '', '', 0, '[\"simbanet.co.tz\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@simbanet.co.tz\"]', 'SimbaNET', 'http://simbanet.co.tz', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(629, 'bucky', '17d5e1ba5e398c650c459ce9b7c8d257', '', '', '', '', 0, '[\"tangerine.ug\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@tangerine.ug\"]', 'Tangerine', 'http://tangerine.ug', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(630, 'bucky', '905abe2345001401d2c2c792cd858616', '', '', '', '', 0, '[\"utl.co.ug\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@utl.co.ug\"]', 'Uganda Telecom Limited', 'http://utl.co.ug', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(631, 'bucky', 'e52826d0fd0ceac192899557de7c36ae', '', '', '', '', 0, '[\"waridtel.co.ug\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@waridtel.co.ug\"]', 'Warid Telecom Uganda Limited', 'http://waridtel.co.ug', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(632, 'bucky', '0e979996a651d16c0229cf7a084591c6', '', '', '', '', 0, '[\"ug.zain.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ug.zain.com\"]', 'Zain Uganda', 'http://ug.zain.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(634, 'bucky', 'd2477c7b7f5ab1af2372c51d6e9d745c', '', '', '', '', 0, '[\"du.ae\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@du.ae\"]', '( Du ) Emirates Integrated Telecommunications Company', 'http://du.ae', '', '', '', '[\"https:\\/\\/twitter.com\\/dutweets\"]', '2019-07-11 13:23:52', 0, 0, 0, 0);
INSERT INTO `lists__claimableservices` (`id`, `state`, `key-session`, `key-host`, `key-isp`, `key-carrier`, `key-registrar`, `claimed-id`, `hostnames`, `name`, `nameurl`, `nameemail`, `nametwitterurl`, `companyemails`, `companyname`, `companyurl`, `companyrbn`, `companyrbntype`, `companytype`, `companytwitterurls`, `created`, `emailed`, `tweeted`, `updated`, `finished`) VALUES
(635, 'bucky', '58669eb0186d31fcf504816ac599e110', '', '', '', '', 0, '[\"cygnustelecom.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@cygnustelecom.com\"]', 'Cygnus Telecom - Satellite Services website', 'http://cygnustelecom.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(637, 'bucky', '6ad55249ef847354f7913b4645e4a010', '', '', '', '', 0, '[\"etisalat.ae\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@etisalat.ae\"]', 'Etisalat', 'http://etisalat.ae', '', '', '', '[\"\",\"https:\\/\\/twitter.com\\/etisalat\",\"https:\\/\\/twitter.com\\/Etisalat_Care\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(638, 'bucky', '0c68a6e0a88b239aca5d2d42914647df', '', '', '', '', 0, '[\"claro.com.uy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@claro.com.uy\"]', 'Claro', 'http://claro.com.uy', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(639, 'bucky', 'd3e343dd25a446b06535fcc626bbee82', '', '', '', '', 0, '[\"dedicado.com.uy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@dedicado.com.uy\"]', 'Dedicado', 'http://dedicado.com.uy', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(640, 'bucky', 'd0a20863e2a5ae81e44b4927d3c7b18d', '', '', '', '', 0, '[\"movistar.com.uy\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@movistar.com.uy\"]', 'Movistar', 'http://movistar.com.uy', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(642, 'bucky', '1a72746ad649d458eb2b0a8bb5becf96', '', '', '', '', 0, '[\"ityemen.net\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@ityemen.net\"]', 'IT Yemen', 'http://ityemen.net', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(643, 'bucky', 'dcf88d10949cae107e0e1d0e33e89119', '', '', '', '', 0, '[\"africaonline.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@africaonline.com\"]', 'Africa Online', 'http://africaonline.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0),
(644, 'bucky', 'd95cc5dd2642f5cd70b4a5194b76f0f5', '', '', '', '', 0, '[\"iwayafrica.com\"]', 'Dr. Simon A. Roberts', 'https://internetfounder.wordpress.com', 'simonxaies@gmail.com', 'https://twitter.com/SimonXaies', '[\"support@iwayafrica.com\"]', 'iWayAfrica', 'http://iwayafrica.com', '', '', '', '[\"\"]', '2019-07-11 13:23:52', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lists__companies`
--

CREATE TABLE `lists__companies` (
  `id` int(64) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL DEFAULT '',
  `urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `terms-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `privacy-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `contact-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `blog-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `twitter-users` varchar(255) NOT NULL DEFAULT '0',
  `countries` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `tla` varchar(15) NOT NULL DEFAULT '',
  `headoffice-addressid` int(32) UNSIGNED NOT NULL DEFAULT '0',
  `mail-addressid` int(32) UNSIGNED NOT NULL DEFAULT '0',
  `rbn` varchar(30) NOT NULL DEFAULT '',
  `rbntype` varchar(64) NOT NULL DEFAULT '',
  `rbn-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `switch-phoneid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `switch-emailid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `accounts-phoneid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `accounts-emailid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `resources-phoneid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `resources-emailid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `legal-phoneid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `legal-emailid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `feedback-emailid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `complaints-emailid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `feed-products-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `feed-prices-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `feed-tickets-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `feed-errors-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `feed-waiting-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `recovery-emailid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `recovery-urlid` int(64) UNSIGNED NOT NULL DEFAULT '0',
  `created` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `updated` int(12) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__data`
--

CREATE TABLE `lists__data` (
  `id` int(250) UNSIGNED NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT '',
  `value` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__departments`
--

CREATE TABLE `lists__departments` (
  `id` int(24) NOT NULL,
  `unixname` varchar(45) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `created` int(12) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lists__departments`
--

INSERT INTO `lists__departments` (`id`, `unixname`, `title`, `created`) VALUES
(1, 'sales', 'Sales', 1563652962),
(2, 'support', 'Technical Support', 1563652962),
(3, 'billing', 'Billing', 1563652962),
(4, 'bizsales', 'Business Sales', 1563652962),
(5, 'bizsupport', 'Business Technical Support', 1563652962),
(6, 'bizbilling', 'Business Billing', 1563652962),
(7, 'hr', 'Human Resources', 1563652962),
(8, 'board', 'Board of Directors', 1563652962),
(9, 'accounts', 'Accounts Payable', 1563652962),
(10, 'marketing', 'Marketing Department', 1563652962),
(11, 'legal', 'Legal Department', 1563652962),
(12, 'executives', 'Executives Suite', 1563652962),
(13, 'council', 'Council of Members', 1563652961);

-- --------------------------------------------------------

--
-- Table structure for table `lists__emails`
--

CREATE TABLE `lists__emails` (
  `id` int(128) UNSIGNED NOT NULL,
  `dataid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `nameid` int(128) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(196) NOT NULL DEFAULT '',
  `emails` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `created` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `verified` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `emailed` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `ndned` int(12) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__fields`
--

CREATE TABLE `lists__fields` (
  `id` int(24) UNSIGNED NOT NULL,
  `type` enum('address','data','email','name','phone','url','hours','twitter-url','person') NOT NULL DEFAULT 'data',
  `unixname` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `weight` int(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lists__fields`
--

INSERT INTO `lists__fields` (`id`, `type`, `unixname`, `name`, `weight`) VALUES
(1, 'address', 'address', 'Address', 1),
(2, 'email', 'email', 'eMail Address', 2),
(3, 'phone', 'phone', 'Local Phone Number', 3),
(4, 'phone', 'international', 'International Phone Number', 4),
(5, 'phone', 'fax', 'Fax', 5),
(6, 'phone', 'mobile', 'Mobile', 6),
(7, 'phone', 'outofhours', 'Out-of-hours Mobile', 7),
(8, 'person', 'manager', 'Manager', 8),
(9, 'person', 'executive', 'Executive', 9),
(10, 'url', 'website', 'Website URL', 10),
(11, 'twitter-url', 'twitter', 'Twitter Profile URL', 11),
(12, 'hours', 'hours', 'Departmental Hours', 12),
(13, 'data', 'pgpkey', 'Open PGP Key', 13);

-- --------------------------------------------------------

--
-- Table structure for table `lists__hours`
--

CREATE TABLE `lists__hours` (
  `id` int(24) UNSIGNED NOT NULL,
  `24hours` enum('Yes','No') NOT NULL DEFAULT 'No',
  `open` varchar(5) NOT NULL DEFAULT '09:00',
  `close` varchar(5) NOT NULL DEFAULT '17:30',
  `closed-weekend` enum('Yes','No') NOT NULL DEFAULT 'No',
  `closed-holidays` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__keywords`
--

CREATE TABLE `lists__keywords` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `keyword` varchar(45) DEFAULT '',
  `occurances` int(8) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__keywords_companies`
--

CREATE TABLE `lists__keywords_companies` (
  `companyid` int(64) UNSIGNED NOT NULL,
  `keywordid` int(128) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__keywords_urls`
--

CREATE TABLE `lists__keywords_urls` (
  `keywordid` int(128) UNSIGNED NOT NULL,
  `urlid` int(64) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__lists`
--

CREATE TABLE `lists__lists` (
  `id` int(4) UNSIGNED NOT NULL,
  `key` varchar(128) NOT NULL DEFAULT '',
  `state` enum('Online','Ignore','Query') NOT NULL DEFAULT 'Online',
  `modal` varchar(32) NOT NULL DEFAULT '',
  `primary` enum('Yes','No') DEFAULT 'No',
  `ssl` enum('Yes','No') DEFAULT 'No',
  `syndicate` enum('Yes','No') DEFAULT 'Yes',
  `hostname` varchar(128) NOT NULL DEFAULT 'simonaroberts.com',
  `title` varchar(128) NOT NULL DEFAULT '',
  `feed-uri` varchar(128) NOT NULL DEFAULT '/v1/%mode.rss?%number',
  `keyword-uri` varchar(128) NOT NULL DEFAULT '/v1/%keyword.html',
  `service-uri` varchar(128) NOT NULL DEFAULT '/v1/%key/%companyname.html',
  `auth-uri` varchar(128) NOT NULL DEFAULT '/v1/%mode/%key/auth.%format',
  `callback-uri` varchar(128) NOT NULL DEFAULT '/v1/%state/%mode/%key/callback.%format',
  `services-total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `claimableservices-total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `companies-total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `departments-total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `emailaddresses-total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `names-total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `people-total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `urls-total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tweets-average-hour` double(22,12) UNSIGNED NOT NULL DEFAULT '0.000000000000',
  `tweets-hour` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tweets-total` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tweets-start` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tweets-end` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tweets-next` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sydnicated` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `pulled` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `pushed` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tweeted` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `authed` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `twitter-user` varchar(64) NOT NULL DEFAULT 'SimonXaies',
  `consumer-api-key` varchar(64) NOT NULL DEFAULT '',
  `consumer-api-secret-key` varchar(64) NOT NULL DEFAULT '',
  `access-token-key` varchar(64) NOT NULL DEFAULT '',
  `access-token-secret-key` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lists__lists`
--

INSERT INTO `lists__lists` (`id`, `key`, `state`, `modal`, `primary`, `ssl`, `syndicate`, `hostname`, `title`, `feed-uri`, `keyword-uri`, `service-uri`, `auth-uri`, `callback-uri`, `services-total`, `claimableservices-total`, `companies-total`, `departments-total`, `emailaddresses-total`, `names-total`, `people-total`, `urls-total`, `tweets-average-hour`, `tweets-hour`, `tweets-total`, `tweets-start`, `tweets-end`, `tweets-next`, `sydnicated`, `pulled`, `pushed`, `tweeted`, `created`, `authed`, `twitter-user`, `consumer-api-key`, `consumer-api-secret-key`, `access-token-key`, `access-token-secret-key`) VALUES
(1, '9b7c4c85a5c52e079ae10ab1e1bbd45e', 'Online', 'host', 'No', 'No', 'Yes', 'host.simonaroberts.com.localhost', 'Master Company List of Hosting/Server Providers', '/v1/%mode.rss?%number', '/v1/%keyword.html', '/v1/%key/%companyname.html', '/v1/%mode/%key/auth.%format', '/v1/%state/%mode/%key/callback.%format', 0, 0, 0, 0, 0, 0, 0, 0, 0.000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SimonXaies', 'H7GDmOKYW1VyF0nlH0EOcA', 'bL4aaZrQvfQ3oF9z7H4yV6V87DWhMvIK10XPRNWQJ5A', '39871064-k8q0YPd3eBbPqzC7sSBFs5u4qiMfLhGHsyO7kuxmn', 'byD3wzS9QjvmPFJwOgagxA8IQiat04rib9m9C6GQVlemb'),
(2, 'ba0caaee4d34b436286ed6884e65ba14', 'Online', 'isp', 'Yes', 'No', 'Yes', 'isp.simonaroberts.com.localhost', 'Master Company List of Internet Service Providers', '/v1/%mode.rss?%number', '/v1/%keyword.html', '/v1/%key/%companyname.html', '/v1/%mode/%key/auth.%format', '/v1/%state/%mode/%key/callback.%format', 0, 0, 0, 0, 0, 0, 0, 0, 0.000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SimonXaies', 'QvVwlfdhIzUDaAMAF7GmOAIqV', 'SHqJZ5fPs7oGMeuVbCeXAiChV8fbRq82FesVSgLCnTJYUDINeG', '39871064-9GbbMwwKbsMFvSakPJME7DX4LRc00QAl05hoBHIGR', 'ANIvgcdcpohaQCXCbwyw7f9VdljYxSL9GJ2ZbiEb7W8aP'),
(3, 'eebf90cdae6bf2f903d7e45df8dea7e5', 'Online', 'carrier', 'No', 'No', 'Yes', 'carrier.simonaroberts.com.localhost', 'Master Company List of Phone/Mobile Telco/Carriers', '/v1/%mode.rss?%number', '/v1/%keyword.html', '/v1/%key/%companyname.html', '/v1/%mode/%key/auth.%format', '/v1/%state/%mode/%key/callback.%format', 0, 0, 0, 0, 0, 0, 0, 0, 0.000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SimonXaies', 'FVsJ7Nlz0ZXWiBYClqjrrSFsL', 'chigt2QkFevxBTvFeXQd6b1TwapYnuWqfZyZ4jEZ26CwNfYbDi', '39871064-V96nw9lxoOoQpgcHDkCwcmES2KsBS15JvOVf0GxTN', 'WUHtUbXvU4ptIA7plzIIYj4FMsKiOKCYPbdWLUWExjjeu'),
(4, '80a9fa8cc57ecdd4fe0bac2fcabb757d', 'Online', 'registrar', 'No', 'No', 'Yes', 'registrar.simonaroberts.com.localhost', 'Master Company List of Domain/Realm Registrar\'s', '/v1/%mode.rss?%number', '/v1/%keyword.html', '/v1/%key/%companyname.html', '/v1/%mode/%key/auth.%format', '/v1/%state/%mode/%key/callback.%format', 0, 0, 0, 0, 0, 0, 0, 0, 0.000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SimonXaies', '8jAHpYO366638DAWq5cFt1IaL', 'WsRwqXw8ONLJ6lCwyC1y6tvolmfgWkcrPGMUU4UoR7XB7pxaLl', '39871064-d2IhQMANqArdRzTzF0uoFPLCPxHtyaWQLEtPZD0Fc', 'Y7q86fk3Z35X5kohgBMRhpKrrVttbSrTcZGftNQ5Ge0Yj');

-- --------------------------------------------------------

--
-- Table structure for table `lists__names`
--

CREATE TABLE `lists__names` (
  `id` int(128) UNSIGNED NOT NULL,
  `superfix-id` varchar(32) NOT NULL DEFAULT '',
  `prefix-id` varchar(32) NOT NULL DEFAULT '',
  `suffix-id` varchar(32) NOT NULL DEFAULT '',
  `first` varchar(45) NOT NULL DEFAULT '',
  `second` varchar(45) NOT NULL DEFAULT '',
  `third` varchar(45) NOT NULL DEFAULT '',
  `last` varchar(45) NOT NULL DEFAULT '',
  `created` int(12) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__names_prefixes`
--

CREATE TABLE `lists__names_prefixes` (
  `id` varchar(32) NOT NULL,
  `short` varchar(10) NOT NULL,
  `long` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lists__names_prefixes`
--

INSERT INTO `lists__names_prefixes` (`id`, `short`, `long`) VALUES
('01cb6fa8d15727ac69ccc4ceb211c8b4', '', 'Earl'),
('0310741e47acbd817edf0ae3772ebac1', '', 'Air Marshal'),
('04cd84ff9b3c7922ee09ad9ca74b255b', '', 'Manager'),
('06d8f234dfd19135100ec28a44728b74', '', 'Regimental Sergeant Major of the Army'),
('0794af98c8efe3f91d864e5704a009ab', 'Sr', 'Sister'),
('082ea090339ad8a0b3aee9314ecb8c0b', '', 'Staff Cadet'),
('09cf4aee32a48d98b0b2356dd82d75ec', '', 'Captain (Navy)'),
('0add9f4cc4a6d1e681a61f46854f692a', '', 'Emperess'),
('0c98e1d1bf06d4d9ce8217d82399a3a8', '', 'Rector'),
('0de1c829810393d5e5c6fc4874077515', '', 'Deaconess'),
('1254a663f97dd2e2a1f788c380fbf9a7', '', 'Sergeant'),
('13676be07cad26da36e21f1524f0e9ad', '', 'Canon'),
('1b8d02409028686bf75ebfadc90c68b0', '', 'Right Reverend'),
('1bfd7afb03fc217c89e6516c3227de2f', '', 'Sister Superior'),
('1f4d0dc74b109b81cc01a241fe39465c', '', 'Midshipman'),
('2081f2dec2a7c6e5de6090185a937630', '', 'Brigadier'),
('233fa1b84a4ec2af9bb5b1109050a83d', '', 'Lieutenant (ARMY)'),
('2346c03f05df7194eda97f6e33d9a5c7', '', 'Goshi'),
('23a4bd7c6d4c5ee69f8ba1ce24859edb', '', 'Leading Aircraftwoman'),
('2760165a3d2fb3e5ad4b13a10edae9ff', '', 'Air Chief Marshal'),
('2840d4ccae839794afc19d16e88f7568', '', 'Cadet'),
('2974e899556ae3b8217761fc3e3f548f', '', 'General'),
('2e833314b7ac6789886ecdf526c3eead', '', 'Vice Admiral'),
('33747cb137d18dfd62454aeafe8713a0', '', 'Aircraftman'),
('33963c6516c81c9ca8687bb5171e7f7c', '', 'Lance Corporal'),
('34bea57ed5f2508b12c250f2c9295cbb', '', 'Minister'),
('36ad8745c636ea7e0707ef8caeb00fca', '', 'Cardinal'),
('3e0e6f18c06d533a049155f6a9c239fb', '', 'Chaplain'),
('41296dad4722909febf93321fb6d989b', '', 'Group Captain'),
('41d5ce988b6f060b6320d8fd543a0588', '', 'Admiral'),
('425228ce0a9eeb15e6faa34be80a9740', '', 'Warrant Officer of the Navy'),
('4293327f7586fa683f1191e5a4928941', '', 'Aircraftwoman'),
('43b3f976d0f8f38985438c3bceae941f', '', 'Ambassador'),
('450fa947ecbeb3a80f6fa174d5214494', '', 'Rabbi'),
('4569134a351279c4899627e8ca543a32', '', 'Seaman'),
('4687cee3794a38298c3a1add2a4b7cf1', '', 'Constable'),
('4834df9b53f22c64d74259f9841e4284', '', 'Prince'),
('4eeedf9ed647171852f17e68a4d02c75', '', 'Station Master'),
('5137e4f6ca85c2aa8269c48c5db5b163', '', 'Director'),
('55ccbfab7dc6dc6645c9c3c05c12779c', '', 'Consul'),
('55fd5d1783fd981a3ae86f3a40f24e5a', '', 'Senior'),
('584557b0e3b9b10e8dd2c538925a09f0', '', 'Warrant Officer of the Air Force'),
('5e5a1b7131d72c60d6c6de2fd91ac696', '', 'Justice'),
('5ff3bad5483d989dd0e6a5e96934381b', '', 'Pastor'),
('617ef9271943728788c57cc19e4535f3', '', 'Chief Petty Officer'),
('62494220f24faafe6937244462902d71', '', 'Swami'),
('65442248663cba407f7b6c44576302bf', '', 'Major'),
('69e0b9a1993c9787cb38f5852fd5b75d', '', 'Lieutenant Commander'),
('6b6f6f89125746cf81d4f4b05cf9e3b5', '', 'Madame'),
('725813cce672445c38aeb9439b9aa2a5', '', 'Lance Bombardier'),
('728c715ac6e8a1a5a96012f7d6576691', '', 'Squadron Leader'),
('743068bd1ac6cc8c3b9191fa8a3be32d', '', 'Colonel'),
('780050c4c644f5a558f86ebb362eda49', '', 'Madam'),
('7b2b8d86c433429ae8b7d96169b7f9cd', '', 'Principle'),
('7c9f5f184552cb914b41ddd185530be9', '', 'Regimental Sergeant Major'),
('7f937a7fd2abd88960433bbc0aa9086e', '', 'Second Lieutenant'),
('866906fd01d01cedaabe8b433b184b3b', '', 'Lord'),
('87a828214bcc2e7c0368178033680143', '', 'Alderman'),
('8a3b2db1ab7d7e7f980b3b3be38082ad', '', 'Warrant Officer (AIR FORCE)'),
('8ea61a9977aecc37ac9a8ba927144180', '', 'Senator'),
('8f5ea8b74af8430cf39c9ef6b5bf1bb5', '', 'Sub lieutenant'),
('90a6acc2525d4164b8a9034c27035e9b', '', 'Lieutenant Colonel'),
('93e510b7b62c536b0792569fda28d20b', '', 'Lieutenant Governor'),
('94e89d168699d4762dab7b22cbe18f95', '', 'Bishop'),
('99e48daaf7b22ccd4b43d1a86cfed790', '', 'Flight Lieutenant'),
('9aad0aabdf616367cde42aaa5b081d93', '', 'Most Reverend'),
('9b012dea91832ad40ca64ac922d9e36a', '', 'Dame'),
('9bf3dd0ee888c3fe4e25ddc42b537847', '', 'Judge'),
('9d18b663c544873263e9c80233176f46', '', 'Superintendent'),
('9fbb137a221ea6220de5d30c1e9930b7', '', 'Leading Seaman'),
('a1d2c561a9ef512369cbfdfa4f9b4462', '', 'Warrant Officer Class 1'),
('a4785bd233bb6b9924f67114f022b271', '', 'Rear Admiral'),
('a4949fc4580992772db2713ead4788b6', '', 'Baron'),
('a4caba5c8ece7a26aae0ada0e1dd0675', '', 'Dean'),
('a4f8204c6456ca144eee51b62e925f8c', '', 'Bombardier'),
('a5280585c42d3b1a4fb1b93e0a780c1d', '', 'Archbishop'),
('a8af0023416f432aea6ff671886b5e4d', 'Br', 'Brother'),
('aae0a1acedc9ee051da872d4beefe0a2', '', 'Warrant Officer Class 2'),
('aedfbb34f03419a8f54e02c894707010', '', 'Abbot'),
('af66cb7331c4a4677d1cb1ed6e91e34c', '', 'Staff Sergeant'),
('b0004b028d7b11eeaaa4f32f6d9c9f44', '', 'Leading Aircraftman'),
('b0495323bde3d2a3dad2397c26f3d7f4', '', 'Deacon'),
('b3d9ddafb1715e820043aff1a8624e22', '', 'Lieutenant (NAVY)'),
('b88705c553473152dc1b46fa6fed4fa7', '', 'Princess'),
('bae19e3062d22a05883a67e55d0dce97', '', 'Countess'),
('bdbc5a07c83e98c324e7ad638439323c', '', 'Associate Professor'),
('be3a93fbb9fed8958c0b5aa08c6b7ac0', '', 'Emperor'),
('be909cfc78154684f484686b89b38635', '', 'Baroness'),
('bff29462bf6a5dc55a611108f7a09245', '', 'Crown Princess'),
('c13491c84771dcd023139efd6a8c4ede', '', 'Private'),
('c273eef75f12b968445cfc98a3f15d6c', '', 'Grand'),
('c34126733913c9487860ae38dceee61c', '', 'Governor'),
('c423a964fc8515d4e9290887b2341351', '', 'Commander'),
('c47f3edfaab2875148bb25752c6b20ac', '', 'Mayoress'),
('c56c4f2421886f5bd71aff68e3bd3cb6', '', 'Flight Sergeant'),
('c9d607d2425783dfc5e3f2c885deaba6', '', 'Grace'),
('cbf5fb262c5ecbb50593052b748d7b2c', '', 'Officer Cadet'),
('ccd40cf4a022a07cd556cadfb9d46f2c', '', 'Lieutenant General'),
('cd401bf03add3e2f3558f6eedf6c4263', '', 'Pilot Officer'),
('d006b72b4377ff89e5be16d5ec001bce', '', 'Monsignor'),
('d011bab8c41d02e215eb5985ab7f31b9', '', 'Mayor'),
('d0e5d10e1708c67d66ab2fb3e7982f73', '', 'Petty Officer'),
('d1baa5a2e5463f42c500d66c000eec24', '', 'Engineer'),
('d6a1d7418da50f4fd7474445ae82d5f7', '', 'Warrant Officer (NAVY)'),
('d86cddc8300040314064887b51b20181', '', 'Viscount'),
('d8a9de6182e760418dd3bcbcb9086481', '', 'Air Vice Marshal'),
('d9d41699d8279c253bb9d9e271c684f0', '', 'Mother'),
('da1c5a5a1efe22a1e8990c33c1fcfff7', '', 'Crown Prince'),
('da410a47ead127940bdb509a433ca07f', '', 'Wing Commander'),
('db26c6b34da0d8ace7374dde5b81429c', '', 'Count'),
('df521b441896ecd853f61e797d36c769', '', 'Commodore'),
('e0856b141bcce28380e0e6cb34f733c2', '', 'Vice Commander'),
('e8660cf4af520ab667fe65342fc72338', '', 'Major General'),
('ebc2cea478c389acaf695705f4b6eaab', '', 'Air Commodore'),
('ed7e8aa693dd4130b3ac1e771c5c1f63', '', 'Archdeacon'),
('ef61217e0abd930532352087717aa608', '', 'Right Honourable'),
('f066dbf72bed53f904b728b3fb97b96c', '', 'Flying Officer'),
('f3e44b9bb26c0cbfab6aa5672adb7e70', '', 'Commissioner'),
('f41661d7e2ef0cfcb7d401bf7372e3a7', '', 'Able Seaman'),
('f65dfdbd651eb8a52b5c8dd988e4018c', '', 'Corporal'),
('fc0087f7307d57d1c94c789b2d43495d', '', 'Nurse'),
('fe0ee7c23dd218ca10c07c408c7ae0d2', '', 'Deputy Superintendent'),
('fe8797d4c44631bde1ca6920bdc79008', '', 'Esteemed');

-- --------------------------------------------------------

--
-- Table structure for table `lists__names_suffixes`
--

CREATE TABLE `lists__names_suffixes` (
  `id` varchar(32) NOT NULL,
  `short` varchar(10) NOT NULL,
  `long` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lists__names_suffixes`
--

INSERT INTO `lists__names_suffixes` (`id`, `short`, `long`) VALUES
('0672852e2026dedb91f18cfe4d4b5071', '', 'Companion of Honour'),
('07ee33872a499630da585ec9f67cf2f1', '', 'Dame Commander of the Order of the Bath'),
('0881810b1a455deb47feaf27f7ec59f5', '', 'Knight Commander of the Order of the British Empire'),
('088d120bcdbead127a3a4550815dedb8', '', 'Knight Bachelor'),
('0e5d60c8b596b2cfe413e5e166f957ad', '', 'Commissioner of Declarations'),
('134ad43d14599850b6ddd82cd86ee9f4', '', 'Dame Commander of the Order of the British Empire'),
('1a814c5ad70d6815674861c6f6544e89', '', 'Knight Commander of the Order of the Bath'),
('2b8a172017f3efeb8955b8eee4c590ce', '', 'Knight of the Garter'),
('30a3d50d2e1c0d3c9aabe244080298db', '', 'Sixth'),
('3296a9504a2cd31431f400fcdad8c827', '', 'Member of the Order of Australia'),
('3405bc526ce7b41e68699a3e8c03e231', '', 'Member of Parliament'),
('359f6dcd26a1b1cb79a37b8896b037de', '', 'Officer of the Order of Australia'),
('3f2f28e638b53aebe065d8c39e7e0051', '', 'Knight of the Order of Australia'),
('42ac16a40c1a5682556f2baf332900f3', '', 'Knight of the Thistle'),
('46198b2ceb9187da4a6b687eccfe5223', '', 'Member of the Order of the British Empire'),
('55fd5d1783fd981a3ae86f3a40f24e5a', '', 'Senior'),
('571b99b5a1e390df8a11e958351de51d', '', 'Tenth'),
('5f6559917e57b4fd3f8fa0f2ae87d80f', '', 'Ninth'),
('64a2734a4b640d1632f4be85233b72d3', '', 'Second'),
('6780e6a65cd0f748de70a0946e1b94d5', '', 'Fifth'),
('711081097d6b763f0c7e647ea5d5e7fd', '', 'Member of the Legislative Council'),
('729322a480460ee47a294158ba90d0f4', '', 'Distinguished Service Cross'),
('806dc95ed9966fcc4674084886f5957b', '', 'Dame Commander of the Royal Victorian Order'),
('8e46d8e0eeb4a120c2083dc6939fcc48', '', 'Third'),
('8f0f2b3d45412844fd6284e394e0062b', '', 'Medal of the Order of Australia-Order of St John'),
('a02ea7ef2d8904f93e00e7c8d92c96aa', '', 'First'),
('a1d40e436b2d57383d5fe88af91b7e51', '', 'Fourth'),
('a29b9e63dd1a366627390fcc102f239d', '', 'Dame of the Order of Australia'),
('a3137b54577df22e1af9fc7992843e48', '', 'Dame Commander of the Order of Saint Michael and Saint George'),
('a384e67163a0187ef5323a45279a266f', '', 'Military Cross'),
('a8c69d65385671a7bcba67768d049bfe', '', 'Member of the Legislative Assembly'),
('ad5d999853239f93596ff1d735eb62f1', '', 'MD'),
('b374f4c614d65ea7c81f52d10cf84ebf', '', 'Seventh'),
('b6ba1691c6c03390e5a6aa8f3005cb28', '', 'Justice of the Peace'),
('b9064e3f1188f0fa78da59a8050011aa', '', 'Knight Commander of the Order of Saint Michael and Saint George'),
('bde96d0cd2ebeeb2d19ddbe1c8ad878a', '', 'Esquire'),
('c14e7fbd2069fdef16da50ded23257e9', '', 'Distinguished Flying Medal'),
('c84608c17a9c19ab2a1fb9d2a80a1fb3', '', 'Cross of Valour'),
('cf7269e567d9170435ceafe501b2f66d', '', 'Officer of the Order of the British Empire'),
('cfaff60f3a844a0ae74bcd240e3f94e6', '', 'British Empire Medal'),
('d0156c761011c934326fff9d9e3ff178', '', 'George Cross'),
('d0d72d0153d4191910ade77695b51175', '', 'Victoria Cross'),
('d7160e86b603ba164ad71bbde8b512e9', '', 'Bravery Medal'),
('da61d8a3ffbaaad75ddadbc5352d51c8', '', 'Queens Counsel'),
('e00d74fc897c119a7d49c2fba6bbdf14', '', 'Member of the House of Representatives'),
('e06c9c5c80966ea20f8b7bff4e5fdbc3', '', 'Order of Merit'),
('e38b3aa168c765728e6e9d673bd067f6', '', 'Knight Commander of the Royal Victorian Order'),
('e9d5cbd56fc4f38ce611b229adbfe633', '', 'Distinguished Service Medal'),
('eb948ea4b9fd1625e5cfe9c545999e28', '', 'Officer Commanding'),
('ebf9e839f85bf2ad42f46c404e07210b', '', 'Member of the House of Assembly'),
('ec01aeef90fc0cd091cab353829d10fd', '', 'Companion of the Order of Australia'),
('eeaeac688942edfe813caf6a197d19d6', '', 'Star of Courage'),
('f3d2fd948c5dfede0cfa2a8fd13a4aa2', '', 'Eighth');

-- --------------------------------------------------------

--
-- Table structure for table `lists__names_superfixes`
--

CREATE TABLE `lists__names_superfixes` (
  `id` varchar(32) NOT NULL,
  `short` varchar(10) NOT NULL,
  `long` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lists__names_superfixes`
--

INSERT INTO `lists__names_superfixes` (`id`, `short`, `long`) VALUES
('07b8184bbaf5e847df1da396107ffadf', 'Rev', 'Reverend'),
('088b51ec33f07d300941a9fdca199db0', 'Ms', 'Mission'),
('4257a9b86714b79597fba26e175c339f', 'Fr', 'Father'),
('59a210c2f3cfbc2a4a1291b8deffa6f3', 'Dr', 'Doctor'),
('6d62f18d97c1afd2b6f59ca567bccc3a', 'Prof', 'Professor'),
('7dd1977c27cdb67a562e486d33ee9a7d', 'Dis', 'Dishonorable'),
('849e726bd0fadfc388c039302764ad22', 'Capt', 'Captain'),
('89950b2aef49cacf62e303dd63e59b09', 'Mrs', 'Misses'),
('8d4b5ab28ce41f71d8964066741eef7d', 'Hbo', 'Hobo'),
('973f85cf9cc4bef33d76990710dc28ff', 'Hon', 'Honorable'),
('99eabfc288b49be9e49e5a4515856529', 'Sir', 'Sir'),
('aaa13b3bb07de64b9dd8ae28485e4800', 'Mr', 'Mister'),
('b8110a8bdcb1ff7c169b5b61ebef5f40', 'Miss', 'Miss'),
('bf85418285fe3b6c7ba1780671d88e4b', 'Mx', 'Anonymous'),
('c44c77cda45f82b03af0f920cea20bc1', 'Cel', 'Celebrity'),
('e9f62acb91fae3efe5438346d7ef0a9a', 'Lady', 'Lady'),
('f0caa000a27e941612b5086a06c6c4d1', 'Mstr', 'Master'),
('fe8797d4c44631bde1ca6920bdc79008', 'Est', 'Esteemed');

-- --------------------------------------------------------

--
-- Table structure for table `lists__phonenumbers`
--

CREATE TABLE `lists__phonenumbers` (
  `id` int(128) UNSIGNED NOT NULL,
  `country` varchar(8) NOT NULL DEFAULT '',
  `area` varchar(10) NOT NULL DEFAULT '',
  `number` varchar(15) NOT NULL DEFAULT '',
  `extension` varchar(10) NOT NULL DEFAULT '',
  `created` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__services`
--

CREATE TABLE `lists__services` (
  `id` mediumint(250) UNSIGNED NOT NULL,
  `key` varchar(128) NOT NULL DEFAULT '',
  `key-host` varchar(128) NOT NULL DEFAULT '',
  `key-isp` varchar(128) NOT NULL DEFAULT '',
  `key-carrier` varchar(128) NOT NULL DEFAULT '',
  `key-registrar` varchar(128) NOT NULL DEFAULT '',
  `modal` enum('new','updated','monitoring','historical','delete','other') DEFAULT 'new',
  `icon` longblob,
  `icon-mimetype` varchar(64) NOT NULL DEFAULT 'image/png',
  `logo` longblob,
  `logo-mimetype` varchar(64) NOT NULL DEFAULT 'image/png',
  `banner` longblob,
  `banner-mimetype` varchar(64) NOT NULL DEFAULT 'image/png',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `deleted` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `historical` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `monitored` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ported` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lists__urls`
--

CREATE TABLE `lists__urls` (
  `id` int(64) UNSIGNED NOT NULL,
  `url` varchar(500) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `icon-url` varchar(250) NOT NULL DEFAULT '',
  `icon-mimetype` varchar(45) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keywords` tinytext,
  `twitter-image` varchar(250) NOT NULL DEFAULT '',
  `twitter-title` varchar(128) NOT NULL DEFAULT '',
  `twitter-description` varchar(250) NOT NULL DEFAULT '',
  `twitter-site` varchar(128) NOT NULL DEFAULT '',
  `image` varchar(128) NOT NULL DEFAULT '',
  `site-name` varchar(128) NOT NULL DEFAULT '',
  `site-title` varchar(128) NOT NULL DEFAULT '',
  `site-description` varchar(250) NOT NULL DEFAULT '',
  `site-url` varchar(128) NOT NULL DEFAULT '',
  `rating` varchar(128) NOT NULL DEFAULT '',
  `author` varchar(128) NOT NULL DEFAULT '',
  `copyright` varchar(128) NOT NULL DEFAULT '',
  `generator` varchar(128) NOT NULL DEFAULT '',
  `content-type` varchar(128) NOT NULL DEFAULT '',
  `created` int(12) UNSIGNED ZEROFILL NOT NULL DEFAULT '000000000000',
  `updated` int(12) UNSIGNED ZEROFILL NOT NULL DEFAULT '000000000000',
  `polling` int(12) UNSIGNED ZEROFILL NOT NULL DEFAULT '000000000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lists__addresses`
--
ALTER TABLE `lists__addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEARCH` (`id`,`types`,`unit`,`suburb`,`building`,`state`,`postcode`,`street`,`longitude`,`latitude`) KEY_BLOCK_SIZE=16 USING BTREE;

--
-- Indexes for table `lists__claimableservices`
--
ALTER TABLE `lists__claimableservices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lists__companies`
--
ALTER TABLE `lists__companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEARCH` (`name`,`tla`);

--
-- Indexes for table `lists__data`
--
ALTER TABLE `lists__data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lists__departments`
--
ALTER TABLE `lists__departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEARCH` (`unixname`,`title`);

--
-- Indexes for table `lists__emails`
--
ALTER TABLE `lists__emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEARCH` (`email`,`nameid`,`emails`,`created`,`verified`,`emailed`,`ndned`);

--
-- Indexes for table `lists__fields`
--
ALTER TABLE `lists__fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lists__hours`
--
ALTER TABLE `lists__hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lists__keywords`
--
ALTER TABLE `lists__keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lists__lists`
--
ALTER TABLE `lists__lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search` (`id`,`primary`,`modal`,`hostname`);

--
-- Indexes for table `lists__names`
--
ALTER TABLE `lists__names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEARCH` (`superfix-id`,`prefix-id`,`suffix-id`,`first`,`second`,`last`,`third`);

--
-- Indexes for table `lists__names_prefixes`
--
ALTER TABLE `lists__names_prefixes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEARCH` (`id`,`short`,`long`);

--
-- Indexes for table `lists__names_suffixes`
--
ALTER TABLE `lists__names_suffixes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEARCH` (`id`,`short`,`long`);

--
-- Indexes for table `lists__names_superfixes`
--
ALTER TABLE `lists__names_superfixes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEARCH` (`id`,`short`,`long`);

--
-- Indexes for table `lists__phonenumbers`
--
ALTER TABLE `lists__phonenumbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SEARCH` (`country`,`area`,`number`,`extension`);

--
-- Indexes for table `lists__services`
--
ALTER TABLE `lists__services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search` (`id`,`key-isp`,`modal`,`created`,`key`,`key-host`,`key-carrier`,`key-registrar`,`deleted`,`historical`,`monitored`,`updated`);

--
-- Indexes for table `lists__urls`
--
ALTER TABLE `lists__urls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lists__claimableservices`
--
ALTER TABLE `lists__claimableservices`
  MODIFY `id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=645;
--
-- AUTO_INCREMENT for table `lists__companies`
--
ALTER TABLE `lists__companies`
  MODIFY `id` int(64) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lists__data`
--
ALTER TABLE `lists__data`
  MODIFY `id` int(250) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lists__departments`
--
ALTER TABLE `lists__departments`
  MODIFY `id` int(24) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `lists__emails`
--
ALTER TABLE `lists__emails`
  MODIFY `id` int(128) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lists__fields`
--
ALTER TABLE `lists__fields`
  MODIFY `id` int(24) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `lists__hours`
--
ALTER TABLE `lists__hours`
  MODIFY `id` int(24) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lists__lists`
--
ALTER TABLE `lists__lists`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lists__names`
--
ALTER TABLE `lists__names`
  MODIFY `id` int(128) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lists__phonenumbers`
--
ALTER TABLE `lists__phonenumbers`
  MODIFY `id` int(128) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lists__services`
--
ALTER TABLE `lists__services`
  MODIFY `id` mediumint(250) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lists__urls`
--
ALTER TABLE `lists__urls`
  MODIFY `id` int(64) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
