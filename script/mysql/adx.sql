/*
SQLyog Ultimate v9.02 
MySQL - 5.5.35 : Database - adx
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`adx` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `adx`;

/*Table structure for table `tb_ad_info` */

DROP TABLE IF EXISTS `tb_ad_info`;

CREATE TABLE `tb_ad_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '广告名称',
  `showid` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '广告id，生成的唯一一个区分广告位id',
  PRIMARY KEY (`showid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_ad_info` */

/*Table structure for table `tb_ad_type` */

DROP TABLE IF EXISTS `tb_ad_type`;

CREATE TABLE `tb_ad_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`type`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_ad_type` */

insert  into `tb_ad_type`(`id`,`type`) values (1,'横幅'),(2,'全插屏'),(3,'语音'),(4,'视频');

/*Table structure for table `tb_app_category` */

DROP TABLE IF EXISTS `tb_app_category`;

CREATE TABLE `tb_app_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`,`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_app_category` */

insert  into `tb_app_category`(`id`,`name`) values (1,'教育阅读'),(2,'体育篮球'),(3,'美食烹饪');

/*Table structure for table `tb_app_in_thirdparty` */

DROP TABLE IF EXISTS `tb_app_in_thirdparty`;

CREATE TABLE `tb_app_in_thirdparty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `platformid` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `adid` int(11) NOT NULL,
  `showtype` int(11) DEFAULT NULL,
  `incometype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`platformid`,`appid`,`adid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_app_in_thirdparty` */

insert  into `tb_app_in_thirdparty`(`id`,`appname`,`platformid`,`appid`,`adid`,`showtype`,`incometype`) values (1,'wifi万能钥匙',1,2147483647,2147483647,1,NULL);

/*Table structure for table `tb_app_info` */

DROP TABLE IF EXISTS `tb_app_info`;

CREATE TABLE `tb_app_info` (
  `id` int(11) DEFAULT NULL COMMENT '自增id',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `showid` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '媒体对外展示id',
  `ostypeid` int(11) DEFAULT NULL COMMENT '外键ostype，android，ios，wphone，webapi',
  `categoryid` int(11) DEFAULT NULL COMMENT '外键分类，教育阅读，运动体育',
  `pkgn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '包名称',
  `note` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体说明',
  `content` blob COMMENT '上传的app原始包文件',
  `status` int(11) DEFAULT NULL COMMENT '审核状态，审核通过,审核不通过',
  `checkinfo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审核意见',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `checktime` int(11) DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`showid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_app_info` */

/*Table structure for table `tb_app_os` */

DROP TABLE IF EXISTS `tb_app_os`;

CREATE TABLE `tb_app_os` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'android，iOS,winphone',
  PRIMARY KEY (`id`,`type`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_app_os` */

insert  into `tb_app_os`(`id`,`type`) values (1,'Android'),(2,'iOS'),(3,'WinPhone'),(4,'WebApi');

/*Table structure for table `tb_biz_ad_showtype` */

DROP TABLE IF EXISTS `tb_biz_ad_showtype`;

CREATE TABLE `tb_biz_ad_showtype` (
  `id` int(11) NOT NULL COMMENT '自增id',
  `adid` int(11) NOT NULL COMMENT '广告位',
  `showtypeid` int(11) NOT NULL COMMENT '展示类型，banner，全插屏，积分墙',
  `status` int(11) DEFAULT NULL COMMENT '伪删除',
  PRIMARY KEY (`id`,`adid`,`showtypeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_biz_ad_showtype` */

/*Table structure for table `tb_biz_app_ad` */

DROP TABLE IF EXISTS `tb_biz_app_ad`;

CREATE TABLE `tb_biz_app_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `appid` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '媒体id',
  `adid` int(11) NOT NULL COMMENT '广告位id',
  `status` int(11) DEFAULT NULL COMMENT '状态，伪删除',
  PRIMARY KEY (`id`,`appid`,`adid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_biz_app_ad` */

/*Table structure for table `tb_biz_app_category` */

DROP TABLE IF EXISTS `tb_biz_app_category`;

CREATE TABLE `tb_biz_app_category` (
  `id` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`,`appid`,`categoryid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_biz_app_category` */

/*Table structure for table `tb_biz_app_relationship` */

DROP TABLE IF EXISTS `tb_biz_app_relationship`;

CREATE TABLE `tb_biz_app_relationship` (
  `id` int(11) DEFAULT NULL,
  `ourad` int(11) DEFAULT NULL,
  `otherplatformad` int(11) DEFAULT NULL,
  `requestweight` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_biz_app_relationship` */

/*Table structure for table `tb_biz_user_app` */

DROP TABLE IF EXISTS `tb_biz_user_app`;

CREATE TABLE `tb_biz_user_app` (
  `id` int(11) NOT NULL COMMENT '自增id',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `appid` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '媒体id',
  `status` int(11) DEFAULT NULL COMMENT '状态，伪删除',
  PRIMARY KEY (`id`,`userid`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_biz_user_app` */

/*Table structure for table `tb_biz_user_bank` */

DROP TABLE IF EXISTS `tb_biz_user_bank`;

CREATE TABLE `tb_biz_user_bank` (
  `id` int(11) NOT NULL COMMENT '自增id',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `paymentway` int(11) NOT NULL COMMENT '支付方式',
  `paymentid` int(11) NOT NULL COMMENT '支付账号，关联对应的id',
  `status` int(11) DEFAULT NULL COMMENT '状态，伪删除',
  PRIMARY KEY (`id`,`userid`,`paymentway`,`paymentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_biz_user_bank` */

/*Table structure for table `tb_paymentplatform` */

DROP TABLE IF EXISTS `tb_paymentplatform`;

CREATE TABLE `tb_paymentplatform` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `paymentplatformname` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '支付平台名称',
  PRIMARY KEY (`id`,`paymentplatformname`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_paymentplatform` */

/*Table structure for table `tb_thirdparty` */

DROP TABLE IF EXISTS `tb_thirdparty`;

CREATE TABLE `tb_thirdparty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `requesttype` int(11) NOT NULL,
  `platformtype` int(11) NOT NULL,
  `requesturl` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`name`,`requesttype`,`platformtype`,`requesturl`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_thirdparty` */

insert  into `tb_thirdparty`(`id`,`name`,`requesttype`,`platformtype`,`requesturl`,`key`,`token`) values (1,'广点通',1,2,'http://mi.gdt.qq.com/gdt_mview.fcg',NULL,NULL),(2,'芒果',1,2,'http://api2.adsmogo.com/ad?',NULL,NULL),(3,'点媒',1,2,'http://api.lomark.cn/v2/get',NULL,NULL);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) DEFAULT NULL COMMENT '自增id',
  `nickname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册用户名，这里约定为邮箱',
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码，md5下',
  `status` int(11) DEFAULT NULL COMMENT '用户状态，正常，冻结等',
  `realname` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '真实姓名',
  `phone` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `qq` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'QQ号码',
  `identityaccount` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '身份证账号，其他的证件可以抽取出这一列',
  `identitypicture` blob COMMENT '身份证正反面照片',
  `regisgertime` int(11) DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`realname`,`identityaccount`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_user` */

/*Table structure for table `tb_user_ad_statistic` */

DROP TABLE IF EXISTS `tb_user_ad_statistic`;

CREATE TABLE `tb_user_ad_statistic` (
  `id` int(11) NOT NULL COMMENT '自增id',
  `appid` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '媒体id',
  `adid` int(11) NOT NULL COMMENT '广告id',
  `request` int(11) DEFAULT NULL COMMENT '请求数目',
  `impress` int(11) DEFAULT NULL COMMENT '展示数目',
  `click` int(11) DEFAULT NULL COMMENT '点击数目',
  `fillrate` double DEFAULT NULL COMMENT '填充率',
  `impressrate` double DEFAULT NULL COMMENT '展示率',
  `clickrate` double DEFAULT NULL COMMENT '点击率',
  `eCPM` double DEFAULT NULL,
  `income` double DEFAULT NULL COMMENT '收入',
  `time` int(11) NOT NULL COMMENT '统计时间',
  PRIMARY KEY (`id`,`appid`,`adid`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_user_ad_statistic` */

/*Table structure for table `tb_user_bank` */

DROP TABLE IF EXISTS `tb_user_bank`;

CREATE TABLE `tb_user_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bankname` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '银行名称',
  `bankaddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行地址',
  `bankaccount` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '银行账户',
  PRIMARY KEY (`bankname`,`bankaccount`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_user_bank` */

/*Table structure for table `tb_user_paymentplatform` */

DROP TABLE IF EXISTS `tb_user_paymentplatform`;

CREATE TABLE `tb_user_paymentplatform` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `paymentplatformid` int(11) NOT NULL,
  `paymentplatformaccount` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`paymentplatformid`,`paymentplatformaccount`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_user_paymentplatform` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
