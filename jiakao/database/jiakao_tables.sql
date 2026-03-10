-- ============================================
-- 驾考系统数据库表结构
-- 数据库：jiakao
-- 创建时间：2026-03-10
-- ============================================

-- 1. 用户表
CREATE TABLE IF NOT EXISTS `user` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
    `username` VARCHAR(50) NOT NULL COMMENT '用户名',
    `password` VARCHAR(100) NOT NULL COMMENT '密码（加密存储）',
    `real_name` VARCHAR(50) DEFAULT NULL COMMENT '真实姓名',
    `id_card` VARCHAR(18) DEFAULT NULL COMMENT '身份证号',
    `phone` VARCHAR(11) DEFAULT NULL COMMENT '手机号',
    `email` VARCHAR(50) DEFAULT NULL COMMENT '邮箱',
    `avatar` VARCHAR(255) DEFAULT NULL COMMENT '头像 URL',
    `status` TINYINT(2) DEFAULT 1 COMMENT '状态：0-禁用，1-正常',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
    `last_login_time` DATETIME DEFAULT NULL COMMENT '最后登录时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_username` (`username`),
    UNIQUE KEY `uk_id_card` (`id_card`),
    UNIQUE KEY `uk_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 2. 管理员表
CREATE TABLE IF NOT EXISTS `admin` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
    `username` VARCHAR(50) NOT NULL COMMENT '管理员账号',
    `password` VARCHAR(100) NOT NULL COMMENT '密码',
    `role` TINYINT(2) NOT NULL DEFAULT 2 COMMENT '角色：1-超级管理员（1 号），2-普通管理员',
    `real_name` VARCHAR(50) DEFAULT NULL COMMENT '真实姓名',
    `status` TINYINT(2) DEFAULT 1 COMMENT '状态：0-禁用，1-正常',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by` BIGINT(20) DEFAULT NULL COMMENT '创建者 ID（哪个管理员添加的）',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- 3. 题目分类表
CREATE TABLE IF NOT EXISTS `category` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
    `name` VARCHAR(100) NOT NULL COMMENT '分类名称',
    `subject` TINYINT(2) NOT NULL COMMENT '所属科目：1-科目一，2-科目二，3-科目三，4-科目四',
    `parent_id` BIGINT(20) DEFAULT 0 COMMENT '父分类 ID（0 为一级分类）',
    `sort` INT(11) DEFAULT 0 COMMENT '排序',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    KEY `idx_subject` (`subject`),
    KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='题目分类表';

-- 4. 题库表
CREATE TABLE IF NOT EXISTS `question` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
    `question_no` VARCHAR(20) DEFAULT NULL COMMENT '题号',
    `type` TINYINT(2) NOT NULL COMMENT '题目类型：1-单选，2-多选，3-判断',
    `content` TEXT NOT NULL COMMENT '题目内容',
    `image_url` VARCHAR(255) DEFAULT NULL COMMENT '图片 URL（可选）',
    `option_a` VARCHAR(255) DEFAULT NULL COMMENT 'A 选项',
    `option_b` VARCHAR(255) DEFAULT NULL COMMENT 'B 选项',
    `option_c` VARCHAR(255) DEFAULT NULL COMMENT 'C 选项',
    `option_d` VARCHAR(255) DEFAULT NULL COMMENT 'D 选项',
    `answer` VARCHAR(10) NOT NULL COMMENT '正确答案（如"A"或"AB"）',
    `analysis` TEXT DEFAULT NULL COMMENT '答案解析',
    `category_id` BIGINT(20) DEFAULT NULL COMMENT '所属分类 ID',
    `difficulty` TINYINT(2) DEFAULT 1 COMMENT '难度：1-简单，2-中等，3-困难',
    `is_deleted` TINYINT(2) DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_category_id` (`category_id`),
    KEY `idx_type` (`type`),
    KEY `idx_difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='题库表';

-- 5. 考试记录表
CREATE TABLE IF NOT EXISTS `exam_record` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
    `user_id` BIGINT(20) NOT NULL COMMENT '用户 ID',
    `exam_type` TINYINT(2) NOT NULL COMMENT '考试类型：1-日常练习，2-模拟考试，3-正式考试',
    `subject` TINYINT(2) NOT NULL COMMENT '考试科目：1-科目一，2-科目三，3-科目四',
    `total_score` DECIMAL(5,2) DEFAULT 100.00 COMMENT '总分',
    `user_score` DECIMAL(5,2) DEFAULT NULL COMMENT '得分',
    `pass_score` DECIMAL(5,2) DEFAULT 90.00 COMMENT '及格分',
    `is_passed` TINYINT(2) DEFAULT NULL COMMENT '是否通过：0-否，1-是',
    `start_time` DATETIME NOT NULL COMMENT '开始时间',
    `end_time` DATETIME DEFAULT NULL COMMENT '结束时间',
    `duration` INT(11) DEFAULT NULL COMMENT '用时（秒）',
    `question_count` INT(11) DEFAULT NULL COMMENT '题目数量',
    `correct_count` INT(11) DEFAULT NULL COMMENT '正确数量',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_exam_type` (`exam_type`),
    KEY `idx_subject` (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录表';

-- 6. 考试详情表
CREATE TABLE IF NOT EXISTS `exam_detail` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
    `exam_record_id` BIGINT(20) NOT NULL COMMENT '考试记录 ID',
    `question_id` BIGINT(20) NOT NULL COMMENT '题目 ID',
    `user_answer` VARCHAR(10) DEFAULT NULL COMMENT '用户答案',
    `is_correct` TINYINT(2) DEFAULT NULL COMMENT '是否正确：0-错误，1-正确',
    `score` DECIMAL(5,2) DEFAULT NULL COMMENT '本题得分',
    `time_spent` INT(11) DEFAULT NULL COMMENT '用时（秒）',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    KEY `idx_exam_record_id` (`exam_record_id`),
    KEY `idx_question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试详情表';

-- 7. 错题本表
CREATE TABLE IF NOT EXISTS `wrong_question` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
    `user_id` BIGINT(20) NOT NULL COMMENT '用户 ID',
    `question_id` BIGINT(20) NOT NULL COMMENT '题目 ID',
    `wrong_count` INT(11) DEFAULT 1 COMMENT '错误次数',
    `last_wrong_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '最后错误时间',
    `is_mastered` TINYINT(2) DEFAULT 0 COMMENT '是否已掌握：0-否，1-是',
    `note` VARCHAR(255) DEFAULT NULL COMMENT '备注',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_question` (`user_id`, `question_id`),
    KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错题本表';

-- 8. 系统设置表
CREATE TABLE IF NOT EXISTS `system_config` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
    `config_key` VARCHAR(100) NOT NULL COMMENT '配置键',
    `config_value` VARCHAR(500) DEFAULT NULL COMMENT '配置值',
    `description` VARCHAR(255) DEFAULT NULL COMMENT '描述',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by` BIGINT(20) DEFAULT NULL COMMENT '更新人 ID',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_config_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统设置表';

-- ============================================
-- 初始化数据
-- ============================================

-- 插入默认超级管理员（1 号管理员）
-- 密码：admin123（实际应该加密存储）
INSERT INTO `admin` (`username`, `password`, `role`, `real_name`, `status`, `create_by`) 
VALUES ('admin', 'admin123', 1, '超级管理员', 1, NULL);

-- 插入默认系统配置
INSERT INTO `system_config` (`config_key`, `config_value`, `description`) VALUES
('exam_pass_score', '90', '考试及格分数'),
('exam_duration_minutes', '45', '考试时间（分钟）'),
('daily_practice_questions', '20', '每日练习题目数量'),
('mock_exam_questions', '50', '模拟考试题目数量');

-- 插入科目分类示例
INSERT INTO `category` (`name`, `subject`, `parent_id`, `sort`) VALUES
('科目一', 1, 0, 1),
('科目四', 4, 0, 2);
