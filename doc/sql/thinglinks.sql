-- use `thinglinks`;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`
(
    `id`    int(11)      NOT NULL AUTO_INCREMENT,
    `ptype` varchar(100) NOT NULL,
    `v0`    varchar(100) DEFAULT NULL,
    `v1`    varchar(100) DEFAULT NULL,
    `v2`    varchar(100) DEFAULT NULL,
    `v3`    varchar(100) DEFAULT NULL,
    `v4`    varchar(100) DEFAULT NULL,
    `v5`    varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
BEGIN;
COMMIT;


-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
-- thinglinks_test.device definition

CREATE TABLE `device`
(
    `id`                     bigint(19)                         NOT NULL AUTO_INCREMENT COMMENT 'id',
    `client_id`              varchar(255)                       NOT NULL COMMENT '客户端标识',
    `user_name`              varchar(255)                       NOT NULL COMMENT '用户名',
    `password`               varchar(255)                       NOT NULL COMMENT '密码',
    `app_id`                 varchar(64)                        NOT NULL COMMENT '应用ID',
    `auth_mode`              varchar(255)                                DEFAULT NULL COMMENT '认证方式',
    `device_identification`  varchar(100)                       NOT NULL COMMENT '设备标识',
    `device_name`            varchar(255)                       NOT NULL COMMENT '设备名称',
    `connector`              varchar(255)                                DEFAULT NULL COMMENT '连接实例',
    `device_description`     varchar(255)                                DEFAULT NULL COMMENT '设备描述',
    `device_status`          varchar(255)                       NOT NULL COMMENT '设备状态： 启用 || 禁用',
    `connect_status`         varchar(255)                                DEFAULT NULL COMMENT '连接状态 : 在线：ONLINE || 离线：OFFLINE || 未连接：INIT',
    `is_will`                varchar(255)                                DEFAULT NULL COMMENT '是否遗言',
    `device_tags`            varchar(255)                                DEFAULT NULL COMMENT '设备标签',
    `product_identification` varchar(255)                       NOT NULL COMMENT '产品标识',
    `protocol_type`          varchar(255)                       NOT NULL COMMENT '产品协议类型 ：mqtt || coap || modbus || http',
    `device_type`            varchar(255)                                DEFAULT NULL COMMENT '设备类型',
    `create_by`              varchar(64)                                 DEFAULT 'ununited' COMMENT '创建者',
    `create_time`            datetime                           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`              varchar(64)                                 DEFAULT '' COMMENT '更新者',
    `update_time`            datetime                           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`                 varchar(500)                                DEFAULT NULL COMMENT '备注',
    `encrypt_key`            varchar(255) CHARACTER SET utf8mb4          DEFAULT '' COMMENT '加密密钥',
    `encrypt_vector`         varchar(255) CHARACTER SET utf8mb4          DEFAULT '' COMMENT '加密向量',
    `sign_key`               varchar(255) CHARACTER SET utf8mb4          DEFAULT '' COMMENT '签名密钥',
    `encrypt_method`         varchar(4)                         NOT NULL DEFAULT '0' COMMENT '协议加密方式',
    `sw_version`             varchar(255) CHARACTER SET utf8mb4          DEFAULT '' COMMENT '软件版本',
    `fw_version`             varchar(255) CHARACTER SET utf8mb4          DEFAULT '' COMMENT '固件版本',
    `device_sdk_version`     varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'v1' COMMENT 'sdk版本',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `device_id` (`device_identification`) USING BTREE COMMENT '设备标识',
    KEY `client_id` (`client_id`) USING BTREE COMMENT '客户端标识'
) ENGINE = InnoDB
  AUTO_INCREMENT = 84
  DEFAULT CHARSET = utf8 COMMENT ='边设备档案信息表';

-- ----------------------------
-- Records of device
-- ----------------------------
BEGIN;
COMMIT;



-- ----------------------------
-- Table structure for device_action
-- ----------------------------
DROP TABLE IF EXISTS `device_action`;
CREATE TABLE `device_action`
(
    `id`                    bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `device_identification` varchar(255)        DEFAULT NULL COMMENT '设备标识',
    `action_type`           varchar(255)        DEFAULT NULL COMMENT '动作类型',
    `message`               longtext COMMENT '内容信息',
    `status`                varchar(255)        DEFAULT NULL COMMENT '状态',
    `create_time`           datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `device_id` (`device_identification`) USING BTREE COMMENT '设备标识'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1001
  DEFAULT CHARSET = utf8 COMMENT ='设备动作数据';

-- ----------------------------
-- Records of device_action
-- ----------------------------
BEGIN;
COMMIT;



-- ----------------------------
-- Table structure for device_datas
-- ----------------------------
DROP TABLE IF EXISTS `device_datas`;
CREATE TABLE `device_datas`
(
    `id`                    bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `device_identification` varchar(255)        DEFAULT NULL COMMENT '设备标识',
    `message_id`            varchar(255)        DEFAULT NULL COMMENT '消息ID',
    `topic`                 varchar(255)        DEFAULT NULL COMMENT 'topic',
    `message`               longtext COMMENT '内容信息',
    `status`                varchar(255)        DEFAULT NULL COMMENT '状态',
    `create_time`           datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `message_id` (`message_id`) USING BTREE COMMENT '消息标识',
    KEY `device_id` (`device_identification`) USING BTREE COMMENT '设备标识'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='设备消息';

-- ----------------------------
-- Records of device_datas
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device_info
-- ----------------------------
DROP TABLE IF EXISTS `device_info`;
CREATE TABLE `device_info`
(
    `id`                bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '主键',
    `d_id`              bigint(20)  NOT NULL COMMENT '边设备档案主键',
    `app_id`            varchar(64) NOT NULL COMMENT '应用ID',
    `node_id`           varchar(256)         DEFAULT NULL COMMENT '设备节点ID',
    `node_name`         varchar(256)         DEFAULT NULL COMMENT '设备名称',
    `device_id`         varchar(256)         DEFAULT NULL COMMENT '子设备唯一标识',
    `description`       varchar(256)         DEFAULT NULL COMMENT '设备描述',
    `manufacturer_id`   varchar(256)         DEFAULT NULL COMMENT '厂商ID',
    `model`             varchar(256)         DEFAULT NULL COMMENT '设备型号',
    `connect_status`    varchar(20)          DEFAULT NULL COMMENT '子设备连接状态 : 在线：ONLINE || 离线：OFFLINE || 未连接：INIT',
    `shadow_enable`     tinyint(1)           DEFAULT '1' COMMENT '是否支持设备影子TRUE:1、FALSE :0',
    `shadow_table_name` varchar(2048)        DEFAULT NULL COMMENT '设备影子数据表名(多个英文逗号分割)',
    `status`            varchar(10) NOT NULL DEFAULT '0' COMMENT '状态(字典值：0启用  1停用)',
    `create_by`         varchar(64)          DEFAULT 'ununited' COMMENT '创建者',
    `create_time`       datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`         varchar(64)          DEFAULT '' COMMENT '更新者',
    `update_time`       datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`            varchar(500)         DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4592
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='子设备档案表';

-- ----------------------------
-- Records of device_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device_location
-- ----------------------------
DROP TABLE IF EXISTS `device_location`;
CREATE TABLE `device_location`
(
    `id`                    bigint(19)     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `device_identification` varchar(100)   NOT NULL COMMENT '设备标识',
    `latitude`              decimal(10, 7) NOT NULL COMMENT '纬度',
    `longitude`             decimal(10, 7) NOT NULL COMMENT '经度',
    `full_name`             varchar(500)   NOT NULL COMMENT '位置名称',
    `province_code`         varchar(50)    NOT NULL COMMENT '省,直辖市编码',
    `city_code`             varchar(50)    NOT NULL COMMENT '市编码',
    `region_code`           varchar(50)    NOT NULL COMMENT '区县',
    `create_by`             varchar(64)             DEFAULT 'ununited' COMMENT '创建者',
    `create_time`           datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`             varchar(64)             DEFAULT '' COMMENT '更新者',
    `update_time`           datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`                varchar(500)            DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 67
  DEFAULT CHARSET = utf8 COMMENT ='设备位置表';

-- ----------------------------
-- Records of device_location
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device_topic
-- ----------------------------
DROP TABLE IF EXISTS `device_topic`;
CREATE TABLE `device_topic`
(
    `id`                    bigint(19)   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `device_identification` varchar(100) NOT NULL COMMENT '设备标识',
    `type`                  varchar(255)          DEFAULT NULL COMMENT '类型(0:基础Topic,1:自定义Topic)',
    `topic`                 varchar(100)          DEFAULT NULL COMMENT 'topic',
    `publisher`             varchar(255)          DEFAULT NULL COMMENT '发布者',
    `subscriber`            varchar(255)          DEFAULT NULL COMMENT '订阅者',
    `create_by`             varchar(64)           DEFAULT 'ununited' COMMENT '创建者',
    `create_time`           datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`             varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`           datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`                varchar(500)          DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 399
  DEFAULT CHARSET = utf8 COMMENT ='设备Topic数据表';

-- ----------------------------
-- Records of device_topic
-- ----------------------------
BEGIN;
COMMIT;



-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
    `table_id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200)        DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500)        DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64)         DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64)         DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100)        DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200)        DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `package_name`      varchar(100)        DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30)         DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30)         DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50)         DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50)         DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1)             DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200)        DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `options`           varchar(1000)       DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64)         DEFAULT '' COMMENT '创建者',
    `create_time`       datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`         varchar(64)         DEFAULT '' COMMENT '更新者',
    `update_time`       datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`            varchar(500)        DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8 COMMENT ='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (3, 'device', '设备管理', '', '', 'Device', 'crud', 'com.mqttsnet.thinglinks.link', 'link', 'device', '设备管理',
        'thinglinks', '0', '/', '{\"treeCode\":\"id\",\"parentMenuId\":1061}', 'thinglinks', '2021-12-28 10:51:40', '',
        '2021-12-28 11:04:26', NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (4, 'product', '产品管理', NULL, NULL, 'Product', 'crud', 'com.mqttsnet.thinglinks.link', 'link', 'product',
        '产品管理',
        'thinglinks', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2022-02-09 16:13:45', '', '2022-02-09 16:52:41',
        NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (5, 'device_info', '子设备档案表', '', '', 'DeviceInfo', 'crud', 'com.mqttsnet.thinglinks.link', 'link',
        'deviceInfo',
        '子设备管理', 'thinglinks', '0', '/',
        '{\"treeCode\":\"d_id\",\"treeName\":\"d_id\",\"treeParentCode\":\"d_id\",\"parentMenuId\":\"1076\"}', 'admin',
        '2022-05-09 15:38:08', '', '2022-06-21 14:32:37', NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (7, 'casbin_rule', 'CAS规则策略配置表', NULL, NULL, 'CasbinRule', 'crud', 'com.mqttsnet.thinglinks.link', 'link',
        'casbinRule', 'CAS规则管理', 'thinglinks', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin',
        '2022-06-16 17:19:58',
        '', '2022-06-17 11:09:44', NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (8, 'device_topic', '设备Topic数据表', '', '', 'DeviceTopic', 'crud', 'com.mqttsnet.thinglinks.link', 'link',
        'topic',
        '设备Topic数据', 'thinglinks', '0', '/', '{\"treeCode\":\"device_identification\",\"parentMenuId\":1076}',
        'admin',
        '2022-06-17 16:41:13', '', '2022-06-17 16:57:24', NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (9, 'device_action', '设备动作数据', NULL, NULL, 'DeviceAction', 'crud', 'com.mqttsnet.thinglinks.link', 'link',
        'action', '设备动作数据', 'thinglinks', '0', '/', '{\"parentMenuId\":\"1076\"}', 'admin', '2022-06-17 17:38:20',
        '',
        '2022-06-17 17:46:18', NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (10, 'device_location', '设备位置表', NULL, NULL, 'DeviceLocation', 'crud', 'com.mqttsnet.thinglinks.link',
        'link',
        'device_location', '设备位置', 'lvwshuai', '0', '/', '{\"parentMenuId\":\"1062\"}', 'admin',
        '2022-06-30 16:54:17',
        '', '2022-06-30 16:58:36', NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (11, 'product_template', '产品模板', NULL, NULL, 'ProductTemplate', 'crud', 'com.mqttsnet.thinglinks.link',
        'link',
        'product_template', '产品模板', 'thinglinks', '0', '/', '{\"parentMenuId\":1061}', 'admin',
        '2022-06-30 20:03:00',
        '', '2022-07-08 18:33:57', NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (12, 'protocol', '协议信息表', NULL, NULL, 'Protocol', 'crud', 'com.mqttsnet.thinglinks.link', 'link',
        'protocol',
        '协议管理', 'thinglinks', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2022-07-04 09:05:19', '',
        '2022-07-04 11:21:13', '协议管理');
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`,
                         `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`,
                         `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`,
                         `update_time`, `remark`)
VALUES (13, 'rule', '规则信息表', NULL, NULL, 'Rule', 'crud', 'com.mqttsnet.thinglinks.link', 'link', 'rule',
        '规则信息',
        'thinglinks', '0', '/', NULL, 'admin', '2022-07-15 17:47:01', '', '2022-11-18 13:37:26', NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       varchar(64)         DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200)        DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500)        DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100)        DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500)        DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200)        DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1)             DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1)             DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1)             DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1)             DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1)             DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1)             DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1)             DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200)        DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200)        DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200)        DEFAULT '' COMMENT '字典类型',
    `sort`           int(11)             DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64)         DEFAULT '' COMMENT '创建者',
    `create_time`    datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`      varchar(64)         DEFAULT '' COMMENT '更新者',
    `update_time`    datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 189
  DEFAULT CHARSET = utf8 COMMENT ='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (49, '3', 'id', 'id', 'bigint(19)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (50, '3', 'client_id', '客户端标识', 'varchar(255)', 'String', 'clientId', '0', '0', '1', '1', '1', '1', '1',
        'LIKE',
        'input', '', 2, 'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (51, '3', 'user_name', '用户名', 'varchar(255)', 'String', 'userName', '0', '0', '1', '1', '1', '1', NULL,
        'LIKE',
        'input', '', 3, 'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (52, '3', 'password', '密码', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '1', '1', NULL, 'EQ',
        'input', '', 4, 'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (53, '3', 'app_id', '应用ID', 'varchar(64)', 'String', 'appId', '0', '0', '1', '1', '1', NULL, NULL, 'EQ',
        'input',
        '', 5, 'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (54, '3', 'auth_mode', '认证方式', 'varchar(255)', 'String', 'authMode', '0', '0', '1', '1', '1', '1', NULL,
        'EQ',
        'input', 'link_device_auth_mode', 6, 'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (55, '3', 'device_identification', '设备标识', 'varchar(100)', 'String', 'deviceIdentification', '0', '0', '1',
        '1',
        '1', '1', '1', 'LIKE', 'input', '', 7, 'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (56, '3', 'device_name', '设备名称', 'varchar(255)', 'String', 'deviceName', '0', '0', '1', '1', '1', '1', '1',
        'LIKE', 'input', '', 8, 'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (57, '3', 'connector', '连接实例', 'varchar(255)', 'String', 'connector', '0', '0', '1', '1', '1', '1', '1',
        'EQ',
        'input', 'link_device_connector', 9, 'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (58, '3', 'device_description', '设备描述', 'varchar(255)', 'String', 'deviceDescription', '0', '0', NULL, '1',
        '1',
        '1', NULL, 'EQ', 'input', '', 10, 'thinglinks', '2021-12-28 10:51:40', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (59, '3', 'device_status', '设备状态', 'varchar(255)', 'String', 'deviceStatus', '0', '0', '1', '1', '1', '1',
        '1',
        'EQ', 'radio', 'link_device_status', 11, 'thinglinks', '2021-12-28 10:51:41', '', '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (60, '3', 'connect_status', '连接状态', 'varchar(255)', 'String', 'connectStatus', '0', '0', '1', '1', '1', '1',
        '1',
        'EQ', 'radio', 'link_device_connect_status', 12, 'thinglinks', '2021-12-28 10:51:41', '',
        '2021-12-28 11:04:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (61, '3', 'is_will', '是否遗言', 'varchar(255)', 'String', 'isWill', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', 'link_device_is_will', 13, 'thinglinks', '2021-12-28 10:51:41', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (62, '3', 'device_tags', '设备标签', 'varchar(255)', 'String', 'deviceTags', '0', '0', '1', '1', '1', '1', '1',
        'EQ',
        'input', '', 14, 'thinglinks', '2021-12-28 10:51:41', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (63, '3', 'product_id', '产品型号', 'varchar(255)', 'String', 'productId', '0', '0', '1', '1', '1', '1', '1',
        'EQ',
        'input', '', 15, 'thinglinks', '2021-12-28 10:51:41', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (64, '3', 'manufacturer_id', '厂商ID', 'varchar(255)', 'String', 'manufacturerId', '0', '0', '1', '1', '1', '1',
        '1', 'EQ', 'input', '', 16, 'thinglinks', '2021-12-28 10:51:41', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (65, '3', 'protocol_type', '产品协议类型', 'varchar(255)', 'String', 'protocolType', '0', '0', '1', '1', '1',
        '1', '1',
        'EQ', 'select', 'link_device_protocol_type', 17, 'thinglinks', '2021-12-28 10:51:41', '',
        '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (66, '3', 'device_type', '设备类型', 'varchar(255)', 'String', 'deviceType', '0', '0', '1', '1', '1', '1', '1',
        'EQ',
        'select', 'link_device_device_type', 18, 'thinglinks', '2021-12-28 10:51:41', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (67, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ',
        'input', '', 19, 'thinglinks', '2021-12-28 10:51:41', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (68, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'EQ',
        'datetime', '', 20, 'thinglinks', '2021-12-28 10:51:41', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (69, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'input', '', 21, 'thinglinks', '2021-12-28 10:51:41', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (70, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'datetime', '', 22, 'thinglinks', '2021-12-28 10:51:42', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (71, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'textarea', '', 23, 'thinglinks', '2021-12-28 10:51:42', '', '2021-12-28 11:04:27');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (72, '4', 'id', 'id', 'bigint(19)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2022-02-09 16:13:46', '', '2022-02-09 16:52:41');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (73, '4', 'app_id', '应用ID', 'varchar(64)', 'String', 'appId', '0', '0', '1', '1', NULL, '1', NULL, 'EQ',
        'select', 'link_application_type', 2, 'admin', '2022-02-09 16:13:46', '', '2022-02-09 16:52:41');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (74, '4', 'template_id', '产品模型模板', 'bigint(19)', 'Long', 'templateId', '0', '0', NULL, '1', NULL, NULL,
        NULL,
        'EQ', 'input', '', 3, 'admin', '2022-02-09 16:13:46', '', '2022-02-09 16:52:41');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (75, '4', 'product_name', '产品名称:自定义，支持中文、英文大小写、数字、下划线和中划线', 'varchar(255)', 'String',
        'productName', '0', '0',
        '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-02-09 16:13:46', '', '2022-02-09 16:52:41');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (76, '4', 'product_identification', '产品标识', 'varchar(100)', 'String', 'productIdentification', '0', '0', '1',
        '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-02-09 16:13:46', '', '2022-02-09 16:52:41');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (77, '4', 'product_type', '支持以下两种产品类型•0：普通产品，需直连设备。\r\n•1：网关产品，可挂载子设备。\r\n',
        'varchar(255)', 'String',
        'productType', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'select', 'link_device_device_type', 6, 'admin',
        '2022-02-09 16:13:46', '', '2022-02-09 16:52:41');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (78, '4', 'manufacturer_id', '厂商ID:支持英文大小写，数字，下划线和中划线', 'varchar(255)', 'String',
        'manufacturerId', '0', '0',
        '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-02-09 16:13:46', '', '2022-02-09 16:52:41');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (79, '4', 'manufacturer_name', '厂商名称 :支持中文、英文大小写、数字、下划线和中划线', 'varchar(255)', 'String',
        'manufacturerName', '0',
        '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2022-02-09 16:13:46', '',
        '2022-02-09 16:52:41');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (80, '4', 'model', '产品型号，建议包含字母或数字来保证可扩展性。支持英文大小写、数字、下划线和中划线\r\n',
        'varchar(255)', 'String', 'model', '0', '0',
        '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-02-09 16:13:46', '', '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (81, '4', 'data_format', '数据格式，默认为JSON无需修改。', 'varchar(255)', 'String', 'dataFormat', '0', '0', '1',
        '1', NULL,
        NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-02-09 16:13:46', '', '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (82, '4', 'device_type', '设备类型:支持英文大小写、数字、下划线和中划线\r\n', 'varchar(255)', 'String',
        'deviceType', '0', '0', '1',
        '1', NULL, '1', NULL, 'EQ', 'select', 'link_protocol_device_type', 11, 'admin', '2022-02-09 16:13:46', '',
        '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (83, '4', 'protocol_type', '设备接入平台的协议类型，默认为MQTT无需修改。\r\n ', 'varchar(255)', 'String',
        'protocolType', '0', '0',
        '1', '1', NULL, '1', NULL, 'EQ', 'select', 'link_device_protocol_type', 12, 'admin', '2022-02-09 16:13:46', '',
        '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (84, '4', 'status', '状态(字典值：启用  停用)', 'varchar(10)', 'String', 'status', '0', '0', '1', '1', '1', '1',
        NULL,
        'EQ', 'select', 'sys_normal_disable', 13, 'admin', '2022-02-09 16:13:46', '', '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (85, '4', 'remark', '产品描述', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'input', '', 14, 'admin', '2022-02-09 16:13:47', '', '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (86, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'input', '', 15, 'admin', '2022-02-09 16:13:47', '', '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (87, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'datetime', '', 16, 'admin', '2022-02-09 16:13:47', '', '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (88, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 17, 'admin', '2022-02-09 16:13:47', '', '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (89, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'datetime', '', 18, 'admin', '2022-02-09 16:13:47', '', '2022-02-09 16:52:42');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (90, '5', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2022-05-09 15:38:08', '', '2022-06-21 14:32:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (91, '5', 'd_id', '边设备', 'bigint(20)', 'Long', 'dId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2,
        'admin', '2022-05-09 15:38:08', '', '2022-06-21 14:32:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (92, '5', 'app_id', '应用ID', 'varchar(64)', 'String', 'appId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input',
        '', 3, 'admin', '2022-05-09 15:38:08', '', '2022-06-21 14:32:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (93, '5', 'node_id', '设备唯一标识', 'varchar(256)', 'String', 'nodeId', '0', '0', NULL, '1', '1', '1', '1',
        'EQ',
        'input', '', 4, 'admin', '2022-05-09 15:38:08', '', '2022-06-21 14:32:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (94, '5', 'node_name', '设备名称', 'varchar(256)', 'String', 'nodeName', '0', '0', NULL, '1', '1', '1', '1',
        'LIKE',
        'input', '', 5, 'admin', '2022-05-09 15:38:08', '', '2022-06-21 14:32:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (95, '5', 'device_id', '子设备标识', 'varchar(256)', 'String', 'deviceId', '0', '0', NULL, '1', '1', '1', '1',
        'EQ',
        'input', '', 6, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (96, '5', 'description', '设备描述', 'varchar(256)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 7, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (97, '5', 'manufacturer_id', '厂商ID', 'varchar(256)', 'String', 'manufacturerId', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'input', '', 8, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (98, '5', 'model', '设备型号', 'varchar(256)', 'String', 'model', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input',
        '', 9, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (99, '5', 'connect_status', '连接状态 : 在线：ONLINE || 离线：OFFLINE || 未连接：INIT', 'varchar(20)', 'String',
        'connectStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'link_device_connect_status', 10, 'admin',
        '2022-05-09 15:38:09', '', '2022-06-21 14:32:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (100, '5', 'shadow_enable', '是否支持设备影子', 'tinyint(1)', 'Integer', 'shadowEnable', '0', '0', NULL, '1',
        '1', '1',
        '1', 'EQ', 'select', 'link_deviceInfo_shadow_enable', 11, 'admin', '2022-05-09 15:38:09', '',
        '2022-06-21 14:32:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (101, '5', 'shadow_table_name', '设备影子数据表名', 'varchar(2048)', 'String', 'shadowTableName', '0', '0', NULL,
        '1',
        '1', '1', '1', 'LIKE', 'input', '', 12, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (102, '5', 'status', '状态(字典值：0启用  1停用)', 'varchar(10)', 'String', 'status', '0', '0', '1', '1', '1',
        '1', '1',
        'EQ', 'select', 'business_data_status', 13, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (103, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'input', '', 14, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (104, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'datetime', '', 15, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (105, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'input', '', 16, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (106, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'datetime', '', 17, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (107, '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'textarea', '', 18, 'admin', '2022-05-09 15:38:09', '', '2022-06-21 14:32:39');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (116, '7', 'id', 'id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2022-06-16 17:19:58', '', '2022-06-17 11:09:44');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (117, '7', 'ptype', '类型', 'varchar(100)', 'String', 'ptype', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select',
        'link_device_protocol_type', 2, 'admin', '2022-06-16 17:19:58', '', '2022-06-17 11:09:45');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (118, '7', 'v0', '规则名称', 'varchar(100)', 'String', 'v0', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '',
        3, 'admin', '2022-06-16 17:19:58', '', '2022-06-17 11:09:45');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (119, '7', 'v1', '资源', 'varchar(100)', 'String', 'v1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '',
        4,
        'admin', '2022-06-16 17:19:58', '', '2022-06-17 11:09:45');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (120, '7', 'v2', '动作', 'varchar(100)', 'String', 'v2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select',
        'link_casbinRule_v2', 5, 'admin', '2022-06-16 17:19:58', '', '2022-06-17 11:09:45');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (121, '7', 'v3', '策略', 'varchar(100)', 'String', 'v3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select',
        'link_casbinRule_v3', 6, 'admin', '2022-06-16 17:19:58', '', '2022-06-17 11:09:45');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (122, '7', 'v4', NULL, 'varchar(100)', 'String', 'v4', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '',
        7, 'admin', '2022-06-16 17:19:58', '', '2022-06-17 11:09:45');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (123, '7', 'v5', NULL, 'varchar(100)', 'String', 'v5', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '',
        8, 'admin', '2022-06-16 17:19:58', '', '2022-06-17 11:09:45');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (124, '8', 'id', 'id', 'bigint(19)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:24');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (125, '8', 'device_identification', '设备标识', 'varchar(100)', 'String', 'deviceIdentification', '0', '0', '1',
        '1',
        '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:24');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (126, '8', 'type', '类型(0:基础Topic,1:自定义Topic)', 'varchar(255)', 'String', 'type', '0', '0', NULL, '1', '1',
        '1',
        '1', 'EQ', 'select', '', 3, 'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:24');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (127, '8', 'topic', 'topic', 'varchar(100)', 'String', 'topic', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 4, 'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:24');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (128, '8', 'publisher', '发布者', 'varchar(255)', 'String', 'publisher', '0', '0', NULL, '1', '1', '1', '1',
        'EQ',
        'input', '', 5, 'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:24');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (129, '8', 'subscriber', '订阅者', 'varchar(255)', 'String', 'subscriber', '0', '0', NULL, '1', '1', '1', '1',
        'EQ',
        'input', '', 6, 'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:24');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (130, '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'input', '', 7, 'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:24');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (131, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'datetime', '', 8, 'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:25');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (132, '8', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'input', '', 9, 'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:25');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (133, '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'datetime', '', 10, 'admin', '2022-06-17 16:41:14', '', '2022-06-17 16:57:25');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (134, '8', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'textarea', '', 11, 'admin', '2022-06-17 16:41:15', '', '2022-06-17 16:57:25');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (135, '9', 'id', 'id', 'bigint(19)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2022-06-17 17:38:20', '', '2022-06-17 17:46:18');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (136, '9', 'device_identification', '设备标识', 'varchar(255)', 'String', 'deviceIdentification', '0', '0', NULL,
        '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-06-17 17:38:20', '', '2022-06-17 17:46:18');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (137, '9', 'action_type', '动作类型', 'varchar(255)', 'String', 'actionType', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'select', 'link_device_action_type', 3, 'admin', '2022-06-17 17:38:21', '', '2022-06-17 17:46:18');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (138, '9', 'message', '内容信息', 'longtext', 'String', 'message', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'textarea', '', 4, 'admin', '2022-06-17 17:38:21', '', '2022-06-17 17:46:18');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (139, '9', 'status', '状态', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'radio',
        '', 5, 'admin', '2022-06-17 17:38:21', '', '2022-06-17 17:46:18');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (140, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'datetime', '', 6, 'admin', '2022-06-17 17:38:21', '', '2022-06-17 17:46:19');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (141, '10', 'id', '主键', 'bigint(19)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1,
        'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:36');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (142, '10', 'device_identification', '设备标识', 'varchar(100)', 'String', 'deviceIdentification', '0', '0', '1',
        '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:36');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (143, '10', 'latitude', '纬度', 'decimal(10,7)', 'BigDecimal', 'latitude', '0', '0', '1', '1', '1', '1', '1',
        'EQ',
        'input', '', 3, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:36');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (144, '10', 'longitude', '经度', 'decimal(10,7)', 'BigDecimal', 'longitude', '0', '0', '1', '1', '1', '1', '1',
        'EQ', 'input', '', 4, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:36');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (145, '10', 'full_name', '位置名称', 'varchar(500)', 'String', 'fullName', '0', '0', '1', '1', '1', '1', '1',
        'LIKE',
        'textarea', '', 5, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:36');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (146, '10', 'province_code', '省,直辖市编码', 'varchar(50)', 'String', 'provinceCode', '0', '0', '1', '1', '1',
        '1',
        '1', 'EQ', 'input', '', 6, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:36');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (147, '10', 'city_code', '市编码', 'varchar(50)', 'String', 'cityCode', '0', '0', '1', '1', '1', '1', '1', 'EQ',
        'input', '', 7, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:36');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (148, '10', 'region_code', '区县', 'varchar(50)', 'String', 'regionCode', '0', '0', '1', '1', '1', '1', '1',
        'EQ',
        'input', '', 8, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:36');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (149, '10', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'input', '', 9, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (150, '10', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'datetime', '', 10, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (151, '10', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'input', '', 11, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (152, '10', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'datetime', '', 12, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (153, '10', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'textarea', '', 13, 'admin', '2022-06-30 16:54:17', '', '2022-06-30 16:58:37');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (154, '11', 'id', 'id', 'bigint(19)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2022-06-30 20:03:00', '', '2022-07-08 18:33:58');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (155, '11', 'app_id', '应用ID', 'varchar(64)', 'String', 'appId', '0', '0', '1', '1', '1', '1', '1', 'EQ',
        'input',
        '', 2, 'admin', '2022-06-30 20:03:01', '', '2022-07-08 18:33:58');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (156, '11', 'template_name', '产品模板名称:自定义，支持中文、英文大小写、数字、下划线和中划线', 'varchar(255)',
        'String', 'templateName', '0',
        '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-06-30 20:03:01', '',
        '2022-07-08 18:33:58');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (157, '11', 'status', '状态(字典值：启用  停用)', 'varchar(10)', 'String', 'status', '0', '0', '1', '1', '1', '1',
        '1',
        'EQ', 'radio', '', 4, 'admin', '2022-06-30 20:03:01', '', '2022-07-08 18:33:58');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (158, '11', 'remark', '产品模型模板描述', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1',
        NULL, 'EQ',
        'input', '', 5, 'admin', '2022-06-30 20:03:01', '', '2022-07-08 18:33:58');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (159, '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'input', '', 6, 'admin', '2022-06-30 20:03:01', '', '2022-07-08 18:33:58');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (160, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'datetime', '', 7, 'admin', '2022-06-30 20:03:01', '', '2022-07-08 18:33:58');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (161, '11', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'input', '', 8, 'admin', '2022-06-30 20:03:01', '', '2022-07-08 18:33:58');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (162, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'datetime', '', 9, 'admin', '2022-06-30 20:03:01', '', '2022-07-08 18:33:58');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (163, '12', 'id', 'id', 'bigint(19)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2022-07-04 09:05:19', '', '2022-07-04 11:21:13');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (164, '12', 'product_identification', '产品标识', 'varchar(100)', 'String', 'productIdentification', '0', '0',
        '1',
        '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-07-04 09:05:19', '', '2022-07-04 11:21:13');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (165, '12', 'protocol_name', '协议名称', 'varchar(255)', 'String', 'protocolName', '0', '0', NULL, '1', '1', '1',
        '1', 'LIKE', 'input', '', 3, 'admin', '2022-07-04 09:05:19', '', '2022-07-04 11:21:13');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (166, '12', 'protocol_identification', '协议标识', 'varchar(255)', 'String', 'protocolIdentification', '0', '0',
        NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-07-04 09:05:19', '', '2022-07-04 11:21:13');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (167, '12', 'protocol_version', '协议版本', 'varchar(255)', 'String', 'protocolVersion', '0', '0', NULL, '1',
        '1',
        '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-07-04 09:05:19', '', '2022-07-04 11:21:13');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (168, '12', 'protocol_type', '协议类型 ：mqtt || coap || modbus || http', 'varchar(255)', 'String',
        'protocolType',
        '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'link_device_protocol_type', 6, 'admin',
        '2022-07-04 09:05:19', '', '2022-07-04 11:21:13');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (169, '12', 'protocol_voice', '协议语言', 'varchar(255)', 'String', 'protocolVoice', '0', '0', NULL, '1', '1',
        '1',
        '1', 'EQ', 'select', 'link_ protocol_voice', 7, 'admin', '2022-07-04 09:05:19', '', '2022-07-04 11:21:13');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (170, '12', 'class_name', '类名', 'varchar(255)', 'String', 'className', '0', '0', NULL, '1', '1', '1', NULL,
        'LIKE', 'input', '', 8, 'admin', '2022-07-04 09:05:19', '', '2022-07-04 11:21:14');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (171, '12', 'file_path', '文件地址', 'varchar(255)', 'String', 'filePath', '0', '0', NULL, '1', '1', '1', NULL,
        'EQ',
        'input', '', 9, 'admin', '2022-07-04 09:05:19', '', '2022-07-04 11:21:14');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (172, '12', 'content', '内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'editor',
        '', 10, 'admin', '2022-07-04 09:05:19', '', '2022-07-04 11:21:14');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (173, '12', 'status', '状态(字典值：0启用  1停用)', 'varchar(10)', 'String', 'status', '0', '0', '1', '1', '1',
        '1', '1',
        'EQ', 'select', 'business_data_status', 11, 'admin', '2022-07-04 09:05:20', '', '2022-07-04 11:21:14');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (174, '12', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', NULL,
        'EQ',
        'input', '', 12, 'admin', '2022-07-04 09:05:20', '', '2022-07-04 11:21:14');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (175, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL,
        'EQ',
        'datetime', '', 13, 'admin', '2022-07-04 09:05:20', '', '2022-07-04 11:21:14');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (176, '12', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', '1', NULL,
        'EQ',
        'input', '', 14, 'admin', '2022-07-04 09:05:20', '', '2022-07-04 11:21:14');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (177, '12', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', '1', NULL,
        'EQ',
        'datetime', '', 15, 'admin', '2022-07-04 09:05:20', '', '2022-07-04 11:21:14');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (178, '12', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'textarea', '', 16, 'admin', '2022-07-04 09:05:20', '', '2022-07-04 11:21:14');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (179, '13', 'id', '主键', 'bigint(1)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2022-07-15 17:47:02', '', '2022-11-18 13:38:21');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (180, '13', 'app_id', '应用ID', 'varchar(64)', 'String', 'appId', '0', '0', '1', '1', '1', '1', '1', 'EQ',
        'input',
        '', 2, 'admin', '2022-07-15 17:47:02', '', '2022-11-18 13:38:26');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (181, '13', 'rule_name', '规则名称', 'varchar(255)', 'String', 'ruleName', '0', '0', '1', '1', '1', '1', '1',
        'LIKE',
        'input', '', 3, 'admin', '2022-07-15 17:47:02', '', '2022-11-18 13:38:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (182, '13', 'cron_expression', '生效时间', 'varchar(50)', 'String', 'cronExpression', '0', '0', NULL, '1', '1',
        '1',
        '1', 'EQ', 'input', '', 4, 'admin', '2022-07-15 17:47:02', '', '2022-11-18 13:38:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (183, '13', 'status', '状态(字典值：0启用  1停用)', 'varchar(10)', 'String', 'status', '0', '0', '1', '1', '1',
        '1', '1',
        'EQ', 'radio', '', 5, 'admin', '2022-07-15 17:47:02', '', '2022-11-18 13:38:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (184, '13', 'remark', '规则描述，可以为空', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1',
        NULL, 'EQ',
        'input', '', 6, 'admin', '2022-07-15 17:47:02', '', '2022-11-18 13:38:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (185, '13', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'input', '', 7, 'admin', '2022-07-15 17:47:02', '', '2022-11-18 13:38:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (186, '13', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ',
        'datetime', '', 8, 'admin', '2022-07-15 17:47:03', '', '2022-11-18 13:38:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (187, '13', 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'input', '', 9, 'admin', '2022-07-15 17:47:03', '', '2022-11-18 13:38:38');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`,
                                `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`,
                                `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`,
                                `update_by`, `update_time`)
VALUES (188, '13', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ',
        'datetime', '', 10, 'admin', '2022-07-15 17:47:03', '', '2022-11-18 13:38:38');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`
(
    `id`                      bigint(19)   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `app_id`                  varchar(64)  NOT NULL COMMENT '应用ID',
    `template_identification` varchar(100)          DEFAULT NULL COMMENT '产品模版标识',
    `product_name`            varchar(255) NOT NULL COMMENT '产品名称:自定义，支持中文、英文大小写、数字、下划线和中划线',
    `product_identification`  varchar(100) NOT NULL COMMENT '产品标识',
    `product_type`            varchar(255) NOT NULL COMMENT '支持以下两种产品类型•COMMON：普通产品，需直连设备。\r\n•GATEWAY：网关产品，可挂载子设备。\r\n',
    `manufacturer_id`         varchar(255) NOT NULL COMMENT '厂商ID:支持英文大小写，数字，下划线和中划线',
    `manufacturer_name`       varchar(255) NOT NULL COMMENT '厂商名称 :支持中文、英文大小写、数字、下划线和中划线',
    `model`                   varchar(255) NOT NULL COMMENT '产品型号，建议包含字母或数字来保证可扩展性。支持英文大小写、数字、下划线和中划线\r\n',
    `data_format`             varchar(255) NOT NULL COMMENT '数据格式，默认为JSON无需修改。',
    `device_type`             varchar(255) NOT NULL COMMENT '设备类型:支持英文大小写、数字、下划线和中划线\r\n',
    `protocol_type`           varchar(255) NOT NULL COMMENT '设备接入平台的协议类型，默认为MQTT无需修改。\r\n ',
    `status`                  varchar(10)  NOT NULL DEFAULT '0' COMMENT '状态(字典值：0启用  1停用)',
    `remark`                  varchar(255)          DEFAULT NULL COMMENT '产品描述',
    `create_by`               varchar(64)           DEFAULT 'ununited' COMMENT '创建者',
    `create_time`             datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`               varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`             datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `manufacturer_id` (`manufacturer_id`) USING BTREE COMMENT '厂商ID索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 47
  DEFAULT CHARSET = utf8 COMMENT ='产品模型';

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_commands
-- ----------------------------
DROP TABLE IF EXISTS `product_commands`;
CREATE TABLE `product_commands`
(
    `id`          bigint(19)   NOT NULL AUTO_INCREMENT COMMENT '命令id',
    `service_id`  bigint(19)   NOT NULL COMMENT '服务ID',
    `name`        varchar(255) NOT NULL COMMENT '指示命令的名字，如门磁的LOCK命令、摄像头的VIDEO_RECORD命令，命令名与参数共同构成一个完整的命令。\r\n支持英文大小写、数字及下划线，长度[2,50]。\r\n',
    `description` varchar(255)          DEFAULT NULL COMMENT '命令描述。',
    `create_by`   varchar(64)           DEFAULT 'ununited' COMMENT '创建者',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `service_id` (`service_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8 COMMENT ='产品模型设备服务命令表';

-- ----------------------------
-- Records of product_commands
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_commands_requests
-- ----------------------------
DROP TABLE IF EXISTS `product_commands_requests`;
CREATE TABLE `product_commands_requests`
(
    `id`                    bigint(19)   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `service_id`            bigint(19)   NOT NULL COMMENT '服务ID',
    `commands_id`           bigint(19)   NOT NULL COMMENT '命令ID',
    `datatype`              varchar(255) NOT NULL COMMENT '指示数据类型。取值范围：string、int、decimal\r\n',
    `enumlist`              varchar(255)          DEFAULT NULL COMMENT '指示枚举值。\r\n如开关状态status可有如下取值\r\n"enumList" : ["OPEN","CLOSE"]\r\n目前本字段是非功能性字段，仅起到描述作用。建议准确定义。\r\n',
    `max`                   varchar(255)          DEFAULT NULL COMMENT '指示最大值。\r\n仅当dataType为int、decimal时生效，逻辑小于等于。',
    `maxlength`             varchar(255)          DEFAULT NULL COMMENT '指示字符串长度。\r\n仅当dataType为string时生效。',
    `min`                   varchar(255)          DEFAULT NULL COMMENT '指示最小值。\r\n仅当dataType为int、decimal时生效，逻辑大于等于。',
    `parameter_description` varchar(255)          DEFAULT NULL COMMENT '命令中参数的描述，不影响实际功能，可配置为空字符串""。',
    `parameter_name`        varchar(255)          DEFAULT NULL COMMENT '命令中参数的名字。',
    `required`              varchar(255) NOT NULL COMMENT '指示本条属性是否必填，取值为0或1，默认取值1（必填）。\r\n目前本字段是非功能性字段，仅起到描述作用。',
    `step`                  varchar(255)          DEFAULT NULL COMMENT '指示步长。',
    `unit`                  varchar(255)          DEFAULT NULL COMMENT '指示单位。\r\n取值根据参数确定，如：\r\n•温度单位：“C”或“K”\r\n•百分比单位：“%”\r\n•压强单位：“Pa”或“kPa”\r\n',
    `create_by`             varchar(64)           DEFAULT 'ununited' COMMENT '创建者',
    `create_time`           datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`             varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`           datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `commands_id` (`commands_id`) USING BTREE,
    KEY `service_id` (`service_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='产品模型设备下发服务命令属性表';

-- ----------------------------
-- Records of product_commands_requests
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_commands_response
-- ----------------------------
DROP TABLE IF EXISTS `product_commands_response`;
CREATE TABLE `product_commands_response`
(
    `id`                    bigint(19)   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `commands_id`           bigint(19)   NOT NULL COMMENT '命令ID',
    `service_id`            bigint(19)            DEFAULT NULL COMMENT '服务ID',
    `datatype`              varchar(255) NOT NULL COMMENT '指示数据类型。取值范围：string、int、decimal\r\n',
    `enumlist`              varchar(255)          DEFAULT NULL COMMENT '指示枚举值。\r\n如开关状态status可有如下取值\r\n"enumList" : ["OPEN","CLOSE"]\r\n目前本字段是非功能性字段，仅起到描述作用。建议准确定义。\r\n',
    `max`                   varchar(255)          DEFAULT NULL COMMENT '指示最大值。\r\n仅当dataType为int、decimal时生效，逻辑小于等于。',
    `maxlength`             varchar(255)          DEFAULT NULL COMMENT '指示字符串长度。\r\n仅当dataType为string时生效。',
    `min`                   varchar(255)          DEFAULT NULL COMMENT '指示最小值。\r\n仅当dataType为int、decimal时生效，逻辑大于等于。',
    `parameter_description` varchar(255)          DEFAULT NULL COMMENT '命令中参数的描述，不影响实际功能，可配置为空字符串""。',
    `parameter_name`        varchar(255)          DEFAULT NULL COMMENT '命令中参数的名字。',
    `required`              varchar(255) NOT NULL COMMENT '指示本条属性是否必填，取值为0或1，默认取值1（必填）。\r\n目前本字段是非功能性字段，仅起到描述作用。',
    `step`                  varchar(255)          DEFAULT NULL COMMENT '指示步长。',
    `unit`                  varchar(255)          DEFAULT NULL COMMENT '指示单位。\r\n取值根据参数确定，如：\r\n•温度单位：“C”或“K”\r\n•百分比单位：“%”\r\n•压强单位：“Pa”或“kPa”\r\n',
    `create_by`             varchar(64)           DEFAULT 'ununited' COMMENT '创建者',
    `create_time`           datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`             varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`           datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `commands_id` (`commands_id`) USING BTREE,
    KEY `service_id` (`service_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='产品模型设备响应服务命令属性表';

-- ----------------------------
-- Records of product_commands_response
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_properties
-- ----------------------------
DROP TABLE IF EXISTS `product_properties`;
CREATE TABLE `product_properties`
(
    `id`            bigint(19)                         NOT NULL AUTO_INCREMENT COMMENT '属性id',
    `property_name` varchar(255)                       NOT NULL COMMENT '指示属性名称。',
    `property_code` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '属性编码',
    `service_id`    bigint(19)                         NOT NULL COMMENT '服务ID',
    `datatype`      varchar(255)                       NOT NULL COMMENT '指示数据类型：取值范围：string、int、decimal（float和double都可以使用此类型）、DateTime、jsonObject上报数据时，复杂类型数据格式如下：\r\n•DateTime:yyyyMMdd’T’HHmmss’Z’如:20151212T121212Z•jsonObject：自定义json结构体，平台不理解只透传\r\n',
    `description`   varchar(255)                                DEFAULT NULL COMMENT '属性描述，不影响实际功能，可配置为空字符串""。',
    `enumlist`      varchar(255)                                DEFAULT NULL COMMENT '指示枚举值:如开关状态status可有如下取值"enumList" : ["OPEN","CLOSE"]目前本字段是非功能性字段，仅起到描述作用。建议准确定义。\r\n',
    `max`           varchar(255)                                DEFAULT NULL COMMENT '指示最大值。支持长度不超过50的数字。仅当dataType为int、decimal时生效，逻辑小于等于。\r\n',
    `maxlength`     bigint(19)                                  DEFAULT NULL COMMENT '指示字符串长度。仅当dataType为string、DateTime时生效。\r\n',
    `method`        varchar(255)                                DEFAULT NULL COMMENT '指示访问模式。R:可读；W:可写；E属性值更改时上报数据取值范围：R、RW、RE、RWE\r\n',
    `min`           varchar(255)                                DEFAULT NULL COMMENT '指示最小值。支持长度不超过50的数字。仅当dataType为int、decimal时生效，逻辑大于等于。\r\n',
    `required`      int(2)                                      DEFAULT NULL COMMENT '指示本条属性是否必填，取值为0或1，默认取值1（必填）。目前本字段是非功能性字段，仅起到描述作用。(字典值link_product_isRequired：0非必填 1必填)\r\n',
    `step`          int(9)                                      DEFAULT NULL COMMENT '指示步长。',
    `unit`          varchar(255)                                DEFAULT NULL COMMENT '指示单位。支持长度不超过50。\r\n取值根据参数确定，如：\r\n•温度单位：“C”或“K”\r\n•百分比单位：“%”\r\n•压强单位：“Pa”或“kPa”\r\n',
    `create_by`     varchar(64)                                 DEFAULT 'ununited' COMMENT '创建者',
    `create_time`   datetime                           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`     varchar(64)                                 DEFAULT '' COMMENT '更新者',
    `update_time`   datetime                           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `service_id` (`service_id`) USING BTREE COMMENT '服务ID'
) ENGINE = InnoDB
  AUTO_INCREMENT = 142
  DEFAULT CHARSET = utf8 COMMENT ='产品模型服务属性表';

-- ----------------------------
-- Records of product_properties
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_services
-- ----------------------------
DROP TABLE IF EXISTS `product_services`;
CREATE TABLE `product_services`
(
    `id`                      bigint(19)                         NOT NULL AUTO_INCREMENT COMMENT '服务id',
    `service_code`            varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '服务编码:支持英文大小写、数字、下划线和中划线',
    `service_name`            varchar(255)                       NOT NULL COMMENT '服务名称',
    `template_identification` varchar(100)                                DEFAULT NULL COMMENT '产品模版标识',
    `product_identification`  varchar(100)                                DEFAULT NULL COMMENT '产品标识',
    `status`                  varchar(10)                        NOT NULL DEFAULT '0' COMMENT '状态(字典值：0启用  1停用)',
    `description`             varchar(255)                                DEFAULT NULL COMMENT '服务的描述信息:文本描述，不影响实际功能，可配置为空字符串""。\r\n',
    `create_by`               varchar(64)                                 DEFAULT 'ununited' COMMENT '创建者',
    `create_time`             datetime                           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`               varchar(64)                                 DEFAULT '' COMMENT '更新者',
    `update_time`             datetime                           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 72
  DEFAULT CHARSET = utf8 COMMENT ='产品模型服务表';

-- ----------------------------
-- Records of product_services
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_template
-- ----------------------------
DROP TABLE IF EXISTS `product_template`;
CREATE TABLE `product_template`
(
    `id`                      bigint(19)   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `app_id`                  varchar(64)  NOT NULL COMMENT '应用ID',
    `template_identification` varchar(100) NOT NULL COMMENT '产品模版标识',
    `template_name`           varchar(255) NOT NULL COMMENT '产品模板名称:自定义，支持中文、英文大小写、数字、下划线和中划线',
    `status`                  varchar(10)  NOT NULL COMMENT '状态(字典值：启用  停用)',
    `remark`                  varchar(255)          DEFAULT NULL COMMENT '产品模型模板描述',
    `create_by`               varchar(64)           DEFAULT 'ununited' COMMENT '创建者',
    `create_time`             datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`               varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`             datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8 COMMENT ='产品模板';

-- ----------------------------
-- Records of product_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for protocol
-- ----------------------------
DROP TABLE IF EXISTS `protocol`;
CREATE TABLE `protocol`
(
    `id`                      bigint(19)   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `app_id`                  varchar(64)  NOT NULL COMMENT '应用ID',
    `product_identification`  varchar(100) NOT NULL COMMENT '产品标识',
    `protocol_name`           varchar(255)          DEFAULT NULL COMMENT '协议名称',
    `protocol_identification` varchar(255)          DEFAULT NULL COMMENT '协议标识',
    `protocol_version`        varchar(255)          DEFAULT NULL COMMENT '协议版本',
    `protocol_type`           varchar(255)          DEFAULT NULL COMMENT '协议类型 ：mqtt || coap || modbus || http',
    `protocol_voice`          varchar(255)          DEFAULT NULL COMMENT '协议语言',
    `class_name`              varchar(255)          DEFAULT NULL COMMENT '类名',
    `file_path`               varchar(255)          DEFAULT NULL COMMENT '文件地址',
    `content`                 text COMMENT '内容',
    `status`                  varchar(10)  NOT NULL DEFAULT '0' COMMENT '状态(字典值：0启用  1停用)',
    `create_by`               varchar(64)           DEFAULT 'ununited' COMMENT '创建者',
    `create_time`             datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`               varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`             datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`                  varchar(500)          DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8 COMMENT ='协议信息表';

-- ----------------------------
-- Records of protocol
-- ----------------------------
BEGIN;
INSERT INTO `protocol` (`id`, `app_id`, `product_identification`, `protocol_name`, `protocol_identification`,
                        `protocol_version`, `protocol_type`, `protocol_voice`, `class_name`, `file_path`, `content`,
                        `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, 'thinglinks', '82325a1de5e84ea88f332f3dbc10f6d5', '温湿度产品协议转换', '22', '22', 'MQTT', 'java', '222',
        '222',
        'import com.alibaba.fastjson.JSONArray;\nimport com.alibaba.fastjson.JSONObject;\n\nimport javax.xml.bind.annotation.adapters.HexBinaryAdapter;\nimport java.math.BigInteger;\nimport java.util.Date;\n\npublic class newtest {\n    public static void main(String[] args) throws Exception {\n        String injson = \"\";\n\n        if (args != null && args.length != 0) {\n            injson = args[0];\n        }\n        JSONObject parsejson = JSONObject.parseObject(injson);\n        System.out.println(Convert2SystemJSON(parsejson));\n    }\n    public static String Convert2SystemJSON(JSONObject injsonobj) throws Exception {\n        String hexdata = injsonobj.get(\"data\").toString();\n        byte[] bt = java.util.Base64.getDecoder().decode(hexdata);\n        JSONObject data = hex2wsdjsonobj(bt);\n\n        JSONArray services = new JSONArray();\n        JSONObject server = new JSONObject();\n        server.put(\"serviceId\", \"serdsd123\");\n        server.put(\"data\", data);\n        server.put(\"eventTime\", new Date());\n        services.add(server);\n\n        JSONObject dev = new JSONObject();\n        dev.put(\"deviceId\", injsonobj.get(\"devEui\"));\n        dev.put(\"services\", services);\n        JSONArray devices = new JSONArray();\n        devices.add(dev);\n\n        JSONObject root = new JSONObject();\n        root.put(\"devices\", devices);\n        return root.toJSONString();\n    }\n\n    /**\n     * 十六进制转换成10进制 负数也能转换\n     */\n    public static int hex16convert2(String hex) throws Exception {\n        if (hex.length() != 4) {\n            throw new Exception(\"必须是4个长度\");\n        }\n        int bit1 = Integer.parseInt(hex.substring(0, 1), 16);\n        if (bit1 &lt; 8)\n        {\n            return Integer.parseInt(hex, 16);\n        } else {\n            return new BigInteger(\"FFFF\" + hex, 16).intValue();\n        }\n    }\n\n    /**\n     * 温湿度解码\n     */\n    private static JSONObject hex2wsdjsonobj(byte[] bt) throws Exception {\n        javax.xml.bind.annotation.adapters.HexBinaryAdapter hexBinaryAdapter = new HexBinaryAdapter();\n        JSONObject data = new JSONObject();\n        String temp = hexBinaryAdapter.marshal(new byte[]{bt[2]});\n        String temp2 = hexBinaryAdapter.marshal(new byte[]{bt[3]});\n        String changtemp = change(temp, temp2);\n        data.put(\"temperature\", hex16convert2(changtemp) * 0.01);\n        temp = hexBinaryAdapter.marshal(new byte[]{bt[4]});\n        temp2 = hexBinaryAdapter.marshal(new byte[]{bt[5]});\n        changtemp = change(temp, temp2);\n        data.put(\"humidity\", hex16convert2(changtemp) * 0.01);\n        temp = hexBinaryAdapter.marshal(new byte[]{bt[8]});\n        temp2 = hexBinaryAdapter.marshal(new byte[]{bt[9]});\n        changtemp = change(temp, temp2);\n        data.put(\"battery\", hex16convert2(changtemp));\n        return data;\n    }\n\n    public static String change(String first, String end) {\n        return end + first;\n    }\n}\n',
        '0', 'admin', '2022-07-11 15:55:22', 'admin', '2022-08-17 17:29:02', '温湿度产品协议转换样例');
INSERT INTO `protocol` (`id`, `app_id`, `product_identification`, `protocol_name`, `protocol_identification`,
                        `protocol_version`, `protocol_type`, `protocol_voice`, `class_name`, `file_path`, `content`,
                        `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (2, '', '0d6f540f643c46cb83df6758e090236d', 'co2协议转换', '1', '1', 'MQTT', 'java', '1', '1',
        'import com.alibaba.fastjson.JSONArray;\nimport com.alibaba.fastjson.JSONObject;\n\nimport javax.xml.bind.annotation.adapters.HexBinaryAdapter;\nimport java.util.Date;\n\npublic class co2test {\n    public static void main(String[] args) throws Exception {\n        String injson = \"\";\n\n        if (args != null && args.length != 0) {\n            injson = args[0];\n        }\n        JSONObject parsejson = JSONObject.parseObject(injson);\n        System.out.println(Convert2SystemJSON(parsejson));\n    }\n    public static String Convert2SystemJSON(JSONObject injsonobj) throws Exception {\n        String hexdata = injsonobj.get(\"data\").toString();\n        byte[] bt = java.util.Base64.getDecoder().decode(hexdata);\n        JSONObject data = hex2co2jsonobj(bt);\n\n        JSONArray services = new JSONArray();\n        JSONObject server = new JSONObject();\n        server.put(\"serviceId\", \"serdsd123\");\n        server.put(\"data\", data);\n        server.put(\"eventTime\", new Date());\n        services.add(server);\n\n        JSONObject dev = new JSONObject();\n        dev.put(\"deviceId\",  injsonobj.get(\"devEUI\").toString());\n        dev.put(\"services\", services);\n        JSONArray devices = new JSONArray();\n        devices.add(dev);\n\n        JSONObject root = new JSONObject();\n        root.put(\"devices\", devices);\n        return root.toJSONString();\n    }\n \n    private static JSONObject hex2co2jsonobj(byte[] bt) throws Exception {\n        javax.xml.bind.annotation.adapters.HexBinaryAdapter hexBinaryAdapter = new HexBinaryAdapter();\n        String hex=hexBinaryAdapter.marshal(bt);\n        JSONObject data = new JSONObject();\n        for (int i = 0; i &lt; hex.length(); i++) {\n            String td = hex.substring(i, i + 2);\n            String type = hex.substring(i + 2, i + 4); \n            if (td.equals(\"01\") && type.equals(\"75\")) {\n                data.put(\"battery\", Integer.parseInt(hex.substring(i + 4, i + 6), 16));\n            } \n            else if (td.equals(\"03\") && type.equals(\"67\")) { \n                String temp = change(hex.substring(i + 4, i + 6), hex.substring(i + 6, i + 8));\n                data.put(\"temperature\", Integer.parseInt(temp, 16) * 0.1);\n                i = i + 7;\n            } \n            else if (td.equals(\"04\") && type.equals(\"68\")) {\n                data.put(\"humidity\", Integer.parseInt(hex.substring(i + 4, i + 6), 16) / 2);\n                i = i + 5;\n            } \n            else if (td.equals(\"05\") && type.toLowerCase().equals(\"7d\")) {\n                String temp = change(hex.substring(i + 4, i + 6), hex.substring(i + 6, i + 8));\n                data.put(\"co2\", Integer.parseInt(temp, 16));\n                i = i + 7;\n            } \n            else if (td.equals(\"06\") && type.equals(\"73\")) {\n                String temp = change(hex.substring(i + 4, i + 6), hex.substring(i + 6, i + 8));\n                data.put(\"pressure\",Integer.parseInt(temp, 16) * 0.1);\n                i = i + 7;\n            } else {\n                break;\n            }\n        }\n        return data;\n    }\n\n    public static String change(String first, String end) {\n        return end + first;\n    }\n}\n',
        '0', 'admin', '2022-07-13 09:26:32', 'admin', '2022-07-14 16:58:23', 'co2协议转换样例');
COMMIT;

-- ----------------------------
-- Table structure for rule
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule`
(
    `id`                  bigint(1)    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `app_id`              varchar(64)  NOT NULL COMMENT '应用ID',
    `rule_identification` varchar(100) NOT NULL COMMENT '规则标识',
    `rule_name`           varchar(255) NOT NULL COMMENT '规则名称',
    `job_identification`  varchar(255) NOT NULL COMMENT '任务标识',
    `status`              varchar(10)  NOT NULL DEFAULT '0' COMMENT '状态(字典值：0启用  1停用)',
    `triggering`          smallint(20)          DEFAULT NULL COMMENT '触发机制（0:全部，1:任意一个）',
    `remark`              varchar(255)          DEFAULT NULL COMMENT '规则描述，可以为空',
    `create_by`           varchar(64)           DEFAULT NULL COMMENT '创建人',
    `create_time`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`           varchar(64)           DEFAULT NULL COMMENT '更新人',
    `update_time`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8 COMMENT ='规则信息表';

-- ----------------------------
-- Records of rule
-- ----------------------------
BEGIN;
INSERT INTO `rule` (`id`, `app_id`, `rule_identification`, `rule_name`, `job_identification`, `status`, `triggering`,
                    `remark`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (1, 'thinglinks', 'rule-001', '测试规则', '10', '0', 1, '测试规则', 'admin', '2022-10-28 16:47:09', NULL,
        '2022-10-28 16:47:09');
COMMIT;

-- ----------------------------
-- Table structure for rule_alarm
-- ----------------------------
DROP TABLE IF EXISTS `rule_alarm`;
CREATE TABLE `rule_alarm`
(
    `id`                bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则告警ID',
    `rule_id`           bigint(20)          DEFAULT NULL COMMENT '规则ID',
    `rule_alarm_name`   varchar(255)        DEFAULT NULL COMMENT '告警规则名称',
    `rule_alarm_status` int(10)             DEFAULT NULL COMMENT '告警状态0 未启动  1运行中',
    `rule_alarm_remark` varchar(255)        DEFAULT NULL COMMENT '告警规则描述',
    `rule_level`        int(10)             DEFAULT NULL COMMENT '告警级别',
    `notice_type`       int(10)             DEFAULT NULL COMMENT '通知方式',
    `create_by`         varchar(64)         DEFAULT NULL COMMENT '创建人',
    `create_time`       datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`         varchar(64)         DEFAULT NULL COMMENT '更新人',
    `update_time`       datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='规则告警表';

-- ----------------------------
-- Records of rule_alarm
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rule_alarm_list
-- ----------------------------
DROP TABLE IF EXISTS `rule_alarm_list`;
CREATE TABLE `rule_alarm_list`
(
    `id`                  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `alarm_time`          datetime     DEFAULT NULL COMMENT '告警时间',
    `alarm_name`          varchar(255) DEFAULT NULL COMMENT '告警名称',
    `alarm_level`         int(10)      DEFAULT NULL COMMENT '告警级别',
    `alarm_describe`      varchar(255) DEFAULT NULL COMMENT '告警描述',
    `processing_result`   int(10)      DEFAULT NULL COMMENT '处理结果 0 未处理 1已处理',
    `processing_opinions` varchar(255) DEFAULT NULL COMMENT '处理意见',
    `alarm_content`       varchar(500) DEFAULT NULL COMMENT '告警内容',
    `processing_people`   varchar(64)  DEFAULT NULL COMMENT '处理人',
    `processing_time`     datetime     DEFAULT NULL COMMENT '处理时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='告警列表';

-- ----------------------------
-- Records of rule_alarm_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rule_conditions
-- ----------------------------
DROP TABLE IF EXISTS `rule_conditions`;
CREATE TABLE `rule_conditions`
(
    `id`                     bigint(20)   NOT NULL COMMENT '主键',
    `rule_id`                bigint(20)   NOT NULL COMMENT '规则ID',
    `condition_type`         smallint(20) NOT NULL COMMENT '条件类型(0:匹配设备触发、1:指定设备触发、2:按策略定时触发)',
    `device_identification`  varchar(2000)         DEFAULT NULL COMMENT '设备标识(匹配设备设备类型存储一个产品下所有的设备标识逗号分隔，指定设备触发存储指定的设备标识)',
    `product_identification` varchar(100)          DEFAULT NULL COMMENT '产品标识',
    `service_id`             bigint(20)            DEFAULT NULL COMMENT '服务ID',
    `properties_id`          bigint(20)            DEFAULT NULL COMMENT '属性ID',
    `comparison_mode`        varchar(255)          DEFAULT NULL COMMENT '比较模式\r\n<\r\n<=\r\n>\r\n>=\r\n==\r\n!=\r\nin\r\nbetween',
    `comparison_value`       varchar(255)          DEFAULT NULL COMMENT '比较值\r\n\r\nbetween类型传值例子  [10,15] 必须是两位，且数字不能重复\r\n判断数据是否处于一个离散的取值范围内，例如输入[1,2,3,4]，取值范围是1、2、3、4四个值，如果比较值类型为float(double)，两个float（double）型数值相差在0.000001范围内即为相等',
    `create_by`              varchar(64)           DEFAULT NULL COMMENT '创建人',
    `create_time`            datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`              varchar(64)           DEFAULT NULL COMMENT '更新人',
    `update_time`            datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='规则条件表';

-- ----------------------------
-- Records of rule_conditions
-- ----------------------------
BEGIN;
INSERT INTO `rule_conditions` (`id`, `rule_id`, `condition_type`, `device_identification`, `product_identification`,
                               `service_id`, `properties_id`, `comparison_mode`, `comparison_value`, `create_by`,
                               `create_time`, `update_by`, `update_time`)
VALUES (1, 1, 1, '1532a311ce554052936f64f3dd3fff88', '7b6d3451e60d4e8c9d06fb41df4e153e', 69, 139, '==', '20', 'admin',
        '2022-11-03 16:03:30', NULL, '2022-11-03 16:03:30');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `config_id`    int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1)      DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time`  datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time`  datetime     DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2021-09-17 18:40:14',
        'admin',
        '2022-10-14 17:53:03', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `remark`)
VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-09-17 18:40:14', 'admin',
        '2021-10-21 17:04:07', '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `remark`)
VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-09-17 18:40:14', '',
        '2022-11-18 13:51:15', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `remark`)
VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-09-17 18:40:14',
        '',
        '2022-11-18 13:51:20', '是否开启注册用户功能（true开启，false关闭）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint(20)          DEFAULT '0' COMMENT '父部门id',
    `ancestors`   varchar(50)         DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30)         DEFAULT '' COMMENT '部门名称',
    `order_num`   int(4)              DEFAULT '0' COMMENT '显示顺序',
    `leader`      varchar(20)         DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11)         DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50)         DEFAULT NULL COMMENT '邮箱',
    `status`      char(1)             DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
    `del_flag`    char(1)             DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`   varchar(64)         DEFAULT '' COMMENT '创建者',
    `create_time` datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)         DEFAULT '' COMMENT '更新者',
    `update_time` datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 110
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (100, 0, '0', 'mqttsnet', 0, 'thinglinks', '15888888888', 'mqttsnet@163.com', '0', '0', 'admin',
        '2021-09-17 18:39:56', 'thinglinks', '2022-01-03 11:45:55');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (101, 100, '0,100', '深圳总公司', 1, 'mqtts', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2021-09-17 18:39:56',
        '', '2022-01-03 11:45:55');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (102, 100, '0,100', '长沙分公司', 2, 'mqtts', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-09-17 18:39:56',
        '', '2022-01-03 11:45:55');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (103, 101, '0,100,101', '研发部门', 1, 'mqtts', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2021-09-17 18:39:56',
        '', '2022-01-03 11:45:55');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (104, 101, '0,100,101', '市场部门', 2, 'mqtts', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2021-09-17 18:39:57',
        '', '2022-01-03 11:45:55');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (105, 101, '0,100,101', '测试部门', 3, 'mqtts', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2021-09-17 18:39:57',
        '', '2022-01-03 11:45:55');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (106, 101, '0,100,101', '财务部门', 4, 'mqtts', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-09-17 18:39:57',
        '', '2022-01-03 11:45:55');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (107, 101, '0,100,101', '运维部门', 5, 'mqtts', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-09-17 18:39:57',
        '', '2022-01-03 11:45:55');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (108, 102, '0,100,102', '市场部门', 1, 'mqtts', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-09-17 18:39:57',
        '', '2022-01-03 11:45:55');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`,
                        `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (109, 102, '0,100,102', '财务部门', 2, 'mqtts', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2021-09-17 18:39:57',
        '', '2022-01-03 11:45:55');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int(4)              DEFAULT '0' COMMENT '字典排序',
    `dict_label`  varchar(100)        DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100)        DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100)        DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100)        DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100)        DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1)             DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1)             DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64)         DEFAULT '' COMMENT '创建者',
    `create_time` datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)         DEFAULT '' COMMENT '更新者',
    `update_time` datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`      varchar(500)        DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 76
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-09-17 18:40:12', '', '2021-09-17 18:40:13',
        '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-09-17 18:40:13', '', '2021-09-17 18:40:13',
        '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-09-17 18:40:13', '', '2021-09-17 18:40:13',
        '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '系统分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-09-17 18:40:13', '',
        '2021-09-17 18:40:13', '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-09-17 18:40:14', '',
        '2021-09-17 18:40:13', '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-09-17 18:40:14', '',
        '2021-09-17 18:40:13', '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-09-17 18:40:14', '',
        '2021-09-17 18:40:13', '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-09-17 18:40:14', '',
        '2021-09-17 18:40:13', '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-09-17 18:40:14', '',
        '2021-09-17 18:40:13', '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-09-17 18:40:14', '',
        '2021-09-17 18:40:13', '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (29, 0, '默认', 'default', 'link_device_auth_mode', NULL, 'default', 'N', '0', 'admin', '2021-10-21 17:56:52',
        '',
        '2021-09-17 18:40:13', '设备用户名+设备密码');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (30, 1, 'SSL/TLS', 'SSL/TLS', 'link_device_auth_mode', NULL, 'default', 'N', '0', 'admin', '2021-10-21 17:59:10',
        '', '2021-09-17 18:40:13', 'SSL/TLS认证');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (31, 0, '127.0.0.1:11883', '127.0.0.1:11883', 'link_device_connector', NULL, 'default', 'N', '0', 'admin',
        '2021-10-21 18:11:26', 'thinglinks', '2021-09-17 18:40:13', '本地默认节点');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (32, 0, '启用', 'ENABLE', 'link_device_status', NULL, 'success', 'N', '0', 'admin', '2021-10-22 16:28:13',
        'admin',
        '2021-09-17 18:40:13', '设备启用');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (33, 1, '禁用', 'DISABLE', 'link_device_status', NULL, 'danger', 'N', '0', 'admin', '2021-10-22 16:28:31',
        'admin',
        '2021-09-17 18:40:13', '设备禁用');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (34, 1, '在线', 'ONLINE', 'link_device_connect_status', '', 'success', 'N', '0', 'admin', '2021-10-22 16:35:53',
        'admin', '2021-09-17 18:40:13', '设备在线');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (35, 2, '离线', 'OFFLINE', 'link_device_connect_status', '', 'warning', 'N', '0', 'admin', '2021-10-22 16:36:23',
        'admin', '2021-09-17 18:40:13', '设备离线');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (36, 0, '未连接', 'INIT', 'link_device_connect_status', '', 'info', 'N', '0', 'admin', '2021-10-22 16:37:15',
        'admin', '2021-09-17 18:40:13', '设备未连接');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (37, 0, '是', '0', 'link_device_is_will', NULL, 'primary', 'N', '0', 'admin', '2021-10-22 16:40:55', 'admin',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (38, 0, '否', '1', 'link_device_is_will', NULL, 'warning', 'N', '0', 'admin', '2021-10-22 16:41:02', 'admin',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (39, 0, 'mqtt', 'MQTT', 'link_device_protocol_type', NULL, 'default', 'N', '0', 'admin', '2021-10-22 16:43:48',
        'mqtts', '2021-09-17 18:40:13', 'mqtt');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (40, 1, 'coap', 'COAP', 'link_device_protocol_type', NULL, 'default', 'N', '0', 'admin', '2021-10-22 16:44:02',
        'mqtts', '2021-09-17 18:40:13', 'coap');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (41, 2, 'modbus', 'MODBUS', 'link_device_protocol_type', NULL, 'default', 'N', '0', 'admin',
        '2021-10-22 16:44:15', 'mqtts', '2021-09-17 18:40:13', 'modbus');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (42, 3, 'http', 'HTTP', 'link_device_protocol_type', NULL, 'default', 'N', '0', 'admin', '2021-10-22 16:44:35',
        'mqtts', '2021-09-17 18:40:13', 'http');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (43, 0, '普通设备', 'COMMON', 'link_device_device_type', NULL, 'default', 'N', '0', 'admin',
        '2021-10-22 16:57:26',
        'mqtts', '2021-09-17 18:40:13', '普通设备（无子设备也无父设备）');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (44, 1, '网关设备', 'GATEWAY', 'link_device_device_type', NULL, 'default', 'N', '0', 'admin',
        '2021-10-22 16:57:44',
        'mqtts', '2021-09-17 18:40:13', '网关设备(可挂载子设备)');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (46, 0, 'thinglinks', 'thinglinks', 'link_application_type', NULL, 'default', 'N', '0', 'thinglinks',
        '2021-12-28 13:47:34', 'admin', '2021-09-17 18:40:13', 'thinglinks');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (47, 1, '218.78.103.93:11883', '218.78.103.93:11883', 'link_device_connector', NULL, 'default', 'N', '0',
        'thinglinks', '2021-12-28 13:49:09', 'thinglinks', '2021-09-17 18:40:13', '物联网测试环境');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (48, 0, 'Default', 'default', 'link_product_device_type', NULL, 'default', 'N', '0', 'admin',
        '2022-02-09 16:51:26', '', '2021-09-17 18:40:13', '默认');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (49, 0, '普通产品', 'COMMON', 'link_product_type', NULL, 'default', 'N', '0', 'admin', '2022-02-09 18:02:38', '',
        '2021-09-17 18:40:13', '普通产品，需直连设备。');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (50, 1, '网关产品', 'GATEWAY', 'link_product_type', NULL, 'default', 'N', '0', 'admin', '2022-02-09 18:02:55',
        'admin', '2021-09-17 18:40:13', '网关产品，可挂载子设备。');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (51, 0, '非必填', '0', 'link_product_isRequired', NULL, 'default', 'N', '0', 'admin', '2022-03-25 15:51:10', '',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (52, 0, '必填', '1', 'link_product_isRequired', NULL, 'default', 'N', '0', 'admin', '2022-03-25 15:51:19', '',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (53, 0, '允许', 'allow', 'link_casbinRule_v3', NULL, 'success', 'N', '0', 'admin', '2022-06-16 18:03:46',
        'admin',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (55, 0, '拒绝', 'deny', 'link_casbinRule_v3', NULL, 'warning', 'N', '0', 'admin', '2022-06-16 18:05:08', 'admin',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (57, 0, '发布', 'PUBLISH', 'link_casbinRule_v2', NULL, 'primary', 'N', '0', 'admin', '2022-06-16 18:13:15',
        'admin', '2021-09-17 18:40:13', '发布动作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (58, 0, '订阅', 'SUBSCRIBE', 'link_casbinRule_v2', NULL, 'info', 'N', '0', 'admin', '2022-06-16 18:21:09',
        'admin',
        '2021-09-17 18:40:13', '订阅动作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (59, 0, '上线', 'ONLINE', 'link_device_action_type', NULL, 'success', 'N', '0', 'admin', '2022-06-17 17:45:24',
        '',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (60, 0, '离线', 'OFFLINE', 'link_device_action_type', NULL, 'warning', 'N', '0', 'admin', '2022-06-17 17:45:49',
        '', '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (61, 0, '是', 'true', 'link_deviceInfo_shadow_enable', NULL, 'primary', 'N', '0', 'admin', '2022-06-21 11:28:26',
        'admin', '2021-09-17 18:40:13', '支持设备影子');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (62, 0, '否', 'false', 'link_deviceInfo_shadow_enable', NULL, 'danger', 'N', '0', 'admin', '2022-06-21 11:28:46',
        'admin', '2021-09-17 18:40:13', '不支持设备影子');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (63, 0, '启用', '0', 'business_data_status', NULL, 'success', 'N', '0', 'admin', '2022-06-21 14:26:47', '',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (64, 0, '停用', '1', 'business_data_status', NULL, 'danger', 'N', '0', 'admin', '2022-06-21 14:27:03', '',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (65, 0, 'string', 'string', 'link_product_datatype', NULL, 'default', 'N', '0', 'admin', '2022-06-24 18:42:46',
        '', '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (66, 0, 'binary', 'binary', 'link_product_datatype', NULL, 'default', 'N', '0', 'admin', '2022-06-24 18:42:59',
        '', '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (67, 0, 'int', 'int', 'link_product_datatype', NULL, 'default', 'N', '0', 'admin', '2022-06-24 18:43:09', '',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (68, 0, 'bool', 'bool', 'link_product_datatype', NULL, 'default', 'N', '0', 'admin', '2022-06-24 18:43:18', '',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (69, 0, 'decimal', 'decimal', 'link_product_datatype', NULL, 'default', 'N', '0', 'admin', '2022-06-24 18:43:28',
        '', '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (70, 0, 'timestamp', 'timestamp', 'link_product_datatype', NULL, 'default', 'N', '0', 'admin',
        '2022-06-24 18:43:58', '', '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (71, 0, 'json', 'json', 'link_product_datatype', NULL, 'default', 'N', '0', 'admin', '2022-06-24 18:44:08', '',
        '2021-09-17 18:40:13', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (72, 0, 'java', 'java', 'link_protocol_voice', NULL, 'default', 'N', '0', 'admin', '2022-07-04 11:17:07', '',
        '2021-09-17 18:40:13', 'java');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (73, 3, '协议管理', 'PROTOCOL', 'sys_job_group', NULL, 'default', 'N', '0', 'admin', '2022-07-11 15:48:55',
        'admin',
        '2021-09-17 18:40:13', '协议管理');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (74, 4, '规则触发器', 'RULE_TRIGGER', 'sys_job_group', NULL, 'default', 'N', '0', 'admin', '2022-07-18 18:22:09',
        'admin', '2021-09-17 18:40:13', '设备联动规则触发器');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                             `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (75, 5, '设备管理', 'LINK_DEVICE', 'sys_job_group', NULL, 'default', 'N', '0', 'admin', '2022-07-29 14:36:31',
        'admin', '2021-09-17 18:40:13', '设备管理');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) DEFAULT '' COMMENT '字典类型',
    `status`      char(1)      DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-09-17 18:40:11', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-09-17 18:40:11', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-09-17 18:40:11', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-09-17 18:40:12', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-09-17 18:40:12', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-09-17 18:40:12', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-09-17 18:40:12', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-09-17 18:40:12', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-09-17 18:40:12', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-09-17 18:40:12', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (11, '设备认证方式', 'link_device_auth_mode', '0', 'admin', '2021-10-21 17:52:30', '', NULL, '设备管理鉴权方式');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (12, '设备连接实例', 'link_device_connector', '0', 'admin', '2021-10-21 18:10:18', '', NULL, '设备连接实例');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (13, '设备状态', 'link_device_status', '0', 'admin', '2021-10-22 16:27:28', 'mqtts', '2021-10-25 15:48:58',
        '设备状态');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (14, '连接状态', 'link_device_connect_status', '0', 'admin', '2021-10-22 16:35:11', '', NULL, '设备连接状态\n');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (15, '是否遗言', 'link_device_is_will', '0', 'admin', '2021-10-22 16:40:39', '', NULL, '设备是否有遗言');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (16, '产品协议类型', 'link_device_protocol_type', '0', 'admin', '2021-10-22 16:43:24', '', NULL,
        '产品协议类型 ：mqtt || coap || modbus || http');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (17, '设备类型', 'link_device_device_type', '0', 'admin', '2021-10-22 16:54:12', 'admin', '2021-10-22 16:56:47',
        '设备类型0-普通设备（无子设备也无父设备）1-网关设备(可挂载子设备)2-子设备(归属于某个网关设备)。');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (18, '集成应用类型', 'link_application_type', '0', 'thinglinks', '2021-12-28 13:41:22', 'thinglinks',
        '2021-12-28 13:42:28', '集成应用');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (19, '产品设备类型', 'link_product_device_type', '0', 'admin', '2022-02-09 16:50:14', 'admin',
        '2022-02-09 17:53:25',
        '产品设备类型，支持英文大小写、数字、下划线和中划线');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (20, '产品类型', 'link_product_type', '0', 'admin', '2022-02-09 17:52:26', '', NULL,
        '支持以下两种产品类型：\n•0：普通产品，需直连设备。\n•1：网关产品，可挂载子设备。\n');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (21, '是否必填', 'link_product_isRequired', '0', 'admin', '2022-03-25 15:39:40', '', NULL, NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (22, 'CAS策略类型', 'link_casbinRule_v3', '0', 'admin', '2022-06-16 18:02:31', '', NULL,
        'CAS策略类型：允许||拒绝');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (23, 'CAS策略动作', 'link_casbinRule_v2', '0', 'admin', '2022-06-16 18:11:05', '', NULL, '认证动作');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (24, '设备动作类型', 'link_device_action_type', '0', 'admin', '2022-06-17 17:43:34', '', NULL, NULL);
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (25, '设备影子状态', 'link_deviceInfo_shadow_enable', '0', 'admin', '2022-06-21 11:27:39', '', NULL,
        '是否支设备影子');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (26, '业务数据状态', 'business_data_status', '0', 'admin', '2022-06-21 14:25:45', '', NULL,
        '业务数据状态标识（0启用  1停用）');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (27, '指示数据类型', 'link_product_datatype', '0', 'admin', '2022-06-24 18:41:39', '', NULL,
        '产品模型指示数据类型');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`,
                             `update_time`, `remark`)
VALUES (28, '协议语言', 'link_protocol_voice', '0', 'admin', '2022-07-04 11:16:20', 'admin', '2022-07-04 17:09:29',
        '协议管理-支持的协议脚本语言');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`
(
    `job_id`          bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `job_name`        varchar(64)  NOT NULL DEFAULT '' COMMENT '任务名称',
    `job_group`       varchar(64)  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255)          DEFAULT '' COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20)           DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    `concurrent`      char(1)               DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
    `status`          char(1)               DEFAULT '0' COMMENT '状态（0正常 1暂停）',
    `create_by`       varchar(64)           DEFAULT '' COMMENT '创建者',
    `create_time`     datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`       varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`     datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`          varchar(500)          DEFAULT '' COMMENT '备注信息',
    PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin',
        '2021-09-17 18:40:15',
        'mqtts', '2021-10-25 03:09:23', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin',
        '2021-09-17 18:40:15', '', '2022-11-23 13:54:34', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?',
        '3',
        '1', '1', 'admin', '2021-09-17 18:40:15', '', '2022-11-18 13:54:40', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (4, '协议脚本缓存刷新定时任务', 'PROTOCOL', 'linkProtocolTask.protocolScriptCacheRefreshTask',
        '0/5 0 0/23 * * ?', '2', '1',
        '1', 'admin', '2022-07-11 15:50:49', 'admin', '2022-07-29 14:35:06', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (5, '测试', 'RULE_TRIGGER', 'ruleConditionsTask.parsingRuleConditions1(\'1\')', '0/2 * * * * ?', '1', '0', '1',
        'admin', '2022-07-19 15:19:41', 'admin', '2022-08-26 09:38:14', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (6, '测试2', 'RULE_TRIGGER', 'ruleConditionsTask.parsingRuleConditions2(\'2\')', '0/2 * * * * ?', '1', '1', '1',
        'admin', '2022-07-19 15:21:48', 'admin', '2022-08-26 09:38:12', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (7, '刷新子设备数据模型', 'LINK_DEVICE', 'linkDeviceInfoTask.refreshDeviceInfoDataModel(\'\')', '0 0 0/12 * * ?',
        '1',
        '1', '1', 'admin', '2022-07-29 14:38:01', 'admin', '2022-07-29 16:09:15', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (8, '测试3', 'RULE_TRIGGER', 'ruleConditionsTask.parsingRuleConditions3(\'3\')', '0/2 * * * * ?', '1', '0', '1',
        'admin', '2022-08-25 14:09:26', 'admin', '2022-08-26 09:38:09', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (9, '测试4', 'RULE_TRIGGER', 'ryTask.ryParams(\'4\')', '0/2 * * * * ?', '1', '0', '1', 'admin',
        '2022-08-25 14:09:27', 'admin', '2022-08-25 14:15:49', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`,
                       `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (10, '哈哈', 'RULE_TRIGGER', 'ruleConditionsTask.parsingRuleConditions(\'rule-001\')', '0/2 0/2 * * * ?', '1',
        '0',
        '0', 'admin', '2022-10-28 16:46:14', 'admin', '2022-11-04 18:22:57', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`
(
    `job_log_id`     bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    `job_name`       varchar(64)  NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64)  NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500)          DEFAULT NULL COMMENT '日志信息',
    `status`         char(1)               DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
    `exception_info` varchar(2000)         DEFAULT '' COMMENT '异常信息',
    `create_time`    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2652
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`
(
    `info_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`   varchar(50)         DEFAULT '' COMMENT '用户账号',
    `ipaddr`      varchar(128)        DEFAULT '' COMMENT '登录IP地址',
    `status`      char(1)             DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`         varchar(255)        DEFAULT '' COMMENT '提示信息',
    `access_time` datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '访问时间',
    PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 322
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint(20)   DEFAULT '0' COMMENT '父菜单ID',
    `order_num`   int(4)       DEFAULT '0' COMMENT '显示顺序',
    `path`        varchar(200) DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) DEFAULT NULL COMMENT '路由参数',
    `is_frame`    int(1)       DEFAULT '1' COMMENT '是否为外链（0是 1否）',
    `is_cache`    int(1)       DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1)      DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1)      DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1)      DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1137
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-09-17 18:39:58', '',
        '2022-10-28 17:46:29', '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-09-17 18:39:58',
        '',
        '2022-10-28 17:46:29', '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-09-17 18:39:58', '',
        '2022-10-28 17:46:29', '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (4, 'ThingLinks官网', 0, 8, 'http://thinglinks.mqttsnet.com', NULL, '', 0, 0, 'M', '0', '1', '', 'guide',
        'admin',
        '2021-09-17 18:39:59', 'admin', '2022-10-28 17:46:29', 'mqtts官网地址');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user',
        'admin',
        '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples',
        'admin',
        '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table',
        'admin', '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree',
        'admin',
        '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post',
        'admin',
        '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict',
        'admin',
        '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit',
        'admin', '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list',
        'message',
        'admin', '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-09-17 18:39:59', '',
        '2022-10-28 17:46:29', '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list',
        'online',
        'admin', '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin',
        '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '定时任务菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:19101', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list',
        'sentinel', 'admin', '2021-09-17 18:39:59', 'admin', '2022-10-28 17:46:29', '流量控制菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos/index.html', '', '', 0, 0, 'C', '0', '0',
        'monitor:nacos:list', 'nacos', 'admin', '2021-09-17 18:39:59', 'admin', '2022-10-28 17:46:29', '服务治理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:19400/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list',
        'server', 'admin', '2021-09-17 18:39:59', 'admin', '2022-10-28 17:46:29', '服务监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build',
        'admin',
        '2021-09-17 18:39:59', '', '2022-10-28 17:46:29', '表单构建菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin',
        '2021-09-17 18:40:00', '', '2022-10-28 17:46:29', '代码生成菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0',
        'tool:swagger:list', 'swagger', 'admin', '2021-09-17 18:40:00', '', '2022-10-28 17:46:29', '系统接口菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list',
        'form',
        'admin', '2021-09-17 18:40:00', '', '2022-10-28 17:46:29', '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0',
        'system:logininfor:list',
        'logininfor', 'admin', '2021-09-17 18:40:00', '', '2022-10-28 17:46:29', '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2021-09-17 18:40:00',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2021-09-17 18:40:00',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2021-09-17 18:40:00',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2021-09-17 18:40:00', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2021-09-17 18:40:00', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2021-09-17 18:40:00', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2021-09-17 18:40:00', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2021-09-17 18:40:00',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2021-09-17 18:40:00',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2021-09-17 18:40:01', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2021-09-17 18:40:01', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2021-09-17 18:40:01', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2021-09-17 18:40:01', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin',
        '2021-09-17 18:40:01',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin',
        '2021-09-17 18:40:01', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin',
        '2021-09-17 18:40:01', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2021-09-17 18:40:02',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2021-09-17 18:40:02',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin',
        '2021-09-17 18:40:02', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin',
        '2021-09-17 18:40:03', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin',
        '2021-09-17 18:40:03', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin',
        '2021-09-17 18:40:03', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin',
        '2021-09-17 18:40:03', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin',
        '2021-09-17 18:40:03', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin',
        '2021-09-17 18:40:03', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin',
        '2021-09-17 18:40:03',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin',
        '2021-09-17 18:40:03',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin',
        '2021-09-17 18:40:03', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin',
        '2021-09-17 18:40:03', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin',
        '2021-09-17 18:40:03', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin',
        '2021-09-17 18:40:04',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin',
        '2021-09-17 18:40:04',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin',
        '2021-09-17 18:40:04',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin',
        '2021-09-17 18:40:04',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin',
        '2021-09-17 18:40:04',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin',
        '2021-09-17 18:40:04',
        '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1061, '设备集成', 0, 4, 'link', NULL, NULL, 1, 0, 'M', '0', '0', '', 'client', 'admin', '2021-10-21 17:14:32',
        'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1062, '设备管理', 1061, 3, 'device', 'link/device/index', NULL, 1, 0, 'C', '0', '0', 'link:device:list',
        'slider',
        'admin', '2021-10-21 17:27:48', 'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1063, '设备查询', 1062, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:device:query', '#', 'admin',
        '2021-10-21 17:35:09', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1064, '设备新增', 1062, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:device:add', '#', 'admin',
        '2021-10-21 17:35:39', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1065, '设备修改', 1062, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:device:edit', '#', 'admin',
        '2021-10-21 17:36:00', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1066, '设备删除', 1062, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:device:remove', '#', 'admin',
        '2021-10-21 17:36:21', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1067, '设备导出', 1062, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:device:export', '#', 'admin',
        '2021-10-21 17:36:41', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1068, '产品管理', 1061, 1, 'product', 'link/product/index', NULL, 1, 0, 'C', '0', '0', 'link:product:list',
        'nested', 'thinglinks', '2022-02-09 15:56:11', 'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1069, '产品管理查询', 1068, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product:query', '#', 'admin',
        '2022-02-09 16:58:42', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1070, '产品管理新增', 1068, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product:add', '#', 'admin',
        '2022-02-09 16:58:42', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1071, '产品管理修改', 1068, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product:edit', '#', 'admin',
        '2022-02-09 16:58:42', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1072, '产品管理删除', 1068, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product:remove', '#', 'admin',
        '2022-02-09 16:58:42', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1073, '产品管理导出', 1068, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product:export', '#', 'admin',
        '2022-02-09 16:58:42', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1074, '断开连接', 1062, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:device:disconnect', '#', 'admin',
        '2022-03-08 16:17:36', 'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1075, '产品管理导入', 1068, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:product:import', '#', 'admin',
        '2022-03-25 18:04:07', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1076, '设备详情', 1062, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:device:deviceDetails', '#', 'admin',
        '2022-05-04 18:20:08', 'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1077, '设备监控', 0, 6, 'tdengine', NULL, NULL, 1, 0, 'M', '0', '0', '', 'online', 'admin',
        '2022-05-05 14:06:11',
        'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1078, '设备影子', 1077, 1, 'tdengine', 'tdengine/shadow/index', NULL, 1, 0, 'C', '0', '0',
        'tdengine:shadow:list',
        'ContentUnion', 'admin', '2022-05-05 14:09:20', 'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1079, '快捷生成', 1068, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:product:generate', '#', 'admin',
        '2022-05-13 14:23:43', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1080, 'CAS规则管理', 1061, 6, 'casbinRule', 'link/casbinRule/index', NULL, 1, 0, 'C', '0', '0',
        'link:casbinRule:list', 'lock', 'admin', '2022-06-16 18:29:45', 'admin', '2022-10-28 17:46:29',
        'CAS规则管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1081, 'CAS规则管理查询', 1080, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:casbinRule:query', '#', 'admin',
        '2022-06-16 18:29:45', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1082, 'CAS规则管理新增', 1080, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:casbinRule:add', '#', 'admin',
        '2022-06-16 18:29:46', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1083, 'CAS规则管理修改', 1080, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:casbinRule:edit', '#', 'admin',
        '2022-06-16 18:29:46', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1084, 'CAS规则管理删除', 1080, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:casbinRule:remove', '#', 'admin',
        '2022-06-16 18:29:46', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1085, 'CAS规则管理导出', 1080, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:casbinRule:export', '#', 'admin',
        '2022-06-16 18:29:46', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1086, '设备Topic数据', 1076, 1, 'topic', 'link/topic/index', NULL, 1, 0, 'C', '0', '0', 'link:topic:list', '#',
        'admin', '2022-06-17 17:15:10', '', '2022-10-28 17:46:29', '设备Topic数据菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1087, '设备Topic数据查询', 1086, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:topic:query', '#', 'admin',
        '2022-06-17 17:15:10', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1088, '设备Topic数据新增', 1086, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:topic:add', '#', 'admin',
        '2022-06-17 17:15:10', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1089, '设备Topic数据修改', 1086, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:topic:edit', '#', 'admin',
        '2022-06-17 17:15:10', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1090, '设备Topic数据删除', 1086, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:topic:remove', '#', 'admin',
        '2022-06-17 17:15:10', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1091, '设备Topic数据导出', 1086, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:topic:export', '#', 'admin',
        '2022-06-17 17:15:11', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1092, '设备动作数据', 1076, 1, 'action', 'link/action/index', NULL, 1, 0, 'C', '0', '0', 'link:action:list',
        '#',
        'admin', '2022-06-17 17:47:32', '', '2022-10-28 17:46:29', '设备动作数据菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1093, '设备动作数据查询', 1092, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:action:query', '#', 'admin',
        '2022-06-17 17:47:32', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1094, '设备动作数据新增', 1092, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:action:add', '#', 'admin',
        '2022-06-17 17:47:32', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1095, '设备动作数据修改', 1092, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:action:edit', '#', 'admin',
        '2022-06-17 17:47:32', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1096, '设备动作数据删除', 1092, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:action:remove', '#', 'admin',
        '2022-06-17 17:47:32', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1097, '设备动作数据导出', 1092, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:action:export', '#', 'admin',
        '2022-06-17 17:47:32', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1098, '子设备管理', 1061, 4, 'deviceInfo', 'link/deviceInfo/index', NULL, 1, 0, 'C', '0', '0',
        'link:deviceInfo:list', 'cascader', 'admin', '2022-06-21 10:48:04', 'admin', '2022-10-28 17:46:29',
        '子设备管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1099, '子设备管理查询', 1098, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:query', '#', 'admin',
        '2022-06-21 10:48:05', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1102, '子设备管理删除', 1098, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:remove', '#', 'admin',
        '2022-06-21 10:48:05', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1103, '子设备管理导出', 1098, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:export', '#', 'admin',
        '2022-06-21 10:48:05', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1104, '初始化模型', 1068, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:product:initialize', '#', 'admin',
        '2022-06-24 18:27:08', 'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1105, '子设备影子', 1098, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:shadow', '#', 'admin',
        '2022-06-27 16:13:35', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1107, '协议管理', 1061, 5, 'protocol', 'link/protocol/index', NULL, 1, 0, 'C', '0', '0', 'link:protocol:list',
        'example', 'admin', '2022-07-04 11:05:44', 'admin', '2022-10-28 17:46:29', '协议管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1108, '协议管理查询', 1107, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:protocol:query', '#', 'admin',
        '2022-07-04 11:05:44', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1109, '协议管理新增', 1107, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:protocol:add', '#', 'admin',
        '2022-07-04 11:05:44', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1110, '协议管理修改', 1107, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:protocol:edit', '#', 'admin',
        '2022-07-04 11:05:44', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1111, '协议管理删除', 1107, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:protocol:remove', '#', 'admin',
        '2022-07-04 11:05:44', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1112, '协议管理导出', 1107, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:protocol:export', '#', 'admin',
        '2022-07-04 11:05:44', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1113, '协议管理启用', 1107, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:protocol:enable', '#', 'admin',
        '2022-07-05 11:08:28', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1114, '协议管理停用', 1107, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:protocol:disable', '#', 'admin',
        '2022-07-05 11:09:06', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1115, '产品模板', 1061, 2, 'productTemplate', 'link/productTemplate/index', NULL, 1, 0, 'C', '0', '0',
        'link:productTemplate:list', 'exit-fullscreen', 'admin', '2022-07-08 18:35:08', 'admin', '2022-10-28 17:46:29',
        '产品模板菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1116, '产品模板查询', 1115, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product_template:query', '#', 'admin',
        '2022-07-08 18:35:08', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1117, '产品模板新增', 1115, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product_template:add', '#', 'admin',
        '2022-07-08 18:35:08', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1118, '产品模板修改', 1115, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product_template:edit', '#', 'admin',
        '2022-07-08 18:35:08', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1119, '产品模板删除', 1115, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product_template:remove', '#', 'admin',
        '2022-07-08 18:35:08', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1120, '产品模板导出', 1115, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:product_template:export', '#', 'admin',
        '2022-07-08 18:35:08', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1121, '设备调试', 0, 5, 'broker', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'bug', 'admin', '2022-07-08 19:12:34',
        '',
        '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1122, '实时日志', 1121, 1, 'broker', 'broker/realTime/index', NULL, 1, 0, 'C', '0', '0', 'broker:realTime:list',
        'time-range', 'admin', '2022-07-08 19:17:33', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1123, '命令下发', 1121, 2, 'broker:sendMsg:list', 'broker/sendMsg/index', NULL, 1, 0, 'C', '0', '0',
        'broker:sendMsg:list', 'post', 'admin', '2022-07-13 08:24:51', 'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1124, '规则引擎', 0, 7, 'rule', NULL, NULL, 1, 0, 'M', '0', '0', '', 'swagger', 'admin', '2022-07-13 11:23:03',
        'admin', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1126, '子设备管理', 1076, 1, 'deviceInfo', 'link/deviceInfo/index', NULL, 1, 0, 'C', '0', '0',
        'link:deviceInfo:list', '#', 'admin', '2022-07-27 12:34:15', '', '2022-10-28 17:46:29', '子设备管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1127, '子设备管理查询', 1126, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:query', '#', 'admin',
        '2022-07-27 12:34:15', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1128, '子设备管理新增', 1126, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:add', '#', 'admin',
        '2022-07-27 12:34:15', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1129, '子设备管理修改', 1126, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:edit', '#', 'admin',
        '2022-07-27 12:34:15', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1130, '子设备管理删除', 1126, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:remove', '#', 'admin',
        '2022-07-27 12:34:15', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1131, '子设备管理导出', 1126, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:export', '#', 'admin',
        '2022-07-27 12:34:15', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1132, '子设备管理新增', 1098, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:add', '#', 'admin',
        '2022-07-27 12:35:42', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1133, '子设备管理修改', 1098, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:edit', '#', 'admin',
        '2022-07-27 12:36:07', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1134, '初始化模型', 1098, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'link:deviceInfo:initialize', '#', 'admin',
        '2022-08-04 18:32:50', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1135, '设备联动', 1124, 1, 'deviceLinkage', 'rule/deviceLinkage/index', NULL, 1, 0, 'C', '0', '0',
        'rule:deviceLinkage:list', 'NBIOTshezhi', 'admin', '2022-08-07 20:29:24', '', '2022-10-28 17:46:29', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`,
                        `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1136, '租户管理', 1, 1, 'tenantManage', 'system/tenantManage/index', NULL, 1, 0, 'C', '0', '0',
        'system:tenantManage:list', '404', 'admin', '2022-08-11 16:43:18', 'admin', '2022-10-28 17:46:29', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `notice_id`      int(4)      NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) NOT NULL COMMENT '公告标题',
    `notice_type`    char(1)     NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob COMMENT '公告内容',
    `status`         char(1)              DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64)          DEFAULT '' COMMENT '创建者',
    `create_time`    datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`      varchar(64)          DEFAULT '' COMMENT '更新者',
    `update_time`    datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`         varchar(255)         DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, '温馨提醒：2021-07-01 ThingLinks新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin',
        '2021-09-17 18:40:16', 'admin', '2022-04-29 15:31:33', '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `remark`)
VALUES (2, '维护通知：2021-07-01 ThingLinks系统凌晨维护', '1', 0x3C703EE7BBB4E68AA4E58685E5AEB93C2F703E, '0', 'admin',
        '2021-09-17 18:40:16', 'admin', '2022-04-29 15:31:44', '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50)         DEFAULT '' COMMENT '模块标题',
    `business_type`  int(2)              DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(100)        DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10)         DEFAULT '' COMMENT '请求方式',
    `operator_type`  int(1)              DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50)         DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50)         DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255)        DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128)        DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255)        DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000)       DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000)       DEFAULT '' COMMENT '返回参数',
    `status`         int(1)              DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000)       DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
    PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 178
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`
(
    `post_id`     bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
    `post_code`   varchar(64) NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(50) NOT NULL COMMENT '岗位名称',
    `post_sort`   int(4)      NOT NULL COMMENT '显示顺序',
    `status`      char(1)     NOT NULL COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64)          DEFAULT '' COMMENT '创建者',
    `create_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)          DEFAULT '' COMMENT '更新者',
    `update_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`      varchar(500)         DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-09-17 18:39:58', '', '2022-11-18 13:57:49', '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-09-17 18:39:58', '', '2022-11-18 13:57:49', '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-09-17 18:39:58', '', '2022-11-18 13:57:49', '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `remark`)
VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-09-17 18:39:58', '', '2022-11-18 13:57:49', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`             bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30)  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int(4)       NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1)               DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `menu_check_strictly` tinyint(1)            DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1)            DEFAULT '1' COMMENT '部门树选择项是否关联显示',
    `status`              char(1)      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`            char(1)               DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`           varchar(64)           DEFAULT '' COMMENT '创建者',
    `create_time`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`           varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`              varchar(500)          DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`,
                        `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-09-17 18:39:58', '', '2022-06-17 10:43:52',
        '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`,
                        `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-09-17 18:39:58', 'admin', '2022-06-17 10:43:52',
        '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`,
                        `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (3, 'test', 'test', 0, '1', 1, 1, '0', '0', 'thinglinks', '2022-06-22 10:57:30', '', '2022-06-17 10:43:52',
        NULL);
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`,
                        `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4, '412', '4124', 0, '1', 1, 1, '0', '2', 'admin', '2022-07-19 16:39:27', '', '2022-06-17 10:43:52', NULL);
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`,
                        `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (5, 'gggg', 'ttttt', 4, '1', 1, 1, '0', '0', 'admin', '2022-10-14 00:22:30', '', '2022-06-17 10:43:52', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
    `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 100);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 101);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 102);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 103);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 104);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 105);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 106);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 107);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 108);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 109);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
    `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1049);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1051);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1052);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1053);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1054);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1060);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1061);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1062);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1063);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1064);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1065);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1066);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1067);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1068);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1069);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1070);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1071);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1072);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1073);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1074);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1075);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1076);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1079);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1080);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1081);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1082);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1083);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1084);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 1085);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`     bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id`     bigint(20)           DEFAULT NULL COMMENT '部门ID',
    `user_name`   varchar(30) NOT NULL COMMENT '用户账号',
    `nick_name`   varchar(30) NOT NULL COMMENT '用户昵称',
    `user_type`   varchar(2)           DEFAULT '00' COMMENT '用户类型（00系统用户）',
    `email`       varchar(50)          DEFAULT '' COMMENT '用户邮箱',
    `phonenumber` varchar(11)          DEFAULT '' COMMENT '手机号码',
    `sex`         char(1)              DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`      varchar(100)         DEFAULT '' COMMENT '头像地址',
    `password`    varchar(100)         DEFAULT '' COMMENT '密码',
    `status`      char(1)              DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
    `del_flag`    char(1)              DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `login_ip`    varchar(128)         DEFAULT '' COMMENT '最后登录IP',
    `login_date`  datetime             DEFAULT NULL COMMENT '最后登录时间',
    `create_by`   varchar(64)          DEFAULT '' COMMENT '创建者',
    `create_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)          DEFAULT '' COMMENT '更新者',
    `update_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`      varchar(500)         DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1004
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`,
                        `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, 103, 'admin', 'admin', '00', 'mqttsnet@163.com', '15888888889', '0',
        'http://127.0.0.1:19300/statics/2022/08/08/ed20c7f4-7382-4330-b010-68cdcb74676f.jpeg',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-09-17 18:39:57',
        'admin', '2021-09-17 18:39:57', '', '2022-06-22 14:59:00', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`,
                        `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `remark`)
VALUES (3, 100, 'thinglinks', 'thinglinks', '00', 'mqttsnet@qq.com', '', '0', NULL,
        '$2a$10$0XQqcC3u8ywcN2BrsRf1aOhDXkO2kgQtsIV.1u/KznJ2mOXd9qJE.', '0', '2', '', NULL, 'admin',
        '2021-10-21 17:03:52', 'admin', '2022-06-22 14:59:00', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`,
                        `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `remark`)
VALUES (999, 1, 'test', 'test1', '00', 'test@163.com', '13211112222', '0', '',
        '$2a$10$E3oV9rc67TMNJ2m/51V2POXvyFsa7.OlR.VHWcGOVbXKBNWVav.a2', '0', '2', '', NULL, 'admin',
        '2022-04-10 20:28:25', 'admin', '2022-06-22 14:59:00', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`,
                        `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1000, NULL, 'xuzhigang', 'xuzhigang', '00', '', '', '0', '',
        '$2a$10$wCBrOLXCDE5LvlSvr6TRxOHAzmxza4mqnin7KHzADstLnYbbzLx3O', '0', '2', '', NULL, 'thinglinks',
        '2022-06-22 10:57:08', '', '2022-06-22 14:59:00', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`,
                        `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1001, 100, 'ning', 'ning', '00', '', '18812345678', '0', '',
        '$2a$10$dGINI9TO7n8ILNmdalC47uuYP4WX0Sbw7kZ9hpgXFxpaOPAJ6Mdrq', '0', '2', '', NULL, 'admin',
        '2022-06-22 14:52:22', '', '2022-06-22 14:59:00', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`,
                        `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1002, 100, '18222601949', '高欣', '00', '', '18222601949', '0', '',
        '$2a$10$kpN2EiCSQwmCluQ925ZsIOiCoafEMsf2JxlYEw2EEXU182ncb/GtG', '0', '0', '', NULL, 'admin',
        '2022-10-14 00:18:18', '', '2022-06-22 14:59:00', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`,
                        `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1003, NULL, '22222', 'cccpp', '00', '', '', '0', '',
        '$2a$10$iH8AVn7gpYRkqJYOBzOzt.cvp3m5Gta.26HwdOgud1q4CPB2LNbC6', '0', '0', '', NULL, 'admin',
        '2022-10-14 00:25:40', '', '2022-06-22 14:59:00', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`
(
    `user_id` bigint(20) NOT NULL COMMENT '用户ID',
    `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`)
VALUES (1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`)
VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint(20) NOT NULL COMMENT '用户ID',
    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for td_createStable_record
-- ----------------------------
DROP TABLE IF EXISTS `td_createStable_record`;
CREATE TABLE `td_createStable_record`
(
    `id`             bigint(19)   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `table_name`     varchar(255) NOT NULL COMMENT '表名',
    `sql_message`    longtext COMMENT 'SQL报文',
    `execute_status` varchar(10)  NOT NULL COMMENT '执行状态(成功 || 失败)',
    `execute_result` varchar(10)  NOT NULL COMMENT '执行结果详情',
    `create_by`      varchar(64)           DEFAULT 'ununited' COMMENT '创建者',
    `create_time`    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`      varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`         varchar(500)          DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`),
    KEY `table_name` (`table_name`) USING HASH COMMENT '超级表名'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='TDengine创建超级表记录';

-- ----------------------------
-- Records of td_createStable_record
-- ----------------------------


-- ----------------------------
-- Table structure for ota_upgrades
-- ----------------------------

DROP TABLE IF EXISTS `ota_upgrades`;
CREATE TABLE `ota_upgrades`
(
    `id`                     bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `app_id`                 varchar(64)  NOT NULL DEFAULT '' COMMENT '应用ID',
    `package_name`           varchar(100) NOT NULL DEFAULT '' COMMENT '包名称',
    `package_type`           smallint(1)  NOT NULL DEFAULT '0' COMMENT '升级包类型(0:软件包、1:固件包)',
    `product_identification` varchar(100) NOT NULL DEFAULT '' COMMENT '产品标识',
    `version`                varchar(255) NOT NULL DEFAULT '' COMMENT '升级包版本号',
    `file_location`          varchar(255) NOT NULL DEFAULT '' COMMENT '升级包的位置',
    `status`                 smallint(1)  NOT NULL DEFAULT '0' COMMENT '状态',
    `description`            varchar(255)          DEFAULT '' COMMENT '升级包功能描述',
    `custom_info`            longtext COMMENT '自定义信息',
    `remark`                 varchar(255)          DEFAULT '' COMMENT '描述',
    `created_by`             bigint(20)            DEFAULT NULL COMMENT '创建人',
    `created_time`           datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`             bigint(20)            DEFAULT NULL COMMENT '更新人',
    `updated_time`           datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_app_id` (`app_id`) USING BTREE COMMENT '应用ID',
    KEY `idx_product_identification` (`product_identification`) USING BTREE COMMENT '产品标识',
    KEY `idx_version` (`version`) USING BTREE COMMENT '升级包版本号'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='OTA升级包';

-- ----------------------------
-- Records of ota_upgrades
-- ----------------------------

-- ----------------------------
-- Table structure for ota_upgrade_tasks
-- ----------------------------

-- thinglinks_test.ota_upgrade_tasks definition

DROP TABLE IF EXISTS `ota_upgrade_tasks`;
CREATE TABLE `ota_upgrade_tasks`
(
    `id`             bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `upgrade_id`     bigint(20)   NOT NULL COMMENT '升级包ID，关联ota_upgrades表',
    `task_name`      varchar(100) NOT NULL DEFAULT '' COMMENT '任务名称',
    `task_status`    smallint(1)  NOT NULL DEFAULT '0' COMMENT '任务状态(0:待发布、1:进行中、2:已完成、3:已取消)',
    `scheduled_time` datetime              DEFAULT NULL COMMENT '计划执行时间',
    `description`    varchar(255)          DEFAULT '' COMMENT '任务描述',
    `remark`         varchar(255)          DEFAULT '' COMMENT '描述',
    `created_by`     bigint(20)            DEFAULT NULL COMMENT '创建人',
    `created_time`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`     bigint(20)            DEFAULT NULL COMMENT '更新人',
    `updated_time`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_upgrade_id` (`upgrade_id`) USING BTREE COMMENT '升级包ID'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='OTA升级任务表';

-- ----------------------------
-- Records of ota_upgrade_tasks
-- ----------------------------


-- ----------------------------
-- Table structure for ota_upgrade_records
-- ----------------------------

DROP TABLE IF EXISTS `ota_upgrade_records`;
CREATE TABLE `ota_upgrade_records`
(
    `id`                    bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `task_id`               bigint(20)   NOT NULL COMMENT '任务ID，关联ota_upgrade_tasks表',
    `device_identification` varchar(100) NOT NULL DEFAULT '' COMMENT '设备标识',
    `upgrade_status`        smallint(1)  NOT NULL DEFAULT '0' COMMENT '升级状态(0:待升级、1:升级中、2:升级成功、3:升级失败)',
    `progress`              smallint(3)  NOT NULL DEFAULT '0' COMMENT '升级进度（百分比）',
    `error_code`            varchar(100)          DEFAULT NULL COMMENT '错误代码',
    `error_message`         varchar(255)          DEFAULT NULL COMMENT '错误信息',
    `start_time`            datetime              DEFAULT NULL COMMENT '升级开始时间',
    `end_time`              datetime              DEFAULT NULL COMMENT '升级结束时间',
    `success_details`       longtext COMMENT '升级成功详细信息',
    `failure_details`       longtext COMMENT '升级失败详细信息',
    `log_details`           longtext COMMENT '升级过程日志',
    `remark`                varchar(255)          DEFAULT '' COMMENT '描述',
    `created_time`          datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    `created_by`            bigint(20)            DEFAULT NULL COMMENT '创建人',
    `updated_by`            bigint(20)            DEFAULT NULL COMMENT '更新人',
    `updated_time`          datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_task_id_device_identification` (`task_id`, `device_identification`) USING BTREE,
    KEY `idx_task_id` (`task_id`),
    KEY `idx_device_identification` (`device_identification`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='OTA升级记录表';


-- ----------------------------
-- Records of ota_upgrade_records
-- ----------------------------


BEGIN;
COMMIT;

SET
    FOREIGN_KEY_CHECKS = 1;



-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`
(
    `sched_name`    varchar(120) NOT NULL COMMENT '调度名称',
    `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='暂停的触发器表';

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`
(
    `sched_name`        varchar(120) NOT NULL COMMENT '调度名称',
    `instance_name`     varchar(200) NOT NULL COMMENT '实例名称',
    `last_checkin_time` bigint(13)   NOT NULL COMMENT '上次检查时间',
    `checkin_interval`  bigint(13)   NOT NULL COMMENT '检查间隔时间',
    PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='调度器状态表';

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`)
VALUES ('mqttsScheduler', 'localhost1644995400242', 1668776993496, 15000);
COMMIT;


-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`
(
    `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
    `lock_name`  varchar(40)  NOT NULL COMMENT '悲观锁名称',
    PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='存储的悲观锁信息表';

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` (`sched_name`, `lock_name`)
VALUES ('mqttsScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` (`sched_name`, `lock_name`)
VALUES ('mqttsScheduler', 'TRIGGER_ACCESS');
COMMIT;



-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`
(
    `sched_name`    varchar(120) NOT NULL COMMENT '调度名称',
    `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
    `calendar`      blob         NOT NULL COMMENT '存放持久化calendar对象',
    PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='日历信息表';

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;


-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`
(
    `sched_name`        varchar(120) NOT NULL COMMENT '调度名称',
    `entry_id`          varchar(95)  NOT NULL COMMENT '调度器实例id',
    `trigger_name`      varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`     varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `instance_name`     varchar(200) NOT NULL COMMENT '调度器实例名',
    `fired_time`        bigint(13)   NOT NULL COMMENT '触发的时间',
    `sched_time`        bigint(13)   NOT NULL COMMENT '定时器制定的时间',
    `priority`          int(11)      NOT NULL COMMENT '优先级',
    `state`             varchar(16)  NOT NULL COMMENT '状态',
    `job_name`          varchar(200) DEFAULT NULL COMMENT '任务名称',
    `job_group`         varchar(200) DEFAULT NULL COMMENT '任务组名',
    `is_nonconcurrent`  varchar(1)   DEFAULT NULL COMMENT '是否并发',
    `requests_recovery` varchar(1)   DEFAULT NULL COMMENT '是否接受恢复执行',
    PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='已触发的触发器表';

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;


-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`
(
    `sched_name`        varchar(120) NOT NULL COMMENT '调度名称',
    `job_name`          varchar(200) NOT NULL COMMENT '任务名称',
    `job_group`         varchar(200) NOT NULL COMMENT '任务组名',
    `description`       varchar(250) DEFAULT NULL COMMENT '相关介绍',
    `job_class_name`    varchar(250) NOT NULL COMMENT '执行任务类名称',
    `is_durable`        varchar(1)   NOT NULL COMMENT '是否持久化',
    `is_nonconcurrent`  varchar(1)   NOT NULL COMMENT '是否并发',
    `is_update_data`    varchar(1)   NOT NULL COMMENT '是否更新数据',
    `requests_recovery` varchar(1)   NOT NULL COMMENT '是否接受恢复执行',
    `job_data`          blob COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='任务详细信息表';


-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017BF357AE9878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME10', 'RULE_TRIGGER', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzJobExecution', '0', '0', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001841DC533F078707400007070707400013074000F302F3220302F32202A202A202A203F74003472756C65436F6E646974696F6E735461736B2E70617273696E6752756C65436F6E646974696F6E73282772756C652D303031272974000C52554C455F545249474745527372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000A740006E59388E5938874000131740001307800);
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017BF357AE9878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017BF357AE9878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME4', 'PROTOCOL', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000181EC3D4BA8787074000070707074000131740010302F35203020302F3233202A202A203F74002F6C696E6B50726F746F636F6C5461736B2E70726F746F636F6C5363726970744361636865526566726573685461736B74000850524F544F434F4C7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000004740024E58D8FE8AEAEE8849AE69CACE7BC93E5AD98E588B7E696B0E5AE9AE697B6E4BBBBE58AA174000132740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME5', 'RULE_TRIGGER', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzJobExecution', '0', '0', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001821553AAC878707400007070707400013074000D302F32202A202A202A202A203F74002E72756C65436F6E646974696F6E735461736B2E70617273696E6752756C65436F6E646974696F6E7331282731272974000C52554C455F545249474745527372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000005740006E6B58BE8AF9574000131740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME6', 'RULE_TRIGGER', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018215559AE078707400007070707400013174000D302F32202A202A202A202A203F74002E72756C65436F6E646974696F6E735461736B2E70617273696E6752756C65436F6E646974696F6E7332282732272974000C52554C455F545249474745527372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000006740007E6B58BE8AF953274000131740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME7', 'LINK_DEVICE', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018248AD1D2878707400007070707400013174000E30203020302F3132202A202A203F7400316C696E6B446576696365496E666F5461736B2E72656672657368446576696365496E666F446174614D6F64656C2827272974000B4C494E4B5F4445564943457372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000774001BE588B7E696B0E5AD90E8AEBEE5A487E695B0E68DAEE6A8A1E59E8B74000131740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME8', 'RULE_TRIGGER', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzJobExecution', '0', '0', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000182D39EA5F078707400007070707400013074000D302F32202A202A202A202A203F74002E72756C65436F6E646974696F6E735461736B2E70617273696E6752756C65436F6E646974696F6E7333282733272974000C52554C455F545249474745527372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000008740007E6B58BE8AF953374000131740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`,
                                `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME9', 'RULE_TRIGGER', NULL,
        'com.mqttsnet.thinglinks.job.util.QuartzJobExecution', '0', '0', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E6D717474736E65742E7468696E676C696E6B732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720039636F6D2E6D717474736E65742E7468696E676C696E6B732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000182D39EA9D878707400007070707400013074000D302F32202A202A202A202A203F74001472795461736B2E7279506172616D73282734272974000C52554C455F545249474745527372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000009740007E6B58BE8AF953474000131740001317800);
COMMIT;



-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`
(
    `sched_name`     varchar(120) NOT NULL COMMENT '调度名称',
    `trigger_name`   varchar(200) NOT NULL COMMENT '触发器的名字',
    `trigger_group`  varchar(200) NOT NULL COMMENT '触发器所属组的名字',
    `job_name`       varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
    `job_group`      varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
    `description`    varchar(250) DEFAULT NULL COMMENT '相关介绍',
    `next_fire_time` bigint(13)   DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
    `prev_fire_time` bigint(13)   DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
    `priority`       int(11)      DEFAULT NULL COMMENT '优先级',
    `trigger_state`  varchar(16)  NOT NULL COMMENT '触发器状态',
    `trigger_type`   varchar(8)   NOT NULL COMMENT '触发器的类型',
    `start_time`     bigint(13)   NOT NULL COMMENT '开始时间',
    `end_time`       bigint(13)   DEFAULT NULL COMMENT '结束时间',
    `calendar_name`  varchar(200) DEFAULT NULL COMMENT '日程表名称',
    `misfire_instr`  smallint(2)  DEFAULT NULL COMMENT '补偿执行的策略',
    `job_data`       blob COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    KEY `sched_name` (`sched_name`, `job_name`, `job_group`) USING BTREE,
    CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='触发器详细信息表';

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1667985670000, -1, 5,
        'PAUSED', 'CRON', 1667985661000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME10', 'RULE_TRIGGER', 'TASK_CLASS_NAME10', 'RULE_TRIGGER', NULL, 1667985720000,
        -1, 5, 'ERROR', 'CRON', 1667985665000, 0, NULL, -1, '');
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1667985675000, -1, 5,
        'PAUSED', 'CRON', 1667985661000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1667985680000, -1, 5,
        'PAUSED', 'CRON', 1667985662000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME4', 'PROTOCOL', 'TASK_CLASS_NAME4', 'PROTOCOL', NULL, 1668006000000, -1, 5,
        'PAUSED', 'CRON', 1667985662000, 0, NULL, 1, '');
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME5', 'RULE_TRIGGER', 'TASK_CLASS_NAME5', 'RULE_TRIGGER', NULL, 1667985664000,
        -1, 5, 'PAUSED', 'CRON', 1667985663000, 0, NULL, -1, '');
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME6', 'RULE_TRIGGER', 'TASK_CLASS_NAME6', 'RULE_TRIGGER', NULL, 1667985664000,
        -1, 5, 'PAUSED', 'CRON', 1667985663000, 0, NULL, -1, '');
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME7', 'LINK_DEVICE', 'TASK_CLASS_NAME7', 'LINK_DEVICE', NULL, 1668009600000, -1,
        5, 'PAUSED', 'CRON', 1667985663000, 0, NULL, -1, '');
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME8', 'RULE_TRIGGER', 'TASK_CLASS_NAME8', 'RULE_TRIGGER', NULL, 1667985664000,
        -1, 5, 'PAUSED', 'CRON', 1667985664000, 0, NULL, -1, '');
INSERT INTO `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`,
                             `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`,
                             `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME9', 'RULE_TRIGGER', 'TASK_CLASS_NAME9', 'RULE_TRIGGER', NULL, 1667985664000,
        -1, 5, 'PAUSED', 'CRON', 1667985664000, 0, NULL, -1, '');
COMMIT;



-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`
(
    `sched_name`    varchar(120) NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `blob_data`     blob COMMENT '存放持久化Trigger对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='Blob类型的触发器表';

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;



-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`
(
    `sched_name`      varchar(120) NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
    `time_zone_id`    varchar(80) DEFAULT NULL COMMENT '时区',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='Cron类型的触发器表';

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME10', 'RULE_TRIGGER', '0/2 0/2 * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME4', 'PROTOCOL', '0/5 0 0/23 * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME5', 'RULE_TRIGGER', '0/2 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME6', 'RULE_TRIGGER', '0/2 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME7', 'LINK_DEVICE', '0 0 0/12 * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME8', 'RULE_TRIGGER', '0/2 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`)
VALUES ('mqttsScheduler', 'TASK_CLASS_NAME9', 'RULE_TRIGGER', '0/2 * * * * ?', 'Asia/Shanghai');
COMMIT;



-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`
(
    `sched_name`      varchar(120) NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `repeat_count`    bigint(7)    NOT NULL COMMENT '重复的次数统计',
    `repeat_interval` bigint(12)   NOT NULL COMMENT '重复的间隔时间',
    `times_triggered` bigint(10)   NOT NULL COMMENT '已经触发的次数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='简单触发器的信息表';

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;



-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`
(
    `sched_name`    varchar(120) NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `str_prop_1`    varchar(512)   DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
    `str_prop_2`    varchar(512)   DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
    `str_prop_3`    varchar(512)   DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
    `int_prop_1`    int(11)        DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
    `int_prop_2`    int(11)        DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
    `long_prop_1`   bigint(20)     DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
    `long_prop_2`   bigint(20)     DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
    `dec_prop_1`    decimal(13, 4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
    `dec_prop_2`    decimal(13, 4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
    `bool_prop_1`   varchar(1)     DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
    `bool_prop_2`   varchar(1)     DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='同步机制的行锁表';

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;



