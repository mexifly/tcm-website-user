-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-10-31 21:10:53
-- 服务器版本： 10.4.8-MariaDB
-- PHP 版本： 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `questions`
--

CREATE TABLE `questions` (
  `groupId` int(20) NOT NULL,
  `id` int(20) NOT NULL,
  `textEn` varchar(255) NOT NULL,
  `textCn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `questions`
--

INSERT INTO `questions` (`groupId`, `id`, `textEn`, `textCn`) VALUES
(1, 1, 'Do you feel energetic?', '你精力充沛吗?'),
(2, 2, 'Do you feel shortness of breath easily?', '您容易气短(呼吸短促，接不上气)吗?'),
(3, 3, 'Do you feel cold and often wear more clothes than most people?', '您感到怕冷、衣服比别人穿的多吗?'),
(4, 4, 'Does your lips look redder than most people?', '您口唇的颜色比一般人红吗?'),
(5, 5, 'Do you find your upper eye lid more swollen compared to most people?', '您上眼睑比别人肿吗?'),
(6, 6, 'Do you have pimples / breakout easily?', '您易生痤疮或者疮疖吗?'),
(6, 7, 'Does your discharge yellow or brown in color?(The female answer) / Does your private part area feel damp?(The male answer)', '您带下色黄(白带颜色发黄)吗? （女性回答）/ 您的阴囊部位潮湿吗? （男性回答）'),
(7, 8, 'Do you have difficulties remembering things?', '您容易忘事（健忘）吗?'),
(8, 9, 'Do you have a feeling something stuck in your throat that you can\'t spit out or swallow?', '您咽喉部有异物感，且吐之不出、咽之不下吗?'),
(9, 10, 'When you scratch your skin, does it appear red and scratch marks easily?', '您的皮肤一抓就红，并出现抓痕吗?');

-- --------------------------------------------------------

--
-- 表的结构 `respondents`
--

CREATE TABLE `respondents` (
  `id` int(11) NOT NULL,
  `reference_number` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `constitution` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `responses`
--

CREATE TABLE `responses` (
  `id` int(11) NOT NULL,
  `respondent_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转储表的索引
--

--
-- 表的索引 `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `respondents`
--
ALTER TABLE `respondents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference_number` (`reference_number`);

--
-- 表的索引 `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `respondent_id` (`respondent_id`),
  ADD KEY `question_id` (`question_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `respondents`
--
ALTER TABLE `respondents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- 限制导出的表
--

--
-- 限制表 `responses`
--
ALTER TABLE `responses`
  ADD CONSTRAINT `responses_ibfk_1` FOREIGN KEY (`respondent_id`) REFERENCES `respondents` (`id`),
  ADD CONSTRAINT `responses_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
