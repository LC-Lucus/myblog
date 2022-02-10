package com.lc.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lc.blog.entity.Resource;
import org.springframework.stereotype.Repository;

/**
 * 资源
 * @author LC-Lucus
 * @date 2021/12/24
 */
@Repository
public interface ResourceDao extends BaseMapper<Resource> {
}
