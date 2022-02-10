package com.lc.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lc.blog.dao.WebsiteConfigDao;
import com.lc.blog.entity.WebsiteConfig;
import com.lc.blog.service.WebsiteConfigService;
import org.springframework.stereotype.Service;

/**
 * 网站配置服务
 * @author LC-Lucus
 * @date 2022/1/7
 */
@Service
public class WebsiteConfigServiceImpl extends ServiceImpl<WebsiteConfigDao, WebsiteConfig> implements WebsiteConfigService {
}
