drop database if exists db_snack_shop;
create database db_snack_shop;
use db_snack_shop;
SET FOREIGN_KEY_CHECKS=0;



DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_username` varchar(255) DEFAULT NULL,
  `ad_password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE,
  KEY `roleIdpre` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


INSERT INTO `admin` VALUES ('1', '�ͷ�', '123456', '3');
INSERT INTO `admin` VALUES ('2', 'admin', 'admin', '1');
INSERT INTO `admin` VALUES ('3', '�ֹ�A', '123456', '2');


DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


INSERT INTO `admin_menu` VALUES ('1', '������Ϣ');
INSERT INTO `admin_menu` VALUES ('2', '��Ա����');
INSERT INTO `admin_menu` VALUES ('3', 'ͼƬ����');
INSERT INTO `admin_menu` VALUES ('4', '��������');
INSERT INTO `admin_menu` VALUES ('5', 'ͼ�����');
INSERT INTO `admin_menu` VALUES ('6', '��Ʒ����');


DROP TABLE IF EXISTS `admin_menu_child`;
CREATE TABLE `admin_menu_child` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_menu_name` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `child_menu_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


INSERT INTO `admin_menu_child` VALUES ('1', '�û�����', '2', '/admin/user/mainToUserinfo');
INSERT INTO `admin_menu_child` VALUES ('2', 'Ա������', '2', '/admin/user/mainToAdmin');
INSERT INTO `admin_menu_child` VALUES ('3', '��������', '4', '/admin/order/mainToAdminOrder');
INSERT INTO `admin_menu_child` VALUES ('4', '�ϴ�ͼƬ', '3', '/admin/img/mainToAdminImg');
INSERT INTO `admin_menu_child` VALUES ('5', '��Ʒ����', '6', '/admin/snackinfo/mainToAdminSnackinfo');
INSERT INTO `admin_menu_child` VALUES ('6', '��ͼͳ��', '5', '/admin/map/mainToPieMap');
INSERT INTO `admin_menu_child` VALUES ('7', '������Ϣ', '1', '/user/mainToAdminuser');




DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL COMMENT '�������',
  `u_id` int(11) DEFAULT NULL,
  `e_id` int(11) DEFAULT NULL COMMENT '����ԱID',
  `o_time` date DEFAULT NULL,
  `o_type` int(11) DEFAULT NULL COMMENT '-1��δ������1����ɣ�0���ѷ���',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



INSERT INTO `order` VALUES ('125', '201911024234', '17', '1', '2019-11-02', '0');
INSERT INTO `order` VALUES ('126', '201911045281', '18', '2', '2019-11-04', '0');
INSERT INTO `order` VALUES ('127', '201912053444', '19', '2', '2019-12-05', '1');
INSERT INTO `order` VALUES ('128', '201912074630', '20', '2', '2019-12-07', '0');
INSERT INTO `order` VALUES ('129', '201912075605', '20', null, '2019-12-07', '-2');
INSERT INTO `order` VALUES ('131', '201912077894', '20', null, '2019-12-07', '-1');
INSERT INTO `order` VALUES ('132', '201912078303', '20', '2', '2019-12-07', '1');


DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `o_num` int(11) DEFAULT NULL,
  `o_money` double DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



INSERT INTO `orderdetail` VALUES ('154', '201911024234', '26', '1', '16');
INSERT INTO `orderdetail` VALUES ('155', '201911024234', '25', '1', '1');
INSERT INTO `orderdetail` VALUES ('156', '201911045281', '82', '2', '10');
INSERT INTO `orderdetail` VALUES ('157', '201912053444', '39', '2', '20');
INSERT INTO `orderdetail` VALUES ('158', '201912053444', '32', '3', '10');
INSERT INTO `orderdetail` VALUES ('159', '201912074630', '67', '3', '16');
INSERT INTO `orderdetail` VALUES ('160', '201912074630', '55', '2', '9');
INSERT INTO `orderdetail` VALUES ('161', '201912074630', '39', '1', '20');
INSERT INTO `orderdetail` VALUES ('162', '201912075605', '49', '1', '14');
INSERT INTO `orderdetail` VALUES ('163', '201912075605', '45', '1', '27');
INSERT INTO `orderdetail` VALUES ('164', '201912075605', '30', '1', '8');
INSERT INTO `orderdetail` VALUES ('166', '201912077894', '72', '2', '14');
INSERT INTO `orderdetail` VALUES ('167', '201912077894', '32', '1', '10');
INSERT INTO `orderdetail` VALUES ('168', '201912078303', '66', '1', '16');
INSERT INTO `orderdetail` VALUES ('169', '201912078303', '34', '1', '12');


DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `perid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isparent` int(11) DEFAULT NULL,
  `ismenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`perid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


INSERT INTO `permission` VALUES ('1', 'Ա������', '0', '/snack/admin/user/mainToAdmin', '1', '1');
INSERT INTO `permission` VALUES ('2', 'Ա�����', '1', '/snack/admin/user/addNewAdmin', '0', '1');
INSERT INTO `permission` VALUES ('3', 'Ա��ɾ��', '1', '/snack/admin/user/delAdminById', '0', '1');
INSERT INTO `permission` VALUES ('4', 'Ա���޸�', '1', '/snack/admin/user/updateGoAdminById', '0', '1');
INSERT INTO `permission` VALUES ('6', '�û�����', '0', '/snack/admin/user/mainToUserinfo', '1', '1');
INSERT INTO `permission` VALUES ('9', '�û�ɾ��', '6', '/snack/admin/user/delUserinfoById', '0', '1');
INSERT INTO `permission` VALUES ('10', '�û��޸�', '6', '/snack/admin/user/updateGoUserinfoById', '0', '1');
INSERT INTO `permission` VALUES ('13', '��������', '0', '/snack/admin/order/mainToAdminOrder', '1', '1');
INSERT INTO `permission` VALUES ('14', '�����޸�', '13', '/snack/admin/order/updateSelectAdminOrder', '0', '1');
INSERT INTO `permission` VALUES ('15', '����ɾ��', '13', '/snack/admin/order/deleteAdminOrder', '0', '1');
INSERT INTO `permission` VALUES ('16', '�����޸�', '13', '/snack/admin/order/updateSelectAdminOrderDetial', '0', '1');
INSERT INTO `permission` VALUES ('17', '����ɾ��', '13', '/snack/admin/order/deleteOrderdetail', '0', '1');
INSERT INTO `permission` VALUES ('19', 'ͼƬ����', '0', '/snack/admin/img/mainToAdminImg', '1', '1');
INSERT INTO `permission` VALUES ('20', '�ϴ�ͼƬ', '19', '/snack/admin/img/upload', '0', '1');
INSERT INTO `permission` VALUES ('21', '��Ʒ����', '0', '/snack/admin/snackinfo/mainToAdminSnackinfo', '0', '1');
INSERT INTO `permission` VALUES ('22', '��Ʒ�ϼ�', '21', '/snack/admin/snackinfo/addAdminSnack', '0', '1');
INSERT INTO `permission` VALUES ('23', '��Ʒɾ��', '21', '/snack/admin/snackinfo/delAdminUserinfo', '0', '1');
INSERT INTO `permission` VALUES ('24', '��Ʒ�޸�', '21', '/snack/admin/snackinfo/selectAdminUserinfoBysId', '0', '1');
INSERT INTO `permission` VALUES ('25', '������Ϣ', '0', '/admin/user/mainToAdminuser', '1', '1');
INSERT INTO `permission` VALUES ('26', 'ȷ�Ϸ���', '13', '/snack/admin/order/userOrderConfirm', '0', '1');


DROP TABLE IF EXISTS `receiptinfo`;
CREATE TABLE `receiptinfo` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL,
  `o_name` varchar(255) DEFAULT NULL,
  `o_phone` varchar(255) DEFAULT NULL,
  `o_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



INSERT INTO `receiptinfo` VALUES ('131', '201911024234', 'B', '15868526202', '�Ϻ����');
INSERT INTO `receiptinfo` VALUES ('132', '201911045281', 'C', '13520109202', 'ͬ�ô�ѧ');
INSERT INTO `receiptinfo` VALUES ('133', '201912053444', '���ڵĲþ���', '13565655656', '��������');
INSERT INTO `receiptinfo` VALUES ('134', '201912074630', '����', '13656565656', '��������');
INSERT INTO `receiptinfo` VALUES ('135', '201912075605', '����ϣ��', '13656565656', '�����');
INSERT INTO `receiptinfo` VALUES ('137', '201912077894', '����', '13565656464', '������');
INSERT INTO `receiptinfo` VALUES ('138', '201912078303', '����', '13855544565', '�����');


DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `recordNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  KEY `s_idfk` (`s_id`) USING BTREE,
  CONSTRAINT `s_idfk` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


INSERT INTO `record` VALUES ('13', '20', '2019-02-16', '2');
INSERT INTO `record` VALUES ('14', '23', '2019-03-27', '4');
INSERT INTO `record` VALUES ('15', '20', '2019-03-27', '6');
INSERT INTO `record` VALUES ('16', '20', '2019-03-27', '2');
INSERT INTO `record` VALUES ('17', '23', '2019-03-27', '1');
INSERT INTO `record` VALUES ('18', '21', '2019-03-27', '1');
INSERT INTO `record` VALUES ('19', '20', '2019-03-27', '2');
INSERT INTO `record` VALUES ('20', '21', '2019-03-27', '1');
INSERT INTO `record` VALUES ('21', '24', '2019-03-27', '3');
INSERT INTO `record` VALUES ('22', '23', '2019-03-28', '1');
INSERT INTO `record` VALUES ('23', '21', '2019-03-28', '10');
INSERT INTO `record` VALUES ('24', '21', '2019-03-28', '1');
INSERT INTO `record` VALUES ('25', '20', '2019-03-28', '1');
INSERT INTO `record` VALUES ('26', '24', '2019-03-28', '1');
INSERT INTO `record` VALUES ('27', '24', '2019-03-28', '1');
INSERT INTO `record` VALUES ('28', '23', '2019-03-31', '1');
INSERT INTO `record` VALUES ('29', '23', '2019-04-01', '1');
INSERT INTO `record` VALUES ('30', '20', '2019-04-01', '6');
INSERT INTO `record` VALUES ('31', '24', '2019-04-01', '3');
INSERT INTO `record` VALUES ('32', '20', '2019-04-01', '1');
INSERT INTO `record` VALUES ('33', '23', '2019-04-01', '1');
INSERT INTO `record` VALUES ('34', '62', '2019-04-01', '4');
INSERT INTO `record` VALUES ('35', '27', '2019-04-01', '5');
INSERT INTO `record` VALUES ('36', '45', '2019-04-01', '3');
INSERT INTO `record` VALUES ('37', '51', '2019-04-17', '4');
INSERT INTO `record` VALUES ('38', '34', '2019-04-17', '4');
INSERT INTO `record` VALUES ('39', '26', '2019-04-01', '8');
INSERT INTO `record` VALUES ('40', '30', '2019-04-01', '10');
INSERT INTO `record` VALUES ('41', '51', '2019-04-30', '3');
INSERT INTO `record` VALUES ('42', '33', '2019-04-30', '4');
INSERT INTO `record` VALUES ('43', '26', '2019-04-30', '3');
INSERT INTO `record` VALUES ('44', '56', '2019-04-30', '1');
INSERT INTO `record` VALUES ('45', '26', '2019-10-25', '1');
INSERT INTO `record` VALUES ('46', '26', '2019-10-25', '10');
INSERT INTO `record` VALUES ('47', '26', '2019-10-25', '22');
INSERT INTO `record` VALUES ('48', '34', '2019-10-25', '6');
INSERT INTO `record` VALUES ('49', '26', '2019-11-04', '1');
INSERT INTO `record` VALUES ('50', '25', '2019-11-04', '1');
INSERT INTO `record` VALUES ('51', '39', '2019-12-05', '2');
INSERT INTO `record` VALUES ('52', '32', '2019-12-05', '3');
INSERT INTO `record` VALUES ('53', '82', '2019-12-06', '2');
INSERT INTO `record` VALUES ('54', '67', '2019-12-07', '3');
INSERT INTO `record` VALUES ('55', '55', '2019-12-07', '2');
INSERT INTO `record` VALUES ('56', '39', '2019-12-07', '1');
INSERT INTO `record` VALUES ('57', '66', '2019-12-07', '1');
INSERT INTO `record` VALUES ('58', '34', '2019-12-07', '1');


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


INSERT INTO `role` VALUES ('1', 'ϵͳ����Ա', '���Ȩ�ޣ�������ӱ༭��');
INSERT INTO `role` VALUES ('2', '����Ա', '��������');
INSERT INTO `role` VALUES ('3', '��ְԱ��', '�鿴����');


DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


INSERT INTO `rolepermission` VALUES ('1', '1', '1');
INSERT INTO `rolepermission` VALUES ('2', '1', '2');
INSERT INTO `rolepermission` VALUES ('3', '1', '3');
INSERT INTO `rolepermission` VALUES ('4', '1', '4');
INSERT INTO `rolepermission` VALUES ('5', '1', '6');
INSERT INTO `rolepermission` VALUES ('6', '1', '9');
INSERT INTO `rolepermission` VALUES ('7', '1', '10');
INSERT INTO `rolepermission` VALUES ('8', '1', '13');
INSERT INTO `rolepermission` VALUES ('9', '1', '14');
INSERT INTO `rolepermission` VALUES ('10', '1', '15');
INSERT INTO `rolepermission` VALUES ('11', '1', '16');
INSERT INTO `rolepermission` VALUES ('12', '1', '17');
INSERT INTO `rolepermission` VALUES ('13', '1', '19');
INSERT INTO `rolepermission` VALUES ('14', '1', '20');
INSERT INTO `rolepermission` VALUES ('15', '1', '21');
INSERT INTO `rolepermission` VALUES ('16', '1', '22');
INSERT INTO `rolepermission` VALUES ('17', '1', '23');
INSERT INTO `rolepermission` VALUES ('18', '1', '24');
INSERT INTO `rolepermission` VALUES ('19', '2', '1');
INSERT INTO `rolepermission` VALUES ('20', '2', '6');
INSERT INTO `rolepermission` VALUES ('21', '2', '13');
INSERT INTO `rolepermission` VALUES ('22', '2', '14');
INSERT INTO `rolepermission` VALUES ('23', '2', '15');
INSERT INTO `rolepermission` VALUES ('24', '2', '16');
INSERT INTO `rolepermission` VALUES ('25', '2', '17');
INSERT INTO `rolepermission` VALUES ('26', '2', '19');
INSERT INTO `rolepermission` VALUES ('27', '2', '21');
INSERT INTO `rolepermission` VALUES ('28', '2', '25');
INSERT INTO `rolepermission` VALUES ('29', '1', '25');
INSERT INTO `rolepermission` VALUES ('30', '3', '1');
INSERT INTO `rolepermission` VALUES ('31', '3', '6');
INSERT INTO `rolepermission` VALUES ('32', '3', '13');
INSERT INTO `rolepermission` VALUES ('33', '3', '19');
INSERT INTO `rolepermission` VALUES ('34', '3', '21');
INSERT INTO `rolepermission` VALUES ('35', '3', '25');
INSERT INTO `rolepermission` VALUES ('36', '1', '26');
INSERT INTO `rolepermission` VALUES ('37', '2', '26');


DROP TABLE IF EXISTS `snackinfo`;
CREATE TABLE `snackinfo` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_batch` varchar(255) DEFAULT NULL COMMENT '���κ�=��������+2λ�����',
  `s_name` varchar(255) DEFAULT NULL,
  `s_price` double DEFAULT NULL,
  `s_discount` varchar(255) DEFAULT NULL COMMENT '�ۿ�',
  `s_pictureUrl` varchar(255) DEFAULT NULL,
  `s_brand` varchar(255) DEFAULT NULL COMMENT 'Ʒ��',
  `s_place` varchar(255) DEFAULT NULL COMMENT '����',
  `s_Imported` int(1) DEFAULT NULL COMMENT '�Ƿ����',
  `s_score` int(11) DEFAULT NULL,
  `s_pDate` date DEFAULT NULL COMMENT '��������',
  `s_qDate` varchar(255) DEFAULT NULL COMMENT '������',
  `state` int(11) DEFAULT NULL COMMENT '1---�ϼܣ�0---draft��1--�¼�',
  `s_createDate` date DEFAULT NULL COMMENT '�ϼ�ʱ��',
  `s_dese` varchar(255) DEFAULT NULL COMMENT '����',
  `s_type` varchar(255) DEFAULT NULL,
  `s_number` int(11) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


INSERT INTO `snackinfo` VALUES ('20', '201903273550', '����', '10', '10', 'kele.jpg', '����', '�㽭', '1', null, '2019-03-15', '12', '1', '2019-03-27', '�ú�', '������', '9980');
INSERT INTO `snackinfo` VALUES ('21', '201903276547', '����', '20', '9', 'guazi.jpg', 'ǡǡ', '�㽭', '1', null, '2019-03-24', '12', '1', '2019-03-27', '��', '����', '989999');
INSERT INTO `snackinfo` VALUES ('23', '201903271694', 'ţ���', '100', '8', 'niurougan.jpg', 'С����', '�㽭', '1', null, '2019-03-14', '12', '1', '2019-03-27', '��', '������', '9991');
INSERT INTO `snackinfo` VALUES ('24', '201903272746', '��������', '100', '5', 'tilamishu.jpg', '����', '�Ϻ�', '0', null, '2019-03-14', '12', '1', '2019-03-27', '��', '����', '9992');
INSERT INTO `snackinfo` VALUES ('25', '201904174136', '����', '10', '1', 'mimi.jpg', '����', '�Ϻ�', '0', null, '2019-04-15', '12', '1', '2019-04-17', '��', '����', '99999');
INSERT INTO `snackinfo` VALUES ('26', '201904172196', '��Ƭ', '20', '8', 'leshishupian.jpg', '����', '�Ϻ�', '0', null, '2019-04-17', '12', '1', '2019-04-17', '��', '����', '9955');
INSERT INTO `snackinfo` VALUES ('27', '201904171833', '����', '10', '7', 'huangjinguoba.jpg', '����', '�Ϻ�', '0', null, '2019-04-17', '12', '1', '2019-04-17', '��', '����', '9995');
INSERT INTO `snackinfo` VALUES ('28', '201904174852', '��С��', '10', '10', 'dongxiaojie.jpg', '����', '�Ϻ�', '0', null, '2019-04-17', '18', '1', '2019-04-17', '��', '����', '100000');
INSERT INTO `snackinfo` VALUES ('29', '201904171022', 'С��ͷ', '10', '8', 'xiaomantou.jpg', '����', '�Ϻ�', '1', null, '2019-04-17', '12', '1', '2019-04-17', '��', '����', '200000');
INSERT INTO `snackinfo` VALUES ('30', '201904172485', '����', '10', '8', 'chaomi.jpg', '����', '', '1', null, '2019-04-17', '12', '1', '2019-04-17', '��', '����', '9000');
INSERT INTO `snackinfo` VALUES ('31', '201904172109', '������', '20', '8', 'danshengouliang.jpg', '����', '�Ϻ�', '0', null, '2019-04-18', '12', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('32', '201904174170', '�����', '10', '10', 'miaomiaoguo.jpg', '����', '�Ϻ�', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '����', '9997');
INSERT INTO `snackinfo` VALUES ('33', '201904173272', 'Ϻζ��', '20', '8', 'xiaweitiao.jpg', '����', '�Ϻ�', '0', null, '2019-04-02', '12', '1', '2019-04-17', '��', '����', '119996');
INSERT INTO `snackinfo` VALUES ('34', '201904175107', '���׾�', '20', '6', 'chumijuan.jpg', '����', '�Ϻ�', '1', null, '2019-04-05', '12', '1', '2019-04-17', '��', '����', '102291');
INSERT INTO `snackinfo` VALUES ('35', '201904175567', '����', '10', '7', 'xiangcuishutiao.jpg', '����', '�Ϻ�', '0', null, '2019-04-16', '12', '1', '2019-04-17', '��', '����', '100000');
INSERT INTO `snackinfo` VALUES ('36', '201904174966', 'ɳ����Ƭ', '20', '8', 'shawushupian.jpg', '����', '�Ϻ�', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '����', '2000');
INSERT INTO `snackinfo` VALUES ('37', '201904178458', '֨����Ƭ', '100', '6', 'zhicuishupian.jpg', '����', '�Ϻ�', '1', null, '2019-04-14', '12', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('38', '201904172586', '����', '20', '4', 'nailao.jpg', '����', '�Ϻ�', '0', null, '2019-04-18', '12', '1', '2019-04-17', '��', '����', '20000');
INSERT INTO `snackinfo` VALUES ('39', '201904178495', 'ɽ����צ', '20', '10', 'shanjiaofengzhua.jpg', '����', '�Ϻ�', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '19997');
INSERT INTO `snackinfo` VALUES ('40', '201904171216', '�ݽ�ţ��', '20', '6', 'paojiaoniurou.jpg', '����', '�Ϻ�', '1', null, '2019-03-07', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('41', '201904171172', '����Ѽ��', '20', '8', 'jiangshaoyachi.jpg', '����', '�Ϻ�', '0', null, '2019-04-20', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('42', '201904177856', 'С����', '20', '6', 'xiaojitui.jpg', '����', '�Ϻ�', '0', null, '2019-04-11', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('43', '201904172550', 'Ѽ��', '20', '4', 'yazhang.jpg', '����', '����', '0', null, '2019-04-21', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('44', '201904179981', '���⸬', '30', '6', 'zhuroupu.jpg', '����', '����', '0', null, '2019-04-12', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('45', '201904177197', 'ţ��Ƭ', '30', '9', 'niuroupian.jpg', '����', '����', '0', null, '2019-04-20', '12', '1', '2019-04-17', '��', '������', '9997');
INSERT INTO `snackinfo` VALUES ('46', '201904175915', 'Ѽ��', '10', '8', 'yabo.jpg', '����', '����', '1', null, '2019-04-14', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('47', '201904176852', '±ţ��', '30', '9', 'luniurou.jpg', '����', '����', '1', null, '2019-04-13', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('48', '201904176635', '��Ƥ��', '20', '8', 'zhupiji.jpg', '����', '����', '0', null, '2019-04-14', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('49', '201904174593', '����Ѽצ', '20', '7', 'gongfuyazhua.jpg', '����', '����', '1', null, '2019-04-12', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('50', '201904177641', 'ţ��˿', '20', '8', 'niurousi.jpg', '����', '����', '0', null, '2019-04-14', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('51', '201904171818', '����', '30', '9', 'zhuti.jpg', '����', '����', '0', null, '2019-04-13', '12', '1', '2019-04-17', '��', '������', '9993');
INSERT INTO `snackinfo` VALUES ('52', '201904177621', '����', '20', '8', 'chizhong.jpg', '����', '����', '1', null, '2019-03-20', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('53', '201904176052', '����֭', '10', '9', 'mitaozhi.jpg', '����', '����', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('54', '201904176090', '��������', '30', '8', 'natiekafei.jpg', '����', '����', '0', null, '2019-03-07', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('55', '201904177963', '�����', '10', '9', 'bolele.jpg', '����', '����', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '9998');
INSERT INTO `snackinfo` VALUES ('56', '201904177044', '����ˮ', '20', '6', 'miningshui.jpg', '����', '����', '1', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '9999');
INSERT INTO `snackinfo` VALUES ('57', '201904173371', '��θ��ζ', '20', '8', 'yangweiruwei.jpg', '����', '����', '0', null, '2019-04-17', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('58', '201904171125', '�Ƕ���', '50', '9', 'tangdounai.jpg', '����', '����', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('59', '201904179146', '˿���̲�', '10', '7', 'siwainaicha.jpg', '����', '�㶫', '1', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('60', '201904177428', '�����', '20', '5', 'rusuanjun.jpg', '����', '�㶫', '0', null, '2019-03-07', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('61', '201904176104', '��ݮ����', '20', '8', 'lanmeiyinliao.jpg', '����', '�㶫', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('62', '201904171606', 'ţ���', '10', '8', 'niurucha.jpg', '����', '�㶫', '0', null, '2019-04-05', '12', '1', '2019-04-17', '��', '������', '9996');
INSERT INTO `snackinfo` VALUES ('63', '201904172259', '��ϡ', '10', '10', 'mixi.jpg', '����', '�㶫', '0', null, '2019-04-17', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('64', '201904176802', '��ŵ����', '20', '8', 'qinuokafei.jpg', '����', '�㶫', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('65', '201904175746', '����¶', '20', '7', 'ximilu.jpg', '����', '�㶫', '1', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '10000');
INSERT INTO `snackinfo` VALUES ('66', '201904177256', 'Ҭ֭', '20', '8', 'yezhi.jpg', '����', '�㶫', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '������', '9999');
INSERT INTO `snackinfo` VALUES ('67', '201904177149', 'ţ�̹���', '20', '8', 'niunaiguodong.jpg', '����', '�㶫', '0', null, '2019-04-17', '12', '1', '2019-04-17', '��', '����', '9997');
INSERT INTO `snackinfo` VALUES ('68', '201904172033', '���⵰', '10', '5', 'shanguangdan.jpg', '����', '�㶫', '0', null, '2019-04-17', '12', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('69', '201904176739', '������', '20', '9', 'kouxiangtang.jpg', '����', '�㶫', '1', null, '2019-04-20', '43', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('70', '201904174121', '���ӹ���', '20', '8', 'juziguobei.jpg', '����', '�㶫', '0', null, '2019-04-13', '12', '1', '2019-04-17', '�úú�', '����', '10000');
INSERT INTO `snackinfo` VALUES ('71', '201904175818', '���ҹ���', '20', '8', 'youlaoguodong.jpg', '����', '�㶫', '0', null, '2019-04-17', '12', '1', '2019-04-17', '�ú�', '����', '10000');
INSERT INTO `snackinfo` VALUES ('72', '201904179160', '��ݮ����', '20', '7', 'budingcaomei.jpg', '����', '�㶫', '1', null, '2019-04-09', '12', '1', '2019-04-17', '�úúúú�', '����', '10000');
INSERT INTO `snackinfo` VALUES ('73', '201904174125', 'ԭζ����', '20', '8', 'budingyuanwei.jpg', '����', '�㶫', '0', null, '2019-04-17', '18', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('74', '201904172373', '����', '20', '8', 'xingqiubei.jpg', '����', '�㶫', '1', null, '2019-04-19', '12', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('75', '201904175309', '������', '20', '7', 'xinxinbei.jpg', '����', '����', '0', null, '2019-04-19', '12', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('76', '201904178276', '���Ѹ�', '10', '9', 'putaogan.jpg', '����', '����', '1', null, '2019-04-19', '12', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('77', '201904177722', 'â����', '20', '5', 'mangguogan.jpg', '����', '', '0', null, '2019-04-20', '12', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('78', '201904171055', '����', '10', '8', 'taotiao.jpg', 'ǡǡ', '', '0', null, '2019-04-07', '12', '1', '2019-04-17', '��', '����', '10000');
INSERT INTO `snackinfo` VALUES ('79', '201904172661', '��÷', '10', '8', 'huamei.jpg', '����', '����', '1', null, '2019-03-20', '18', '1', '2019-04-17', '�ú�', '����', '10000');
INSERT INTO `snackinfo` VALUES ('80', '201904173962', '���', '10', '7', 'huamei.jpg', '����', '����', '0', null, '2019-04-04', '12', '1', '2019-04-17', '�úú�', '����', '10000');
INSERT INTO `snackinfo` VALUES ('81', '201907029034', '����', '21', '1', 'guazi.jpg', '����', '����', '0', null, '2019-04-17', '12', '1', '2019-07-02', '��', '����', '10000');


DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_realname` varchar(255) DEFAULT NULL COMMENT '��ʵ����',
  `u_username` varchar(255) DEFAULT NULL COMMENT '�û���',
  `u_password` varchar(255) DEFAULT NULL COMMENT '����',
  `u_money` varchar(255) DEFAULT NULL COMMENT 'Ǯ�����',
  `u_phone` varchar(255) DEFAULT NULL COMMENT '�ֻ���',
  `u_email` varchar(255) DEFAULT NULL COMMENT '����',
  `u_sex` char(255) DEFAULT NULL COMMENT '�Ա�',
  `u_resgistDate` date DEFAULT NULL COMMENT '��������',
  `u_address` varchar(255) DEFAULT NULL COMMENT '��ַ',
  `u_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


INSERT INTO `userinfo` VALUES ('17', '����', '����', '123456', '9983.0', '15810100256', '761695@qq.com', 'Ů', '2019-11-01', '�㽭', null);
INSERT INTO `userinfo` VALUES ('18', '����', 'Quin', '123', '11091.0', '13520109202', '1193284480@qq.com', '��', '2019-11-04', '�Ϻ�', '1');
INSERT INTO `userinfo` VALUES ('19', '�ش�', '�ڰ���22', '123', '9930.0', '13656565656', '123456@qq.com', '��', '2019-12-05', '����', null);
INSERT INTO `userinfo` VALUES ('20', '����˿�����������', 'marisa', '123', '9837.0', '13565659898', 'artusan@qq.com', 'Ů', '2019-12-07', '����', null);


DROP PROCEDURE IF EXISTS `SearchSum`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSum`(in a int,in b int)
BEGIN
set @x=0;
set @x =a+b;
SELECT @x as num;
end
;;
DELIMITER ;
