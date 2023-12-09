/*
Navicat MySQL Data Transfer

Source Server         : TCM
Source Server Version : 80100
Source Host           : localhost:3306
Source Database       : admin

Target Server Type    : MYSQL
Target Server Version : 80100
File Encoding         : 65001

Date: 2023-12-06 18:38:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `adminId` int unsigned NOT NULL AUTO_INCREMENT,
  `adminFirstName` varchar(255) DEFAULT NULL,
  `adminLastName` varchar(255) DEFAULT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminPassword` varchar(255) NOT NULL,
  `adminAddress` varchar(255) DEFAULT NULL,
  `adminPhoneNumber` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES ('1', 'Johnson', 'Smith', 'JohnsonSmith@fdu.com', '$argon2id$v=19$m=65536,t=3,p=4$xuo0bLPJ7K0Rj15spgxSnw$InHaSno3otmV4jT+3Czq5IsVU8Hu7/rvftsi6YcXUPY', 'Cambie Street+s', '0002', '/photo-1701895830896.jpeg');
INSERT INTO `admininfo` VALUES ('3', 'Enze', 'Ma', '1150873798ma@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$RtCVXRune6VzIKL3t9JVvg$PWLIiZ9zBLUBbmZxoGJ94eiNJJhaWHQLqgx3/y//+DM', '8551 General Currie Road', '12369893662', '/adminPhoto-1700038492670.jpg');

-- ----------------------------
-- Table structure for answermap
-- ----------------------------
DROP TABLE IF EXISTS `answermap`;
CREATE TABLE `answermap` (
  `meaning` varchar(255) NOT NULL,
  `scale` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of answermap
-- ----------------------------
INSERT INTO `answermap` VALUES ('No', '1');
INSERT INTO `answermap` VALUES ('Seldom', '2');
INSERT INTO `answermap` VALUES ('Sometimes', '3');
INSERT INTO `answermap` VALUES ('Often', '4');
INSERT INTO `answermap` VALUES ('Always', '5');

-- ----------------------------
-- Table structure for constitution_results
-- ----------------------------
DROP TABLE IF EXISTS `constitution_results`;
CREATE TABLE `constitution_results` (
  `consId` int NOT NULL,
  `consType` varchar(255) DEFAULT NULL,
  `definition` varchar(255) DEFAULT NULL,
  `disturbance` varchar(255) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  `vigilant` varchar(255) DEFAULT NULL,
  `improvement` varchar(255) DEFAULT NULL,
  `recommendRecipe` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of constitution_results
-- ----------------------------
INSERT INTO `constitution_results` VALUES ('1', 'Neutral Constitution', 'Balanced state with good Yin-Yang equilibrium, normal bodily functions, and strong resistance to diseases', 'Rarely experiences bodily disturbances or illnesses\r\nRarely experiences bodily disturbances or illnesses\r\nRarely experiences bodily disturbances or illnesses', 'Good lifestyle habits, balanced diet, stable mental state', 'Important to maintain good lifestyle habits and dietary patterns to retain neutrality', 'Maintain healthy lifestyle, regular exercise, balanced diet, stable mental state', null);
INSERT INTO `constitution_results` VALUES ('2', 'Qi Deficient Constitution', 'Characterized by insufficient Qi and blood, often feeling fatigued, weak, and experiencing shortness of breath', 'Frequent fatigue, lack of energy', 'Irregular lifestyle, unbalanced diet, prolonged emotional suppression, or excessive exhaustion', 'Focus on maintaining a balanced diet, regular sleep, and avoiding excessive exhaustion', 'Adjust diet, increase nutrition, ensure adequate sleep, appropriate conditioning, and exercise', ' Here is a recipe for a Qi Deficient Constitution patient under the current season in TCM:\n\nIngredients:\n\n* 1 cup cooked adzuki beans (might need to be cooked)\n* 1/2 cup cooked barley\n* 1/4 cup dried mulberries\n* 1/4 cup pistachios\n* 1/4 cup pumpkin seeds\n* 1/4 cup cooked shredded chicken (optional)\n* 1/4 cup chopped mint\n* 1/4 cup chopped parsley\n* 1/2 teaspoon cinnamon\n* 1/4 teaspoon ginger powder\n* 1/4 teaspoon sea salt\n* Honey, to taste\n\nInstructions:\n\n1. Rinse the adzuki beans and soak them in water overnight. Drain the water and rinse again. Transfer the beans to a pot and cover with an inch of water. Bring to a boil, then reduce the heat and let them simmer for about an hour until they are tender. Drain any remaining water and set aside.\n\n2. In a separate pot, bring 2 cups of water to a boil. Add the barley and reduce the heat to low. Cover and simmer for about 40 minutes, or until the barley is tender. Drain any remaining water and set aside.\n\n3. In a large bowl, mix together the cooked adzuki beans, cooked barley, mulberries, pistachios, pumpkin seeds, chicken (if using), mint, and parsley.\n\n4. In a small separate bowl, mix together the cinnamon, ginger powder, and sea salt.\n\n5. Add the cinnamon, ginger powder, and sea salt mixture to the large bowl with the other ingredients. Toss to coat evenly.\n\n6. Add honey to taste, if desired. The salad can be served warm or chilled. \n\nThis recipe is suitable for Qi Deficient Constitution patients as it includes warming foods that help to supplement the qi. The adzuki beans and barley provide a good source of carbohydrates and fiber to help boost energy levels. The nuts and seeds provide healthy fats and proteins to help sustain the energy. The mint and parsley help to brighten the flavor of the recipe and add some moisture, while the cinnamon and ginger help to warm the digestive system. \n\nIt is important to note that this is just a general recipe recommendation and patients should consult with an acupuncture practitioner for a more precise and individualized treatment plan. \n\nWould you like me to help you with something else? ');
INSERT INTO `constitution_results` VALUES ('3', 'Yang Deficient Constitution', 'Indicates insufficiency of Yang Qi, often feeling cold, chilly limbs, and lack of warmth', 'Frequently feeling cold, especially in limbs', 'Prolonged insufficient diet, low mood, irregular lifestyle, prolonged exposure to cold', 'Emphasis on keeping warm, adjusting diet, and maintaining regular lifestyle', 'Consume more warm foods, maintain body temperature, regulate emotions, and avoid exposure to cold', ' Here is a recipe for a Yang Deficient Constitution patient during the summer season in TCM:\n\nIngredients:\n\n- Peach kernel (??): Peach kernel is sweet and neutral in nature, and is considered to have a nourishing and tonifying effect on the Spleen and Lungs. It is often used to treat deficiency-type symptoms such as fatigue, weakness, and shortness of breath.\n\n- White peony root (??): White peony root is sweet and bitter in taste and neutral in nature. It can tonify the Spleen and Lung Qi, nourish Blood, and regulate the flow of Qi. It is often used to treat symptoms such as fatigue, weakness, shortness of breath, and irregular menstruation.\n\n- Chinese licorice root (??): Chinese licorice root is sweet and bland in taste and is considered neutral, although it can potentially tonify the Spleen, Stomach, and Lung Qi, and strengthen the Liver and Kidneys. It is often used to treat symptoms such as fatigue, weakness, and shortness of breath, as well as digestive issues and dry cough.\n\n- Oriental ginseng (??): Oriental ginseng is sweet and warm in nature. It can tonify the Spleen, Lung, and Kidney Yang, and boost Qi and blood. It is often used to treat symptoms such as fatigue, weakness, and shortness of breath, as well as erectile dysfunction and premature ejaculation.\n\n- Red date (??): Red date is sweet and warming in nature. It can tonify the Spleen and Stomach Qi, and is often used to treat symptoms such as fatigue, weakness, and digestive issues.\n\nInstructions:\n\n1. Peel and crush the peach kernel. Rinse the white peony root and cut it into small pieces. Rinse the Chinese licorice root and slice it thinly. Dice the oriental ginseng into small pieces. Soak these ingredients in a bowl with red date and enough water to cover them overnight.\n\n2. The next day, boil the mixture for about an hour in a covered pot. Strain the liquid and drink it warm throughout the day.\n\nThis recipe is intended to provide a general boost of energy and nourishment for a Yang deficient constitution during the summer season. Please note that TCM is highly individualized, and it is always best to consult with a licensed practitioner for a personalized treatment plan based on your specific symptoms and constitution. \n\nWould you like me to help you with anything else concerning TCM or recipes in particular? ');
INSERT INTO `constitution_results` VALUES ('4', 'Yin Deficient Constitution', 'Indicates deficiency in Yin fluids, often experiencing dry mouth, throat, and insomnia', 'Frequent dryness in mouth, sleep disturbances', 'Prolonged emotional fluctuations, consumption of dry or spicy foods, irregular lifestyle', 'Emphasize on maintaining hydration and emotional stability', 'Increase water intake, consume moistening foods, adjust lifestyle, maintain a positive mood', null);
INSERT INTO `constitution_results` VALUES ('5', 'Phlegm-Dampness Constitution', 'Characterized by heavy body, bitterness in mouth, chest tightness due to accumulation of dampness', 'Feeling of body heaviness, bitterness in mouth, indigestion', 'Prolonged consumption of oily and greasy food, lack of exercise, accumulation of dampness in the body', 'Focus on adjusting diet to lighter foods and moderate exercise', 'Adjust diet, reduce intake of greasy foods, and increase physical activity', null);
INSERT INTO `constitution_results` VALUES ('6', 'Damp-Heat Constitution', 'Imbalance characterized by both dampness and heat', 'Frequent bitterness in mouth, bad breath, indigestion', 'Prolonged consumption of spicy foods, high stress, emotional fluctuations', 'Emphasis on a lighter diet and emotional regulation', 'Lighter diet, increased water intake, and maintaining emotional well-being', null);
INSERT INTO `constitution_results` VALUES ('7', 'Blood Stasis Constitution', 'Indicates poor circulation resulting in pain and stagnation of blood', 'Frequent pain, bruises', 'Prolonged sedentary lifestyle, emotional stagnation, irregular diet', 'Focus on moderate exercise and emotional regulation', 'Maintain moderate exercise, healthy diet, and positive emotional state', ' Here is a recipe for a Blood Stasis Constitution patient during the current season in TCM:\n\nIngredients:\n\n1 cup fresh reishi mushroom (ling zhi) - May help nourish the blood and promote circulation.\n\n1/2 cup fresh goji berries (gou qi zi) - Known for their antioxidant properties and may help support vision and immune function.\n\n1/4 cup dried chrysanthemum flowers (ju hua) - May help detoxify the body and relieve inflammation.\n\n1/4 cup dried white peony root (bai shao) - Traditionally used to invigorate the blood and regulate women\'s health.\n\n1/4 cup dried ginger root (sheng jiang) - A common ingredient in TCM with anti-inflammatory and digestive benefits.\n\nInstructions:\n\n1. Soak the reishi mushrooms, goji berries, chrysanthemum flowers, white peony root, and dried ginger root in cold water overnight to soften and activate them.\n\n2. The next day, strain the soaked ingredients and discard the soaking water.\n\n3. Boil approximately 2-3 cups of water in a pot, and add the strained ingredients into the pot.\n\n4. Bring the mixture to a boil, then reduce the heat and let it simmer for about 15-20 minutes.\n\n5. Strain the tea into a cup and drink when it has cooled to a comfortable temperature.\n\nThis herbal tea recipe is suggested for Blood Stasis Constitution patients during the current season. Please consult with a licensed TCM practitioner for personalized recommendations based on your constitution and current condition. \n\nIt is important to note that while these ingredients are generally considered safe, it is always a good idea to consult with a healthcare professional before consuming any new herbal remedy, particularly if you have a medical condition or are taking any medications. \n\nAdditionally, the taste of this tea may not be appealing to some people. You can consider adding natural sweeteners such as honey or lemon to enhance the flavor according to your preference. \n\nRemember, dietary and lifestyle recommendations from TCM are meant to support your overall health and well-being. Consulting a certified TCM practitioner for personalized guidance will ensure you receive the proper care for your specific needs. \n\nWould you like me to help you with anything else concerning blood stasis constitution? ');
INSERT INTO `constitution_results` VALUES ('8', 'Qi-Stagnation Constitution', 'Indicates poor circulation of Qi and blood, often feeling chest tightness and low mood', 'Frequent feelings of low mood, chest tightness', 'Prolonged emotional instability, high stress, sedentary lifestyle', 'Emphasis on emotional regulation and moderate exercise', 'Maintain positive emotions, moderate exercise, and healthy lifestyle habits', ' Here is a recipe for a Qi-Stagnation Constitution patient during the current season in Traditional Chinese Medicine (TCM):\n\nIngredients:\n\n1 cup cooked barley: Barley is a warming grain that helps to regulate the digestive system and improve the flow of Qi. It is particularly beneficial for stagnation due to its ability to strengthen the Spleen and transform dampness.\n\n1/2 cup cooked carrots: Carrots are sweet and nourishing, which makes them helpful for tonifying the Spleen and improving digestive imbalances. Their bright color also symbolizes increased vitality and energy.\n\n1/4 cup chopped walnuts: Walnuts have a bittersweet flavor that makes them ideal for regulating the Liver Qi. They also help to tonify the Kidneys and strengthen the entire reproductive system.\n\n1/4 cup dried cranberries: Dried cranberries add a sweet and tart flavor to this recipe, which helps to clear dampness and mucus from the digestive system. They also possess antioxidants that can help protect against chronic illnesses.\n\n1 teaspoon olive oil: Olive oil helps to regulate the Spleen and harmonize the digestive process, while also providing a healthy source of fat.\n\nInstructions:\n\n1. Cook the barley: Rinse the barley in cold water and drain. Bring 2 cups of water to a boil in a medium saucepan. Add the barley and reduce the heat to low. Cover and simmer for about 45 minutes, or until the barley is tender. Drain any remaining liquid and set aside.\n\n2. Prepare the remaining ingredients: While the barley is cooking, peel and slice the carrots into small, bite-sized pieces. Chop the walnuts and measure out the dried cranberries and olive oil.\n\n3. Assemble the salad: In a large bowl, combine the cooked barley, cooked carrots, walnuts, dried cranberries, and olive oil. Toss until well mixed.\n\n4. Season and serve: Add salt and pepper to taste, if desired. You can also add a squeeze of fresh lemon juice or a drizzle of honey to enhance the flavors. Serve the salad warm or at room temperature.\n\nThis recipe is intended to support the Qi-Stagnation Constitution by promoting the flow of Qi through the Spleen and Liver systems. The warm and nourishing ingredients help to tonify the Spleen, while the bittersweet flavors of the walnuts and cranberries regulate the Liver Qi. Consuming this dish should help you feel more grounded and energized during the current season. \n\nRemember, in TCM, dietary therapy is just one aspect of caring for your constitution. Other recommendations may include lifestyle changes, herbal supplementation, regular exercise, and stress management techniques. \n\nFor more precise and personalized guidance, it would be advisable to consult with an experienced TCM practitioner or nutritionist, as they can conduct a thorough assessment of your individual constitution and provide tailored recommendations. \n\nIs there anything specific you would like to know about this recipe or TCM in general? ');
INSERT INTO `constitution_results` VALUES ('9', 'Intrinsic Constitution', 'Typically sensitive to medications, food, smell, pollen; prone to nasal \r\n& skin allergies, asthma, and chronic conditions triggered by \r\nchanging seasons', 'Sensitivity to medications, food, smell & pollen; nasal & skin allergies, asthma', 'Maintain a bland and balanced diet with sufficient vegetables and meat, avoid spicy and irritating foods, maintain good hygiene and ventilation, exercise to increase immunity, keep warm during exercise in the cold', 'Maintain a bland and balanced diet with sufficient vegetables and meat, avoid spicy and irritating foods, maintain good hygiene and ventilation, exercise to increase immunity, keep warm during exercise in the cold', 'Maintain a bland and balanced diet with sufficient vegetables and meat, avoid spicy and irritating foods, maintain good hygiene and ventilation, exercise to increase immunity, keep warm during exercise in the cold', ' I cannot provide a recipe for an Intrinsic Constitution patient under the current season in TCM (Traditional Chinese Medicine) without more information about the patient and the current season. \n\nIn TCM, constitutional types, known as \"Ben\" (?) types, are determined by an individual\'s inherent physical and physiological characteristics. There are typically three Ben types considered in TCM:\n\n1. Yang Ming (??): This type refers to individuals who are generally vigorous and resilient, with a strong digestive system and a tendency to feel warm. They are often prone to excessive sweating and may have a lean physique.\n\n2. Tai Yang (??): This type describes individuals with a moderate constitution, balanced digestion, and an ability to adapt to changes in temperature. They are usually not prone to excessive sweating and may have a medium physique.\n\n3. Shao Yang (??): This type represents individuals with a more delicate constitution, potentially compromised digestion, and difficulty adapting to changes in temperature. They often feel cold and may have a thicker physique.\n\nThe current season plays a vital role in TCM because the external environment profoundly influences the human body\'s internal balance. The principles of \"Revering Heaven\" (??) and \" Harmonizing with Season\" (????defer) suggest that individuals align their lifestyles, diets, and activities with the seasonal changes to maintain health and prevent diseases.\n\nTo provide a recipe specific to an Intrinsic Constitution patient under the current season, I would need to know the individual\'s Ben type and the season we are currently in. The recipe would likely include dietary and lifestyle recommendations aligned with the prevailing environmental conditions and the patient\'s unique constitution to achieve optimal balance and health. \n\nIt is highly recommended to consult with an experienced TCM practitioner for a more accurate assessment of your constitution and personalized recommendations based on your individual needs and the current season. \n\nIs there anything else I can help you with regarding TCM or recipes? ');

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adminId` int unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `type` varchar(50) DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `status` enum('active','inactive','deleted') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `adminId` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES ('17', '3', 'adminPhoto-1700038492670.jpg', 'Admin Photo', 'photo', '20955', '/adminPhoto-1700038492670.jpg', 'active', '2023-11-15 00:54:52', '2023-11-15 00:54:52');
INSERT INTO `files` VALUES ('18', '4', 'adminPhoto-1701859497235.png', 'Admin Photo', 'photo', '14577', '/adminPhoto-1701859497235.png', 'active', '2023-12-06 02:44:57', '2023-12-06 02:44:57');
INSERT INTO `files` VALUES ('21', '1', 'photo-1701895830896.jpeg', 'Admin Photo', 'photo', '251343', '/photo-1701895830896.jpeg', 'active', '2023-12-06 12:50:30', '2023-12-06 12:50:30');
INSERT INTO `files` VALUES ('22', '0', 'logo-1701895877585.png', 'Website Logo', 'logo', '43986', '/logo-1701895877585.png', 'active', '2023-12-06 12:51:17', '2023-12-06 12:51:17');
INSERT INTO `files` VALUES ('24', '5', 'photo-1701895933331.jpg', 'Admin Photo', 'photo', '20955', '/photo-1701895933331.jpg', 'active', '2023-12-06 12:52:13', '2023-12-06 12:52:13');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `qid` int NOT NULL,
  `groupId` int NOT NULL,
  `id` int NOT NULL,
  `textEn` varchar(255) NOT NULL,
  `textCn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', '1', '1', 'Do you feel energetic?', '你精力充沛吗?', 'Neutral Constitution');
INSERT INTO `questions` VALUES ('2', '1', '2', 'Do you feel tired easily?', '您容易疲乏吗?', 'Neutral Constitution');
INSERT INTO `questions` VALUES ('3', '1', '3', 'Comparing to people around you, do you always feel colder and need to wear more clothes to keep warm?', '您比一般人耐受不了寒冷吗?', 'Neutral Constitution');
INSERT INTO `questions` VALUES ('4', '1', '4', 'Are you able to adapt to changes in the environment and society?', '您能适应外界自然和社会环境的变化吗?', 'Neutral Constitution');
INSERT INTO `questions` VALUES ('5', '1', '5', 'Does your voice sound too soft? For example, you often need to raise your voice for people to hear you.', '您说话声音低弱无力吗?', 'Neutral Constitution');
INSERT INTO `questions` VALUES ('6', '1', '6', 'Do you always feel something is bothering you making you unhappy?', '您感到闷闷不乐、情绪低沉吗?', 'Neutral Constitution');
INSERT INTO `questions` VALUES ('7', '1', '7', 'Do you have difficulties remembering things?', '您容易忘事（健忘）吗?', 'Neutral Constitution');
INSERT INTO `questions` VALUES ('8', '1', '8', 'Do you have difficulties falling asleep at night?', '您容易失眠吗?', 'Neutral Constitution');
INSERT INTO `questions` VALUES ('9', '2', '1', 'Do you feel tired easily?', '您容易疲乏吗?', 'Qi Deficient Constitution');
INSERT INTO `questions` VALUES ('10', '2', '2', 'Do you feel shortness of breath easily?', '您容易气短(呼吸短促，接不上气)吗?', 'Qi Deficient Constitution');
INSERT INTO `questions` VALUES ('11', '2', '3', 'Does your voice sound too soft?', '您说话声音低弱无力吗?', 'Qi Deficient Constitution');
INSERT INTO `questions` VALUES ('12', '2', '4', 'Do you experience fast heartbeat easily?', '您容易心慌吗?', 'Qi Deficient Constitution');
INSERT INTO `questions` VALUES ('13', '2', '5', 'Do you prefer quiet and don not like to talk?', '您喜欢安静、懒得说话吗?', 'Qi Deficient Constitution');
INSERT INTO `questions` VALUES ('14', '2', '6', 'Do you feel giddiness (or when you stand up) easily?', '您容易头晕或站起时晕眩吗?', 'Qi Deficient Constitution');
INSERT INTO `questions` VALUES ('15', '2', '7', 'Comparing to people around you, do you catch a cold easily?', '您比别人容易患感冒吗?', 'Qi Deficient Constitution');
INSERT INTO `questions` VALUES ('16', '2', '8', 'Do you find yourself sweat easily when you have a bit more physical activity?', '您活动量稍大就容易出虚汗吗?', 'Qi Deficient Constitution');
INSERT INTO `questions` VALUES ('17', '3', '1', 'Does your palm and feet feel cold/ cool most of the time?', '您手脚发凉吗?', 'Yang Deficient Constitution');
INSERT INTO `questions` VALUES ('18', '3', '2', 'Does your stomach, back, waist or knee area feel cold?', '您胃脘部、背部或腰膝部怕冷吗？', 'Yang Deficient Constitution');
INSERT INTO `questions` VALUES ('19', '3', '3', 'Do you feel cold and often wear more clothes than most people?', '您感到怕冷、衣服比别人穿的多吗?', 'Yang Deficient Constitution');
INSERT INTO `questions` VALUES ('20', '3', '4', 'Comparing to people around you, do you always feel colder and need to wear more clothes to keep warm?', '您比一般人耐受不了寒冷吗？', 'Yang Deficient Constitution');
INSERT INTO `questions` VALUES ('21', '3', '5', 'Comparing to people around you, do you catch a flu easily?', '您比别人容易患感冒吗?', 'Yang Deficient Constitution');
INSERT INTO `questions` VALUES ('22', '3', '6', 'Do you feel uncomfortable after taking cold drinks? Or are you afraid of taking cold food / drinks?', '您吃(喝)凉的东西会感到不舒服或者怕吃(喝)凉的东西吗?', 'Yang Deficient Constitution');
INSERT INTO `questions` VALUES ('23', '3', '7', 'Do you have diarrhea when you eat cold stuff or caught a cold?', '您受凉或吃(喝)凉的东西后，容易拉肚子吗?', 'Yang Deficient Constitution');
INSERT INTO `questions` VALUES ('24', '4', '1', 'Do you feel your palm and feet hot?', '您感到手脚心发热吗?', 'Yin Deficient Constitution');
INSERT INTO `questions` VALUES ('25', '4', '2', 'Does your body or face feel hot?', '您感觉身体、脸上发热吗?', 'Yin Deficient Constitution');
INSERT INTO `questions` VALUES ('26', '4', '3', 'Does both sides of your face show redness?', '您面部两颧潮红或偏红吗?', 'Yin Deficient Constitution');
INSERT INTO `questions` VALUES ('27', '4', '4', 'Does your lips look redder than most people?', '您口唇的颜色比一般人红吗?', 'Yin Deficient Constitution');
INSERT INTO `questions` VALUES ('28', '4', '5', 'Do you have dry lips / skin?', '您皮肤或口唇干吗?', 'Yin Deficient Constitution');
INSERT INTO `questions` VALUES ('29', '4', '6', 'Do you have constipation easily or your stools are hard and dry?', '您容易便秘或大便干燥吗?', 'Yin Deficient Constitution');
INSERT INTO `questions` VALUES ('30', '4', '7', 'Do you feel dryness in your eyes?', '您感到眼睛干涩吗?', 'Yin Deficient Constitution');
INSERT INTO `questions` VALUES ('31', '4', '8', 'Do you feel thirsty and always want to drink water?', '您感到口干咽燥、总想喝水吗?', 'Yin Deficient Constitution');
INSERT INTO `questions` VALUES ('32', '5', '1', 'Is your forehead oily?', '您有额部油脂分泌多的现象吗?', 'Phlegm-Dampness Constitution');
INSERT INTO `questions` VALUES ('33', '5', '2', 'Do you feel fullness in your chest and stomach?', '您感到胸闷或腹部胀满吗?', 'Phlegm-Dampness Constitution');
INSERT INTO `questions` VALUES ('34', '5', '3', 'Is your belly area fat and soft?', '您腹部肥满松软吗?', 'Phlegm-Dampness Constitution');
INSERT INTO `questions` VALUES ('35', '5', '4', 'Do you feel heaviness in your body?', '您感到身体沉重不轻松或不爽快吗?', 'Phlegm-Dampness Constitution');
INSERT INTO `questions` VALUES ('36', '5', '5', 'Do you find your upper eye lid more swollen compared to most people?', '您上眼睑比别人肿吗?', 'Phlegm-Dampness Constitution');
INSERT INTO `questions` VALUES ('37', '5', '6', 'Do you feel stickiness inside your mouth?', '您舌苔厚腻或有舌苔厚厚的感觉吗?', 'Phlegm-Dampness Constitution');
INSERT INTO `questions` VALUES ('38', '5', '7', 'Do you feel your tongue coating thick?', '您感到眼睛干涩吗?', 'Phlegm-Dampness Constitution');
INSERT INTO `questions` VALUES ('39', '5', '8', 'Do you normally have phlegm? Especially in your throat area?', '您平时痰多，特别是咽喉部总感到有痰堵着吗?', 'Phlegm-Dampness Constitution');
INSERT INTO `questions` VALUES ('40', '6', '1', 'Do you have oily skin on your face and nose area?', '您面部或鼻部有油腻感或者油亮发光吗?', 'Damp-Heat Constitution');
INSERT INTO `questions` VALUES ('41', '6', '2', 'Do you have pimples / breakout easily?', '您易生痤疮或者疮疖吗?', 'Damp-Heat Constitution');
INSERT INTO `questions` VALUES ('42', '6', '3', 'Do you feel bitterness or a strange taste in your mouth?', '您感到口苦或嘴里有异味吗?', 'Damp-Heat Constitution');
INSERT INTO `questions` VALUES ('43', '6', '4', 'Do you have sticky stools or always feel you don not have a complete defecate?', '您大便黏滞不爽、有解不尽的感觉吗?', 'Damp-Heat Constitution');
INSERT INTO `questions` VALUES ('44', '6', '5', 'Do you feel your urethra has a hot sensation when you urine? Or your urine is dark in color?', '您小便时尿道有发热感、尿色浓(深)吗?', 'Damp-Heat Constitution');
INSERT INTO `questions` VALUES ('45', '6', '6', 'Does your discharge yellow or brown in color?(The female answer) / Does your private part area feel damp?(The male answer)', '您带下色黄(白带颜色发黄)吗? （女性回答）/ 您的阴囊部位潮湿吗? （男性回答）', 'Damp-Heat Constitution');
INSERT INTO `questions` VALUES ('46', '7', '1', 'Do you find your skin with purple spots out of sudden?', '您的皮肤常在不知不觉中出现青紫瘀斑(皮下出血)吗?', 'Blood Stasis Constitution');
INSERT INTO `questions` VALUES ('47', '7', '2', 'Do you have visible thin blood vessels on both sides of your cheekbone?', '您两颧部有细微红丝吗?', 'Blood Stasis Constitution');
INSERT INTO `questions` VALUES ('48', '7', '3', 'Do you feel pain on any part of your body?', '您身体上有哪里疼痛吗？', 'Blood Stasis Constitution');
INSERT INTO `questions` VALUES ('49', '7', '4', 'Do you find your face darker in tone or having dark brown spots on your face?', '您面色晦暗，或容易出现褐斑吗?', 'Blood Stasis Constitution');
INSERT INTO `questions` VALUES ('50', '7', '5', 'Do you have dark circles under your eye easily?', '您容易有黑眼圈吗?', 'Blood Stasis Constitution');
INSERT INTO `questions` VALUES ('51', '7', '6', 'Do you find your lips color dark?', '您口唇颜色偏黯吗?', 'Blood Stasis Constitution');
INSERT INTO `questions` VALUES ('52', '7', '7', 'Do you have difficulties remembering things?', '您容易忘事（健忘）吗?', 'Blood Stasis Constitution');
INSERT INTO `questions` VALUES ('53', '8', '1', 'Do you always feel something is bothering you making you unhappy?', '您感到闷闷不乐、情绪低沉吗?', 'Qi-Stagnation Constitution');
INSERT INTO `questions` VALUES ('54', '8', '2', 'Do you find yourself easily anxious?', '您容易精神紧张、焦虑不安吗?', 'Qi-Stagnation Constitution');
INSERT INTO `questions` VALUES ('55', '8', '3', 'Do you find yourself easily emotional?', '您多愁善感、感情脆弱吗？', 'Qi-Stagnation Constitution');
INSERT INTO `questions` VALUES ('56', '8', '4', 'Do you find yourself easily scared or frightened?', '您容易感到害怕或受到惊吓吗?', 'Qi-Stagnation Constitution');
INSERT INTO `questions` VALUES ('57', '8', '5', 'Do you feel fullness and pain around your chest area?', '您胁肋部胀痛吗?', 'Qi-Stagnation Constitution');
INSERT INTO `questions` VALUES ('58', '8', '6', 'Do you find yourself sigh out of sudden?', '您无缘无故叹气吗?', 'Qi-Stagnation Constitution');
INSERT INTO `questions` VALUES ('59', '8', '7', 'Do you have a feeling something stuck in your throat that you can not spit out or swallow?', '您咽喉部有异物感，且吐之不出、咽之不下吗?', 'Qi-Stagnation Constitution');
INSERT INTO `questions` VALUES ('60', '9', '1', 'Do you easily allergic (drugs, food, smell, pollen, temperature change)?', '您容易过敏(对药物、食物、气味、花粉或在季节交替、气候变化时)吗?', 'Intrinsic Constitution');
INSERT INTO `questions` VALUES ('61', '9', '2', 'Do you sneeze often even when you are not having flu?', '您没有感冒时也会打喷嚏吗？', 'Intrinsic Constitution');
INSERT INTO `questions` VALUES ('62', '9', '3', 'Do you have stuffy, running nose even when you are not having flu?', '您没有感冒时也会鼻塞、流鼻涕吗?', 'Intrinsic Constitution');
INSERT INTO `questions` VALUES ('63', '9', '4', 'Do you have coughing or asthma especially during temperature or surrounding smell changes?', '您有因季节变化、温度变化或异味等原因而咳喘的现象吗？', 'Intrinsic Constitution');
INSERT INTO `questions` VALUES ('64', '9', '5', 'Does your skin have itchy spots easily?', '您的皮肤容易起荨麻疹(风团、风疹块、风疙瘩)吗?', 'Intrinsic Constitution');
INSERT INTO `questions` VALUES ('65', '9', '6', 'When you scratch your skin, does it appear red and scratch marks easily?', '您的皮肤一抓就红，并出现抓痕吗?', 'Intrinsic Constitution');
INSERT INTO `questions` VALUES ('66', '9', '7', 'Do you find purple spots on your skin due to allergic reasons?', '您的皮肤因过敏出现过紫癜(紫红色瘀点、瘀斑)吗?', 'Intrinsic Constitution');

-- ----------------------------
-- Table structure for respondents
-- ----------------------------
DROP TABLE IF EXISTS `respondents`;
CREATE TABLE `respondents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `constitution` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_number` (`reference_number`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of respondents
-- ----------------------------
INSERT INTO `respondents` VALUES ('18', '1701573781939-873066', '2023-11-30 19:23:01', 'Qi Deficient Constitution');
INSERT INTO `respondents` VALUES ('19', '1701580576218-459485', '2023-12-01 21:16:16', 'Qi-Stagnation Constitution');
INSERT INTO `respondents` VALUES ('20', '1701580713435-96825', '2023-12-02 21:18:33', 'Intrinsic Constitution');
INSERT INTO `respondents` VALUES ('21', '1701580822993-13018', '2023-12-02 21:20:22', 'Yang Deficient Constitution');
INSERT INTO `respondents` VALUES ('22', '1701580894468-174396', '2023-12-03 21:21:34', 'Yang Deficient Constitution');
INSERT INTO `respondents` VALUES ('23', '1701581063489-200003', '2023-12-04 21:24:23', 'Blood Stasis Constitution');

-- ----------------------------
-- Table structure for responses
-- ----------------------------
DROP TABLE IF EXISTS `responses`;
CREATE TABLE `responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `respondent_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `answer` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `respondent_id` (`respondent_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `responses_ibfk_1` FOREIGN KEY (`respondent_id`) REFERENCES `respondents` (`id`),
  CONSTRAINT `responses_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of responses
-- ----------------------------
INSERT INTO `responses` VALUES ('298', '18', '63', '5');
INSERT INTO `responses` VALUES ('299', '18', '4', '3');
INSERT INTO `responses` VALUES ('300', '18', '11', '5');
INSERT INTO `responses` VALUES ('301', '18', '14', '5');
INSERT INTO `responses` VALUES ('302', '18', '3', '3');
INSERT INTO `responses` VALUES ('303', '18', '1', '3');
INSERT INTO `responses` VALUES ('304', '18', '10', '5');
INSERT INTO `responses` VALUES ('305', '18', '13', '5');
INSERT INTO `responses` VALUES ('306', '18', '6', '4');
INSERT INTO `responses` VALUES ('307', '18', '8', '4');
INSERT INTO `responses` VALUES ('308', '18', '5', '4');
INSERT INTO `responses` VALUES ('309', '18', '7', '4');
INSERT INTO `responses` VALUES ('310', '18', '9', '5');
INSERT INTO `responses` VALUES ('311', '18', '2', '4');
INSERT INTO `responses` VALUES ('312', '18', '12', '5');
INSERT INTO `responses` VALUES ('313', '18', '19', '3');
INSERT INTO `responses` VALUES ('314', '18', '16', '5');
INSERT INTO `responses` VALUES ('315', '18', '35', '4');
INSERT INTO `responses` VALUES ('316', '18', '23', '4');
INSERT INTO `responses` VALUES ('317', '18', '64', '3');
INSERT INTO `responses` VALUES ('318', '18', '40', '4');
INSERT INTO `responses` VALUES ('319', '18', '22', '2');
INSERT INTO `responses` VALUES ('320', '18', '48', '4');
INSERT INTO `responses` VALUES ('321', '18', '15', '5');
INSERT INTO `responses` VALUES ('322', '18', '33', '3');
INSERT INTO `responses` VALUES ('323', '18', '44', '2');
INSERT INTO `responses` VALUES ('324', '18', '66', '3');
INSERT INTO `responses` VALUES ('325', '18', '54', '3');
INSERT INTO `responses` VALUES ('326', '18', '49', '3');
INSERT INTO `responses` VALUES ('327', '18', '30', '2');
INSERT INTO `responses` VALUES ('328', '18', '20', '4');
INSERT INTO `responses` VALUES ('329', '18', '17', '5');
INSERT INTO `responses` VALUES ('330', '18', '36', '4');
INSERT INTO `responses` VALUES ('331', '18', '28', '2');
INSERT INTO `responses` VALUES ('332', '18', '61', '2');
INSERT INTO `responses` VALUES ('333', '18', '21', '3');
INSERT INTO `responses` VALUES ('334', '18', '43', '3');
INSERT INTO `responses` VALUES ('335', '18', '50', '2');
INSERT INTO `responses` VALUES ('336', '18', '47', '2');
INSERT INTO `responses` VALUES ('337', '18', '24', '5');
INSERT INTO `responses` VALUES ('338', '18', '37', '3');
INSERT INTO `responses` VALUES ('339', '18', '39', '4');
INSERT INTO `responses` VALUES ('340', '18', '18', '4');
INSERT INTO `responses` VALUES ('341', '18', '60', '4');
INSERT INTO `responses` VALUES ('342', '18', '27', '4');
INSERT INTO `responses` VALUES ('343', '18', '31', '3');
INSERT INTO `responses` VALUES ('344', '18', '29', '2');
INSERT INTO `responses` VALUES ('345', '18', '56', '3');
INSERT INTO `responses` VALUES ('346', '18', '55', '2');
INSERT INTO `responses` VALUES ('347', '18', '38', '3');
INSERT INTO `responses` VALUES ('348', '18', '53', '5');
INSERT INTO `responses` VALUES ('349', '18', '62', '4');
INSERT INTO `responses` VALUES ('350', '18', '42', '3');
INSERT INTO `responses` VALUES ('351', '18', '25', '3');
INSERT INTO `responses` VALUES ('352', '18', '65', '4');
INSERT INTO `responses` VALUES ('353', '18', '26', '3');
INSERT INTO `responses` VALUES ('354', '18', '51', '4');
INSERT INTO `responses` VALUES ('355', '18', '46', '5');
INSERT INTO `responses` VALUES ('356', '18', '34', '2');
INSERT INTO `responses` VALUES ('357', '18', '32', '5');
INSERT INTO `responses` VALUES ('358', '18', '58', '3');
INSERT INTO `responses` VALUES ('359', '18', '57', '3');
INSERT INTO `responses` VALUES ('360', '18', '52', '4');
INSERT INTO `responses` VALUES ('361', '18', '59', '4');
INSERT INTO `responses` VALUES ('362', '18', '45', '4');
INSERT INTO `responses` VALUES ('363', '18', '41', '2');
INSERT INTO `responses` VALUES ('364', '19', '8', '5');
INSERT INTO `responses` VALUES ('365', '19', '12', '1');
INSERT INTO `responses` VALUES ('366', '19', '63', '2');
INSERT INTO `responses` VALUES ('367', '19', '1', '5');
INSERT INTO `responses` VALUES ('368', '19', '2', '3');
INSERT INTO `responses` VALUES ('369', '19', '3', '4');
INSERT INTO `responses` VALUES ('370', '19', '4', '3');
INSERT INTO `responses` VALUES ('371', '19', '5', '2');
INSERT INTO `responses` VALUES ('372', '19', '6', '3');
INSERT INTO `responses` VALUES ('373', '19', '7', '4');
INSERT INTO `responses` VALUES ('374', '19', '9', '3');
INSERT INTO `responses` VALUES ('375', '19', '10', '2');
INSERT INTO `responses` VALUES ('376', '19', '11', '5');
INSERT INTO `responses` VALUES ('377', '19', '13', '2');
INSERT INTO `responses` VALUES ('378', '19', '14', '3');
INSERT INTO `responses` VALUES ('379', '19', '15', '4');
INSERT INTO `responses` VALUES ('380', '19', '16', '5');
INSERT INTO `responses` VALUES ('381', '19', '17', '1');
INSERT INTO `responses` VALUES ('382', '19', '18', '3');
INSERT INTO `responses` VALUES ('383', '19', '19', '4');
INSERT INTO `responses` VALUES ('384', '19', '20', '2');
INSERT INTO `responses` VALUES ('385', '19', '21', '4');
INSERT INTO `responses` VALUES ('386', '19', '22', '5');
INSERT INTO `responses` VALUES ('387', '19', '23', '5');
INSERT INTO `responses` VALUES ('388', '19', '24', '5');
INSERT INTO `responses` VALUES ('389', '19', '25', '3');
INSERT INTO `responses` VALUES ('390', '19', '26', '4');
INSERT INTO `responses` VALUES ('391', '19', '27', '1');
INSERT INTO `responses` VALUES ('392', '19', '28', '2');
INSERT INTO `responses` VALUES ('393', '19', '29', '4');
INSERT INTO `responses` VALUES ('394', '19', '30', '5');
INSERT INTO `responses` VALUES ('395', '19', '31', '4');
INSERT INTO `responses` VALUES ('396', '19', '32', '2');
INSERT INTO `responses` VALUES ('397', '19', '33', '3');
INSERT INTO `responses` VALUES ('398', '19', '34', '4');
INSERT INTO `responses` VALUES ('399', '19', '35', '2');
INSERT INTO `responses` VALUES ('400', '19', '36', '1');
INSERT INTO `responses` VALUES ('401', '19', '37', '3');
INSERT INTO `responses` VALUES ('402', '19', '38', '4');
INSERT INTO `responses` VALUES ('403', '19', '39', '5');
INSERT INTO `responses` VALUES ('404', '19', '40', '4');
INSERT INTO `responses` VALUES ('405', '19', '41', '2');
INSERT INTO `responses` VALUES ('406', '19', '42', '5');
INSERT INTO `responses` VALUES ('407', '19', '43', '2');
INSERT INTO `responses` VALUES ('408', '19', '44', '5');
INSERT INTO `responses` VALUES ('409', '19', '45', '1');
INSERT INTO `responses` VALUES ('410', '19', '46', '4');
INSERT INTO `responses` VALUES ('411', '19', '47', '1');
INSERT INTO `responses` VALUES ('412', '19', '49', '4');
INSERT INTO `responses` VALUES ('413', '19', '48', '2');
INSERT INTO `responses` VALUES ('414', '19', '50', '5');
INSERT INTO `responses` VALUES ('415', '19', '51', '2');
INSERT INTO `responses` VALUES ('416', '19', '52', '4');
INSERT INTO `responses` VALUES ('417', '19', '53', '3');
INSERT INTO `responses` VALUES ('418', '19', '54', '4');
INSERT INTO `responses` VALUES ('419', '19', '55', '2');
INSERT INTO `responses` VALUES ('420', '19', '56', '4');
INSERT INTO `responses` VALUES ('421', '19', '57', '5');
INSERT INTO `responses` VALUES ('422', '19', '58', '3');
INSERT INTO `responses` VALUES ('423', '19', '59', '4');
INSERT INTO `responses` VALUES ('424', '19', '60', '5');
INSERT INTO `responses` VALUES ('425', '19', '61', '2');
INSERT INTO `responses` VALUES ('426', '19', '62', '4');
INSERT INTO `responses` VALUES ('427', '19', '64', '4');
INSERT INTO `responses` VALUES ('428', '19', '65', '1');
INSERT INTO `responses` VALUES ('429', '19', '66', '4');
INSERT INTO `responses` VALUES ('430', '20', '1', '4');
INSERT INTO `responses` VALUES ('431', '20', '2', '2');
INSERT INTO `responses` VALUES ('432', '20', '3', '1');
INSERT INTO `responses` VALUES ('433', '20', '4', '2');
INSERT INTO `responses` VALUES ('434', '20', '5', '3');
INSERT INTO `responses` VALUES ('435', '20', '6', '4');
INSERT INTO `responses` VALUES ('436', '20', '7', '5');
INSERT INTO `responses` VALUES ('437', '20', '8', '5');
INSERT INTO `responses` VALUES ('438', '20', '9', '3');
INSERT INTO `responses` VALUES ('439', '20', '10', '2');
INSERT INTO `responses` VALUES ('440', '20', '11', '4');
INSERT INTO `responses` VALUES ('441', '20', '12', '3');
INSERT INTO `responses` VALUES ('442', '20', '13', '1');
INSERT INTO `responses` VALUES ('443', '20', '14', '4');
INSERT INTO `responses` VALUES ('444', '20', '15', '5');
INSERT INTO `responses` VALUES ('445', '20', '16', '3');
INSERT INTO `responses` VALUES ('446', '20', '17', '2');
INSERT INTO `responses` VALUES ('447', '20', '18', '3');
INSERT INTO `responses` VALUES ('448', '20', '19', '5');
INSERT INTO `responses` VALUES ('449', '20', '20', '4');
INSERT INTO `responses` VALUES ('450', '20', '21', '2');
INSERT INTO `responses` VALUES ('451', '20', '22', '1');
INSERT INTO `responses` VALUES ('452', '20', '23', '2');
INSERT INTO `responses` VALUES ('453', '20', '24', '1');
INSERT INTO `responses` VALUES ('454', '20', '25', '4');
INSERT INTO `responses` VALUES ('455', '20', '26', '3');
INSERT INTO `responses` VALUES ('456', '20', '27', '2');
INSERT INTO `responses` VALUES ('457', '20', '28', '4');
INSERT INTO `responses` VALUES ('458', '20', '29', '5');
INSERT INTO `responses` VALUES ('459', '20', '30', '3');
INSERT INTO `responses` VALUES ('460', '20', '31', '1');
INSERT INTO `responses` VALUES ('461', '20', '32', '2');
INSERT INTO `responses` VALUES ('462', '20', '33', '3');
INSERT INTO `responses` VALUES ('463', '20', '34', '4');
INSERT INTO `responses` VALUES ('464', '20', '35', '5');
INSERT INTO `responses` VALUES ('465', '20', '36', '3');
INSERT INTO `responses` VALUES ('466', '20', '37', '2');
INSERT INTO `responses` VALUES ('467', '20', '38', '1');
INSERT INTO `responses` VALUES ('468', '20', '39', '4');
INSERT INTO `responses` VALUES ('469', '20', '40', '1');
INSERT INTO `responses` VALUES ('470', '20', '41', '2');
INSERT INTO `responses` VALUES ('471', '20', '42', '3');
INSERT INTO `responses` VALUES ('472', '20', '43', '4');
INSERT INTO `responses` VALUES ('473', '20', '44', '5');
INSERT INTO `responses` VALUES ('474', '20', '45', '4');
INSERT INTO `responses` VALUES ('475', '20', '46', '4');
INSERT INTO `responses` VALUES ('476', '20', '47', '2');
INSERT INTO `responses` VALUES ('477', '20', '48', '5');
INSERT INTO `responses` VALUES ('478', '20', '49', '1');
INSERT INTO `responses` VALUES ('479', '20', '50', '4');
INSERT INTO `responses` VALUES ('480', '20', '51', '2');
INSERT INTO `responses` VALUES ('481', '20', '52', '5');
INSERT INTO `responses` VALUES ('482', '20', '53', '4');
INSERT INTO `responses` VALUES ('483', '20', '54', '2');
INSERT INTO `responses` VALUES ('484', '20', '55', '5');
INSERT INTO `responses` VALUES ('485', '20', '56', '3');
INSERT INTO `responses` VALUES ('486', '20', '57', '2');
INSERT INTO `responses` VALUES ('487', '20', '58', '4');
INSERT INTO `responses` VALUES ('488', '20', '59', '3');
INSERT INTO `responses` VALUES ('489', '20', '60', '2');
INSERT INTO `responses` VALUES ('490', '20', '61', '4');
INSERT INTO `responses` VALUES ('491', '20', '62', '4');
INSERT INTO `responses` VALUES ('492', '20', '63', '3');
INSERT INTO `responses` VALUES ('493', '20', '64', '4');
INSERT INTO `responses` VALUES ('494', '20', '65', '5');
INSERT INTO `responses` VALUES ('495', '20', '66', '2');
INSERT INTO `responses` VALUES ('496', '21', '15', '1');
INSERT INTO `responses` VALUES ('497', '21', '1', '4');
INSERT INTO `responses` VALUES ('498', '21', '2', '2');
INSERT INTO `responses` VALUES ('499', '21', '3', '5');
INSERT INTO `responses` VALUES ('500', '21', '4', '3');
INSERT INTO `responses` VALUES ('501', '21', '5', '1');
INSERT INTO `responses` VALUES ('502', '21', '6', '4');
INSERT INTO `responses` VALUES ('503', '21', '7', '3');
INSERT INTO `responses` VALUES ('504', '21', '8', '5');
INSERT INTO `responses` VALUES ('505', '21', '9', '4');
INSERT INTO `responses` VALUES ('506', '21', '10', '2');
INSERT INTO `responses` VALUES ('507', '21', '11', '5');
INSERT INTO `responses` VALUES ('508', '21', '12', '3');
INSERT INTO `responses` VALUES ('509', '21', '13', '4');
INSERT INTO `responses` VALUES ('510', '21', '14', '2');
INSERT INTO `responses` VALUES ('511', '21', '16', '5');
INSERT INTO `responses` VALUES ('512', '21', '17', '4');
INSERT INTO `responses` VALUES ('513', '21', '18', '5');
INSERT INTO `responses` VALUES ('514', '21', '19', '3');
INSERT INTO `responses` VALUES ('515', '21', '20', '2');
INSERT INTO `responses` VALUES ('516', '21', '21', '1');
INSERT INTO `responses` VALUES ('517', '21', '22', '4');
INSERT INTO `responses` VALUES ('518', '21', '23', '5');
INSERT INTO `responses` VALUES ('519', '21', '24', '5');
INSERT INTO `responses` VALUES ('520', '21', '25', '2');
INSERT INTO `responses` VALUES ('521', '21', '26', '4');
INSERT INTO `responses` VALUES ('522', '21', '27', '2');
INSERT INTO `responses` VALUES ('523', '21', '28', '5');
INSERT INTO `responses` VALUES ('524', '21', '29', '3');
INSERT INTO `responses` VALUES ('525', '21', '30', '1');
INSERT INTO `responses` VALUES ('526', '21', '31', '4');
INSERT INTO `responses` VALUES ('527', '21', '32', '1');
INSERT INTO `responses` VALUES ('528', '21', '33', '3');
INSERT INTO `responses` VALUES ('529', '21', '34', '5');
INSERT INTO `responses` VALUES ('530', '21', '35', '4');
INSERT INTO `responses` VALUES ('531', '21', '36', '2');
INSERT INTO `responses` VALUES ('532', '21', '37', '3');
INSERT INTO `responses` VALUES ('533', '21', '38', '5');
INSERT INTO `responses` VALUES ('534', '21', '39', '1');
INSERT INTO `responses` VALUES ('535', '21', '40', '2');
INSERT INTO `responses` VALUES ('536', '21', '41', '3');
INSERT INTO `responses` VALUES ('537', '21', '42', '4');
INSERT INTO `responses` VALUES ('538', '21', '43', '5');
INSERT INTO `responses` VALUES ('539', '21', '44', '1');
INSERT INTO `responses` VALUES ('540', '21', '45', '2');
INSERT INTO `responses` VALUES ('541', '21', '46', '4');
INSERT INTO `responses` VALUES ('542', '21', '47', '2');
INSERT INTO `responses` VALUES ('543', '21', '48', '5');
INSERT INTO `responses` VALUES ('544', '21', '49', '3');
INSERT INTO `responses` VALUES ('545', '21', '50', '1');
INSERT INTO `responses` VALUES ('546', '21', '51', '4');
INSERT INTO `responses` VALUES ('547', '21', '52', '5');
INSERT INTO `responses` VALUES ('548', '21', '53', '4');
INSERT INTO `responses` VALUES ('549', '21', '54', '2');
INSERT INTO `responses` VALUES ('550', '21', '55', '5');
INSERT INTO `responses` VALUES ('551', '21', '56', '1');
INSERT INTO `responses` VALUES ('552', '21', '57', '5');
INSERT INTO `responses` VALUES ('553', '21', '58', '2');
INSERT INTO `responses` VALUES ('554', '21', '59', '4');
INSERT INTO `responses` VALUES ('555', '21', '60', '4');
INSERT INTO `responses` VALUES ('556', '21', '61', '3');
INSERT INTO `responses` VALUES ('557', '21', '62', '1');
INSERT INTO `responses` VALUES ('558', '21', '63', '4');
INSERT INTO `responses` VALUES ('559', '21', '64', '5');
INSERT INTO `responses` VALUES ('560', '21', '65', '3');
INSERT INTO `responses` VALUES ('561', '21', '66', '2');
INSERT INTO `responses` VALUES ('562', '22', '5', '1');
INSERT INTO `responses` VALUES ('563', '22', '27', '2');
INSERT INTO `responses` VALUES ('564', '22', '38', '5');
INSERT INTO `responses` VALUES ('565', '22', '49', '3');
INSERT INTO `responses` VALUES ('566', '22', '2', '2');
INSERT INTO `responses` VALUES ('567', '22', '6', '4');
INSERT INTO `responses` VALUES ('568', '22', '10', '2');
INSERT INTO `responses` VALUES ('569', '22', '14', '2');
INSERT INTO `responses` VALUES ('570', '22', '19', '3');
INSERT INTO `responses` VALUES ('571', '22', '31', '4');
INSERT INTO `responses` VALUES ('572', '22', '35', '4');
INSERT INTO `responses` VALUES ('573', '22', '40', '2');
INSERT INTO `responses` VALUES ('574', '22', '60', '4');
INSERT INTO `responses` VALUES ('575', '22', '1', '4');
INSERT INTO `responses` VALUES ('576', '22', '3', '5');
INSERT INTO `responses` VALUES ('577', '22', '4', '3');
INSERT INTO `responses` VALUES ('578', '22', '7', '3');
INSERT INTO `responses` VALUES ('579', '22', '8', '5');
INSERT INTO `responses` VALUES ('580', '22', '9', '4');
INSERT INTO `responses` VALUES ('581', '22', '11', '5');
INSERT INTO `responses` VALUES ('582', '22', '12', '3');
INSERT INTO `responses` VALUES ('583', '22', '13', '4');
INSERT INTO `responses` VALUES ('584', '22', '15', '1');
INSERT INTO `responses` VALUES ('585', '22', '16', '5');
INSERT INTO `responses` VALUES ('586', '22', '17', '4');
INSERT INTO `responses` VALUES ('587', '22', '18', '5');
INSERT INTO `responses` VALUES ('588', '22', '20', '2');
INSERT INTO `responses` VALUES ('589', '22', '21', '1');
INSERT INTO `responses` VALUES ('590', '22', '22', '4');
INSERT INTO `responses` VALUES ('591', '22', '23', '5');
INSERT INTO `responses` VALUES ('592', '22', '24', '5');
INSERT INTO `responses` VALUES ('593', '22', '25', '2');
INSERT INTO `responses` VALUES ('594', '22', '26', '4');
INSERT INTO `responses` VALUES ('595', '22', '28', '5');
INSERT INTO `responses` VALUES ('596', '22', '29', '3');
INSERT INTO `responses` VALUES ('597', '22', '30', '1');
INSERT INTO `responses` VALUES ('598', '22', '32', '1');
INSERT INTO `responses` VALUES ('599', '22', '33', '3');
INSERT INTO `responses` VALUES ('600', '22', '34', '5');
INSERT INTO `responses` VALUES ('601', '22', '36', '2');
INSERT INTO `responses` VALUES ('602', '22', '37', '3');
INSERT INTO `responses` VALUES ('603', '22', '39', '1');
INSERT INTO `responses` VALUES ('604', '22', '41', '3');
INSERT INTO `responses` VALUES ('605', '22', '42', '4');
INSERT INTO `responses` VALUES ('606', '22', '43', '5');
INSERT INTO `responses` VALUES ('607', '22', '44', '1');
INSERT INTO `responses` VALUES ('608', '22', '45', '2');
INSERT INTO `responses` VALUES ('609', '22', '46', '4');
INSERT INTO `responses` VALUES ('610', '22', '47', '2');
INSERT INTO `responses` VALUES ('611', '22', '48', '5');
INSERT INTO `responses` VALUES ('612', '22', '50', '1');
INSERT INTO `responses` VALUES ('613', '22', '51', '4');
INSERT INTO `responses` VALUES ('614', '22', '53', '4');
INSERT INTO `responses` VALUES ('615', '22', '52', '5');
INSERT INTO `responses` VALUES ('616', '22', '54', '2');
INSERT INTO `responses` VALUES ('617', '22', '55', '5');
INSERT INTO `responses` VALUES ('618', '22', '56', '1');
INSERT INTO `responses` VALUES ('619', '22', '57', '5');
INSERT INTO `responses` VALUES ('620', '22', '58', '2');
INSERT INTO `responses` VALUES ('621', '22', '59', '4');
INSERT INTO `responses` VALUES ('622', '22', '61', '3');
INSERT INTO `responses` VALUES ('623', '22', '62', '1');
INSERT INTO `responses` VALUES ('624', '22', '63', '4');
INSERT INTO `responses` VALUES ('625', '22', '64', '5');
INSERT INTO `responses` VALUES ('626', '22', '65', '3');
INSERT INTO `responses` VALUES ('627', '22', '66', '2');
INSERT INTO `responses` VALUES ('628', '23', '5', '4');
INSERT INTO `responses` VALUES ('629', '23', '16', '1');
INSERT INTO `responses` VALUES ('630', '23', '9', '1');
INSERT INTO `responses` VALUES ('631', '23', '13', '5');
INSERT INTO `responses` VALUES ('632', '23', '18', '4');
INSERT INTO `responses` VALUES ('633', '23', '22', '2');
INSERT INTO `responses` VALUES ('634', '23', '26', '1');
INSERT INTO `responses` VALUES ('635', '23', '30', '2');
INSERT INTO `responses` VALUES ('636', '23', '34', '3');
INSERT INTO `responses` VALUES ('637', '23', '38', '3');
INSERT INTO `responses` VALUES ('638', '23', '42', '3');
INSERT INTO `responses` VALUES ('639', '23', '46', '4');
INSERT INTO `responses` VALUES ('640', '23', '50', '5');
INSERT INTO `responses` VALUES ('641', '23', '54', '3');
INSERT INTO `responses` VALUES ('642', '23', '63', '5');
INSERT INTO `responses` VALUES ('643', '23', '60', '5');
INSERT INTO `responses` VALUES ('644', '23', '1', '5');
INSERT INTO `responses` VALUES ('645', '23', '2', '2');
INSERT INTO `responses` VALUES ('646', '23', '3', '3');
INSERT INTO `responses` VALUES ('647', '23', '4', '5');
INSERT INTO `responses` VALUES ('648', '23', '6', '3');
INSERT INTO `responses` VALUES ('649', '23', '7', '2');
INSERT INTO `responses` VALUES ('650', '23', '8', '1');
INSERT INTO `responses` VALUES ('651', '23', '10', '4');
INSERT INTO `responses` VALUES ('652', '23', '11', '2');
INSERT INTO `responses` VALUES ('653', '23', '12', '4');
INSERT INTO `responses` VALUES ('654', '23', '14', '3');
INSERT INTO `responses` VALUES ('655', '23', '15', '2');
INSERT INTO `responses` VALUES ('656', '23', '17', '2');
INSERT INTO `responses` VALUES ('657', '23', '19', '5');
INSERT INTO `responses` VALUES ('658', '23', '20', '3');
INSERT INTO `responses` VALUES ('659', '23', '21', '1');
INSERT INTO `responses` VALUES ('660', '23', '23', '4');
INSERT INTO `responses` VALUES ('661', '23', '24', '4');
INSERT INTO `responses` VALUES ('662', '23', '25', '2');
INSERT INTO `responses` VALUES ('663', '23', '27', '4');
INSERT INTO `responses` VALUES ('664', '23', '28', '5');
INSERT INTO `responses` VALUES ('665', '23', '29', '4');
INSERT INTO `responses` VALUES ('666', '23', '31', '1');
INSERT INTO `responses` VALUES ('667', '23', '32', '2');
INSERT INTO `responses` VALUES ('668', '23', '33', '4');
INSERT INTO `responses` VALUES ('669', '23', '35', '1');
INSERT INTO `responses` VALUES ('670', '23', '36', '4');
INSERT INTO `responses` VALUES ('671', '23', '37', '5');
INSERT INTO `responses` VALUES ('672', '23', '39', '1');
INSERT INTO `responses` VALUES ('673', '23', '40', '3');
INSERT INTO `responses` VALUES ('674', '23', '41', '3');
INSERT INTO `responses` VALUES ('675', '23', '43', '3');
INSERT INTO `responses` VALUES ('676', '23', '44', '3');
INSERT INTO `responses` VALUES ('677', '23', '45', '3');
INSERT INTO `responses` VALUES ('678', '23', '47', '5');
INSERT INTO `responses` VALUES ('679', '23', '48', '3');
INSERT INTO `responses` VALUES ('680', '23', '49', '2');
INSERT INTO `responses` VALUES ('681', '23', '51', '3');
INSERT INTO `responses` VALUES ('682', '23', '52', '2');
INSERT INTO `responses` VALUES ('683', '23', '53', '4');
INSERT INTO `responses` VALUES ('684', '23', '55', '2');
INSERT INTO `responses` VALUES ('685', '23', '56', '4');
INSERT INTO `responses` VALUES ('686', '23', '57', '3');
INSERT INTO `responses` VALUES ('687', '23', '58', '1');
INSERT INTO `responses` VALUES ('688', '23', '59', '3');
INSERT INTO `responses` VALUES ('689', '23', '61', '2');
INSERT INTO `responses` VALUES ('690', '23', '62', '3');
INSERT INTO `responses` VALUES ('691', '23', '64', '2');
INSERT INTO `responses` VALUES ('692', '23', '65', '1');
INSERT INTO `responses` VALUES ('693', '23', '66', '4');
