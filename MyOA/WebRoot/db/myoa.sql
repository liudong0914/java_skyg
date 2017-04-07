/*
Navicat MySQL Data Transfer

Source Server         : mytest
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : myoa

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2013-07-10 08:57:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accessoryfile`
-- ----------------------------
DROP TABLE IF EXISTS `accessoryfile`;
CREATE TABLE `accessoryfile` (
  `accessoryId` int(11) NOT NULL auto_increment,
  `fileId` int(11) NOT NULL,
  `accName` varchar(50) NOT NULL,
  `accSize` int(11) NOT NULL,
  `accType` int(11) NOT NULL,
  `createDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `accPath` varchar(200) default NULL,
  PRIMARY KEY  (`accessoryId`),
  KEY `fileId` (`fileId`),
  CONSTRAINT `accessoryfile_ibfk_1` FOREIGN KEY (`fileId`) REFERENCES `files` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accessoryfile
-- ----------------------------
INSERT INTO `accessoryfile` VALUES ('17', '35', 'MyOffice项目说明', '24064', '3', '2007-12-22 11:28:49', 'c:\\\\部门文档\\研发部\\所有项目\\MyOffice\\MyOffice说明文档\\MyOffice项目说明.doc');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptId` int(11) NOT NULL auto_increment,
  `deptName` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `connectTelNo` bigint(20) NOT NULL,
  `connectMobileTelNo` bigint(20) NOT NULL,
  `faxes` bigint(20) NOT NULL,
  `machineId` int(11) NOT NULL,
  PRIMARY KEY  (`deptId`),
  KEY `userId` (`userId`),
  KEY `machineId` (`machineId`),
  CONSTRAINT `dept_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `dept_ibfk_2` FOREIGN KEY (`machineId`) REFERENCES `machine` (`machineId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('6', '销售部', '1', '62768866', '13910255752', '62768866', '1');
INSERT INTO `dept` VALUES ('7', '研发部', '1', '62768866', '13520319928', '62768866', '3');
INSERT INTO `dept` VALUES ('8', '财务部', '2', '62768866', '13520319928', '62768866', '5');
INSERT INTO `dept` VALUES ('9', '发电部', '3', '62768866', '13920319928', '62768866', '13');
INSERT INTO `dept` VALUES ('12', '综合部', '3', '83258011', '13910255752', '82353695', '5');
INSERT INTO `dept` VALUES ('13', '培训部', '4', '62768866', '13910255752', '62768866', '5');
INSERT INTO `dept` VALUES ('14', '采购部', '2', '63454546', '13878264288', '62768233', '18');
INSERT INTO `dept` VALUES ('15', '物资部', '4', '62257546', '13875274832', '62768232', '17');
INSERT INTO `dept` VALUES ('16', '宣传部', '2', '63234345', '13856574465', '63454365', '1');
INSERT INTO `dept` VALUES ('17', '公关部', '5', '63544453', '13856342234', '63423424', '17');
INSERT INTO `dept` VALUES ('18', '企划部', '2', '62342323', '13456464345', '62243523', '3');
INSERT INTO `dept` VALUES ('19', '客服部', '2', '63435645', '13455676856', '62345654', '18');

-- ----------------------------
-- Table structure for `files`
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `fileId` int(11) NOT NULL auto_increment,
  `fileName` varchar(50) NOT NULL,
  `fileType` int(11) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `fileOwner` int(11) NOT NULL,
  `createDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `parentId` int(11) NOT NULL,
  `filePath` varchar(200) default NULL,
  `ifDelete` int(11) default NULL,
  PRIMARY KEY  (`fileId`),
  KEY `fileType` (`fileType`),
  KEY `fileOwner` (`fileOwner`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`fileType`) REFERENCES `filetype` (`fileTypeId`),
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`fileOwner`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES ('1', '公共文挡', '1', '对整个系统的整体说明', '3', '2013-06-22 11:58:20', '0', 'c:\\\\公共文挡', '0');
INSERT INTO `files` VALUES ('3', '管理制度', '1', '公司的整个管理规范', '3', '2013-06-22 12:30:35', '0', 'c:\\\\管理制度', '0');
INSERT INTO `files` VALUES ('4', '部门文档', '1', '各部门的文件分类', '3', '2013-06-22 12:01:51', '0', 'c:\\\\部门文档', '0');
INSERT INTO `files` VALUES ('5', '研发部', '1', '研发部相关资料', '1', '2013-06-22 12:02:13', '4', 'D:\\\\部门文档\\研发部', '0');
INSERT INTO `files` VALUES ('19', '部门员工介绍', '1', '介绍所有研发部员工的基本信息。', '1', '2013-06-22 11:38:48', '5', 'D:\\复习Jsp.wps', '0');
INSERT INTO `files` VALUES ('20', '所有项目', '1', '所有可用的项目汇总。', '1', '2007-12-21 11:06:38', '5', 'c:\\\\部门文档\\研发部\\所有项目', '0');
INSERT INTO `files` VALUES ('21', 'ACCP员工基本资料', '3', '若要查看详细，请联系管理员。', '1', '2007-12-21 11:07:40', '20', 'D:\\\\复习Jsp.wps', '1');
INSERT INTO `files` VALUES ('31', 'MyOffice', '3', 'bishexiangmu', '1', '2007-12-22 11:19:34', '21', 'D:\\\\复习Jsp.wps', '1');
INSERT INTO `files` VALUES ('32', '游戏点卡销售系统', '1', '毕业设计项目', '1', '2013-06-22 11:39:41', '20', 'D:\\复习java.wps', '0');
INSERT INTO `files` VALUES ('35', 'MyOffice说明文档', '3', '说明文档', '1', '2007-12-22 11:28:49', '21', 'D:\\\\复习java.wps', '0');
INSERT INTO `files` VALUES ('36', '游戏点卡销售系统说明书', '1', '说明书', '1', '2007-12-22 11:29:18', '20', 'c:\\\\部门文档\\研发部\\所有项目\\游戏点卡销售系统\\游戏点卡销售系统说明书', '0');
INSERT INTO `files` VALUES ('38', 'Java项目', '3', 'Java毕业设计项目', '1', '2013-03-03 23:02:23', '31', 'D:\\ssh框架面试题.doc', '0');
INSERT INTO `files` VALUES ('39', 'ACCP5.0产品发布', '3', '所有即将发布的产品', '1', '2013-03-03 22:53:25', '31', 'D:\\ssh框架面试题.doc', '0');

-- ----------------------------
-- Table structure for `filetype`
-- ----------------------------
DROP TABLE IF EXISTS `filetype`;
CREATE TABLE `filetype` (
  `fileTypeId` int(11) NOT NULL auto_increment,
  `fileTypeName` varchar(50) NOT NULL,
  `fileTypeImage` varchar(50) NOT NULL,
  `fileTypeSuffix` varchar(50) default NULL,
  PRIMARY KEY  (`fileTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filetype
-- ----------------------------
INSERT INTO `filetype` VALUES ('1', '文件夹', 'folder.gif', '0');
INSERT INTO `filetype` VALUES ('2', '其他文件', 'other.gif', 'noname');
INSERT INTO `filetype` VALUES ('3', 'Word文档', 'word.gif', 'doc');
INSERT INTO `filetype` VALUES ('4', 'Excel文档', 'excel.gif', 'xls');
INSERT INTO `filetype` VALUES ('5', 'PowerPoint演示文档', 'ppt.gif', 'ppt');
INSERT INTO `filetype` VALUES ('6', 'Access文档', 'access.gif', 'mdb');
INSERT INTO `filetype` VALUES ('7', '超文本文档', 'html.gif', 'htm');
INSERT INTO `filetype` VALUES ('8', '图片文档', 'bmp.gif', 'gif');
INSERT INTO `filetype` VALUES ('9', '压缩文档', 'zip.gif', 'rar');
INSERT INTO `filetype` VALUES ('10', '文本文档', 'note1.gif', 'txt');
INSERT INTO `filetype` VALUES ('11', '多媒体文档', 'media.gif', 'avi');
INSERT INTO `filetype` VALUES ('12', 'Acrobat文档', 'pdf.gif', 'pdf');
INSERT INTO `filetype` VALUES ('13', '可执行文件', 'exe.gif', 'exe');

-- ----------------------------
-- Table structure for `loginlog`
-- ----------------------------
DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE `loginlog` (
  `loginId` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL,
  `loginTime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ifSuccess` int(11) NOT NULL default '0',
  `loginUserIp` varchar(100) default NULL,
  `loginDesc` varchar(100) default NULL,
  PRIMARY KEY  (`loginId`),
  KEY `userId` (`userId`),
  CONSTRAINT `loginlog_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loginlog
-- ----------------------------
INSERT INTO `loginlog` VALUES ('1', '1', '2007-12-28 22:57:46', '1', '192.168.2.90', '用户登录成功');
INSERT INTO `loginlog` VALUES ('3', '2', '2007-12-28 23:02:52', '0', '192.168.2.90', '用户登录失败，用户名或密码不正确。');
INSERT INTO `loginlog` VALUES ('4', '3', '2007-12-28 23:02:57', '1', '192.168.2.90', '用户登录成功');
INSERT INTO `loginlog` VALUES ('6', '3', '2007-12-28 23:10:04', '1', '192.168.2.90', '用户登录成功');
INSERT INTO `loginlog` VALUES ('7', '2', '2007-12-28 23:17:50', '1', '192.168.2.90', '用户登录成功');
INSERT INTO `loginlog` VALUES ('8', '1', '2007-12-09 21:47:04', '1', '192.168.2.90', '用户登录成功');
INSERT INTO `loginlog` VALUES ('12', '5', '2013-06-21 11:46:26', '0', '172.1.4.225', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('13', '4', '2013-06-21 11:58:24', '0', '172.1.4.225', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('14', '3', '2013-06-21 12:02:04', '1', '172.1.4.225', '用户登录成功');
INSERT INTO `loginlog` VALUES ('15', '5', '2013-06-22 02:12:29', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('16', '5', '2013-06-22 02:12:34', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('17', '5', '2013-06-22 03:15:52', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('18', '5', '2013-06-22 04:13:33', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('19', '5', '2013-06-22 04:13:50', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('20', '5', '2013-06-22 04:17:59', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('27', '5', '2013-06-23 02:18:14', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('30', '5', '2013-06-23 01:59:32', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('31', '5', '2013-06-23 01:59:46', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('32', '5', '2013-06-23 02:17:38', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('33', '5', '2013-06-23 02:22:00', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('34', '1', '2013-06-23 03:18:02', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('35', '1', '2013-06-23 03:52:09', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('36', '1', '2013-06-23 03:54:04', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('37', '5', '2013-06-23 04:05:03', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('38', '1', '2013-06-23 04:05:13', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('39', '1', '2013-06-23 04:06:25', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('40', '1', '2013-06-23 04:06:33', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('41', '1', '2013-06-23 04:07:04', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('42', '1', '2013-06-23 04:07:11', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('43', '1', '2013-06-23 04:10:02', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('44', '1', '2013-06-23 04:11:36', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('45', '1', '2013-06-23 04:12:47', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('46', '1', '2013-06-23 04:15:25', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('47', '2', '2013-06-23 04:18:18', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('48', '2', '2013-06-23 05:20:30', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('49', '5', '2013-06-23 05:55:22', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('50', '1', '2013-06-23 05:55:31', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('51', '1', '2013-06-23 06:08:02', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('52', '2', '2013-06-23 06:12:43', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('53', '5', '2013-06-23 06:17:51', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('54', '5', '2013-06-23 07:03:20', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('55', '5', '2013-06-23 07:10:26', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('56', '5', '2013-06-23 07:11:59', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('57', '5', '2013-06-23 07:22:53', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('58', '1', '2013-06-23 07:39:55', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('59', '5', '2013-06-23 08:39:55', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('60', '5', '2013-06-23 09:03:36', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('61', '1', '2013-06-23 09:40:32', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('62', '5', '2013-06-23 09:41:28', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('63', '1', '2013-06-23 09:44:25', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('64', '1', '2013-06-23 11:33:40', '1', '10.10.5.99', '用户登录成功');
INSERT INTO `loginlog` VALUES ('65', '2', '2013-06-23 11:59:58', '1', '10.10.5.99', '用户登录成功');
INSERT INTO `loginlog` VALUES ('66', '1', '2013-06-24 12:37:34', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('67', '5', '2013-06-24 09:26:19', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('68', '1', '2013-06-24 09:26:35', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('69', '1', '2013-06-24 09:36:27', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('70', '1', '2013-06-24 09:50:32', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('71', '1', '2013-06-24 10:02:50', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('72', '2', '2013-06-24 10:08:01', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('73', '2', '2013-06-24 10:12:38', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('74', '1', '2013-06-24 10:21:15', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('75', '1', '2013-06-24 10:22:57', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('76', '1', '2013-06-24 10:27:21', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('77', '1', '2013-06-24 10:30:15', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('78', '1', '2013-06-24 11:34:44', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('79', '1', '2013-06-25 12:07:59', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('80', '2', '2013-06-25 12:14:45', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('81', '5', '2013-06-25 12:16:55', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('82', '5', '2013-06-25 08:34:30', '1', '169.254.94.47', '用户登录成功');
INSERT INTO `loginlog` VALUES ('83', '1', '2013-06-25 08:38:58', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('84', '5', '2013-06-25 09:08:43', '1', '172.1.4.174', '用户登录成功');
INSERT INTO `loginlog` VALUES ('85', '1', '2013-06-25 12:30:02', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('86', '3', '2013-06-25 12:32:07', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('87', '1', '2013-06-25 12:59:09', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('88', '2', '2013-06-25 01:08:36', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('89', '2', '2013-06-25 01:11:26', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('90', '2', '2013-06-25 01:20:31', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('91', '2', '2013-06-25 01:22:01', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('92', '2', '2013-06-25 01:24:21', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('93', '2', '2013-06-25 01:25:07', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('94', '5', '2013-06-25 01:43:30', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('95', '1', '2013-06-25 02:18:27', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('96', '5', '2013-06-25 02:21:39', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('97', '5', '2013-06-25 02:48:00', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('98', '1', '2013-06-25 03:36:29', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('99', '1', '2013-06-25 04:22:34', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('100', '5', '2013-06-25 05:49:08', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('101', '5', '2013-06-25 05:50:50', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('102', '1', '2013-06-25 05:52:58', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('103', '1', '2013-06-25 08:09:34', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('104', '1', '2013-06-25 08:09:40', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('105', '5', '2013-06-25 08:11:18', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('106', '3', '2013-06-25 21:08:42', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('107', '5', '2013-06-25 21:13:42', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('108', '3', '2013-06-25 21:14:44', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('109', '1', '2013-06-25 21:18:45', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('110', '5', '2013-06-25 21:23:54', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('111', '5', '2013-06-25 21:32:28', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('112', '1', '2013-06-25 21:34:50', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('113', '1', '2013-06-25 22:55:13', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('114', '5', '2013-06-25 23:31:48', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('115', '5', '2013-06-25 23:45:20', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('116', '2', '2013-06-26 00:00:36', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('117', '1', '2013-06-26 00:03:29', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('118', '1', '2013-06-26 00:06:13', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('119', '1', '2013-06-26 00:08:55', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('120', '1', '2013-06-26 00:14:05', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('121', '5', '2013-06-26 00:18:30', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('122', '5', '2013-06-26 00:22:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('123', '5', '2013-06-26 00:27:39', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('124', '1', '2013-06-26 00:28:58', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('125', '5', '2013-06-26 00:40:41', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('126', '5', '2013-06-26 00:45:14', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('127', '1', '2013-06-26 00:53:39', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('128', '1', '2013-06-26 00:57:59', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('129', '1', '2013-06-26 01:02:21', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('130', '1', '2013-06-26 01:11:39', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('131', '5', '2013-06-26 01:23:59', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('132', '5', '2013-06-26 01:26:12', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('133', '5', '2013-06-26 01:30:28', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('134', '5', '2013-06-26 01:40:59', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('135', '5', '2013-06-26 01:42:25', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('136', '5', '2013-06-26 01:42:33', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('137', '1', '2013-06-26 01:44:57', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('138', '5', '2013-06-26 18:55:32', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('139', '5', '2013-06-26 19:43:30', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('140', '5', '2013-06-26 19:51:16', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('141', '5', '2013-06-26 20:00:04', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('142', '5', '2013-06-26 20:13:17', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('143', '5', '2013-06-26 20:23:35', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('144', '5', '2013-06-26 20:27:45', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('145', '5', '2013-06-26 20:27:52', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('146', '5', '2013-06-26 21:58:38', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('147', '1', '2013-06-26 22:02:57', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('148', '1', '2013-06-26 22:07:04', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('149', '1', '2013-06-26 22:10:23', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('150', '1', '2013-06-26 22:10:30', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('151', '1', '2013-06-26 22:13:56', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('152', '1', '2013-06-26 22:14:01', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('153', '1', '2013-06-27 00:24:01', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('154', '3', '2013-06-27 00:40:27', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('155', '1', '2013-06-27 01:11:53', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('156', '1', '2013-06-27 01:13:28', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('157', '5', '2013-06-27 01:18:17', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('158', '1', '2013-06-27 01:27:15', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('159', '1', '2013-06-27 01:36:11', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('160', '1', '2013-06-27 01:41:10', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('161', '5', '2013-06-27 12:48:27', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('162', '5', '2013-06-27 12:49:31', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('163', '1', '2013-06-27 12:51:16', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('164', '5', '2013-06-27 12:51:28', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('165', '5', '2013-06-27 12:51:54', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('166', '5', '2013-06-27 12:52:36', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('167', '5', '2013-06-27 12:53:56', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('168', '5', '2013-06-27 13:10:19', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('169', '5', '2013-06-27 13:14:20', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('170', '1', '2013-06-27 13:16:40', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('171', '3', '2013-06-27 16:43:35', '1', '172.1.5.69', '用户登录成功');
INSERT INTO `loginlog` VALUES ('172', '5', '2013-06-27 16:53:00', '1', '172.1.5.69', '用户登录成功');
INSERT INTO `loginlog` VALUES ('173', '5', '2013-06-27 17:46:48', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('174', '1', '2013-06-27 17:47:12', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('175', '5', '2013-06-27 18:44:08', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('176', '1', '2013-06-27 19:40:24', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('177', '1', '2013-06-27 20:39:13', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('178', '1', '2013-06-27 22:07:41', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('179', '5', '2013-06-27 22:30:51', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('180', '1', '2013-06-27 22:48:18', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('181', '1', '2013-06-27 23:01:25', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('182', '5', '2013-06-27 23:18:11', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('183', '1', '2013-06-27 23:20:17', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('184', '5', '2013-06-27 23:24:03', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('185', '1', '2013-06-28 01:00:33', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('186', '1', '2013-06-28 09:17:28', '1', '169.254.94.47', '用户登录成功');
INSERT INTO `loginlog` VALUES ('187', '5', '2013-06-28 11:22:30', '0', '169.254.94.47', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('188', '1', '2013-06-28 11:22:38', '1', '169.254.94.47', '用户登录成功');
INSERT INTO `loginlog` VALUES ('189', '5', '2013-06-28 22:16:24', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('190', '1', '2013-06-28 22:27:56', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('191', '5', '2013-06-28 22:30:02', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('192', '1', '2013-06-28 23:14:59', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('193', '1', '2013-06-28 23:21:56', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('194', '5', '2013-06-28 23:27:55', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('195', '1', '2013-06-28 23:33:26', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('196', '5', '2013-06-28 23:37:54', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('197', '1', '2013-06-28 23:38:53', '0', '10.10.5.35', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('198', '1', '2013-06-28 23:38:58', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('199', '1', '2013-06-28 23:40:40', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('200', '1', '2013-06-28 23:42:09', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('201', '5', '2013-06-28 23:43:50', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('202', '1', '2013-06-28 23:55:38', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('203', '1', '2013-06-29 00:11:42', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('204', '1', '2013-06-29 00:26:09', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('205', '1', '2013-06-29 00:47:58', '1', '10.10.5.35', '用户登录成功');
INSERT INTO `loginlog` VALUES ('206', '1', '2013-06-29 11:06:28', '0', '10.10.5.238', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('207', '1', '2013-06-29 11:06:34', '0', '10.10.5.238', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('208', '1', '2013-06-29 11:06:50', '1', '10.10.5.238', '用户登录成功');
INSERT INTO `loginlog` VALUES ('209', '1', '2013-06-29 11:07:59', '1', '10.10.5.238', '用户登录成功');
INSERT INTO `loginlog` VALUES ('210', '1', '2013-06-29 11:12:38', '0', '10.10.5.238', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('211', '1', '2013-06-29 11:12:45', '1', '10.10.5.238', '用户登录成功');
INSERT INTO `loginlog` VALUES ('212', '1', '2013-06-29 11:17:05', '1', '10.10.5.238', '用户登录成功');
INSERT INTO `loginlog` VALUES ('213', '1', '2013-06-29 14:21:03', '1', '10.10.5.238', '用户登录成功');
INSERT INTO `loginlog` VALUES ('214', '1', '2013-06-29 15:54:19', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('215', '1', '2013-06-30 00:05:22', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('216', '1', '2013-06-30 00:08:54', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('217', '1', '2013-06-30 00:09:23', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('218', '1', '2013-06-30 00:09:28', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('219', '1', '2013-06-30 01:13:55', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('220', '1', '2013-06-30 03:04:52', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('221', '5', '2013-06-30 13:54:38', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('222', '1', '2013-06-30 13:54:46', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('223', '1', '2013-06-30 19:43:57', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('224', '1', '2013-06-30 19:45:40', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('225', '5', '2013-06-30 19:50:54', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('226', '1', '2013-06-30 19:54:27', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('227', '1', '2013-06-30 20:15:15', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('228', '1', '2013-06-30 23:52:17', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('229', '1', '2013-07-01 11:07:51', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('230', '1', '2013-07-01 11:09:42', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('231', '1', '2013-07-01 14:17:54', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('232', '1', '2013-07-01 14:21:57', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('233', '1', '2013-07-01 14:50:04', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('234', '1', '2013-07-01 14:52:49', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('235', '5', '2013-07-01 15:54:08', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('236', '2', '2013-07-01 16:48:13', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('237', '1', '2013-07-01 17:20:37', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('238', '3', '2013-07-01 18:01:42', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('239', '1', '2013-07-01 18:11:18', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('240', '1', '2013-07-01 18:14:22', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('241', '1', '2013-07-01 18:15:30', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('242', '1', '2013-07-01 18:16:52', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('243', '1', '2013-07-01 18:18:59', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('244', '1', '2013-07-01 22:53:54', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('245', '1', '2013-07-02 08:43:40', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('246', '1', '2013-07-02 08:53:25', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('247', '1', '2013-07-02 09:04:39', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('248', '1', '2013-07-02 09:35:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('249', '1', '2013-07-02 09:41:06', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('250', '1', '2013-07-02 09:42:32', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('251', '1', '2013-07-02 09:51:24', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('252', '1', '2013-07-02 10:12:27', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('253', '1', '2013-07-02 10:50:38', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('254', '1', '2013-07-02 10:54:15', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('255', '1', '2013-07-02 11:00:23', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('256', '1', '2013-07-02 11:02:20', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('257', '1', '2013-07-02 11:08:48', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('258', '1', '2013-07-02 14:45:05', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('259', '1', '2013-07-02 17:47:18', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('260', '1', '2013-07-02 17:55:31', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('261', '1', '2013-07-02 18:33:16', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('262', '1', '2013-07-02 18:33:32', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('263', '1', '2013-07-02 18:34:10', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('264', '1', '2013-07-02 18:35:40', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('265', '1', '2013-07-02 18:38:55', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('266', '1', '2013-07-02 18:46:36', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('267', '1', '2013-07-02 18:49:53', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('268', '1', '2013-07-02 18:55:00', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('269', '1', '2013-07-02 18:55:43', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('270', '1', '2013-07-02 18:57:13', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('271', '5', '2013-07-02 19:15:53', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('272', '3', '2013-07-02 19:16:00', '0', '169.254.218.46', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('273', '1', '2013-07-02 19:16:05', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('274', '1', '2013-07-02 19:45:08', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('275', '1', '2013-07-02 20:11:13', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('276', '1', '2013-07-02 20:22:59', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('277', '1', '2013-07-02 21:19:14', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('278', '1', '2013-07-02 21:25:08', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('279', '1', '2013-07-02 21:30:46', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('280', '1', '2013-07-02 21:38:00', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('281', '1', '2013-07-02 21:42:04', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('282', '1', '2013-07-02 21:57:00', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('283', '1', '2013-07-02 22:12:07', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('284', '1', '2013-07-02 22:23:53', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('285', '1', '2013-07-02 22:44:20', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('286', '1', '2013-07-02 23:11:40', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('287', '1', '2013-07-02 23:29:14', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('288', '1', '2013-07-02 23:34:24', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('289', '1', '2013-07-02 23:36:09', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('290', '3', '2013-07-02 23:53:05', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('291', '3', '2013-07-02 23:54:39', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('292', '1', '2013-07-03 01:50:56', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('293', '1', '2013-07-03 10:23:53', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('294', '1', '2013-07-03 11:12:28', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('295', '1', '2013-07-03 11:55:29', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('296', '1', '2013-07-03 12:33:29', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('297', '3', '2013-07-03 13:06:19', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('298', '1', '2013-07-03 13:14:28', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('299', '1', '2013-07-03 15:46:05', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('300', '1', '2013-07-03 15:46:12', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('301', '1', '2013-07-03 15:51:59', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('302', '1', '2013-07-03 16:16:01', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('303', '1', '2013-07-03 17:42:21', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('304', '1', '2013-07-03 18:16:30', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('305', '1', '2013-07-03 18:50:58', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('306', '1', '2013-07-03 19:00:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('307', '1', '2013-07-03 19:57:07', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('308', '1', '2013-07-03 19:57:28', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('309', '1', '2013-07-03 19:57:59', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('310', '1', '2013-07-03 19:58:08', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('311', '1', '2013-07-04 00:23:14', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('312', '1', '2013-07-04 01:03:57', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('313', '1', '2013-07-04 01:12:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('314', '1', '2013-07-04 01:25:45', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('315', '1', '2013-07-04 02:25:43', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('316', '1', '2013-07-04 02:53:29', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('317', '1', '2013-07-04 03:01:01', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('318', '1', '2013-07-04 03:26:14', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('319', '1', '2013-07-04 03:29:17', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('320', '1', '2013-07-04 05:04:07', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('321', '1', '2013-07-04 05:06:15', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('322', '1', '2013-07-04 05:24:08', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('323', '1', '2013-07-04 05:38:29', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('324', '1', '2013-07-04 05:56:40', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('325', '1', '2013-07-04 13:16:46', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('326', '1', '2013-07-04 13:30:02', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('327', '1', '2013-07-04 13:36:20', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('328', '1', '2013-07-04 13:38:44', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('329', '1', '2013-07-04 13:41:33', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('330', '1', '2013-07-04 13:43:20', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('331', '1', '2013-07-04 14:04:28', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('332', '2', '2013-07-04 14:09:02', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('333', '1', '2013-07-04 14:28:06', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('334', '1', '2013-07-04 14:31:41', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('335', '1', '2013-07-04 14:34:15', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('336', '1', '2013-07-04 14:42:14', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('337', '1', '2013-07-04 15:09:42', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('338', '1', '2013-07-04 15:26:12', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('339', '1', '2013-07-04 15:29:48', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('340', '1', '2013-07-04 15:43:50', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('341', '1', '2013-07-04 15:53:03', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('342', '1', '2013-07-04 16:19:58', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('343', '1', '2013-07-04 16:22:06', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('344', '1', '2013-07-04 16:34:22', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('345', '1', '2013-07-04 16:39:19', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('346', '1', '2013-07-04 16:42:34', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('347', '1', '2013-07-04 16:49:09', '1', '172.1.5.45', '用户登录成功');
INSERT INTO `loginlog` VALUES ('348', '1', '2013-07-04 17:53:00', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('349', '1', '2013-07-04 17:55:05', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('350', '1', '2013-07-04 17:57:23', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('351', '1', '2013-07-04 20:28:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('352', '1', '2013-07-04 22:53:18', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('353', '1', '2013-07-04 22:54:45', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('354', '1', '2013-07-04 23:08:10', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('355', '1', '2013-07-04 23:12:17', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('356', '1', '2013-07-04 23:18:40', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('357', '1', '2013-07-04 23:24:01', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('358', '1', '2013-07-05 01:25:24', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('359', '1', '2013-07-05 01:49:58', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('360', '1', '2013-07-05 08:35:24', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('361', '1', '2013-07-05 12:27:57', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('362', '1', '2013-07-05 23:45:29', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('363', '1', '2013-07-06 00:27:27', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('364', '1', '2013-07-06 11:56:07', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('365', '1', '2013-07-06 12:57:50', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('366', '1', '2013-07-06 13:05:44', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('367', '1', '2013-07-06 13:11:11', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('368', '1', '2013-07-06 13:28:26', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('369', '1', '2013-07-06 13:40:58', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('370', '1', '2013-07-06 13:47:12', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('371', '3', '2013-07-06 14:09:13', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('372', '1', '2013-07-06 14:17:38', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('373', '1', '2013-07-06 14:27:42', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('374', '1', '2013-07-06 15:29:22', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('375', '1', '2013-07-06 15:38:03', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('376', '3', '2013-07-06 15:50:45', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('377', '1', '2013-07-06 15:53:51', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('378', '1', '2013-07-06 15:58:26', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('379', '3', '2013-07-06 16:02:32', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('380', '3', '2013-07-06 16:06:51', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('381', '1', '2013-07-06 16:12:12', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('382', '1', '2013-07-06 16:19:04', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('383', '1', '2013-07-06 16:27:11', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('384', '1', '2013-07-06 16:30:26', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('385', '1', '2013-07-06 16:33:43', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('386', '1', '2013-07-06 16:43:57', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('387', '1', '2013-07-06 16:59:38', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('388', '1', '2013-07-06 17:20:34', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('389', '1', '2013-07-06 17:35:41', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('390', '5', '2013-07-06 17:55:20', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('391', '1', '2013-07-06 17:57:11', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('392', '1', '2013-07-06 18:15:54', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('393', '5', '2013-07-06 18:36:25', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('394', '1', '2013-07-06 19:35:04', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('395', '1', '2013-07-06 19:37:13', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('396', '1', '2013-07-06 19:55:25', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('397', '1', '2013-07-06 20:06:05', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('398', '1', '2013-07-06 22:03:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('399', '1', '2013-07-06 22:08:39', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('400', '1', '2013-07-06 22:14:27', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('401', '1', '2013-07-06 22:23:54', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('402', '1', '2013-07-06 22:55:54', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('403', '1', '2013-07-06 23:54:27', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('404', '1', '2013-07-06 23:56:02', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('405', '1', '2013-07-06 23:57:45', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('406', '1', '2013-07-07 00:11:13', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('407', '1', '2013-07-07 01:17:51', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('408', '1', '2013-07-07 01:19:55', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('409', '1', '2013-07-07 02:31:05', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('410', '1', '2013-07-07 02:39:09', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('411', '1', '2013-07-07 02:43:34', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('412', '1', '2013-07-07 02:49:06', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('413', '1', '2013-07-07 02:51:01', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('414', '1', '2013-07-07 02:56:56', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('415', '1', '2013-07-07 03:36:21', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('416', '1', '2013-07-07 03:42:29', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('417', '1', '2013-07-07 04:13:14', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('418', '1', '2013-07-07 11:08:57', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('419', '1', '2013-07-07 11:31:28', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('420', '1', '2013-07-07 11:31:31', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('421', '1', '2013-07-07 11:31:35', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('422', '1', '2013-07-07 11:49:15', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('423', '1', '2013-07-07 12:08:20', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('424', '1', '2013-07-07 12:27:11', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('425', '1', '2013-07-07 13:42:26', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('426', '1', '2013-07-07 13:42:34', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('427', '1', '2013-07-07 13:52:10', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('428', '1', '2013-07-07 13:58:02', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('429', '1', '2013-07-07 14:36:57', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('430', '1', '2013-07-07 14:40:43', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('431', '1', '2013-07-07 15:02:04', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('432', '1', '2013-07-07 16:19:44', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('433', '1', '2013-07-07 16:57:17', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('434', '1', '2013-07-07 17:09:16', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('435', '1', '2013-07-07 17:13:19', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('436', '1', '2013-07-07 17:15:21', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('437', '1', '2013-07-07 17:18:02', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('438', '1', '2013-07-07 17:31:23', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('439', '1', '2013-07-07 19:31:03', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('440', '1', '2013-07-07 19:36:22', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('441', '1', '2013-07-07 19:36:33', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('442', '1', '2013-07-07 19:52:10', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('443', '1', '2013-07-07 22:12:38', '1', '10.10.5.145', '用户登录成功');
INSERT INTO `loginlog` VALUES ('444', '1', '2013-07-07 22:23:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('445', '1', '2013-07-07 23:03:21', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('446', '1', '2013-07-07 23:10:39', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('447', '1', '2013-07-07 23:14:59', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('448', '1', '2013-07-07 23:17:12', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('449', '1', '2013-07-07 23:21:21', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('450', '1', '2013-07-08 00:43:26', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('451', '5', '2013-07-08 01:02:48', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('452', '5', '2013-07-08 01:02:53', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('453', '1', '2013-07-08 01:26:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('454', '1', '2013-07-08 01:38:15', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('455', '1', '2013-07-08 02:32:47', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('456', '1', '2013-07-08 02:49:53', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('457', '4', '2013-07-08 02:53:38', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('458', '2', '2013-07-08 02:57:02', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('459', '3', '2013-07-08 03:03:11', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('460', '5', '2013-07-08 03:12:44', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('461', '5', '2013-07-08 03:12:55', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('462', '1', '2013-07-08 03:21:05', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('463', '3', '2013-07-08 03:21:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('464', '2', '2013-07-08 03:22:34', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('465', '1', '2013-07-08 03:30:08', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('466', '1', '2013-07-08 04:07:43', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('467', '1', '2013-07-08 04:20:23', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('468', '5', '2013-07-08 04:53:56', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('469', '5', '2013-07-08 04:54:06', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('470', '1', '2013-07-08 04:54:15', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('471', '1', '2013-07-08 11:45:32', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('472', '1', '2013-07-08 12:46:14', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('473', '1', '2013-07-08 12:51:37', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('474', '1', '2013-07-08 12:51:46', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('475', '1', '2013-07-08 14:20:39', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('476', '1', '2013-07-08 14:32:52', '1', '172.1.5.91', '用户登录成功');
INSERT INTO `loginlog` VALUES ('477', '1', '2013-07-08 15:21:22', '1', '172.1.5.91', '用户登录成功');
INSERT INTO `loginlog` VALUES ('478', '5', '2013-07-08 16:00:14', '1', '172.1.5.91', '用户登录成功');
INSERT INTO `loginlog` VALUES ('479', '5', '2013-07-08 16:15:05', '1', '172.1.5.91', '用户登录成功');
INSERT INTO `loginlog` VALUES ('480', '5', '2013-07-08 16:17:36', '1', '172.1.5.91', '用户登录成功');
INSERT INTO `loginlog` VALUES ('481', '1', '2013-07-08 18:26:21', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('482', '1', '2013-07-08 18:55:38', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('483', '1', '2013-07-08 20:39:31', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('484', '1', '2013-07-09 00:06:42', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('485', '1', '2013-07-09 00:09:27', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('486', '1', '2013-07-09 10:55:05', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('487', '1', '2013-07-09 12:36:29', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('488', '1', '2013-07-09 14:53:14', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('489', '1', '2013-07-09 15:00:04', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('490', '1', '2013-07-09 15:22:40', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('491', '1', '2013-07-09 15:26:31', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('492', '1', '2013-07-09 15:55:49', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('493', '1', '2013-07-09 15:57:58', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('494', '1', '2013-07-09 16:29:23', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('495', '1', '2013-07-09 16:35:27', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('496', '1', '2013-07-09 17:21:08', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('497', '1', '2013-07-09 17:24:26', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('498', '1', '2013-07-09 17:33:15', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('499', '1', '2013-07-09 17:36:13', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('500', '1', '2013-07-09 18:22:42', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('501', '1', '2013-07-09 18:25:07', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('502', '1', '2013-07-09 18:36:30', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('503', '1', '2013-07-09 19:25:02', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('504', '1', '2013-07-09 19:31:45', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('505', '1', '2013-07-09 19:37:14', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('506', '1', '2013-07-09 19:42:56', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('507', '1', '2013-07-09 19:48:37', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('508', '1', '2013-07-09 19:51:52', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('509', '1', '2013-07-09 20:29:06', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('510', '1', '2013-07-09 20:33:38', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('511', '1', '2013-07-09 20:48:22', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('512', '1', '2013-07-09 22:26:26', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('513', '1', '2013-07-09 22:47:00', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('514', '1', '2013-07-09 23:36:55', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('515', '5', '2013-07-09 23:44:00', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('516', '3', '2013-07-09 23:48:57', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('517', '5', '2013-07-09 23:51:57', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('518', '3', '2013-07-09 23:59:21', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('519', '3', '2013-07-09 23:59:36', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('520', '5', '2013-07-10 00:02:08', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('521', '1', '2013-07-10 00:06:06', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('522', '5', '2013-07-10 00:06:51', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('523', '5', '2013-07-10 00:08:35', '0', '127.0.0.1', '用户登录失败，用户名或密码不正确');
INSERT INTO `loginlog` VALUES ('524', '5', '2013-07-10 00:08:41', '1', '127.0.0.1', '用户登录成功');
INSERT INTO `loginlog` VALUES ('525', '5', '2013-07-10 00:10:38', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('526', '1', '2013-07-10 00:11:03', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('527', '1', '2013-07-10 00:23:00', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('528', '5', '2013-07-10 00:34:06', '1', '169.254.218.46', '用户登录成功');
INSERT INTO `loginlog` VALUES ('529', '1', '2013-07-10 01:42:23', '1', '127.0.0.1', '用户登录成功');

-- ----------------------------
-- Table structure for `machine`
-- ----------------------------
DROP TABLE IF EXISTS `machine`;
CREATE TABLE `machine` (
  `machineId` int(11) NOT NULL auto_increment,
  `machineName` varchar(50) NOT NULL,
  `machineShortName` varchar(50) default NULL,
  PRIMARY KEY  (`machineId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of machine
-- ----------------------------
INSERT INTO `machine` VALUES ('1', '华北电力科学研究院', '华电');
INSERT INTO `machine` VALUES ('3', '中国科学院声学研究所', '中科声研究所');
INSERT INTO `machine` VALUES ('5', '北大青鸟集团', '青鸟');
INSERT INTO `machine` VALUES ('13', '大唐国际盘山发电有限公司', '盘电');
INSERT INTO `machine` VALUES ('17', '国防科大计算机研究所', '国机所');
INSERT INTO `machine` VALUES ('18', '华北电力科学研究院1', '华电2');

-- ----------------------------
-- Table structure for `manualsign`
-- ----------------------------
DROP TABLE IF EXISTS `manualsign`;
CREATE TABLE `manualsign` (
  `signId` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL,
  `signTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `signDesc` varchar(200) default NULL,
  `signTag` int(11) default NULL,
  PRIMARY KEY  (`signId`),
  KEY `userId` (`userId`),
  CONSTRAINT `manualsign_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manualsign
-- ----------------------------
INSERT INTO `manualsign` VALUES ('13', '1', '2007-12-06 07:36:14', '测试一下', '1');
INSERT INTO `manualsign` VALUES ('14', '2', '2007-12-06 10:36:29', '测试一下', '0');
INSERT INTO `manualsign` VALUES ('17', '3', '2007-12-06 08:56:22', '上午报到', '1');
INSERT INTO `manualsign` VALUES ('18', '1', '2007-12-06 08:03:20', '签到测试.', '1');
INSERT INTO `manualsign` VALUES ('19', '2', '2007-12-06 17:03:34', '签退测试.', '0');
INSERT INTO `manualsign` VALUES ('20', '4', '2007-12-06 17:40:00', '我是博望老总。', '1');
INSERT INTO `manualsign` VALUES ('21', '2', '2007-12-06 17:40:58', '今天员工可以提前回家。', '0');
INSERT INTO `manualsign` VALUES ('22', '1', '2013-07-08 05:00:11', ', ', '1');
INSERT INTO `manualsign` VALUES ('23', '1', '2013-07-08 05:00:15', ', ', '0');

-- ----------------------------
-- Table structure for `meetinginfo`
-- ----------------------------
DROP TABLE IF EXISTS `meetinginfo`;
CREATE TABLE `meetinginfo` (
  `MeetingId` int(11) NOT NULL auto_increment,
  `MeetingName` varchar(50) NOT NULL,
  PRIMARY KEY  (`MeetingId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetinginfo
-- ----------------------------
INSERT INTO `meetinginfo` VALUES ('1', '公司年会');
INSERT INTO `meetinginfo` VALUES ('2', '机构会议');
INSERT INTO `meetinginfo` VALUES ('3', '部门会议');
INSERT INTO `meetinginfo` VALUES ('4', '小组会议');
INSERT INTO `meetinginfo` VALUES ('5', '外部合作会议');

-- ----------------------------
-- Table structure for `memu`
-- ----------------------------
DROP TABLE IF EXISTS `memu`;
CREATE TABLE `memu` (
  `memuId` int(11) NOT NULL auto_increment,
  `displayName` varchar(50) NOT NULL,
  `memuUrl` varchar(50) NOT NULL,
  `displayOrder` int(11) default NULL,
  `parentNodeId` int(11) NOT NULL,
  PRIMARY KEY  (`memuId`)
) ENGINE=InnoDB AUTO_INCREMENT=106004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of memu
-- ----------------------------
INSERT INTO `memu` VALUES ('101', '人事管理', '', '3', '0');
INSERT INTO `memu` VALUES ('102', '日程管理', '', '6', '0');
INSERT INTO `memu` VALUES ('103', '文档管理', '', '4', '0');
INSERT INTO `memu` VALUES ('104', '消息传递', '', '5', '0');
INSERT INTO `memu` VALUES ('105', '系统管理', '', '1', '0');
INSERT INTO `memu` VALUES ('106', '考勤管理', ' ', '2', '0');
INSERT INTO `memu` VALUES ('101001', '机构信息', 'per/machine!list.action', '7', '101');
INSERT INTO `memu` VALUES ('101002', '部门信息', 'per/dept!list.action', '9', '101');
INSERT INTO `memu` VALUES ('101003', '员工管理', 'per/users!list.action', '8', '101');
INSERT INTO `memu` VALUES ('102001', '我的日程', 'calendar/schedule!list.action', '11', '102');
INSERT INTO `memu` VALUES ('102002', '部门日程', 'calendar/schedule!seldept.action', '12', '102');
INSERT INTO `memu` VALUES ('102003', '我的便签', 'calendar/note!list.action', '10', '102');
INSERT INTO `memu` VALUES ('103001', '文档管理', 'file/file_info!list.action', '14', '103');
INSERT INTO `memu` VALUES ('103002', '回收站', 'file/file_info!recyle.action', '13', '103');
INSERT INTO `memu` VALUES ('103003', '文件搜索', 'file/file_info!fmseach.action', '15', '103');
INSERT INTO `memu` VALUES ('104001', '消息管理', 'message/message!list.action', '16', '104');
INSERT INTO `memu` VALUES ('104002', '信箱', 'message/email!list.action', '17', '104');
INSERT INTO `memu` VALUES ('105001', '角色管理', 'sys/role!list.action', '20', '105');
INSERT INTO `memu` VALUES ('105002', '登录日志', 'sys/loginlog!list.action', '21', '105');
INSERT INTO `memu` VALUES ('105003', '操作日志', 'sys/operatelog!list.action', '19', '105');
INSERT INTO `memu` VALUES ('105004', '菜单排序', 'sys/memu!list.action', '18', '105');
INSERT INTO `memu` VALUES ('106001', '员工签到、签退', 'attendance/manual_sign!sign.action', '22', '106');
INSERT INTO `memu` VALUES ('106002', '考勤历史查询', 'attendance/manual_sign!search.action', '23', '106');
INSERT INTO `memu` VALUES ('106003', '考勤统计', 'attendance/manual_sign!total.action', '24', '106');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `beginTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `endTime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `fromUserId` int(11) NOT NULL,
  `ifPublish` int(11) default NULL,
  `recordTime` timestamp NULL default NULL,
  `publishObject` varchar(255) default NULL,
  `ifDelete` int(11) default NULL,
  PRIMARY KEY  (`messageId`),
  KEY `fromUserId` (`fromUserId`),
  KEY `type` (`type`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`fromUserId`) REFERENCES `users` (`userId`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`type`) REFERENCES `messagetype` (`messageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('2', '项目答辩了', '是对方说道放松放松的放松放松放松对方身份到', '2', '2013-07-06 17:24:50', '2013-03-29 00:00:00', '1', '1', '2013-07-02 16:45:42', '所有人', '0');
INSERT INTO `message` VALUES ('5', '放假通知', '阿四大四大打开来捡垃圾的撒加大了', '1', '2013-07-02 10:16:40', '2013-03-30 00:00:00', '2', '1', '2013-03-06 19:17:50', '杨嘉丽 ', '0');
INSERT INTO `message` VALUES ('10', '观看韩剧', '今天下午有没有人，一起看韩剧滴啊 ？', '1', '2013-07-06 17:24:38', '2013-03-29 00:00:00', '3', '1', '2013-03-06 23:20:28', '所有人', '0');
INSERT INTO `message` VALUES ('11', '校篮球比赛', '本校将举办一场篮球比赛，望有此爱好的同学积极参与！', '1', '2013-07-06 17:24:35', '2013-03-29 00:00:00', '2', '1', '2013-03-06 23:20:33', '所有人', '0');
INSERT INTO `message` VALUES ('12', '放假通知', '阿四大四大打开来捡垃圾的撒加大了sdfsdfsfsdfsf', '1', '2013-07-07 15:26:15', '2013-03-30 00:00:00', '4', '1', '2013-03-07 09:04:17', ' 丽丽 ,齐静雪, 疼长今 ', '0');
INSERT INTO `message` VALUES ('16', '我就要修改了', '我还要再修改', '1', '2013-07-07 15:26:23', '2013-07-11 12:00:00', '5', '1', '2013-07-06 23:58:48', '所有人', '0');
INSERT INTO `message` VALUES ('17', '岳麓山一日游', '在这个炎热的夏天，让我们一起出去玩吧', '1', '2013-07-06 12:00:00', '2013-07-17 16:47:12', '1', '1', '2013-07-07 00:19:10', '谭石安,向宇哲', '0');
INSERT INTO `message` VALUES ('18', '即将结束的学习', '马上要离开了 真有点舍不得 啊', '1', '2013-07-06 12:00:00', '2013-07-09 17:03:59', '1', '1', '2013-07-06 23:58:12', '增华来,谭石安', '0');
INSERT INTO `message` VALUES ('22', '停电了啊 ', '真坑爹啊，今天居然挺电了，你妹的', '2', '2013-07-07 15:05:55', '2013-07-07 01:16:47', '1', '1', '2013-07-04 15:05:48', '聂恒,聂超', null);
INSERT INTO `message` VALUES ('23', '一飞机失事', '昨日一飞机，失事，导致两名中国籍男子丧身！', '2', '2013-07-08 20:35:42', '2013-07-08 20:35:51', '1', '1', '2013-07-09 21:51:05', '所有人', null);
INSERT INTO `message` VALUES ('24', '一起做项目', '快要毕业了，让我们一起做项目吧', '1', '2013-07-07 12:00:00', '2013-07-09 12:00:00', '1', '1', '2013-07-07 23:52:57', '所有人', '0');
INSERT INTO `message` VALUES ('25', 'T127班班会', '马上我们就要离开学校了,不知道大家有什么打算，在离开之前，我们改搞个什么活动呢？', '2', '2013-07-07 12:00:00', '2013-07-09 12:00:00', '1', '0', null, '所有人', '0');
INSERT INTO `message` VALUES ('26', '一起去吃烧烤', '项目搞忘了，我们一起去吃烧烤好不好啊，', '1', '2013-07-07 12:00:00', '2013-07-17 12:00:00', '1', '1', '2013-07-07 23:59:17', '聂超,聂恒,李璇,李海军', '0');
INSERT INTO `message` VALUES ('27', '星期五项目答辩', '经期各位同学，项目做得都非常用心，不过我们马上要答辩了，你们准备好了了吗', '1', '2013-07-08 12:00:00', '2013-07-10 12:00:00', '1', '1', '2013-07-08 00:17:55', '所有人', '0');
INSERT INTO `message` VALUES ('28', '谁网银有钱啊？', '我要在淘宝上买东西，谁网银有钱啊，救急啊 ，快点送到209来啊', '2', '2013-07-08 12:00:00', '2013-07-10 12:00:00', '1', '0', null, '陈家顺,陈一按,李璇,李海军,涂星', '0');
INSERT INTO `message` VALUES ('29', '测试而已', '返回一个String对象。用参数after字符串替换参数string中所有出现参数回一个String参数after字符串替', '1', '2013-07-08 12:00:00', '2013-07-17 12:00:00', '1', '1', '2013-07-08 00:17:31', '陈家顺,陈一按,李璇,李海军,聂超,聂恒', '0');
INSERT INTO `message` VALUES ('30', '在傍晚2一起呗拉长', '因为捞鱼的纯游戏，我们开始教堂，游园会开始在播放，这个世界约会开始一起逛', '1', '2013-07-08 12:00:00', '2013-07-10 12:00:00', '5', '1', '2013-07-08 01:04:40', '李璇,李海军,聂恒,陈家顺', '0');
INSERT INTO `message` VALUES ('31', '晚上睡得晚的很', '今天天气真他妈的热，害的我晚上都谁不着叫啊', '1', '2013-07-08 12:00:00', '2013-07-10 12:00:00', '4', '1', '2013-07-08 02:56:39', '所有人', '0');
INSERT INTO `message` VALUES ('32', '快乐的方式可以有太多种', '路过没有罗国，清楚是没有画过的寂寞，岁月 给了我快乐的反思', '2', '2013-07-08 12:00:00', '2013-07-12 12:00:00', '4', '1', '2013-07-08 02:56:37', '陈家顺,陈一按,聂超', '0');
INSERT INTO `message` VALUES ('33', '你还好吗', '现在的爱情，爱回来就会去，在不同的的城市里，这样的我，那样的你，要很久才会相聚，我们的眼泪在放着过去', '2', '2013-07-08 12:00:00', '2013-07-16 12:00:00', '2', '1', '2013-07-08 03:02:12', '欧阳广,聂超,聂恒', '0');
INSERT INTO `message` VALUES ('34', '窗外的事 爱哭多人', '心还痛吗，所谓喜欢诗歌童话，所以没关系，在不用的城市里，偶尔也会想起你，我们也没提那故事的原因', '1', '2013-07-08 12:00:00', '2013-07-10 12:00:00', '2', '1', '2013-07-08 03:25:21', '所有人', '0');
INSERT INTO `message` VALUES ('35', '没有花，这刹那被破坏', '是你心中，为何不浪漫是罪名，从来没察觉我，每个动作，什么都不用一生保证，没有花，这刹那被破坏吗', '1', '2013-07-08 12:00:00', '2013-07-09 12:00:00', '3', '1', '2013-07-08 03:22:24', '朱文玉,陈家顺,腾长今', '0');
INSERT INTO `message` VALUES ('36', '我没有事你心中的定义', '是你，为了你，是你的笑脸，微暖了我我的心只有你懂，在你这里，我找到星空，看见你就会让我想起，都是你让我那么怪异，', '1', '2013-07-08 12:00:00', '2013-07-11 12:00:00', '3', '1', '2013-07-08 03:09:38', '卢卡申,陈一按,李海军', '0');
INSERT INTO `message` VALUES ('37', '我会好好的', '你来过，你就走我不问理由，我会好好过等你来爱我，总共有个角落，会让你来爱我，你的爱很像泡沫，我的爱就像天空，太放火太收你来过却爱上自由，你就走我不问理由，我会好好过', '2', '2013-07-08 12:00:00', '2013-07-10 12:00:00', '3', '0', null, '增华来,谭石安,陈家顺', '0');
INSERT INTO `message` VALUES ('38', '不完整的旋律', '心里有个绚丽，不完整的歌曲，你是否听的出来，我堕落一排，最近时间有点奇怪，心里那个绚丽，如果你在今天，说实在我也不缺，怎样比较好听', '1', '2013-07-08 12:00:00', '2013-07-09 12:00:00', '5', '1', '2013-07-08 03:17:34', '陈家顺,腾长今,朱文玉', '0');
INSERT INTO `message` VALUES ('39', '外婆的生日', '今天是外婆生日，我拉着外婆，我换上复古西装，外婆他的期待，大人们始终不没明白，外婆他的无奈，走在挡水河畔，把温暖换回口袋', '1', '2013-07-08 12:00:00', '2013-07-09 12:00:00', '5', '0', null, '陈家顺,腾长今,朱文玉', '0');
INSERT INTO `message` VALUES ('40', '都怪雨下的那么急', '都怪雨下的那么急，都怪梦境太迷离，都怪你声音太完不了你温柔标签，不管上天下的，猜不透这是什么道理，难道这就是他们说的爱情，已悄悄传进心里，都怪美景太美丽', '1', '2013-07-08 12:00:00', '2013-07-09 12:00:00', '5', '1', '2013-07-08 03:20:14', '隋唐,徐碧芳,涂星,聂恒,增华来,谭石安,陈家顺,陈一按', '0');
INSERT INTO `message` VALUES ('41', '爱我别走，我没有你的消息', '爱我别走，若果你说，你不爱我，不要听见你真的说出口，走在，夜里的寂寞，容易叫人悲伤，因为我一个人，元面额来，一个人走在漫无目的的街道，爱我别走，若果你说不爱我，不要听见你真的说出口', '1', '2013-07-08 12:00:00', '2013-07-10 12:00:00', '2', '1', '2013-07-08 03:28:36', '增华来,谭石安,李璇,段志刚,肖成,陈家顺', '0');
INSERT INTO `message` VALUES ('42', '离开以后', '关了灯的房间，没有人会拍黑，只剩下的热咖啡，会议后的过去，分手后的那一夜，没有酒没有可惜那个人已经不是我，离开我以后有更快乐，最美的痕迹叫做回忆，可是不是你', '1', '2013-07-08 12:00:00', '2013-07-17 12:00:00', '2', '0', null, '陈家顺,陈一按', '0');
INSERT INTO `message` VALUES ('43', '最美的痕迹叫做回忆', '黑暗将我包围，可惜那个人意见不是我，分开了以后就当做没见过，最美的痕迹叫做回忆，离开我以后，有没有更快可', '1', '2013-07-08 12:00:00', '2013-07-14 12:00:00', '2', '0', null, '朱文玉,腾长今,陈家顺', '0');

-- ----------------------------
-- Table structure for `messagetouser`
-- ----------------------------
DROP TABLE IF EXISTS `messagetouser`;
CREATE TABLE `messagetouser` (
  `id` int(11) NOT NULL auto_increment,
  `messageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `ifRead` int(11) default '0',
  PRIMARY KEY  (`id`),
  KEY `messageId` (`messageId`),
  KEY `toUserId` (`userId`),
  CONSTRAINT `messagetouser_ibfk_1` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`),
  CONSTRAINT `messagetouser_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messagetouser
-- ----------------------------
INSERT INTO `messagetouser` VALUES ('13', '2', '2', '1');
INSERT INTO `messagetouser` VALUES ('14', '2', '4', '0');
INSERT INTO `messagetouser` VALUES ('15', '5', '1', '1');
INSERT INTO `messagetouser` VALUES ('16', '5', '3', '1');
INSERT INTO `messagetouser` VALUES ('17', '10', '4', '0');
INSERT INTO `messagetouser` VALUES ('19', '11', '8', '1');
INSERT INTO `messagetouser` VALUES ('20', '12', '1', '1');
INSERT INTO `messagetouser` VALUES ('21', '12', '4', '0');
INSERT INTO `messagetouser` VALUES ('22', '12', '5', '1');
INSERT INTO `messagetouser` VALUES ('23', '12', '6', '0');
INSERT INTO `messagetouser` VALUES ('25', '17', '8', '0');
INSERT INTO `messagetouser` VALUES ('27', '18', '4', '0');
INSERT INTO `messagetouser` VALUES ('28', '22', '1', '0');
INSERT INTO `messagetouser` VALUES ('29', '16', '1', '1');
INSERT INTO `messagetouser` VALUES ('30', '16', '6', '0');
INSERT INTO `messagetouser` VALUES ('31', '24', '8', '0');
INSERT INTO `messagetouser` VALUES ('32', '24', '12', '0');
INSERT INTO `messagetouser` VALUES ('33', '24', '7', '0');
INSERT INTO `messagetouser` VALUES ('34', '24', '10', '0');
INSERT INTO `messagetouser` VALUES ('35', '24', '5', '1');
INSERT INTO `messagetouser` VALUES ('36', '24', '15', '0');
INSERT INTO `messagetouser` VALUES ('37', '24', '18', '0');
INSERT INTO `messagetouser` VALUES ('38', '24', '9', '0');
INSERT INTO `messagetouser` VALUES ('39', '24', '13', '0');
INSERT INTO `messagetouser` VALUES ('40', '24', '17', '0');
INSERT INTO `messagetouser` VALUES ('41', '24', '1', '1');
INSERT INTO `messagetouser` VALUES ('42', '24', '3', '1');
INSERT INTO `messagetouser` VALUES ('43', '24', '16', '0');
INSERT INTO `messagetouser` VALUES ('44', '24', '6', '0');
INSERT INTO `messagetouser` VALUES ('45', '24', '11', '0');
INSERT INTO `messagetouser` VALUES ('46', '24', '4', '0');
INSERT INTO `messagetouser` VALUES ('47', '24', '2', '0');
INSERT INTO `messagetouser` VALUES ('48', '24', '14', '0');
INSERT INTO `messagetouser` VALUES ('49', '29', '16', '0');
INSERT INTO `messagetouser` VALUES ('50', '29', '13', '0');
INSERT INTO `messagetouser` VALUES ('51', '29', '1', '0');
INSERT INTO `messagetouser` VALUES ('52', '29', '11', '0');
INSERT INTO `messagetouser` VALUES ('53', '29', '4', '0');
INSERT INTO `messagetouser` VALUES ('54', '29', '12', '0');
INSERT INTO `messagetouser` VALUES ('55', '27', '13', '0');
INSERT INTO `messagetouser` VALUES ('56', '27', '15', '0');
INSERT INTO `messagetouser` VALUES ('57', '27', '1', '0');
INSERT INTO `messagetouser` VALUES ('58', '27', '18', '0');
INSERT INTO `messagetouser` VALUES ('59', '27', '16', '0');
INSERT INTO `messagetouser` VALUES ('60', '27', '14', '0');
INSERT INTO `messagetouser` VALUES ('61', '27', '8', '0');
INSERT INTO `messagetouser` VALUES ('62', '27', '3', '0');
INSERT INTO `messagetouser` VALUES ('63', '27', '11', '0');
INSERT INTO `messagetouser` VALUES ('64', '27', '17', '0');
INSERT INTO `messagetouser` VALUES ('65', '27', '4', '0');
INSERT INTO `messagetouser` VALUES ('66', '27', '7', '0');
INSERT INTO `messagetouser` VALUES ('67', '27', '10', '0');
INSERT INTO `messagetouser` VALUES ('68', '27', '12', '0');
INSERT INTO `messagetouser` VALUES ('69', '27', '9', '0');
INSERT INTO `messagetouser` VALUES ('70', '27', '6', '0');
INSERT INTO `messagetouser` VALUES ('71', '27', '5', '1');
INSERT INTO `messagetouser` VALUES ('72', '27', '2', '1');
INSERT INTO `messagetouser` VALUES ('73', '30', '1', '1');
INSERT INTO `messagetouser` VALUES ('74', '30', '12', '0');
INSERT INTO `messagetouser` VALUES ('75', '30', '4', '0');
INSERT INTO `messagetouser` VALUES ('76', '30', '13', '0');
INSERT INTO `messagetouser` VALUES ('77', '32', '11', '0');
INSERT INTO `messagetouser` VALUES ('78', '32', '16', '0');
INSERT INTO `messagetouser` VALUES ('79', '32', '1', '0');
INSERT INTO `messagetouser` VALUES ('80', '31', '18', '0');
INSERT INTO `messagetouser` VALUES ('81', '31', '15', '0');
INSERT INTO `messagetouser` VALUES ('82', '31', '2', '0');
INSERT INTO `messagetouser` VALUES ('83', '31', '16', '0');
INSERT INTO `messagetouser` VALUES ('84', '31', '1', '1');
INSERT INTO `messagetouser` VALUES ('85', '31', '8', '0');
INSERT INTO `messagetouser` VALUES ('86', '31', '13', '0');
INSERT INTO `messagetouser` VALUES ('87', '31', '12', '0');
INSERT INTO `messagetouser` VALUES ('88', '31', '5', '0');
INSERT INTO `messagetouser` VALUES ('89', '31', '17', '0');
INSERT INTO `messagetouser` VALUES ('90', '31', '14', '0');
INSERT INTO `messagetouser` VALUES ('91', '31', '7', '0');
INSERT INTO `messagetouser` VALUES ('92', '31', '4', '0');
INSERT INTO `messagetouser` VALUES ('93', '31', '11', '0');
INSERT INTO `messagetouser` VALUES ('94', '31', '9', '0');
INSERT INTO `messagetouser` VALUES ('95', '31', '10', '0');
INSERT INTO `messagetouser` VALUES ('96', '31', '6', '0');
INSERT INTO `messagetouser` VALUES ('97', '31', '3', '0');
INSERT INTO `messagetouser` VALUES ('98', '33', '13', '0');
INSERT INTO `messagetouser` VALUES ('99', '33', '6', '0');
INSERT INTO `messagetouser` VALUES ('100', '33', '11', '0');
INSERT INTO `messagetouser` VALUES ('101', '36', '18', '0');
INSERT INTO `messagetouser` VALUES ('102', '36', '16', '0');
INSERT INTO `messagetouser` VALUES ('103', '36', '12', '0');
INSERT INTO `messagetouser` VALUES ('104', '38', '10', '0');
INSERT INTO `messagetouser` VALUES ('105', '38', '1', '1');
INSERT INTO `messagetouser` VALUES ('106', '38', '5', '1');
INSERT INTO `messagetouser` VALUES ('107', '40', '16', '0');
INSERT INTO `messagetouser` VALUES ('108', '40', '15', '0');
INSERT INTO `messagetouser` VALUES ('109', '40', '17', '0');
INSERT INTO `messagetouser` VALUES ('110', '40', '13', '0');
INSERT INTO `messagetouser` VALUES ('111', '40', '1', '1');
INSERT INTO `messagetouser` VALUES ('112', '40', '3', '0');
INSERT INTO `messagetouser` VALUES ('113', '40', '9', '0');
INSERT INTO `messagetouser` VALUES ('114', '40', '8', '0');
INSERT INTO `messagetouser` VALUES ('115', '35', '5', '0');
INSERT INTO `messagetouser` VALUES ('116', '35', '1', '0');
INSERT INTO `messagetouser` VALUES ('117', '35', '10', '0');
INSERT INTO `messagetouser` VALUES ('118', '34', '8', '0');
INSERT INTO `messagetouser` VALUES ('119', '34', '11', '0');
INSERT INTO `messagetouser` VALUES ('120', '34', '10', '0');
INSERT INTO `messagetouser` VALUES ('121', '34', '15', '0');
INSERT INTO `messagetouser` VALUES ('122', '34', '5', '0');
INSERT INTO `messagetouser` VALUES ('123', '34', '6', '0');
INSERT INTO `messagetouser` VALUES ('124', '34', '13', '0');
INSERT INTO `messagetouser` VALUES ('125', '34', '17', '0');
INSERT INTO `messagetouser` VALUES ('126', '34', '2', '0');
INSERT INTO `messagetouser` VALUES ('127', '34', '9', '0');
INSERT INTO `messagetouser` VALUES ('128', '34', '7', '0');
INSERT INTO `messagetouser` VALUES ('129', '34', '12', '0');
INSERT INTO `messagetouser` VALUES ('130', '34', '1', '0');
INSERT INTO `messagetouser` VALUES ('131', '34', '3', '0');
INSERT INTO `messagetouser` VALUES ('132', '34', '4', '0');
INSERT INTO `messagetouser` VALUES ('133', '34', '16', '0');
INSERT INTO `messagetouser` VALUES ('134', '34', '14', '0');
INSERT INTO `messagetouser` VALUES ('135', '34', '18', '0');
INSERT INTO `messagetouser` VALUES ('136', '41', '1', '0');
INSERT INTO `messagetouser` VALUES ('137', '41', '14', '0');
INSERT INTO `messagetouser` VALUES ('138', '41', '3', '0');
INSERT INTO `messagetouser` VALUES ('139', '41', '9', '0');
INSERT INTO `messagetouser` VALUES ('140', '41', '7', '0');
INSERT INTO `messagetouser` VALUES ('141', '41', '4', '0');

-- ----------------------------
-- Table structure for `messagetype`
-- ----------------------------
DROP TABLE IF EXISTS `messagetype`;
CREATE TABLE `messagetype` (
  `messageTypeId` int(11) NOT NULL auto_increment,
  `messageTypeName` varchar(50) NOT NULL,
  `messageDesc` varchar(50) NOT NULL,
  PRIMARY KEY  (`messageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messagetype
-- ----------------------------
INSERT INTO `messagetype` VALUES ('1', '一般消息', ' ');
INSERT INTO `messagetype` VALUES ('2', '紧急消息', '非常重要的消息，需要立刻阅读');

-- ----------------------------
-- Table structure for `mynote`
-- ----------------------------
DROP TABLE IF EXISTS `mynote`;
CREATE TABLE `mynote` (
  `noteId` int(11) NOT NULL auto_increment,
  `noteTitle` varchar(50) NOT NULL,
  `noteContent` varchar(255) default NULL,
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `createUserId` int(11) NOT NULL,
  PRIMARY KEY  (`noteId`),
  KEY `createUserId` (`createUserId`),
  CONSTRAINT `mynote_ibfk_1` FOREIGN KEY (`createUserId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mynote
-- ----------------------------
INSERT INTO `mynote` VALUES ('1', '个人工作', '记录个人今天主要工作', '2008-01-11 10:24:56', '1');
INSERT INTO `mynote` VALUES ('2', '记事本', '（1）非常轻松地扩展可复用组件\r\n（2）提高现有网页对所有流行浏览器的支持\r\n（3）与VS2005结合增强Web2.0站点的设计和应用\r\n（4）从浏览器获取远程服务或数据，不再需要编写复杂的脚本\r\n（5）Microsoft提供专门的技术论ttp://ajax.aspx.net）', '2008-01-11 10:27:15', '1');
INSERT INTO `mynote` VALUES ('3', 'Dot Net 代码规范', '代码规范', '2008-01-11 10:35:32', '1');
INSERT INTO `mynote` VALUES ('4', '教师分类毕业设计项目总结', '不少于两千字', '2008-01-11 10:36:32', '1');
INSERT INTO `mynote` VALUES ('5', '办公自动化', '项目总结', '2008-01-11 10:38:00', '1');
INSERT INTO `mynote` VALUES ('6', '快速记事快速记事快速记事快速记事快速记事', '记得中午给经理打个电话', '2008-01-11 10:43:35', '1');
INSERT INTO `mynote` VALUES ('7', '本月工作总结', '总结', '2008-01-11 10:44:19', '1');
INSERT INTO `mynote` VALUES ('10', '到的地方地方', '表格', '2013-03-09 00:00:00', '1');
INSERT INTO `mynote` VALUES ('11', 'ttt', 'dddddd', '2012-03-23 00:00:00', '1');
INSERT INTO `mynote` VALUES ('12', '今天刚添加的！', '来测试下能不能添加而已宿舍', '2013-07-08 16:00:52', '5');
INSERT INTO `mynote` VALUES ('13', '和老外去吃个饭！', '吃饭的时候顺便打他两下！解解气！', '2013-07-08 16:06:10', '5');

-- ----------------------------
-- Table structure for `operatelog`
-- ----------------------------
DROP TABLE IF EXISTS `operatelog`;
CREATE TABLE `operatelog` (
  `operateId` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL,
  `operateName` varchar(50) NOT NULL,
  `objectId` int(11) NOT NULL,
  `operateDesc` varchar(200) default NULL,
  `operateTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`operateId`),
  KEY `userId` (`userId`),
  KEY `operatelog_memu` (`objectId`),
  CONSTRAINT `operatelog_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `operatelog_memu` FOREIGN KEY (`objectId`) REFERENCES `memu` (`memuId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operatelog
-- ----------------------------
INSERT INTO `operatelog` VALUES ('1', '1', '删除', '104001', '放入回收站', '2013-06-30 19:27:04');
INSERT INTO `operatelog` VALUES ('2', '2', '添加', '105001', '添加角色', '2013-06-30 19:27:11');
INSERT INTO `operatelog` VALUES ('3', '3', '下调整', '105004', '菜单排序', '2013-06-30 19:27:13');
INSERT INTO `operatelog` VALUES ('4', '2', '下调整', '105004', '菜单排序', '2013-06-30 19:27:13');
INSERT INTO `operatelog` VALUES ('5', '2', '下调整', '105004', '菜单排序', '2013-06-30 19:27:14');
INSERT INTO `operatelog` VALUES ('6', '2', '上调整', '105004', '菜单排序', '2013-06-30 19:27:15');
INSERT INTO `operatelog` VALUES ('7', '2', '下调整', '105004', '菜单排序', '2013-06-30 19:27:16');
INSERT INTO `operatelog` VALUES ('8', '3', '上调整', '105004', '菜单排序', '2013-06-30 19:27:16');
INSERT INTO `operatelog` VALUES ('9', '1', '下调整', '105004', '菜单排序', '2013-06-30 19:27:21');
INSERT INTO `operatelog` VALUES ('10', '1', '上调整', '105004', '菜单排序', '2013-06-30 19:27:23');
INSERT INTO `operatelog` VALUES ('11', '2', '修改', '105001', '分配权限', '2013-06-30 19:27:26');
INSERT INTO `operatelog` VALUES ('17', '1', '删除', '105001', '删除角色', '2013-06-30 20:15:38');
INSERT INTO `operatelog` VALUES ('18', '1', '删除', '105001', '删除角色', '2013-07-01 23:00:02');
INSERT INTO `operatelog` VALUES ('19', '1', '删除', '105001', '删除角色', '2013-07-02 19:45:25');
INSERT INTO `operatelog` VALUES ('20', '1', '删除', '104001', '删除角色', '2013-07-02 22:51:02');
INSERT INTO `operatelog` VALUES ('21', '1', '删除', '104001', '删除角色', '2013-07-02 23:01:53');
INSERT INTO `operatelog` VALUES ('22', '1', '删除', '104001', '删除角色', '2013-07-03 16:49:09');
INSERT INTO `operatelog` VALUES ('23', '1', '删除', '104001', '删除角色', '2013-07-03 16:49:12');
INSERT INTO `operatelog` VALUES ('24', '1', '删除', '104001', '删除角色', '2013-07-03 16:49:42');
INSERT INTO `operatelog` VALUES ('25', '1', '删除', '104001', '删除角色', '2013-07-03 16:53:10');
INSERT INTO `operatelog` VALUES ('26', '1', '删除', '104001', '删除角色', '2013-07-03 17:42:31');
INSERT INTO `operatelog` VALUES ('27', '1', '添加', '104001', '添加消息', '2013-07-06 17:37:27');
INSERT INTO `operatelog` VALUES ('28', '1', '添加', '104001', '添加消息', '2013-07-06 17:40:51');
INSERT INTO `operatelog` VALUES ('29', '1', '添加', '104001', '添加消息', '2013-07-06 17:45:53');
INSERT INTO `operatelog` VALUES ('30', '1', '修改', '104001', '修改消息', '2013-07-06 22:31:41');
INSERT INTO `operatelog` VALUES ('31', '1', '删除', '104001', '删除角色', '2013-07-06 22:37:04');
INSERT INTO `operatelog` VALUES ('32', '1', '删除', '104001', '删除角色', '2013-07-06 22:38:12');
INSERT INTO `operatelog` VALUES ('33', '1', '删除', '104001', '删除消息', '2013-07-06 22:49:36');
INSERT INTO `operatelog` VALUES ('34', '1', '删除', '104001', '删除信息', '2013-07-06 22:56:15');
INSERT INTO `operatelog` VALUES ('35', '1', '添加', '104001', '添加消息', '2013-07-07 23:40:19');
INSERT INTO `operatelog` VALUES ('36', '1', '添加', '104001', '添加消息', '2013-07-07 23:48:15');
INSERT INTO `operatelog` VALUES ('37', '1', '发布', '104001', '发布消息', '2013-07-07 23:55:51');
INSERT INTO `operatelog` VALUES ('38', '1', '发布', '104001', '发布消息', '2013-07-07 23:56:29');
INSERT INTO `operatelog` VALUES ('39', '1', '添加', '104001', '添加消息', '2013-07-07 23:58:47');
INSERT INTO `operatelog` VALUES ('40', '1', '发布', '104001', '发布消息', '2013-07-07 23:59:17');
INSERT INTO `operatelog` VALUES ('41', '1', '发布', '104001', '发布消息', '2013-07-08 00:00:46');
INSERT INTO `operatelog` VALUES ('42', '1', '发布', '104001', '发布消息', '2013-07-08 00:00:49');
INSERT INTO `operatelog` VALUES ('43', '1', '发布', '104001', '发布消息', '2013-07-08 00:01:07');
INSERT INTO `operatelog` VALUES ('44', '1', '发布', '104001', '发布消息', '2013-07-08 00:01:41');
INSERT INTO `operatelog` VALUES ('45', '1', '添加', '104001', '添加消息', '2013-07-08 00:02:59');
INSERT INTO `operatelog` VALUES ('46', '1', '添加', '104001', '添加消息', '2013-07-08 00:04:45');
INSERT INTO `operatelog` VALUES ('47', '1', '发布', '104001', '发布消息', '2013-07-08 00:05:24');
INSERT INTO `operatelog` VALUES ('48', '1', '添加', '104001', '添加消息', '2013-07-08 00:16:51');
INSERT INTO `operatelog` VALUES ('49', '1', '发布', '104001', '发布消息', '2013-07-08 00:17:31');
INSERT INTO `operatelog` VALUES ('50', '1', '发布', '104001', '发布消息', '2013-07-08 00:17:55');
INSERT INTO `operatelog` VALUES ('51', '5', '添加', '104001', '添加消息', '2013-07-08 01:04:36');
INSERT INTO `operatelog` VALUES ('52', '5', '发布', '104001', '发布消息', '2013-07-08 01:04:40');
INSERT INTO `operatelog` VALUES ('53', '4', '添加', '104001', '添加消息', '2013-07-08 02:54:46');
INSERT INTO `operatelog` VALUES ('54', '4', '添加', '104001', '添加消息', '2013-07-08 02:56:33');
INSERT INTO `operatelog` VALUES ('55', '4', '发布', '104001', '发布消息', '2013-07-08 02:56:37');
INSERT INTO `operatelog` VALUES ('56', '4', '发布', '104001', '发布消息', '2013-07-08 02:56:39');
INSERT INTO `operatelog` VALUES ('57', '2', '添加', '104001', '添加消息', '2013-07-08 03:00:34');
INSERT INTO `operatelog` VALUES ('58', '2', '添加', '104001', '添加消息', '2013-07-08 03:02:06');
INSERT INTO `operatelog` VALUES ('59', '2', '发布', '104001', '发布消息', '2013-07-08 03:02:12');
INSERT INTO `operatelog` VALUES ('60', '3', '添加', '104001', '添加消息', '2013-07-08 03:06:25');
INSERT INTO `operatelog` VALUES ('61', '3', '添加', '104001', '添加消息', '2013-07-08 03:09:33');
INSERT INTO `operatelog` VALUES ('62', '3', '发布', '104001', '发布消息', '2013-07-08 03:09:38');
INSERT INTO `operatelog` VALUES ('63', '3', '添加', '104001', '添加消息', '2013-07-08 03:12:29');
INSERT INTO `operatelog` VALUES ('64', '5', '添加', '104001', '添加消息', '2013-07-08 03:15:05');
INSERT INTO `operatelog` VALUES ('65', '5', '添加', '104001', '添加消息', '2013-07-08 03:17:32');
INSERT INTO `operatelog` VALUES ('66', '5', '发布', '104001', '发布消息', '2013-07-08 03:17:34');
INSERT INTO `operatelog` VALUES ('67', '5', '添加', '104001', '添加消息', '2013-07-08 03:20:10');
INSERT INTO `operatelog` VALUES ('68', '5', '发布', '104001', '发布消息', '2013-07-08 03:20:14');
INSERT INTO `operatelog` VALUES ('69', '3', '发布', '104001', '发布消息', '2013-07-08 03:22:24');
INSERT INTO `operatelog` VALUES ('70', '2', '添加', '104001', '添加消息', '2013-07-08 03:25:16');
INSERT INTO `operatelog` VALUES ('71', '2', '发布', '104001', '发布消息', '2013-07-08 03:25:21');
INSERT INTO `operatelog` VALUES ('72', '2', '添加', '104001', '添加消息', '2013-07-08 03:28:29');
INSERT INTO `operatelog` VALUES ('73', '2', '发布', '104001', '发布消息', '2013-07-08 03:28:36');
INSERT INTO `operatelog` VALUES ('74', '2', '添加', '104001', '添加消息', '2013-07-08 03:29:59');
INSERT INTO `operatelog` VALUES ('75', '5', '添加', '102003', '添加便签', '2013-07-08 16:00:52');
INSERT INTO `operatelog` VALUES ('76', '5', '修改', '102003', '修改便签', '2013-07-08 16:01:29');
INSERT INTO `operatelog` VALUES ('77', '5', '修改', '102003', '修改便签', '2013-07-08 16:01:37');
INSERT INTO `operatelog` VALUES ('78', '5', '添加', '102001', '添加日程', '2013-07-08 16:02:37');
INSERT INTO `operatelog` VALUES ('79', '5', '添加', '102001', '添加日程', '2013-07-08 16:04:23');
INSERT INTO `operatelog` VALUES ('80', '5', '添加', '102001', '添加日程', '2013-07-08 16:04:24');
INSERT INTO `operatelog` VALUES ('81', '5', '删除', '102001', '删除日程', '2013-07-08 16:04:45');
INSERT INTO `operatelog` VALUES ('82', '5', '添加', '102003', '添加便签', '2013-07-08 16:06:10');

-- ----------------------------
-- Table structure for `precontract`
-- ----------------------------
DROP TABLE IF EXISTS `precontract`;
CREATE TABLE `precontract` (
  `precontractId` int(11) NOT NULL auto_increment,
  `scheduleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY  (`precontractId`),
  KEY `scheduleId` (`scheduleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `precontract_ibfk_1` FOREIGN KEY (`scheduleId`) REFERENCES `schedule` (`scheduleId`),
  CONSTRAINT `precontract_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of precontract
-- ----------------------------
INSERT INTO `precontract` VALUES ('7', '14', '1');
INSERT INTO `precontract` VALUES ('8', '16', '2');
INSERT INTO `precontract` VALUES ('9', '16', '7');
INSERT INTO `precontract` VALUES ('10', '17', '6');
INSERT INTO `precontract` VALUES ('11', '17', '2');

-- ----------------------------
-- Table structure for `readedmessage`
-- ----------------------------
DROP TABLE IF EXISTS `readedmessage`;
CREATE TABLE `readedmessage` (
  `readId` int(11) NOT NULL auto_increment,
  `messageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY  (`readId`),
  KEY `messageId` (`messageId`),
  KEY `userId` (`userId`),
  CONSTRAINT `readedmessage_ibfk_1` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`),
  CONSTRAINT `readedmessage_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of readedmessage
-- ----------------------------
INSERT INTO `readedmessage` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL auto_increment,
  `roleName` varchar(50) NOT NULL,
  `roleDesc` varchar(50) NOT NULL,
  PRIMARY KEY  (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '未审批用户', '还没有使用该系统的权限。');
INSERT INTO `role` VALUES ('2', '普通用户', '一般用户');
INSERT INTO `role` VALUES ('3', '系统管理员', '拥有本系统最高管理权限');
INSERT INTO `role` VALUES ('4', '公司老总', '拥有最高的检查权');
INSERT INTO `role` VALUES ('5', '部门经理', '管辖本部门相关工作');
INSERT INTO `role` VALUES ('6', '临时角色', '测试几个项目');
INSERT INTO `role` VALUES ('7', '测试角色', '测试用例a');
INSERT INTO `role` VALUES ('8', '普通员工', '测试');
INSERT INTO `role` VALUES ('13', '测试', '完成');
INSERT INTO `role` VALUES ('17', '董事长', '最高权限者');
INSERT INTO `role` VALUES ('19', '董事局主席', '最大的官，无限权限，无所不能');
INSERT INTO `role` VALUES ('20', '卫生员', '打杂的，断水的');
INSERT INTO `role` VALUES ('21', 'ss', 'aa');

-- ----------------------------
-- Table structure for `rolememu`
-- ----------------------------
DROP TABLE IF EXISTS `rolememu`;
CREATE TABLE `rolememu` (
  `roleMemutId` int(11) NOT NULL auto_increment,
  `roleId` int(11) NOT NULL,
  `memuId` int(11) NOT NULL,
  PRIMARY KEY  (`roleMemutId`),
  KEY `roleId` (`roleId`),
  KEY `memuId` (`memuId`),
  CONSTRAINT `rolememu_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`),
  CONSTRAINT `rolememu_ibfk_2` FOREIGN KEY (`memuId`) REFERENCES `memu` (`memuId`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolememu
-- ----------------------------
INSERT INTO `rolememu` VALUES ('173', '3', '101');
INSERT INTO `rolememu` VALUES ('174', '3', '101001');
INSERT INTO `rolememu` VALUES ('175', '3', '101002');
INSERT INTO `rolememu` VALUES ('176', '3', '101003');
INSERT INTO `rolememu` VALUES ('220', '3', '102');
INSERT INTO `rolememu` VALUES ('221', '3', '102001');
INSERT INTO `rolememu` VALUES ('222', '3', '102002');
INSERT INTO `rolememu` VALUES ('223', '3', '102003');
INSERT INTO `rolememu` VALUES ('224', '3', '103');
INSERT INTO `rolememu` VALUES ('225', '3', '103001');
INSERT INTO `rolememu` VALUES ('226', '3', '103002');
INSERT INTO `rolememu` VALUES ('227', '3', '103003');
INSERT INTO `rolememu` VALUES ('228', '3', '104');
INSERT INTO `rolememu` VALUES ('229', '3', '104001');
INSERT INTO `rolememu` VALUES ('230', '3', '104002');
INSERT INTO `rolememu` VALUES ('231', '3', '105');
INSERT INTO `rolememu` VALUES ('232', '3', '105001');
INSERT INTO `rolememu` VALUES ('233', '3', '105002');
INSERT INTO `rolememu` VALUES ('234', '3', '105003');
INSERT INTO `rolememu` VALUES ('235', '3', '105004');
INSERT INTO `rolememu` VALUES ('236', '3', '106');
INSERT INTO `rolememu` VALUES ('237', '3', '106001');
INSERT INTO `rolememu` VALUES ('238', '3', '106002');
INSERT INTO `rolememu` VALUES ('239', '3', '106003');
INSERT INTO `rolememu` VALUES ('300', '13', '103001');
INSERT INTO `rolememu` VALUES ('301', '13', '102002');
INSERT INTO `rolememu` VALUES ('302', '13', '102');
INSERT INTO `rolememu` VALUES ('303', '13', '103');
INSERT INTO `rolememu` VALUES ('304', '13', '102003');
INSERT INTO `rolememu` VALUES ('305', '13', '103003');
INSERT INTO `rolememu` VALUES ('306', '13', '103002');
INSERT INTO `rolememu` VALUES ('307', '13', '102001');
INSERT INTO `rolememu` VALUES ('308', '13', '106001');
INSERT INTO `rolememu` VALUES ('309', '13', '106');
INSERT INTO `rolememu` VALUES ('328', '7', '102');
INSERT INTO `rolememu` VALUES ('329', '7', '103001');
INSERT INTO `rolememu` VALUES ('330', '7', '103');
INSERT INTO `rolememu` VALUES ('331', '7', '103003');
INSERT INTO `rolememu` VALUES ('332', '7', '103002');
INSERT INTO `rolememu` VALUES ('333', '7', '101');
INSERT INTO `rolememu` VALUES ('334', '7', '105003');
INSERT INTO `rolememu` VALUES ('335', '7', '106');
INSERT INTO `rolememu` VALUES ('336', '7', '101001');
INSERT INTO `rolememu` VALUES ('337', '7', '104');
INSERT INTO `rolememu` VALUES ('338', '7', '101002');
INSERT INTO `rolememu` VALUES ('339', '7', '105');
INSERT INTO `rolememu` VALUES ('340', '7', '101003');
INSERT INTO `rolememu` VALUES ('341', '7', '102002');
INSERT INTO `rolememu` VALUES ('342', '7', '104001');
INSERT INTO `rolememu` VALUES ('343', '7', '102003');
INSERT INTO `rolememu` VALUES ('344', '7', '102001');
INSERT INTO `rolememu` VALUES ('345', '7', '106001');
INSERT INTO `rolememu` VALUES ('346', '17', '102');
INSERT INTO `rolememu` VALUES ('347', '17', '103001');
INSERT INTO `rolememu` VALUES ('348', '17', '103');
INSERT INTO `rolememu` VALUES ('349', '17', '105004');
INSERT INTO `rolememu` VALUES ('350', '17', '103003');
INSERT INTO `rolememu` VALUES ('351', '17', '103002');
INSERT INTO `rolememu` VALUES ('352', '17', '101');
INSERT INTO `rolememu` VALUES ('353', '17', '105002');
INSERT INTO `rolememu` VALUES ('354', '17', '105003');
INSERT INTO `rolememu` VALUES ('355', '17', '105001');
INSERT INTO `rolememu` VALUES ('356', '17', '106');
INSERT INTO `rolememu` VALUES ('357', '17', '101001');
INSERT INTO `rolememu` VALUES ('358', '17', '104');
INSERT INTO `rolememu` VALUES ('359', '17', '101002');
INSERT INTO `rolememu` VALUES ('360', '17', '105');
INSERT INTO `rolememu` VALUES ('361', '17', '101003');
INSERT INTO `rolememu` VALUES ('362', '17', '102002');
INSERT INTO `rolememu` VALUES ('363', '17', '104001');
INSERT INTO `rolememu` VALUES ('364', '17', '102003');
INSERT INTO `rolememu` VALUES ('365', '17', '104002');
INSERT INTO `rolememu` VALUES ('366', '17', '102001');
INSERT INTO `rolememu` VALUES ('367', '17', '106001');
INSERT INTO `rolememu` VALUES ('368', '17', '106003');
INSERT INTO `rolememu` VALUES ('369', '17', '106002');

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `scheduleId` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `meetingId` int(11) NOT NULL,
  `beginTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `endTime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `schContent` varchar(255) default NULL,
  `createUserId` int(11) NOT NULL,
  `createTime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `ifPrivate` int(11) default NULL,
  PRIMARY KEY  (`scheduleId`),
  KEY `createUserId` (`createUserId`),
  KEY `meetingId` (`meetingId`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`createUserId`) REFERENCES `users` (`userId`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`meetingId`) REFERENCES `meetinginfo` (`MeetingId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('1', '今天下午要开一个部门月度工作总结会。', 'B03会议室', '3', '2007-12-05 09:26:39', '2007-12-05 18:26:49', '对12月份工作进行总结，安排下一个月的工作任务。', '1', '2007-12-05 11:10:00', '1');
INSERT INTO `schedule` VALUES ('7', '关于公司产品包装', '盘电招待所', '5', '2007-12-19 08:30:00', '2007-12-19 17:30:00', '公司年底前要发布新产品，记得提前准备包装事宜。', '2', '2007-12-05 14:02:57', '1');
INSERT INTO `schedule` VALUES ('9', '安排新员工入职培训。', '怀柔训练营', '3', '2007-12-07 08:30:00', '2007-12-07 17:30:00', '对新入职的员工召开培训开办会。', '1', '2007-12-07 15:29:43', '0');
INSERT INTO `schedule` VALUES ('10', '安排新员工jiaofa培训。', 'biao标准化训练营', '3', '2007-12-12 08:30:00', '2007-12-07 17:30:00', '对新入职的员工召开培训开办会。', '2', '2007-12-07 15:29:43', '1');
INSERT INTO `schedule` VALUES ('12', '月末总结会议.', 'B02办公室', '3', '2007-12-31 08:30:00', '2007-12-31 17:30:00', '请大家准备PPT。', '1', '2007-12-07 17:44:49', '1');
INSERT INTO `schedule` VALUES ('13', '影视合作事项。', '人民大会堂', '1', '2007-12-07 08:30:00', '2007-12-07 17:30:00', '通知半年来的主要工作。', '2', '2007-12-07 17:45:32', '0');
INSERT INTO `schedule` VALUES ('14', '今天下午要会见一个重要级人物。', 'B03会议室', '2', '2008-01-15 08:30:00', '2008-01-15 17:30:00', '进行初次谈判', '3', '2008-01-15 09:48:37', '1');
INSERT INTO `schedule` VALUES ('15', '安排新员工入职培训。', 'B03会议室', '2', '2008-01-15 14:30:00', '2008-01-15 17:30:00', '进行初次谈判', '4', '2008-01-15 09:48:37', '0');
INSERT INTO `schedule` VALUES ('16', '今天刚添加的！', 'VC会议室', '4', '2013-07-08 16:02:03', '2013-07-16 16:02:11', '只是测试下能不能添加而与！', '5', '2013-07-08 16:02:37', '0');
INSERT INTO `schedule` VALUES ('17', '和老外去开个会', 'FU会议室', '5', '2012-07-08 16:03:29', '2012-07-09 16:03:39', '和老外第一次开会有点小紧张啊！', '5', '2013-07-08 16:04:23', '0');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL auto_increment,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `deptId` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `userStateId` int(11) NOT NULL,
  `image` varchar(255) default NULL,
  `realName` varchar(50) default NULL,
  `regTime` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`userId`),
  KEY `deptId` (`deptId`),
  KEY `roleId` (`roleId`),
  KEY `userStateId` (`userStateId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `dept` (`deptId`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`userStateId`) REFERENCES `userstate` (`userStateId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'renxian', 'cjs', '7', '0', '3', '1', 'gaoqing.jpg', '陈家顺', '2013-06-23 21:43:07');
INSERT INTO `users` VALUES ('2', 'xiangyuzhe', '123', '9', '1', '2', '1', '19-052248_805-lp.jpg', '向宇哲', '2013-06-25 13:08:29');
INSERT INTO `users` VALUES ('3', 'tangshian', '666', '6', '0', '2', '1', '27-014637_369-lp.jpg', '谭石安', '2013-07-04 04:30:59');
INSERT INTO `users` VALUES ('4', 'lixun', '123', '12', '1', '4', '1', 'huise.jpg', '李璇', '2013-06-23 21:44:07');
INSERT INTO `users` VALUES ('5', 'admin', '12345', '7', '0', '2', '1', '01-011448_765-lp.jpg', '腾长今', '2013-06-23 21:43:17');
INSERT INTO `users` VALUES ('6', 'ouyangg', 'ouyan', '9', '0', '2', '2', 'huise.jpg', '欧阳广', '2013-07-04 04:31:09');
INSERT INTO `users` VALUES ('7', 'duanzhiguan', 'duan', '13', '0', '5', '1', '01-011448_765-lp.jpg', '段志刚', '2013-07-02 04:32:19');
INSERT INTO `users` VALUES ('8', 'xubifan', 'xibu', '15', '0', '6', '1', '20120918.jpg', '徐碧芳', '2013-06-03 04:33:20');
INSERT INTO `users` VALUES ('9', 'zenghu00', 'zhl', '16', '0', '6', '1', 'shanggan.jpg', '增华来', '2013-04-28 04:33:50');
INSERT INTO `users` VALUES ('10', 'zhuwenyu', 'zhuwe', '18', '0', '4', '1', 'huise.jpg', '朱文玉', '2013-05-26 04:35:30');
INSERT INTO `users` VALUES ('11', 'nie666', 'niec234', '13', '1', '2', '1', '01-011448_765-lp.jpg', '聂超', '2013-07-02 04:36:55');
INSERT INTO `users` VALUES ('12', 'haijun001', 'lihaiz', '19', '1', '8', '1', '02-074429_615-lp.jpg', '李海军', '2013-06-03 04:38:23');
INSERT INTO `users` VALUES ('13', 'nieh', 'nien', '17', '0', '1', '1', '22-012701_486-lp.jpg', '聂恒', '2013-06-30 04:39:34');
INSERT INTO `users` VALUES ('14', 'xiaoch', 'xiaon', '13', '0', '6', '2', '27-014637_369-lp.jpg', '肖成', '2013-06-30 04:41:11');
INSERT INTO `users` VALUES ('15', 'xtuxin', 'shendong', '17', '0', '13', '2', 'hanguo.jpg', '涂星', '2013-06-04 04:42:46');
INSERT INTO `users` VALUES ('16', 'taosheng', 'xiang', '14', '0', '2', '1', 'haaga.jpg', '陈一按', '2013-07-06 15:53:28');
INSERT INTO `users` VALUES ('17', 'juecesfd', 'jius', '15', '1', '4', '1', 'taisdjfald.gif', '隋唐', '2013-07-17 13:33:42');
INSERT INTO `users` VALUES ('18', 'kangren', 'tuisdf', '14', '0', '5', '1', 'xxuafdds.gif', '卢卡申', '2013-07-01 13:34:36');

-- ----------------------------
-- Table structure for `userstate`
-- ----------------------------
DROP TABLE IF EXISTS `userstate`;
CREATE TABLE `userstate` (
  `userStateId` int(11) NOT NULL auto_increment,
  `userStateName` varchar(50) NOT NULL,
  PRIMARY KEY  (`userStateId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userstate
-- ----------------------------
INSERT INTO `userstate` VALUES ('1', '被屏蔽');
INSERT INTO `userstate` VALUES ('2', '正常状态');

-- ----------------------------
-- Table structure for `worktime`
-- ----------------------------
DROP TABLE IF EXISTS `worktime`;
CREATE TABLE `worktime` (
  `workTimeId` int(11) NOT NULL auto_increment,
  `onDutyTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `offDutyTime` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`workTimeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worktime
-- ----------------------------
INSERT INTO `worktime` VALUES ('1', '2013-01-01 08:30:00', '2013-01-01 17:30:00');
INSERT INTO `worktime` VALUES ('2', '2013-06-18 15:31:17', '2013-04-05 00:00:00');
