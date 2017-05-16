# MySQL-Front 5.0  (Build 1.0)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: db_library
# ------------------------------------------------------
# Server version 5.0.67-community-nt

#
# Table structure for table tb_bookcase
#

DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `Column_3` char(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_bookcase` VALUES (3,'���1',NULL);
INSERT INTO `tb_bookcase` VALUES (4,'���2',NULL);

#
# Table structure for table tb_bookinfo
#

DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `barcode` varchar(30) default NULL,
  `bookname` varchar(70) default NULL,
  `typeid` int(10) unsigned default NULL,
  `author` varchar(30) default NULL,
  `translator` varchar(30) default NULL,
  `ISBN` varchar(20) default NULL,
  `price` float(8,2) default NULL,
  `page` int(10) unsigned default NULL,
  `bookcase` int(10) unsigned default NULL,
  `inTime` date default NULL,
  `operator` varchar(30) default NULL,
  `del` tinyint(1) default '0',
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_bookinfo` VALUES ('9787302047230','Java 2 ʵ�ý̳�',1,'shuanyulin','ceshi','978-7',39,440,4,'2007-11-22','tsoft',1,1);
INSERT INTO `tb_bookinfo` VALUES ('jk','kjkj',1,'***','','7-302',12,0,1,'2007-11-22','tsoft',1,2);
INSERT INTO `tb_bookinfo` VALUES ('9787115157690','JSP���򿪷�����',1,'***','','978-7',89,816,3,'2007-11-23','tsoft',1,3);
INSERT INTO `tb_bookinfo` VALUES ('123','��ʵ',1,'11','11','7-302',11,11,1,'2007-12-18','tsoft',1,5);
INSERT INTO `tb_bookinfo` VALUES ('9787302047492','DHTML��̬��ҳ����',3,'shuangyulin','ceshi','7-302',45,221,4,'2009-04-25','admin',1,7);
INSERT INTO `tb_bookinfo` VALUES ('9787508614557 ','�ͷ��ؽ�����Ʊ�',1,'(��)����.�ͷ���;��ά.������','���','978-6',30,179,3,'2009-12-18','admin',0,8);
INSERT INTO `tb_bookinfo` VALUES ('9787802235281','����Թʱ��:˭˵��Ҫ�²���������',1,'(Ӣ)���.��˹��','�ں���','978-5',20,0,3,'2009-12-18','admin',0,9);
INSERT INTO `tb_bookinfo` VALUES ('9787040276985 ','ȫ��˶ʿ�о�����ѧͳһ����Ӣ�￼�Դ�ٽ���:2010���',1,'�����д��','','010',32,266,4,'2009-12-18','admin',0,10);
INSERT INTO `tb_bookinfo` VALUES ('9787300087993','����ҵ�ʻ�ر�',8,'(��)�ĵ�','����','010',58,515,3,'2009-12-18','admin',0,11);

#
# Table structure for table tb_booktype
#

DROP TABLE IF EXISTS `tb_booktype`;
CREATE TABLE `tb_booktype` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `typename` varchar(30) default NULL,
  `days` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_booktype` VALUES (1,'���ù���',40);
INSERT INTO `tb_booktype` VALUES (3,'���Ŀƽ�',50);
INSERT INTO `tb_booktype` VALUES (6,'�����',30);
INSERT INTO `tb_booktype` VALUES (7,'С��ѧϰ',30);
INSERT INTO `tb_booktype` VALUES (8,'����ѧϰ',60);

#
# Table structure for table tb_borrow
#

DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `readerid` int(10) unsigned default NULL,
  `bookid` int(10) default NULL,
  `borrowTime` date default NULL,
  `backTime` date default NULL,
  `operator` varchar(30) default NULL,
  `ifback` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_borrow` VALUES (1,1,1,'2007-11-22','2007-12-22','tsoft',1);
INSERT INTO `tb_borrow` VALUES (2,1,3,'2007-11-26','2007-12-26','tsoft',0);
INSERT INTO `tb_borrow` VALUES (3,1,1,'2007-11-26','2007-12-26','tsoft',0);
INSERT INTO `tb_borrow` VALUES (4,3,6,'2007-12-29','2007-01-08','Tsoft',0);
INSERT INTO `tb_borrow` VALUES (5,3,1,'2007-12-29','2008-01-28','Tsoft',0);
INSERT INTO `tb_borrow` VALUES (6,3,3,'2007-12-29','2008-01-28','Tsoft',1);
INSERT INTO `tb_borrow` VALUES (7,4,7,'2009-04-25','2009-04-30','admin',0);
INSERT INTO `tb_borrow` VALUES (8,5,8,'2009-12-18','2010-03-13','admin',0);
INSERT INTO `tb_borrow` VALUES (9,5,9,'2009-12-18','2010-03-13','admin',0);
INSERT INTO `tb_borrow` VALUES (10,6,11,'2009-12-18','2010-02-16','admin',0);
INSERT INTO `tb_borrow` VALUES (11,7,8,'2010-02-01','2010-03-13','admin',1);
INSERT INTO `tb_borrow` VALUES (12,7,8,'2010-02-01','2010-03-13','admin',1);

#
# Table structure for table tb_giveback
#

DROP TABLE IF EXISTS `tb_giveback`;
CREATE TABLE `tb_giveback` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `readerid` int(11) default NULL,
  `bookid` int(11) default NULL,
  `backTime` date default NULL,
  `operator` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_giveback` VALUES (1,1,1,'2007-11-22','tsoft');
INSERT INTO `tb_giveback` VALUES (2,3,3,'2007-01-03','Tsoft');
INSERT INTO `tb_giveback` VALUES (3,7,8,'2010-02-01','admin');
INSERT INTO `tb_giveback` VALUES (4,7,8,'2010-02-01','admin');

#
# Table structure for table tb_library
#

DROP TABLE IF EXISTS `tb_library`;
CREATE TABLE `tb_library` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `libraryname` varchar(50) default NULL,
  `curator` varchar(10) default NULL,
  `tel` varchar(20) default NULL,
  `address` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `url` varchar(100) default NULL,
  `createDate` date default NULL,
  `introduce` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_library` VALUES (1,'�ǻ�ͼ���','������','13558690869','�Ĵ��ɶ�','wangjianlin1985@126.com','http://shop34864101.taobao.com','1999-05-06','���и߼�ͼ���');

#
# Table structure for table tb_manager
#

DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `PWD` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_manager` VALUES (3,'admin','admin');
INSERT INTO `tb_manager` VALUES (4,'tsoft','111');
INSERT INTO `tb_manager` VALUES (5,'wangjianlin','198517');

#
# Table structure for table tb_parameter
#

DROP TABLE IF EXISTS `tb_parameter`;
CREATE TABLE `tb_parameter` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cost` int(10) unsigned default NULL,
  `validity` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_parameter` VALUES (1,40,3);

#
# Table structure for table tb_publishing
#

DROP TABLE IF EXISTS `tb_publishing`;
CREATE TABLE `tb_publishing` (
  `ISBN` varchar(20) default NULL,
  `pubname` varchar(30) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;
INSERT INTO `tb_publishing` VALUES ('7-302','�廪��ѧ������');
INSERT INTO `tb_publishing` VALUES ('978-7','�����ʵ������');
INSERT INTO `tb_publishing` VALUES ('978-6','���ų�����');
INSERT INTO `tb_publishing` VALUES ('978-5','�й���Ͽ������');
INSERT INTO `tb_publishing` VALUES ('010','�ߵȽ��������� ');

#
# Table structure for table tb_purview
#

DROP TABLE IF EXISTS `tb_purview`;
CREATE TABLE `tb_purview` (
  `id` int(11) NOT NULL,
  `sysset` tinyint(1) default '0',
  `readerset` tinyint(1) default '0',
  `bookset` tinyint(1) default '0',
  `borrowback` tinyint(1) default '0',
  `sysquery` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;
INSERT INTO `tb_purview` VALUES (3,1,1,1,1,1);
INSERT INTO `tb_purview` VALUES (4,1,1,1,1,1);
INSERT INTO `tb_purview` VALUES (5,1,1,1,1,1);

#
# Table structure for table tb_reader
#

DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `sex` varchar(4) default NULL,
  `barcode` varchar(30) default NULL,
  `vocation` varchar(50) default NULL,
  `birthday` date default NULL,
  `paperType` varchar(10) default NULL,
  `paperNO` varchar(20) default NULL,
  `tel` varchar(20) default NULL,
  `email` varchar(100) default NULL,
  `createDate` date default NULL,
  `operator` varchar(30) default NULL,
  `remark` text,
  `typeid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_reader` VALUES (5,'������','��','050930222','ѧ��','1985-05-12','���֤','123456789745614578','010-78945613','fdsfds@ffwe.com','2009-12-18','admin','',1);
INSERT INTO `tb_reader` VALUES (6,'���','��','050930233','ͼ��ݹ�����Ա','1981-05-12','���֤','123456789745614578','010-456789123','fdsfds@ffwe.com','2009-12-18','admin','',2);
INSERT INTO `tb_reader` VALUES (7,'ŷ����','Ů','050930234','��ʦ','1983-05-12','���֤','123456789745614578','010-456789123','fdsfds@ffwe.com','2009-12-18','admin','',3);

#
# Table structure for table tb_readertype
#

DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `number` int(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;
INSERT INTO `tb_readertype` VALUES (1,'ѧ��',3);
INSERT INTO `tb_readertype` VALUES (2,'������Ա',5);
INSERT INTO `tb_readertype` VALUES (3,'��ʦ',4);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
