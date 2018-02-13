-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 01, 2017 at 08:09 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `developer_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `internet_plans`
--

CREATE TABLE `internet_plans` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `provider` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internet_plans`
--

INSERT INTO `internet_plans` (`id`, `title`, `description`, `provider`, `price`, `date_joined`) VALUES
(1, 'Monthly Diamond', 'Get 30GB with 10GB extra', 4, 8000, '2016-10-10 00:36:57'),
(2, 'Unlimited Saphire', 'Unlimited DATA service for 30 days. 24 Hours Active', 1, 15000, '2016-10-10 00:36:57'),
(3, 'Unlimited Ruby', 'Unlimited DATA service for 30 days; Active between 6am and 6pm', 1, 9000, '2016-10-10 00:36:57'),
(4, 'Unlimited Basic', 'Unlimited DATA service for 30 days. Available overnight 6pm - 6am', 1, 9000, '2016-10-10 00:36:57'),
(5, 'Glo All Night', '30GB DATA service for 30 days. Available overnight 6pm - 6am', 2, 10000, '2016-10-10 00:36:57'),
(6, '10GB Boost', 'Get 10gb worth of data for only N4,000', 3, 4000, '2016-10-10 00:36:57'),
(7, '3GB Mobile Boost', 'Get 10gb worth of data for only N1,000', 3, 1000, '2016-10-10 00:36:57'),
(8, 'Daytime Data Deal', 'Get 20GB worth of data, usable from 7am - 7pm.', 5, 5000, '2016-10-10 00:36:57'),
(9, 'Nightime Data Deal', 'Get 20GB worth of data, usable from 7pm - 7am.', 5, 5000, '2016-10-10 00:36:57'),
(10, 'Mini Data Boost', 'Get 50mb of data for quick use. available for 7 days.', 3, 500, '2016-10-10 00:36:57');

-- --------------------------------------------------------

--
-- Table structure for table `internet_providers`
--

CREATE TABLE `internet_providers` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_phone` varchar(100) NOT NULL,
  `rc_number` varchar(100) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `balance` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internet_providers`
--

INSERT INTO `internet_providers` (`id`, `name`, `contact_email`, `contact_phone`, `rc_number`, `date_joined`, `balance`) VALUES
(1, 'NTel', 'info@ntel.com.ng', '07009800755', '567898', '2016-10-10 00:14:27', 18000),
(2, 'Globacom', 'contact@glo.ng', '09876545678', '567876', '2016-10-10 00:14:27', 0),
(3, 'Spectranet', 'info@spectranet.com', '809089878909', '56789876', '2016-10-10 00:14:27', 0),
(4, 'IPNX', 'support@ipnx.com.ng', '57898765678987', '678', '2016-10-10 00:14:27', 8000),
(5, 'Swift Networks', 'desk@swift.ng', '09008887777', '1230987', '2016-10-10 00:14:27', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) NOT NULL,
  `signup_id` int(10) NOT NULL,
  `attempts` int(10) NOT NULL,
  `success` int(10) NOT NULL,
  `last_attempt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `signup_id`, `attempts`, `success`, `last_attempt`) VALUES
(7, 1, 1, 1, '2016-10-10 16:23:15'),
(8, 1, 1, 1, '2016-10-11 23:38:11'),
(9, 7, 1, 1, '2016-10-13 14:35:54'),
(10, 28, 1, 1, '2016-10-26 22:45:02'),
(11, 2, 1, 1, '2016-11-28 15:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `signups`
--

CREATE TABLE `signups` (
  `id` int(10) NOT NULL,
  `signup_title` varchar(100) NOT NULL,
  `user_id` int(10) NOT NULL,
  `internet_plan_id` int(10) NOT NULL,
  `date_signed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signups`
--

INSERT INTO `signups` (`id`, `signup_title`, `user_id`, `internet_plan_id`, `date_signed`) VALUES
(1, 'Home Wifi', 1, 3, '2016-10-10 09:59:13'),
(2, 'Home Internet', 2, 5, '2016-10-10 09:59:13'),
(3, 'Wifi At The Office', 2, 2, '2016-10-10 09:59:13'),
(4, 'iPhone Data', 1, 7, '2016-10-10 09:59:13'),
(5, 'Blackberry Data', 1, 6, '2016-10-10 09:59:13'),
(6, 'Office Thingy', 2, 1, '2016-10-11 23:40:21'),
(7, 'chiwete', 1, 1, '2016-10-13 14:35:48'),
(9, 'Night Plan', 4, 5, '2016-10-20 15:15:59'),
(10, 'Night Plan', 4, 5, '2016-10-20 15:22:27'),
(11, 'Night Plan', 4, 5, '2016-10-20 15:24:44'),
(12, 'Night Plan', 4, 5, '2016-10-20 15:25:13'),
(13, 'Night Plan', 4, 5, '2016-10-20 15:25:15'),
(14, 'Night Plan', 4, 5, '2016-10-20 15:26:44'),
(15, 'Night Plan', 4, 5, '2016-10-20 15:27:26'),
(16, 'Night Plan', 4, 5, '2016-10-20 15:27:28'),
(17, 'Night Plan', 4, 5, '2016-10-20 15:27:29'),
(18, 'Night Plan', 4, 5, '2016-10-20 15:27:56'),
(19, 'Night Plan', 4, 5, '2016-10-20 15:27:59'),
(20, 'Night Plan', 4, 5, '2016-10-20 15:28:00'),
(21, 'Night Plan', 4, 5, '2016-10-20 15:28:23'),
(22, 'Night Plan', 4, 5, '2016-10-20 15:28:25'),
(23, 'Night Plan', 4, 5, '2016-10-20 15:28:26'),
(24, 'Night Plan', 4, 5, '2016-10-20 15:29:34'),
(25, 'Night Plan', 4, 5, '2016-10-20 15:33:49'),
(26, 'Night Plan', 4, 5, '2016-10-20 15:34:25'),
(27, 'Night Plan', 4, 5, '2016-10-20 15:34:41'),
(28, 'testing inya', 1, 9, '2016-10-26 22:45:01'),
(29, 'Wateva', 1, 3, '2016-11-28 15:05:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `m_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `bvn` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `balance` int(100) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `m_name`, `l_name`, `bvn`, `email`, `phone`, `balance`, `date_joined`) VALUES
(1, 'Nnamdi', 'Chinedu', 'Okeke', '342343839', 'okekennamdi@gmail.com', '08090009000', 19000, '2016-10-10 10:10:50'),
(2, 'Chiwete', 'Ifesinachi', 'Njokanma', '785439204', 'chi.nj@ymail.com', '854392049534', 45000, '2016-10-10 10:10:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `internet_plans`
--
ALTER TABLE `internet_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internet_providers`
--
ALTER TABLE `internet_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signups`
--
ALTER TABLE `signups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `internet_plans`
--
ALTER TABLE `internet_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `internet_providers`
--
ALTER TABLE `internet_providers`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `signups`
--
ALTER TABLE `signups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
