package com.driving.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;

/**
 * 用户收藏表
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("user_collection")
public class UserCollection {
    
    @TableId(type = IdType.AUTO)
    private Long id;
    
    /**
     * 用户 ID
     */
    private Long userId;
    
    /**
     * 题目 ID
     */
    private Long questionId;
    
    @Table(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    
    @TableLogic
    private Integer deleted;
}
