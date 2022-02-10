package com.lc.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lc.blog.dao.RoleResourceDao;
import com.lc.blog.entity.RoleResource;
import com.lc.blog.service.RoleResourceService;
import org.springframework.stereotype.Service;

/**
 * 角色资源服务
 * @author LC-Lucus
 * @date 2022/1/28
 */
@Service
public class RoleResourceServiceImpl extends ServiceImpl<RoleResourceDao, RoleResource> implements RoleResourceService {
}
