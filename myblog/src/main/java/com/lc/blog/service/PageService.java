package com.lc.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lc.blog.entity.Page;
import com.lc.blog.vo.PageVO;

import java.util.List;

/**
 * 页面服务
 * @author LC-Lucus
 * @date 2022/1/4
 */
public interface PageService extends IService<Page> {
    /**
     * 保存或更新页面
     *
     * @param pageVO 页面信息
     */
    void saveOrUpdatePage(PageVO pageVO);

    /**
     * 删除页面
     *
     * @param pageId 页面id
     */
    void deletePage(Integer pageId);

    /**
     * 获取页面列表
     *
     * @return {@link List <PageVO>} 页面列表
     */
    List<PageVO> listPages();
}
