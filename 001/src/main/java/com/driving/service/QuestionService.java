package com.driving.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.driving.entity.Question;

/**
 * 题目服务接口
 */
public interface QuestionService extends IService<Question> {
    
    /**
     * 分页查询题目
     */
    Page<Question> getQuestions(Page page, Integer chapter, Integer type, Integer difficulty);
    
    /**
     * 随机获取题目
     */
    Question getRandomQuestion();
}
