package com.lc.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lc.blog.entity.WebsiteConfig;
import org.springframework.stereotype.Repository;

/**
 * 网站配置
 * @author LC-Lucus
 * @date 2021/12/24
 */
@Repository
public interface WebsiteConfigDao extends BaseMapper<WebsiteConfig> {
}
