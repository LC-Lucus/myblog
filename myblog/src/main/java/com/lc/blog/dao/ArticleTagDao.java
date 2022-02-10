package com.lc.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lc.blog.entity.ArticleTag;
import org.springframework.stereotype.Repository;

/**
 * 文章标签
 * @author LC-Lucus
 * @date 2021/12/24
 */
@Repository
public interface ArticleTagDao extends BaseMapper<ArticleTag> {

}
