package com.lc.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lc.blog.dto.FriendLinkBackDTO;
import com.lc.blog.dto.FriendLinkDTO;
import com.lc.blog.entity.FriendLink;
import com.lc.blog.vo.ConditionVO;
import com.lc.blog.vo.FriendLinkVO;
import com.lc.blog.vo.PageResult;

import java.util.List;

/**
 * 友链服务
 * @author LC-Lucus
 * @date 2022/1/4
 */
public interface FriendLinkService extends IService<FriendLink> {
    /**
     * 查看友链列表
     *
     * @return 友链列表
     */
    List<FriendLinkDTO> listFriendLinks();

    /**
     * 查看后台友链列表
     *
     * @param condition 条件
     * @return 友链列表
     */
    PageResult<FriendLinkBackDTO> listFriendLinkDTO(ConditionVO condition);

    /**
     * 保存或更新友链
     *
     * @param friendLinkVO 友链
     */
    void saveOrUpdateFriendLink(FriendLinkVO friendLinkVO);

}
