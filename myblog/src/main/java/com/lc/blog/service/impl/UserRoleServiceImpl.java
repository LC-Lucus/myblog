package com.lc.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lc.blog.dao.UserRoleDao;
import com.lc.blog.entity.UserRole;
import com.lc.blog.service.UserRoleService;
import org.springframework.stereotype.Service;

/**
 * 用户角色服务
 * @author LC-Lucus
 * @date 2022/1/7
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleDao, UserRole> implements UserRoleService {
}
