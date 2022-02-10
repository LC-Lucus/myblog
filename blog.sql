/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 02/02/2022 16:28:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '作者',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '文章分类',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章类型 1原创 2转载 3翻译',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原文链接',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 0否 1是',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除  0否 1是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值 1公开 2私密 3评论可见',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `ft_search`(`article_content`)
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES (49, 1, 184, 'https://blog-oss-2022-2-1.oss-cn-shanghai.aliyuncs.com/articles/f751cba3a4cd6381611bb4ec97d35e77.jpg', '部署成功', '恭喜你已经完成博客的部署！', 1, '', 0, 0, 1, '2022-02-02 11:00:04', '2022-02-02 12:04:03');

-- ----------------------------
-- Table structure for tb_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_tag`;
CREATE TABLE `tb_article_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_tag_1`(`article_id`) USING BTREE,
  INDEX `fk_article_tag_2`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 497 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_article_tag
-- ----------------------------
INSERT INTO `tb_article_tag` VALUES (495, 47, 27);
INSERT INTO `tb_article_tag` VALUES (496, 48, 28);
INSERT INTO `tb_article_tag` VALUES (499, 49, 27);

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 332 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (184, '测试分类', '2021-08-12 15:50:57', NULL);

-- ----------------------------
-- Table structure for tb_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_chat_record`;
CREATE TABLE `tb_chat_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '聊天内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip来源',
  `type` tinyint(4) NOT NULL COMMENT '类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_chat_record
-- ----------------------------

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '评论用户Id',
  `article_id` int(11) NULL DEFAULT NULL COMMENT '评论文章id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `reply_user_id` int(11) NULL DEFAULT NULL COMMENT '回复用户id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父评论id',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除  0否 1是',
  `is_review` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否审核',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comment_user`(`user_id`) USING BTREE,
  INDEX `fk_comment_article`(`article_id`) USING BTREE,
  INDEX `fk_comment_parent`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 426 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_friend_link`;
CREATE TABLE `tb_friend_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接名',
  `link_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接头像',
  `link_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接地址',
  `link_intro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接介绍',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_friend_link_user`(`link_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_friend_link
-- ----------------------------
INSERT INTO `tb_friend_link` VALUES (21, '曙光的个人博客', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/avatar/f105ac3c1a977cafc29a07ddd1a9fb0e.jpg?versionId=CAEQGhiBgID4gvTR9RciIDZkYjdlMzliZjI5MjQyYzdhNDAzMGQ0ZWE2ZDA0Mjcw', 'chaolc.top', '心中有党，前途光明', '2022-02-01 09:25:29', '2022-02-01 17:16:29');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单icon',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `order_num` tinyint(1) NOT NULL COMMENT '排序',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父id',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏  0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES (1, '首页', '/', '/home/Home.vue', 'el-icon-myshouye', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 1, NULL, 0);
INSERT INTO `tb_menu` VALUES (2, '文章管理', '/article-submenu', 'Layout', 'el-icon-mywenzhang-copy', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 2, NULL, 0);
INSERT INTO `tb_menu` VALUES (3, '消息管理', '/message-submenu', 'Layout', 'el-icon-myxiaoxi', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 3, NULL, 0);
INSERT INTO `tb_menu` VALUES (4, '系统管理', '/system-submenu', 'Layout', 'el-icon-myshezhi', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 5, NULL, 0);
INSERT INTO `tb_menu` VALUES (5, '个人中心', '/setting', '/setting/Setting.vue', 'el-icon-myuser', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 7, NULL, 0);
INSERT INTO `tb_menu` VALUES (6, '发布文章', '/articles', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 1, 2, 0);
INSERT INTO `tb_menu` VALUES (7, '修改文章', '/articles/*', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 2, 2, 1);
INSERT INTO `tb_menu` VALUES (8, '文章列表', '/article-list', '/article/ArticleList.vue', 'el-icon-mywenzhangliebiao', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 3, 2, 0);
INSERT INTO `tb_menu` VALUES (9, '分类管理', '/categories', '/category/Category.vue', 'el-icon-myfenlei', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 4, 2, 0);
INSERT INTO `tb_menu` VALUES (10, '标签管理', '/tags', '/tag/Tag.vue', 'el-icon-myicontag', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 5, 2, 0);
INSERT INTO `tb_menu` VALUES (11, '评论管理', '/comments', '/comment/Comment.vue', 'el-icon-mypinglunzu', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 1, 3, 0);
INSERT INTO `tb_menu` VALUES (12, '留言管理', '/messages', '/message/Message.vue', 'el-icon-myliuyan', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 2, 3, 0);
INSERT INTO `tb_menu` VALUES (13, '用户列表', '/users', '/user/User.vue', 'el-icon-myyonghuliebiao', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 1, 202, 0);
INSERT INTO `tb_menu` VALUES (14, '角色管理', '/roles', '/role/Role.vue', 'el-icon-myjiaoseliebiao', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 2, 213, 0);
INSERT INTO `tb_menu` VALUES (15, '接口管理', '/resources', '/resource/Resource.vue', 'el-icon-myjiekouguanli', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 2, 213, 0);
INSERT INTO `tb_menu` VALUES (16, '菜单管理', '/menus', '/menu/Menu.vue', 'el-icon-mycaidan', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 2, 213, 0);
INSERT INTO `tb_menu` VALUES (17, '友链管理', '/links', '/friendLink/FriendLink.vue', 'el-icon-mydashujukeshihuaico-', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 3, 4, 0);
INSERT INTO `tb_menu` VALUES (18, '关于我', '/about', '/about/About.vue', 'el-icon-myguanyuwo', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 4, 4, 0);
INSERT INTO `tb_menu` VALUES (19, '日志管理', '/log-submenu', 'Layout', 'el-icon-myguanyuwo', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 6, NULL, 0);
INSERT INTO `tb_menu` VALUES (20, '操作日志', '/operation/log', '/log/Operation.vue', 'el-icon-myguanyuwo', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 1, 19, 0);
INSERT INTO `tb_menu` VALUES (201, '在线用户', '/online/users', '/user/Online.vue', 'el-icon-myyonghuliebiao', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 7, 202, 0);
INSERT INTO `tb_menu` VALUES (202, '用户管理', '/users-submenu', 'Layout', 'el-icon-myyonghuliebiao', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 4, NULL, 0);
INSERT INTO `tb_menu` VALUES (205, '相册管理', '/album-submenu', 'Layout', 'el-icon-myimage-fill', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 5, NULL, 0);
INSERT INTO `tb_menu` VALUES (206, '相册列表', '/albums', '/album/Album.vue', 'el-icon-myzhaopian', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 1, 205, 0);
INSERT INTO `tb_menu` VALUES (208, '照片管理', '/albums/:albumId', '/album/Photo.vue', 'el-icon-myzhaopian', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 1, 205, 1);
INSERT INTO `tb_menu` VALUES (209, '页面管理', '/pages', '/page/Page.vue', 'el-icon-myyemianpeizhi', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 2, 4, 0);
INSERT INTO `tb_menu` VALUES (210, '照片回收站', '/photos/delete', '/album/Delete.vue', 'el-icon-myhuishouzhan', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 3, 205, 1);
INSERT INTO `tb_menu` VALUES (213, '权限管理', '/permission-submenu', 'Layout', 'el-icon-mydaohanglantubiao_quanxianguanli', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 4, NULL, 0);
INSERT INTO `tb_menu` VALUES (214, '网站管理', '/website', '/website/Website.vue', 'el-icon-myxitong', '2022-01-26 14:05:24', '2022-02-02 15:20:31', 1, 4, 0);

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `message_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户地址',
  `time` tinyint(1) NULL DEFAULT NULL COMMENT '弹幕速度',
  `is_review` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否审核',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_log`;
CREATE TABLE `tb_operation_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `opt_module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作模块',
  `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
  `opt_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作url',
  `opt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作方法',
  `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
  `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返回数据',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 695 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for tb_page
-- ----------------------------
DROP TABLE IF EXISTS `tb_page`;
CREATE TABLE `tb_page`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `page_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面名',
  `page_label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面标签',
  `page_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面封面',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 903 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '页面' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_page
-- ----------------------------
INSERT INTO `tb_page` VALUES (1, '首页', 'home', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/4733b93f1af13a9b13f74582eea1695d.png', '2022-01-04 12:35:50', '2022-02-02 10:14:49');
INSERT INTO `tb_page` VALUES (2, '归档', 'archive', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/73dbca43fe500aea2b42cdfa0aa6a5ce.jpg', '2022-01-04 12:35:50', '2022-02-02 10:45:52');
INSERT INTO `tb_page` VALUES (3, '分类', 'category', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/57086cf2926f3a189338aa705b250919.jpg', '2022-01-04 12:35:50', '2022-02-02 10:22:00');
INSERT INTO `tb_page` VALUES (4, '标签', 'tag', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/c7b7b96f986d21baa35d422caba0271b.jpg', '2022-01-04 12:35:50', '2022-02-02 10:23:53');
INSERT INTO `tb_page` VALUES (5, '相册', 'album', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/689792948ef0d2db13c39cbed393098e.jpg', '2022-01-04 12:35:50', '2022-02-02 10:25:03');
INSERT INTO `tb_page` VALUES (6, '友链', 'link', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/86749558004f303123f58f56f2774af4.jpg', '2022-01-04 12:35:50', '2022-02-02 10:26:50');
INSERT INTO `tb_page` VALUES (7, '关于', 'about', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/f51ba51867068a4fe7e8b86341f9ac5b.jpg', '2022-01-04 12:35:50', '2022-02-02 10:28:27');
INSERT INTO `tb_page` VALUES (8, '留言', 'message', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/35ad9ef7f08bb14390bd2234cb643bc1.jpg', '2022-01-04 12:35:50', '2022-02-02 10:42:53');
INSERT INTO `tb_page` VALUES (9, '个人中心', 'user', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/d5ede2ed8edd7718a29d4ef04f26dba3.jpg', '2022-01-04 12:35:50', '2022-02-02 10:42:36');
INSERT INTO `tb_page` VALUES (10, '文章列表', 'articleList', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/config/86c5332be3b9de9365948a637d193a48.png', '2022-01-04 12:35:50', '2022-02-02 10:48:14');

-- ----------------------------
-- Table structure for tb_photo
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo`;
CREATE TABLE `tb_photo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_id` int(11) NOT NULL COMMENT '相册id',
  `photo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片名',
  `photo_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片描述',
  `photo_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片地址',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '照片' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_photo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo_album`;
CREATE TABLE `tb_photo_album`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册名',
  `album_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册描述',
  `album_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册封面',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值 1公开 2私密',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '相册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_photo_album
-- ----------------------------

-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限路径',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父权限id',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否匿名访问 0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 278 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES (165, '分类模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (166, '博客信息模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (167, '友链模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (168, '文章模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (169, '日志模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (170, '标签模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (171, '照片模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (172, '用户信息模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (173, '用户账号模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (174, '留言模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (175, '相册模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (176, '菜单模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (177, '角色模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (178, '评论模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (179, '资源模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (180, '页面模块', NULL, NULL, NULL, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (181, '查看博客信息', '/', 'GET', 166, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (182, '查看关于我信息', '/about', 'GET', 166, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (183, '查看后台信息', '/admin', 'GET', 166, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (184, '修改关于我信息', '/admin/about', 'PUT', 166, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (185, '查看后台文章', '/admin/articles', 'GET', 168, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (186, '添加或修改文章', '/admin/articles', 'POST', 168, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (187, '恢复或删除文章', '/admin/articles', 'PUT', 168, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (188, '物理删除文章', '/admin/articles', 'DELETE', 168, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (189, '上传文章图片', '/admin/articles/images', 'POST', 168, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (190, '修改文章置顶', '/admin/articles/top', 'PUT', 168, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (191, '根据id查看后台文章', '/admin/articles/*', 'GET', 168, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (192, '查看后台分类列表', '/admin/categories', 'GET', 165, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (193, '添加或修改分类', '/admin/categories', 'POST', 165, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (194, '删除分类', '/admin/categories', 'DELETE', 165, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (195, '搜索文章分类', '/admin/categories/search', 'GET', 165, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (196, '查询后台评论', '/admin/comments', 'GET', 178, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (197, '删除评论', '/admin/comments', 'DELETE', 178, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (198, '审核评论', '/admin/comments/review', 'PUT', 178, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (199, '查看后台友链列表', '/admin/links', 'GET', 167, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (200, '保存或修改友链', '/admin/links', 'POST', 167, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (201, '删除友链', '/admin/links', 'DELETE', 167, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (202, '查看菜单列表', '/admin/menus', 'GET', 176, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (203, '新增或修改菜单', '/admin/menus', 'POST', 176, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (204, '删除菜单', '/admin/menus/*', 'DELETE', 176, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (205, '查看后台留言列表', '/admin/messages', 'GET', 174, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (206, '删除留言', '/admin/messages', 'DELETE', 174, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (207, '审核留言', '/admin/messages/review', 'PUT', 174, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (208, '查看操作日志', '/admin/operation/logs', 'GET', 169, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (209, '删除操作日志', '/admin/operation/logs', 'DELETE', 169, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (210, '获取页面列表', '/admin/pages', 'GET', 180, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (211, '保存或更新页面', '/admin/pages', 'POST', 180, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (212, '删除页面', '/admin/pages/*', 'DELETE', 180, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (213, '根据相册id获取照片列表', '/admin/photos', 'GET', 171, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (214, '保存照片', '/admin/photos', 'POST', 171, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (215, '更新照片信息', '/admin/photos', 'PUT', 171, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (216, '删除照片', '/admin/photos', 'DELETE', 171, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (217, '移动照片相册', '/admin/photos/album', 'PUT', 171, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (218, '查看后台相册列表', '/admin/photos/albums', 'GET', 175, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (219, '保存或更新相册', '/admin/photos/albums', 'POST', 175, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (220, '上传相册封面', '/admin/photos/albums/cover', 'POST', 175, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (221, '获取后台相册列表信息', '/admin/photos/albums/info', 'GET', 175, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (222, '根据id删除相册', '/admin/photos/albums/*', 'DELETE', 175, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (223, '根据id获取后台相册信息', '/admin/photos/albums/*/info', 'GET', 175, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (224, '更新照片删除状态', '/admin/photos/delete', 'PUT', 171, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (225, '查看资源列表', '/admin/resources', 'GET', 179, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (226, '新增或修改资源', '/admin/resources', 'POST', 179, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (227, '导入swagger接口', '/admin/resources/import/swagger', 'GET', 179, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (228, '删除资源', '/admin/resources/*', 'DELETE', 179, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (229, '保存或更新角色', '/admin/role', 'POST', 177, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (230, '查看角色菜单选项', '/admin/role/menus', 'GET', 176, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (231, '查看角色资源选项', '/admin/role/resources', 'GET', 179, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (232, '查询角色列表', '/admin/roles', 'GET', 177, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (233, '删除角色', '/admin/roles', 'DELETE', 177, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (234, '查询后台标签列表', '/admin/tags', 'GET', 170, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (235, '添加或修改标签', '/admin/tags', 'POST', 170, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (236, '删除标签', '/admin/tags', 'DELETE', 170, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (237, '搜索文章标签', '/admin/tags/search', 'GET', 170, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (238, '查看当前用户菜单', '/admin/user/menus', 'GET', 176, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (239, '查询后台用户列表', '/admin/users', 'GET', 173, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (240, '修改用户禁用状态', '/admin/users/disable', 'PUT', 172, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (241, '查看在线用户', '/admin/users/online', 'GET', 172, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (242, '修改管理员密码', '/admin/users/password', 'PUT', 173, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (243, '查询用户角色选项', '/admin/users/role', 'GET', 177, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (244, '修改用户角色', '/admin/users/role', 'PUT', 172, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (245, '下线用户', '/admin/users/*/online', 'DELETE', 172, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (246, '获取网站配置', '/admin/website/config', 'GET', 166, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (247, '更新网站配置', '/admin/website/config', 'PUT', 166, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (248, '根据相册id查看照片列表', '/albums/*/photos', 'GET', 171, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (249, '查看首页文章', '/articles', 'GET', 168, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (250, '查看文章归档', '/articles/archives', 'GET', 168, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (251, '根据条件查询文章', '/articles/condition', 'GET', 168, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (252, '搜索文章', '/articles/search', 'GET', 168, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (253, '根据id查看文章', '/articles/*', 'GET', 168, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (254, '点赞文章', '/articles/*/like', 'POST', 168, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (255, '查看分类列表', '/categories', 'GET', 165, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (256, '查询评论', '/comments', 'GET', 178, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (257, '添加评论', '/comments', 'POST', 178, 0, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (258, '评论点赞', '/comments/*/like', 'POST', 178, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (259, '查询评论下的回复', '/comments/*/replies', 'GET', 178, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (260, '查看友链列表', '/links', 'GET', 167, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (261, '查看留言列表', '/messages', 'GET', 174, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (262, '添加留言', '/messages', 'POST', 174, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (263, '获取相册列表', '/photos/albums', 'GET', 175, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (264, '用户注册', '/register', 'POST', 173, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (265, '查询标签列表', '/tags', 'GET', 170, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (267, '更新用户头像', '/users/avatar', 'POST', 172, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (268, '发送邮箱验证码', '/users/code', 'GET', 173, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (269, '绑定用户邮箱', '/users/email', 'POST', 172, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (270, '更新用户信息', '/users/info', 'PUT', 172, 0, '2022-02-02 22:10:26', NULL);
INSERT INTO `tb_resource` VALUES (271, 'qq登录', '/users/oauth/qq', 'POST', 173, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (272, '微博登录', '/users/oauth/weibo', 'POST', 173, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (273, '修改密码', '/users/password', 'PUT', 173, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (274, '上传语音', '/voice', 'POST', 166, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (275, '上传访客信息', '/report', 'POST', 166, 1, '2022-02-02 22:10:26', '2022-02-03 21:55:24');
INSERT INTO `tb_resource` VALUES (276, '获取用户区域分布', '/admin/users/area', 'GET', 173, 0, '2022-02-02 22:10:26', NULL);

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名',
  `role_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用  0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '管理员', 'admin', 0, '2022-01-10 12:15:50', '2022-02-02 15:14:40');
INSERT INTO `tb_role` VALUES (2, '用户', 'user', 0, '2022-01-10 12:15:50', '2022-02-02 15:14:40');
INSERT INTO `tb_role` VALUES (3, '测试', 'test', 0, '2022-01-10 12:15:50', '2022-02-02 15:14:40');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2310 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES (1397, 8, 1);
INSERT INTO `tb_role_menu` VALUES (1398, 8, 2);
INSERT INTO `tb_role_menu` VALUES (1399, 8, 6);
INSERT INTO `tb_role_menu` VALUES (1400, 8, 7);
INSERT INTO `tb_role_menu` VALUES (1401, 8, 8);
INSERT INTO `tb_role_menu` VALUES (1402, 8, 9);
INSERT INTO `tb_role_menu` VALUES (1403, 8, 10);
INSERT INTO `tb_role_menu` VALUES (1404, 8, 3);
INSERT INTO `tb_role_menu` VALUES (1405, 8, 11);
INSERT INTO `tb_role_menu` VALUES (1406, 8, 12);
INSERT INTO `tb_role_menu` VALUES (1407, 8, 202);
INSERT INTO `tb_role_menu` VALUES (1408, 8, 13);
INSERT INTO `tb_role_menu` VALUES (1409, 8, 14);
INSERT INTO `tb_role_menu` VALUES (1410, 8, 201);
INSERT INTO `tb_role_menu` VALUES (1411, 8, 4);
INSERT INTO `tb_role_menu` VALUES (1412, 8, 16);
INSERT INTO `tb_role_menu` VALUES (1413, 8, 15);
INSERT INTO `tb_role_menu` VALUES (1414, 8, 17);
INSERT INTO `tb_role_menu` VALUES (1415, 8, 18);
INSERT INTO `tb_role_menu` VALUES (1416, 8, 19);
INSERT INTO `tb_role_menu` VALUES (1417, 8, 20);
INSERT INTO `tb_role_menu` VALUES (1418, 8, 5);
INSERT INTO `tb_role_menu` VALUES (1595, 9, 1);
INSERT INTO `tb_role_menu` VALUES (1596, 9, 2);
INSERT INTO `tb_role_menu` VALUES (1597, 9, 6);
INSERT INTO `tb_role_menu` VALUES (1598, 9, 7);
INSERT INTO `tb_role_menu` VALUES (1599, 9, 8);
INSERT INTO `tb_role_menu` VALUES (1600, 9, 9);
INSERT INTO `tb_role_menu` VALUES (1601, 9, 10);
INSERT INTO `tb_role_menu` VALUES (1602, 9, 3);
INSERT INTO `tb_role_menu` VALUES (1603, 9, 11);
INSERT INTO `tb_role_menu` VALUES (1604, 9, 12);
INSERT INTO `tb_role_menu` VALUES (1605, 9, 202);
INSERT INTO `tb_role_menu` VALUES (1606, 9, 13);
INSERT INTO `tb_role_menu` VALUES (1607, 9, 14);
INSERT INTO `tb_role_menu` VALUES (1608, 9, 201);
INSERT INTO `tb_role_menu` VALUES (1609, 9, 4);
INSERT INTO `tb_role_menu` VALUES (1610, 9, 16);
INSERT INTO `tb_role_menu` VALUES (1611, 9, 15);
INSERT INTO `tb_role_menu` VALUES (1612, 9, 17);
INSERT INTO `tb_role_menu` VALUES (1613, 9, 18);
INSERT INTO `tb_role_menu` VALUES (1614, 9, 19);
INSERT INTO `tb_role_menu` VALUES (1615, 9, 20);
INSERT INTO `tb_role_menu` VALUES (1616, 9, 5);
INSERT INTO `tb_role_menu` VALUES (1639, 13, 2);
INSERT INTO `tb_role_menu` VALUES (1640, 13, 6);
INSERT INTO `tb_role_menu` VALUES (1641, 13, 7);
INSERT INTO `tb_role_menu` VALUES (1642, 13, 8);
INSERT INTO `tb_role_menu` VALUES (1643, 13, 9);
INSERT INTO `tb_role_menu` VALUES (1644, 13, 10);
INSERT INTO `tb_role_menu` VALUES (1645, 13, 3);
INSERT INTO `tb_role_menu` VALUES (1646, 13, 11);
INSERT INTO `tb_role_menu` VALUES (1647, 13, 12);
INSERT INTO `tb_role_menu` VALUES (2252, 1, 1);
INSERT INTO `tb_role_menu` VALUES (2253, 1, 2);
INSERT INTO `tb_role_menu` VALUES (2254, 1, 6);
INSERT INTO `tb_role_menu` VALUES (2255, 1, 7);
INSERT INTO `tb_role_menu` VALUES (2256, 1, 8);
INSERT INTO `tb_role_menu` VALUES (2257, 1, 9);
INSERT INTO `tb_role_menu` VALUES (2258, 1, 10);
INSERT INTO `tb_role_menu` VALUES (2259, 1, 3);
INSERT INTO `tb_role_menu` VALUES (2260, 1, 11);
INSERT INTO `tb_role_menu` VALUES (2261, 1, 12);
INSERT INTO `tb_role_menu` VALUES (2262, 1, 202);
INSERT INTO `tb_role_menu` VALUES (2263, 1, 13);
INSERT INTO `tb_role_menu` VALUES (2264, 1, 201);
INSERT INTO `tb_role_menu` VALUES (2265, 1, 213);
INSERT INTO `tb_role_menu` VALUES (2266, 1, 14);
INSERT INTO `tb_role_menu` VALUES (2267, 1, 15);
INSERT INTO `tb_role_menu` VALUES (2268, 1, 16);
INSERT INTO `tb_role_menu` VALUES (2269, 1, 4);
INSERT INTO `tb_role_menu` VALUES (2270, 1, 214);
INSERT INTO `tb_role_menu` VALUES (2271, 1, 209);
INSERT INTO `tb_role_menu` VALUES (2272, 1, 17);
INSERT INTO `tb_role_menu` VALUES (2273, 1, 18);
INSERT INTO `tb_role_menu` VALUES (2274, 1, 205);
INSERT INTO `tb_role_menu` VALUES (2275, 1, 206);
INSERT INTO `tb_role_menu` VALUES (2276, 1, 208);
INSERT INTO `tb_role_menu` VALUES (2277, 1, 210);
INSERT INTO `tb_role_menu` VALUES (2278, 1, 19);
INSERT INTO `tb_role_menu` VALUES (2279, 1, 20);
INSERT INTO `tb_role_menu` VALUES (2280, 1, 5);
INSERT INTO `tb_role_menu` VALUES (2281, 3, 1);
INSERT INTO `tb_role_menu` VALUES (2282, 3, 2);
INSERT INTO `tb_role_menu` VALUES (2283, 3, 6);
INSERT INTO `tb_role_menu` VALUES (2284, 3, 7);
INSERT INTO `tb_role_menu` VALUES (2285, 3, 8);
INSERT INTO `tb_role_menu` VALUES (2286, 3, 9);
INSERT INTO `tb_role_menu` VALUES (2287, 3, 10);
INSERT INTO `tb_role_menu` VALUES (2288, 3, 3);
INSERT INTO `tb_role_menu` VALUES (2289, 3, 11);
INSERT INTO `tb_role_menu` VALUES (2290, 3, 12);
INSERT INTO `tb_role_menu` VALUES (2291, 3, 202);
INSERT INTO `tb_role_menu` VALUES (2292, 3, 13);
INSERT INTO `tb_role_menu` VALUES (2293, 3, 201);
INSERT INTO `tb_role_menu` VALUES (2294, 3, 213);
INSERT INTO `tb_role_menu` VALUES (2295, 3, 14);
INSERT INTO `tb_role_menu` VALUES (2296, 3, 15);
INSERT INTO `tb_role_menu` VALUES (2297, 3, 16);
INSERT INTO `tb_role_menu` VALUES (2298, 3, 4);
INSERT INTO `tb_role_menu` VALUES (2299, 3, 214);
INSERT INTO `tb_role_menu` VALUES (2300, 3, 209);
INSERT INTO `tb_role_menu` VALUES (2301, 3, 17);
INSERT INTO `tb_role_menu` VALUES (2302, 3, 18);
INSERT INTO `tb_role_menu` VALUES (2303, 3, 205);
INSERT INTO `tb_role_menu` VALUES (2304, 3, 206);
INSERT INTO `tb_role_menu` VALUES (2305, 3, 208);
INSERT INTO `tb_role_menu` VALUES (2306, 3, 210);
INSERT INTO `tb_role_menu` VALUES (2307, 3, 19);
INSERT INTO `tb_role_menu` VALUES (2308, 3, 20);
INSERT INTO `tb_role_menu` VALUES (2309, 3, 5);

-- ----------------------------
-- Table structure for tb_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_resource`;
CREATE TABLE `tb_role_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `resource_id` int(11) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_resource
-- ----------------------------
INSERT INTO `tb_role_resource` VALUES (4011, 2, 254);
INSERT INTO `tb_role_resource` VALUES (4012, 2, 267);
INSERT INTO `tb_role_resource` VALUES (4013, 2, 269);
INSERT INTO `tb_role_resource` VALUES (4014, 2, 270);
INSERT INTO `tb_role_resource` VALUES (4015, 2, 257);
INSERT INTO `tb_role_resource` VALUES (4016, 2, 258);
INSERT INTO `tb_role_resource` VALUES (4076, 1, 165);
INSERT INTO `tb_role_resource` VALUES (4077, 1, 192);
INSERT INTO `tb_role_resource` VALUES (4078, 1, 193);
INSERT INTO `tb_role_resource` VALUES (4079, 1, 194);
INSERT INTO `tb_role_resource` VALUES (4080, 1, 195);
INSERT INTO `tb_role_resource` VALUES (4081, 1, 166);
INSERT INTO `tb_role_resource` VALUES (4082, 1, 183);
INSERT INTO `tb_role_resource` VALUES (4083, 1, 184);
INSERT INTO `tb_role_resource` VALUES (4084, 1, 246);
INSERT INTO `tb_role_resource` VALUES (4085, 1, 247);
INSERT INTO `tb_role_resource` VALUES (4086, 1, 167);
INSERT INTO `tb_role_resource` VALUES (4087, 1, 199);
INSERT INTO `tb_role_resource` VALUES (4088, 1, 200);
INSERT INTO `tb_role_resource` VALUES (4089, 1, 201);
INSERT INTO `tb_role_resource` VALUES (4090, 1, 168);
INSERT INTO `tb_role_resource` VALUES (4091, 1, 185);
INSERT INTO `tb_role_resource` VALUES (4092, 1, 186);
INSERT INTO `tb_role_resource` VALUES (4093, 1, 187);
INSERT INTO `tb_role_resource` VALUES (4094, 1, 188);
INSERT INTO `tb_role_resource` VALUES (4095, 1, 189);
INSERT INTO `tb_role_resource` VALUES (4096, 1, 190);
INSERT INTO `tb_role_resource` VALUES (4097, 1, 191);
INSERT INTO `tb_role_resource` VALUES (4098, 1, 254);
INSERT INTO `tb_role_resource` VALUES (4099, 1, 169);
INSERT INTO `tb_role_resource` VALUES (4100, 1, 208);
INSERT INTO `tb_role_resource` VALUES (4101, 1, 209);
INSERT INTO `tb_role_resource` VALUES (4102, 1, 170);
INSERT INTO `tb_role_resource` VALUES (4103, 1, 234);
INSERT INTO `tb_role_resource` VALUES (4104, 1, 235);
INSERT INTO `tb_role_resource` VALUES (4105, 1, 236);
INSERT INTO `tb_role_resource` VALUES (4106, 1, 237);
INSERT INTO `tb_role_resource` VALUES (4107, 1, 171);
INSERT INTO `tb_role_resource` VALUES (4108, 1, 213);
INSERT INTO `tb_role_resource` VALUES (4109, 1, 214);
INSERT INTO `tb_role_resource` VALUES (4110, 1, 215);
INSERT INTO `tb_role_resource` VALUES (4111, 1, 216);
INSERT INTO `tb_role_resource` VALUES (4112, 1, 217);
INSERT INTO `tb_role_resource` VALUES (4113, 1, 224);
INSERT INTO `tb_role_resource` VALUES (4114, 1, 172);
INSERT INTO `tb_role_resource` VALUES (4115, 1, 240);
INSERT INTO `tb_role_resource` VALUES (4116, 1, 241);
INSERT INTO `tb_role_resource` VALUES (4117, 1, 244);
INSERT INTO `tb_role_resource` VALUES (4118, 1, 245);
INSERT INTO `tb_role_resource` VALUES (4119, 1, 267);
INSERT INTO `tb_role_resource` VALUES (4120, 1, 269);
INSERT INTO `tb_role_resource` VALUES (4121, 1, 270);
INSERT INTO `tb_role_resource` VALUES (4122, 1, 173);
INSERT INTO `tb_role_resource` VALUES (4123, 1, 239);
INSERT INTO `tb_role_resource` VALUES (4124, 1, 242);
INSERT INTO `tb_role_resource` VALUES (4125, 1, 276);
INSERT INTO `tb_role_resource` VALUES (4126, 1, 174);
INSERT INTO `tb_role_resource` VALUES (4127, 1, 205);
INSERT INTO `tb_role_resource` VALUES (4128, 1, 206);
INSERT INTO `tb_role_resource` VALUES (4129, 1, 207);
INSERT INTO `tb_role_resource` VALUES (4130, 1, 175);
INSERT INTO `tb_role_resource` VALUES (4131, 1, 218);
INSERT INTO `tb_role_resource` VALUES (4132, 1, 219);
INSERT INTO `tb_role_resource` VALUES (4133, 1, 220);
INSERT INTO `tb_role_resource` VALUES (4134, 1, 221);
INSERT INTO `tb_role_resource` VALUES (4135, 1, 222);
INSERT INTO `tb_role_resource` VALUES (4136, 1, 223);
INSERT INTO `tb_role_resource` VALUES (4137, 1, 176);
INSERT INTO `tb_role_resource` VALUES (4138, 1, 202);
INSERT INTO `tb_role_resource` VALUES (4139, 1, 203);
INSERT INTO `tb_role_resource` VALUES (4140, 1, 204);
INSERT INTO `tb_role_resource` VALUES (4141, 1, 230);
INSERT INTO `tb_role_resource` VALUES (4142, 1, 238);
INSERT INTO `tb_role_resource` VALUES (4143, 1, 177);
INSERT INTO `tb_role_resource` VALUES (4144, 1, 229);
INSERT INTO `tb_role_resource` VALUES (4145, 1, 232);
INSERT INTO `tb_role_resource` VALUES (4146, 1, 233);
INSERT INTO `tb_role_resource` VALUES (4147, 1, 243);
INSERT INTO `tb_role_resource` VALUES (4148, 1, 178);
INSERT INTO `tb_role_resource` VALUES (4149, 1, 196);
INSERT INTO `tb_role_resource` VALUES (4150, 1, 197);
INSERT INTO `tb_role_resource` VALUES (4151, 1, 198);
INSERT INTO `tb_role_resource` VALUES (4152, 1, 257);
INSERT INTO `tb_role_resource` VALUES (4153, 1, 258);
INSERT INTO `tb_role_resource` VALUES (4154, 1, 179);
INSERT INTO `tb_role_resource` VALUES (4155, 1, 225);
INSERT INTO `tb_role_resource` VALUES (4156, 1, 226);
INSERT INTO `tb_role_resource` VALUES (4157, 1, 227);
INSERT INTO `tb_role_resource` VALUES (4158, 1, 228);
INSERT INTO `tb_role_resource` VALUES (4159, 1, 231);
INSERT INTO `tb_role_resource` VALUES (4160, 1, 180);
INSERT INTO `tb_role_resource` VALUES (4161, 1, 210);
INSERT INTO `tb_role_resource` VALUES (4162, 1, 211);
INSERT INTO `tb_role_resource` VALUES (4163, 1, 212);
INSERT INTO `tb_role_resource` VALUES (4164, 3, 192);
INSERT INTO `tb_role_resource` VALUES (4165, 3, 195);
INSERT INTO `tb_role_resource` VALUES (4166, 3, 183);
INSERT INTO `tb_role_resource` VALUES (4167, 3, 246);
INSERT INTO `tb_role_resource` VALUES (4168, 3, 199);
INSERT INTO `tb_role_resource` VALUES (4169, 3, 185);
INSERT INTO `tb_role_resource` VALUES (4170, 3, 191);
INSERT INTO `tb_role_resource` VALUES (4171, 3, 254);
INSERT INTO `tb_role_resource` VALUES (4172, 3, 208);
INSERT INTO `tb_role_resource` VALUES (4173, 3, 234);
INSERT INTO `tb_role_resource` VALUES (4174, 3, 237);
INSERT INTO `tb_role_resource` VALUES (4175, 3, 213);
INSERT INTO `tb_role_resource` VALUES (4176, 3, 241);
INSERT INTO `tb_role_resource` VALUES (4177, 3, 239);
INSERT INTO `tb_role_resource` VALUES (4178, 3, 276);
INSERT INTO `tb_role_resource` VALUES (4179, 3, 205);
INSERT INTO `tb_role_resource` VALUES (4180, 3, 218);
INSERT INTO `tb_role_resource` VALUES (4181, 3, 223);
INSERT INTO `tb_role_resource` VALUES (4182, 3, 202);
INSERT INTO `tb_role_resource` VALUES (4183, 3, 230);
INSERT INTO `tb_role_resource` VALUES (4184, 3, 238);
INSERT INTO `tb_role_resource` VALUES (4185, 3, 232);
INSERT INTO `tb_role_resource` VALUES (4186, 3, 243);
INSERT INTO `tb_role_resource` VALUES (4187, 3, 196);
INSERT INTO `tb_role_resource` VALUES (4188, 3, 257);
INSERT INTO `tb_role_resource` VALUES (4189, 3, 258);
INSERT INTO `tb_role_resource` VALUES (4190, 3, 225);
INSERT INTO `tb_role_resource` VALUES (4191, 3, 231);
INSERT INTO `tb_role_resource` VALUES (4192, 3, 210);

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES (27, '测试标签', '2022-01-22 14:07:12', NULL);

-- ----------------------------
-- Table structure for tb_unique_view
-- ----------------------------
DROP TABLE IF EXISTS `tb_unique_view`;
CREATE TABLE `tb_unique_view`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL COMMENT '时间',
  `views_count` int(11) NOT NULL COMMENT '访问量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_unique_view
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_auth`;
CREATE TABLE `tb_user_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_info_id` int(11) NOT NULL COMMENT '用户信息id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `login_type` tinyint(1) NOT NULL COMMENT '登录类型',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_auth
-- ----------------------------
INSERT INTO `tb_user_auth` VALUES (1, 1, 'admin@qq.com', '$2a$10$AkxkZaqcxEXdiNE1nrgW1.ms3aS9C5ImXMf8swkWUJuFGMqDl.TPW', 1, '127.0.0.1', '', '2021-08-12 15:43:18', '2022-02-02 10:09:22', '2022-02-02 10:09:21');

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱号',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户简介',
  `web_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人网站',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
INSERT INTO `tb_user_info` VALUES (1, 'admin@qq.com', '管理员', 'https://blog-oss-2022-2-1.oss-cn-beijing.aliyuncs.com/avatar/f105ac3c1a977cafc29a07ddd1a9fb0e.jpg', 'admin@qq.com', NULL, 0, '2021-08-12 15:43:17', '2022-02-01 16:50:03');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 578 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES (577, 1, 1);

-- ----------------------------
-- Table structure for tb_website_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_website_config`;
CREATE TABLE `tb_website_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配置信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_website_config
-- ----------------------------
INSERT INTO `tb_website_config` VALUES (1, '{\"alipayQRCode\":\"",
\"gitee\":\"https://gitee.com/LC-LUCUS/\",
\"github\":\"https://github.com/LC-Lucus\",
\"isChatRoom\":1,\"isCommentReview\":0,
\"isEmailNotice\":1,\"isMessageReview\":0,
\"isMusicPlayer\":1,\"isReward\":1,\"qq\":\"1599772849\",\"socialLoginList\":[\"qq\",\"weibo\"],\"socialUrlList\":[\"qq\",\"github\",\"gitee\"],
\"touristAvatar\":\"https://blog-oss-2022-2-1.oss-cn-shanghai.aliyuncs.com/photos/0bca52afdb2b9998132355d716390c9f.png\",
\"userAvatar\":\"https://blog-oss-2022-2-1.oss-cn-shanghai.aliyuncs.com/photos/0bca52afdb2b9998132355d716390c9f.png\",
\"websiteAuthor\":\"种棵梧桐树\",
\"websiteAvatar\":\"https://blog-oss-2022-2-1.oss-cn-shanghai.aliyuncs.com/config/6814f37d3d14c0709f0bc35b0c24f8d9.jpg\",\"websiteCreateTime\":\"2022-02-01\",\"websiteIntro\":\"余生漫漫，愿你历尽沧桑，依旧能永怀善意，清澈明朗！\",\"websiteName\":\"种棵梧桐树\",\"websiteNotice\":\"请前往后台管理修改博客信息\",\"websiteRecordNo\":\"闽ICP备2021017076号-1\",\"websocketUrl\":\"ws://127.0.0.1:8080/websocket\",
\"weiXinQRCode\":\""}', '2022-01-25 18:37:22', '2022-02-01 17:20:49');

SET FOREIGN_KEY_CHECKS = 1;
