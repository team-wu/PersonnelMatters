/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : corporatepersonnel

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2019-01-15 09:42:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  `sf` varchar(50) DEFAULT '高级用户',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '陈道明', '男', '25', '成都市金牛区', '13900000000', '2018-04-30', '管理员');
INSERT INTO `admin` VALUES ('2', 'vip', '123456', 'vip', '男', '22', 'Amoy', '17338702957', '2019-01-11', '高级用户');
INSERT INTO `admin` VALUES ('3', 'jianghy', '123456', '小江', '女', '20', '111', '13070000000', '2019-01-14', '高级用户');
INSERT INTO `admin` VALUES ('4', 'xiaowu', '123', '小吴', '男', '20', '1', '17338702959', null, '高级用户');
INSERT INTO `admin` VALUES ('13', 'jack', '123456', '张三', '男', '22', '测试', '13900000000', '2018-04-30', '高级用户');

-- ----------------------------
-- Table structure for `assessment`
-- ----------------------------
DROP TABLE IF EXISTS `assessment`;
CREATE TABLE `assessment` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `number` varchar(500) DEFAULT NULL,
  `workContent` varchar(500) DEFAULT NULL,
  `term` varchar(500) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `vip` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of assessment
-- ----------------------------
INSERT INTO `assessment` VALUES ('1', '111', '测试', '88', '2018-04-25', '阿飞', '111');
INSERT INTO `assessment` VALUES ('2', 'john', '完成设计OA', '5', '2018-12-03', '阿飞', 'jack');
INSERT INTO `assessment` VALUES ('3', '123456', 'java', '100', '2019-01-11', '小吴', 'vip');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('2', '人事部', '测试');
INSERT INTO `department` VALUES ('3', '项目部', '测试');
INSERT INTO `department` VALUES ('4', '工程部', '测试');
INSERT INTO `department` VALUES ('5', '技术部', '技术框架');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `number` varchar(500) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `department` varchar(500) DEFAULT NULL,
  `age` varchar(500) DEFAULT NULL,
  `sex` varchar(500) DEFAULT NULL,
  `education` varchar(500) DEFAULT NULL,
  `profession` varchar(500) DEFAULT NULL,
  `job` varchar(500) DEFAULT NULL,
  `phone` varchar(500) DEFAULT NULL,
  `introduction` varchar(500) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `password` varchar(50) DEFAULT '111',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'john', '阿飞', '工程部', '26', '男', '研究生', '信息工程', '研究员', '13500000000', '测试', '2018-04-30', '123456');
INSERT INTO `employee` VALUES ('2', '123456', '小吴', '项目部', '22', '男', '本科', '网络工程', '无', '17338702957', '1111', '2019-01-11', '000000');
INSERT INTO `employee` VALUES ('3', '0592', '小王', '项目部', '22', '男', '本科', '软件工程', '无', '17338702957', '111', '2019-01-11', '123456');
INSERT INTO `employee` VALUES ('4', '20190114', '小江', '工程部', '23', '女', '本科', '测试', '无', '13076000000', '111', '2019-01-14', '123456');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `number` varchar(500) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `workContent` varchar(500) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `review` varchar(500) DEFAULT '暂无',
  `opinion` varchar(500) DEFAULT '暂无',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('2', '111', '标题标题', '内容内容内容内容2', '2018-04-25', '阿飞', '已通过', 'ok');
INSERT INTO `log` VALUES ('3', '111', 'dsaf', 'dsf', '2018-12-02', '阿飞', '未通过', 's');
INSERT INTO `log` VALUES ('4', 'john', '开发需要硬件以及xx接口收费', '收费。。。。。\r\n硬件指标。。\r\nmoney RMB', '2018-12-03', '阿飞', '已通过', '批准');
INSERT INTO `log` VALUES ('5', '123456', '111', '111', '2019-01-11', '小吴', '未通过', '不同意');

-- ----------------------------
-- Table structure for `plane`
-- ----------------------------
DROP TABLE IF EXISTS `plane`;
CREATE TABLE `plane` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `number` varchar(500) DEFAULT NULL,
  `workContent` varchar(500) DEFAULT NULL,
  `term` varchar(500) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `status` varchar(500) DEFAULT '未完成',
  `vip` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of plane
-- ----------------------------
INSERT INTO `plane` VALUES ('1', '111', '测试任务内容', '2018-05-02', '2018-04-25', '阿飞', '已完成', '111');
INSERT INTO `plane` VALUES ('2', 'john', '开发完OA系统', '2019-11-29', '2018-12-03', '阿飞', '未完成', 'jack');
INSERT INTO `plane` VALUES ('3', 'john', '修改bug', '2019-01-01', '2019-01-11', '阿飞', '未完成', 'vip');

-- ----------------------------
-- Table structure for `track`
-- ----------------------------
DROP TABLE IF EXISTS `track`;
CREATE TABLE `track` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `number` varchar(500) DEFAULT NULL,
  `workContent` varchar(500) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `vip` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of track
-- ----------------------------
INSERT INTO `track` VALUES ('1', '111', '测试跟踪', '2018-04-25', '阿飞', '111');
INSERT INTO `track` VALUES ('2', 'john', '设计阶段', '2018-12-03', '阿飞', 'jack');
INSERT INTO `track` VALUES ('3', '0592', 'bug', '2019-01-11', '小王', 'vip');
