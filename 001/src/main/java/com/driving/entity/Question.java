package com.driving.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;

/**
 * 题目实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("question")
public class Question {
    
    @TableId(type = IdType.AUTO)
    private Long id;
    
    /**
     * 题目类型：1-单选，2-判断，3-多选
     */
    private Integer type;
    
    /**
     * 题目内容
     */
    private String content;
    
    /**
     * 选项（JSON 格式）
     */
    private String options;
    
    /**
     * 答案
     */
    private String answer;
    
    /**
     * 解析
     */
    private String analysis;
    
    /**
     * 章节
     */
    private String chapter;
    
    /**
     * 难度：1-5
     */
    private Integer difficulty;
    
    @Table(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    
    @Table(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
    
    @TableLogic
    private Integer deleted;
}
