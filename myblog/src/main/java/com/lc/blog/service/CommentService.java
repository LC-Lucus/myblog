package com.lc.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lc.blog.dto.CommentBackDTO;
import com.lc.blog.dto.CommentDTO;
import com.lc.blog.dto.ReplyDTO;
import com.lc.blog.entity.Comment;
import com.lc.blog.vo.CommentVO;
import com.lc.blog.vo.ConditionVO;
import com.lc.blog.vo.PageResult;
import com.lc.blog.vo.ReviewVO;

import java.util.List;

/**
 * 评论服务
 * @author LC-Lucus
 * @date 2022/1/4
 */
public interface CommentService extends IService<Comment> {
    /**
     * 查看评论
     *
     * @param articleId 文章id
     * @return 评论列表
     */
    PageResult<CommentDTO> listComments(Integer articleId);

    /**
     * 查看评论下的回复
     *
     * @param commentId 评论id
     * @return 回复列表
     */
    List<ReplyDTO> listRepliesByCommentId(Integer commentId);

    /**
     * 添加评论
     *
     * @param commentVO 评论对象
     */
    void saveComment(CommentVO commentVO);

    /**
     * 点赞评论
     *
     * @param commentId 评论id
     */
    void saveCommentLike(Integer commentId);

    /**
     * 审核评论
     *
     * @param reviewVO 审核信息
     */
    void updateCommentsReview(ReviewVO reviewVO);

    /**
     * 查询后台评论
     *
     * @param condition 条件
     * @return 评论列表
     */
    PageResult<CommentBackDTO> listCommentBackDTO(ConditionVO condition);

}
