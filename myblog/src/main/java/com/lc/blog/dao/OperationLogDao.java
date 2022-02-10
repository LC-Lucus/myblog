package com.lc.blog.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lc.blog.entity.OperationLog;
import org.springframework.stereotype.Repository;

/**
 * 操作日志
 * @author LC-Lucus
 * @date 2021/12/24
 */
@Repository
public interface OperationLogDao extends BaseMapper<OperationLog> {

}
