/*
 Navicat MySQL Data Transfer

 Source Server         : dev.wyz.ltd
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 127.0.0.1:3306
 Source Schema         : aingo-admin

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 10/06/2024 04:06:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2021_04_18_224626_create_setting_config_table', 1);
INSERT INTO `migrations` VALUES (2, '2021_04_18_225055_create_setting_crontab_table', 1);
INSERT INTO `migrations` VALUES (3, '2021_04_18_225100_create_setting_crontab_log_table', 1);
INSERT INTO `migrations` VALUES (4, '2021_04_18_225100_create_setting_generate_columns_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_04_18_225100_create_setting_generate_tables_table', 1);
INSERT INTO `migrations` VALUES (6, '2022_07_24_225626_create_setting_config_group_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_04_07_014007_create_after_autoform_table_table', 1);
INSERT INTO `migrations` VALUES (8, '2021_04_12_160526_create_system_user_table', 2);
INSERT INTO `migrations` VALUES (9, '2021_04_18_215320_create_system_menu_table', 2);
INSERT INTO `migrations` VALUES (10, '2021_04_18_215515_create_system_role_table', 2);
INSERT INTO `migrations` VALUES (11, '2021_04_18_215521_create_system_user_role_table', 2);
INSERT INTO `migrations` VALUES (12, '2021_04_18_222634_create_system_role_menu_table', 2);
INSERT INTO `migrations` VALUES (13, '2021_04_18_224723_create_system_dict_data_table', 2);
INSERT INTO `migrations` VALUES (14, '2021_04_18_224727_create_system_dict_type_table', 2);
INSERT INTO `migrations` VALUES (15, '2021_04_18_224817_create_system_dept_table', 2);
INSERT INTO `migrations` VALUES (16, '2021_04_18_224835_create_system_post_table', 2);
INSERT INTO `migrations` VALUES (17, '2021_04_18_224912_create_system_login_log_table', 2);
INSERT INTO `migrations` VALUES (18, '2021_04_18_224938_create_system_oper_log_table', 2);
INSERT INTO `migrations` VALUES (19, '2021_04_26_141249_create_system_user_post_table', 2);
INSERT INTO `migrations` VALUES (20, '2021_05_07_215228_create_system_role_dept_table', 2);
INSERT INTO `migrations` VALUES (21, '2021_06_24_111216_create_system_uploadfile_table', 2);
INSERT INTO `migrations` VALUES (22, '2021_11_11_140915_create_system_app_table', 2);
INSERT INTO `migrations` VALUES (23, '2021_11_11_140935_create_system_app_group_table', 2);
INSERT INTO `migrations` VALUES (24, '2021_11_11_141720_create_system_api_table', 2);
INSERT INTO `migrations` VALUES (25, '2021_11_11_141724_create_system_api_group_table', 2);
INSERT INTO `migrations` VALUES (26, '2021_11_11_141849_create_system_api_column_table', 2);
INSERT INTO `migrations` VALUES (27, '2021_11_11_151525_create_system_app_api_table', 2);
INSERT INTO `migrations` VALUES (28, '2021_11_26_163202_create_system_api_log_table', 2);
INSERT INTO `migrations` VALUES (29, '2021_11_26_163818_create_system_notice_table', 2);
INSERT INTO `migrations` VALUES (30, '2021_11_26_164006_create_system_queue_message_table', 2);
INSERT INTO `migrations` VALUES (31, '2021_12_25_163880_create_system_queue_log_table', 2);
INSERT INTO `migrations` VALUES (32, '2021_12_25_163890_create_system_queue_message_receive_table', 2);
INSERT INTO `migrations` VALUES (33, '2022_10_14_231534_update_version101', 3);
INSERT INTO `migrations` VALUES (34, '2023_3_31_356255_update_version120', 3);
INSERT INTO `migrations` VALUES (35, '2022_12_21_231534_update_version102', 4);

-- ----------------------------
-- Table structure for setting_config
-- ----------------------------
DROP TABLE IF EXISTS `setting_config`;
CREATE TABLE `setting_config`  (
  `group_id` bigint NOT NULL COMMENT '组id',
  `key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置键名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置值',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `input_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text' COMMENT '数据输入类型',
  `config_select_data` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置选项数据',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`key`) USING BTREE,
  INDEX `setting_config_group_id_index`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_config
-- ----------------------------
INSERT INTO `setting_config` VALUES (1, 'site_copyright', 'Copyright © 2019-2022 AingoAdmin. All rights reserved.', '版权信息', 'textarea', '', 96, '');
INSERT INTO `setting_config` VALUES (1, 'site_desc', 'AingoAdmin', '网站描述', 'textarea', '', 97, '');
INSERT INTO `setting_config` VALUES (1, 'site_keywords', '后台管理系统', '网站关键字', 'input', '', 98, '');
INSERT INTO `setting_config` VALUES (1, 'site_name', 'AingoAdmin', '网站名称', 'input', '', 99, '');
INSERT INTO `setting_config` VALUES (1, 'site_record_number', 'xxx', '网站备案号', 'input', '', 95, '');
INSERT INTO `setting_config` VALUES (2, 'upload_allow_file', 'txt,doc,docx,xls,xlsx,ppt,pptx,rar,zip,7z,gz,pdf,wps,md', '文件类型', 'input', '', 0, '');
INSERT INTO `setting_config` VALUES (2, 'upload_allow_image', 'jpg,jpeg,png,gif,svg,bmp', '图片类型', 'input', '', 0, '');
INSERT INTO `setting_config` VALUES (2, 'upload_mode', '1', '上传模式', 'select', '\"[{\\\"label\\\":\\\"\\u672c\\u5730\\u4e0a\\u4f20\\\",\\\"value\\\":\\\"1\\\"},{\\\"label\\\":\\\"\\u963f\\u91cc\\u4e91OSS\\\",\\\"value\\\":\\\"2\\\"},{\\\"label\\\":\\\"\\u4e03\\u725b\\u4e91\\\",\\\"value\\\":\\\"3\\\"},{\\\"label\\\":\\\"\\u817e\\u8baf\\u4e91COS\\\",\\\"value\\\":\\\"4\\\"}]\"', 99, '');

-- ----------------------------
-- Table structure for setting_config_group
-- ----------------------------
DROP TABLE IF EXISTS `setting_config_group`;
CREATE TABLE `setting_config_group`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置组名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置组标识',
  `created_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者',
  `updated_by` bigint NOT NULL DEFAULT 0 COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_config_group
-- ----------------------------
INSERT INTO `setting_config_group` VALUES (1, '站点配置', 'site_config', 1, 1, '2024-04-17 16:29:06', '2024-04-17 16:29:06', '');
INSERT INTO `setting_config_group` VALUES (2, '上传配置', 'upload_config', 1, 1, '2024-04-17 16:29:06', '2024-04-17 16:29:06', '');

-- ----------------------------
-- Table structure for setting_crontab
-- ----------------------------
DROP TABLE IF EXISTS `setting_crontab`;
CREATE TABLE `setting_crontab`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `type` smallint NOT NULL DEFAULT 1 COMMENT '任务类型 (1 command, 2 class, 3 url, 4 eval)',
  `target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '调用任务字符串',
  `parameter` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '调用任务参数',
  `rule` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务执行表达式',
  `singleton` smallint NOT NULL DEFAULT 1 COMMENT '是否单次执行 (1 是 2 不是)',
  `status` smallint NOT NULL DEFAULT 2 COMMENT '状态 (1正常 2停用)',
  `created_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者',
  `updated_by` bigint NOT NULL DEFAULT 0 COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_crontab
-- ----------------------------
INSERT INTO `setting_crontab` VALUES (1, 'urlCrontab', 3, 'http://127.0.0.1:9501/', '', '59 */1 * * * *', 2, 2, 0, 0, '2021-08-07 23:28:28', '2021-08-07 23:44:55', '请求127.0.0.1');
INSERT INTO `setting_crontab` VALUES (2, '每月1号清理所有日志', 2, 'App\\System\\Crontab\\ClearLogCrontab', '', '0 0 0 1 * *', 2, 2, 0, 0, '2022-04-11 11:15:48', '2022-04-11 11:15:48', '');

-- ----------------------------
-- Table structure for setting_crontab_log
-- ----------------------------
DROP TABLE IF EXISTS `setting_crontab_log`;
CREATE TABLE `setting_crontab_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crontab_id` bigint UNSIGNED NOT NULL COMMENT '任务ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
  `target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务调用目标字符串',
  `parameter` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务调用参数',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '异常信息',
  `status` smallint NULL DEFAULT 1 COMMENT '执行状态 (1成功 2失败)',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务执行日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_crontab_log
-- ----------------------------

-- ----------------------------
-- Table structure for setting_datasource
-- ----------------------------
DROP TABLE IF EXISTS `setting_datasource`;
CREATE TABLE `setting_datasource`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据源名称',
  `dsn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '连接dsn字符串',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据库用户',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '数据源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_datasource
-- ----------------------------

-- ----------------------------
-- Table structure for setting_generate_columns
-- ----------------------------
DROP TABLE IF EXISTS `setting_generate_columns`;
CREATE TABLE `setting_generate_columns`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_id` bigint UNSIGNED NOT NULL COMMENT '所属表ID',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字段名称',
  `column_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字段注释',
  `column_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字段类型',
  `is_pk` smallint NULL DEFAULT 1 COMMENT '1 非主键 2 主键',
  `is_required` smallint NULL DEFAULT 1 COMMENT '1 非必填 2 必填',
  `is_insert` smallint NULL DEFAULT 1 COMMENT '1 非插入字段 2 插入字段',
  `is_edit` smallint NULL DEFAULT 1 COMMENT '1 非编辑字段 2 编辑字段',
  `is_list` smallint NULL DEFAULT 1 COMMENT '1 非列表显示字段 2 列表显示字段',
  `is_query` smallint NULL DEFAULT 1 COMMENT '1 非查询字段 2 查询字段',
  `is_sort` smallint NULL DEFAULT 1 COMMENT '1 不排序 2 排序字段',
  `query_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'eq' COMMENT '查询方式 eq 等于, neq 不等于, gt 大于, lt 小于, like 范围',
  `view_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'text' COMMENT '页面控件，text, textarea, password, select, checkbox, radio, date, upload, ma-upload（封装的上传控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典类型',
  `allow_roles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '允许查看该字段的角色',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字段其他设置',
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字段扩展信息',
  `sort` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务字段信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_generate_columns
-- ----------------------------

-- ----------------------------
-- Table structure for setting_generate_tables
-- ----------------------------
DROP TABLE IF EXISTS `setting_generate_tables`;
CREATE TABLE `setting_generate_tables`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表注释',
  `module_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属模块',
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '命名空间',
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成菜单名',
  `belong_menu_id` bigint NULL DEFAULT NULL COMMENT '所属菜单',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '控制器包名',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成类型，single 单表CRUD，tree 树表CRUD，parent_sub父子表CRUD',
  `generate_type` smallint NULL DEFAULT 1 COMMENT '1 压缩包下载 2 生成到模块',
  `generate_menus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成菜单列表',
  `build_menu` smallint NULL DEFAULT 1 COMMENT '是否构建菜单',
  `component_type` smallint NULL DEFAULT 1 COMMENT '组件显示方式',
  `options` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '其他业务选项',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_generate_tables
-- ----------------------------

-- ----------------------------
-- Table structure for system_api
-- ----------------------------
DROP TABLE IF EXISTS `system_api`;
CREATE TABLE `system_api`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint UNSIGNED NOT NULL COMMENT '接口组ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名称',
  `access_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口访问名称',
  `class_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类命名空间',
  `method_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '方法名',
  `auth_mode` smallint NOT NULL DEFAULT 1 COMMENT '认证模式 (1简易 2复杂)',
  `request_mode` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A' COMMENT '请求模式 (A 所有 P POST G GET)',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '接口说明介绍',
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '返回内容示例',
  `status` smallint NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_api_group_id_index`(`group_id` ASC) USING BTREE,
  INDEX `system_api_access_name_index`(`access_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '接口表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_api
-- ----------------------------

-- ----------------------------
-- Table structure for system_api_column
-- ----------------------------
DROP TABLE IF EXISTS `system_api_column`;
CREATE TABLE `system_api_column`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `api_id` bigint UNSIGNED NOT NULL COMMENT '接口主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名称',
  `type` smallint NOT NULL DEFAULT 1 COMMENT '字段类型 1 请求 2 返回',
  `data_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据类型',
  `is_required` smallint NOT NULL DEFAULT 1 COMMENT '是否必填 1 非必填 2 必填',
  `default_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '默认值',
  `status` smallint NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字段说明',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_api_column_api_id_type_status_index`(`api_id` ASC, `type` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '接口字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_api_column
-- ----------------------------

-- ----------------------------
-- Table structure for system_api_group
-- ----------------------------
DROP TABLE IF EXISTS `system_api_group`;
CREATE TABLE `system_api_group`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口组名称',
  `status` smallint NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '接口分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_api_group
-- ----------------------------

-- ----------------------------
-- Table structure for system_api_log
-- ----------------------------
DROP TABLE IF EXISTS `system_api_log`;
CREATE TABLE `system_api_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `api_id` bigint UNSIGNED NOT NULL COMMENT 'api ID',
  `api_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名称',
  `access_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口访问名称',
  `request_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求数据',
  `response_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '响应状态码',
  `response_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '响应数据',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '访问IP地址',
  `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP所属地',
  `access_time` timestamp NULL DEFAULT NULL COMMENT '访问时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_api_log_api_id_index`(`api_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '接口日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_api_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_app
-- ----------------------------
DROP TABLE IF EXISTS `system_app`;
CREATE TABLE `system_app`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint UNSIGNED NOT NULL COMMENT '应用组ID',
  `app_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名称',
  `app_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用ID',
  `app_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用密钥',
  `status` smallint NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '应用介绍',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_app_group_id_app_id_app_secret_index`(`group_id` ASC, `app_id` ASC, `app_secret` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_app
-- ----------------------------

-- ----------------------------
-- Table structure for system_app_api
-- ----------------------------
DROP TABLE IF EXISTS `system_app_api`;
CREATE TABLE `system_app_api`  (
  `app_id` bigint UNSIGNED NOT NULL COMMENT '应用ID',
  `api_id` bigint UNSIGNED NOT NULL COMMENT 'API—ID',
  PRIMARY KEY (`app_id`, `api_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用和api关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_app_api
-- ----------------------------

-- ----------------------------
-- Table structure for system_app_group
-- ----------------------------
DROP TABLE IF EXISTS `system_app_group`;
CREATE TABLE `system_app_group`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用组名称',
  `status` smallint NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_app_group
-- ----------------------------

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint UNSIGNED NOT NULL COMMENT '父ID',
  `level` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组级集合',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `status` smallint NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `sort` smallint UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_dept_parent_id_index`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept` VALUES (1, 0, '0', '自己的科技', '大熊', '16888888888', 1, 0, 1, 1, '2024-04-17 16:29:19', '2024-06-09 17:44:52', NULL, NULL);
INSERT INTO `system_dept` VALUES (2, 1, '0,1', '技术部', '张三', NULL, 1, 1, 1, 1, '2024-06-09 17:51:24', '2024-06-09 17:51:24', NULL, NULL);
INSERT INTO `system_dept` VALUES (3, 1, '0,1', '运营部', '王八', NULL, 1, 1, 1, 1, '2024-06-09 17:51:53', '2024-06-09 17:51:53', NULL, NULL);

-- ----------------------------
-- Table structure for system_dept_leader
-- ----------------------------
DROP TABLE IF EXISTS `system_dept_leader`;
CREATE TABLE `system_dept_leader`  (
  `dept_id` bigint UNSIGNED NOT NULL COMMENT '部门主键',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户主键',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `created_at` timestamp NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`dept_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门领导表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dept_leader
-- ----------------------------

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_data`;
CREATE TABLE `system_dict_data`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` bigint UNSIGNED NOT NULL COMMENT '字典类型ID',
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典标签',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典值',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典标示',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` smallint NOT NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `created_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者',
  `updated_by` bigint NOT NULL DEFAULT 0 COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_dict_data_type_id_index`(`type_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
INSERT INTO `system_dict_data` VALUES (1, 1, 'InnoDB', 'InnoDB', 'table_engine', 0, 1, 0, 0, '2021-06-27 00:37:11', '2021-06-27 13:33:29', NULL, '');
INSERT INTO `system_dict_data` VALUES (2, 1, 'MyISAM', 'MyISAM', 'table_engine', 0, 1, 0, 0, '2021-06-27 00:37:21', '2021-06-27 13:33:29', NULL, '');
INSERT INTO `system_dict_data` VALUES (3, 2, '本地存储', '1', 'upload_mode', 99, 1, 0, 0, '2021-06-27 13:33:43', '2021-06-27 13:33:43', NULL, '');
INSERT INTO `system_dict_data` VALUES (4, 2, '阿里云OSS', '2', 'upload_mode', 98, 1, 0, 0, '2021-06-27 13:33:55', '2021-06-27 13:33:55', NULL, '');
INSERT INTO `system_dict_data` VALUES (5, 2, '七牛云', '3', 'upload_mode', 97, 1, 0, 0, '2021-06-27 13:34:07', '2021-06-27 13:34:07', NULL, '');
INSERT INTO `system_dict_data` VALUES (6, 2, '腾讯云COS', '4', 'upload_mode', 96, 1, 0, 0, '2021-06-27 13:34:19', '2021-06-27 13:34:19', NULL, '');
INSERT INTO `system_dict_data` VALUES (7, 3, '正常', '1', 'data_status', 0, 1, 0, 0, '2021-06-27 13:36:51', '2021-06-27 13:37:01', NULL, '0为正常');
INSERT INTO `system_dict_data` VALUES (8, 3, '停用', '2', 'data_status', 0, 1, 0, 0, '2021-06-27 13:37:10', '2021-06-27 13:37:10', NULL, '1为停用');
INSERT INTO `system_dict_data` VALUES (9, 4, '统计页面', 'statistics', 'dashboard', 0, 1, 0, 0, '2021-08-09 12:53:53', '2021-08-09 12:53:53', NULL, '管理员用');
INSERT INTO `system_dict_data` VALUES (10, 4, '工作台', 'work', 'dashboard', 0, 1, 0, 0, '2021-08-09 12:54:18', '2021-08-09 12:54:18', NULL, '员工使用');
INSERT INTO `system_dict_data` VALUES (11, 5, '男', '1', 'sex', 0, 1, 0, 0, '2021-08-09 12:55:00', '2021-08-09 12:55:00', NULL, '');
INSERT INTO `system_dict_data` VALUES (12, 5, '女', '2', 'sex', 0, 1, 0, 0, '2021-08-09 12:55:08', '2021-08-09 12:55:08', NULL, '');
INSERT INTO `system_dict_data` VALUES (13, 5, '未知', '3', 'sex', 0, 1, 0, 0, '2021-08-09 12:55:16', '2021-08-09 12:55:16', NULL, '');
INSERT INTO `system_dict_data` VALUES (14, 6, 'String', '1', 'api_data_type', 7, 1, 0, 0, '2021-11-23 10:49:00', '2021-11-23 10:49:00', NULL, '');
INSERT INTO `system_dict_data` VALUES (15, 6, 'Integer', '2', 'api_data_type', 6, 1, 0, 0, '2021-11-23 10:49:29', '2021-11-23 10:49:29', NULL, '');
INSERT INTO `system_dict_data` VALUES (16, 6, 'Array', '3', 'api_data_type', 5, 1, 0, 0, '2021-11-23 10:49:38', '2021-11-23 10:49:38', NULL, '');
INSERT INTO `system_dict_data` VALUES (17, 6, 'Float', '4', 'api_data_type', 4, 1, 0, 0, '2021-11-23 10:49:46', '2021-11-23 10:49:46', NULL, '');
INSERT INTO `system_dict_data` VALUES (18, 6, 'Boolean', '5', 'api_data_type', 3, 1, 0, 0, '2021-11-23 10:49:54', '2021-11-23 10:49:54', NULL, '');
INSERT INTO `system_dict_data` VALUES (19, 6, 'Enum', '6', 'api_data_type', 2, 1, 0, 0, '2021-11-23 10:50:17', '2021-11-23 10:50:17', NULL, '');
INSERT INTO `system_dict_data` VALUES (20, 6, 'Object', '7', 'api_data_type', 1, 1, 0, 0, '2021-11-23 10:50:26', '2021-11-23 10:50:26', NULL, '');
INSERT INTO `system_dict_data` VALUES (21, 6, 'File', '8', 'api_data_type', 0, 1, 0, 0, '2021-12-25 18:32:48', '2021-12-25 18:32:48', NULL, '');
INSERT INTO `system_dict_data` VALUES (22, 7, '通知', '1', 'backend_notice_type', 2, 1, 0, 0, '2021-11-11 17:29:27', '2021-11-11 17:30:51', NULL, '');
INSERT INTO `system_dict_data` VALUES (23, 7, '公告', '2', 'backend_notice_type', 1, 1, 0, 0, '2021-11-11 17:31:42', '2021-11-11 17:31:42', NULL, '');
INSERT INTO `system_dict_data` VALUES (24, 8, '所有', 'A', 'request_mode', 5, 1, 0, 0, '2021-11-14 17:23:25', '2021-11-14 17:23:25', NULL, '');
INSERT INTO `system_dict_data` VALUES (25, 8, 'GET', 'G', 'request_mode', 4, 1, 0, 0, '2021-11-14 17:23:45', '2021-11-14 17:23:45', NULL, '');
INSERT INTO `system_dict_data` VALUES (26, 8, 'POST', 'P', 'request_mode', 3, 1, 0, 0, '2021-11-14 17:23:38', '2021-11-14 17:23:38', NULL, '');
INSERT INTO `system_dict_data` VALUES (27, 8, 'PUT', 'U', 'request_mode', 2, 1, 0, 0, '2021-11-14 17:23:45', '2021-11-14 17:23:45', NULL, '');
INSERT INTO `system_dict_data` VALUES (28, 8, 'DELETE', 'D', 'request_mode', 1, 1, 0, 0, '2021-11-14 17:23:45', '2021-11-14 17:23:45', NULL, '');
INSERT INTO `system_dict_data` VALUES (29, 9, '未生产', '1', 'queue_produce_status', 5, 1, 0, 0, '2021-12-25 18:25:28', '2021-12-25 18:25:28', NULL, '');
INSERT INTO `system_dict_data` VALUES (30, 9, '生产中', '2', 'queue_produce_status', 4, 1, 0, 0, '2021-12-25 18:25:38', '2021-12-25 18:25:38', NULL, '');
INSERT INTO `system_dict_data` VALUES (31, 9, '生产成功', '3', 'queue_produce_status', 3, 1, 0, 0, '2021-12-25 18:25:50', '2021-12-25 18:25:50', NULL, '');
INSERT INTO `system_dict_data` VALUES (32, 9, '生产失败', '4', 'queue_produce_status', 2, 1, 0, 0, '2021-12-25 18:26:14', '2021-12-25 18:26:14', NULL, '');
INSERT INTO `system_dict_data` VALUES (33, 9, '生产重复', '5', 'queue_produce_status', 1, 1, 0, 0, '2021-12-25 18:26:30', '2021-12-25 18:26:30', NULL, '');
INSERT INTO `system_dict_data` VALUES (34, 10, '未消费', '1', 'queue_consume_status', 5, 1, 0, 0, '2021-12-25 18:26:57', '2021-12-25 18:26:57', NULL, '');
INSERT INTO `system_dict_data` VALUES (35, 10, '消费中', '2', 'queue_consume_status', 4, 1, 0, 0, '2021-12-25 18:27:07', '2021-12-25 18:27:07', NULL, '');
INSERT INTO `system_dict_data` VALUES (36, 10, '消费成功', '3', 'queue_consume_status', 3, 1, 0, 0, '2021-12-25 18:27:16', '2021-12-25 18:27:16', NULL, '');
INSERT INTO `system_dict_data` VALUES (37, 10, '消费失败', '4', 'queue_consume_status', 2, 1, 0, 0, '2021-12-25 18:27:24', '2021-12-25 18:27:24', NULL, '');
INSERT INTO `system_dict_data` VALUES (38, 10, '消费重复', '5', 'queue_consume_status', 1, 1, 0, 0, '2021-12-25 18:27:35', '2021-12-25 18:27:35', NULL, '');
INSERT INTO `system_dict_data` VALUES (39, 11, '通知', 'notice', 'queue_msg_type', 1, 1, 0, 0, '2021-12-25 18:30:31', '2021-12-25 18:30:31', NULL, '');
INSERT INTO `system_dict_data` VALUES (40, 11, '公告', 'announcement', 'queue_msg_type', 2, 1, 0, 0, '2021-12-25 18:31:00', '2021-12-25 18:31:00', NULL, '');
INSERT INTO `system_dict_data` VALUES (41, 11, '待办', 'todo', 'queue_msg_type', 3, 1, 0, 0, '2021-12-25 18:31:26', '2021-12-25 18:31:26', NULL, '');
INSERT INTO `system_dict_data` VALUES (42, 11, '抄送我的', 'carbon_copy_mine', 'queue_msg_type', 4, 1, 0, 0, '2021-12-25 18:31:26', '2021-12-25 18:31:26', NULL, '');
INSERT INTO `system_dict_data` VALUES (43, 11, '私信', 'private_message', 'queue_msg_type', 5, 1, 0, 0, '2021-12-25 18:31:26', '2021-12-25 18:31:26', NULL, '');
INSERT INTO `system_dict_data` VALUES (44, 12, '图片', 'image', 'attachment_type', 10, 1, 0, 0, '2022-03-17 14:49:59', '2022-03-17 14:49:59', NULL, '');
INSERT INTO `system_dict_data` VALUES (45, 12, '文档', 'text', 'attachment_type', 9, 1, 0, 0, '2022-03-17 14:50:20', '2022-03-17 14:50:49', NULL, '');
INSERT INTO `system_dict_data` VALUES (46, 12, '音频', 'audio', 'attachment_type', 8, 1, 0, 0, '2022-03-17 14:50:37', '2022-03-17 14:50:52', NULL, '');
INSERT INTO `system_dict_data` VALUES (47, 12, '视频', 'video', 'attachment_type', 7, 1, 0, 0, '2022-03-17 14:50:45', '2022-03-17 14:50:57', NULL, '');
INSERT INTO `system_dict_data` VALUES (48, 12, '应用程序', 'application', 'attachment_type', 6, 1, 0, 0, '2022-03-17 14:50:52', '2022-03-17 14:50:59', NULL, '');

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_type`;
CREATE TABLE `system_dict_type`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典标示',
  `status` smallint NOT NULL DEFAULT 2 COMMENT '状态 (1正常 2停用)',
  `created_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者',
  `updated_by` bigint NOT NULL DEFAULT 0 COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
INSERT INTO `system_dict_type` VALUES (1, '数据表引擎', 'table_engine', 1, 0, 0, '2021-06-27 00:36:42', '2021-06-27 13:33:29', NULL, '数据表引擎字典');
INSERT INTO `system_dict_type` VALUES (2, '存储模式', 'upload_mode', 1, 0, 0, '2021-06-27 13:33:11', '2021-06-27 13:33:11', NULL, '上传文件存储模式');
INSERT INTO `system_dict_type` VALUES (3, '数据状态', 'data_status', 1, 0, 0, '2021-06-27 13:36:16', '2021-06-27 13:36:34', NULL, '通用数据状态');
INSERT INTO `system_dict_type` VALUES (4, '后台首页', 'dashboard', 1, 0, 0, '2021-08-09 12:53:17', '2021-08-09 12:53:17', NULL, '');
INSERT INTO `system_dict_type` VALUES (5, '性别', 'sex', 1, 0, 0, '2021-08-09 12:54:40', '2021-08-09 12:54:40', NULL, '');
INSERT INTO `system_dict_type` VALUES (6, '接口数据类型', 'api_data_type', 1, 0, 0, '2021-11-22 20:56:03', '2021-11-22 20:56:03', NULL, '');
INSERT INTO `system_dict_type` VALUES (7, '后台公告类型', 'backend_notice_type', 1, 0, 0, '2021-11-11 17:29:05', '2021-11-11 17:29:14', NULL, '');
INSERT INTO `system_dict_type` VALUES (8, '请求方式', 'request_mode', 1, 0, 0, '2021-11-14 17:22:52', '2021-11-14 17:22:52', NULL, '');
INSERT INTO `system_dict_type` VALUES (9, '队列生产状态', 'queue_produce_status', 1, 0, 0, '2021-12-25 18:22:38', '2021-12-25 18:22:38', NULL, '');
INSERT INTO `system_dict_type` VALUES (10, '队列消费状态', 'queue_consume_status', 1, 0, 0, '2021-12-25 18:23:19', '2021-12-25 18:23:19', NULL, '');
INSERT INTO `system_dict_type` VALUES (11, '队列消息类型', 'queue_msg_type', 1, 0, 0, '2021-12-25 18:28:40', '2021-12-25 18:28:40', NULL, '');
INSERT INTO `system_dict_type` VALUES (12, '附件类型', 'attachment_type', 1, 0, 0, '2022-03-17 14:49:23', '2022-03-17 14:49:23', NULL, '');

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `system_login_log`;
CREATE TABLE `system_login_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP地址',
  `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP所属地',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器',
  `status` smallint NOT NULL DEFAULT 1 COMMENT '登录状态 (1成功 2失败)',
  `message` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提示消息',
  `login_time` timestamp NOT NULL COMMENT '登录时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_login_log_username_index`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_login_log
-- ----------------------------
INSERT INTO `system_login_log` VALUES (1, 'superAdmin', '172.17.0.1', '未知', 'Windows 10', 'Chrome', 1, '登录成功', '2024-04-17 16:31:43', NULL);
INSERT INTO `system_login_log` VALUES (2, 'superAdmin', '172.17.0.1', '未知', 'Windows 10', 'Chrome', 1, '登录成功', '2024-04-17 16:33:47', NULL);
INSERT INTO `system_login_log` VALUES (3, 'superAdmin', '172.17.0.1', '未知', 'Windows 10', 'Chrome', 1, '登录成功', '2024-04-17 23:55:27', NULL);
INSERT INTO `system_login_log` VALUES (4, 'superAdmin', '172.17.0.1', '未知', 'Windows 10', 'Chrome', 1, '登录成功', '2024-06-09 17:01:37', NULL);
INSERT INTO `system_login_log` VALUES (5, 'superAdmin', '172.17.0.1', '未知', 'Windows 10', 'Chrome', 1, '登录成功', '2024-06-09 17:01:43', NULL);
INSERT INTO `system_login_log` VALUES (6, 'superAdmin', '172.17.0.1', '未知', 'Windows 10', 'Chrome', 1, '登录成功', '2024-06-09 17:27:31', NULL);
INSERT INTO `system_login_log` VALUES (7, 'superAdmin', '172.17.0.1', '未知', 'Windows 10', 'Chrome', 1, '登录成功', '2024-06-09 17:32:16', NULL);
INSERT INTO `system_login_log` VALUES (8, 'superAdmin', '172.17.0.1', '未知', 'Windows 10', 'Chrome', 1, '登录成功', '2024-06-09 17:36:03', NULL);

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint UNSIGNED NOT NULL COMMENT '父ID',
  `level` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组级集合',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单标识代码',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `route` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '跳转地址',
  `is_hidden` smallint NOT NULL DEFAULT 1 COMMENT '是否隐藏 (1是 2否)',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单类型, (M菜单 B按钮 L链接 I iframe)',
  `status` smallint NOT NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `created_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者',
  `updated_by` bigint NOT NULL DEFAULT 0 COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4609 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1000, 0, '0', '权限', 'permission', 'ma-icon-permission', 'permission', '', '', 2, 'M', 1, 99, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1100, 1000, '0,1000', '用户管理', 'system:user', 'ma-icon-user', 'user', 'system/user/index', '', 2, 'M', 1, 99, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1101, 1100, '0,1000,1100', '用户列表', 'system:user:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1102, 1100, '0,1000,1100', '用户回收站列表', 'system:user:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1103, 1100, '0,1000,1100', '用户保存', 'system:user:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1104, 1100, '0,1000,1100', '用户更新', 'system:user:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1105, 1100, '0,1000,1100', '用户删除', 'system:user:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1106, 1100, '0,1000,1100', '用户读取', 'system:user:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1107, 1100, '0,1000,1100', '用户恢复', 'system:user:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1108, 1100, '0,1000,1100', '用户真实删除', 'system:user:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1109, 1100, '0,1000,1100', '用户导入', 'system:user:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1110, 1100, '0,1000,1100', '用户导出', 'system:user:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1111, 1100, '0,1000,1100', '用户状态改变', 'system:user:changeStatus', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1112, 1100, '0,1000,1100', '用户初始化密码', 'system:user:initUserPassword', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1113, 1100, '0,1000,1100', '更新用户缓存', 'system:user:cache', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1114, 1100, '0,1000,1100', '设置用户首页', 'system:user:homePage', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1200, 1000, '0,1000', '菜单管理', 'system:menu', 'icon-menu', 'menu', 'system/menu/index', '', 2, 'M', 1, 96, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1201, 1200, '0,1000,1200', '菜单列表', 'system:menu:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1202, 1200, '0,1000,1200', '菜单回收站', 'system:menu:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1203, 1200, '0,1000,1200', '菜单保存', 'system:menu:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:22', '2024-04-17 16:29:22', NULL, '');
INSERT INTO `system_menu` VALUES (1204, 1200, '0,1000,1200', '菜单更新', 'system:menu:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1205, 1200, '0,1000,1200', '菜单删除', 'system:menu:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1206, 1200, '0,1000,1200', '菜单读取', 'system:menu:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1207, 1200, '0,1000,1200', '菜单恢复', 'system:menu:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1208, 1200, '0,1000,1200', '菜单真实删除', 'system:menu:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1209, 1200, '0,1000,1200', '菜单导入', 'system:menu:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1210, 1200, '0,1000,1200', '菜单导出', 'system:menu:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1300, 1000, '0,1000', '部门管理', 'system:dept', 'ma-icon-dept', 'dept', 'system/dept/index', '', 2, 'M', 1, 97, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1301, 1300, '0,1000,1300', '部门列表', 'system:dept:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1302, 1300, '0,1000,1300', '部门回收站', 'system:dept:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1303, 1300, '0,1000,1300', '部门保存', 'system:dept:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1304, 1300, '0,1000,1300', '部门更新', 'system:dept:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1305, 1300, '0,1000,1300', '部门删除', 'system:dept:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1306, 1300, '0,1000,1300', '部门读取', 'system:dept:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1307, 1300, '0,1000,1300', '部门恢复', 'system:dept:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1308, 1300, '0,1000,1300', '部门真实删除', 'system:dept:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1309, 1300, '0,1000,1300', '部门导入', 'system:dept:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1310, 1300, '0,1000,1300', '部门导出', 'system:dept:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1311, 1300, '0,1000,1300', '部门状态改变', 'system:dept:changeStatus', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (1400, 1000, '0,1000', '角色管理', 'system:role', 'ma-icon-role', 'role', 'system/role/index', '', 2, 'M', 1, 98, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1401, 1400, '0,1000,1400', '角色列表', 'system:role:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1402, 1400, '0,1000,1400', '角色回收站', 'system:role:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1403, 1400, '0,1000,1400', '角色保存', 'system:role:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1404, 1400, '0,1000,1400', '角色更新', 'system:role:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1405, 1400, '0,1000,1400', '角色删除', 'system:role:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1406, 1400, '0,1000,1400', '角色读取', 'system:role:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1407, 1400, '0,1000,1400', '角色恢复', 'system:role:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1408, 1400, '0,1000,1400', '角色真实删除', 'system:role:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1409, 1400, '0,1000,1400', '角色导入', 'system:role:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1410, 1400, '0,1000,1400', '角色导出', 'system:role:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1411, 1400, '0,1000,1400', '角色状态改变', 'system:role:changeStatus', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1412, 1400, '0,1000,1400', '更新菜单权限', 'system:role:menuPermission', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1413, 1400, '0,1000,1400', '更新数据权限', 'system:role:dataPermission', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:23', '2024-04-17 16:29:23', NULL, '');
INSERT INTO `system_menu` VALUES (1500, 1000, '0,1000', '岗位管理', 'system:post', 'ma-icon-post', 'post', 'system/post/index', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1501, 1500, '0,1000,1500', '岗位列表', 'system:post:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1502, 1500, '0,1000,1500', '岗位回收站', 'system:post:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1503, 1500, '0,1000,1500', '岗位保存', 'system:post:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1504, 1500, '0,1000,1500', '岗位更新', 'system:post:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1505, 1500, '0,1000,1500', '岗位删除', 'system:post:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1506, 1500, '0,1000,1500', '岗位读取', 'system:post:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1507, 1500, '0,1000,1500', '岗位恢复', 'system:post:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1508, 1500, '0,1000,1500', '岗位真实删除', 'system:post:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1509, 1500, '0,1000,1500', '岗位导入', 'system:post:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1510, 1500, '0,1000,1500', '岗位导出', 'system:post:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (1511, 1500, '0,1000,1500', '岗位状态改变', 'system:post:changeStatus', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2000, 0, '0', '数据', 'dataCenter', 'icon-storage', 'dataCenter', '', '', 2, 'M', 1, 98, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2100, 2000, '0,2000', '数据字典', 'system:dict', 'ma-icon-dict', 'dict', 'system/dict/index', '', 2, 'M', 1, 99, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2101, 2100, '0,2000,2100', '数据字典列表', 'system:dict:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2102, 2100, '0,2000,2100', '数据字典回收站', 'system:dict:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2103, 2100, '0,2000,2100', '数据字典保存', 'system:dict:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2104, 2100, '0,2000,2100', '数据字典更新', 'system:dict:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2105, 2100, '0,2000,2100', '数据字典删除', 'system:dict:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2106, 2100, '0,2000,2100', '数据字典读取', 'system:dict:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2107, 2100, '0,2000,2100', '数据字典恢复', 'system:dict:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2108, 2100, '0,2000,2100', '数据字典真实删除', 'system:dict:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2109, 2100, '0,2000,2100', '数据字典导入', 'system:dict:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2110, 2100, '0,2000,2100', '数据字典导出', 'system:dict:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2112, 2100, '0,2000,2100', '字典状态改变', 'system:dataDict:changeStatus', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2200, 2000, '0,2000', '附件管理', 'system:attachment', 'ma-icon-attach', 'attachment', 'system/attachment/index', '', 2, 'M', 1, 98, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2201, 2300, '0,2000,2200', '附件删除', 'system:attachment:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2202, 2200, '0,2000,2200', '附件列表', 'system:attachment:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:24', '2024-04-17 16:29:24', NULL, '');
INSERT INTO `system_menu` VALUES (2203, 2200, '0,2000,2200', '附件回收站', 'system:attachment:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (2204, 2200, '0,2000,2200', '附件真实删除', 'system:attachment:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (2300, 2000, '0,2000', '数据表维护', 'system:dataMaintain', 'ma-icon-db', 'dataMaintain', 'system/dataMaintain/index', '', 2, 'M', 1, 95, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (2301, 2300, '0,2000,2300', '数据表列表', 'system:dataMaintain:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (2302, 2300, '0,2000,2300', '数据表详细', 'system:dataMaintain:detailed', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (2303, 2300, '0,2000,2300', '数据表清理碎片', 'system:dataMaintain:fragment', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (2304, 2300, '0,2000,2300', '数据表优化', 'system:dataMaintain:optimize', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (2500, 2000, '0,2000', '应用中心', 'apps', 'icon-apps', 'apps', '', '', 2, 'M', 1, 90, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2510, 2500, '0,2000,2500', '应用分组', 'system:appGroup', 'ma-icon-group', 'appGroup', 'system/appGroup/index', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2511, 2510, '0,2000,2500,2510', '应用分组列表', 'system:appGroup:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2512, 2510, '0,2000,2500,2510', '应用分组回收站', 'system:appGroup:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2513, 2510, '0,2000,2500,2510', '应用分组保存', 'system:appGroup:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2514, 2510, '0,2000,2500,2510', '应用分组更新', 'system:appGroup:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2515, 2510, '0,2000,2500,2510', '应用分组删除', 'system:appGroup:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2516, 2510, '0,2000,2500,2510', '应用分组读取', 'system:appGroup:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2517, 2510, '0,2000,2500,2510', '应用分组恢复', 'system:appGroup:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2518, 2510, '0,2000,2500,2510', '应用分组真实删除', 'system:appGroup:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2519, 2510, '0,2000,2500,2510', '应用分组导入', 'system:appGroup:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2520, 2510, '0,2000,2500,2510', '应用分组导出', 'system:appGroup:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (2530, 2500, '0,2000,2500', '应用管理', 'system:app', 'icon-archive', 'app', 'system/app/index', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2531, 2530, '0,2000,2500,2530', '应用列表', 'system:app:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2532, 2530, '0,2000,2500,2530', '应用回收站', 'system:app:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2533, 2530, '0,2000,2500,2530', '应用保存', 'system:app:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2534, 2530, '0,2000,2500,2530', '应用更新', 'system:app:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2535, 2530, '0,2000,2500,2530', '应用删除', 'system:app:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2536, 2530, '0,2000,2500,2530', '应用读取', 'system:app:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2537, 2530, '0,2000,2500,2530', '应用恢复', 'system:app:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2538, 2530, '0,2000,2500,2530', '应用真实删除', 'system:app:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2539, 2530, '0,2000,2500,2530', '应用导入', 'system:app:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2540, 2530, '0,2000,2500,2530', '应用导出', 'system:app:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2541, 2530, '0,2000,2500,2530', '应用绑定接口', 'system:app:bind', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2600, 2000, '0,2000', '应用接口', 'apis', 'icon-common', 'apis', '', '', 2, 'M', 1, 80, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2610, 2600, '0,2000,2600', '接口分组', 'system:apiGroup', 'ma-icon-group', 'apiGroup', 'system/apiGroup/index', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2611, 2610, '0,2000,2600,2610', '接口分组列表', 'system:apiGroup:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2612, 2610, '0,2000,2600,2610', '接口分组回收站', 'system:apiGroup:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2613, 2610, '0,2000,2600,2610', '接口分组保存', 'system:apiGroup:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2614, 2610, '0,2000,2600,2610', '接口分组更新', 'system:apiGroup:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2615, 2610, '0,2000,2600,2610', '接口分组删除', 'system:apiGroup:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2616, 2610, '0,2000,2600,2610', '接口分组读取', 'system:apiGroup:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2617, 2610, '0,2000,2600,2610', '接口分组恢复', 'system:apiGroup:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2618, 2610, '0,2000,2600,2610', '接口分组真实删除', 'system:apiGroup:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2619, 2610, '0,2000,2600,2610', '接口分组导入', 'system:apiGroup:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2620, 2610, '0,2000,2600,2610', '接口分组导出', 'system:apiGroup:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2630, 2600, '0,2000,2600', '接口管理', 'system:api', 'icon-mind-mapping', 'api', 'system/api/index', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2631, 2630, '0,2000,2600,2630', '接口列表', 'system:api:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2632, 2630, '0,2000,2600,2630', '接口回收站', 'system:api:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2633, 2630, '0,2000,2600,2630', '接口保存', 'system:api:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2634, 2630, '0,2000,2600,2630', '接口更新', 'system:api:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2635, 2630, '0,2000,2600,2630', '接口删除', 'system:api:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2636, 2630, '0,2000,2600,2630', '接口读取', 'system:api:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:27', '2024-04-17 16:29:27', NULL, '');
INSERT INTO `system_menu` VALUES (2637, 2630, '0,2000,2600,2630', '接口恢复', 'system:api:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2638, 2630, '0,2000,2600,2630', '接口真实删除', 'system:api:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2639, 2630, '0,2000,2600,2630', '接口导入', 'system:api:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2640, 2630, '0,2000,2600,2630', '接口导出', 'system:api:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2700, 2000, '0,2000', '系统公告', 'system:notice', 'icon-bulb', 'notice', 'system/notice/index', '', 2, 'M', 1, 94, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2701, 2700, '0,2000,2700', '系统公告列表', 'system:notice:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2702, 2700, '0,2000,2700', '系统公告回收站', 'system:notice:recycle', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2703, 2700, '0,2000,2700', '系统公告保存', 'system:notice:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2704, 2700, '0,2000,2700', '系统公告更新', 'system:notice:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2705, 2700, '0,2000,2700', '系统公告删除', 'system:notice:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2706, 2700, '0,2000,2700', '系统公告读取', 'system:notice:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2707, 2700, '0,2000,2700', '系统公告恢复', 'system:notice:recovery', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2708, 2700, '0,2000,2700', '系统公告真实删除', 'system:notice:realDelete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2709, 2700, '0,2000,2700', '系统公告导入', 'system:notice:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (2710, 2700, '0,2000,2700', '系统公告导出', 'system:notice:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (3000, 0, '0', '监控', 'monitor', 'icon-desktop', 'monitor', '', '', 2, 'M', 1, 97, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3200, 3000, '0,3000', '服务监控', 'system:monitor:server', 'icon-thunderbolt', 'server', 'system/monitor/server/index', '', 2, 'M', 1, 99, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3300, 3000, '0,3000', '日志监控', 'logs', 'icon-book', 'logs', '', '', 2, 'M', 1, 95, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3400, 3300, '0,3000,3200', '登录日志', 'system:loginLog', 'icon-idcard', 'loginLog', 'system/logs/loginLog', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3401, 3400, '0,3000,3200,3300', '登录日志删除', 'system:loginLog:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3500, 3300, '0,3000,3200', '操作日志', 'system:operLog', 'icon-robot', 'operLog', 'system/logs/operLog', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3501, 3500, '0,3000,3200,3400', '操作日志删除', 'system:operLog:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3600, 3000, '0,3000', '在线用户', 'system:onlineUser', 'ma-icon-online', 'onlineUser', 'system/monitor/onlineUser/index', '', 2, 'M', 1, 98, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3601, 3500, '0,3000,3500', '在线用户列表', 'system:onlineUser:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3602, 3500, '0,3000,3500', '强退用户', 'system:onlineUser:kick', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (3700, 3000, '0,3000', '缓存监控', 'system:cache', 'icon-dice', 'cache', 'system/monitor/cache/index', '', 2, 'M', 1, 98, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (3701, 3700, '0,3000,3700', '获取Redis信息', 'system:cache:monitor', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (3702, 3700, '0,3000,3700', '删除一个缓存', 'system:cache:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (3703, 3700, '0,3000,3700', '清空所有缓存', 'system:cache:clear', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (3800, 3300, '0,3000,3300', '接口日志', 'system:apiLog', 'icon-calendar', 'apiLog', 'system/logs/apiLog', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (3801, 3800, '0,3000,3300,3800', '接口日志删除', 'system:apiLog:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (3850, 3300, '0,3000,3300', '队列日志', 'system:queueLog', 'icon-layers', 'queueLog', 'system/logs/queueLog', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (3851, 3850, '0,3000,3300,3850', '删除队列日志', 'system:queueLog:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (3852, 3850, '0,3000,3300,3850', '更新队列状态', 'system:queueLog:updateStatus', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (4000, 0, '0', '工具', 'devTools', 'ma-icon-tool', 'devTools', '', '', 2, 'M', 1, 95, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4100, 4000, '0,4000', '模块管理', 'setting:module', 'icon-folder', 'module', 'setting/module/index', '', 2, 'M', 1, 99, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4101, 4100, '0,4000,4100', '新增模块', 'setting:module:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4102, 4100, '0,4000,4100', '模块删除', 'setting:module:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4103, 4100, '0,4000,4100', '模块列表', 'setting:module:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4104, 4100, '0,4000,4100', '模块启停用', 'setting:module:status', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (4105, 4100, '0,4000,4100', '安装模块', 'setting:module:install', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');
INSERT INTO `system_menu` VALUES (4200, 4000, '0,4000', '代码生成器', 'setting:code', 'ma-icon-code', 'code', 'setting/code/index', '', 2, 'M', 1, 98, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4201, 4200, '0,4000,4200', '预览代码', 'setting:code:preview', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4202, 4200, '0,4000,4200', '装载数据表', 'setting:code:loadTable', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4203, 4200, '0,4000,4200', '删除业务表', 'setting:code:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4204, 4200, '0,4000,4200', '同步业务表', 'setting:code:sync', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4205, 4200, '0,4000,4200', '生成代码', 'setting:code:generate', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4400, 4000, '0,4000', '定时任务', 'setting:crontab', 'icon-schedule', 'crontab', 'setting/crontab/index', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:25', '2024-04-17 16:29:25', NULL, '');
INSERT INTO `system_menu` VALUES (4401, 4400, '0,4000,4400', '定时任务列表', 'setting:crontab:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4402, 4400, '0,4000,4400', '定时任务保存', 'setting:crontab:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4403, 4400, '0,4000,4400', '定时任务更新', 'setting:crontab:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4404, 4400, '0,4000,4400', '定时任务删除', 'setting:crontab:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4405, 4400, '0,4000,4400', '定时任务读取', 'setting:crontab:read', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4406, 4400, '0,4000,4400', '定时任务导入', 'setting:crontab:import', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4407, 4400, '0,4000,4400', '定时任务导出', 'setting:crontab:export', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4408, 4400, '0,4000,4400', '定时任务执行', 'setting:crontab:run', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4409, 4400, '0,4000,4400', '定时任务日志删除', 'setting:crontab:deleteLog', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:28', '2024-04-17 16:29:28', NULL, '');
INSERT INTO `system_menu` VALUES (4500, 0, '0', '系统设置', 'setting:config', 'icon-settings', 'system', 'setting/config/index', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4502, 4500, '0,4500', '配置列表', 'setting:config:index', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4504, 4500, '0,4500', '新增配置 ', 'setting:config:save', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4505, 4500, '0,4500', '更新配置', 'setting:config:update', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4506, 4500, '0,4500', '删除配置', 'setting:config:delete', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4507, 4500, '0,4500', '清除配置缓存', 'setting:config:clearCache', '', '', '', '', 1, 'B', 1, 0, 0, 0, '2024-04-17 16:29:26', '2024-04-17 16:29:26', NULL, '');
INSERT INTO `system_menu` VALUES (4600, 4000, '0,4000', '系统接口', 'systemInterface', 'icon-compass', 'systemInterface', 'setting/systemInterface/index', '', 2, 'M', 1, 0, 0, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');
INSERT INTO `system_menu` VALUES (4601, 4000, '0,4000', '数据源管理', 'setting:datasource', 'icon-storage', 'setting/datasource', 'setting/datasource/index', '', 2, 'M', 1, 0, 1, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');
INSERT INTO `system_menu` VALUES (4602, 4601, '0,4000,4601', '数据源管理列表', 'setting:datasource:index', '', '', '', '', 2, 'B', 1, 0, 0, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');
INSERT INTO `system_menu` VALUES (4603, 4601, '0,4000,4601', '数据源管理保存', 'setting:datasource:save', '', '', '', '', 2, 'B', 1, 0, 0, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');
INSERT INTO `system_menu` VALUES (4604, 4601, '0,4000,4601', '数据源管理更新', 'setting:datasource:update', '', '', '', '', 2, 'B', 1, 0, 0, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');
INSERT INTO `system_menu` VALUES (4605, 4601, '0,4000,4601', '数据源管理读取', 'setting:datasource:read', '', '', '', '', 2, 'B', 1, 0, 0, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');
INSERT INTO `system_menu` VALUES (4606, 4601, '0,4000,4601', '数据源管理删除', 'setting:datasource:delete', '', '', '', '', 2, 'B', 1, 0, 0, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');
INSERT INTO `system_menu` VALUES (4607, 4601, '0,4000,4601', '数据源管理导入', 'setting:datasource:import', '', '', '', '', 2, 'B', 1, 0, 0, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');
INSERT INTO `system_menu` VALUES (4608, 4601, '0,4000,4601', '数据源管理导出', 'setting:datasource:export', '', '', '', '', 2, 'B', 1, 0, 0, 0, '2024-04-17 16:29:29', '2024-04-17 16:29:29', NULL, '');

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_id` bigint NOT NULL COMMENT '消息ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `type` smallint NOT NULL COMMENT '公告类型（1通知 2公告）',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公告内容',
  `click_num` int NULL DEFAULT 0 COMMENT '浏览次数',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_notice_message_id_index`(`message_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_notice
-- ----------------------------

-- ----------------------------
-- Table structure for system_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `system_oper_log`;
CREATE TABLE `system_oper_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求方式',
  `router` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求路由',
  `service_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务名称',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求IP地址',
  `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP所属地',
  `request_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求数据',
  `response_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '响应状态码',
  `response_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '响应数据',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_oper_log_username_index`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oper_log
-- ----------------------------
INSERT INTO `system_oper_log` VALUES (1, 'superAdmin', 'POST', '/setting/config/updateByKeys', '更新配置', '172.17.0.1', '未知', '{\"site_name\":\"AingoAdmin\",\"site_keywords\":\"后台管理系统\",\"site_desc\":\"AingoAdmin\",\"site_copyright\":\"Copyright © 2019-2022 AingoAdmin. All rights reserved.\",\"site_record_number\":\"xxx\"}', '200', '{\"requestId\":\"98fe5d45-4882-4a91-8bae-28942e327f41\",\"path\":\"\\/setting\\/config\\/updateByKeys\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":[]}', 1, 1, '2024-06-09 17:32:43', '2024-06-09 17:32:43', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (2, 'superAdmin', 'PUT', '/system/dept/update/1', '部门更新', '172.17.0.1', '未知', '{\"id\":1,\"level\":\"0\",\"name\":\"自己的科技\",\"leader\":\"大熊\",\"phone\":\"16888888888\",\"status\":\"1\",\"sort\":0,\"created_by\":1,\"updated_by\":null,\"created_at\":\"2024-04-17 16:29:19\",\"updated_at\":\"2024-04-17 16:29:19\"}', '200', '{\"requestId\":\"fb47ad9d-6a73-466a-9214-8367ba8a467d\",\"path\":\"\\/system\\/dept\\/update\\/1\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":[]}', 1, 1, '2024-06-09 17:44:52', '2024-06-09 17:44:52', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (3, 'superAdmin', 'POST', '/system/role/save', '角色保存', '172.17.0.1', '未知', '{\"sort\":1,\"status\":\"1\",\"name\":\"开发者\",\"code\":\"developer\"}', '200', '{\"requestId\":\"d82b7ae4-4b99-45dc-8867-4a85593ec3a0\",\"path\":\"\\/system\\/role\\/save\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":{\"id\":2}}', 1, 1, '2024-06-09 17:45:47', '2024-06-09 17:45:47', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (4, 'superAdmin', 'POST', '/system/role/save', '角色保存', '172.17.0.1', '未知', '{\"sort\":1,\"status\":\"1\",\"name\":\"测试员\",\"code\":\"tester\"}', '200', '{\"requestId\":\"2e994305-e1fa-4d36-9465-b1aa4adc66e9\",\"path\":\"\\/system\\/role\\/save\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":{\"id\":3}}', 1, 1, '2024-06-09 17:46:10', '2024-06-09 17:46:10', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (5, 'superAdmin', 'POST', '/system/post/save', '岗位保存', '172.17.0.1', '未知', '{\"sort\":1,\"status\":\"1\",\"name\":\"Golang开发岗\",\"code\":\"go-developer\"}', '200', '{\"requestId\":\"51204af6-23d5-4b8d-b04d-a3a61af9e259\",\"path\":\"\\/system\\/post\\/save\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":{\"id\":1}}', 1, 1, '2024-06-09 17:47:08', '2024-06-09 17:47:08', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (6, 'superAdmin', 'POST', '/system/post/save', '岗位保存', '172.17.0.1', '未知', '{\"sort\":1,\"status\":\"1\",\"name\":\"PHP开发岗\",\"code\":\"php-developer\"}', '200', '{\"requestId\":\"502400a5-8b56-4c7b-a6d2-49e01b11fcce\",\"path\":\"\\/system\\/post\\/save\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":{\"id\":2}}', 1, 1, '2024-06-09 17:47:28', '2024-06-09 17:47:28', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (7, 'superAdmin', 'POST', '/system/user/save', '用户保存', '172.17.0.1', '未知', '{\"password\":\"123456\",\"status\":\"1\",\"avatar\":\"c9f0129e4429f63e3b9e0a5da07a48ad\",\"role_ids\":[2],\"post_ids\":[1],\"username\":\"张三\",\"dept_ids\":[1]}', '200', '{\"requestId\":\"65162b24-0fc9-4c76-ac09-0e4bd5b8c187\",\"path\":\"\\/system\\/user\\/save\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":{\"id\":2}}', 1, 1, '2024-06-09 17:48:00', '2024-06-09 17:48:00', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (8, 'superAdmin', 'POST', '/system/user/save', '用户保存', '172.17.0.1', '未知', '{\"password\":\"123456\",\"status\":\"1\",\"avatar\":\"c7500dd23143ecfe03cd700d4c685231\",\"username\":\"lisi\",\"dept_ids\":[1],\"nickname\":\"李四\",\"role_ids\":[3,2],\"post_ids\":[2],\"email\":\"li4@admin.com\"}', '200', '{\"requestId\":\"eb2e71b1-ad27-4f84-bc12-0596dee2526e\",\"path\":\"\\/system\\/user\\/save\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":{\"id\":3}}', 1, 1, '2024-06-09 17:50:25', '2024-06-09 17:50:25', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (9, 'superAdmin', 'POST', '/system/dept/save', '部门保存', '172.17.0.1', '未知', '{\"sort\":1,\"status\":\"1\",\"parent_id\":1,\"name\":\"技术部\",\"leader\":\"张三\"}', '200', '{\"requestId\":\"2f693024-3c95-4bbe-ba33-d712c0a1313d\",\"path\":\"\\/system\\/dept\\/save\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":{\"id\":2}}', 1, 1, '2024-06-09 17:51:25', '2024-06-09 17:51:25', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (10, 'superAdmin', 'POST', '/system/dept/save', '部门保存', '172.17.0.1', '未知', '{\"sort\":1,\"status\":\"1\",\"parent_id\":1,\"name\":\"运营部\",\"leader\":\"王八\"}', '200', '{\"requestId\":\"05cbc781-67ad-4349-801c-a626b75fac99\",\"path\":\"\\/system\\/dept\\/save\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":{\"id\":3}}', 1, 1, '2024-06-09 17:51:53', '2024-06-09 17:51:53', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (11, 'superAdmin', 'PUT', '/system/user/update/2', '用户更新', '172.17.0.1', '未知', '{\"id\":2,\"username\":\"zhangSan\",\"password\":\"\",\"user_type\":\"100\",\"nickname\":\"张三\",\"email\":\"zhang3@admin.com\",\"avatar\":\"c9f0129e4429f63e3b9e0a5da07a48ad\",\"signed\":null,\"dashboard\":null,\"status\":\"1\",\"login_ip\":null,\"login_time\":null,\"backend_setting\":null,\"created_by\":1,\"updated_by\":1,\"created_at\":\"2024-06-09 17:48:00\",\"updated_at\":\"2024-06-09 17:48:00\",\"role_ids\":[2],\"post_ids\":[1],\"dept_ids\":[1,2]}', '200', '{\"requestId\":\"30aa9b09-2442-4367-8a6e-5a59387fa74f\",\"path\":\"\\/system\\/user\\/update\\/2\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":[]}', 1, 1, '2024-06-09 17:52:11', '2024-06-09 17:52:11', NULL, NULL);
INSERT INTO `system_oper_log` VALUES (12, 'superAdmin', 'PUT', '/system/user/update/3', '用户更新', '172.17.0.1', '未知', '{\"id\":3,\"username\":\"lisi\",\"password\":\"\",\"user_type\":\"100\",\"nickname\":\"李四\",\"email\":\"li4@admin.com\",\"avatar\":\"c7500dd23143ecfe03cd700d4c685231\",\"signed\":null,\"dashboard\":null,\"status\":\"1\",\"login_ip\":null,\"login_time\":null,\"backend_setting\":null,\"created_by\":1,\"updated_by\":1,\"created_at\":\"2024-06-09 17:50:25\",\"updated_at\":\"2024-06-09 17:50:25\",\"role_ids\":[2,3],\"post_ids\":[2],\"dept_ids\":[1,2]}', '200', '{\"requestId\":\"2581b3c3-c677-4aae-8705-e7cbb196f1d8\",\"path\":\"\\/system\\/user\\/update\\/3\",\"success\":true,\"message\":\"请求成功\",\"code\":200,\"data\":[]}', 1, 1, '2024-06-09 17:52:18', '2024-06-09 17:52:18', NULL, NULL);

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS `system_post`;
CREATE TABLE `system_post`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位代码',
  `sort` smallint UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `status` smallint NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_post
-- ----------------------------
INSERT INTO `system_post` VALUES (1, 'Golang开发岗', 'go-developer', 1, 1, 1, 1, '2024-06-09 17:47:08', '2024-06-09 17:47:08', NULL, NULL);
INSERT INTO `system_post` VALUES (2, 'PHP开发岗', 'php-developer', 1, 1, 1, 1, '2024-06-09 17:47:28', '2024-06-09 17:47:28', NULL, NULL);

-- ----------------------------
-- Table structure for system_queue_log
-- ----------------------------
DROP TABLE IF EXISTS `system_queue_log`;
CREATE TABLE `system_queue_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exchange_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交换机名称',
  `routing_key_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路由名称',
  `queue_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '队列名称',
  `queue_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '队列数据',
  `log_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '队列日志',
  `produce_status` smallint NULL DEFAULT 1 COMMENT '生产状态 1:未生产 2:生产中 3:生产成功 4:生产失败 5:生产重复',
  `consume_status` smallint NULL DEFAULT 1 COMMENT '消费状态 1:未消费 2:消费中 3:消费成功 4:消费失败 5:消费重复',
  `delay_time` int UNSIGNED NOT NULL COMMENT '延迟时间（秒）',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '队列日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_queue_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_queue_message
-- ----------------------------
DROP TABLE IF EXISTS `system_queue_message`;
CREATE TABLE `system_queue_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '内容ID',
  `content_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息标题',
  `send_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '发送人',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '消息内容',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_queue_message_content_type_index`(`content_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '队列消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_queue_message
-- ----------------------------

-- ----------------------------
-- Table structure for system_queue_message_receive
-- ----------------------------
DROP TABLE IF EXISTS `system_queue_message_receive`;
CREATE TABLE `system_queue_message_receive`  (
  `message_id` bigint UNSIGNED NOT NULL COMMENT '队列消息主键',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '接收用户主键',
  `read_status` smallint NULL DEFAULT 1 COMMENT '已读状态 (1未读 2已读)',
  PRIMARY KEY (`message_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '队列消息接收人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_queue_message_receive
-- ----------------------------

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色代码',
  `data_scope` smallint NULL DEFAULT 1 COMMENT '数据范围（1：全部数据权限 2：自定义数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：本人数据权限）',
  `status` smallint NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `sort` smallint UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '超级管理员（创始人）', 'superAdmin', 0, 1, 0, 1, 0, '2024-04-17 16:29:18', '2024-04-17 16:29:18', NULL, '系统内置角色，不可删除');
INSERT INTO `system_role` VALUES (2, '开发者', 'developer', 1, 1, 1, 1, 1, '2024-06-09 17:45:47', '2024-06-09 17:45:47', NULL, NULL);
INSERT INTO `system_role` VALUES (3, '测试员', 'tester', 1, 1, 1, 1, 1, '2024-06-09 17:46:10', '2024-06-09 17:46:10', NULL, NULL);

-- ----------------------------
-- Table structure for system_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_role_dept`;
CREATE TABLE `system_role_dept`  (
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色主键',
  `dept_id` bigint UNSIGNED NOT NULL COMMENT '部门主键',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色与部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色主键',
  `menu_id` bigint UNSIGNED NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色与菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `system_uploadfile`;
CREATE TABLE `system_uploadfile`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `storage_mode` smallint NULL DEFAULT 1 COMMENT '存储模式 (1 本地 2 阿里云 3 七牛云 4 腾讯云)',
  `origin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '原文件名',
  `object_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '新文件名',
  `hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件hash',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '资源类型',
  `storage_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '存储目录',
  `suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `size_byte` bigint NULL DEFAULT NULL COMMENT '字节数',
  `size_info` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'url地址',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_uploadfile_hash_unique`(`hash` ASC) USING BTREE,
  INDEX `system_uploadfile_storage_path_index`(`storage_path` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '上传文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_uploadfile
-- ----------------------------
INSERT INTO `system_uploadfile` VALUES (1, 1, 'logo.jpg', '658484136129859584.jpg', '8f2e0c1385325402ea081d41ca3fc156', 'image/jpeg', '20240609', 'jpg', 80456, '78.57KB', '/uploadfile/20240609/658484136129859584.jpg', 1, 1, '2024-06-09 17:40:52', '2024-06-09 17:40:52', NULL, NULL);
INSERT INTO `system_uploadfile` VALUES (2, 1, '微信图片_20231208210744.jpg', '658484312726839296.jpg', 'c9f0129e4429f63e3b9e0a5da07a48ad', 'image/jpeg', '20240609', 'jpg', 660521, '645.04KB', '/uploadfile/20240609/658484312726839296.jpg', 1, 1, '2024-06-09 17:41:34', '2024-06-09 17:41:34', NULL, NULL);
INSERT INTO `system_uploadfile` VALUES (3, 1, 'rw_1.png', '658486390639566848.png', 'c7500dd23143ecfe03cd700d4c685231', 'image/png', '20240609', 'png', 44631, '43.58KB', '/uploadfile/20240609/658486390639566848.png', 1, 1, '2024-06-09 17:49:49', '2024-06-09 17:49:49', NULL, NULL);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID，主键',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `user_type` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '100' COMMENT '用户类型：(100系统用户)',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `signed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个人签名',
  `dashboard` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '后台首页类型',
  `status` smallint NULL DEFAULT 1 COMMENT '状态 (1正常 2停用)',
  `login_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '最后登陆时间',
  `backend_setting` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '后台设置数据',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_user_username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, 'superAdmin', '$2y$10$n4KDNWAKUe7KfDNIiR/c.e2AxbP2RD2HSS7qWJighU9zhggD3EZE2', '100', '创始人', '16858888988', 'admin@admin.com', NULL, '广阔天地，大有所为', 'statistics', 1, '172.17.0.1', '2024-06-09 17:36:03', NULL, 0, 0, '2024-04-17 16:29:18', '2024-06-09 17:36:03', NULL, NULL);
INSERT INTO `system_user` VALUES (2, 'zhangSan', '$2y$10$d1oOlXmQUx8x0gPviKQOCuaxUR4.axDPxW7PqKXtHOZ5QwJqLpetq', '100', '张三', NULL, 'zhang3@admin.com', 'c9f0129e4429f63e3b9e0a5da07a48ad', NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2024-06-09 17:48:00', '2024-06-09 17:48:00', NULL, NULL);
INSERT INTO `system_user` VALUES (3, 'lisi', '$2y$10$sLoCaLG3Nq.rpa86XmKhJ.m0tqAKxTD6JWnEy8Aqfy2bXgZxGlp9O', '100', '李四', NULL, 'li4@admin.com', 'c7500dd23143ecfe03cd700d4c685231', NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2024-06-09 17:50:25', '2024-06-09 17:50:25', NULL, NULL);

-- ----------------------------
-- Table structure for system_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_user_dept`;
CREATE TABLE `system_user_dept`  (
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户主键',
  `dept_id` bigint UNSIGNED NOT NULL COMMENT '部门主键',
  PRIMARY KEY (`user_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_dept
-- ----------------------------
INSERT INTO `system_user_dept` VALUES (1, 1);
INSERT INTO `system_user_dept` VALUES (2, 1);
INSERT INTO `system_user_dept` VALUES (2, 2);
INSERT INTO `system_user_dept` VALUES (3, 1);
INSERT INTO `system_user_dept` VALUES (3, 2);

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS `system_user_post`;
CREATE TABLE `system_user_post`  (
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户主键',
  `post_id` bigint UNSIGNED NOT NULL COMMENT '岗位主键',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
INSERT INTO `system_user_post` VALUES (2, 1);
INSERT INTO `system_user_post` VALUES (3, 2);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户主键',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (1, 1);
INSERT INTO `system_user_role` VALUES (2, 2);
INSERT INTO `system_user_role` VALUES (3, 2);
INSERT INTO `system_user_role` VALUES (3, 3);

SET FOREIGN_KEY_CHECKS = 1;
