package com.lc.blog.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 后台分类
 * @author LC-Lucus
 * @date 2021/12/26
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CategoryBackDTO {
    /**
     * 分类id
     */
    private Integer id;

    /**
     * 分类名称
     */
    private String categoryName;

    /**
     * 文章数量
     */
    private Integer articleCount;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;
}
