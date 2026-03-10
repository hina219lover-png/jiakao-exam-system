package com.driving.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;

/**
 * 用户实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("user")
public class User {
    
    @TableId(type = IdType.AUTO)
    private Long id;
    
    private String username;
    
    private String password;
    
    private String email;
    
    private String phone;
    
    /**
     * 角色：0-普通用户，1-管理员
     */
    private Integer role;
    
    /**
     * 状态：0-禁用，1-正常
     */
    private Integer status;
    
    @Table(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    
    @Table(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
    
    @TableLogic
    private Integer deleted;
}
