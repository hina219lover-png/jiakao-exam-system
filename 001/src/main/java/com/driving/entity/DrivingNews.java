package com.driving.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;

/**
 * 驾考资讯表
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("driving_news")
public class DrivingNews {
    
    @TableId(type = IdType.AUTO)
    private Long id;
    
    /**
     * 标题
     */
    private String title;
    
    /**
     * 内容
     */
    private String content;
    
    /**
     * 封面图
     */
    private String coverImage;
    
    /**
     * 分类：1-政策解读，2-考试技巧，3-行业资讯，4-通知公告
     */
    private Integer category;
    
    /**
     * 浏览量
     */
    private Integer viewCount;
    
    /**
     * 发布时间
     */
    private LocalDateTime publishTime;
    
    /**
     * 作者
     */
    private String author;
    
    @Table(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    
    @Table(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
    
    @TableLogic
    private Integer deleted;
}
