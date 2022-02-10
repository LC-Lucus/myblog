package com.lc.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lc.blog.dao.RoleMenuDao;
import com.lc.blog.entity.RoleMenu;
import com.lc.blog.service.RoleMenuService;
import org.springframework.stereotype.Service;

/**
 * 角色菜单服务
 * @author LC-Lucus
 * @date 2022/1/28
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuDao, RoleMenu> implements RoleMenuService {
}
