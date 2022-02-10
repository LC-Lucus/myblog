package com.lc.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lc.blog.entity.UserInfo;
import org.springframework.stereotype.Repository;

/**
 * 用户信息
 * @author LC-Lucus
 * @date 2021/12/24
 */
@Repository
public interface UserInfoDao extends BaseMapper<UserInfo> {
}
