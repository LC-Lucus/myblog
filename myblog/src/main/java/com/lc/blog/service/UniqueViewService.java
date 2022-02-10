package com.lc.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lc.blog.dto.UniqueViewDTO;
import com.lc.blog.entity.UniqueView;

import java.util.List;

/**
 * 用户量统计
 * @author LC-Lucus
 * @date 2022/1/4
 */
public interface UniqueViewService extends IService<UniqueView> {
    /**
     * 获取7天用户量统计
     *
     * @return 用户量
     */
    List<UniqueViewDTO> listUniqueViews();
}
