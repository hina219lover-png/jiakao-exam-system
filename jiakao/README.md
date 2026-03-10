# 驾考系统 (Jiakao Exam System)

## 📋 项目简介
基于 Spring Boot + MyBatis-Plus 的驾考学习考试系统，支持科目一、科目四的题库练习、模拟考试等功能。

## 🛠️ 技术栈

### 后端
- Java 17
- Spring Boot 2.7.6
- MyBatis-Plus 3.5.3.1
- MySQL 8.0
- HikariCP（数据库连接池）

### 前端（待开发）
- Vue.js + Element UI（计划）

## 📊 数据库设计

### 已完成的表（8 张）
1. `user` - 用户表
2. `admin` - 管理员表
3. `category` - 题目分类表
4. `question` - 题库表
5. `exam_record` - 考试记录表
6. `exam_detail` - 考试详情表
7. `wrong_question` - 错题本表
8. `system_config` - 系统设置表

详细表结构见：[database/jiakao_tables.sql](database/jiakao_tables.sql)

## 🎯 功能模块

### 用户端
- [ ] 用户注册/登录
- [ ] 日常练习
- [ ] 模拟考试
- [ ] 错题本
- [ ] 成绩查询

### 管理端
- [ ] 题库管理
- [ ] 用户管理
- [ ] 考试管理
- [ ] 系统设置
- [ ] 证书发放

## 📁 项目结构
```
jiakao/
├── database/           # 数据库相关脚本
├── src/
│   ├── main/
│   │   ├── java/      # Java 源代码
│   │   └── resources/ # 配置文件
│   └── test/          # 测试代码
├── pom.xml            # Maven 配置
└── application.yml    # 应用配置
```

## 🚀 快速开始

### 1. 环境要求
- JDK 17+
- MySQL 8.0+
- Maven 3.6+

### 2. 数据库初始化
```bash
mysql -u root -p < database/jiakao_tables.sql
```

### 3. 修改配置
编辑 `src/main/resources/application.yml` 中的数据库连接信息

### 4. 运行项目
```bash
mvn spring-boot:run
```

## 👥 开发团队
- 后端开发：[你的名字]
- 前端开发：[待定]

## 📅 开发进度
- ✅ 2026-03-10：完成数据库设计和建表
- ✅ 2026-03-10：完成基础框架搭建和数据库连接
- ⏳ 待办：后端 API 接口开发
- ⏳ 待办：前端页面开发

## 📄 License
MIT License
