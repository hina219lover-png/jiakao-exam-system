package com.driving.controller;

import com.driving.common.Result;
import com.driving.dto.request.UserLoginRequest;
import com.driving.dto.request.UserRegisterRequest;
import com.driving.entity.User;
import com.driving.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 用户控制器
 */
@RestController
@RequestMapping("/api/user")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
@Tag(name = "用户管理", description = "用户注册、登录、信息管理")
public class UserController {
    
    private final UserService userService;
    
    @PostMapping("/register")
    @Operation(summary = "用户注册", description= "新用户注册账号")
    public Result<User> register(@Valid @RequestBody UserRegisterRequest request) {
        User user = userService.register(request);
        return Result.success("注册成功", user);
    }
    
    @PostMapping("/login")
    @Operation(summary = "用户登录", description = "用户名密码登录")
    public Result<Map<String, Object>> login(@Valid @RequestBody UserLoginRequest request) {
        User user = userService.login(request);
        
        Map<String, Object> data = new HashMap<>();
      data.put("id", user.getId());
      data.put("username", user.getUsername());
      data.put("email", user.getEmail());
      data.put("role", user.getRole());
        
        return Result.success("登录成功", data);
    }
    
    @GetMapping("/info/{username}")
    @Operation(summary = "获取用户信息", description= "根据用户名查询用户详细信息")
    public Result<User> getUserInfo(@PathVariable String username) {
        User user= userService.getByUsername(username);
        return Result.success(user);
    }
}
