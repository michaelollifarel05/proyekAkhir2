-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2020 at 04:15 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ta`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_daftarruangan`
--

CREATE TABLE `t_daftarruangan` (
  `ruangan_id` int(11) NOT NULL,
  `ruangan_name` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `ip_device` varchar(50) DEFAULT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kapasitas` int(100) NOT NULL,
  `fasilitas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_daftarruangan`
--

INSERT INTO `t_daftarruangan` (`ruangan_id`, `ruangan_name`, `status`, `ip_device`, `keterangan`, `kapasitas`, `fasilitas`) VALUES
(1, 'Ruangan 513', 'Tertutup', 'adas', 'Laboratorium Jaringan komputer', 32, 'PC, Kursi'),
(2, 'Ruangan 514', 'Tertutup', NULL, 'Lab Jaringan hati', 30, 'PC'),
(3, 'Ruangan 515', 'Tertutup', NULL, 'Laboratorium Jaringan komputer', 30, 'Meja'),
(5, '516', 'Tertutup', NULL, 'Kelas', 90, 'Meja');

-- --------------------------------------------------------

--
-- Table structure for table `t_data`
--

CREATE TABLE `t_data` (
  `data_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `ruangan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT 'Menunggu',
  `status_request` varchar(100) NOT NULL DEFAULT 'Pending',
  `kepentingan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_data`
--

INSERT INTO `t_data` (`data_id`, `start_time`, `end_time`, `ruangan_id`, `user_id`, `status`, `status_request`, `kepentingan`) VALUES
(38, '2020-06-12 22:25:00', '2020-06-12 22:30:00', 2, 14, 'Tertutup', 'Accepted', 'test k 2 sadsssda'),
(40, '2020-06-19 11:30:00', '2020-06-13 23:35:00', 1, 14, 'Menunggu', 'Pending', 'asad testasasas'),
(41, '2020-06-11 10:50:00', '2020-06-05 11:50:00', 1, 14, 'Menunggu', 'Pending', 'asdas');

-- --------------------------------------------------------

--
-- Table structure for table `t_role`
--

CREATE TABLE `t_role` (
  `role_id` int(11) NOT NULL,
  `access_page` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_role`
--

INSERT INTO `t_role` (`role_id`, `access_page`) VALUES
(1, 'admin'),
(3, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `acces_token` varchar(255) NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id`, `username`, `password`, `acces_token`, `auth_key`, `fullname`, `role_id`) VALUES
(1, 'admin', '$2y$13$8QcCmHIMq1.FloZf8yMHzem2CVv8Ik6Cy2z2Ci/.Kv9..LCHHfIAS', '', 'O6Eit0q5oXM_nlDXNAI1FY6lptlV3uJu', 'Admin', 1),
(14, 'michael', '$2y$13$PWeQMLKfUOjYp5AaVtYYGuiQ3AEUFsIXoonmbIyW.0JLLLRv46K6m', '', 'eQvVUARcENJOtBQHg2jCUvNVMje0LImV', 'michael sagala', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_daftarruangan`
--
ALTER TABLE `t_daftarruangan`
  ADD PRIMARY KEY (`ruangan_id`);

--
-- Indexes for table `t_data`
--
ALTER TABLE `t_data`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `ruangna_id` (`ruangan_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `t_role`
--
ALTER TABLE `t_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_daftarruangan`
--
ALTER TABLE `t_daftarruangan`
  MODIFY `ruangan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_data`
--
ALTER TABLE `t_data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `t_role`
--
ALTER TABLE `t_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_data`
--
ALTER TABLE `t_data`
  ADD CONSTRAINT `t_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_data_ibfk_2` FOREIGN KEY (`ruangan_id`) REFERENCES `t_daftarruangan` (`ruangan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_user`
--
ALTER TABLE `t_user`
  ADD CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
