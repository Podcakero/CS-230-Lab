-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 25, 2021 at 02:55 PM
-- Server version: 5.7.33-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs230`
--

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `pid` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `picpath` varchar(80) DEFAULT NULL,
  `upload_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`pid`, `title`, `description`, `picpath`, `upload_date`, `rating`) VALUES
(1, 'test', 'jhsggugf                ', '../gallery/604c1a81e49281.22651247.jpg', '2021-03-12 20:50:57', NULL),
(2, 'erhd', '                shhdrhdh', '../gallery/604c1a89463ff3.71288733.jpg', '2021-03-12 20:51:05', NULL),
(3, 'dsgfsd', '                gdshgdh', '../gallery/604c1a8ff3b9e5.08068171.png', '2021-03-12 20:51:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `pid` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `profpic` varchar(50) NOT NULL DEFAULT '../images/default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`pid`, `fname`, `uname`, `profpic`) VALUES
(1, 'Drew', 'podcake', '../images/default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `revid` int(11) NOT NULL COMMENT 'id for each review',
  `itemid` int(11) NOT NULL COMMENT 'id for item being reviewed',
  `uname` varchar(80) NOT NULL COMMENT 'user reviewing item',
  `title` varchar(60) NOT NULL,
  `reviewtext` text NOT NULL,
  `revdate` datetime NOT NULL COMMENT 'date of review',
  `ratingnum` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Is there at least 1 review'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`revid`, `itemid`, `uname`, `title`, `reviewtext`, `revdate`, `ratingnum`, `status`) VALUES
(1, 3, 'podcake', 'Absolute garbage', 'poggers', '2021-03-19 18:04:31', 5, 1),
(2, 3, 'podcake', 'sgsdg', 'sg', '2021-03-19 18:05:44', 5, 1),
(3, 3, 'podcake', 'wef', 'werdsf', '2021-03-19 18:05:47', 5, 1),
(4, 3, 'podcake', 'kjsdhgfkhdg', 'sakldjhgfjksdhg', '2021-03-19 18:05:52', 5, 1),
(5, 3, 'podcake', 'skldjghkjsd', 'sadklgjgh', '2021-03-19 18:05:57', 5, 1),
(6, 3, 'podcake', 'ag', 'fgkjufdswe', '2021-03-19 19:09:38', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='user database for signup and signin';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `fname`, `lname`, `uname`, `password`, `email`) VALUES
(1, 'Drew', 'Weimer', 'podcake', '$2y$10$8a18q0B2XksptwjeuOY0qeggdlMJoPDIB.WxrirYpvc61N7Pt92.W', 'rockingcreeper34@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`revid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `revid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id for each review', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
