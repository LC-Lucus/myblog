package com.lc.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lc.blog.entity.ChatRecord;
import org.springframework.stereotype.Repository;

/**
 * 聊天记录
 * @author LC-Lucus
 * @date 2021/12/24
 */
@Repository
public interface ChatRecordDao extends BaseMapper<ChatRecord> {

}
