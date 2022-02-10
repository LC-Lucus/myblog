package com.lc.blog.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 文章统计
 * @author LC-Lucus
 * @date 2021/12/26
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ArticleStatisticsDTO {
    /**
     * 日期
     */
    private String date;

    /**
     * 数量
     */
    private Integer count;
}
