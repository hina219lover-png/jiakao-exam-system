package com.gzy.rpsm.jiakao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class JiakaoApplicationTests {

    @Autowired
    private DataSource dataSource;

    @Test
    void contextLoads() {
    }

    /**
     * 测试数据库连接
     */
    @Test
    void testDatabaseConnection() throws SQLException {
        // 从数据源获取连接
        Connection connection = dataSource.getConnection();
        
        // 断言连接不为空
        assertNotNull(connection, "数据库连接失败！");
        
        // 检查连接是否有效
        boolean isValid = connection.isValid(5);
        System.out.println("数据库连接状态：" + (isValid ? "成功 ✅" : "失败 ❌"));
        System.out.println("数据库 URL: " + connection.getMetaData().getURL());
        System.out.println("数据库用户名：" + connection.getMetaData().getUserName());
        System.out.println("数据库产品：" + connection.getMetaData().getDatabaseProductName());
        System.out.println("数据库版本：" + connection.getMetaData().getDatabaseProductVersion());
        
        // 关闭连接
        connection.close();
    }
}
