package com.lc.blog.annotation;

import java.lang.annotation.*;

/**
 * 操作日志注解
 * @author LC-Lucus
 * @date 2022/1/9
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface OptLog {
    /**
     * @return 操作类型
     */
    String optType() default "";
}
