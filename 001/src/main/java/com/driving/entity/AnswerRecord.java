package com.driving.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;

/**
 * 用户答题记录实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("answer_record")
public class AnswerRecord {
    
    @TableId(type = IdType.AUTO)
    private Long id;
    
    /**
     * 用户 ID
     */
    private Long userId;
    
    /**
     * 考试记录 ID
     */
    private Long examRecordId;
    
    /**
     * 题目 ID
     */
    private Long questionId;
    
    /**
     * 用户答案
     */
    private String userAnswer;
    
    /**
     * 是否正确：0-错误，1-正确
     */
    private Integer correct;
    
    @Table(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    
    @TableLogic
    private Integer deleted;
}
