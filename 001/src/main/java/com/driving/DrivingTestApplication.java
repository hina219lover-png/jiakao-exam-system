package com.driving;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 驾考系统主启动类
 */
@SpringBootApplication
public class DrivingTestApplication {
    
    public static void main(String[] args) {
        SpringApplication.run(DrivingTestApplication.class, args);
        System.out.println("====================================");
        System.out.println("驾考系统启动成功！");
        System.out.println("访问地址：http://localhost:8080");
        System.out.println("====================================");
    }
}
