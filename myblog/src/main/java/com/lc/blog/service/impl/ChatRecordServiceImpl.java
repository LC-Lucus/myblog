package com.lc.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lc.blog.dao.ChatRecordDao;
import com.lc.blog.entity.ChatRecord;
import com.lc.blog.service.ChatRecordService;
import org.springframework.stereotype.Service;

/**
 * 聊天记录服务
 * @author LC-Lucus
 * @date 2022/1/28
 */
@Service
public class ChatRecordServiceImpl extends ServiceImpl<ChatRecordDao, ChatRecord> implements ChatRecordService {
}
