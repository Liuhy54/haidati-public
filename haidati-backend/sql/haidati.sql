/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : haidati

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 11/08/2024 15:58:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `appName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `appDesc` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用描述',
  `appIcon` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用图标',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `reviewStatus` int NOT NULL DEFAULT 0 COMMENT '审核状态：0-待审核, 1-通过, 2-拒绝',
  `reviewMessage` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核信息',
  `reviewerId` bigint NULL DEFAULT NULL COMMENT '审核人 id',
  `reviewTime` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appName`(`appName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1820111984830902274 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES (1, '自定义MBTI性格测试', '测试性格', '11', 1, 0, 1, NULL, NULL, NULL, 1, '2024-04-24 15:58:05', '2024-05-09 15:09:53', 0);
INSERT INTO `app` VALUES (2, '自定义得分测试', '测试得分', '22', 0, 0, 1, NULL, NULL, NULL, 1, '2024-04-25 11:39:30', '2024-05-09 15:09:53', 0);
INSERT INTO `app` VALUES (3, 'AI MBTI 性格测试', '快来测测你的 MBTI', '11', 1, 1, 1, NULL, NULL, NULL, 1, '2024-04-26 16:38:12', '2024-05-09 15:09:53', 0);
INSERT INTO `app` VALUES (4, 'AI 得分测试', '看看你熟悉多少首都', '22', 0, 1, 1, NULL, NULL, NULL, 1, '2024-04-26 16:38:56', '2024-05-09 15:09:53', 0);
INSERT INTO `app` VALUES (1814343028044181505, 'hahha', 'aa', 'aaaa', 0, 1, 0, NULL, NULL, NULL, 1814339234937851905, '2024-07-20 00:54:21', '2024-07-20 00:54:21', 0);
INSERT INTO `app` VALUES (1815314821370265602, 'hahha', 'aa', 'aaaa', 0, 1, 2, '拒绝', 1814339234937851905, '2024-07-22 17:24:36', 1814339234937851905, '2024-07-22 17:15:55', '2024-07-22 17:24:35', 0);
INSERT INTO `app` VALUES (1820111984830902273, '测试你对于网络世界的关注点', '题目为对于最近流行的具体网络热梗和各种热点事件，来测试你对网络世界的态度', '', 1, 1, 1, '', 2, '2024-08-04 23:10:12', 2, '2024-08-04 22:58:07', '2024-08-04 23:10:11', 0);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `questionContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目内容（json格式）',
  `appId` bigint NOT NULL COMMENT '应用 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1820113379105632258 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '[{\"options\":[{\"result\":\"I\",\"value\":\"独自工作\",\"key\":\"A\"},{\"result\":\"E\",\"value\":\"与他人合作\",\"key\":\"B\"}],\"title\":\"1. 你通常更喜欢\"},{\"options\":[{\"result\":\"J\",\"value\":\"喜欢有明确的计划\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"更愿意随机应变\",\"key\":\"B\"}],\"title\":\"2. 当安排活动时\"},{\"options\":[{\"result\":\"T\",\"value\":\"认为应该严格遵守\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"认为应灵活运用\",\"key\":\"B\"}],\"title\":\"3. 你如何看待规则\"},{\"options\":[{\"result\":\"E\",\"value\":\"经常是说话的人\",\"key\":\"A\"},{\"result\":\"I\",\"value\":\"更倾向于倾听\",\"key\":\"B\"}],\"title\":\"4. 在社交场合中\"},{\"options\":[{\"result\":\"J\",\"value\":\"先研究再行动\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"边做边学习\",\"key\":\"B\"}],\"title\":\"5. 面对新的挑战\"},{\"options\":[{\"result\":\"S\",\"value\":\"注重细节和事实\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"注重概念和想象\",\"key\":\"B\"}],\"title\":\"6. 在日常生活中\"},{\"options\":[{\"result\":\"T\",\"value\":\"更多基于逻辑分析\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"更多基于个人情感\",\"key\":\"B\"}],\"title\":\"7. 做决定时\"},{\"options\":[{\"result\":\"S\",\"value\":\"喜欢有结构和常规\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"喜欢自由和灵活性\",\"key\":\"B\"}],\"title\":\"8. 对于日常安排\"},{\"options\":[{\"result\":\"P\",\"value\":\"首先考虑可能性\",\"key\":\"A\"},{\"result\":\"J\",\"value\":\"首先考虑后果\",\"key\":\"B\"}],\"title\":\"9. 当遇到问题时\"},{\"options\":[{\"result\":\"T\",\"value\":\"时间是一种宝贵的资源\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"时间是相对灵活的概念\",\"key\":\"B\"}],\"title\":\"10. 你如何看待时间\"}]', 1, 1, '2024-04-24 16:41:53', '2024-05-09 12:28:58', 0);
INSERT INTO `question` VALUES (2, '[{\"options\":[{\"score\":0,\"value\":\"利马\",\"key\":\"A\"},{\"score\":0,\"value\":\"圣多明各\",\"key\":\"B\"},{\"score\":0,\"value\":\"圣萨尔瓦多\",\"key\":\"C\"},{\"score\":1,\"value\":\"波哥大\",\"key\":\"D\"}],\"title\":\"哥伦比亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"蒙特利尔\",\"key\":\"A\"},{\"score\":0,\"value\":\"多伦多\",\"key\":\"B\"},{\"score\":1,\"value\":\"渥太华\",\"key\":\"C\"},{\"score\":0,\"value\":\"温哥华\",\"key\":\"D\"}],\"title\":\"加拿大的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"大阪\",\"key\":\"A\"},{\"score\":1,\"value\":\"东京\",\"key\":\"B\"},{\"score\":0,\"value\":\"京都\",\"key\":\"C\"},{\"score\":0,\"value\":\"名古屋\",\"key\":\"D\"}],\"title\":\"日本的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"墨尔本\",\"key\":\"A\"},{\"score\":0,\"value\":\"悉尼\",\"key\":\"B\"},{\"score\":0,\"value\":\"布里斯班\",\"key\":\"C\"},{\"score\":1,\"value\":\"堪培拉\",\"key\":\"D\"}],\"title\":\"澳大利亚的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"雅加达\",\"key\":\"A\"},{\"score\":0,\"value\":\"曼谷\",\"key\":\"B\"},{\"score\":0,\"value\":\"胡志明市\",\"key\":\"C\"},{\"score\":0,\"value\":\"吉隆坡\",\"key\":\"D\"}],\"title\":\"印度尼西亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"上海\",\"key\":\"A\"},{\"score\":0,\"value\":\"杭州\",\"key\":\"B\"},{\"score\":1,\"value\":\"北京\",\"key\":\"C\"},{\"score\":0,\"value\":\"广州\",\"key\":\"D\"}],\"title\":\"中国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"汉堡\",\"key\":\"A\"},{\"score\":0,\"value\":\"慕尼黑\",\"key\":\"B\"},{\"score\":1,\"value\":\"柏林\",\"key\":\"C\"},{\"score\":0,\"value\":\"科隆\",\"key\":\"D\"}],\"title\":\"德国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"釜山\",\"key\":\"A\"},{\"score\":1,\"value\":\"首尔\",\"key\":\"B\"},{\"score\":0,\"value\":\"大田\",\"key\":\"C\"},{\"score\":0,\"value\":\"仁川\",\"key\":\"D\"}],\"title\":\"韩国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"瓜达拉哈拉\",\"key\":\"A\"},{\"score\":0,\"value\":\"蒙特雷\",\"key\":\"B\"},{\"score\":1,\"value\":\"墨西哥城\",\"key\":\"C\"},{\"score\":0,\"value\":\"坎昆\",\"key\":\"D\"}],\"title\":\"墨西哥的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"开罗\",\"key\":\"A\"},{\"score\":0,\"value\":\"亚历山大\",\"key\":\"B\"},{\"score\":0,\"value\":\"卢克索\",\"key\":\"C\"},{\"score\":0,\"value\":\"卡利乌比亚\",\"key\":\"D\"}],\"title\":\"埃及的首都是?\"}]', 2, 1, '2024-04-25 15:03:07', '2024-05-09 12:28:58', 0);
INSERT INTO `question` VALUES (3, '[{\"options\":[{\"result\":\"I\",\"value\":\"独自工作\",\"key\":\"A\"},{\"result\":\"E\",\"value\":\"与他人合作\",\"key\":\"B\"}],\"title\":\"1. 你通常更喜欢\"},{\"options\":[{\"result\":\"J\",\"value\":\"喜欢有明确的计划\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"更愿意随机应变\",\"key\":\"B\"}],\"title\":\"2. 当安排活动时\"},{\"options\":[{\"result\":\"T\",\"value\":\"认为应该严格遵守\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"认为应灵活运用\",\"key\":\"B\"}],\"title\":\"3. 你如何看待规则\"},{\"options\":[{\"result\":\"E\",\"value\":\"经常是说话的人\",\"key\":\"A\"},{\"result\":\"I\",\"value\":\"更倾向于倾听\",\"key\":\"B\"}],\"title\":\"4. 在社交场合中\"},{\"options\":[{\"result\":\"J\",\"value\":\"先研究再行动\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"边做边学习\",\"key\":\"B\"}],\"title\":\"5. 面对新的挑战\"},{\"options\":[{\"result\":\"S\",\"value\":\"注重细节和事实\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"注重概念和想象\",\"key\":\"B\"}],\"title\":\"6. 在日常生活中\"},{\"options\":[{\"result\":\"T\",\"value\":\"更多基于逻辑分析\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"更多基于个人情感\",\"key\":\"B\"}],\"title\":\"7. 做决定时\"},{\"options\":[{\"result\":\"S\",\"value\":\"喜欢有结构和常规\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"喜欢自由和灵活性\",\"key\":\"B\"}],\"title\":\"8. 对于日常安排\"},{\"options\":[{\"result\":\"P\",\"value\":\"首先考虑可能性\",\"key\":\"A\"},{\"result\":\"J\",\"value\":\"首先考虑后果\",\"key\":\"B\"}],\"title\":\"9. 当遇到问题时\"},{\"options\":[{\"result\":\"T\",\"value\":\"时间是一种宝贵的资源\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"时间是相对灵活的概念\",\"key\":\"B\"}],\"title\":\"10. 你如何看待时间\"}]', 3, 1, '2024-04-26 16:39:29', '2024-05-09 12:28:58', 0);
INSERT INTO `question` VALUES (4, '[{\"options\":[{\"score\":0,\"value\":\"利马\",\"key\":\"A\"},{\"score\":0,\"value\":\"圣多明各\",\"key\":\"B\"},{\"score\":0,\"value\":\"圣萨尔瓦多\",\"key\":\"C\"},{\"score\":1,\"value\":\"波哥大\",\"key\":\"D\"}],\"title\":\"哥伦比亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"蒙特利尔\",\"key\":\"A\"},{\"score\":0,\"value\":\"多伦多\",\"key\":\"B\"},{\"score\":1,\"value\":\"渥太华\",\"key\":\"C\"},{\"score\":0,\"value\":\"温哥华\",\"key\":\"D\"}],\"title\":\"加拿大的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"大阪\",\"key\":\"A\"},{\"score\":1,\"value\":\"东京\",\"key\":\"B\"},{\"score\":0,\"value\":\"京都\",\"key\":\"C\"},{\"score\":0,\"value\":\"名古屋\",\"key\":\"D\"}],\"title\":\"日本的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"墨尔本\",\"key\":\"A\"},{\"score\":0,\"value\":\"悉尼\",\"key\":\"B\"},{\"score\":0,\"value\":\"布里斯班\",\"key\":\"C\"},{\"score\":1,\"value\":\"堪培拉\",\"key\":\"D\"}],\"title\":\"澳大利亚的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"雅加达\",\"key\":\"A\"},{\"score\":0,\"value\":\"曼谷\",\"key\":\"B\"},{\"score\":0,\"value\":\"胡志明市\",\"key\":\"C\"},{\"score\":0,\"value\":\"吉隆坡\",\"key\":\"D\"}],\"title\":\"印度尼西亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"上海\",\"key\":\"A\"},{\"score\":0,\"value\":\"杭州\",\"key\":\"B\"},{\"score\":1,\"value\":\"北京\",\"key\":\"C\"},{\"score\":0,\"value\":\"广州\",\"key\":\"D\"}],\"title\":\"中国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"汉堡\",\"key\":\"A\"},{\"score\":0,\"value\":\"慕尼黑\",\"key\":\"B\"},{\"score\":1,\"value\":\"柏林\",\"key\":\"C\"},{\"score\":0,\"value\":\"科隆\",\"key\":\"D\"}],\"title\":\"德国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"釜山\",\"key\":\"A\"},{\"score\":1,\"value\":\"首尔\",\"key\":\"B\"},{\"score\":0,\"value\":\"大田\",\"key\":\"C\"},{\"score\":0,\"value\":\"仁川\",\"key\":\"D\"}],\"title\":\"韩国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"瓜达拉哈拉\",\"key\":\"A\"},{\"score\":0,\"value\":\"蒙特雷\",\"key\":\"B\"},{\"score\":1,\"value\":\"墨西哥城\",\"key\":\"C\"},{\"score\":0,\"value\":\"坎昆\",\"key\":\"D\"}],\"title\":\"墨西哥的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"开罗\",\"key\":\"A\"},{\"score\":0,\"value\":\"亚历山大\",\"key\":\"B\"},{\"score\":0,\"value\":\"卢克索\",\"key\":\"C\"},{\"score\":0,\"value\":\"卡利乌比亚\",\"key\":\"D\"}],\"title\":\"埃及的首都是?\"}]', 4, 1, '2024-04-26 16:39:29', '2024-05-09 12:28:58', 0);
INSERT INTO `question` VALUES (1815314552238555137, '[{\"title\":\"\",\"options\":[{\"result\":\"\",\"score\":0,\"value\":\"\",\"key\":\"\"}]}]', 1814343028044181505, 1814339234937851905, '2024-07-22 17:14:50', '2024-07-22 17:14:50', 0);
INSERT INTO `question` VALUES (1820113379105632257, '[{\"title\":\"你更倾向于如何关注网络热梗？\",\"options\":[{\"score\":0,\"value\":\"了解梗背后的技术原理\",\"key\":\"A\"},{\"score\":0,\"value\":\"关注网络热梗的传播速度\",\"key\":\"B\"},{\"score\":0,\"value\":\"分析热点事件的社会影响\",\"key\":\"C\"}]},{\"title\":\"你通常如何获取网络热点事件信息？\",\"options\":[{\"score\":0,\"value\":\"每天浏览网络新闻\",\"key\":\"A\"},{\"score\":0,\"value\":\"通过专业文章深度了解\",\"key\":\"B\"},{\"score\":0,\"value\":\"偶尔在微博/知乎上刷到\",\"key\":\"C\"}]},{\"title\":\"在网络热点事件中，你最关注什么方面？\",\"options\":[{\"score\":0,\"value\":\"技术发展对网络热梗的影响\",\"key\":\"A\"},{\"score\":0,\"value\":\"网络热梗的娱乐价值\",\"key\":\"B\"},{\"score\":0,\"value\":\"热点事件与个人生活的关联性\",\"key\":\"C\"}]},{\"title\":\"面对网络热梗，你的态度是？\",\"options\":[{\"score\":0,\"value\":\"参与网络热梗的传播\",\"key\":\"A\"},{\"score\":0,\"value\":\"研究网络热梗的起源\",\"key\":\"B\"},{\"score\":0,\"value\":\"对网络热梗持中立态度\",\"key\":\"C\"}]},{\"title\":\"在分析热点事件时，你更注重哪一点？\",\"options\":[{\"score\":0,\"value\":\"用数据分析热点事件趋势\",\"key\":\"A\"},{\"score\":0,\"value\":\"从人文角度解读热点事件\",\"key\":\"B\"},{\"score\":0,\"value\":\"仅关注与自身相关的热点\",\"key\":\"C\"}]},{\"title\":\"你对网络世界的关注点主要在于：\",\"options\":[{\"score\":0,\"value\":\"关注技术发展\",\"key\":\"A\"},{\"score\":0,\"value\":\"关注热点事件\",\"key\":\"B\"}]},{\"title\":\"在选择网络服务时，你最看重：\",\"options\":[{\"score\":0,\"value\":\"实时性能优化\",\"key\":\"A\"},{\"score\":0,\"value\":\"网络安全问题\",\"key\":\"B\"}]},{\"title\":\"下列哪一项是你最希望了解的网络技术：\",\"options\":[{\"score\":0,\"value\":\"5G技术评测\",\"key\":\"A\"},{\"score\":0,\"value\":\"MEC业务时延\",\"key\":\"B\"}]}]', 1820111984830902273, 2, '2024-08-04 23:03:40', '2024-08-06 22:22:30', 0);

-- ----------------------------
-- Table structure for scoring_result
-- ----------------------------
DROP TABLE IF EXISTS `scoring_result`;
CREATE TABLE `scoring_result`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图片',
  `resultProp` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果属性集合 JSON，如 [I,S,T,J]',
  `resultScoreRange` int NULL DEFAULT NULL COMMENT '结果得分范围，如 80，表示 80及以上的分数命中此结果',
  `appId` bigint NOT NULL COMMENT '应用 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1815315445814050818 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评分结果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scoring_result
-- ----------------------------
INSERT INTO `scoring_result` VALUES (1, 'ISTJ（物流师）', '忠诚可靠，被公认为务实，注重细节。', 'icon_url_istj', '[\"I\",\"S\",\"T\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (2, 'ISFJ（守护者）', '善良贴心，以同情心和责任为特点。', 'icon_url_isfj', '[\"I\",\"S\",\"F\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (3, 'INFJ（占有者）', '理想主义者，有着深刻的洞察力，善于理解他人。', 'icon_url_infj', '[\"I\",\"N\",\"F\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (4, 'INTJ（设计师）', '独立思考者，善于规划和实现目标，理性而果断。', 'icon_url_intj', '[\"I\",\"N\",\"T\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (5, 'ISTP（运动员）', '冷静自持，善于解决问题，擅长实践技能。', 'icon_url_istp', '[\"I\",\"S\",\"T\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (6, 'ISFP（艺术家）', '具有艺术感和敏感性，珍视个人空间和自由。', 'icon_url_isfp', '[\"I\",\"S\",\"F\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (7, 'INFP（治愈者）', '理想主义者，富有创造力，以同情心和理解他人著称。', 'icon_url_infp', '[\"I\",\"N\",\"F\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (8, 'INTP（学者）', '思维清晰，探索精神，独立思考且理性。', 'icon_url_intp', '[\"I\",\"N\",\"T\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (9, 'ESTP（拓荒者）', '敢于冒险，乐于冒险，思维敏捷，行动果断。', 'icon_url_estp', '[\"E\",\"S\",\"T\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (10, 'ESFP（表演者）', '热情开朗，善于社交，热爱生活，乐于助人。', 'icon_url_esfp', '[\"E\",\"S\",\"F\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (11, 'ENFP（倡导者）', '富有想象力，充满热情，善于激发他人的活力和潜力。', 'icon_url_enfp', '[\"E\",\"N\",\"F\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (12, 'ENTP（发明家）', '充满创造力，善于辩论，挑战传统，喜欢探索新领域。', 'icon_url_entp', '[\"E\",\"N\",\"T\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (13, 'ESTJ（主管）', '务实果断，善于组织和管理，重视效率和目标。', 'icon_url_estj', '[\"E\",\"S\",\"T\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (14, 'ESFJ（尽责者）', '友善热心，以协调、耐心和关怀为特点，善于团队合作。', 'icon_url_esfj', '[\"E\",\"S\",\"F\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (15, 'ENFJ（教导着）', '热情关爱，善于帮助他人，具有领导力和社交能力。', 'icon_url_enfj', '[\"E\",\"N\",\"F\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (16, 'ENTJ（统帅）', '果断自信，具有领导才能，善于规划和执行目标。', 'icon_url_entj', '[\"E\",\"N\",\"T\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (17, '首都知识大师', '你真棒棒哦，首都知识非常出色！', NULL, NULL, 9, 2, 1, '2024-04-25 15:05:44', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (18, '地理小能手！', '你对于世界各国的首都了解得相当不错，但还有一些小地方需要加强哦！', NULL, NULL, 7, 2, 1, '2024-04-25 15:05:44', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (19, '继续加油！', '还需努力哦', NULL, NULL, 0, 2, 1, '2024-04-25 15:05:44', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (1815315445814050817, 'aaa', 'aaa', 'aaa', '[\"A\",\"B\"]', 5, 1815314821370265602, 1814339234937851905, '2024-07-22 17:18:23', '2024-07-22 17:18:23', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1819274036241682434 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'yupi', '72c5387969e43032a3c95d2499b661be', NULL, NULL, '鱼皮', 'https://k.sinaimg.cn/n/sinakd20110/560/w1080h1080/20230930/915d-f3d7b580c33632b191e19afa0a858d31.jpg/w700d1q75cms.jpg', '欢迎来ai答题平台海答题学习', 'admin', '2024-05-09 11:13:13', '2024-08-02 15:32:44', 0);
INSERT INTO `user` VALUES (2, 'haiyang', '72c5387969e43032a3c95d2499b661be', NULL, NULL, '海阳', NULL, NULL, 'admin', '2024-08-02 15:55:36', '2024-08-02 15:55:36', 0);

-- ----------------------------
-- Table structure for user_answer
-- ----------------------------
DROP TABLE IF EXISTS `user_answer`;
CREATE TABLE `user_answer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户答案（JSON 数组）',
  `resultId` bigint NULL DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图标',
  `resultScore` int NULL DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2222222222222222223 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户答题记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_answer
-- ----------------------------
INSERT INTO `user_answer` VALUES (1, 1, 1, 0, '[\"A\",\"A\",\"A\",\"B\",\"A\",\"A\",\"A\",\"B\",\"B\",\"A\"]', 1, 'ISTJ（物流师）', '忠诚可靠，被公认为务实，注重细节。', 'icon_url_istj', NULL, 1, '2024-05-09 15:08:22', '2024-05-09 15:10:13', 0);
INSERT INTO `user_answer` VALUES (2, 2, 0, 0, '[\"D\",\"C\",\"B\",\"D\",\"A\",\"C\",\"C\",\"B\",\"C\",\"A\"]', 17, '首都知识大师', '你真棒棒哦，首都知识非常出色！', NULL, 10, 1, '2024-05-09 15:08:36', '2024-05-09 15:10:13', 0);
INSERT INTO `user_answer` VALUES (1815317347230482434, 1815314821370265602, 0, 0, '[\"A\",\"B\"]', NULL, NULL, NULL, NULL, NULL, 1814339234937851905, '2024-07-22 17:25:57', '2024-07-22 17:25:57', 0);
INSERT INTO `user_answer` VALUES (1815317731638444033, 1, 1, 0, '[\"A\",\"B\"]', 1, 'ISTJ（物流师）', '忠诚可靠，被公认为务实，注重细节。', 'icon_url_istj', NULL, 1814339234937851905, '2024-07-22 17:27:28', '2024-07-22 17:27:28', 0);
INSERT INTO `user_answer` VALUES (1815318533681643522, 1, 1, 0, '[\"A\",\"B\",\"B\"]', 7, 'INFP（治愈者）', '理想主义者，富有创造力，以同情心和理解他人著称。', 'icon_url_infp', NULL, 1814339234937851905, '2024-07-22 17:30:40', '2024-07-22 17:30:40', 0);
INSERT INTO `user_answer` VALUES (1815318723591340033, 1, 1, 0, '[\"A\",\"B\",\"B\",\"A\",\"B\"]', 7, 'INFP（治愈者）', '理想主义者，富有创造力，以同情心和理解他人著称。', 'icon_url_infp', NULL, 1814339234937851905, '2024-07-22 17:31:25', '2024-07-22 17:31:25', 0);
INSERT INTO `user_answer` VALUES (1815318738279792642, 1, 1, 0, '[\"A\",\"B\",\"B\",\"A\",\"B\"]', 7, 'INFP（治愈者）', '理想主义者，富有创造力，以同情心和理解他人著称。', 'icon_url_infp', NULL, 1814339234937851905, '2024-07-22 17:31:28', '2024-07-22 17:31:28', 0);
INSERT INTO `user_answer` VALUES (1815319873430421505, 2, 0, 0, '[\"A\",\"B\",\"B\",\"A\",\"B\"]', 19, '继续加油！', '还需努力哦', NULL, 10, 1814339234937851905, '2024-07-22 17:35:59', '2024-07-22 17:35:59', 0);
INSERT INTO `user_answer` VALUES (1815320275030835202, 2, 0, 0, '[\"A\",\"B\",\"B\",\"A\",\"B\",\"B\",\"A\",\"B\"]', 19, '继续加油！', '还需努力哦', NULL, 16, 1814339234937851905, '2024-07-22 17:37:35', '2024-07-22 17:37:35', 0);
INSERT INTO `user_answer` VALUES (1815320516467556353, 2, 0, 0, '[\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', 19, '继续加油！', '还需努力哦', NULL, 14, 1814339234937851905, '2024-07-22 17:38:32', '2024-07-22 17:38:32', 0);
INSERT INTO `user_answer` VALUES (1815320820617510913, 2, 0, 0, '[\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', 19, '继续加油！', '还需努力哦', NULL, 28, 1814339234937851905, '2024-07-22 17:39:45', '2024-07-22 17:39:45', 0);
INSERT INTO `user_answer` VALUES (1815321756207349762, 2, 0, 0, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', 19, '继续加油！', '还需努力哦', NULL, 22, 1814339234937851905, '2024-07-22 17:43:28', '2024-07-22 17:43:28', 0);
INSERT INTO `user_answer` VALUES (1815327557831618561, 2, 0, 0, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', 19, '继续加油！', '还需努力哦', NULL, 22, 1814339234937851905, '2024-07-22 18:06:31', '2024-07-22 18:06:31', 0);
INSERT INTO `user_answer` VALUES (1815329611765465089, 2, 0, 0, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', 17, '首都知识大师', '你真棒棒哦，首都知识非常出色！', NULL, 22, 1814339234937851905, '2024-07-22 18:14:41', '2024-07-22 18:14:41', 0);
INSERT INTO `user_answer` VALUES (1817174780563415042, 4, 0, 0, '[\"A\",\"B\",\"B\",\"B\",\"A\",\"C\",\"A\",\"B\",\"A\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 1817174362307420161, '2024-07-27 20:26:43', '2024-07-27 20:26:43', 0);
INSERT INTO `user_answer` VALUES (1817174785487527938, 4, 0, 0, '[\"A\",\"B\",\"B\",\"B\",\"A\",\"C\",\"A\",\"B\",\"A\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 1817174362307420161, '2024-07-27 20:26:45', '2024-07-27 20:26:45', 0);
INSERT INTO `user_answer` VALUES (1817175030137085953, 1, 1, 0, '[\"A\",\"A\",\"B\",\"B\",\"B\",\"A\",\"A\",\"A\",\"A\",\"A\"]', 1, 'ISTJ（物流师）', '忠诚可靠，被公认为务实，注重细节。', 'icon_url_istj', NULL, 1817174362307420161, '2024-07-27 20:27:43', '2024-07-27 20:27:43', 0);
INSERT INTO `user_answer` VALUES (1819266398846111745, 1, 1, 0, '[\"A\",\"A\",\"B\",\"B\",\"B\",\"A\",\"A\",\"A\",\"A\",\"A\"]', 1, 'ISTJ（物流师）', '忠诚可靠，被公认为务实，注重细节。', 'icon_url_istj', NULL, 1817174362307420161, '2024-08-02 14:58:04', '2024-08-02 14:58:04', 0);
INSERT INTO `user_answer` VALUES (1819267983852621826, 2, 0, 0, '[\"A\",\"B\",\"B\",\"A\",\"D\",\"C\",\"C\",\"B\",\"A\",\"A\"]', 17, '首都知识大师', '你真棒棒哦，首都知识非常出色！', NULL, 24, 1817174362307420161, '2024-08-02 15:04:22', '2024-08-02 15:04:22', 0);
INSERT INTO `user_answer` VALUES (1820109453656506370, 3, 0, 0, '[\"A\",\"A\",\"B\",\"B\",\"B\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 1, '2024-08-04 22:48:04', '2024-08-04 22:48:04', 0);
INSERT INTO `user_answer` VALUES (1820109674604064769, 3, 1, 1, '[\"A\",\"A\",\"B\",\"B\",\"B\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '协调性外向型（ESFJ）', '根据你的回答，你被评估为协调性外向型（ESFJ）。你通常更喜欢与人互动，这表明你是一个外向的人。在安排活动时，你也倾向于考虑其他人的感受和需求，显示出你的协调性。虽然你不完全反对规则，但你对它们持有一定的批判性看法，这表明你有一定的独立思考能力。在社交场合中，你能够很好地与他人相处，显示出你的社交技巧。面对新的挑战时，你愿意采取行动并勇于尝试，这反映了你的冒险精神。在日常生活中，你倾向于有序和计划性，这有助于你保持效率和条理。做决定时，你通常会考虑各种可能性，但最终会迅速作出选择。对于日常安排，你偏向于事先规划和组织。当遇到问题时，你会首先考虑实际情况和可行的解决方案。你对时间的看法表明你重视及时性和对时间的合理利用。总的来说，你是一个注重人际关系、有组织、负责任且具有实践精神的人。', NULL, NULL, 1, '2024-08-04 22:48:57', '2024-08-04 22:49:05', 0);
INSERT INTO `user_answer` VALUES (1820113732207308801, 1820111984830902273, 1, 1, '[\"B\",\"A\",\"A\",\"B\",\"A\",\"A\",\"B\",\"A\",\"A\",\"A\"]', NULL, '网络文化关注者', '根据你的回答，可以看出你是一个对网络文化和热点事件有较高关注度的用户。你了解最近流行的网络热梗，并且对网络热点事件的关注频率较高，表明你对网络世界的动态保持一定的敏感性。你认为关注这些内容对个人有积极的影响，可能是因为它们能够帮助你跟上潮流，增加与他人的共同话题。虽然你在社交平台上分享网络热梗和事件的频率不高，但你认同网络热梗在社交中的作用，并且对于网络热梗对现实生活的影响持赞同态度。面对网络热点事件，你愿意积极参与讨论，表达自己的观点。同时，当网络热梗涉及到敏感话题时，你能够保持理性的感受，对于网络热梗和事件的监管，你也持有支持立场的态度。总的来说，你是一个既关注网络文化又具有社会责任感的网络文化关注者。', NULL, NULL, 2, '2024-08-04 23:05:04', '2024-08-04 23:05:11', 0);
INSERT INTO `user_answer` VALUES (1820115835717873666, 1820111984830902273, 1, 1, '[\"A\",\"B\",\"B\",\"B\",\"A\",\"B\",\"B\",\"B\",\"B\",\"A\"]', NULL, '网络世界关注点评估', '根据您的回答，可以看出您在网络世界的关注点主要集中在热点事件和网络现象上，这表明您对网络文化和社会热点有较高的敏感度和兴趣。在技术发展趋势方面，您的选择较少，可能意味着您对技术细节的关注相对较少。在企业和运营商的网络服务方面，您的选择偏向于B选项，显示出您认为技术优势、服务质量和用户体验是网络服务中较为重要的因素。整体来看，您的关注点较为全面，既关注网络文化现象，也关注服务质量和用户体验，但可能需要加强对技术发展趋势的关注，以更全面地理解网络世界的发展动态。', NULL, NULL, 2, '2024-08-04 23:13:26', '2024-08-04 23:13:31', 0);
INSERT INTO `user_answer` VALUES (1820122685830025218, 1820111984830902273, 1, 1, '[\"C\",\"C\",\"C\",\"A\",\"A\"]', NULL, '网络文化观察家', '根据你的回答，可以看出你是一个对网络热梗和热点事件有着浓厚兴趣的用户。你倾向于通过多种渠道关注网络热梗，并且在获取信息时较为主动和全面。你对网络热点事件中的社会影响和公众态度特别关注，显示出你对网络文化有深入的理解和洞察力。在面对网络热梗时，你持有开放和接纳的态度，这有助于你更好地融入网络文化。同时，在分析热点事件时，你更注重事件的起因和背后的深层含义，这表明你不仅关注表面现象，还善于挖掘事件的核心价值。总的来说，你具备成为一个网络文化观察家的潜质，能够敏锐捕捉网络趋势，对网络现象有深刻的见解。', NULL, NULL, 2, '2024-08-04 23:40:39', '2024-08-04 23:40:45', 0);
INSERT INTO `user_answer` VALUES (1821094857318838274, 1820111984830902273, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '网络热点达人', '根据你的回答，可以看出你是一位对网络热梗和热点事件有着极高关注度的用户。你倾向于主动关注网络热梗，通过多种渠道获取热点事件信息，并且在网络热点事件中，你关注的方面广泛，不仅关注事件本身，也关注背后的社会意义和技术发展。你对网络热梗持有积极的态度，愿意深入了解并分析热点事件，注重事件的深度和广度。你的关注点不仅仅局限于娱乐，更涵盖了技术发展等前沿领域。在选择网络服务时，你更看重服务的全面性和技术先进性，显示出你对网络世界的深度参与和高度认知。你最希望了解的网络技术也反映出你对未来趋势的前瞻性思考。总的来说，你是一位对网络世界有着广泛兴趣和深入理解的网络热点达人。', NULL, NULL, 2, '2024-08-07 16:03:42', '2024-08-07 16:03:53', 0);
INSERT INTO `user_answer` VALUES (1821095023060955137, 1820111984830902273, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '网络热点达人', '根据你的回答，可以看出你是一位对网络热梗和热点事件有着极高关注度的用户。你倾向于主动关注网络热梗，通过多种渠道获取热点事件信息，并且在网络热点事件中，你关注的方面广泛，不仅关注事件本身，也关注背后的社会意义和技术发展。你对网络热梗持有积极的态度，愿意深入了解并分析热点事件，注重事件的深度和广度。你的关注点不仅仅局限于娱乐，更涵盖了技术发展等前沿领域。在选择网络服务时，你更看重服务的全面性和技术先进性，显示出你对网络世界的深度参与和高度认知。你最希望了解的网络技术也反映出你对未来趋势的前瞻性思考。总的来说，你是一位对网络世界有着广泛兴趣和深入理解的网络热点达人。', NULL, NULL, 2, '2024-08-07 16:04:22', '2024-08-07 16:04:22', 0);
INSERT INTO `user_answer` VALUES (1821106439130120194, 1820111984830902273, 1, 1, '[\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', NULL, '网络关注达人', '根据你的回答，可以看出你是一个对网络世界有着较高关注度和敏感度的人。你倾向于通过各种渠道了解网络热梗和热点事件，显示出你对网络文化有着浓厚的兴趣。在关注网络热点事件时，你不仅仅关注事件的表面，更注重深入分析和挖掘背后的原因及影响，这表明你具备较强的思考能力和批判性思维。你对网络服务的选择也反映出对信息质量和个人隐私的重视。此外，你对网络技术的关注也显示出你对未来发展有一定前瞻性。总的来说，你的网络关注点既广泛又深入，是一个对网络世界有着全面认识和理性看待的用户。', NULL, NULL, 2, '2024-08-07 16:49:44', '2024-08-07 16:49:50', 0);
INSERT INTO `user_answer` VALUES (2222222222222222222, 1820111984830902273, 0, 0, NULL, NULL, '测试2', NULL, NULL, NULL, 2, '2024-08-09 16:08:49', '2024-08-09 16:08:49', 0);

-- ----------------------------
-- Table structure for user_answer_0
-- ----------------------------
DROP TABLE IF EXISTS `user_answer_0`;
CREATE TABLE `user_answer_0`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户答案（JSON 数组）',
  `resultId` bigint NULL DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图标',
  `resultScore` int NULL DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1821196617467244546 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户答题记录分表0' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_answer_0
-- ----------------------------
INSERT INTO `user_answer_0` VALUES (1821196617467244545, 2, 0, 0, '2', NULL, NULL, NULL, NULL, NULL, 1, '2024-08-07 22:48:04', '2024-08-07 22:48:04', 0);

-- ----------------------------
-- Table structure for user_answer_1
-- ----------------------------
DROP TABLE IF EXISTS `user_answer_1`;
CREATE TABLE `user_answer_1`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户答案（JSON 数组）',
  `resultId` bigint NULL DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图标',
  `resultScore` int NULL DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1821528546087493633 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户答题记录分表1' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_answer_1
-- ----------------------------
INSERT INTO `user_answer_1` VALUES (1821196612572491777, 1, 0, 0, '1', NULL, '测试', NULL, NULL, NULL, 1, '2024-08-07 22:48:04', '2024-08-09 16:01:10', 0);
INSERT INTO `user_answer_1` VALUES (1821197147329466370, 1820111984830902273, 0, 0, '[\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', NULL, '测试', NULL, NULL, NULL, 2, '2024-08-07 22:50:10', '2024-08-09 16:01:23', 0);
INSERT INTO `user_answer_1` VALUES (1821197197984075778, 1820111984830902273, 0, 0, '[\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', NULL, '测试', NULL, NULL, NULL, 2, '2024-08-07 22:50:22', '2024-08-09 16:01:23', 0);
INSERT INTO `user_answer_1` VALUES (1821197208746659842, 1820111984830902273, 0, 0, '[\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', NULL, '测试', NULL, NULL, NULL, 2, '2024-08-07 22:50:25', '2024-08-09 16:01:23', 0);
INSERT INTO `user_answer_1` VALUES (1821197225238663170, 1820111984830902273, 0, 0, '[\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', NULL, '测试', NULL, NULL, NULL, 2, '2024-08-07 22:50:29', '2024-08-09 16:01:23', 0);
INSERT INTO `user_answer_1` VALUES (1821197355127869442, 1820111984830902273, 0, 0, '[\"A\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', NULL, '测试', NULL, NULL, NULL, 2, '2024-08-07 22:51:00', '2024-08-09 16:01:23', 0);
INSERT INTO `user_answer_1` VALUES (1821197733017845761, 1820111984830902273, 0, 0, '[\"A\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', NULL, NULL, NULL, NULL, NULL, 2, '2024-08-07 22:52:30', '2024-08-07 22:52:30', 0);
INSERT INTO `user_answer_1` VALUES (1821197882024689665, 1820111984830902273, 0, 0, '[\"A\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 2, '2024-08-07 22:53:05', '2024-08-07 22:53:05', 0);
INSERT INTO `user_answer_1` VALUES (1821198854348328962, 1820111984830902273, 0, 0, '[\"A\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 2, '2024-08-07 22:56:57', '2024-08-07 22:56:57', 0);
INSERT INTO `user_answer_1` VALUES (1821198958945882114, 1820111984830902273, 0, 0, '[\"A\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 2, '2024-08-07 22:57:22', '2024-08-07 22:57:22', 0);
INSERT INTO `user_answer_1` VALUES (1821198980705931265, 1820111984830902273, 1, 1, '[\"A\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', NULL, '网络关注达人', '根据你的回答，可以看出你是一个对网络世界有较高关注度的用户。你倾向于通过各种渠道了解网络热梗和热点事件，这表明你对新鲜事物有好奇心，愿意紧跟潮流。在关注网络热点事件时，你更注重事件的多个方面，显示出你对待信息较为全面和深入。同时，你对网络服务的选择也有明确的要求，注重服务质量。此外，你对网络技术的兴趣也反映出你对网络世界的深入探索欲望。总的来说，你的网络关注点既广泛又深入，是一个对网络信息有敏锐洞察力的用户。', NULL, NULL, 2, '2024-08-07 22:57:27', '2024-08-07 22:57:32', 0);
INSERT INTO `user_answer_1` VALUES (1821199248600322049, 1820111984830902273, 1, 1, '[\"C\",\"B\",\"A\",\"B\",\"C\",\"B\",\"A\",\"B\"]', NULL, '网络关注达人', '根据你的回答，可以看出你是一个对网络世界有着广泛关注的用户。你不仅通过多种途径获取网络热点事件信息，而且对网络热梗持有积极的态度，善于从中挖掘乐趣。在关注网络热点事件时，你更注重事件的本质和背后的技术因素，这表明你有着较深的思考和分析能力。同时，在选择网络服务时，你更看重服务的安全性和隐私保护，显示出较高的网络安全意识。你对网络技术的关注也表明你对于互联网的发展趋势有着浓厚的兴趣。总体来说，你的网络关注点是全面而深入的，是一个典型的网络关注达人。', NULL, NULL, 2, '2024-08-07 22:58:31', '2024-08-07 22:58:37', 0);
INSERT INTO `user_answer_1` VALUES (1821201371371098113, 1820111984830902273, 1, 1, '[\"C\",\"A\",\"C\",\"A\",\"C\",\"A\",\"B\",\"A\"]', NULL, '网络世界关注点分析', '根据您的回答，可以看出您在网络世界中拥有较为均衡的关注点。您倾向于通过多种途径关注网络热梗，并且对获取热点事件信息持有积极的态度。在关注网络热点事件时，您不仅关注事件的娱乐性，也注重其背后的社会意义和深度分析。您对网络热梗的态度既理性又包容，能够客观看待其对社会的影响。在分析热点事件时，您更注重事件的多角度解读和深度探讨，显示出较高的思考深度。您的关注点主要在于网络信息的广泛性和服务的高效性，同时对于前沿的网络技术也表现出了浓厚的兴趣。综合来看，您是一个既关注网络文化，又重视信息质量和技术发展的成熟网络用户。', NULL, NULL, 2, '2024-08-07 23:06:57', '2024-08-07 23:07:04', 0);
INSERT INTO `user_answer_1` VALUES (1821201467412271106, 1820111984830902273, 1, 1, '[\"C\",\"A\",\"C\",\"A\",\"C\",\"A\",\"B\",\"A\"]', NULL, '网络世界关注点分析', '根据您的回答，可以看出您在网络世界中拥有较为均衡的关注点。您倾向于通过多种途径关注网络热梗，并且对获取热点事件信息持有积极的态度。在关注网络热点事件时，您不仅关注事件的娱乐性，也注重其背后的社会意义和深度分析。您对网络热梗的态度既理性又包容，能够客观看待其对社会的影响。在分析热点事件时，您更注重事件的多角度解读和深度探讨，显示出较高的思考深度。您的关注点主要在于网络信息的广泛性和服务的高效性，同时对于前沿的网络技术也表现出了浓厚的兴趣。综合来看，您是一个既关注网络文化，又重视信息质量和技术发展的成熟网络用户。', NULL, NULL, 2, '2024-08-07 23:07:20', '2024-08-07 23:07:20', 0);
INSERT INTO `user_answer_1` VALUES (1821527956137664512, 1820111984830902273, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '网络热点关注者', '您显示出了对网络热梗和热点事件的高度关注和积极参与的态度。您倾向于通过一定的方式获取网络热点信息，并在讨论中表达自己的观点。您对网络热梗的态度是积极的，可能意味着您乐于接受新鲜事物，对网络文化有着浓厚的兴趣。在分析热点事件时，您更注重细节和深入探讨，显示出一种求知若渴的精神。您对网络世界的关注点主要集中在热点事件和文化现象上，这表明您可能是社交媒体的活跃用户，喜欢紧跟潮流。在选择网络服务时，您最看重可能与获取信息和参与讨论相关的服务质量。此外，您对于网络技术的兴趣也较为浓厚，表明您对于互联网的发展趋势保持敏感。总的来说，您是一个对网络世界充满热情的积极关注者。', NULL, NULL, 2, '2024-08-08 20:45:55', '2024-08-08 20:46:03', 0);
INSERT INTO `user_answer_1` VALUES (1821528546087493632, 1820111984830902273, 1, 1, '[\"C\",\"C\",\"C\",\"C\",\"C\",\"B\",\"B\",\"B\"]', NULL, '网络关注达人', '根据你的回答，可以看出你是一个对网络世界有深入了解的用户。你更倾向于通过多种渠道关注网络热梗，获取网络热点事件信息，显示出你对网络资讯的高度敏感性和广泛兴趣。在网络热点事件中，你最关注的方面以及分析事件时注重的点都表明你对事件的深度和影响有较高的要求。此外，你对网络世界的关注点不仅仅局限于娱乐，更看重网络服务的质量和技术的未来发展。这表明你是一个既关注网络文化又重视技术发展的网络关注达人。', NULL, NULL, 2, '2024-08-08 20:47:19', '2024-08-08 20:47:24', 0);

SET FOREIGN_KEY_CHECKS = 1;
