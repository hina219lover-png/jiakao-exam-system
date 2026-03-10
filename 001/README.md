# 驾考系统 - 启动说明

## 项目简介
这是一个基于 Spring Boot + MySQL 的驾考系统，实现了用户注册和登录功能。

## 技术栈
- **后端**: Spring Boot 3.2.0
- **数据库**: MySQL
- **ORM**: Spring Data JPA
- **前端**: HTML5 + CSS3 + JavaScript

## 环境要求
- JDK 17+
- MySQL 8.0+
- Maven 3.6+

## 启动步骤

### 1. 配置数据库

请确保已安装 MySQL 数据库，并修改配置文件中的数据库连接信息：

文件位置：`src/main/resources/application.properties`

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/driving_test_system?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai&createDatabaseIfNotExist=true
spring.datasource.username=root
spring.datasource.password=你的数据库密码
```

**注意**: 请将 `spring.datasource.password` 修改为你的 MySQL 密码

### 2. 导入依赖

在项目根目录下执行：

```bash
mvn clean install
```

或在 IDEA 中右键点击项目 -> Maven -> Reload Project

### 3. 启动项目

运行主类：`com.driving.DrivingTestApplication`

或在命令行执行：

```bash
mvn spring-boot:run
```

### 4. 访问系统

启动成功后，在浏览器中访问：

- **登录页面**: http://localhost:8080/login.html
- **注册页面**: http://localhost:8080/register.html
- **首页**: http://localhost:8080/index.html

## API 接口说明

### 1. 用户注册

**接口地址**: POST `/api/user/register`

**请求参数**:
```json
{
    "username": "用户名",
    "email": "邮箱",
    "phone": "手机号（选填）",
    "password": "密码",
    "confirmPassword": "确认密码"
}
```

**响应示例**:
```json
{
    "code": 200,
    "message": "注册成功",
    "data": {
        "id": 1,
        "username": "testuser",
        "email": "test@example.com",
        "role": 0
    }
}
```

### 2. 用户登录

**接口地址**: POST `/api/user/login`

**请求参数**:
```json
{
    "username": "用户名",
    "password": "密码"
}
```

**响应示例**:
```json
{
    "code": 200,
    "message": "登录成功",
    "data": {
        "id": 1,
        "username": "testuser",
        "email": "test@example.com",
        "role": 0
    }
}
```

## 功能特性

✅ 用户注册
✅ 用户登录
✅ 表单验证
✅ 密码加密（MD5）
✅ 会话管理（LocalStorage）
✅ 退出登录

## 注意事项

1. **数据库自动创建**: 项目首次启动时会自动创建数据库 `driving_test_system` 和用户表
2. **密码安全**: 当前使用 MD5 加密，生产环境建议使用 BCrypt 等更安全的加密方式
3. **跨域配置**: 开发环境允许所有来源跨域访问，生产环境需要限制具体域名
4. **端口配置**: 默认端口为 8080，可在 `application.properties` 中修改

## 后续开发计划

- [ ] 题库管理
- [ ] 章节练习
- [ ] 模拟考试
- [ ] 错题收藏
- [ ] 答题记录
- [ ] 成绩统计
- [ ] JWT 认证
- [ ] 管理员后台

## 常见问题

### Q: 启动时报数据库连接错误？
A: 检查 MySQL 服务是否启动，确认数据库用户名和密码正确。

### Q: 前端页面无法访问？
A: 确保后端服务已启动，并且访问地址是 `http://localhost:8080/`

### Q: 注册时提示字段验证错误？
A: 检查输入的用户名（3-50 字符）、密码（6-100 字符）、邮箱格式是否正确。
