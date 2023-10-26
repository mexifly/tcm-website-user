-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-10-23 05:55:19
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
-- 检查是否存在名为 "test" 的数据库
DROP DATABASE IF EXISTS test;

-- 创建一个新的名为 "test" 的数据库
CREATE DATABASE test;

-- 切换到新创建的数据库
USE test;
-- --------------------------------------------------------

--
-- 表的结构 `test`
--

CREATE TABLE `test` (
  `groupId` int(20) NOT NULL,
  `id` int(20) NOT NULL,
  `textEn` varchar(255) NOT NULL,
  `textCn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `test`
--

INSERT INTO test (GroupId, id, textEn, textCn) VALUES
  (1, 1, 'Do you feel energetic?', '你精力充沛吗?'),
  (1, 2, 'Do you feel tired easily?', '您容易疲乏吗?'),
  (1, 3, 'Comparing to people around you, do you always feel colder and need to wear more clothes to keep warm?', '您比一般人耐受不了寒冷吗?'),
  (1, 4, 'Are you able to adapt to changes in the environment and society?', '您能适应外界自然和社会环境的变化吗?'),
  (1, 5, 'Does your voice sound too soft? For example, you often need to raise your voice for people to hear you.', '您说话声音低弱无力吗?'),
  (1, 6, 'Do you always feel something is bothering you making you unhappy?', '您感到闷闷不乐、情绪低沉吗?'),
  (1, 7, 'Do you have difficulties remembering things?', '您容易忘事（健忘）吗?'),
  (1, 8, 'Do you have difficulties falling asleep at night?', '您容易失眠吗?');

-- Part 2/9
INSERT INTO test (GroupId, id, textEn, textCn) VALUES
  (2, 1, 'Do you feel tired easily?', '您容易疲乏吗?'),
  (2, 2, 'Do you feel shortness of breath easily?', '您容易气短(呼吸短促，接不上气)吗?'),
  (2, 3, 'Does your voice sound too soft?', '您说话声音低弱无力吗?'),
  (2, 4, 'Do you experience fast heartbeat easily?', '您容易心慌吗?'),
  (2, 5, 'Do you prefer quiet and don not like to talk?', '您喜欢安静、懒得说话吗?'),
  (2, 6, 'Do you feel giddiness (or when you stand up) easily?', '您容易头晕或站起时晕眩吗?'),
  (2, 7, 'Comparing to people around you, do you catch a cold easily?', '您比别人容易患感冒吗?'),
  (2, 8, 'Do you find yourself sweat easily when you have a bit more physical activity?', '您活动量稍大就容易出虚汗吗?');

-- Part 3 / 9
INSERT INTO test (groupId, id, textEn, textCn) VALUES
  (3, 1, "Does your palm and feet feel cold/ cool most of the time?", "您手脚发凉吗?"),
  (3, 2, "Does your stomach, back, waist or knee area feel cold?", "您胃脘部、背部或腰膝部怕冷吗？"),
  (3, 3, "Do you feel cold and often wear more clothes than most people?", "您感到怕冷、衣服比别人穿的多吗?"),
  (3, 4, "Comparing to people around you, do you always feel colder and need to wear more clothes to keep warm?", "您比一般人耐受不了寒冷吗？"),
  (3, 5, "Comparing to people around you, do you catch a flu easily?", "您比别人容易患感冒吗?"),
  (3, 6, "Do you feel uncomfortable after taking cold drinks? Or are you afraid of taking cold food / drinks?", "您吃(喝)凉的东西会感到不舒服或者怕吃(喝)凉的东西吗?"),
  (3, 7, "Do you have diarrhea when you eat cold stuff or caught a cold?", "您受凉或吃(喝)凉的东西后，容易拉肚子吗?");

-- Part 4 / 9
INSERT INTO test (groupId, id, textEn, textCn) VALUES
  (4, 1, "Do you feel your palm and feet hot?", "您感到手脚心发热吗?"),
  (4, 2, "Does your body or face feel hot?", "您感觉身体、脸上发热吗?"),
  (4, 3, "Does both sides of your face show redness?", "您面部两颧潮红或偏红吗?"),
  (4, 4, "Does your lips look redder than most people?", "您口唇的颜色比一般人红吗?"),
  (4, 5, "Do you have dry lips / skin?", "您皮肤或口唇干吗?"),
  (4, 6, "Do you have constipation easily or your stools are hard and dry?", "您容易便秘或大便干燥吗?"),
  (4, 7, "Do you feel dryness in your eyes?", "您感到眼睛干涩吗?"),
  (4, 8, "Do you feel thirsty and always want to drink water?", "您感到口干咽燥、总想喝水吗?");

-- Part 5 / 9
INSERT INTO test (groupId, id, textEn, textCn) VALUES
  (5, 1, "Is your forehead oily?", "您有额部油脂分泌多的现象吗?"),
  (5, 2, "Do you feel fullness in your chest and stomach?", "您感到胸闷或腹部胀满吗?"),
  (5, 3, "Is your belly area fat and soft?", "您腹部肥满松软吗?"),
  (5, 4, "Do you feel heaviness in your body?", "您感到身体沉重不轻松或不爽快吗?"),
  (5, 5, "Do you find your upper eye lid more swollen compared to most people?", "您上眼睑比别人肿吗?"),
  (5, 6, "Do you feel stickiness inside your mouth?", "您舌苔厚腻或有舌苔厚厚的感觉吗?"),
  (5, 7, "Do you feel your tongue coating thick?", "您感到眼睛干涩吗?"),
  (5, 8, "Do you normally have phlegm? Especially in your throat area?", "您平时痰多，特别是咽喉部总感到有痰堵着吗?");

-- Part 6 / 9
INSERT INTO test (groupId, id, textEn, textCn) VALUES
  (6, 1, "Do you have oily skin on your face and nose area?", "您面部或鼻部有油腻感或者油亮发光吗?"),
  (6, 2, "Do you have pimples / breakout easily?", "您易生痤疮或者疮疖吗?"),
  (6, 3, "Do you feel bitterness or a strange taste in your mouth?", "您感到口苦或嘴里有异味吗?"),
  (6, 4, "Do you have sticky stools or always feel you don't have a complete defecate?", "您大便黏滞不爽、有解不尽的感觉吗?"),
  (6, 5, "Do you feel your urethra has a hot sensation when you urine? Or your urine is dark in color?", "您小便时尿道有发热感、尿色浓(深)吗?"),
  (6, 6, "Does your discharge yellow or brown in color?(The female answer) / Does your private part area feel damp?(The male answer)", "您带下色黄(白带颜色发黄)吗? （女性回答）/ 您的阴囊部位潮湿吗? （男性回答）");

-- Part 7 / 9
INSERT INTO test (groupId, id, textEn, textCn) VALUES
  (7, 1, "Do you find your skin with purple spots out of sudden?", "您的皮肤常在不知不觉中出现青紫瘀斑(皮下出血)吗?"),
  (7, 2, "Do you have visible thin blood vessels on both sides of your cheekbone?", "您两颧部有细微红丝吗?"),
  (7, 3, "Do you feel pain on any part of your body?", "您身体上有哪里疼痛吗？"),
  (7, 4, "Do you find your face darker in tone or having dark brown spots on your face?", "您面色晦暗，或容易出现褐斑吗?"),
  (7, 5, "Do you have dark circles under your eye easily?", "您容易有黑眼圈吗?"),
  (7, 6, "Do you find your lips color dark?", "您口唇颜色偏黯吗?"),
  (7, 7, "Do you have difficulties remembering things?", "您容易忘事（健忘）吗?");

-- Part 8 / 9
INSERT INTO test (groupId, id, textEn, textCn) VALUES
  (8, 1, "Do you always feel something is bothering you making you unhappy?", "您感到闷闷不乐、情绪低沉吗?"),
  (8, 2, "Do you find yourself easily anxious?", "您容易精神紧张、焦虑不安吗?"),
  (8, 3, "Do you find yourself easily emotional?", "您多愁善感、感情脆弱吗？"),
  (8, 4, "Do you find yourself easily scared or frightened?", "您容易感到害怕或受到惊吓吗?"),
  (8, 5, "Do you feel fullness and pain around your chest area?", "您胁肋部胀痛吗?"),
  (8, 6, "Do you find yourself sigh out of sudden?", "您无缘无故叹气吗?"),
  (8, 7, "Do you have a feeling something stuck in your throat that you can't spit out or swallow?", "您咽喉部有异物感，且吐之不出、咽之不下吗?");

-- Part 9 / 9
INSERT INTO test (groupId, id, textEn, textCn) VALUES
  (9, 1, "Do you easily allergic (drugs, food, smell, pollen, temperature change)?", "您容易过敏(对药物、食物、气味、花粉或在季节交替、气候变化时)吗?"),
  (9, 2, "Do you sneeze often even when you are not having flu?", "您没有感冒时也会打喷嚏吗？"),
  (9, 3, "Do you have stuffy, running nose even when you are not having flu?", "您没有感冒时也会鼻塞、流鼻涕吗?"),
  (9, 4, "Do you have coughing or asthma especially during temperature or surrounding smell changes?", "您有因季节变化、温度变化或异味等原因而咳喘的现象吗？"),
  (9, 5, "Does your skin have itchy spots easily?", "您的皮肤容易起荨麻疹(风团、风疹块、风疙瘩)吗?"),
  (9, 6, "When you scratch your skin, does it appear red and scratch marks easily?", "您的皮肤一抓就红，并出现抓痕吗?"),
  (9, 7, "Do you find purple spots on your skin due to allergic reasons?", "您的皮肤因过敏出现过紫癜(紫红色瘀点、瘀斑)吗?");


--
-- 转储表的索引
--

--
-- 表的索引 `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (GroupId, id);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
