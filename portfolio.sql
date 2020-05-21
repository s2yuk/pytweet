-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 27, 2020 at 04:18 AM
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
('2c0a608247bd');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `uname`, `password`) VALUES
(1, 'yuka', 'yuka'),
(2, 'test', 'test'),
(3, 'test2', 'test2'),
(4, 'admin', 'admin');

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
(2, 'theory.jpg', 'yuka\'s bio', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `good` varchar(30) DEFAULT NULL,
  `like` varchar(30) DEFAULT NULL,
  `tweet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(13, 'want to ny ', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `id` int(11) NOT NULL,
  `word` varchar(300) NOT NULL,
  `photo` varchar(900) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`id`, `word`, `photo`, `user_id`) VALUES
(1, 'what\'s up?', '', 1),
(2, 'want to go to Barcelona', '', 1),
(3, 'kyoto', '', 1),
(4, 'hello :)', '', 1),
(5, 'what\'s up?', 'barcelona2.jpeg', 1),
(6, 'hello ', 'hong-kong1.jpg', 1),
(7, 'kyoto', 'kyoto3.jpeg', 1),
(8, 'Tokyo', 'japan-tokyo-asakusa-senso-ji-temple.jpg', 1),
(9, 'what\'s up?', 'ny2.jpeg', 3),
(10, 'new york', 'ny4.jpeg', 1),
(11, 'what\'s up?', 'barcelona2.jpeg', 4);

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
(1, 'yukaaaaa', 'Avidaaaa', '111111111333', 1),
(2, 'test', 'cebu', '0123456789', 2),
(3, 'test2', 'cebu', '2222223', 3),
(4, 'admin', 'admin', '99999', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

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
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tweet_id` (`tweet_id`),
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
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replys`
--
ALTER TABLE `replys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`),
  ADD CONSTRAINT `reactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
