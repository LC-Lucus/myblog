package com.lc.blog.strategy;

import org.springframework.web.multipart.MultipartFile;

/**
 * 上传策略
 * @author LC-Lucus
 * @date 2022/1/4
 */
public interface UploadStrategy {
    /**
     * 上传文件
     *
     * @param file 文件
     * @param path 上传路径
     * @return {@link String} 文件地址
     */
    String uploadFile(MultipartFile file, String path);
}
