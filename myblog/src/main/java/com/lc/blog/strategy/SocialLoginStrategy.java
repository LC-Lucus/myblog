package com.lc.blog.strategy;

import com.lc.blog.dto.UserInfoDTO;

/**
 * 第三方登录策略
 * @author LC-Lucus
 * @date 2022/1/8
 */
public interface SocialLoginStrategy {
    /**
     * 登录
     *
     * @param data 数据
     * @return {@link UserInfoDTO} 用户信息
     */
    UserInfoDTO login(String data);
}
