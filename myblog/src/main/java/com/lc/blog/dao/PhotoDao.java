package com.lc.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lc.blog.entity.Photo;
import org.springframework.stereotype.Repository;

/**
 * 照片映射器
 * @author LC-Lucus
 * @date 2021/12/24
 */
@Repository
public interface PhotoDao extends BaseMapper<Photo> {

}
