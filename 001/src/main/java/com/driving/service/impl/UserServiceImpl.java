package com.driving.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.driving.dto.request.UserLoginRequest;
import com.driving.dto.request.UserRegisterRequest;
import com.driving.entity.User;
import com.driving.exception.BizException;
import com.driving.mapper.UserMapper;
import com.driving.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.nio.charset.StandardCharsets;

/**
 * 用户服务实现类
 */
@Service
@RequiredArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    
    @Override
    public User register(UserRegisterRequest request) {
        // 检查用户名是否存在
        Long count = this.count(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, request.getUsername()));
        if (count > 0) {
            throw new BizException("用户名已存在");
        }
        
        // 检查邮箱是否存在
        count = this.count(new LambdaQueryWrapper<User>()
                .eq(User::getEmail, request.getEmail()));
        if (count > 0) {
            throw new BizException("邮箱已被注册");
        }
        
        // 检查密码一致性
        if (!request.getPassword().equals(request.getConfirmPassword())) {
            throw new BizException("两次输入的密码不一致");
        }
        
        // 创建用户
        User user= new User();
      user.setUsername(request.getUsername());
      user.setPassword(hashPassword(request.getPassword()));
      user.setEmail(request.getEmail());
      user.setPhone(request.getPhone());
      user.setRole(0);
      user.setStatus(1);
        
        this.save(user);
        return user;
    }
    
    @Override
    public User login(UserLoginRequest request) {
        User user= this.getOne(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, request.getUsername()));
        
        if (user == null) {
            throw new BizException("用户名或密码错误");
        }
        
        String hashedPassword = hashPassword(request.getPassword());
        if (!hashedPassword.equals(user.getPassword())) {
            throw new BizException("用户名或密码错误");
        }
        
        return user;
    }
    
    @Override
    public User getByUsername(String username) {
        return this.getOne(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, username));
    }
    
    /**
     * 密码加密（MD5）
     */
    private String hashPassword(String password) {
        return DigestUtils.md5DigestAsHex(password.getBytes(StandardCharsets.UTF_8));
    }
    
    @Override
    public com.driving.dto.response.UserProfileResponse getUserProfile(Long userId) {
        User user = this.getById(userId);
        if (user == null) {
            throw new BizException("用户不存在");
        }
        
        com.driving.dto.response.UserProfileResponse response = 
            new com.driving.dto.response.UserProfileResponse();
       response.setId(user.getId());
       response.setUsername(user.getUsername());
       response.setEmail(user.getEmail());
       response.setPhone(user.getPhone());
       response.setRole(user.getRole());
       response.setCreateTime(user.getCreateTime());
        
        // TODO: 统计学习数据（需要关联其他表）
        response.setTotalQuestions(0);
        response.setAccuracy(0.0);
        response.setWrongCount(0);
        response.setCollectionCount(0);
        
        return response;
    }
}
