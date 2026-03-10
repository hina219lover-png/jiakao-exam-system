package com.driving.exception;

import com.driving.common.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理器
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {
    
    /**
     * 处理参数验证异常
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result<String> handleValidationException(MethodArgumentNotValidException e) {
        String message = e.getBindingResult().getFieldErrors().stream()
                .map(error -> error.getField() + ": " + error.getDefaultMessage())
                .reduce((s1, s2) -> s1 + "; " + s2)
                .orElse("参数验证失败");
        log.warn("参数验证失败：{}", message);
        return Result.error(400, message);
    }
    
    /**
     * 处理绑定异常
     */
    @ExceptionHandler(BindException.class)
    public Result<String> handleBindException(BindException e) {
        String message = e.getBindingResult().getFieldErrors().stream()
                .map(error -> error.getField() + ": " + error.getDefaultMessage())
                .reduce((s1, s2) -> s1 + "; " + s2)
                .orElse("参数绑定失败");
        log.warn("参数绑定失败：{}", message);
        return Result.error(400, message);
    }
    
    /**
     * 处理业务异常
     */
    @ExceptionHandler(RuntimeException.class)
    public Result<String> handleRuntimeException(RuntimeException e) {
        log.error("业务异常：{}", e.getMessage(), e);
        return Result.error(e.getMessage());
    }
    
    /**
     * 处理所有其他异常
     */
    @ExceptionHandler(Exception.class)
    public Result<String> handleGeneralException(Exception e) {
        log.error("系统异常：{}", e.getMessage(), e);
        return Result.error("系统错误：" + e.getMessage());
    }
}
