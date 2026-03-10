-- 创建数据库
CREATE DATABASE IF NOT EXISTS `driving_test_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `driving_test_system`;

-- 用户表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `username` VARCHAR(50) NOT NULL COMMENT '用户名',
  `password` VARCHAR(100) NOT NULL COMMENT '密码',
  `email` VARCHAR(100) NOT NULL COMMENT '邮箱',
  `phone` VARCHAR(20) DEFAULT NULL COMMENT '手机号',
  `role` INT DEFAULT 0 COMMENT '角色：0-普通用户，1-管理员',
  `status` INT DEFAULT 1 COMMENT '状态：0-禁用，1-正常',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` INT DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 题目表
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `type` INT DEFAULT 1 COMMENT '题目类型：1-单选，2-判断，3-多选',
  `content` TEXT NOT NULL COMMENT '题目内容',
  `options` JSON DEFAULT NULL COMMENT '选项（JSON 格式）',
  `answer` VARCHAR(10) NOT NULL COMMENT '答案',
  `analysis` TEXT COMMENT '解析',
  `chapter` VARCHAR(50) DEFAULT NULL COMMENT '章节',
  `difficulty` INT DEFAULT 1 COMMENT '难度：1-5',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` INT DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_chapter` (`chapter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='题目表';

-- 考试记录表
DROP TABLE IF EXISTS `exam_record`;
CREATE TABLE `exam_record` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `user_id` BIGINT NOT NULL COMMENT '用户 ID',
  `exam_type` INT DEFAULT 1 COMMENT '考试类型：1-模拟考试，2-章节练习',
  `total_score` INT DEFAULT 100 COMMENT '总分',
  `score` INT DEFAULT 0 COMMENT '得分',
  `passed` INT DEFAULT 0 COMMENT '是否及格：0-不及格，1-及格',
  `start_time` DATETIME DEFAULT NULL COMMENT '开始时间',
  `end_time` DATETIME DEFAULT NULL COMMENT '结束时间',
  `duration` INT DEFAULT 0 COMMENT '用时（秒）',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` INT DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录表';

-- 答题记录表
DROP TABLE IF EXISTS `answer_record`;
CREATE TABLE `answer_record` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `user_id` BIGINT NOT NULL COMMENT '用户 ID',
  `exam_record_id` BIGINT DEFAULT NULL COMMENT '考试记录 ID',
  `question_id` BIGINT NOT NULL COMMENT '题目 ID',
  `user_answer` VARCHAR(10) DEFAULT NULL COMMENT '用户答案',
  `correct` INT DEFAULT 0 COMMENT '是否正确：0-错误，1-正确',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` INT DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_exam_record_id` (`exam_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='答题记录表';

-- 插入测试数据
INSERT INTO `user` (`username`, `password`, `email`, `role`, `status`) VALUES
('admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@example.com', 1, 1),
('testuser', 'e10adc3949ba59abbe56e057f20f883e', 'test@example.com', 0, 1);
