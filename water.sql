/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : water

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-09-26 17:41:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `agent`
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '代理ID',
  `add_time` varchar(32) NOT NULL COMMENT '代理添加时间',
  `level` tinyint(4) NOT NULL DEFAULT '2' COMMENT '代理等级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of agent
-- ----------------------------

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `path` varchar(50) DEFAULT '0' COMMENT '权限',
  `add_time` varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `upd_time` varchar(32) NOT NULL COMMENT '修改时间',
  `pid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为顶级菜单',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:不显示；1：显示',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `is_show` (`is_show`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('2', '权限管理', '', '1506329448', '1506329448', '0', '1');

-- ----------------------------
-- Table structure for `expend_card`
-- ----------------------------
DROP TABLE IF EXISTS `expend_card`;
CREATE TABLE `expend_card` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '玩家ID',
  `nickname` varchar(30) NOT NULL COMMENT '玩家昵称',
  `phone` char(11) DEFAULT NULL COMMENT '玩家电话',
  `add_time` varchar(32) NOT NULL COMMENT '消耗时间',
  `c_num` int(10) NOT NULL COMMENT '消耗数量',
  `game` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1：十三水；2：缙云麻将',
  `is_invoice` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：不是代开；1：代开',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING HASH,
  KEY `add_time` (`add_time`),
  KEY `game` (`game`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of expend_card
-- ----------------------------

-- ----------------------------
-- Table structure for `login_record`
-- ----------------------------
DROP TABLE IF EXISTS `login_record`;
CREATE TABLE `login_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT 'GM系统用户',
  `add_time` varchar(32) NOT NULL COMMENT '登陆时间',
  `upd_time` varchar(32) DEFAULT NULL COMMENT '登出时间',
  `mid` int(10) NOT NULL COMMENT 'GM系统用户ID',
  `upd_player` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否修改玩家信息0：否；1：是',
  `upd_agent` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否修改代理信息0：否；1：是',
  `pro_agent` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否提升代理0：否；1：是',
  `pwd_agent` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否修代理密码0：否；1：是',
  `is_msg` tinyint(4) NOT NULL COMMENT '是否邮件/公告/跑马灯发放0：否；1：是',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of login_record
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT 'GM系统管理员名称',
  `pwd` char(40) NOT NULL COMMENT '密码',
  `add_time` varchar(32) NOT NULL COMMENT '注册时间',
  `role_id` tinyint(4) DEFAULT '0' COMMENT '用户角色',
  `phone` char(11) NOT NULL COMMENT '电话',
  `upd_time` varchar(32) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `add_time` varchar(32) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1：公告；2：跑马灯',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('2', 'hahhaha', '1506397504', '1');
INSERT INTO `message` VALUES ('3', 'hahhaha', '1506397504', '1');
INSERT INTO `message` VALUES ('4', 'hahhaha', '1506397505', '1');

-- ----------------------------
-- Table structure for `punch_card`
-- ----------------------------
DROP TABLE IF EXISTS `punch_card`;
CREATE TABLE `punch_card` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mid` tinyint(4) DEFAULT '0' COMMENT 'GM系统管理员ID',
  `p_num` int(11) NOT NULL COMMENT '划卡数量',
  `nickename` text NOT NULL COMMENT '划卡对象昵称',
  `to_uid` text NOT NULL COMMENT '划卡对象ID',
  `to_uphone` text NOT NULL COMMENT '划卡对象电话',
  `add_time` varchar(32) NOT NULL COMMENT '划卡时间',
  `form` tinyint(4) NOT NULL DEFAULT '3' COMMENT '1:系统赠送；2：GM发放：3：充值发送',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of punch_card
-- ----------------------------

-- ----------------------------
-- Table structure for `recharge_record`
-- ----------------------------
DROP TABLE IF EXISTS `recharge_record`;
CREATE TABLE `recharge_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '玩家ID',
  `add_time` varchar(32) NOT NULL COMMENT '充值时间',
  `order` varchar(200) NOT NULL COMMENT '订单号',
  `money` decimal(10,0) NOT NULL COMMENT '充值金额',
  `card` int(10) NOT NULL COMMENT '充值房卡',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:失败；1：成功',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of recharge_record
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '角色名称',
  `powers` text COMMENT '角色权限',
  `add_time` varchar(32) NOT NULL COMMENT '添加时间',
  `upd_time` varchar(32) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('2', '超级管理员', 'auth/list', '2487465464', '3543654757');

-- ----------------------------
-- Table structure for `total`
-- ----------------------------
DROP TABLE IF EXISTS `total`;
CREATE TABLE `total` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `c_card` int(10) NOT NULL COMMENT '消耗房卡',
  `s_card` int(10) NOT NULL COMMENT '当前房卡库存',
  `h_recharge` decimal(10,0) NOT NULL COMMENT '历史充值',
  `m_card` int(10) NOT NULL COMMENT '历史房卡产出',
  `d_recharge` decimal(10,0) DEFAULT NULL COMMENT '今日充值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of total
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '玩家ID',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '玩家昵称',
  `phone` char(11) DEFAULT NULL COMMENT '玩家电话',
  `s_card` int(10) NOT NULL DEFAULT '0' COMMENT '剩余房卡',
  `c_card` int(10) NOT NULL COMMENT '消耗房卡',
  `recharge` decimal(10,0) NOT NULL COMMENT '充值金额',
  `daily` int(10) NOT NULL COMMENT '日均消耗',
  `add_time` varchar(32) NOT NULL COMMENT '注册时间',
  `upd_time` varchar(32) NOT NULL COMMENT '最后登录时间',
  `is_agent` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：玩家；2：代理',
  `is_forbidden` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:未禁封；1：禁封',
  `realname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`is_agent`),
  UNIQUE KEY `uid` (`uid`),
  KEY `is_agent` (`is_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
