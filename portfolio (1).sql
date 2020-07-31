-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2020 年 7 月 13 日 05:38
-- サーバのバージョン： 5.7.26
-- PHP のバージョン: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `portfolio`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('94cf85b0d9b8');

-- --------------------------------------------------------

--
-- テーブルの構造 `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `source_user_id` int(11) NOT NULL,
  `target_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `follow`
--

INSERT INTO `follow` (`id`, `source_user_id`, `target_user_id`) VALUES
(12, 1, 3),
(15, 1, 4),
(19, 2, 3),
(20, 8, 1),
(22, 6, 1),
(23, 1, 8),
(24, 1, 2),
(26, 4, 1),
(27, 2, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `good`
--

CREATE TABLE `good` (
  `id` int(11) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `tweet_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `good`
--

INSERT INTO `good` (`id`, `color`, `tweet_id`, `user_id`) VALUES
(1, 'danger', 37, 1),
(2, 'danger', 19, 1),
(9, 'active', 51, 1),
(10, 'active', 50, 1),
(11, 'active', 39, 1),
(12, 'active', 47, 1),
(32, 'active', 39, 2),
(36, 'active', 74, 6),
(38, 'active', 75, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `login`
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
-- テーブルの構造 `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `avatar` varchar(900) DEFAULT 'blank-profile-picture.png',
  `bio` varchar(500) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `profiles`
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
-- テーブルの構造 `replys`
--

CREATE TABLE `replys` (
  `id` int(11) NOT NULL,
  `comment` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `replys`
--

INSERT INTO `replys` (`id`, `comment`, `user_id`, `tweet_id`) VALUES
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
(48, 'nice coat!', 2, 51),
(56, 'nice pic!', 8, 15),
(57, 'reply test', 6, 74),
(59, 'reply test', 1, 75),
(60, 'reply test', 1, 75),
(61, 'Welcome to pytweet!', 4, 39);

-- --------------------------------------------------------

--
-- テーブルの構造 `tweets`
--

CREATE TABLE `tweets` (
  `id` int(11) NOT NULL,
  `word` varchar(300) DEFAULT NULL,
  `photo` varchar(900) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `good_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `tweets`
--

INSERT INTO `tweets` (`id`, `word`, `photo`, `user_id`, `good_count`) VALUES
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
(15, 'Beautiful place !', 'kyoto1.jpg', 1, NULL),
(16, 'what\'s up?', 'barcelona2.jpeg', 1, NULL),
(17, 'what\'s up?', 'taipei4.jpg', 1, NULL),
(19, 'hello world', NULL, 1, NULL),
(35, 'hello :)', NULL, 1, NULL),
(36, 'with photo update', 'boot.jpg', 1, NULL),
(37, 'update test', 'boot2.jpg', 1, NULL),
(38, 'hello world', NULL, 3, NULL),
(39, 'hello :)', NULL, 1, NULL),
(47, 'test tweet', NULL, 2, 0),
(50, 'test 2 post ', NULL, 3, 0),
(51, 'test2 post with photo', 'trench.jpg', 3, 0),
(62, 'Hello ! I\'m test.', NULL, 2, 0),
(71, 'hello :)', 'roma3.jpeg', 8, 0),
(72, '', 'new-york-city-statue-of-liberty.jpg', 8, 0),
(74, 'hello :)', 'tokyo1.jpeg', 6, 0),
(75, 'hello :)', NULL, 1, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` varchar(20) NOT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
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
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- テーブルのインデックス `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_user_id` (`target_user_id`),
  ADD KEY `source_user_id` (`source_user_id`);

--
-- テーブルのインデックス `good`
--
ALTER TABLE `good`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tweet_id` (`tweet_id`);

--
-- テーブルのインデックス `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- テーブルのインデックス `replys`
--
ALTER TABLE `replys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tweet_id` (`tweet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- テーブルのインデックス `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_id` (`login_id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- テーブルのAUTO_INCREMENT `good`
--
ALTER TABLE `good`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- テーブルのAUTO_INCREMENT `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- テーブルのAUTO_INCREMENT `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルのAUTO_INCREMENT `replys`
--
ALTER TABLE `replys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- テーブルのAUTO_INCREMENT `tweets`
--
ALTER TABLE `tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- テーブルのAUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`source_user_id`) REFERENCES `login` (`id`);

--
-- テーブルの制約 `good`
--
ALTER TABLE `good`
  ADD CONSTRAINT `good_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `good_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`);

--
-- テーブルの制約 `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- テーブルの制約 `replys`
--
ALTER TABLE `replys`
  ADD CONSTRAINT `replys_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`),
  ADD CONSTRAINT `replys_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- テーブルの制約 `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- テーブルの制約 `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
