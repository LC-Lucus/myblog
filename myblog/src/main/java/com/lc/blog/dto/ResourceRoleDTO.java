package com.lc.blog.dto;

import lombok.Data;

import java.util.List;

/**
 * 资源角色
 * @author LC-Lucus
 * @date 2021/12/26
 */
@Data
public class ResourceRoleDTO {
    /**
     * 资源id
     */
    private Integer id;

    /**
     * 路径
     */
    private String url;

    /**
     * 请求方式
     */
    private String requestMethod;

    /**
     * 角色名
     */
    private List<String> roleList;
}
