package com.driving.dto.response;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;

/**
 * 用户信息响应
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserProfileResponse {
    
    private Long id;
    private String username;
    private String email;
    private String phone;
    private Integer role;
    private LocalDateTime createTime;
    
    // 学习统计
    private Integer totalQuestions;      // 总做题数
    private Double accuracy;             // 正确率
    private Integer wrongCount;          // 错题数
    private Integer collectionCount;     // 收藏数
}
