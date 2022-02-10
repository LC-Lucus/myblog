package com.lc.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lc.blog.entity.UserRole;
import org.springframework.stereotype.Repository;

/**
 * 用户角色
 * @author LC-Lucus
 * @date 2021/12/24
 */
@Repository
public interface UserRoleDao extends BaseMapper<UserRole> {
}
