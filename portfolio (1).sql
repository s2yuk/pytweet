-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 21, 2020 at 06:36 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('94cf85b0d9b8');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `source_user_id` int(11) NOT NULL,
  `target_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `source_user_id`, `target_user_id`) VALUES
(11, 2, 1),
(12, 1, 3),
(15, 1, 4),
(19, 2, 3),
(20, 8, 1),
(22, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `good`
--

CREATE TABLE `good` (
  `id` int(11) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `tweet_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `good`
--

INSERT INTO `good` (`id`, `color`, `tweet_id`, `user_id`) VALUES
(1, 'danger', 37, 1),
(2, 'danger', 19, 1),
(9, 'active', 51, 1),
(10, 'active', 50, 1),
(11, 'active', 39, 1),
(12, 'active', 47, 1),
(14, 'active', 53, 1),
(15, 'active', 55, 1),
(16, 'active', 56, 1),
(18, 'active', 57, 1),
(22, 'active', 58, 2),
(24, 'active', 56, 2),
(25, 'active', 53, 2),
(29, 'active', 58, 1),
(31, 'active', 55, 2),
(32, 'active', 39, 2),
(33, 'active', 62, 2),
(34, 'active', 61, 8),
(35, 'active', 53, 8),
(36, 'active', 74, 6),
(37, 'active', 53, 6);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `login_name`, `password`) VALUES
(1, 'yuka', 'yuka'),
(2, 'test', 'test'),
(3, 'test2', 'test2'),
(4, 'admin', 'admin'),
(5, 'tenga', '1125'),
(6, 'user', 'user'),
(7, 'kuma', 'kuma'),
(8, 'testuser', 'testuser');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `avatar` varchar(900) DEFAULT 'blank-profile-picture.png',
  `bio` varchar(500) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `avatar`, `bio`, `user_id`) VALUES
(1, 'blank-profile-picture.png', 'bio test', 2),
(2, 'theory.jpg', 'Nice to meet you ', 1),
(4, 'shirt2.jpg', 'test', 4),
(5, 'new-york-city-statue-of-liberty.jpg', 'Hello world!', 3),
(6, 'level4.gif', 'test bio', 8),
(7, 'kyoto3.jpeg', 'test bio', 6);

-- --------------------------------------------------------

--
-- Table structure for table `replys`
--

CREATE TABLE `replys` (
  `id` int(11) NOT NULL,
  `comment` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `replys`
--

INSERT INTO `replys` (`id`, `comment`, `user_id`, `tweet_id`) VALUES
(1, 'test', 1, 2),
(2, 'test', 1, 2),
(3, 'me too', 1, 2),
(4, 'hongkong reply', 1, 6),
(5, 'kyoto reply2', 1, 7),
(6, 'kyoto reply2', 1, 7),
(7, 'Bonjour', 1, 4),
(8, 'new york', 3, 9),
(9, 'USA', 3, 9),
(10, 'USA', 3, 9),
(11, 'USA', 3, 9),
(12, '----', 3, 9),
(13, 'want to ny ', 1, 10),
(15, 'reply test', 2, 14),
(16, 'test me', 2, 14),
(17, '----', 2, 14),
(18, 'sample', 2, 14),
(19, 'test', 1, 15),
(20, 'sample', 1, 15),
(21, 'tokyo', 1, 12),
(22, 'test 1111', 1, 15),
(23, 'reply test', 1, 16),
(24, 'test  test', 1, 16),
(25, 'aaaaaa', 1, 16),
(26, 'bbbbbbbbbb', 1, 16),
(27, 'nice view!', 1, 17),
(28, 'good!', 1, 37),
(29, 'hello !', 3, 38),
(30, 'hello !', 1, 35),
(31, 'tttest', 1, 37),
(34, 'hello yukaaa', 2, 39),
(35, 'reply test', 3, 47),
(36, 'this is test2 ', 3, 39),
(37, 'yukaaa comment', 1, 53),
(38, 'test2 comment', 3, 53),
(40, 'bonjour', 2, 61),
(48, 'nice coat!', 2, 51),
(49, 'test', 2, 39),
(56, 'nice pic!', 8, 15),
(57, 'reply test', 6, 74),
(58, 'bonjour', 6, 61);

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `id` int(11) NOT NULL,
  `word` varchar(300) DEFAULT NULL,
  `photo` varchar(900) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `good_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`id`, `word`, `photo`, `user_id`, `good_count`) VALUES
(2, 'want to go to Barcelona', '', 1, NULL),
(3, 'kyoto', '', 1, NULL),
(4, 'hello :)', '', 1, NULL),
(6, 'hello ', 'hong-kong1.jpg', 1, NULL),
(7, 'kyoto', 'kyoto3.jpeg', 1, NULL),
(8, 'Tokyo', 'japan-tokyo-asakusa-senso-ji-temple.jpg', 1, NULL),
(9, 'what\'s up?', 'ny2.jpeg', 3, NULL),
(10, 'new york', 'ny4.jpeg', 1, NULL),
(11, 'what\'s up?', 'barcelona2.jpeg', 4, NULL),
(12, 'what\'s up dude?', 'japan-tokyo-imperial-palace.jpg', 1, NULL),
(13, 'hello tenga !', 'blank-profile-picture.png', 5, NULL),
(14, 'hello :)', 'japan-tokyo-asakusa-senso-ji-temple.jpg', 2, NULL),
(15, 'test', 'kyoto1.jpg', 1, NULL),
(16, 'what\'s up?', 'barcelona2.jpeg', 1, NULL),
(17, 'what\'s up?', 'taipei4.jpg', 1, NULL),
(19, 'hello world', NULL, 1, NULL),
(35, 'hello :)', NULL, 1, NULL),
(36, 'with photo update', 'boot.jpg', 1, NULL),
(37, 'update test', 'boot2.jpg', 1, NULL),
(38, 'hello world', NULL, 3, NULL),
(39, 'hello', NULL, 1, NULL),
(47, 'test tweet', NULL, 2, 0),
(50, 'test 2 post ', NULL, 3, 0),
(51, 'test2 post with photo', 'trench.jpg', 3, 0),
(53, 'with photo', 'trouser.jpeg', 1, 1),
(55, 'good test', NULL, 1, 0),
(56, 'ttt', NULL, 1, 0),
(57, '5555', NULL, 1, 0),
(58, 'www', NULL, 1, 0),
(61, 'hello', NULL, 1, 0),
(62, 'Hello ! I\'m test.', NULL, 2, 0),
(71, 'hello :)', 'roma3.jpeg', 8, 0),
(72, '', 'new-york-city-statue-of-liberty.jpg', 8, 0),
(74, 'hello :)', 'tokyo1.jpeg', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` varchar(20) NOT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `number`, `login_id`) VALUES
(1, 'yukaaa', 'AvidaTower', '1111122222', 1),
(2, 'test', 'cebu city', '0123456789', 2),
(3, 'test2', 'cebu', '2222223', 3),
(4, 'admin', 'admin', '99999', 4),
(5, 'ten', 'toyama', '1234', 5),
(6, 'user', 'Avida tower', '0101010101010', 6),
(7, 'kuma', 'japan', '0000111', 7),
(8, 'testuser', 'address', '020202020', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_user_id` (`target_user_id`),
  ADD KEY `source_user_id` (`source_user_id`);

--
-- Indexes for table `good`
--
ALTER TABLE `good`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tweet_id` (`tweet_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `replys`
--
ALTER TABLE `replys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tweet_id` (`tweet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_id` (`login_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `good`
--
ALTER TABLE `good`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `replys`
--
ALTER TABLE `replys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`source_user_id`) REFERENCES `login` (`id`);

--
-- Constraints for table `good`
--
ALTER TABLE `good`
  ADD CONSTRAINT `good_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `good_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `replys`
--
ALTER TABLE `replys`
  ADD CONSTRAINT `replys_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`),
  ADD CONSTRAINT `replys_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
