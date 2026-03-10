package com.driving.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;

/**
 * 考试记录实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("exam_record")
public class ExamRecord {
    
    @TableId(type = IdType.AUTO)
    private Long id;
    
    /**
     * 用户 ID
     */
    private Long userId;
    
    /**
     * 考试类型：1-模拟考试，2-章节练习
     */
    private Integer examType;
    
    /**
     * 总分
     */
    private Integer totalScore;
    
    /**
     * 得分
     */
    private Integer score;
    
    /**
     * 是否及格：0-不及格，1-及格
     */
    private Integer passed;
    
    /**
     * 开始时间
     */
    private LocalDateTime startTime;
    
    /**
     * 结束时间
     */
    private LocalDateTime endTime;
    
    /**
     * 用时（秒）
     */
    private Integer duration;
    
    @Table(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    
    @TableLogic
    private Integer deleted;
}
