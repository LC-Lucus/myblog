package com.lc.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lc.blog.dao.ArticleTagDao;
import com.lc.blog.entity.ArticleTag;
import com.lc.blog.service.ArticleTagService;
import org.springframework.stereotype.Service;

/**
 * 文章标签服务
 * @author LC-Lucus
 * @date 2022/1/26
 */
@Service
public class ArticleTagServiceImpl extends ServiceImpl<ArticleTagDao, ArticleTag> implements ArticleTagService {
}
