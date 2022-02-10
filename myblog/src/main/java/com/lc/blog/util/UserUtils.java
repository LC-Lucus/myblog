package com.lc.blog.util;

import com.lc.blog.dto.UserDetailDTO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * 用户工具类
 * @author LC-Lucus
 * @date 2022/1/5
 */
@Component
public class UserUtils {
    /**
     * 获取当前登录用户
     *
     * @return 用户登录信息
     */
    public static UserDetailDTO getLoginUser() {
        return (UserDetailDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

}
