/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50173
Source Host           : 127.0.0.1:3306
Source Database       : csbackend

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2014-09-19 18:32:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cs_area
-- ----------------------------
DROP TABLE IF EXISTS `cs_area`;
CREATE TABLE `cs_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '区id',
  `areaName` varchar(255) DEFAULT NULL COMMENT '区名',
  `describle` varchar(255) DEFAULT NULL COMMENT '区描述',
  `isDeleted` int(2) DEFAULT NULL COMMENT '是否删除，0表示未删除状态，1表示删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_area
-- ----------------------------
INSERT INTO `cs_area` VALUES ('13', 'ywy', '游外游', '0');
INSERT INTO `cs_area` VALUES ('14', 'dianxin', '电信', '0');

-- ----------------------------
-- Table structure for cs_gamelogdb
-- ----------------------------
DROP TABLE IF EXISTS `cs_gamelogdb`;
CREATE TABLE `cs_gamelogdb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platformId` int(11) DEFAULT NULL COMMENT '平台id',
  `serverId` int(11) DEFAULT NULL COMMENT '区服id',
  `serverName` varchar(255) DEFAULT NULL,
  `platformName` varchar(255) DEFAULT NULL,
  `dbip` varchar(100) DEFAULT NULL,
  `dbport` int(11) DEFAULT NULL,
  `dbName` varchar(255) DEFAULT NULL,
  `dbUsername` varchar(255) DEFAULT NULL,
  `dbPassword` varchar(255) DEFAULT NULL,
  `createTime` bigint(50) DEFAULT NULL,
  `isDeleted` int(2) DEFAULT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  CONSTRAINT `cs_gamelogdb_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `cs_server` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_gamelogdb
-- ----------------------------

-- ----------------------------
-- Table structure for cs_menu
-- ----------------------------
DROP TABLE IF EXISTS `cs_menu`;
CREATE TABLE `cs_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(255) DEFAULT NULL COMMENT '菜单名',
  `menuUrl` varchar(255) DEFAULT NULL COMMENT '路径',
  `describle` varchar(255) DEFAULT NULL COMMENT '菜单描述',
  `isDeleted` int(2) DEFAULT NULL COMMENT '是否删除',
  `type` int(2) DEFAULT NULL COMMENT '菜单等级',
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_menu
-- ----------------------------
INSERT INTO `cs_menu` VALUES ('1', '后台权限管理', null, '后台权限管理', '0', '21', '../static/ztree/css/zTreeStyle/img/diy/1_open.png');
INSERT INTO `cs_menu` VALUES ('2', '用户管理', null, '用户管理', '0', '1', '../static/ztree/css/zTreeStyle/img/diy/user.png');
INSERT INTO `cs_menu` VALUES ('3', '添加用户', '../admin/addUserShowPage.action', '添加用户', '0', '2', '../static/ztree/css/zTreeStyle/img/diy/user_add.png');
INSERT INTO `cs_menu` VALUES ('4', '查看用户', '../admin/showUserList.action', '查看用户', '0', '2', '../static/ztree/css/zTreeStyle/img/diy/user_edit.png');
INSERT INTO `cs_menu` VALUES ('5', '目录管理', null, '目录管理', '0', '1', '../static/ztree/css/zTreeStyle/img/diy/folder.png');
INSERT INTO `cs_menu` VALUES ('6', '添加目录', '../menu/addMenu.action', '添加目录', '0', '5', '../static/ztree/css/zTreeStyle/img/diy/folder_add.png');
INSERT INTO `cs_menu` VALUES ('7', '查看目录', '../menu/showMenuList.action', '查看目录', '0', '5', '../static/ztree/css/zTreeStyle/img/diy/folder_magnify.png');
INSERT INTO `cs_menu` VALUES ('8', '角色管理', null, '角色管理', '0', '1', '../static/ztree/css/zTreeStyle/img/diy/group.png');
INSERT INTO `cs_menu` VALUES ('9', '添加角色', '../role/addRoleShowPage.action', '添加角色', '0', '8', '../static/ztree/css/zTreeStyle/img/diy/group_add.png');
INSERT INTO `cs_menu` VALUES ('10', '查看角色', '../role/showRoleList.action', '查看角色', '0', '8', '../static/ztree/css/zTreeStyle/img/diy/group_edit.png');
INSERT INTO `cs_menu` VALUES ('12', '角色-目录', '../role/right/menuRoleShowPage.action', '角色-目录', '0', '8', '../static/ztree/css/zTreeStyle/img/diy/folder_user.png');
INSERT INTO `cs_menu` VALUES ('13', '角色-用户', '../role/user/userRoleShowPage.action', '角色-用户', '0', '8', '../static/ztree/css/zTreeStyle/img/diy/user_go.png');
INSERT INTO `cs_menu` VALUES ('14', '平台管理', null, '平台管理', '0', '1', '../static/ztree/css/zTreeStyle/img/diy/application.png');
INSERT INTO `cs_menu` VALUES ('15', '添加平台', '../platform/addPlatformShowPage.action', '添加平台', '0', '14', '../static/ztree/css/zTreeStyle/img/diy/application_add.png');
INSERT INTO `cs_menu` VALUES ('16', '查看平台', '../platform/showPlatformList.action', '查看平台', '0', '14', '../static/ztree/css/zTreeStyle/img/diy/application_edit.png');
INSERT INTO `cs_menu` VALUES ('17', '平台-服务器', '../platform/server/serverPlatformShowPage.action', '平台-服务器', '0', '14', null);
INSERT INTO `cs_menu` VALUES ('18', '服务器管理', null, '服务器管理', '0', '1', '../static/ztree/css/zTreeStyle/img/diy/computer.png');
INSERT INTO `cs_menu` VALUES ('19', '添加服务器', '../server/addServerShowPage.action', '添加服务器', '0', '18', '../static/ztree/css/zTreeStyle/img/diy/computer_add.png');
INSERT INTO `cs_menu` VALUES ('20', '查看服务器', '../server/showServerList.action', '查看服务器', '0', '18', '../static/ztree/css/zTreeStyle/img/diy/computer_edit.png');
INSERT INTO `cs_menu` VALUES ('21', '管理', null, '管理', '0', '0', '../static/ztree/css/zTreeStyle/img/diy/world.png');
INSERT INTO `cs_menu` VALUES ('22', '运营管理', null, '运营管理', '0', '21', '../static/ztree/css/zTreeStyle/img/diy/chart_organisation.png');
INSERT INTO `cs_menu` VALUES ('23', '运维管理', null, '运维管理', '0', '21', '../static/ztree/css/zTreeStyle/img/diy/bullet_wrench.png');
INSERT INTO `cs_menu` VALUES ('24', '日志管理', null, '日志管理', '0', '21', '../static/ztree/css/zTreeStyle/img/diy/disk.png');
INSERT INTO `cs_menu` VALUES ('25', '玩家管理', null, '玩家数据', '0', '21', '../static/ztree/css/zTreeStyle/img/diy/database.png');
INSERT INTO `cs_menu` VALUES ('30', '开启/关闭服务器', null, '开启/关闭服务器', '0', '23', '../static/ztree/css/zTreeStyle/img/diy/server_edit.png');
INSERT INTO `cs_menu` VALUES ('31', 'GM命令', null, 'GM命令', '0', '23', '../static/ztree/css/zTreeStyle/img/diy/application_osx_terminal.png');
INSERT INTO `cs_menu` VALUES ('35', '充值管理', '', '充值管理', '0', '24', '../static/ztree/css/zTreeStyle/img/diy/money_add.png');
INSERT INTO `cs_menu` VALUES ('36', '消耗管理', '', '消耗管理', '0', '24', '../static/ztree/css/zTreeStyle/img/diy/money_delete.png');
INSERT INTO `cs_menu` VALUES ('37', '活动管理', '', '活动管理', '0', '24', '../static/ztree/css/zTreeStyle/img/diy/feed.png');
INSERT INTO `cs_menu` VALUES ('38', '登录管理', '', '登录管理', '0', '24', '../static/ztree/css/zTreeStyle/img/diy/arrow_left.png');
INSERT INTO `cs_menu` VALUES ('39', '登出管理', '', '登出管理', '0', '24', '../static/ztree/css/zTreeStyle/img/diy/arrow_right.png');
INSERT INTO `cs_menu` VALUES ('40', '玩家数据', '', '玩家数据', '0', '25', '../static/ztree/css/zTreeStyle/img/diy/server_database.png');
INSERT INTO `cs_menu` VALUES ('41', '角色详细数据', '', '角色详细数据', '0', '40', '../static/ztree/css/zTreeStyle/img/diy/application_view_detail.png');
INSERT INTO `cs_menu` VALUES ('42', '玩家信息', '', '玩家信息', '0', '40', '../static/ztree/css/zTreeStyle/img/diy/page_white_star.png');
INSERT INTO `cs_menu` VALUES ('43', '公告管理', '', '公告管理', '0', '22', '../static/ztree/css/zTreeStyle/img/diy/49.ico');
INSERT INTO `cs_menu` VALUES ('44', '封禁管理', '', '封禁管理', '0', '22', '../static/ztree/css/zTreeStyle/img/diy/58.ico');
INSERT INTO `cs_menu` VALUES ('45', '对账', '', '对账', '0', '35', '../static/ztree/css/zTreeStyle/img/diy/money_yen.png');
INSERT INTO `cs_menu` VALUES ('46', 'ip禁言', '', 'ip禁言', '0', '44', '../static/ztree/css/zTreeStyle/img/diy/stop.png');
INSERT INTO `cs_menu` VALUES ('47', '玩家禁言', '', '玩家禁言', '0', '44', '../static/ztree/css/zTreeStyle/img/diy/control_stop_blue.png');
INSERT INTO `cs_menu` VALUES ('48', '角色禁言', '', '角色禁言', '0', '44', '../static/ztree/css/zTreeStyle/img/diy/control_stop.png');
INSERT INTO `cs_menu` VALUES ('49', '封号/解封', '', '封号/解封', '0', '44', '../static/ztree/css/zTreeStyle/img/diy/lock_open.png');
INSERT INTO `cs_menu` VALUES ('50', '踢人', '', '踢人', '0', '44', '../static/ztree/css/zTreeStyle/img/diy/bin_closed.png');
INSERT INTO `cs_menu` VALUES ('51', '封禁日志', '', '禁言日志', '0', '44', '../static/ztree/css/zTreeStyle/img/diy/database_error.png');
INSERT INTO `cs_menu` VALUES ('52', '循环公告', '', '循环公告', '0', '43', '../static/ztree/css/zTreeStyle/img/diy/arrow_rotate_anticlockwise.png');
INSERT INTO `cs_menu` VALUES ('53', '即时公告', '', '即时公告', '0', '43', '../static/ztree/css/zTreeStyle/img/diy/arrow_out.png');
INSERT INTO `cs_menu` VALUES ('54', '公告添加', '', '公告添加', '0', '43', '../static/ztree/css/zTreeStyle/img/diy/webcam_add.png');
INSERT INTO `cs_menu` VALUES ('55', '公告查询', '', '公告查询', '0', '43', '../static/ztree/css/zTreeStyle/img/diy/arrow_refresh.png');
INSERT INTO `cs_menu` VALUES ('56', '全平台充值统计', '', '全平台充值统计', '0', '35', '../static/ztree/css/zTreeStyle/img/diy/coins.png');
INSERT INTO `cs_menu` VALUES ('57', '玩家操作', '', '玩家操作', '0', '25', '../static/ztree/css/zTreeStyle/img/diy/shape_handles.png');
INSERT INTO `cs_menu` VALUES ('58', '设置等级', '', '设置等级', '0', '57', '../static/ztree/css/zTreeStyle/img/diy/award_star_bronze_3.png');
INSERT INTO `cs_menu` VALUES ('59', '添加物品', '', '添加物品', '0', '57', '../static/ztree/css/zTreeStyle/img/diy/book_add.png');
INSERT INTO `cs_menu` VALUES ('60', '货币管理', '', '货币管理', '0', '25', '../static/ztree/css/zTreeStyle/img/diy/money_dollar.png');
INSERT INTO `cs_menu` VALUES ('61', '发放元宝', '', '发放元宝', '0', '60', '../static/ztree/css/zTreeStyle/img/diy/medal_gold_add.png');
INSERT INTO `cs_menu` VALUES ('62', '发放金币', '', '发放金币', '0', '60', '../static/ztree/css/zTreeStyle/img/diy/coins_add.png');
INSERT INTO `cs_menu` VALUES ('63', '全平台消耗统计', '', '全平台消耗统计', '0', '36', '../static/ztree/css/zTreeStyle/img/diy/medal_gold_delete.png');
INSERT INTO `cs_menu` VALUES ('64', 'gm全局', '../gm/gmGlobal.action', 'gm全局', '0', '31', '../static/ztree/css/zTreeStyle/img/diy/medal_gold_delete.png');

-- ----------------------------
-- Table structure for cs_operatelog
-- ----------------------------
DROP TABLE IF EXISTS `cs_operatelog`;
CREATE TABLE `cs_operatelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `userId` int(11) DEFAULT NULL COMMENT '那个用户进行的操作',
  `userIp` varchar(100) DEFAULT NULL,
  `actionName` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `parameters` text,
  `result` int(2) DEFAULT NULL,
  `modifyTime` bigint(30) DEFAULT NULL COMMENT '操作时间',
  `isDeleted` int(2) DEFAULT NULL,
  `describle` varchar(255) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_operatelog
-- ----------------------------
INSERT INTO `cs_operatelog` VALUES ('35', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"17\"],\"roleId\":[\"1\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('36', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"17\"],\"roleId\":[\"1\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('37', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"17\"],\"roleId\":[\"1\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('38', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"17\"],\"roleId\":[\"1\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('39', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"16\"],\"roleId\":[\"1\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('40', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"16\"],\"roleId\":[\"1\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('41', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"17\"],\"roleId\":[\"1\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('42', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"5\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('43', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"5\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('44', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"6\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('45', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"7\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('46', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"7\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('47', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"6\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('48', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"5\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('49', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"5\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('50', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"8\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('51', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"9\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('52', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"6\"],\"roleId\":[\"2\"]}', '1', '1409068800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('53', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"运营管理\"],\"direction\":[\"21\"],\"menuName\":[\"运营管理\"],\"url\":[\"\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('54', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"运维管理\"],\"direction\":[\"21\"],\"menuName\":[\"运维管理\"],\"url\":[\"\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('55', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"日志管理\"],\"direction\":[\"21\"],\"menuName\":[\"日志管理\"],\"url\":[\"\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('56', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"22\"],\"roleId\":[\"1\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('57', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"23\"],\"roleId\":[\"1\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('58', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"24\"],\"roleId\":[\"1\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('59', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"25\"],\"roleId\":[\"1\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('60', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"25\"],\"roleId\":[\"1\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('61', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"25\"],\"roleId\":[\"1\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('62', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"25\"],\"roleId\":[\"1\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('63', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"25\"],\"roleId\":[\"1\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('64', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"充值与消耗\"],\"direction\":[\"21\"],\"menuName\":[\"充值与消耗\"],\"url\":[\"\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('65', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"26\"],\"roleId\":[\"1\"]}', '1', '1409500800000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('66', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"menuName\":[\"aaa\"],\"url\":[\"\"]}', '1', '1409587200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('67', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userByIdLogicDelete', '{\"userId\":[\"2\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('68', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"user1.png\"],\"menuName\":[\"aaa\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('69', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"user1.png\"],\"menuName\":[\"aaaa\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('70', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"27\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('71', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"26\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('72', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"25\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('73', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"24\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('74', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"23\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('75', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"22\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('76', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"user1.png\"],\"menuName\":[\"fdds\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('77', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"fdf\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('78', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"30\"],\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"user.png\"],\"menuName\":[\"fdf\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('79', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"30\"],\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"user1.png\"],\"menuName\":[\"fdf\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('80', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"25\"],\"describle\":[\"玩家数据\"],\"direction\":[\"21\"],\"fileFileName\":[\"../static/ztree/css/zTreeStyle/img/diy/database.png\"],\"menuName\":[\"玩家数据\"],\"url\":[\"java.lang.Object@737c5a39\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('81', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"25\"],\"describle\":[\"玩家数据\"],\"direction\":[\"21\"],\"fileFileName\":[\"database.png\"],\"menuName\":[\"玩家数据\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('82', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"fsdfgfg\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('83', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"user10123.png\"],\"menuName\":[\"hngjhg\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('84', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"user101234.png\"],\"menuName\":[\"gfdgfd\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('85', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"gfdfgf\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('86', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"26\"],\"describle\":[\"充值与消耗\"],\"direction\":[\"21\"],\"fileFileName\":[\"java.lang.Object@4be6ba42\"],\"menuName\":[\"充值与消耗\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('87', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"26\"],\"describle\":[\"充值与消耗\"],\"direction\":[\"21\"],\"fileFileName\":[\"java.lang.Object@3f74fb1c\"],\"menuName\":[\"充值与消耗\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('88', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"26\"],\"describle\":[\"充值与消耗\"],\"direction\":[\"21\"],\"fileFileName\":[\"\"],\"menuName\":[\"充值与消耗\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('89', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"25\"],\"describle\":[\"玩家数据\"],\"direction\":[\"21\"],\"fileFileName\":[\"database.png\"],\"menuName\":[\"玩家数据\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('90', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"24\"],\"describle\":[\"日志管理\"],\"direction\":[\"21\"],\"fileFileName\":[\"\"],\"menuName\":[\"日志管理\"],\"url\":[\"\"]}', '1', '1409673600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('91', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"aaa\"],\"url\":[\"\"]}', '1', '1409846400000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('92', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"aaaa\"],\"url\":[\"\"]}', '1', '1409846400000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('93', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"../static/ztree/css/zTreeStyle/img/diy/see.png\"],\"menuName\":[\"aaa\"],\"url\":[\"\"]}', '1', '1409846400000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('94', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"../static/ztree/css/zTreeStyle/img/diy/1_open.png\"],\"menuName\":[\"aaaaaa\"],\"url\":[\"\"]}', '1', '1409846400000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('95', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"29\"],\"describle\":[\"\"],\"direction\":[\"1\"],\"fileFileName\":[\"../static/ztree/css/zTreeStyle/img/diy/1_close.png\"],\"menuName\":[\"aaaaaa\"],\"url\":[\"\"]}', '1', '1409846400000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('96', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuIconAdd', '{\"fileFileName\":[\"../static/ztree/css/zTreeStyle/img/diy/7.png\"]}', '1', '1409846400000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('97', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuIconAdd', '{\"fileFileName\":[\"../static/ztree/css/zTreeStyle/img/diy/7.png\"],\"menuName\":[\"aaaaaa\"]}', '1', '1409846400000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('98', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"1\"],\"thePlatformId\":[\"1\"],\"userName\":[\"aaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('99', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"1\"],\"thePlatformId\":[\"1\"],\"userName\":[\"aaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('100', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"1\"],\"thePlatformId\":[\"1\"],\"userName\":[\"aaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('101', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"1\"],\"thePlatformId\":[\"1\"],\"userName\":[\"aaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('102', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"1\"],\"thePlatformId\":[\"1\"],\"userName\":[\"aaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('103', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"1\"],\"thePlatformId\":[\"1\"],\"userName\":[\"aaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('104', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"1\"],\"thePlatformId\":[\"1\"],\"userName\":[\"aaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('105', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"1\"],\"thePlatformId\":[\"1\"],\"userName\":[\"aaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('106', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"1\"],\"thePlatformId\":[\"1\"],\"userName\":[\"aaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('107', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuIconAdd', '{\"fileFileName\":[\"../static/ztree/css/zTreeStyle/img/diy/user_green.png\"],\"menuName\":[\"aaaa\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('108', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"29\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('109', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"28\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('110', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"27\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('111', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuByIdLogicDelete', '{\"Id\":[\"26\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('112', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"开启/关闭服务器\"],\"direction\":[\"23\"],\"fileFileName\":[\"\"],\"menuName\":[\"开启/关闭服务器\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('113', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"GM命令\"],\"direction\":[\"23\"],\"fileFileName\":[\"\"],\"menuName\":[\"GM命令\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('114', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"30\"],\"describle\":[\"开启/关闭服务器\"],\"direction\":[\"31\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"开启/关闭服务器\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('115', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"30\"],\"describle\":[\"开启/关闭服务器\"],\"direction\":[\"23\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"开启/关闭服务器\"],\"url\":[\"java.lang.Object@a1bce64\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('116', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"test\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"test\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('117', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"test\"],\"direction\":[\"31\"],\"fileFileName\":[\"\"],\"menuName\":[\"test\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('118', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"test\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"test\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('119', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"充值管理\"],\"direction\":[\"24\"],\"fileFileName\":[\"\"],\"menuName\":[\"充值管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('120', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"消耗管理\"],\"direction\":[\"24\"],\"fileFileName\":[\"\"],\"menuName\":[\"消耗管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('121', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"活动管理\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"活动管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('122', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"37\"],\"describle\":[\"活动管理\"],\"direction\":[\"24\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"活动管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('123', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"登录管理\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"登录管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('124', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"登出管理\"],\"direction\":[\"24\"],\"fileFileName\":[\"\"],\"menuName\":[\"登出管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('125', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"38\"],\"describle\":[\"登录管理\"],\"direction\":[\"24\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"登录管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('126', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"25\"],\"describle\":[\"玩家数据\"],\"direction\":[\"21\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"玩家管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('127', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"玩家数据\"],\"direction\":[\"25\"],\"fileFileName\":[\"\"],\"menuName\":[\"玩家数据\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('128', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"角色详细数据\"],\"direction\":[\"40\"],\"fileFileName\":[\"\"],\"menuName\":[\"角色详细数据\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('129', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"玩家信息\"],\"direction\":[\"40\"],\"fileFileName\":[\"\"],\"menuName\":[\"玩家信息\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('130', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"公告管理\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"公告管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('131', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"43\"],\"describle\":[\"公告管理\"],\"direction\":[\"43\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"公告管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('132', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"43\"],\"describle\":[\"公告管理\"],\"direction\":[\"22\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"公告管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('133', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"封禁管理\"],\"direction\":[\"22\"],\"fileFileName\":[\"\"],\"menuName\":[\"封禁管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('134', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"对账\"],\"direction\":[\"35\"],\"fileFileName\":[\"\"],\"menuName\":[\"对账\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('135', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"ip禁言\"],\"direction\":[\"44\"],\"fileFileName\":[\"\"],\"menuName\":[\"ip禁言\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('136', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"玩家禁言\"],\"direction\":[\"44\"],\"fileFileName\":[\"\"],\"menuName\":[\"玩家禁言\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('137', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"角色禁言\"],\"direction\":[\"44\"],\"fileFileName\":[\"\"],\"menuName\":[\"角色禁言\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('138', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"封号/解封\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"封号/解封\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('139', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"49\"],\"describle\":[\"封号/解封\"],\"direction\":[\"44\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"封号/解封\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('140', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"踢人\"],\"direction\":[\"44\"],\"fileFileName\":[\"\"],\"menuName\":[\"踢人\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('141', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"禁言日志\"],\"direction\":[\"44\"],\"fileFileName\":[\"\"],\"menuName\":[\"封禁日志\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('142', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"循环公告\"],\"direction\":[\"43\"],\"fileFileName\":[\"\"],\"menuName\":[\"循环公告\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('143', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"即时公告\"],\"direction\":[\"43\"],\"fileFileName\":[\"\"],\"menuName\":[\"即时公告\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('144', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"公告添加\"],\"direction\":[\"43\"],\"fileFileName\":[\"\"],\"menuName\":[\"公告添加\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('145', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"公告查询\"],\"direction\":[\"43\"],\"fileFileName\":[\"\"],\"menuName\":[\"公告查询\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('146', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"全平台充值统计\"],\"direction\":[\"35\"],\"fileFileName\":[\"\"],\"menuName\":[\"全平台充值统计\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('147', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"玩家操作\"],\"direction\":[\"25\"],\"fileFileName\":[\"\"],\"menuName\":[\"玩家操作\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('148', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"修改等级\"],\"direction\":[\"57\"],\"fileFileName\":[\"\"],\"menuName\":[\"修改等级\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('149', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"添加物品\"],\"direction\":[\"57\"],\"fileFileName\":[\"\"],\"menuName\":[\"添加物品\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('150', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"58\"],\"describle\":[\"设置等级\"],\"direction\":[\"57\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"设置等级\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('151', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"货币管理\"],\"direction\":[\"25\"],\"fileFileName\":[\"\"],\"menuName\":[\"货币管理\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('152', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"发放元宝\"],\"direction\":[\"60\"],\"fileFileName\":[\"\"],\"menuName\":[\"发放元宝\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('153', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"发放金币\"],\"direction\":[\"1\"],\"fileFileName\":[\"\"],\"menuName\":[\"发放金币\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('154', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"62\"],\"describle\":[\"发放金币\"],\"direction\":[\"60\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"发放金币\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('155', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuAdd', '{\"describle\":[\"全平台消耗统计\"],\"direction\":[\"36\"],\"fileFileName\":[\"\"],\"menuName\":[\"全平台消耗统计\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('156', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuModify', '{\"Id\":[\"30\"],\"describle\":[\"开启/关闭服务器\"],\"direction\":[\"23\"],\"fileFileName\":[\"oneMenu.icon\"],\"menuName\":[\"开启/关闭服务器\"],\"url\":[\"\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('157', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.MenuAction', 'menuIconAdd', '{\"fileFileName\":[\"../static/ztree/css/zTreeStyle/img/diy/9.png\"],\"menuName\":[\"开启/关闭服务器\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('158', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"2\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('159', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"5\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('160', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"8\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('161', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"1\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('162', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"21\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('163', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"22\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('164', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"43\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('165', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"52\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('166', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"53\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('167', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"54\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('168', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"55\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('169', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"44\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('170', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"46\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('171', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"48\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('172', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"47\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('173', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"49\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('174', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"50\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('175', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"51\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('176', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"23\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('177', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"30\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('178', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"31\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('179', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"24\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('180', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"35\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('181', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"45\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('182', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"56\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('183', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"36\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('184', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"63\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('185', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"37\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('186', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"38\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('187', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"39\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('188', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"25\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('189', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"40\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('190', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"41\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('191', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"42\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('192', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"57\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('193', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"60\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('194', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"59\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('195', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"58\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('196', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"61\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('197', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"62\"],\"roleId\":[\"2\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('198', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userModify', '{\"platformId\":[\"1\"],\"roleId\":[\"1\"],\"userId\":[\"3\"],\"userName\":[\"hehe\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('199', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'passwordModify', '{\"confrimPwd\":[\"1234567\"],\"oldPassWord\":[\"123456\"],\"passWord\":[\"1234567\"],\"userId\":[\"3\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('200', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userByIdLogicDelete', '{\"userId\":[\"3\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('201', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.UserAction', 'userAdd', '{\"confrimPwd\":[\"123456\"],\"passWord\":[\"123456\"],\"roleId\":[\"2\"],\"thePlatformId\":[\"1\"],\"userName\":[\"test\"]}', '1', '1410192000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('202', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"22\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('203', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"22\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('204', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"1\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('205', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"1\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('206', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"2\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('207', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"35\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('208', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"3\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('209', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"4\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('210', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"1\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('211', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"1\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('212', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"1\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('213', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"2\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('214', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"1\"],\"roleId\":[\"2\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('215', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverAdd', '{\"dbPassword\":[\"192.168.1.31\"],\"dbUsername\":[\"192.168.1.31\"],\"gamedbName\":[\"192.168.1.31\"],\"gamedbip\":[\"192.168.1.31\"],\"gamedbport\":[\"3306\"],\"logdbName\":[\"192.168.1.31\"],\"logdbip\":[\"192.168.1.31\"],\"logdbport\":[\"9103\"],\"platformId\":[\"\"],\"serverId\":[\"2\"],\"serverIp\":[\"192.168.1.31\"],\"serverName\":[\"张强\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('216', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverAdd', '{\"dbPassword\":[\"192.168.1.31\"],\"dbUsername\":[\"192.168.1.31\"],\"gamedbName\":[\"192.168.1.31\"],\"gamedbip\":[\"192.168.1.31\"],\"gamedbport\":[\"3306\"],\"logdbName\":[\"192.168.1.31\"],\"logdbip\":[\"192.168.1.31\"],\"logdbport\":[\"9103\"],\"platformId\":[\"\"],\"serverId\":[\"2\"],\"serverIp\":[\"192.168.1.31\"],\"serverName\":[\"张强\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('217', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverAdd', '{\"areaId\":[\"\"],\"dbPassword\":[\"192.168.1.31\"],\"dbUsername\":[\"192.168.1.31\"],\"gamedbName\":[\"192.168.1.31\"],\"gamedbip\":[\"192.168.1.31\"],\"gamedbport\":[\"9103\"],\"logdbName\":[\"192.168.1.31\"],\"logdbip\":[\"192.168.1.31\"],\"logdbport\":[\"9103\"],\"serverId\":[\"2\"],\"serverIp\":[\"192.168.1.31\"],\"serverName\":[\"192.168.1.31\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('218', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverAdd', '{\"areaId\":[\"\"],\"dbPassword\":[\"192.168.1.31\"],\"dbUsername\":[\"192.168.1.31\"],\"gamedbName\":[\"192.168.1.31\"],\"gamedbip\":[\"192.168.1.31\"],\"gamedbport\":[\"3306\"],\"logdbName\":[\"192.168.1.31\"],\"logdbip\":[\"192.168.1.31\"],\"logdbport\":[\"3306\"],\"serverId\":[\"2\"],\"serverIp\":[\"192.168.1.31\"],\"serverName\":[\"192.168.1.31\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('219', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverAdd', '{\"areaId\":[\"\"],\"dbPassword\":[\"192.168.1.31\"],\"dbUsername\":[\"192.168.1.31\"],\"gamedbName\":[\"192.168.1.31\"],\"gamedbip\":[\"192.168.1.31\"],\"gamedbport\":[\"3306\"],\"logdbName\":[\"192.168.1.31\"],\"logdbip\":[\"192.168.1.31\"],\"logdbport\":[\"3306\"],\"serverId\":[\"2\"],\"serverIp\":[\"192.168.1.31\"],\"serverName\":[\"192.168.1.31\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('220', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverAdd', '{\"areaId\":[\"13\"],\"dbPassword\":[\"ywy\"],\"dbUsername\":[\"ywy\"],\"gamedbName\":[\"ywy\"],\"gamedbip\":[\"192.168.1.31\"],\"gamedbport\":[\"3306\"],\"logdbName\":[\"ywy\"],\"logdbip\":[\"192.168.1.31\"],\"logdbport\":[\"3306\"],\"serverId\":[\"2\"],\"serverIp\":[\"192.168.1.31\"],\"serverName\":[\"张强\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('221', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverAdd', '{\"areaId\":[\"13\"],\"dbPassword\":[\"root\"],\"dbUsername\":[\"root\"],\"gamedbName\":[\"ywy\"],\"gamedbip\":[\"192.168.1.25\"],\"gamedbport\":[\"3306\"],\"logdbName\":[\"ywy\"],\"logdbip\":[\"192.168.1.25\"],\"logdbport\":[\"3306\"],\"serverId\":[\"3\"],\"serverIp\":[\"192.168.1.25\"],\"serverName\":[\"叶志\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('222', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverModify', '{\"areaId\":[\"\"],\"dbPassword\":[\"ywy\"],\"dbUsername\":[\"ywy\"],\"gamedbName\":[\"ywy\"],\"gamedbip\":[\"192.168.1.31\"],\"gamedbport\":[\"3306\"],\"id\":[\"2\"],\"logdbName\":[\"ywy\"],\"logdbip\":[\"192.168.1.31\"],\"logdbport\":[\"3306\"],\"serverId\":[\"2\"],\"serverIp\":[\"192.168.1.31\"],\"serverName\":[\"张强\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('223', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverModify', '{\"areaId\":[\"13\"],\"dbPassword\":[\"root\"],\"dbUsername\":[\"root\"],\"gamedbName\":[\"cs\"],\"gamedbip\":[\"192.168.1.66\"],\"gamedbport\":[\"3306\"],\"id\":[\"1\"],\"logdbName\":[\"ywy\"],\"logdbip\":[\"192.168.1.66\"],\"logdbport\":[\"3306\"],\"serverId\":[\"1\"],\"serverIp\":[\"192.168.1.66\"],\"serverName\":[\"zhaowei\"],\"socketPort\":[\"8103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('224', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverModify', '{\"areaId\":[\"13\"],\"dbPassword\":[\"ywy\"],\"dbUsername\":[\"ywy\"],\"gamedbName\":[\"ywy\"],\"gamedbip\":[\"192.168.1.31\"],\"gamedbport\":[\"3306\"],\"id\":[\"2\"],\"logdbName\":[\"ywy\"],\"logdbip\":[\"192.168.1.31\"],\"logdbport\":[\"3306\"],\"serverId\":[\"2\"],\"serverIp\":[\"192.168.1.31\"],\"serverName\":[\"张强\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('225', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverModify', '{\"areaId\":[\"13\"],\"dbPassword\":[\"ywy\"],\"dbUsername\":[\"ywy\"],\"gamedbName\":[\"ywy\"],\"gamedbip\":[\"192.168.1.31\"],\"gamedbport\":[\"3306\"],\"id\":[\"2\"],\"logdbName\":[\"ywy\"],\"logdbip\":[\"192.168.1.31\"],\"logdbport\":[\"3306\"],\"serverId\":[\"2\"],\"serverIp\":[\"192.168.1.31\"],\"serverName\":[\"张强\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('226', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverByIdLogicDelete', '{\"id\":[\"1\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('227', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"64\"],\"roleId\":[\"1\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('228', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverAdd', '{\"areaId\":[\"14\"],\"dbPassword\":[\"dianxin\"],\"dbUsername\":[\"dianxin\"],\"gamedbName\":[\"ywy\"],\"gamedbip\":[\"192.168.1.1\"],\"gamedbport\":[\"3306\"],\"logdbName\":[\"ywy\"],\"logdbip\":[\"192.168.1.1\"],\"logdbport\":[\"3306\"],\"serverId\":[\"4\"],\"serverIp\":[\"192.168.1.1\"],\"serverName\":[\"电信1服\"],\"socketPort\":[\"9103\"]}', '1', '1410883200000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('229', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"0\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('230', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"ywy\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('231', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"2\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('232', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"2\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('233', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"ywy\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('234', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"0\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('235', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"0\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('236', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"ywy\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('237', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"2\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('238', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleAdd', '{\"menuId\":[\"3\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('239', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"2\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('240', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"0\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('241', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"ywy\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('242', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.RoleMenuAction', 'menuRoleDelete', '{\"menuId\":[\"3\"]}', '1', '1410969600000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('243', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverAdd', '{\"areaId\":[\"13\"],\"dbPassword\":[\"root\"],\"dbUsername\":[\"root\"],\"gamedbName\":[\"cs\"],\"gamedbip\":[\"192.168.1.66\"],\"gamedbport\":[\"3306\"],\"logdbName\":[\"cs_log\"],\"logdbip\":[\"192.168.1.66\"],\"logdbport\":[\"3306\"],\"serverId\":[\"5\"],\"serverIp\":[\"192.168.1.66\"],\"serverName\":[\"赵伟\"],\"socketPort\":[\"9103\"]}', '1', '1411056000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('244', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverModify', '{\"areaId\":[\"13\"],\"dbPassword\":[\"root\"],\"dbUsername\":[\"root\"],\"gamedbName\":[\"cs\"],\"gamedbip\":[\"localhost\"],\"gamedbport\":[\"3306\"],\"id\":[\"5\"],\"logdbName\":[\"\"],\"logdbip\":[\"localhost\"],\"logdbport\":[\"3306\"],\"serverId\":[\"5\"],\"serverIp\":[\"localhost\"],\"serverName\":[\"赵伟\"],\"socketPort\":[\"9103\"]}', '1', '1411056000000', '0', null);
INSERT INTO `cs_operatelog` VALUES ('245', '1', '0:0:0:0:0:0:0:1', 'class com.cs.backend.action.ServerAction', 'serverModify', '{\"areaId\":[\"13\"],\"dbPassword\":[\"root\"],\"dbUsername\":[\"root\"],\"gamedbName\":[\"cs\"],\"gamedbip\":[\"localhost\"],\"gamedbport\":[\"3306\"],\"id\":[\"5\"],\"logdbName\":[\"ywy\"],\"logdbip\":[\"localhost\"],\"logdbport\":[\"3306\"],\"serverId\":[\"5\"],\"serverIp\":[\"localhost\"],\"serverName\":[\"赵伟\"],\"socketPort\":[\"9103\"]}', '1', '1411056000000', '0', null);

-- ----------------------------
-- Table structure for cs_platform
-- ----------------------------
DROP TABLE IF EXISTS `cs_platform`;
CREATE TABLE `cs_platform` (
  `platformId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'platformId',
  `platformName` varchar(255) NOT NULL COMMENT '平台名',
  `platformRight` varchar(1024) DEFAULT NULL COMMENT '平台权限',
  `isDeleted` int(2) DEFAULT NULL,
  `exchangeRate` int(11) DEFAULT NULL COMMENT '元宝对应当地货币比例',
  `describle` varchar(255) DEFAULT NULL,
  `realRate` int(11) DEFAULT NULL COMMENT '当地国家货币对应人民币汇率',
  PRIMARY KEY (`platformId`),
  UNIQUE KEY `platformName` (`platformName`)
) ENGINE=InnoDB AUTO_INCREMENT=90001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_platform
-- ----------------------------
INSERT INTO `cs_platform` VALUES ('1', 'u9', '[50000][1][90000]', '0', '10', 'u9', null);
INSERT INTO `cs_platform` VALUES ('2', '37wan', '[50000][2][90000]', '0', '10', '37玩', null);
INSERT INTO `cs_platform` VALUES ('3', 'duowan', '[50000][3][90000]', '0', '10', '多玩', null);
INSERT INTO `cs_platform` VALUES ('50000', 'youwaiyou', '[50000][90000]', '0', '10', '游外游', null);
INSERT INTO `cs_platform` VALUES ('90000', 'development', '[90000]', '0', '10', '开发', null);

-- ----------------------------
-- Table structure for cs_role
-- ----------------------------
DROP TABLE IF EXISTS `cs_role`;
CREATE TABLE `cs_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `roleName` varchar(255) DEFAULT NULL COMMENT '角色名',
  `isDeleted` int(2) DEFAULT NULL COMMENT '是否删除角色,0表示未删除，1表示删除',
  `describle` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `createTime` bigint(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_role
-- ----------------------------
INSERT INTO `cs_role` VALUES ('1', 'developer', '0', '开发', '100000000');
INSERT INTO `cs_role` VALUES ('2', 'admin', '0', '管理者', '100000000');

-- ----------------------------
-- Table structure for cs_rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `cs_rolemenu`;
CREATE TABLE `cs_rolemenu` (
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`menuId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `cs_rolemenu_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `cs_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cs_rolemenu_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `cs_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_rolemenu
-- ----------------------------
INSERT INTO `cs_rolemenu` VALUES ('1', '1');
INSERT INTO `cs_rolemenu` VALUES ('1', '2');
INSERT INTO `cs_rolemenu` VALUES ('1', '3');
INSERT INTO `cs_rolemenu` VALUES ('1', '4');
INSERT INTO `cs_rolemenu` VALUES ('1', '5');
INSERT INTO `cs_rolemenu` VALUES ('1', '6');
INSERT INTO `cs_rolemenu` VALUES ('1', '7');
INSERT INTO `cs_rolemenu` VALUES ('1', '8');
INSERT INTO `cs_rolemenu` VALUES ('1', '9');
INSERT INTO `cs_rolemenu` VALUES ('1', '10');
INSERT INTO `cs_rolemenu` VALUES ('1', '11');
INSERT INTO `cs_rolemenu` VALUES ('1', '12');
INSERT INTO `cs_rolemenu` VALUES ('1', '13');
INSERT INTO `cs_rolemenu` VALUES ('1', '14');
INSERT INTO `cs_rolemenu` VALUES ('1', '15');
INSERT INTO `cs_rolemenu` VALUES ('1', '16');
INSERT INTO `cs_rolemenu` VALUES ('1', '17');
INSERT INTO `cs_rolemenu` VALUES ('1', '18');
INSERT INTO `cs_rolemenu` VALUES ('1', '19');
INSERT INTO `cs_rolemenu` VALUES ('1', '20');
INSERT INTO `cs_rolemenu` VALUES ('1', '21');
INSERT INTO `cs_rolemenu` VALUES ('2', '21');
INSERT INTO `cs_rolemenu` VALUES ('1', '22');
INSERT INTO `cs_rolemenu` VALUES ('2', '22');
INSERT INTO `cs_rolemenu` VALUES ('1', '23');
INSERT INTO `cs_rolemenu` VALUES ('2', '23');
INSERT INTO `cs_rolemenu` VALUES ('1', '24');
INSERT INTO `cs_rolemenu` VALUES ('2', '24');
INSERT INTO `cs_rolemenu` VALUES ('1', '25');
INSERT INTO `cs_rolemenu` VALUES ('2', '25');
INSERT INTO `cs_rolemenu` VALUES ('1', '30');
INSERT INTO `cs_rolemenu` VALUES ('2', '30');
INSERT INTO `cs_rolemenu` VALUES ('1', '31');
INSERT INTO `cs_rolemenu` VALUES ('2', '31');
INSERT INTO `cs_rolemenu` VALUES ('1', '35');
INSERT INTO `cs_rolemenu` VALUES ('1', '36');
INSERT INTO `cs_rolemenu` VALUES ('2', '36');
INSERT INTO `cs_rolemenu` VALUES ('1', '37');
INSERT INTO `cs_rolemenu` VALUES ('2', '37');
INSERT INTO `cs_rolemenu` VALUES ('1', '38');
INSERT INTO `cs_rolemenu` VALUES ('2', '38');
INSERT INTO `cs_rolemenu` VALUES ('1', '39');
INSERT INTO `cs_rolemenu` VALUES ('2', '39');
INSERT INTO `cs_rolemenu` VALUES ('1', '40');
INSERT INTO `cs_rolemenu` VALUES ('2', '40');
INSERT INTO `cs_rolemenu` VALUES ('1', '41');
INSERT INTO `cs_rolemenu` VALUES ('2', '41');
INSERT INTO `cs_rolemenu` VALUES ('1', '42');
INSERT INTO `cs_rolemenu` VALUES ('2', '42');
INSERT INTO `cs_rolemenu` VALUES ('1', '43');
INSERT INTO `cs_rolemenu` VALUES ('1', '44');
INSERT INTO `cs_rolemenu` VALUES ('1', '45');
INSERT INTO `cs_rolemenu` VALUES ('1', '46');
INSERT INTO `cs_rolemenu` VALUES ('1', '47');
INSERT INTO `cs_rolemenu` VALUES ('1', '48');
INSERT INTO `cs_rolemenu` VALUES ('1', '49');
INSERT INTO `cs_rolemenu` VALUES ('1', '50');
INSERT INTO `cs_rolemenu` VALUES ('1', '51');
INSERT INTO `cs_rolemenu` VALUES ('1', '52');
INSERT INTO `cs_rolemenu` VALUES ('1', '53');
INSERT INTO `cs_rolemenu` VALUES ('1', '54');
INSERT INTO `cs_rolemenu` VALUES ('1', '55');
INSERT INTO `cs_rolemenu` VALUES ('1', '56');
INSERT INTO `cs_rolemenu` VALUES ('1', '57');
INSERT INTO `cs_rolemenu` VALUES ('2', '57');
INSERT INTO `cs_rolemenu` VALUES ('1', '58');
INSERT INTO `cs_rolemenu` VALUES ('2', '58');
INSERT INTO `cs_rolemenu` VALUES ('1', '59');
INSERT INTO `cs_rolemenu` VALUES ('2', '59');
INSERT INTO `cs_rolemenu` VALUES ('1', '60');
INSERT INTO `cs_rolemenu` VALUES ('2', '60');
INSERT INTO `cs_rolemenu` VALUES ('1', '61');
INSERT INTO `cs_rolemenu` VALUES ('2', '61');
INSERT INTO `cs_rolemenu` VALUES ('1', '62');
INSERT INTO `cs_rolemenu` VALUES ('2', '62');
INSERT INTO `cs_rolemenu` VALUES ('1', '63');
INSERT INTO `cs_rolemenu` VALUES ('2', '63');
INSERT INTO `cs_rolemenu` VALUES ('1', '64');

-- ----------------------------
-- Table structure for cs_server
-- ----------------------------
DROP TABLE IF EXISTS `cs_server`;
CREATE TABLE `cs_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '区服id',
  `serverName` varchar(255) DEFAULT NULL COMMENT '区服名',
  `areaId` int(11) DEFAULT NULL COMMENT '平台id',
  `areaName` varchar(255) DEFAULT NULL COMMENT '平台名',
  `isDeleted` int(2) DEFAULT NULL,
  `openTime` bigint(50) DEFAULT NULL COMMENT '开服时间',
  `gamedbip` varchar(100) DEFAULT NULL COMMENT '游戏库iP',
  `gamedbport` int(11) DEFAULT NULL COMMENT '游戏库端口',
  `socketPort` int(11) DEFAULT NULL COMMENT '连接游戏端口',
  `logdbip` varchar(100) DEFAULT NULL COMMENT '日志库iP',
  `logdbport` int(11) DEFAULT NULL COMMENT '日志库端口',
  `dbPassword` varchar(255) DEFAULT NULL COMMENT '数据库密码',
  `gamedbName` varchar(255) DEFAULT NULL COMMENT '游戏库名',
  `logdbName` varchar(255) DEFAULT NULL COMMENT '当前日志库数据库名',
  `dbUsername` varchar(255) DEFAULT NULL COMMENT '数据库用户名',
  `serverIp` varchar(100) DEFAULT NULL COMMENT '服务器iP',
  `serverId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_server
-- ----------------------------
INSERT INTO `cs_server` VALUES ('2', '张强', '13', 'ywy', '0', null, '192.168.1.31', '3306', '9103', '192.168.1.31', '3306', 'ywy', 'ywy', 'ywy', 'ywy', '192.168.1.31', '2');
INSERT INTO `cs_server` VALUES ('3', '叶志', '13', 'ywy', '0', null, '192.168.1.25', '3306', '9103', '192.168.1.25', '3306', 'root', 'ywy', 'ywy', 'root', '192.168.1.25', '3');
INSERT INTO `cs_server` VALUES ('4', '电信1服', '14', 'dianxin', '0', null, '192.168.1.1', '3306', '9103', '192.168.1.1', '3306', 'dianxin', 'ywy', 'ywy', 'dianxin', '192.168.1.1', '4');
INSERT INTO `cs_server` VALUES ('5', '赵伟', '13', 'ywy', '0', null, 'localhost', '3306', '9103', 'localhost', '3306', 'root', 'cs', 'ywy', 'root', 'localhost', '5');

-- ----------------------------
-- Table structure for cs_user
-- ----------------------------
DROP TABLE IF EXISTS `cs_user`;
CREATE TABLE `cs_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `passWord` varchar(255) DEFAULT NULL COMMENT '密码',
  `isDeleted` int(2) DEFAULT NULL COMMENT '是否删除',
  `roleId` int(11) DEFAULT NULL COMMENT '属于什么角色',
  `platformId` int(11) DEFAULT NULL,
  `model` varchar(5) DEFAULT NULL COMMENT '页面状态  1:表示普通页面， 2表示桌面页面',
  PRIMARY KEY (`userId`),
  KEY `platformId` (`platformId`),
  CONSTRAINT `cs_user_ibfk_1` FOREIGN KEY (`platformId`) REFERENCES `cs_platform` (`platformId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_user
-- ----------------------------
INSERT INTO `cs_user` VALUES ('1', 'zhaowei', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '90000', '1');
