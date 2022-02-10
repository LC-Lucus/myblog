package com.lc.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lc.blog.dto.OperationLogDTO;
import com.lc.blog.entity.OperationLog;
import com.lc.blog.vo.ConditionVO;
import com.lc.blog.vo.PageResult;

/**
 * 操作日志服务
 * @author LC-Lucus
 * @date 2022/1/4
 */
public interface OperationLogService extends IService<OperationLog> {
    /**
     * 查询日志列表
     *
     * @param conditionVO 条件
     * @return 日志列表
     */
    PageResult<OperationLogDTO> listOperationLogs(ConditionVO conditionVO);
}
