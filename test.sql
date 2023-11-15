-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-11-15 06:23:13
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
-- 表的结构 `answermap`
--

CREATE TABLE `answermap` (
  `meaning` varchar(255) NOT NULL,
  `scale` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `answermap`
--

INSERT INTO `answermap` (`meaning`, `scale`) VALUES
('No', 1),
('Seldom', 2),
('Sometimes', 3),
('Often', 4),
('Always', 5);

-- --------------------------------------------------------

--
-- 表的结构 `constitution_results`
--

CREATE TABLE `constitution_results` (
  `consId` int(11) NOT NULL,
  `consType` text DEFAULT NULL,
  `definition` varchar(255) DEFAULT NULL,
  `disturbance` varchar(255) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  `vigilant` varchar(255) DEFAULT NULL,
  `improvement` varchar(255) DEFAULT NULL,
  `recommendRecipe` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `constitution_results`
--

INSERT INTO `constitution_results` (`consId`, `consType`, `definition`, `disturbance`, `cause`, `vigilant`, `improvement`, `recommendRecipe`) VALUES
(1, 'Neutral Constitution', 'AAA', 'AAA', 'AAA', 'AAA', 'AAA', ' The following is a sample recipe for a Neutral Constitution patient under the current season in TCM:\n\nIngredients:\n\n-	 Huang Qi (Astragalus membranaceus): 3 grams\n-	 Gan Cao (Glycyrrhiza uralensis): 3 grams\n-	 Bai Shao (White Peony): 3 grams\n-	 Mu Li (Mu'),
(2, 'Qi Deficient Constitution', 'b', 'b', 'b', 'b', 'b', ' Ingredients:\n\n- Adzuki beans (1 cup)\n- Goji berries (1 cup)\n- Dates (8-10 pieces)\n- Water (2-3 cups)\n\nInstructions:\n\n1. Soak the adzuki beans, goji berries, and dates in water for at least 30 minutes.\n2. Drain the water and rinse the ingredients thoroughly.\n3. Add the ingredients to a pot and fill it with water. The water should cover the ingredients by about 2 inches.\n4. Bring the mixture to a boil, then reduce the heat and let it simmer for about 1 hour.\n5. Serve the soup hot, garnished with a few goji berries and dates.\n\nAdditional ingredients that can be added to enhance the flavor and nutritional content of the soup include:\n\n- Ginger (1 inch piece) - for its warming and digestive properties\n- Shiitake mushrooms (5-6 pieces) - for their immune-boosting and antioxidant properties\n- Tamari (1 tablespoon) - for added flavor and nourishment\n\nNote: Adzuki beans, goji berries, and dates are all considered to be warming foods in Traditional Chinese Medicine (TCM). If you have a Qi Deficient constitution, it is best to avoid cold and raw foods. Instead, focus on warming and cooked foods that are easy to digest. With any constitutional imbalance it is best to consult with a licensed acupuncturist or doctor of TCM before pursuing self-treatment. '),
(3, 'Yang Deficient Constitution', 'c', 'c', 'c', 'c', 'c', NULL),
(4, 'Yin Deficient Constitution', 'd', 'd', 'd', 'd', 'd', NULL),
(5, 'Phlegm-Dampness Constitution', 'e', 'e', 'e', 'e', 'e', NULL),
(6, 'Damp-Heat Constitution', 'f', 'f', 'f', 'f', 'f', NULL),
(7, 'Blood Stasis Constitution', 'g', 'g', 'g', 'g', 'g', NULL),
(8, 'Qi-Stagnation Constitution', 'h', 'h', 'h', 'h', 'h', NULL),
(9, 'Intrinsic Constitution', 'i', 'i', 'i', 'i', 'i', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `questions`
--

CREATE TABLE `questions` (
  `qid` int(20) NOT NULL,
  `groupId` int(20) NOT NULL,
  `id` int(20) NOT NULL,
  `textEn` varchar(255) NOT NULL,
  `textCn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `questions`
--

INSERT INTO `questions` (`qid`, `groupId`, `id`, `textEn`, `textCn`) VALUES
(1, 1, 1, 'Do you feel energetic?', '你精力充沛吗?'),
(2, 1, 2, 'Do you feel tired easily?', '您容易疲乏吗?'),
(3, 1, 3, 'Comparing to people around you, do you always feel colder and need to wear more clothes to keep warm?', '您比一般人耐受不了寒冷吗?'),
(14, 2, 6, 'Do you feel giddiness (or when you stand up) easily?', '您容易头晕或站起时晕眩吗?'),
(15, 2, 7, 'Comparing to people around you, do you catch a cold easily?', '您比别人容易患感冒吗?'),
(16, 2, 8, 'Do you find yourself sweat easily when you have a bit more physical activity?', '您活动量稍大就容易出虚汗吗?'),
(21, 3, 5, 'Comparing to people around you, do you catch a flu easily?', '您比别人容易患感冒吗?'),
(22, 3, 6, 'Do you feel uncomfortable after taking cold drinks? Or are you afraid of taking cold food / drinks?', '您吃(喝)凉的东西会感到不舒服或者怕吃(喝)凉的东西吗?'),
(23, 3, 7, 'Do you have diarrhea when you eat cold stuff or caught a cold?', '您受凉或吃(喝)凉的东西后，容易拉肚子吗?'),
(28, 4, 5, 'Do you have dry lips / skin?', '您皮肤或口唇干吗?'),
(29, 4, 6, 'Do you have constipation easily or your stools are hard and dry?', '您容易便秘或大便干燥吗?'),
(30, 4, 7, 'Do you feel dryness in your eyes?', '您感到眼睛干涩吗?'),
(31, 4, 8, 'Do you feel thirsty and always want to drink water?', '您感到口干咽燥、总想喝水吗?'),
(37, 5, 6, 'Do you feel stickiness inside your mouth?', '您舌苔厚腻或有舌苔厚厚的感觉吗?'),
(38, 5, 7, 'Do you feel your tongue coating thick?', '您感到眼睛干涩吗?'),
(39, 5, 8, 'Do you normally have phlegm? Especially in your throat area?', '您平时痰多，特别是咽喉部总感到有痰堵着吗?'),
(44, 6, 5, 'Do you feel your urethra has a hot sensation when you urine? Or your urine is dark in color?', '您小便时尿道有发热感、尿色浓(深)吗?'),
(45, 6, 6, 'Does your discharge yellow or brown in color?(The female answer) / Does your private part area feel damp?(The male answer)', '您带下色黄(白带颜色发黄)吗? （女性回答）/ 您的阴囊部位潮湿吗? （男性回答）'),
(51, 7, 6, 'Do you find your lips color dark?', '您口唇颜色偏黯吗?'),
(52, 7, 7, 'Do you have difficulties remembering things?', '您容易忘事（健忘）吗?'),
(57, 8, 5, 'Do you feel fullness and pain around your chest area?', '您胁肋部胀痛吗?'),
(58, 8, 6, 'Do you find yourself sigh out of sudden?', '您无缘无故叹气吗?'),
(59, 8, 7, 'Do you have a feeling something stuck in your throat that you can not spit out or swallow?', '您咽喉部有异物感，且吐之不出、咽之不下吗?'),
(63, 9, 4, 'Do you have coughing or asthma especially during temperature or surrounding smell changes?', '您有因季节变化、温度变化或异味等原因而咳喘的现象吗？'),
(64, 9, 5, 'Does your skin have itchy spots easily?', '您的皮肤容易起荨麻疹(风团、风疹块、风疙瘩)吗?'),
(65, 9, 6, 'When you scratch your skin, does it appear red and scratch marks easily?', '您的皮肤一抓就红，并出现抓痕吗?'),
(66, 9, 7, 'Do you find purple spots on your skin due to allergic reasons?', '您的皮肤因过敏出现过紫癜(紫红色瘀点、瘀斑)吗?');

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
-- 表的索引 `constitution_results`
--
ALTER TABLE `constitution_results`
  ADD PRIMARY KEY (`consId`) USING BTREE;

--
-- 表的索引 `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`qid`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- 限制导出的表
--

--
-- 限制表 `responses`
--
ALTER TABLE `responses`
  ADD CONSTRAINT `responses_ibfk_1` FOREIGN KEY (`respondent_id`) REFERENCES `respondents` (`id`),
  ADD CONSTRAINT `responses_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`qid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
