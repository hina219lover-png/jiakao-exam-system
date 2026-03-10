-- 用户收藏表
DROP TABLE IF EXISTS `user_collection`;
CREATE TABLE `user_collection` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `user_id` BIGINT NOT NULL COMMENT '用户 ID',
  `question_id` BIGINT NOT NULL COMMENT '题目 ID',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` INT DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_question` (`user_id`, `question_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- 驾考资讯表
DROP TABLE IF EXISTS `driving_news`;
CREATE TABLE `driving_news` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `title` VARCHAR(200) NOT NULL COMMENT '标题',
  `content` TEXT NOT NULL COMMENT '内容',
  `cover_image` VARCHAR(500) DEFAULT NULL COMMENT '封面图',
  `category` INT DEFAULT 1 COMMENT '分类：1-政策解读，2-考试技巧，3-行业资讯，4-通知公告',
  `view_count` INT DEFAULT 0 COMMENT '浏览量',
  `publish_time` DATETIME DEFAULT NULL COMMENT '发布时间',
  `author` VARCHAR(50) DEFAULT NULL COMMENT '作者',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` INT DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='驾考资讯表';

-- 系统配置表
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `config_key` VARCHAR(100) NOT NULL COMMENT '配置键',
  `config_value` TEXT COMMENT '配置值',
  `config_name` VARCHAR(100) DEFAULT NULL COMMENT '配置名称',
  `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` INT DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_config_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统配置表';

-- 插入测试资讯数据
INSERT INTO `driving_news` (`title`, `content`, `category`, `view_count`, `author`, `publish_time`) VALUES
('2026 年驾考新规解读', '随着交通法规的不断完善，2026 年驾考迎来了一系列新规定...', 1, 1280, '交管局', NOW()),
('科目一考试技巧大全', '想要顺利通过科目一？这些技巧你必须知道...', 2, 2560, '驾考专家', NOW()),
('电子驾驶证全面推行', '公安部宣布，全国范围内全面推行电子驾驶证...', 3, 890, '新闻网', NOW()),
('关于春节期间考场安排的通知', '根据国务院放假安排，现将春节期间各考场开放时间通知如下...', 4, 450, '车管所', NOW());

-- 插入系统配置数据
INSERT INTO `system_config` (`config_key`, `config_value`, `config_name`, `remark`) VALUES
('exam.passing_score', '90', '及格分数线', '理论考试及格分数'),
('exam.duration', '45', '考试时长', '单位：分钟'),
('exam.question_count', '100', '题目数量', '每套试卷题目数量'),
('site.name', '驾考系统', '网站名称', ''),
('site.description', '专业的驾驶理论考试学习平台', '网站描述', '');
