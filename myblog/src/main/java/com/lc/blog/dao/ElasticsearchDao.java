package com.lc.blog.dao;

import com.lc.blog.dto.ArticleSearchDTO;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * elasticsearch
 * @author LC-Lucus
 * @date 2021/12/24
 */
public interface ElasticsearchDao extends ElasticsearchRepository<ArticleSearchDTO,Integer> {

}
