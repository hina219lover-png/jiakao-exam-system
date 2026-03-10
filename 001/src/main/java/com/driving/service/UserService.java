package com.driving.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.driving.dto.request.UserLoginRequest;
import com.driving.dto.request.UserRegisterRequest;
import com.driving.dto.response.UserProfileResponse;
import com.driving.entity.User;

/**
 * 用户服务接口
 */
public interface UserService extends IService<User> {
    
    /**
     * 用户注册
     */
    User register(UserRegisterRequest request);
    
    /**
     * 用户登录
     */
    User login(UserLoginRequest request);
    
    /**
     * 根据用户名查找用户
     */
    User getByUsername(String username);
    
    /**
     * 获取用户个人信息
     */
    UserProfileResponse getUserProfile(Long userId);
}
