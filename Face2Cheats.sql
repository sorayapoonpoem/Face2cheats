-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2020 at 03:31 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `face2cheats`
--

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `M__id` int(10) NOT NULL,
  `M__Fname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `M__Lname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `M__gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `M__date` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `M__month` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `M__year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `M__email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `M__address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `M__username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `M__password` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`M__id`, `M__Fname`, `M__Lname`, `M__gender`, `M__date`, `M__month`, `M__year`, `M__email`, `M__address`, `M__username`, `M__password`) VALUES
(1, 'Admin', 'Admin', 'หญิง', '10', 'ธันวาคม', '2000', '623130202@gmail.com', 'Chiang Rai', 'Admin', '1234'),
(2, 'ชะรอย', 'จุติมา', 'หญิง', '18', 'มกราคม', '2525', 'charoy@gmail.com', 'Chiang Mai', 'user', '5678'),
(3, 'สมหญิง', 'เรียบร้อย', 'หญิง', '25', 'กรกฎาคม', '2545', 'somying@gmail.com', '333 มหาวิทยาลัยแม่ฟ้าหลวง ต.ท่าสุด อ.เมือง จ.สุพรร', 'somying555', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `P_id` int(10) NOT NULL,
  `P_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`P_id`, `P_name`) VALUES
(1001, 'สลิป'),
(1002, 'ส่งของ');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `R_id` int(10) NOT NULL,
  `M_id` int(10) NOT NULL,
  `R_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `R_Fname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `R_Lname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `R_idcard` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `R_phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `R_tranfer` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `R_account` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `R_product` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `R_price` varchar(7) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`R_id`, `M_id`, `R_type`, `R_Fname`, `R_Lname`, `R_idcard`, `R_phone`, `R_tranfer`, `R_account`, `R_product`, `R_price`) VALUES
(1001, 3, 'ผู้ขายที่ควรระวัง', 'หรูหรา', 'ออมตอง', '1720200563277', '0896554321', 'True Wallet', '0896554321', 'เสื้อ', '450'),
(1002, 2, 'ผู้ขายที่ควรระวัง', 'ชะรอย', 'จุติมา', '1720200563276', '0678895678', 'Prompt Pay', '0678895678', 'กระเป๋า', '600');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`M__id`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`P_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`R_id`),
  ADD KEY `M_id` (`M_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`P_id`) REFERENCES `reports` (`R_id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`M_id`) REFERENCES `member` (`M__id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
