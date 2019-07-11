-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2018 at 06:27 PM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdav-chronedia-com`
--

-- --------------------------------------------------------

--
-- Table structure for table `nedia__configs`
--

CREATE TABLE `nedia__configs` (
  `id` int(32) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `value` tinyblob NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for Storage of the WebDav Configuration Information';

--
-- Dumping data for table `nedia__configs`
--

INSERT INTO `nedia__configs` (`id`, `name`, `value`, `created`) VALUES
(1, 'API_PATH_TESTING', 0x2f6d6e742f74657374696e672f25656d61696c2f256b6579, '2018-12-27 06:57:41'),
(2, 'API_PASSWAGE_KEY', 0x232366696e6b69373769346b42544c49346c697262623b72683b2d27303938352d3d396f693d7030666b6f6a6c706f27756b6568666f3870276f27756f39386a3332594839306927706f696f2770345949304648494f48455744276970276f564c4b4a4448564c4b4a523b7070753b2770276f483938595934563827706f3348666473686868674768676a6938376c3b6c3b4b464c4448534c4b5648474c4b4a473938303433542323, '2018-12-27 06:57:41'),
(3, 'API_MOUNTING_PATH', 0x2f6d6e742f7765626461762f25656d61696c2f256b6579, '2018-12-27 07:00:18'),
(4, 'API_VERIFYING_PATH', 0x2f6d6e742f766572696679696e67, '2018-12-27 07:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `nedia__webdavs`
--

CREATE TABLE `nedia__webdavs` (
  `id` mediumint(32) UNSIGNED NOT NULL,
  `key` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(196) NOT NULL DEFAULT '',
  `logo` blob NOT NULL,
  `logo_mimetype` varchar(64) NOT NULL,
  `webdav_uri` varchar(255) NOT NULL DEFAULT '',
  `webdav_user` varchar(64) NOT NULL DEFAULT '',
  `webdav_pass` tinyblob NOT NULL,
  `webdav_salt` tinyblob NOT NULL,
  `webdav_realms` varchar(128) NOT NULL DEFAULT '',
  `webdav_ipv4` varchar(15) NOT NULL DEFAULT '',
  `webdav_ipv6` varchar(64) NOT NULL DEFAULT '',
  `ping` decimal(20,16) UNSIGNED NOT NULL DEFAULT '0.0000000000000000',
  `mbs_per_sec` decimal(20,12) UNSIGNED NOT NULL DEFAULT '0.000000000000',
  `folders` int(32) UNSIGNED NOT NULL DEFAULT '0',
  `files` int(32) UNSIGNED NOT NULL DEFAULT '0',
  `bytes` bigint(128) UNSIGNED NOT NULL DEFAULT '0',
  `pinged` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `tested` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `mounted` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `verified` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `offline` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `emailed` int(12) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for Storage of WebDAV that have been queued for media';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nedia__configs`
--
ALTER TABLE `nedia__configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nedia__webdavs`
--
ALTER TABLE `nedia__webdavs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nedia__configs`
--
ALTER TABLE `nedia__configs`
  MODIFY `id` int(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `nedia__webdavs`
--
ALTER TABLE `nedia__webdavs`
  MODIFY `id` mediumint(32) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
