package com.lc.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lc.blog.entity.Message;
import org.springframework.stereotype.Repository;

/**
 * 留言
 * @author LC-Lucus
 * @date 2021/12/24
 */
@Repository
public interface MessageDao extends BaseMapper<Message> {

}
