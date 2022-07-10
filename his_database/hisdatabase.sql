/*
 Navicat Premium Data Transfer

 Source Server         : 云数据库
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : localhost:3306
 Source Schema         : hisdatabase

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 21/05/2022 10:37:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `areaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '产地id',
  `areaName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产地',
  PRIMARY KEY (`areaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, '北京同仁堂股份有限公司同仁堂制药厂');
INSERT INTO `area` VALUES (2, '北京同仁堂科技发展股份有限公司制药厂');
INSERT INTO `area` VALUES (3, '长春海外制药集团有限公司');
INSERT INTO `area` VALUES (4, '吉林吉春制药股份有限公司');
INSERT INTO `area` VALUES (5, '长春人民药业集团有限公司');
INSERT INTO `area` VALUES (6, '昆明中药厂有限公司');
INSERT INTO `area` VALUES (7, '陕西东泰制药有限公司');
INSERT INTO `area` VALUES (8, '长春银诺克药业有限公司');
INSERT INTO `area` VALUES (9, '云南白药集团股份有限公司');
INSERT INTO `area` VALUES (10, '威海紫光科技园有限公司');
INSERT INTO `area` VALUES (11, '通化振霖药业有限责任公司');
INSERT INTO `area` VALUES (12, '山西华康药业股份有限公司');
INSERT INTO `area` VALUES (13, '广东恒健制药有限公司');
INSERT INTO `area` VALUES (14, '太极集团四川绵阳制药有限公司');
INSERT INTO `area` VALUES (15, '修正药业集团股份有限公司');
INSERT INTO `area` VALUES (16, '石药集团欧意药业有限公司');
INSERT INTO `area` VALUES (17, '吉林省俊宏药业有限公司');
INSERT INTO `area` VALUES (18, '云南腾药制药股份有限公司');
INSERT INTO `area` VALUES (19, '湖南方盛制药股份有限公司');
INSERT INTO `area` VALUES (20, '兰州佛慈制药股份有限公司');
INSERT INTO `area` VALUES (21, '太极集团重庆桐君阁药厂有限公司');
INSERT INTO `area` VALUES (22, '广东仙乐制药有限公司');
INSERT INTO `area` VALUES (23, '黑龙江省济仁药业有限公司');
INSERT INTO `area` VALUES (24, '天津中新药业集团股份有限公司达仁堂制药厂');
INSERT INTO `area` VALUES (25, '威海百合生物技术股份有限公司');
INSERT INTO `area` VALUES (26, '江苏鱼跃医疗设备股份有限公司');
INSERT INTO `area` VALUES (27, '哈药集团世一堂制药厂');
INSERT INTO `area` VALUES (28, '南宁市维威制药有限公司');
INSERT INTO `area` VALUES (29, '广东华南药业集团有限公司');
INSERT INTO `area` VALUES (30, '齐鲁制药有限公司');
INSERT INTO `area` VALUES (31, '通药制药集团股份有限公司');
INSERT INTO `area` VALUES (32, '广州白云山和记黄埔中药有限公司');
INSERT INTO `area` VALUES (33, '药都制药集团股份有限公司');
INSERT INTO `area` VALUES (34, '南京同仁堂药业有限责任公司');
INSERT INTO `area` VALUES (35, '江西药都樟树制药有限公司');
INSERT INTO `area` VALUES (36, '广州白云山制药股份有限公司广州白云山制药总厂');
INSERT INTO `area` VALUES (37, '吉林省通化博祥药业股份有限公司');
INSERT INTO `area` VALUES (38, '河南省济源市济世药业有限公司');
INSERT INTO `area` VALUES (39, '哈药集团制药六厂');
INSERT INTO `area` VALUES (40, '吉林龙泰制药股份有限公司');
INSERT INTO `area` VALUES (41, '九芝堂股份有限公司');
INSERT INTO `area` VALUES (42, '黑龙江天龙药业有限公司');
INSERT INTO `area` VALUES (43, '云南龙发制药有限公司');
INSERT INTO `area` VALUES (44, '福建太平洋制药有限公司');
INSERT INTO `area` VALUES (45, '黄石卫生材料药业有限公司');
INSERT INTO `area` VALUES (46, '珠海联邦制药股份有限公司中山分公司');
INSERT INTO `area` VALUES (47, '包头中药有限责任公司');
INSERT INTO `area` VALUES (48, '汤臣倍健股份有限公司');
INSERT INTO `area` VALUES (49, '通化茂祥制药有限公司');
INSERT INTO `area` VALUES (50, '哈药集团制药总厂');

-- ----------------------------
-- Table structure for bed
-- ----------------------------
DROP TABLE IF EXISTS `bed`;
CREATE TABLE `bed`  (
  `bedId` int(11) NOT NULL AUTO_INCREMENT,
  `bedName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmentId` int(11) NOT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `Price` double NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`bedId`) USING BTREE,
  INDEX `fk_bedDepartmentid`(`departmentId`) USING BTREE,
  CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bed
-- ----------------------------
INSERT INTO `bed` VALUES (1, '呼吸内科1', 1, 1, 10);
INSERT INTO `bed` VALUES (2, '呼吸内科2', 1, 1, 10);
INSERT INTO `bed` VALUES (3, '呼吸内科3', 1, 1, 10);
INSERT INTO `bed` VALUES (4, '呼吸内科4', 1, 1, 10);
INSERT INTO `bed` VALUES (5, '呼吸内科5', 1, 1, 10);
INSERT INTO `bed` VALUES (6, '呼吸内科6', 1, 1, 10);
INSERT INTO `bed` VALUES (7, '呼吸内科7', 1, 1, 10);
INSERT INTO `bed` VALUES (8, '呼吸内科8', 1, 1, 10);
INSERT INTO `bed` VALUES (9, '呼吸内科9', 1, 1, 10);
INSERT INTO `bed` VALUES (10, '呼吸内科10', 1, 1, 10);
INSERT INTO `bed` VALUES (11, '消化内科1', 2, 1, 10);
INSERT INTO `bed` VALUES (12, '消化内科4', 2, 1, 10);
INSERT INTO `bed` VALUES (13, '消化内科9', 2, 1, 10);
INSERT INTO `bed` VALUES (14, '消化内科10', 2, 1, 10);
INSERT INTO `bed` VALUES (15, '消化内科2', 2, 0, 10);
INSERT INTO `bed` VALUES (16, '消化内科3', 2, 1, 10);
INSERT INTO `bed` VALUES (17, '消化内科6', 2, 1, 10);
INSERT INTO `bed` VALUES (18, '消化内科5', 2, 0, 10);
INSERT INTO `bed` VALUES (19, '消化内科7', 2, 0, 10);
INSERT INTO `bed` VALUES (20, '消化内科8', 2, 1, 10);
INSERT INTO `bed` VALUES (21, '泌尿内科3', 3, 0, 10);
INSERT INTO `bed` VALUES (22, '泌尿内科10', 3, 1, 10);
INSERT INTO `bed` VALUES (23, '泌尿内科9', 3, 0, 10);
INSERT INTO `bed` VALUES (24, '泌尿内科2', 3, 0, 10);
INSERT INTO `bed` VALUES (25, '泌尿内科4', 3, 0, 10);
INSERT INTO `bed` VALUES (26, '泌尿内科5', 3, 1, 10);
INSERT INTO `bed` VALUES (27, '泌尿内科1', 3, 1, 10);
INSERT INTO `bed` VALUES (28, '泌尿内科6', 3, 0, 10);
INSERT INTO `bed` VALUES (29, '泌尿内科7', 3, 1, 10);
INSERT INTO `bed` VALUES (30, '泌尿内科8', 3, 0, 10);
INSERT INTO `bed` VALUES (31, '心内科2', 4, 0, 30);
INSERT INTO `bed` VALUES (32, '心内科3', 4, 0, 30);
INSERT INTO `bed` VALUES (33, '心内科9', 4, 0, 30);
INSERT INTO `bed` VALUES (34, '心内科10', 4, 0, 30);
INSERT INTO `bed` VALUES (35, '心内科1', 4, 0, 30);
INSERT INTO `bed` VALUES (36, '心内科4', 4, 0, 30);
INSERT INTO `bed` VALUES (37, '心内科6', 4, 0, 30);
INSERT INTO `bed` VALUES (38, '心内科5', 4, 1, 30);
INSERT INTO `bed` VALUES (39, '心内科7', 4, 1, 30);
INSERT INTO `bed` VALUES (40, '心内科8', 4, 1, 30);
INSERT INTO `bed` VALUES (41, '血液科2', 5, 1, 20);
INSERT INTO `bed` VALUES (42, '血液科3', 5, 1, 20);
INSERT INTO `bed` VALUES (43, '血液科9', 5, 1, 20);
INSERT INTO `bed` VALUES (44, '血液科10', 5, 1, 20);
INSERT INTO `bed` VALUES (45, '血液科1', 5, 1, 20);
INSERT INTO `bed` VALUES (46, '血液科4', 5, 1, 20);
INSERT INTO `bed` VALUES (47, '血液科5', 5, 1, 20);
INSERT INTO `bed` VALUES (48, '血液科7', 5, 1, 20);
INSERT INTO `bed` VALUES (49, '血液科6', 5, 1, 20);
INSERT INTO `bed` VALUES (50, '血液科8', 5, 1, 20);
INSERT INTO `bed` VALUES (51, '内分泌科1', 6, 1, 10);
INSERT INTO `bed` VALUES (52, '内分泌科3', 6, 1, 10);
INSERT INTO `bed` VALUES (53, '内分泌科9', 6, 1, 10);
INSERT INTO `bed` VALUES (54, '内分泌科10', 6, 0, 10);
INSERT INTO `bed` VALUES (55, '内分泌科2', 6, 0, 10);
INSERT INTO `bed` VALUES (56, '内分泌科4', 6, 1, 10);
INSERT INTO `bed` VALUES (57, '内分泌科5', 6, 1, 10);
INSERT INTO `bed` VALUES (58, '内分泌科6', 6, 1, 10);
INSERT INTO `bed` VALUES (59, '内分泌科7', 6, 1, 10);
INSERT INTO `bed` VALUES (60, '内分泌科8', 6, 0, 10);
INSERT INTO `bed` VALUES (61, '神经内科1', 7, 0, 25);
INSERT INTO `bed` VALUES (62, '神经内科4', 7, 1, 25);
INSERT INTO `bed` VALUES (63, '神经内科9', 7, 0, 25);
INSERT INTO `bed` VALUES (64, '神经内科10', 7, 1, 25);
INSERT INTO `bed` VALUES (65, '神经内科2', 7, 1, 25);
INSERT INTO `bed` VALUES (66, '神经内科3', 7, 1, 25);
INSERT INTO `bed` VALUES (67, '神经内科5', 7, 1, 25);
INSERT INTO `bed` VALUES (68, '神经内科6', 7, 0, 25);
INSERT INTO `bed` VALUES (69, '神经内科7', 7, 1, 25);
INSERT INTO `bed` VALUES (70, '神经内科8', 7, 1, 25);
INSERT INTO `bed` VALUES (71, '小儿科1', 8, 0, 15);
INSERT INTO `bed` VALUES (72, '小儿科4', 8, 0, 15);
INSERT INTO `bed` VALUES (73, '小儿科9', 8, 0, 15);
INSERT INTO `bed` VALUES (74, '小儿科2', 8, 1, 15);
INSERT INTO `bed` VALUES (75, '小儿科3', 8, 0, 15);
INSERT INTO `bed` VALUES (76, '小儿科6', 8, 0, 15);
INSERT INTO `bed` VALUES (77, '小儿科5', 8, 1, 15);
INSERT INTO `bed` VALUES (78, '小儿科7', 8, 0, 15);
INSERT INTO `bed` VALUES (79, '小儿科8', 8, 0, 15);
INSERT INTO `bed` VALUES (80, '小儿科10', 8, 0, 15);
INSERT INTO `bed` VALUES (81, '康复科1', 9, 1, 14);
INSERT INTO `bed` VALUES (82, '康复科2', 9, 0, 14);
INSERT INTO `bed` VALUES (83, '康复科3', 9, 0, 14);
INSERT INTO `bed` VALUES (84, '康复科4', 9, 0, 14);
INSERT INTO `bed` VALUES (85, '康复科5', 9, 0, 14);
INSERT INTO `bed` VALUES (86, '康复科6', 9, 1, 14);
INSERT INTO `bed` VALUES (87, '康复科7', 9, 0, 14);
INSERT INTO `bed` VALUES (88, '康复科8', 9, 0, 14);
INSERT INTO `bed` VALUES (89, '康复科9', 9, 0, 14);
INSERT INTO `bed` VALUES (90, '康复科10', 9, 0, 14);
INSERT INTO `bed` VALUES (91, '感染科1', 10, 0, 12);
INSERT INTO `bed` VALUES (92, '感染科3', 10, 0, 12);
INSERT INTO `bed` VALUES (93, '感染科10', 10, 0, 12);
INSERT INTO `bed` VALUES (94, '感染科9', 10, 0, 12);
INSERT INTO `bed` VALUES (95, '感染科2', 10, 0, 12);
INSERT INTO `bed` VALUES (96, '感染科4', 10, 0, 12);
INSERT INTO `bed` VALUES (97, '感染科5', 10, 0, 12);
INSERT INTO `bed` VALUES (98, '感染科6', 10, 1, 12);
INSERT INTO `bed` VALUES (99, '感染科8', 10, 1, 12);
INSERT INTO `bed` VALUES (100, '感染科7', 10, 0, 12);
INSERT INTO `bed` VALUES (101, '普外科2', 11, 0, 10);
INSERT INTO `bed` VALUES (102, '普外科3', 11, 0, 10);
INSERT INTO `bed` VALUES (103, '普外科9', 11, 1, 10);
INSERT INTO `bed` VALUES (104, '普外科10', 11, 0, 10);
INSERT INTO `bed` VALUES (105, '普外科1', 11, 0, 10);
INSERT INTO `bed` VALUES (106, '普外科4', 11, 1, 10);
INSERT INTO `bed` VALUES (107, '普外科5', 11, 1, 10);
INSERT INTO `bed` VALUES (108, '普外科6', 11, 0, 10);
INSERT INTO `bed` VALUES (109, '普外科7', 11, 0, 10);
INSERT INTO `bed` VALUES (110, '普外科8', 11, 1, 10);
INSERT INTO `bed` VALUES (111, '骨科1', 12, 0, 10);
INSERT INTO `bed` VALUES (112, '骨科3', 12, 0, 10);
INSERT INTO `bed` VALUES (113, '骨科9', 12, 1, 10);
INSERT INTO `bed` VALUES (114, '骨科10', 12, 1, 10);
INSERT INTO `bed` VALUES (115, '骨科2', 12, 1, 10);
INSERT INTO `bed` VALUES (116, '骨科4', 12, 1, 10);
INSERT INTO `bed` VALUES (117, '骨科6', 12, 1, 10);
INSERT INTO `bed` VALUES (118, '骨科5', 12, 0, 10);
INSERT INTO `bed` VALUES (119, '骨科7', 12, 1, 10);
INSERT INTO `bed` VALUES (120, '骨科8', 12, 1, 10);
INSERT INTO `bed` VALUES (121, '神经外科1', 13, 1, 16);
INSERT INTO `bed` VALUES (122, '神经外科3', 13, 1, 16);
INSERT INTO `bed` VALUES (123, '神经外科9', 13, 1, 16);
INSERT INTO `bed` VALUES (124, '神经外科10', 13, 0, 16);
INSERT INTO `bed` VALUES (125, '神经外科2', 13, 1, 16);
INSERT INTO `bed` VALUES (126, '神经外科4', 13, 1, 16);
INSERT INTO `bed` VALUES (127, '神经外科5', 13, 1, 16);
INSERT INTO `bed` VALUES (128, '神经外科6', 13, 1, 16);
INSERT INTO `bed` VALUES (129, '神经外科8', 13, 1, 16);
INSERT INTO `bed` VALUES (130, '神经外科7', 13, 0, 16);
INSERT INTO `bed` VALUES (131, '肝胆外科1', 14, 1, 14);
INSERT INTO `bed` VALUES (132, '肝胆外科3', 14, 1, 14);
INSERT INTO `bed` VALUES (133, '肝胆外科9', 14, 1, 14);
INSERT INTO `bed` VALUES (134, '肝胆外科10', 14, 1, 14);
INSERT INTO `bed` VALUES (135, '肝胆外科2', 14, 0, 14);
INSERT INTO `bed` VALUES (136, '肝胆外科4', 14, 1, 14);
INSERT INTO `bed` VALUES (137, '肝胆外科5', 14, 0, 14);
INSERT INTO `bed` VALUES (138, '肝胆外科6', 14, 0, 14);
INSERT INTO `bed` VALUES (139, '肝胆外科7', 14, 0, 14);
INSERT INTO `bed` VALUES (140, '肝胆外科8', 14, 1, 14);
INSERT INTO `bed` VALUES (141, '泌尿外科2', 15, 0, 13);
INSERT INTO `bed` VALUES (142, '泌尿外科3', 15, 1, 13);
INSERT INTO `bed` VALUES (143, '泌尿外科10', 15, 0, 13);
INSERT INTO `bed` VALUES (144, '泌尿外科9', 15, 0, 13);
INSERT INTO `bed` VALUES (145, '泌尿外科1', 15, 0, 13);
INSERT INTO `bed` VALUES (146, '泌尿外科4', 15, 0, 13);
INSERT INTO `bed` VALUES (147, '泌尿外科5', 15, 0, 13);
INSERT INTO `bed` VALUES (148, '泌尿外科6', 15, 1, 13);
INSERT INTO `bed` VALUES (149, '泌尿外科7', 15, 0, 13);
INSERT INTO `bed` VALUES (150, '泌尿外科8', 15, 1, 13);
INSERT INTO `bed` VALUES (151, '烧伤科1', 16, 0, 22);
INSERT INTO `bed` VALUES (152, '烧伤科3', 16, 0, 22);
INSERT INTO `bed` VALUES (153, '烧伤科9', 16, 0, 22);
INSERT INTO `bed` VALUES (154, '烧伤科2', 16, 1, 22);
INSERT INTO `bed` VALUES (155, '烧伤科4', 16, 1, 22);
INSERT INTO `bed` VALUES (156, '烧伤科5', 16, 1, 22);
INSERT INTO `bed` VALUES (157, '烧伤科6', 16, 1, 22);
INSERT INTO `bed` VALUES (158, '烧伤科7', 16, 0, 22);
INSERT INTO `bed` VALUES (159, '烧伤科8', 16, 1, 22);
INSERT INTO `bed` VALUES (160, '烧伤科10', 16, 0, 22);
INSERT INTO `bed` VALUES (161, '妇科2', 17, 1, 13);
INSERT INTO `bed` VALUES (162, '妇科3', 17, 0, 13);
INSERT INTO `bed` VALUES (163, '妇科9', 17, 0, 13);
INSERT INTO `bed` VALUES (164, '妇科10', 17, 0, 13);
INSERT INTO `bed` VALUES (165, '妇科1', 17, 0, 13);
INSERT INTO `bed` VALUES (166, '妇科4', 17, 1, 13);
INSERT INTO `bed` VALUES (167, '妇科6', 17, 1, 13);
INSERT INTO `bed` VALUES (168, '妇科5', 17, 0, 13);
INSERT INTO `bed` VALUES (169, '妇科7', 17, 0, 13);
INSERT INTO `bed` VALUES (170, '妇科8', 17, 1, 13);
INSERT INTO `bed` VALUES (171, '产科2', 18, 0, 23);
INSERT INTO `bed` VALUES (172, '产科4', 18, 0, 23);
INSERT INTO `bed` VALUES (173, '产科3', 18, 0, 23);
INSERT INTO `bed` VALUES (174, '产科9', 18, 0, 23);
INSERT INTO `bed` VALUES (175, '产科10', 18, 0, 23);
INSERT INTO `bed` VALUES (176, '产科1', 18, 1, 23);
INSERT INTO `bed` VALUES (177, '产科5', 18, 1, 23);
INSERT INTO `bed` VALUES (178, '产科6', 18, 0, 23);
INSERT INTO `bed` VALUES (179, '产科7', 18, 0, 23);
INSERT INTO `bed` VALUES (180, '产科8', 18, 0, 23);
INSERT INTO `bed` VALUES (181, '血透室2', 19, 1, 35);
INSERT INTO `bed` VALUES (182, '血透室3', 19, 0, 35);
INSERT INTO `bed` VALUES (183, '血透室4', 19, 1, 35);
INSERT INTO `bed` VALUES (184, '血透室7', 19, 0, 35);
INSERT INTO `bed` VALUES (185, '血透室9', 19, 0, 35);
INSERT INTO `bed` VALUES (186, '血透室10', 19, 0, 35);
INSERT INTO `bed` VALUES (187, '血透室1', 19, 0, 35);
INSERT INTO `bed` VALUES (188, '血透室6', 19, 0, 35);
INSERT INTO `bed` VALUES (189, '血透室5', 19, 0, 35);
INSERT INTO `bed` VALUES (190, '血透室8', 19, 1, 35);
INSERT INTO `bed` VALUES (191, '重症监护室2', 20, 0, 50);
INSERT INTO `bed` VALUES (192, '重症监护室3', 20, 1, 50);
INSERT INTO `bed` VALUES (193, '重症监护室9', 20, 1, 50);
INSERT INTO `bed` VALUES (194, '重症监护室10', 20, 0, 50);
INSERT INTO `bed` VALUES (195, '重症监护室1', 20, 0, 50);
INSERT INTO `bed` VALUES (196, '重症监护室4', 20, 0, 50);
INSERT INTO `bed` VALUES (197, '重症监护室5', 20, 1, 50);
INSERT INTO `bed` VALUES (198, '重症监护室6', 20, 0, 50);
INSERT INTO `bed` VALUES (199, '重症监护室7', 20, 1, 50);
INSERT INTO `bed` VALUES (200, '重症监护室8', 20, 0, 50);

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`departmentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, '呼吸内科');
INSERT INTO `departments` VALUES (2, '消化内科');
INSERT INTO `departments` VALUES (3, '泌尿内科');
INSERT INTO `departments` VALUES (4, '心内科');
INSERT INTO `departments` VALUES (5, '血液科');
INSERT INTO `departments` VALUES (6, '内分泌科');
INSERT INTO `departments` VALUES (7, '神经内科');
INSERT INTO `departments` VALUES (8, '小儿科');
INSERT INTO `departments` VALUES (9, '康复科');
INSERT INTO `departments` VALUES (10, '感染科');
INSERT INTO `departments` VALUES (11, '普外科');
INSERT INTO `departments` VALUES (12, '骨科');
INSERT INTO `departments` VALUES (13, '神经外科');
INSERT INTO `departments` VALUES (14, '肝胆外科');
INSERT INTO `departments` VALUES (15, '泌尿外科');
INSERT INTO `departments` VALUES (16, '烧伤科');
INSERT INTO `departments` VALUES (17, '妇科');
INSERT INTO `departments` VALUES (18, '产科');
INSERT INTO `departments` VALUES (19, '血透室');
INSERT INTO `departments` VALUES (20, '重症监护室');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctorId` int(11) NOT NULL AUTO_INCREMENT,
  `doctorName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`doctorId`) USING BTREE,
  INDEX `fk_department`(`departmentId`) USING BTREE,
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '子轩萧', 8);
INSERT INTO `doctor` VALUES (2, '果罗', 18);
INSERT INTO `doctor` VALUES (3, '鹏煊于', 16);
INSERT INTO `doctor` VALUES (4, '鑫磊廖', 11);
INSERT INTO `doctor` VALUES (5, '炎彬曹', 10);
INSERT INTO `doctor` VALUES (6, '君浩莫', 20);
INSERT INTO `doctor` VALUES (7, '华佗', 5);
INSERT INTO `doctor` VALUES (8, '思龙', 12);
INSERT INTO `doctor` VALUES (9, '嘉懿萧', 6);
INSERT INTO `doctor` VALUES (10, '凯瑞周', 18);
INSERT INTO `doctor` VALUES (11, '立果萧', 15);
INSERT INTO `doctor` VALUES (12, '煜城范', 6);
INSERT INTO `doctor` VALUES (13, '文昊雷', 4);
INSERT INTO `doctor` VALUES (14, '鹏姚', 16);
INSERT INTO `doctor` VALUES (15, '峻熙范', 16);
INSERT INTO `doctor` VALUES (16, '驰彭', 9);
INSERT INTO `doctor` VALUES (17, '鸿涛钱', 3);
INSERT INTO `doctor` VALUES (18, '乐驹刘', 16);
INSERT INTO `doctor` VALUES (19, '志泽龚', 6);
INSERT INTO `doctor` VALUES (20, '瑾瑜韩', 11);
INSERT INTO `doctor` VALUES (21, '振家王', 15);
INSERT INTO `doctor` VALUES (22, '晋鹏廖', 20);
INSERT INTO `doctor` VALUES (23, '文轩余', 11);
INSERT INTO `doctor` VALUES (24, '聪健贺', 14);
INSERT INTO `doctor` VALUES (25, '文博邱', 6);
INSERT INTO `doctor` VALUES (26, '越彬蔡', 5);
INSERT INTO `doctor` VALUES (27, '绍齐戴', 20);
INSERT INTO `doctor` VALUES (28, '雨泽袁', 19);
INSERT INTO `doctor` VALUES (29, '耀杰叶', 19);
INSERT INTO `doctor` VALUES (30, '钰轩邹', 5);
INSERT INTO `doctor` VALUES (31, '峻熙熊', 19);
INSERT INTO `doctor` VALUES (32, '皓轩洪', 9);
INSERT INTO `doctor` VALUES (33, '烨伟余', 19);
INSERT INTO `doctor` VALUES (34, '志强余', 17);
INSERT INTO `doctor` VALUES (35, '楷瑞宋', 12);
INSERT INTO `doctor` VALUES (36, '文董', 1);
INSERT INTO `doctor` VALUES (37, '伟诚傅', 7);
INSERT INTO `doctor` VALUES (38, '昊然郑', 8);
INSERT INTO `doctor` VALUES (39, '志泽杨', 16);
INSERT INTO `doctor` VALUES (40, '君浩韦', 15);
INSERT INTO `doctor` VALUES (41, '鹏飞侯', 5);
INSERT INTO `doctor` VALUES (42, '明高', 11);
INSERT INTO `doctor` VALUES (43, '越彬龙', 16);
INSERT INTO `doctor` VALUES (44, '哲瀚孟', 20);
INSERT INTO `doctor` VALUES (45, '泽洋陶', 2);
INSERT INTO `doctor` VALUES (46, '越泽赖', 1);
INSERT INTO `doctor` VALUES (47, '文昊白', 7);
INSERT INTO `doctor` VALUES (48, '浩然万', 7);
INSERT INTO `doctor` VALUES (49, '靖琪廖', 6);
INSERT INTO `doctor` VALUES (50, '扁鹊', 5);
INSERT INTO `doctor` VALUES (51, '浩宇金', 19);
INSERT INTO `doctor` VALUES (52, '哲瀚萧', 9);
INSERT INTO `doctor` VALUES (53, '子轩任', 5);
INSERT INTO `doctor` VALUES (54, '明哲李', 5);
INSERT INTO `doctor` VALUES (55, '瑞霖段', 4);
INSERT INTO `doctor` VALUES (56, '昊天张', 9);
INSERT INTO `doctor` VALUES (57, '乐驹万', 11);
INSERT INTO `doctor` VALUES (58, '语堂谭', 14);
INSERT INTO `doctor` VALUES (59, '伟祺陆', 10);
INSERT INTO `doctor` VALUES (60, '煜城尹', 11);
INSERT INTO `doctor` VALUES (61, '文昊白', 5);
INSERT INTO `doctor` VALUES (62, '鸿煊黄', 20);
INSERT INTO `doctor` VALUES (63, '鸿煊谢', 12);
INSERT INTO `doctor` VALUES (64, '明轩傅', 20);
INSERT INTO `doctor` VALUES (65, '鹤轩董', 14);
INSERT INTO `doctor` VALUES (66, '博文洪', 20);
INSERT INTO `doctor` VALUES (67, 'test', 5);
INSERT INTO `doctor` VALUES (68, '睿渊王', 18);
INSERT INTO `doctor` VALUES (69, '华佗3', 4);
INSERT INTO `doctor` VALUES (70, '博文韩', 3);
INSERT INTO `doctor` VALUES (71, '明熊', 19);
INSERT INTO `doctor` VALUES (72, '弘文吕', 6);
INSERT INTO `doctor` VALUES (73, '炎彬黎', 20);
INSERT INTO `doctor` VALUES (74, '伟诚武', 15);
INSERT INTO `doctor` VALUES (75, '琪严', 8);
INSERT INTO `doctor` VALUES (76, '潇然叶', 2);
INSERT INTO `doctor` VALUES (77, '楷瑞高', 13);
INSERT INTO `doctor` VALUES (78, '思源金', 10);
INSERT INTO `doctor` VALUES (79, '绍辉段', 10);
INSERT INTO `doctor` VALUES (80, '天翊蒋', 7);
INSERT INTO `doctor` VALUES (81, '耀杰傅', 20);
INSERT INTO `doctor` VALUES (82, '智宸孟', 7);
INSERT INTO `doctor` VALUES (83, '鸿煊范', 17);
INSERT INTO `doctor` VALUES (84, '鑫磊苏', 6);
INSERT INTO `doctor` VALUES (85, '志强吕', 5);
INSERT INTO `doctor` VALUES (86, '炎彬何', 17);
INSERT INTO `doctor` VALUES (87, '瑾瑜刘', 1);
INSERT INTO `doctor` VALUES (88, '烨磊姚', 4);
INSERT INTO `doctor` VALUES (89, '越泽任', 18);
INSERT INTO `doctor` VALUES (90, '伟宸石', 1);
INSERT INTO `doctor` VALUES (91, '子轩邱', 1);
INSERT INTO `doctor` VALUES (92, '智渊余', 12);
INSERT INTO `doctor` VALUES (93, '李时珍', 3);
INSERT INTO `doctor` VALUES (94, '鹏飞秦', 14);
INSERT INTO `doctor` VALUES (95, '明辉陶', 17);
INSERT INTO `doctor` VALUES (96, '烨磊吴', 6);
INSERT INTO `doctor` VALUES (97, '钰轩张', 11);
INSERT INTO `doctor` VALUES (98, '雪松石', 15);
INSERT INTO `doctor` VALUES (99, '晟睿李', 17);
INSERT INTO `doctor` VALUES (100, '子涵曾', 2);

-- ----------------------------
-- Table structure for hospitalprice
-- ----------------------------
DROP TABLE IF EXISTS `hospitalprice`;
CREATE TABLE `hospitalprice`  (
  `hospitalPriceListId` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `registerId` int(11) NOT NULL COMMENT '住院号',
  `drugName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `drugNum` int(11) NOT NULL COMMENT '数量',
  `inHospitalPrice` double NOT NULL COMMENT '价钱',
  `inHospitalPriceTotal` double NOT NULL COMMENT '小计',
  `htime` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL COMMENT '判断是药品还是收费项目0为药品且未取药，2为药品且取药',
  PRIMARY KEY (`hospitalPriceListId`) USING BTREE,
  INDEX `fk_registerId`(`registerId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospitalprice
-- ----------------------------
INSERT INTO `hospitalprice` VALUES (13, 10, '开颅手术', 1, 5000, 5000, '2022-04-15 15:16:12', 1);
INSERT INTO `hospitalprice` VALUES (12, 10, '强龙益肾片 (力魂)', 1, 739, 739, '2022-04-15 15:16:23', 2);
INSERT INTO `hospitalprice` VALUES (11, 1, '打针', 1, 50, 50, '2022-04-15 15:15:12', 1);
INSERT INTO `hospitalprice` VALUES (10, 1, '多维蛋白质粉 (美莱健)', 1, 318, 318, '2022-04-15 15:15:22', 2);
INSERT INTO `hospitalprice` VALUES (14, 77, '打针', 1, 50, 50, '2022-04-15 17:43:06', 1);
INSERT INTO `hospitalprice` VALUES (15, 113, '烧烫伤膏', 1, 176, 176, '2022-04-15 17:50:55', 2);
INSERT INTO `hospitalprice` VALUES (16, 113, '打针', 1, 50, 50, '2022-04-15 17:50:08', 1);
INSERT INTO `hospitalprice` VALUES (17, 70, '多维蛋白质粉 (美莱健)', 1, 318, 318, '2022-04-27 20:06:10', 2);
INSERT INTO `hospitalprice` VALUES (18, 70, '打针', 1, 50, 50, '2022-04-27 17:50:45', 1);
INSERT INTO `hospitalprice` VALUES (19, 70, '健脑补肾丸 (999)', 1, 23, 23, '2022-04-27 20:21:36', 2);
INSERT INTO `hospitalprice` VALUES (20, 70, '开颅手术', 1, 5000, 5000, '2022-04-28 21:10:23', 1);
INSERT INTO `hospitalprice` VALUES (24, 63, '消痛贴膏 (奇正)', 1, 540, 540, '2022-05-20 21:41:20', 2);
INSERT INTO `hospitalprice` VALUES (25, 63, '心电', 1, 100, 100, '2022-05-20 21:40:09', 1);

-- ----------------------------
-- Table structure for inoutpatienttype
-- ----------------------------
DROP TABLE IF EXISTS `inoutpatienttype`;
CREATE TABLE `inoutpatienttype`  (
  `inoutpatientId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` int(11) NOT NULL,
  `bigProjectId` int(11) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`inoutpatientId`) USING BTREE,
  INDEX `fk_inoutpatienttype`(`bigProjectId`) USING BTREE,
  INDEX `fk_intunit`(`unit`) USING BTREE,
  CONSTRAINT `inoutpatienttype_ibfk_1` FOREIGN KEY (`bigProjectId`) REFERENCES `projecttype` (`projectId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inoutpatienttype_ibfk_2` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inoutpatienttype
-- ----------------------------
INSERT INTO `inoutpatienttype` VALUES (1, '打针', 6, 4, 50);
INSERT INTO `inoutpatienttype` VALUES (2, '疫苗接种', 6, 4, 100);
INSERT INTO `inoutpatienttype` VALUES (3, '麻醉', 6, 3, 200);
INSERT INTO `inoutpatienttype` VALUES (4, '吸高压氧', 6, 2, 500);
INSERT INTO `inoutpatienttype` VALUES (5, '开颅手术', 6, 1, 5000);
INSERT INTO `inoutpatienttype` VALUES (6, '彩超', 6, 2, 1000);
INSERT INTO `inoutpatienttype` VALUES (7, '急诊', 6, 2, 200);
INSERT INTO `inoutpatienttype` VALUES (8, '感染四项', 6, 1, 65);
INSERT INTO `inoutpatienttype` VALUES (9, '凝血四项', 6, 1, 42.5);
INSERT INTO `inoutpatienttype` VALUES (10, '血常规、血型', 6, 1, 25.5);
INSERT INTO `inoutpatienttype` VALUES (11, '尿常规', 6, 1, 20.5);
INSERT INTO `inoutpatienttype` VALUES (12, '肾功', 6, 1, 47);
INSERT INTO `inoutpatienttype` VALUES (13, '肝功一', 6, 2, 72);
INSERT INTO `inoutpatienttype` VALUES (14, '心电', 6, 1, 100);
INSERT INTO `inoutpatienttype` VALUES (15, '胸透', 6, 2, 120);

-- ----------------------------
-- Table structure for medicare
-- ----------------------------
DROP TABLE IF EXISTS `medicare`;
CREATE TABLE `medicare`  (
  `medicareId` int(11) NOT NULL AUTO_INCREMENT,
  `medicareType` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `medicarePercent` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`medicareId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of medicare
-- ----------------------------
INSERT INTO `medicare` VALUES (1, '无', '0%');
INSERT INTO `medicare` VALUES (2, '城镇社保', '30%');
INSERT INTO `medicare` VALUES (3, '农村医疗合作社', '35%');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `noticeContent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enableTop` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `publisherId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (3, '医疗设备市场调研公告', '为提高医疗设备采购透明度，加大医疗设备采购前市场调研力度，使医疗设备的管理、使用达到合法、安全、有效的要求，我院本着公平、公正、公开的原则，现对下列项目征集相关资料，请有相关能力且具有合法合格资质的供应商与医学装备管理处联系。', 1, '2022-03-31', 1);
INSERT INTO `notice` VALUES (4, '健康码变黄后如何就医?', '管控区内的黄码人员有就医需求时，由包片医务人员联系定点医疗机构，由街道（乡镇）安排专用转运车\"点对点\"送医，实行闭环管理。防范区内的黄码人员有就医需求时，居家隔离医学观察期内，由社区报请县(市、区)防控办安排车辆点对点转运至就近发热门诊就诊，持48小时内核酸阴性证明，做好闭环管理;健康监测期内的，向所在社区(村)、街道(乡镇）报备后，做好个人防护，持48小时内核酸阴性证明，自行到发热门诊就诊，就诊过程中避免乘坐公共交通工具。其他区域的黄码人员有就医需求时，居家隔离医学观察期内，由社区点对点转运至就近发热门诊就诊;健康监测期内的，向所在社区(村)、街道(乡镇)报备后，做好个人防护，自行到发热门诊就诊，就诊过程中避免乘坐公共交通工具。', 0, '2021-02-04', 1);
INSERT INTO `notice` VALUES (5, '采购公告', '我院于2022年3月10日9时组织了负压隔离舱设备的谈判采购会议，项目编号为:XXXXX-2022-0310。', 0, '2022-03-10', 1);
INSERT INTO `notice` VALUES (6, '隐形的手术刀', '放疗是放射治疗的简称，利用聚焦的、高能量的放射线，破坏肿瘤细胞的遗传物质DNA，使其失去再生能力从而杀伤肿瘤细胞。放疗与手术，化疗并称为恶性肿瘤治疗的三大手段。放疗被誉为“隐形的手术刀”，治疗的目标是最大限度地将放射线的剂量集中到病变内，杀灭肿瘤细胞，同时最大程度地保护邻近的正常组织和器官。', 0, '2022-04-03', 1);
INSERT INTO `notice` VALUES (7, '研究发现，抗过敏药提升抗癌效果', '这项研究由美国得克萨斯大学安德森癌症研究中心的余棣华教授团队组织开展的。研究者对过往接受过免疫检查点抑制剂的癌症患者临床数据进行了回顾性分析，结果发现靶向组胺受体H1的抗组胺药可以改善患者的生存状况。尤其是黑色素瘤和肺癌患者，他们同时使用抗组胺药时，出现了明显的病情改善。此外，乳腺癌和结肠癌患者也表现出了同样的趋势。研究者推测，组胺受体H1和组胺或许决定着患者对免疫疗法的敏感性。', 0, '2022-04-04', 1);
INSERT INTO `notice` VALUES (8, '轻度认知障碍，不是早期痴呆', '轻度认知障碍是介于正常衰老和痴呆之间的一种中间状态，其诊断往往会让老年人感到与痴呆症“更近了”而担忧焦虑。近日，美国哥伦比亚大学神经心理学家发现，轻度认知障碍并不一定导致痴呆症。事实上，近一半被诊断为轻度认知障碍，即存在记忆和思维问题的老年人，几年后症状就自行消失了。轻度认知障碍是介于正常衰老和痴呆之间的一种中间状态，其诊断往往会让老年人感到与痴呆症“更近了”而担忧焦虑。近日，美国哥伦比亚大学神经心理学家发现，轻度认知障碍并不一定导致痴呆症。事实上，近一半被诊断为轻度认知障碍，即存在记忆和思维问题的老年人，几年后症状就自行消失了。轻度认知障碍是介于正常衰老和痴呆之间的一种中间状态，其诊断往往会让老年人感到与痴呆症“更近了”而担忧焦虑。近日，美国哥伦比亚大学神经心理学家发现，轻度认知障碍并不一定导致痴呆症。事实上，近一半被诊断为轻度认知障碍，即存在记忆和思维问题的老年人，几年后症状就自行消失了。', 1, '2022-05-20', 1);

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `payId` int(11) NOT NULL AUTO_INCREMENT,
  `registerId` int(11) NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  `payDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`payId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES (1, 113, 1000, '2022-04-15 17:48:52');
INSERT INTO `pay` VALUES (2, 63, 1000, '2022-05-20 21:38:27');

-- ----------------------------
-- Table structure for pharmacy
-- ----------------------------
DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE `pharmacy`  (
  `pharmacyId` int(11) NOT NULL AUTO_INCREMENT COMMENT '药品序号',
  `pharmacyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名称',
  `unit` int(11) NOT NULL COMMENT '计量单位',
  `sellingPrice` double NOT NULL COMMENT '售价',
  `area` int(11) NOT NULL COMMENT '产地',
  `type` int(11) NOT NULL COMMENT '类型',
  `produceDate` date NOT NULL COMMENT '生产日期',
  `validDate` date NOT NULL COMMENT '有效期',
  `drugstoreNum` int(11) NOT NULL COMMENT '药品数量',
  `skullBatch` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批号',
  PRIMARY KEY (`pharmacyId`) USING BTREE,
  INDEX `fk_dgareap`(`area`) USING BTREE,
  INDEX `fk_unitp`(`unit`) USING BTREE,
  INDEX `fk_typep`(`type`) USING BTREE,
  CONSTRAINT `pharmacy_ibfk_1` FOREIGN KEY (`area`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pharmacy_ibfk_4` FOREIGN KEY (`type`) REFERENCES `type` (`typeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pharmacy_ibfk_5` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pharmacy
-- ----------------------------
INSERT INTO `pharmacy` VALUES (1, '复方木芙蓉涂鼻软膏 (复方木芙蓉涂鼻膏)', 6, 642, 34, 5, '2021-10-10', '2023-11-13', 105, '20211010');
INSERT INTO `pharmacy` VALUES (2, '藤黄健骨丸', 3, 602, 35, 3, '2021-03-19', '2023-03-26', 86, '20210319');
INSERT INTO `pharmacy` VALUES (3, '罗浮山风湿膏药', 5, 890, 22, 12, '2021-10-02', '2023-04-04', 132, '20211002');
INSERT INTO `pharmacy` VALUES (4, '骨化三醇软胶囊 (盖三淳/海德威)', 7, 238, 27, 8, '2021-03-30', '2023-08-14', 104, '20210330');
INSERT INTO `pharmacy` VALUES (5, '双环醇片 (百赛诺)', 5, 760, 14, 11, '2021-04-11', '2023-05-24', 157, '20210411');
INSERT INTO `pharmacy` VALUES (6, '复方利多卡因乳膏', 10, 26, 16, 12, '2021-05-20', '2023-07-17', 82, '20210520');
INSERT INTO `pharmacy` VALUES (7, '点舌丸 (双人牌)', 3, 56, 50, 10, '2021-04-07', '2023-01-10', 103, '20210407');
INSERT INTO `pharmacy` VALUES (8, '环酯红霉素片 (冠沙)', 1, 987, 26, 6, '2021-11-05', '2023-02-28', 164, '20211105');
INSERT INTO `pharmacy` VALUES (9, '克霉唑阴道片 (美克捷)', 14, 224, 22, 2, '2021-08-01', '2023-09-06', 137, '20210801');
INSERT INTO `pharmacy` VALUES (10, '聚甲酚磺醛栓 (比维彤)', 3, 626, 31, 11, '2021-07-14', '2023-12-06', 119, '20210714');
INSERT INTO `pharmacy` VALUES (11, '赖诺普利胶囊 (帝益洛)', 2, 655, 49, 11, '2021-02-27', '2023-05-23', 91, '20210227');
INSERT INTO `pharmacy` VALUES (12, '葆宫止血颗粒', 8, 925, 47, 9, '2021-06-21', '2023-01-22', 103, '20210621');
INSERT INTO `pharmacy` VALUES (13, '九味镇心颗粒 (玖卫)', 9, 255, 6, 5, '2021-06-23', '2023-08-12', 138, '20210623');
INSERT INTO `pharmacy` VALUES (14, '阿莫西林分散片 (石药 阿林新)', 6, 686, 28, 2, '2021-06-26', '2023-01-15', 192, '20210626');
INSERT INTO `pharmacy` VALUES (15, '林旦乳膏 (恒健)', 4, 135, 33, 11, '2021-06-26', '2023-11-20', 159, '20210626');
INSERT INTO `pharmacy` VALUES (16, '脑蛋白水解物片 (宇宙)', 14, 939, 47, 12, '2021-01-22', '2023-05-12', 198, '20210122');
INSERT INTO `pharmacy` VALUES (17, '金龙舒胆胶囊 (维诺沙)', 10, 340, 16, 9, '2021-05-22', '2023-08-06', 122, '20210522');
INSERT INTO `pharmacy` VALUES (18, '多维蛋白质粉 (美莱健)', 2, 318, 1, 1, '2021-09-21', '2023-11-15', 180, '20210921');
INSERT INTO `pharmacy` VALUES (19, '枇杷止咳颗粒 (速可停/神奇)', 11, 434, 2, 8, '2021-03-07', '2023-07-06', 121, '20210307');
INSERT INTO `pharmacy` VALUES (20, '尼美舒利分散片 (力美松)', 4, 866, 8, 12, '2021-04-07', '2023-06-30', 113, '20210407');
INSERT INTO `pharmacy` VALUES (21, '珍珠层粉', 3, 61, 17, 3, '2021-01-09', '2023-08-08', 152, '20210109');
INSERT INTO `pharmacy` VALUES (22, '非普拉宗片 (依可力)', 4, 544, 42, 3, '2021-10-12', '2023-03-19', 143, '20211012');
INSERT INTO `pharmacy` VALUES (23, '二十五味鬼臼丸 (藏羚)', 8, 320, 45, 8, '2021-10-15', '2023-02-05', 193, '20211015');
INSERT INTO `pharmacy` VALUES (24, '腺苷钴胺片', 11, 376, 32, 7, '2021-05-30', '2023-12-05', 153, '20210530');
INSERT INTO `pharmacy` VALUES (25, '妇炎康片', 11, 85, 24, 12, '2021-05-19', '2023-12-26', 190, '20210519');
INSERT INTO `pharmacy` VALUES (26, '健肝灵胶囊(冰莲) (冰莲)', 9, 974, 3, 7, '2021-01-25', '2023-11-01', 159, '20210125');
INSERT INTO `pharmacy` VALUES (27, '香砂六君丸', 14, 146, 10, 8, '2021-10-02', '2023-06-16', 179, '20211002');
INSERT INTO `pharmacy` VALUES (28, '暖宫孕子胶囊', 2, 805, 6, 10, '2021-06-17', '2023-08-09', 168, '20210617');
INSERT INTO `pharmacy` VALUES (29, '胃炎宁颗粒', 13, 54, 24, 11, '2021-05-16', '2023-01-01', 103, '20210516');
INSERT INTO `pharmacy` VALUES (30, '复方贝母片 (一正)', 5, 828, 5, 12, '2021-02-12', '2023-04-02', 92, '20210212');
INSERT INTO `pharmacy` VALUES (31, '辛芳鼻炎胶囊 (立效)', 5, 179, 28, 5, '2021-11-25', '2023-05-14', 141, '20211125');
INSERT INTO `pharmacy` VALUES (32, '甲硝唑缓释片 (一孚晴)', 14, 549, 50, 1, '2021-08-29', '2023-03-05', 164, '20210829');
INSERT INTO `pharmacy` VALUES (33, '三七血伤宁胶囊', 4, 494, 28, 6, '2021-07-17', '2023-03-29', 98, '20210717');
INSERT INTO `pharmacy` VALUES (34, '咳特灵胶囊 (九州通)', 3, 94, 11, 8, '2021-10-19', '2023-05-27', 88, '20211019');
INSERT INTO `pharmacy` VALUES (35, '复方胃宁片', 10, 957, 43, 3, '2021-07-09', '2023-09-12', 114, '20210709');
INSERT INTO `pharmacy` VALUES (36, '枸橼酸西地那非片 (金戈)', 2, 33, 25, 11, '2021-09-22', '2023-02-11', 151, '20210922');
INSERT INTO `pharmacy` VALUES (37, '达比加群酯胶囊 (泰毕全)', 5, 531, 8, 11, '2021-06-10', '2023-10-21', 133, '20210610');
INSERT INTO `pharmacy` VALUES (38, '脑蛋白水解物口服液 (万通)', 6, 768, 2, 9, '2021-06-18', '2023-05-28', 163, '20210618');
INSERT INTO `pharmacy` VALUES (39, '蒿甲醚注射液', 13, 286, 12, 9, '2021-05-05', '2023-12-04', 86, '20210505');
INSERT INTO `pharmacy` VALUES (40, '重组牛碱性成纤维细胞生长因子眼用凝胶 (贝复舒)', 3, 584, 29, 7, '2021-12-30', '2023-11-29', 99, '20211230');
INSERT INTO `pharmacy` VALUES (41, '苯磺酸氨氯地平片 (安内真)', 11, 380, 49, 12, '2021-10-29', '2023-10-02', 197, '20211029');
INSERT INTO `pharmacy` VALUES (42, '复方斑蝥胶囊 (伍舒芳/希尔安)', 9, 405, 8, 7, '2021-08-16', '2023-07-30', 111, '20210816');
INSERT INTO `pharmacy` VALUES (43, '修正牌优尔胶囊', 5, 146, 12, 9, '2021-05-13', '2023-01-04', 95, '20210513');
INSERT INTO `pharmacy` VALUES (44, '二甲双胍格列本脲片(Ⅱ) (君复乐)', 13, 846, 1, 6, '2021-08-30', '2023-11-05', 115, '20210830');
INSERT INTO `pharmacy` VALUES (45, '复方玄驹胶囊 (施强)', 4, 516, 30, 3, '2021-08-17', '2023-04-10', 92, '20210817');
INSERT INTO `pharmacy` VALUES (46, '依托芬那酯凝胶 (澳托芬)', 7, 126, 22, 10, '2021-11-13', '2023-09-17', 125, '20211113');
INSERT INTO `pharmacy` VALUES (47, '天麻追风膏 (王麻子)', 4, 84, 38, 5, '2021-08-29', '2023-04-22', 81, '20210829');
INSERT INTO `pharmacy` VALUES (48, '双歧杆菌四联活菌片 (思连康)', 4, 163, 19, 9, '2021-06-18', '2023-01-05', 148, '20210618');
INSERT INTO `pharmacy` VALUES (49, '阿托伐他汀钙片 (立普妥)', 8, 777, 41, 10, '2021-08-07', '2023-06-14', 158, '20210807');
INSERT INTO `pharmacy` VALUES (50, '胆石清片', 3, 368, 35, 3, '2021-03-21', '2023-05-24', 140, '20210321');
INSERT INTO `pharmacy` VALUES (51, '丙戊酸镁缓释片 (湘中 神泰)', 14, 821, 15, 12, '2021-11-17', '2023-01-13', 184, '20211117');
INSERT INTO `pharmacy` VALUES (52, '吲哚美辛巴布膏 (必艾得)', 6, 348, 14, 11, '2021-07-07', '2023-09-03', 197, '20210707');
INSERT INTO `pharmacy` VALUES (53, '强龙益肾片 (力魂)', 13, 739, 46, 1, '2021-03-03', '2023-03-13', 121, '20210303');
INSERT INTO `pharmacy` VALUES (54, '顽癣敌软膏', 3, 577, 30, 7, '2021-05-10', '2023-02-19', 101, '20210510');
INSERT INTO `pharmacy` VALUES (55, '杜仲平压片', 2, 874, 2, 2, '2021-03-04', '2023-10-09', 117, '20210304');
INSERT INTO `pharmacy` VALUES (56, '月见草油胶丸 (万通)', 5, 572, 12, 6, '2021-07-31', '2023-11-12', 103, '20210731');
INSERT INTO `pharmacy` VALUES (57, '参术儿康糖浆 (修正)', 3, 653, 2, 9, '2021-12-17', '2023-07-21', 199, '20211217');
INSERT INTO `pharmacy` VALUES (58, '舒筋丸 (众克)', 9, 531, 37, 5, '2021-05-16', '2023-08-07', 182, '20210516');
INSERT INTO `pharmacy` VALUES (59, '复方丹参片 (会康)', 8, 987, 38, 7, '2021-08-31', '2023-09-12', 92, '20210831');
INSERT INTO `pharmacy` VALUES (60, '枸橼酸西地那非片 (金戈)', 2, 374, 22, 8, '2021-05-07', '2023-08-15', 128, '20210507');
INSERT INTO `pharmacy` VALUES (61, '宝健牌乳钙咀嚼片', 12, 195, 47, 2, '2021-10-17', '2023-03-09', 136, '20211017');
INSERT INTO `pharmacy` VALUES (62, '钙加D软胶囊 (自然之宝)', 7, 87, 45, 12, '2021-10-24', '2023-08-21', 134, '20211024');
INSERT INTO `pharmacy` VALUES (63, '枸橼酸西地那非片 (万艾可|伟哥)', 9, 87, 1, 12, '2021-06-11', '2023-11-26', 150, '20210611');
INSERT INTO `pharmacy` VALUES (64, '长效抗菌材料 (洁悠神 JUC)', 3, 27, 12, 4, '2021-10-26', '2023-11-27', 105, '20211026');
INSERT INTO `pharmacy` VALUES (65, '消痛贴膏 (奇正)', 6, 540, 13, 1, '2021-02-22', '2023-08-13', 151, '20210222');
INSERT INTO `pharmacy` VALUES (66, '枸地氯雷他定胶囊 (恩瑞特)', 8, 643, 45, 7, '2021-01-01', '2023-02-09', 190, '20210101');
INSERT INTO `pharmacy` VALUES (67, '糠酸莫米松乳膏 (芙林)', 13, 186, 13, 8, '2021-12-26', '2023-11-18', 161, '20211226');
INSERT INTO `pharmacy` VALUES (68, '麝香心脑乐胶囊 (京豫)', 1, 401, 23, 6, '2021-02-25', '2023-12-12', 139, '20210225');
INSERT INTO `pharmacy` VALUES (69, '复方吡拉西坦脑蛋白水解物片 (元舒)', 14, 872, 2, 3, '2021-10-24', '2023-02-17', 177, '20211024');
INSERT INTO `pharmacy` VALUES (70, '复方血栓通胶囊 (众生)', 13, 129, 26, 11, '2021-05-20', '2023-12-02', 118, '20210520');
INSERT INTO `pharmacy` VALUES (71, '促肝细胞生长素肠溶胶囊 (福锦)', 5, 802, 49, 6, '2021-10-21', '2023-10-21', 100, '20211021');
INSERT INTO `pharmacy` VALUES (72, '复方吡拉西坦脑蛋白水解物片 (康恼灵)', 5, 945, 23, 6, '2021-01-07', '2023-05-18', 160, '20210107');
INSERT INTO `pharmacy` VALUES (73, '盐酸坦洛新缓释胶囊 (康恩贝/前列/必坦)', 10, 624, 40, 11, '2021-10-10', '2023-09-19', 164, '20211010');
INSERT INTO `pharmacy` VALUES (74, '盐酸氨基葡萄糖胶囊 (葡立)', 12, 589, 26, 4, '2021-03-06', '2023-07-15', 168, '20210306');
INSERT INTO `pharmacy` VALUES (75, '咳露口服液 (步长)', 2, 623, 40, 1, '2021-03-07', '2023-09-06', 167, '20210307');
INSERT INTO `pharmacy` VALUES (76, '灵芝胶囊 (九千堂/5色)', 14, 720, 13, 5, '2021-02-24', '2023-03-18', 151, '20210224');
INSERT INTO `pharmacy` VALUES (77, '盐酸达泊西汀片 (必利劲)', 1, 166, 16, 12, '2021-12-15', '2023-05-18', 197, '20211215');
INSERT INTO `pharmacy` VALUES (78, '脑苷肌肽注射液', 5, 238, 39, 9, '2021-04-02', '2023-11-17', 113, '20210402');
INSERT INTO `pharmacy` VALUES (79, '抗菌功能性敷料(贴) (芙清)', 4, 697, 35, 5, '2021-05-23', '2023-08-12', 94, '20210523');
INSERT INTO `pharmacy` VALUES (80, '普罗布考片 (畅泰)', 13, 488, 13, 4, '2021-04-19', '2023-10-23', 83, '20210419');
INSERT INTO `pharmacy` VALUES (81, '降糖宁胶囊 (恒帝)', 11, 308, 29, 10, '2021-03-06', '2023-07-28', 110, '20210306');
INSERT INTO `pharmacy` VALUES (82, '聚乙烯醇滴眼液', 4, 164, 11, 5, '2021-04-10', '2023-01-13', 104, '20210410');
INSERT INTO `pharmacy` VALUES (83, '消渴降糖胶囊 (汝立康)', 13, 904, 47, 1, '2021-11-01', '2023-09-22', 198, '20211101');
INSERT INTO `pharmacy` VALUES (84, '参茸壮骨丸', 13, 812, 29, 5, '2021-04-02', '2023-04-30', 164, '20210402');
INSERT INTO `pharmacy` VALUES (85, '芪参益气滴丸', 3, 949, 27, 3, '2021-08-31', '2023-01-27', 117, '20210831');
INSERT INTO `pharmacy` VALUES (86, '咪喹莫特乳膏 (丽科杰)', 4, 884, 17, 6, '2021-04-28', '2023-01-03', 118, '20210428');
INSERT INTO `pharmacy` VALUES (87, '白芍总苷胶囊 (帕夫林)', 9, 486, 10, 12, '2021-11-12', '2023-12-23', 130, '20211112');
INSERT INTO `pharmacy` VALUES (88, '参茸鞭丸 (补天)', 1, 329, 16, 8, '2021-05-13', '2023-04-04', 189, '20210513');
INSERT INTO `pharmacy` VALUES (89, '止痒消炎水 (施比灵)', 5, 113, 32, 12, '2021-03-28', '2023-03-15', 167, '20210328');
INSERT INTO `pharmacy` VALUES (90, '骨友灵搽剂', 4, 426, 24, 4, '2021-05-26', '2023-04-24', 80, '20210526');
INSERT INTO `pharmacy` VALUES (91, '肠胃宁片', 10, 785, 23, 6, '2021-01-22', '2023-08-20', 141, '20210122');
INSERT INTO `pharmacy` VALUES (92, '盐酸米诺环素胶囊 (玫满)', 1, 886, 8, 10, '2021-05-22', '2023-04-28', 146, '20210522');
INSERT INTO `pharmacy` VALUES (93, '多维铁口服溶液 (迪维佳)', 4, 39, 24, 11, '2021-12-19', '2023-08-20', 174, '20211219');
INSERT INTO `pharmacy` VALUES (94, '安胃疡胶囊', 10, 876, 36, 12, '2021-12-07', '2023-12-26', 134, '20211207');
INSERT INTO `pharmacy` VALUES (95, '排石通淋口服液', 14, 603, 31, 2, '2021-03-03', '2023-03-21', 164, '20210303');
INSERT INTO `pharmacy` VALUES (96, '枸橼酸西地那非片 (金戈)', 5, 801, 38, 9, '2021-09-01', '2023-01-31', 172, '20210901');
INSERT INTO `pharmacy` VALUES (97, '溶栓胶囊 (中远威)', 1, 984, 7, 7, '2021-04-08', '2023-01-04', 94, '20210408');
INSERT INTO `pharmacy` VALUES (98, '三肾丸', 7, 162, 2, 10, '2021-05-20', '2023-07-31', 85, '20210520');
INSERT INTO `pharmacy` VALUES (99, '黄柏八味片(沙日毛都-8) (沙日毛都-8)', 7, 122, 38, 3, '2021-01-24', '2023-07-09', 136, '20210124');
INSERT INTO `pharmacy` VALUES (100, '滋阴补肾丸', 3, 838, 15, 2, '2021-04-28', '2023-12-21', 103, '20210428');
INSERT INTO `pharmacy` VALUES (101, '头孢克肟分散片 (莎普爱思/天立威)', 5, 244, 4, 11, '2021-12-04', '2023-04-08', 191, '20211204');
INSERT INTO `pharmacy` VALUES (102, '乐儿康颗粒', 12, 218, 36, 3, '2021-03-08', '2023-04-18', 158, '20210308');
INSERT INTO `pharmacy` VALUES (103, '甲磺酸酚妥拉明胶囊 (普丁阳)', 3, 552, 29, 12, '2021-02-19', '2023-02-18', 141, '20210219');
INSERT INTO `pharmacy` VALUES (104, '半夏天麻丸', 2, 95, 43, 12, '2021-08-02', '2023-02-27', 157, '20210802');
INSERT INTO `pharmacy` VALUES (105, '血脂康胶囊', 7, 400, 49, 5, '2021-04-11', '2023-11-21', 171, '20210411');
INSERT INTO `pharmacy` VALUES (106, '五维赖氨酸颗粒 (迈维希)', 12, 603, 41, 1, '2021-03-20', '2023-05-03', 152, '20210320');
INSERT INTO `pharmacy` VALUES (107, '利福平胶囊 (康青)', 1, 407, 24, 4, '2021-04-04', '2023-12-13', 169, '20210404');
INSERT INTO `pharmacy` VALUES (108, '盐酸特比萘芬片', 12, 629, 11, 3, '2021-06-29', '2023-01-25', 188, '20210629');
INSERT INTO `pharmacy` VALUES (109, '复方川芎吲哚美辛胶囊 (先草)', 7, 762, 15, 10, '2021-07-05', '2023-03-09', 200, '20210705');
INSERT INTO `pharmacy` VALUES (110, '乳果糖口服溶液 (健伦)', 9, 758, 4, 7, '2021-02-18', '2023-08-12', 141, '20210218');
INSERT INTO `pharmacy` VALUES (111, '盐酸特比萘芬片 (邦可欣)', 11, 184, 14, 1, '2021-04-26', '2023-04-27', 83, '20210426');
INSERT INTO `pharmacy` VALUES (112, '白葡奈氏菌片 (气片)', 4, 650, 13, 10, '2021-08-05', '2023-09-20', 199, '20210805');
INSERT INTO `pharmacy` VALUES (113, '恒古骨伤愈合剂 (克雷斯)', 13, 969, 41, 5, '2021-02-19', '2023-03-21', 186, '20210219');
INSERT INTO `pharmacy` VALUES (114, '瑞格列奈片 (孚来迪)', 8, 219, 34, 1, '2021-06-19', '2023-01-27', 134, '20210619');
INSERT INTO `pharmacy` VALUES (115, '雷贝拉唑钠肠溶胶囊 (济诺)', 9, 850, 3, 11, '2021-11-05', '2023-02-13', 97, '20211105');
INSERT INTO `pharmacy` VALUES (116, '金英胶囊 (美尔舒)', 1, 485, 42, 1, '2021-03-14', '2023-10-10', 181, '20210314');
INSERT INTO `pharmacy` VALUES (117, '参茸蛤蚧保肾丸', 5, 415, 44, 4, '2022-01-01', '2023-12-15', 102, '20220101');
INSERT INTO `pharmacy` VALUES (118, '胞磷胆碱钠胶囊 (思考林)', 11, 57, 16, 5, '2021-05-08', '2023-10-14', 83, '20210508');
INSERT INTO `pharmacy` VALUES (119, '吲哚美辛呋喃唑酮栓', 8, 473, 26, 11, '2021-05-30', '2023-01-12', 116, '20210530');
INSERT INTO `pharmacy` VALUES (120, '赖氨肌醇维B12口服溶液 (同笑)', 3, 467, 29, 6, '2021-07-09', '2023-11-26', 160, '20210709');
INSERT INTO `pharmacy` VALUES (121, '蚝贝钙片(咀嚼片) (仁和)', 10, 291, 17, 7, '2021-04-26', '2023-11-12', 134, '20210426');
INSERT INTO `pharmacy` VALUES (122, '麝香正骨酊 (欣欣)', 3, 875, 36, 4, '2021-12-14', '2023-11-01', 141, '20211214');
INSERT INTO `pharmacy` VALUES (123, '奥沙拉秦钠胶囊 (帕斯坦)', 5, 137, 25, 2, '2021-02-01', '2023-05-21', 140, '20210201');
INSERT INTO `pharmacy` VALUES (124, '奋乃静片', 6, 267, 7, 7, '2021-09-16', '2023-12-31', 170, '20210916');
INSERT INTO `pharmacy` VALUES (125, '三肾丸 (老君炉)', 1, 429, 24, 10, '2021-07-23', '2023-05-02', 194, '20210723');
INSERT INTO `pharmacy` VALUES (126, '首明山胶囊', 1, 302, 42, 4, '2021-05-12', '2023-04-28', 95, '20210512');
INSERT INTO `pharmacy` VALUES (127, '天杞补肾胶囊', 7, 797, 8, 9, '2021-05-30', '2023-07-27', 190, '20210530');
INSERT INTO `pharmacy` VALUES (128, '氨酚咖匹林片', 13, 643, 36, 12, '2021-06-28', '2023-08-29', 174, '20210628');
INSERT INTO `pharmacy` VALUES (129, '米氮平片 (康多宁)', 7, 775, 45, 5, '2021-08-05', '2023-08-15', 115, '20210805');
INSERT INTO `pharmacy` VALUES (130, '环孢素软胶囊 (新赛斯平)', 5, 405, 38, 10, '2021-01-22', '2023-12-28', 170, '20210122');
INSERT INTO `pharmacy` VALUES (131, '银杏酮酯滴丸 (傲士)', 3, 356, 48, 6, '2021-01-11', '2023-08-29', 98, '20210111');
INSERT INTO `pharmacy` VALUES (132, '健胃消炎颗粒', 13, 31, 49, 11, '2021-08-16', '2023-11-30', 111, '20210816');
INSERT INTO `pharmacy` VALUES (133, '维生素A棕榈酸酯眼用凝胶', 8, 611, 12, 4, '2021-06-30', '2023-08-13', 151, '20210630');
INSERT INTO `pharmacy` VALUES (134, '茵栀黄注射液', 4, 280, 8, 1, '2021-02-12', '2023-06-27', 128, '20210212');
INSERT INTO `pharmacy` VALUES (135, '益脉康片', 4, 232, 48, 4, '2021-01-18', '2023-01-08', 81, '20210118');
INSERT INTO `pharmacy` VALUES (136, '格列美脲片 (力贻苹)', 13, 435, 29, 10, '2021-05-15', '2023-12-11', 146, '20210515');
INSERT INTO `pharmacy` VALUES (137, '左归丸', 4, 25, 50, 9, '2021-06-20', '2023-04-30', 131, '20210620');
INSERT INTO `pharmacy` VALUES (138, '脑心舒口服液', 10, 344, 6, 7, '2021-04-15', '2023-07-02', 187, '20210415');
INSERT INTO `pharmacy` VALUES (139, '强力天麻杜仲胶囊', 3, 191, 1, 12, '2021-12-30', '2023-09-03', 176, '20211230');
INSERT INTO `pharmacy` VALUES (140, '益肾灵颗粒 (银诺克)', 10, 347, 20, 10, '2021-05-24', '2023-05-14', 164, '20210524');
INSERT INTO `pharmacy` VALUES (141, '散结镇痛胶囊', 6, 491, 7, 1, '2021-09-23', '2023-02-14', 133, '20210923');
INSERT INTO `pharmacy` VALUES (142, '风湿液', 7, 478, 38, 3, '2021-04-12', '2023-03-28', 156, '20210412');
INSERT INTO `pharmacy` VALUES (143, '云南红药胶囊 (雲植)', 12, 36, 26, 7, '2021-06-03', '2023-05-21', 149, '20210603');
INSERT INTO `pharmacy` VALUES (144, '加巴喷丁胶囊 (派汀)', 4, 151, 18, 3, '2021-04-27', '2023-03-15', 168, '20210427');
INSERT INTO `pharmacy` VALUES (145, '仁青常觉', 4, 96, 24, 2, '2021-02-18', '2023-01-28', 87, '20210218');
INSERT INTO `pharmacy` VALUES (146, '益气养血口服液', 4, 831, 10, 9, '2021-04-19', '2023-05-02', 163, '20210419');
INSERT INTO `pharmacy` VALUES (147, '盐酸二甲双胍缓释片 (中大)', 1, 494, 41, 2, '2021-06-21', '2023-12-15', 146, '20210621');
INSERT INTO `pharmacy` VALUES (148, '盐酸左西替利嗪胶囊 (畅然)', 7, 511, 33, 11, '2021-05-23', '2023-03-08', 137, '20210523');
INSERT INTO `pharmacy` VALUES (149, '参苓白术丸 (孔孟)', 8, 301, 50, 3, '2021-02-03', '2023-09-20', 122, '20210203');
INSERT INTO `pharmacy` VALUES (150, '苯磺酸氨氯地平片 (友森)', 11, 198, 33, 7, '2021-01-14', '2023-11-11', 120, '20210114');
INSERT INTO `pharmacy` VALUES (151, '清金糖浆', 13, 532, 11, 7, '2021-08-09', '2023-10-07', 189, '20210809');
INSERT INTO `pharmacy` VALUES (152, '桃红清血丸', 6, 481, 10, 6, '2021-06-23', '2023-07-23', 92, '20210623');
INSERT INTO `pharmacy` VALUES (153, '风湿骨康片', 13, 533, 4, 7, '2021-09-23', '2023-03-04', 159, '20210923');
INSERT INTO `pharmacy` VALUES (154, '复方南五加口服液', 4, 150, 25, 5, '2021-03-24', '2023-09-07', 154, '20210324');
INSERT INTO `pharmacy` VALUES (155, '骨刺消痛液', 6, 63, 41, 6, '2021-10-18', '2023-07-11', 108, '20211018');
INSERT INTO `pharmacy` VALUES (156, '小牛脾提取物注射液 (敖东/愈白生物)', 8, 44, 10, 6, '2021-12-07', '2023-10-09', 175, '20211207');
INSERT INTO `pharmacy` VALUES (157, '附桂骨痛片 (戒欺)', 4, 452, 38, 11, '2021-05-19', '2023-10-15', 109, '20210519');
INSERT INTO `pharmacy` VALUES (158, '妇乐片', 5, 262, 5, 1, '2021-02-14', '2023-03-24', 180, '20210214');
INSERT INTO `pharmacy` VALUES (159, '苦参膜', 8, 807, 9, 1, '2021-08-25', '2023-07-26', 163, '20210825');
INSERT INTO `pharmacy` VALUES (160, '生乳汁 (普济堂)', 11, 178, 36, 1, '2021-05-08', '2023-03-26', 125, '20210508');
INSERT INTO `pharmacy` VALUES (161, '叶酸片', 6, 344, 26, 7, '2021-05-02', '2023-12-10', 85, '20210502');
INSERT INTO `pharmacy` VALUES (162, '瑞巴派特片 (膜固思达)', 9, 877, 11, 11, '2021-08-03', '2023-12-30', 171, '20210803');
INSERT INTO `pharmacy` VALUES (163, '活力源片 (林海)', 3, 188, 9, 4, '2021-11-10', '2023-04-07', 153, '20211110');
INSERT INTO `pharmacy` VALUES (164, '健胃消食片 (江中)', 2, 292, 15, 9, '2021-04-05', '2023-05-18', 108, '20210405');
INSERT INTO `pharmacy` VALUES (165, '翁沥通胶囊', 1, 21, 2, 8, '2021-03-10', '2023-05-18', 120, '20210310');
INSERT INTO `pharmacy` VALUES (166, '卵磷脂片 (清芝灵)', 11, 407, 12, 12, '2021-04-22', '2023-08-23', 180, '20210422');
INSERT INTO `pharmacy` VALUES (167, '黄芪颗粒 (好好)', 14, 715, 48, 7, '2021-10-30', '2023-09-12', 81, '20211030');
INSERT INTO `pharmacy` VALUES (168, '妇平胶囊 (景舒)', 11, 365, 43, 2, '2021-08-28', '2023-10-31', 154, '20210828');
INSERT INTO `pharmacy` VALUES (169, '抑亢丸 (老君炉)', 2, 820, 41, 4, '2021-08-13', '2023-03-26', 182, '20210813');
INSERT INTO `pharmacy` VALUES (170, '芎香通脉滴丸 (晶珠)', 3, 560, 24, 8, '2021-05-18', '2023-09-08', 138, '20210518');
INSERT INTO `pharmacy` VALUES (171, '麝香壮骨膏', 6, 539, 1, 2, '2021-09-24', '2023-10-18', 196, '20210924');
INSERT INTO `pharmacy` VALUES (172, '双氯芬酸钠缓释胶囊 (英太青)', 2, 549, 48, 5, '2021-02-25', '2023-07-31', 99, '20210225');
INSERT INTO `pharmacy` VALUES (173, '银耳孢糖肠溶胶囊 (切尔)', 8, 144, 16, 12, '2021-10-04', '2023-10-24', 161, '20211004');
INSERT INTO `pharmacy` VALUES (174, '消风止痒颗粒 (紫鑫)', 12, 189, 12, 4, '2021-01-07', '2023-06-15', 141, '20210107');
INSERT INTO `pharmacy` VALUES (175, '穿王消炎片', 2, 223, 22, 8, '2021-12-10', '2023-07-11', 89, '20211210');
INSERT INTO `pharmacy` VALUES (176, '复方鳖甲软肝片 (回乐/福瑞)', 3, 639, 25, 2, '2021-12-26', '2023-08-06', 200, '20211226');
INSERT INTO `pharmacy` VALUES (177, '鬼臼毒素软膏 (东信威)', 9, 202, 26, 12, '2021-06-16', '2023-01-22', 132, '20210616');
INSERT INTO `pharmacy` VALUES (178, '帕利哌酮缓释片 (芮达)', 12, 228, 50, 7, '2021-03-06', '2023-02-09', 148, '20210306');
INSERT INTO `pharmacy` VALUES (179, '舒胸颗粒 (迪康)', 11, 29, 34, 10, '2021-11-08', '2023-03-12', 122, '20211108');
INSERT INTO `pharmacy` VALUES (180, '利脑心片', 8, 464, 24, 12, '2021-07-08', '2023-12-19', 168, '20210708');
INSERT INTO `pharmacy` VALUES (181, '琥珀酸索利那新片 (卫喜康)', 12, 859, 4, 3, '2021-04-19', '2023-05-10', 86, '20210419');
INSERT INTO `pharmacy` VALUES (182, '川贝枇杷糖浆', 12, 404, 49, 11, '2021-11-26', '2023-05-09', 142, '20211126');
INSERT INTO `pharmacy` VALUES (183, '补肾丸', 8, 259, 10, 11, '2021-03-01', '2023-10-10', 159, '20210301');
INSERT INTO `pharmacy` VALUES (184, '护肝宁片 (信邦)', 6, 577, 4, 8, '2021-08-07', '2023-07-02', 127, '20210807');
INSERT INTO `pharmacy` VALUES (185, '吲哚美辛缓释胶囊 (久保新)', 6, 521, 31, 9, '2021-02-25', '2023-06-15', 155, '20210225');
INSERT INTO `pharmacy` VALUES (186, '烟酸片 (力生)', 8, 585, 29, 6, '2021-12-19', '2023-04-06', 116, '20211219');
INSERT INTO `pharmacy` VALUES (187, '消栓颗粒', 8, 516, 20, 10, '2021-01-10', '2023-03-23', 88, '20210110');
INSERT INTO `pharmacy` VALUES (188, '乌苯美司胶囊 (齐力佳)', 3, 809, 27, 10, '2021-05-22', '2023-07-15', 145, '20210522');
INSERT INTO `pharmacy` VALUES (189, '肝复康丸 (本草纲目牌)', 10, 734, 11, 12, '2021-02-02', '2023-04-06', 109, '20210202');
INSERT INTO `pharmacy` VALUES (190, '黄地养阴颗粒', 14, 65, 11, 3, '2021-10-27', '2023-04-20', 135, '20211027');
INSERT INTO `pharmacy` VALUES (191, '蠲痹抗生丸 (泰维治)', 13, 650, 48, 12, '2021-06-06', '2023-11-30', 155, '20210606');
INSERT INTO `pharmacy` VALUES (192, '奥硝唑片 (潇然)', 5, 893, 45, 3, '2021-10-23', '2023-12-07', 127, '20211023');
INSERT INTO `pharmacy` VALUES (193, '心安宁片 (珍芝堂)', 8, 563, 13, 1, '2021-06-03', '2023-06-07', 142, '20210603');
INSERT INTO `pharmacy` VALUES (194, '盐酸曲普利啶胶囊 (刻免)', 8, 349, 30, 10, '2021-10-30', '2023-12-30', 174, '20211030');
INSERT INTO `pharmacy` VALUES (195, '白灵胶囊 (告白克星)', 11, 52, 5, 4, '2021-03-13', '2023-07-18', 131, '20210313');
INSERT INTO `pharmacy` VALUES (196, '顽癣净 (葵花)', 6, 909, 7, 3, '2021-03-14', '2023-04-22', 133, '20210314');
INSERT INTO `pharmacy` VALUES (197, '外用溃疡散', 7, 728, 5, 2, '2021-07-24', '2023-09-18', 106, '20210724');
INSERT INTO `pharmacy` VALUES (198, '克痤隐酮凝胶 (安芙平)', 10, 754, 1, 2, '2021-10-08', '2023-05-15', 106, '20211008');
INSERT INTO `pharmacy` VALUES (199, '噻托溴铵粉吸入剂 (思力华)', 4, 753, 36, 11, '2021-04-21', '2023-02-24', 186, '20210421');
INSERT INTO `pharmacy` VALUES (200, '丁细牙痛胶囊', 10, 84, 7, 12, '2021-04-11', '2023-03-05', 105, '20210411');
INSERT INTO `pharmacy` VALUES (201, '虎地肠溶胶囊 (虎地胶囊)', 3, 102, 5, 9, '2021-07-03', '2023-08-28', 154, '20210703');
INSERT INTO `pharmacy` VALUES (202, '纳米银前列腺片 (人初夫保)', 4, 933, 36, 1, '2021-04-17', '2023-10-25', 145, '20210417');
INSERT INTO `pharmacy` VALUES (203, '十全大补丸', 4, 726, 37, 11, '2021-07-01', '2023-08-29', 102, '20210701');
INSERT INTO `pharmacy` VALUES (204, '山药丸 (舒康岸)', 12, 528, 4, 8, '2021-06-16', '2023-06-18', 113, '20210616');
INSERT INTO `pharmacy` VALUES (205, '振源片', 12, 522, 47, 5, '2021-09-18', '2023-08-01', 112, '20210918');
INSERT INTO `pharmacy` VALUES (206, '醒脾养儿颗粒 (健兴)', 1, 258, 49, 7, '2021-12-27', '2023-03-16', 95, '20211227');
INSERT INTO `pharmacy` VALUES (207, '醋酸钙胶囊 (金丐)', 3, 845, 48, 11, '2021-02-25', '2023-02-16', 132, '20210225');
INSERT INTO `pharmacy` VALUES (208, '降糖舒片', 5, 864, 36, 11, '2021-06-22', '2023-06-21', 116, '20210622');
INSERT INTO `pharmacy` VALUES (209, '开喉剑喷雾剂(儿童型)', 2, 730, 27, 11, '2021-12-11', '2023-10-28', 92, '20211211');
INSERT INTO `pharmacy` VALUES (210, '夏枯草膏', 10, 971, 28, 3, '2021-11-08', '2023-12-23', 189, '20211108');
INSERT INTO `pharmacy` VALUES (211, '盐酸吡格列酮分散片 (安多健)', 1, 788, 44, 8, '2021-07-02', '2023-09-01', 119, '20210702');
INSERT INTO `pharmacy` VALUES (212, '复方氟尿嘧啶口服溶液', 5, 804, 44, 5, '2021-12-22', '2023-09-20', 170, '20211222');
INSERT INTO `pharmacy` VALUES (213, '正胃片', 2, 463, 38, 8, '2021-05-27', '2023-08-20', 114, '20210527');
INSERT INTO `pharmacy` VALUES (214, '盐酸齐拉西酮胶囊 (思贝格)', 5, 678, 4, 1, '2021-02-17', '2023-11-25', 165, '20210217');
INSERT INTO `pharmacy` VALUES (215, '复方樟脑乳膏 (宝肤灵)', 14, 560, 26, 4, '2021-06-15', '2023-08-17', 100, '20210615');
INSERT INTO `pharmacy` VALUES (216, '五淋丸 (葡灵素)', 1, 56, 23, 2, '2021-12-18', '2023-12-11', 154, '20211218');
INSERT INTO `pharmacy` VALUES (217, '白癜风丸 (新青雪)', 7, 678, 39, 2, '2021-12-03', '2023-03-16', 171, '20211203');
INSERT INTO `pharmacy` VALUES (218, '贞芪扶正颗粒 (葵花)', 8, 989, 26, 6, '2021-01-31', '2023-02-22', 120, '20210131');
INSERT INTO `pharmacy` VALUES (219, '愈肝龙胶囊 (钧安)', 5, 884, 40, 3, '2021-06-10', '2023-08-30', 188, '20210610');
INSERT INTO `pharmacy` VALUES (220, '复方谷氨酰胺颗粒 (施林)', 7, 350, 32, 12, '2021-02-27', '2023-12-03', 97, '20210227');
INSERT INTO `pharmacy` VALUES (221, '甲钴胺片 (天使/弥诺)', 11, 195, 38, 7, '2021-09-18', '2023-03-14', 200, '20210918');
INSERT INTO `pharmacy` VALUES (222, '伏格列波糖片 (浦定)', 13, 810, 27, 1, '2021-03-21', '2023-12-21', 146, '20210321');
INSERT INTO `pharmacy` VALUES (223, '消糖灵片', 10, 801, 38, 9, '2021-12-08', '2023-09-02', 140, '20211208');
INSERT INTO `pharmacy` VALUES (224, '消炎镇痛膏 (大通)', 6, 900, 15, 11, '2021-04-09', '2023-02-27', 129, '20210409');
INSERT INTO `pharmacy` VALUES (225, '盐酸氨基葡萄糖颗粒', 13, 569, 24, 5, '2021-08-27', '2023-02-26', 179, '20210827');
INSERT INTO `pharmacy` VALUES (226, '平喘抗炎胶囊', 1, 163, 44, 5, '2021-02-17', '2023-12-31', 99, '20210217');
INSERT INTO `pharmacy` VALUES (227, '黄芪精口服液', 13, 646, 44, 11, '2021-07-20', '2023-09-10', 121, '20210720');
INSERT INTO `pharmacy` VALUES (228, '盐酸二甲双胍缓释片 (卜可)', 7, 611, 36, 12, '2021-12-30', '2023-08-19', 113, '20211230');
INSERT INTO `pharmacy` VALUES (229, '格列齐特片 (天安堂)', 3, 263, 44, 12, '2021-09-19', '2023-08-21', 200, '20210919');
INSERT INTO `pharmacy` VALUES (230, '安胃止痛片', 7, 190, 44, 7, '2021-07-29', '2023-04-25', 189, '20210729');
INSERT INTO `pharmacy` VALUES (231, '利心丸 (茂祥)', 7, 37, 49, 6, '2021-08-07', '2023-09-30', 105, '20210807');
INSERT INTO `pharmacy` VALUES (232, '小金丸', 3, 996, 31, 2, '2021-09-25', '2023-05-05', 158, '20210925');
INSERT INTO `pharmacy` VALUES (233, '同仁大活络丸', 2, 900, 37, 6, '2021-12-12', '2023-07-30', 177, '20211212');
INSERT INTO `pharmacy` VALUES (234, '保心片 (太极)', 11, 879, 7, 3, '2021-05-29', '2023-09-15', 161, '20210529');
INSERT INTO `pharmacy` VALUES (235, '彝心康胶囊 (龙发)', 12, 897, 4, 9, '2021-06-08', '2023-06-11', 180, '20210608');
INSERT INTO `pharmacy` VALUES (236, '美沙拉秦缓释颗粒剂 (艾迪莎)', 1, 305, 35, 6, '2021-08-19', '2023-11-12', 144, '20210819');
INSERT INTO `pharmacy` VALUES (237, '烧烫伤膏', 13, 176, 13, 1, '2021-10-02', '2023-11-24', 122, '20211002');
INSERT INTO `pharmacy` VALUES (238, '达肺草', 9, 834, 49, 1, '2021-09-03', '2023-09-09', 164, '20210903');
INSERT INTO `pharmacy` VALUES (239, '米诺地尔溶液 (达霏欣)', 13, 527, 41, 1, '2021-01-28', '2023-05-10', 134, '20210128');
INSERT INTO `pharmacy` VALUES (240, '葡萄糖酸钙含片', 7, 715, 43, 8, '2021-07-18', '2023-08-10', 167, '20210718');
INSERT INTO `pharmacy` VALUES (241, '连翘败毒丸 (正元盛邦)', 6, 398, 27, 2, '2021-02-10', '2023-03-31', 96, '20210210');
INSERT INTO `pharmacy` VALUES (242, '多索茶碱胶囊 (凯宝川苧)', 14, 327, 33, 11, '2021-07-29', '2023-07-16', 95, '20210729');
INSERT INTO `pharmacy` VALUES (243, '济生肾气丸', 14, 80, 4, 11, '2021-01-19', '2023-06-12', 178, '20210119');
INSERT INTO `pharmacy` VALUES (244, '单硝酸异山梨酯缓释片 (索尼特)', 1, 880, 26, 4, '2021-07-13', '2023-10-09', 182, '20210713');
INSERT INTO `pharmacy` VALUES (245, '头孢泊肟酯干混悬剂 (纯迪)', 1, 806, 24, 9, '2021-05-08', '2023-12-18', 115, '20210508');
INSERT INTO `pharmacy` VALUES (246, '盐酸左氧氟沙星片 (康坚)', 13, 638, 2, 12, '2021-12-11', '2023-03-03', 199, '20211211');
INSERT INTO `pharmacy` VALUES (247, '柳氮磺吡啶肠溶片', 3, 834, 16, 10, '2021-10-25', '2023-08-04', 89, '20211025');
INSERT INTO `pharmacy` VALUES (248, '六味地黄丸(浓缩丸) (佛慈)', 5, 987, 47, 10, '2021-05-15', '2023-06-27', 176, '20210515');
INSERT INTO `pharmacy` VALUES (249, '格列齐特片', 5, 134, 5, 11, '2021-04-11', '2023-07-06', 125, '20210411');
INSERT INTO `pharmacy` VALUES (250, '盐酸羟甲唑啉喷雾剂 (他利特)', 7, 168, 35, 8, '2021-09-13', '2023-05-30', 92, '20210913');
INSERT INTO `pharmacy` VALUES (251, '辛伐他汀胶囊 (新达苏)', 14, 204, 5, 2, '2021-05-26', '2023-02-22', 92, '20210526');
INSERT INTO `pharmacy` VALUES (252, '消食健胃片 (君山)', 12, 653, 19, 7, '2021-06-01', '2023-04-30', 180, '20210601');
INSERT INTO `pharmacy` VALUES (253, '归脾丸', 2, 585, 20, 9, '2021-11-01', '2023-09-01', 170, '20211101');
INSERT INTO `pharmacy` VALUES (254, '硝苯地平缓释片(Ⅱ)', 13, 803, 3, 1, '2021-10-12', '2023-12-07', 176, '20211012');
INSERT INTO `pharmacy` VALUES (255, '盐酸氮卓斯汀滴眼液', 9, 546, 2, 1, '2021-06-03', '2023-03-18', 131, '20210603');
INSERT INTO `pharmacy` VALUES (256, '兰索拉唑片', 1, 47, 20, 3, '2021-08-13', '2023-05-01', 102, '20210813');
INSERT INTO `pharmacy` VALUES (257, '五维赖氨酸颗粒 (迈维希)', 13, 587, 50, 9, '2021-03-29', '2023-05-29', 134, '20210329');
INSERT INTO `pharmacy` VALUES (258, '替米沙坦片 (特立康)', 7, 966, 12, 8, '2021-02-05', '2023-09-30', 103, '20210205');
INSERT INTO `pharmacy` VALUES (259, '消炎利胆片 (万年青)', 5, 753, 12, 10, '2021-07-27', '2023-04-24', 147, '20210727');
INSERT INTO `pharmacy` VALUES (260, '肾石通颗粒 (在田)', 8, 291, 33, 5, '2021-07-07', '2023-09-10', 183, '20210707');
INSERT INTO `pharmacy` VALUES (261, '盐酸洛哌丁胺胶囊 (易蒙停)', 8, 652, 11, 6, '2021-03-19', '2023-04-28', 124, '20210319');
INSERT INTO `pharmacy` VALUES (262, '健脾壮腰药酒', 5, 894, 1, 1, '2021-08-24', '2023-03-04', 91, '20210824');
INSERT INTO `pharmacy` VALUES (263, '苯磺酸氨氯地平片 (步长)', 11, 235, 42, 5, '2021-03-08', '2023-07-19', 142, '20210308');
INSERT INTO `pharmacy` VALUES (264, '风湿福音丸', 8, 901, 21, 10, '2021-06-10', '2023-10-22', 89, '20210610');
INSERT INTO `pharmacy` VALUES (265, '醋酸氟轻松乳膏', 8, 710, 1, 7, '2021-02-12', '2023-11-14', 143, '20210212');
INSERT INTO `pharmacy` VALUES (266, '聚异戊二烯合成避孕套 (杰士邦非乳胶安全套)', 5, 331, 41, 5, '2021-04-22', '2023-06-25', 90, '20210422');
INSERT INTO `pharmacy` VALUES (267, '匹维溴铵片 (耐特安)', 5, 225, 24, 11, '2021-05-20', '2023-03-30', 118, '20210520');
INSERT INTO `pharmacy` VALUES (268, '盐酸米诺环素胶囊 (玫满)', 5, 191, 1, 2, '2021-12-26', '2023-12-03', 148, '20211226');
INSERT INTO `pharmacy` VALUES (269, '还少胶囊 (美迪生)', 6, 487, 12, 6, '2021-08-03', '2023-12-19', 160, '20210803');
INSERT INTO `pharmacy` VALUES (270, '六味地黄胶囊 (修正)', 4, 500, 44, 5, '2021-04-07', '2023-02-21', 111, '20210407');
INSERT INTO `pharmacy` VALUES (271, '逍遥丸 (葵花)', 4, 720, 27, 8, '2021-12-14', '2023-05-17', 115, '20211214');
INSERT INTO `pharmacy` VALUES (272, '板蓝根颗粒', 2, 231, 17, 4, '2021-12-05', '2023-11-18', 91, '20211205');
INSERT INTO `pharmacy` VALUES (273, '金刚藤软胶囊', 1, 183, 35, 5, '2021-07-21', '2023-11-28', 82, '20210721');
INSERT INTO `pharmacy` VALUES (274, '克拉霉素胶囊 (桑美)', 3, 604, 19, 9, '2021-10-28', '2023-04-05', 154, '20211028');
INSERT INTO `pharmacy` VALUES (275, '石龙清血颗粒 (圣敌)', 4, 191, 48, 5, '2021-03-05', '2023-12-27', 116, '20210305');
INSERT INTO `pharmacy` VALUES (276, '代温灸膏', 9, 367, 47, 8, '2021-12-31', '2023-02-11', 143, '20211231');
INSERT INTO `pharmacy` VALUES (277, '源生堂牌海狗人参丸', 12, 982, 31, 8, '2021-12-01', '2023-03-23', 138, '20211201');
INSERT INTO `pharmacy` VALUES (278, '倍耐力男用喷剂 (倍耐力)', 11, 995, 21, 5, '2021-05-28', '2023-04-24', 181, '20210528');
INSERT INTO `pharmacy` VALUES (279, '金鸡胶囊 (金鸡)', 13, 610, 47, 3, '2021-02-10', '2023-01-13', 153, '20210210');
INSERT INTO `pharmacy` VALUES (280, '北京人参蜂王浆口服液', 6, 599, 23, 3, '2021-10-01', '2023-12-26', 174, '20211001');
INSERT INTO `pharmacy` VALUES (281, '气血康胶囊 (云丰)', 4, 725, 6, 10, '2021-05-10', '2023-06-26', 196, '20210510');
INSERT INTO `pharmacy` VALUES (282, '腰息痛胶囊 (汝立康)', 5, 116, 37, 7, '2021-01-09', '2023-05-11', 112, '20210109');
INSERT INTO `pharmacy` VALUES (283, '利肝隆片 (坝上)', 14, 108, 1, 12, '2021-05-04', '2023-08-26', 163, '20210504');
INSERT INTO `pharmacy` VALUES (284, '羟苯磺酸钙分散片', 8, 174, 21, 11, '2021-04-04', '2023-09-24', 193, '20210404');
INSERT INTO `pharmacy` VALUES (285, '板蓝根颗粒 (999)', 6, 393, 3, 7, '2021-08-12', '2023-11-09', 160, '20210812');
INSERT INTO `pharmacy` VALUES (286, '益安回生口服液 (天大)', 1, 401, 26, 10, '2021-11-24', '2023-11-07', 197, '20211124');
INSERT INTO `pharmacy` VALUES (287, '碳酸钙D3咀嚼片(Ⅱ) (钙尔奇D)', 14, 171, 24, 10, '2021-01-31', '2023-02-09', 196, '20210131');
INSERT INTO `pharmacy` VALUES (288, '复方珍珠口疮颗粒', 5, 139, 24, 9, '2021-08-04', '2023-11-27', 144, '20210804');
INSERT INTO `pharmacy` VALUES (289, '金喉健喷雾剂', 2, 291, 41, 4, '2021-02-23', '2023-03-11', 121, '20210223');
INSERT INTO `pharmacy` VALUES (290, '曲安奈德益康唑乳膏 (太古)', 10, 138, 42, 3, '2021-02-05', '2023-11-04', 142, '20210205');
INSERT INTO `pharmacy` VALUES (291, '三磷酸腺苷二钠片 (南国)', 14, 552, 3, 1, '2021-03-19', '2023-12-19', 161, '20210319');
INSERT INTO `pharmacy` VALUES (292, '蒙脱石混悬液', 5, 309, 20, 10, '2021-12-29', '2023-10-30', 151, '20211229');
INSERT INTO `pharmacy` VALUES (293, '丹七软胶囊 (美钠达)', 9, 559, 26, 5, '2021-07-18', '2023-09-23', 164, '20210718');
INSERT INTO `pharmacy` VALUES (294, '辛伐他汀胶囊 (希赛)', 2, 184, 25, 7, '2021-02-03', '2023-01-09', 92, '20210203');
INSERT INTO `pharmacy` VALUES (295, '格列齐特缓释片', 6, 959, 25, 5, '2021-10-03', '2023-05-08', 169, '20211003');
INSERT INTO `pharmacy` VALUES (296, '头孢泊肟酯片 (博曼欣)', 13, 70, 45, 6, '2021-08-19', '2023-12-04', 134, '20210819');
INSERT INTO `pharmacy` VALUES (297, '通窍鼻炎片', 6, 969, 27, 2, '2021-11-27', '2023-08-10', 80, '20211127');
INSERT INTO `pharmacy` VALUES (298, '骨刺丸 (老专家)', 2, 205, 19, 3, '2021-09-09', '2023-12-11', 160, '20210909');
INSERT INTO `pharmacy` VALUES (299, '硝酸毛果芸香碱滴眼液 (真瑞)', 14, 564, 50, 9, '2021-01-26', '2023-08-29', 126, '20210126');
INSERT INTO `pharmacy` VALUES (300, '维A酸乳膏', 4, 200, 8, 9, '2021-03-17', '2023-12-05', 120, '20210317');
INSERT INTO `pharmacy` VALUES (301, '奥沙普秦片 (奥沙新)', 12, 303, 37, 3, '2021-12-12', '2023-05-24', 155, '20211212');
INSERT INTO `pharmacy` VALUES (302, '麻仁润肠丸 (立效)', 13, 744, 31, 8, '2021-05-08', '2023-04-02', 193, '20210508');
INSERT INTO `pharmacy` VALUES (303, '胶体果胶铋胶囊 (安特)', 5, 308, 10, 3, '2021-01-04', '2023-08-20', 111, '20210104');
INSERT INTO `pharmacy` VALUES (304, '胆石利通片', 6, 463, 47, 7, '2021-07-07', '2023-08-02', 196, '20210707');
INSERT INTO `pharmacy` VALUES (305, '盐酸地尔硫卓片 (恬尔心 信谊)', 14, 257, 18, 5, '2021-03-19', '2023-07-02', 93, '20210319');
INSERT INTO `pharmacy` VALUES (306, '振源口服液 (长化)', 3, 737, 31, 6, '2021-04-13', '2023-03-15', 165, '20210413');
INSERT INTO `pharmacy` VALUES (307, '虎力散片', 10, 582, 24, 11, '2021-05-28', '2023-01-28', 187, '20210528');
INSERT INTO `pharmacy` VALUES (308, '保利尔胶囊 (蒙王)', 8, 871, 37, 10, '2021-12-24', '2023-10-03', 195, '20211224');
INSERT INTO `pharmacy` VALUES (309, '安神补脑胶囊 (桑海)', 2, 662, 49, 3, '2021-10-26', '2023-09-06', 100, '20211026');
INSERT INTO `pharmacy` VALUES (310, '利咽灵片', 1, 852, 42, 4, '2021-08-30', '2023-11-24', 179, '20210830');
INSERT INTO `pharmacy` VALUES (311, '脑得生丸 (卞思清)', 4, 232, 38, 6, '2021-03-30', '2023-06-29', 200, '20210330');
INSERT INTO `pharmacy` VALUES (312, '别嘌醇缓释胶囊 (奥迈必利)', 14, 398, 9, 9, '2021-05-17', '2023-08-08', 186, '20210517');
INSERT INTO `pharmacy` VALUES (313, '片仔癀胶囊 (片仔癀)', 10, 760, 26, 1, '2021-07-06', '2023-12-03', 128, '20210706');
INSERT INTO `pharmacy` VALUES (314, '红霉素眼膏 (白敬宇)', 2, 372, 32, 5, '2021-09-16', '2023-08-10', 131, '20210916');
INSERT INTO `pharmacy` VALUES (315, '中华跌打丸', 13, 344, 2, 1, '2021-07-19', '2023-04-28', 82, '20210719');
INSERT INTO `pharmacy` VALUES (316, '枸橼酸西地那非片 (白云山/金戈)', 1, 496, 50, 2, '2021-03-10', '2023-10-06', 173, '20210310');
INSERT INTO `pharmacy` VALUES (317, '硅凝胶敷料膜 (医用疤痕贴/诺月)', 11, 814, 2, 12, '2021-03-26', '2023-08-31', 141, '20210326');
INSERT INTO `pharmacy` VALUES (318, '双氯芬酸钠缓释片 (葵花药业)', 2, 249, 30, 11, '2021-02-06', '2023-08-12', 100, '20210206');
INSERT INTO `pharmacy` VALUES (319, '硝酸奥昔康唑乳膏 (替呋康)', 13, 567, 43, 1, '2021-12-20', '2023-05-02', 144, '20211220');
INSERT INTO `pharmacy` VALUES (320, '甘露聚糖肽片', 13, 344, 50, 3, '2021-04-26', '2023-03-17', 93, '20210426');
INSERT INTO `pharmacy` VALUES (321, '鼻炎宁颗粒 (敖东)', 13, 436, 9, 8, '2021-09-13', '2023-05-20', 148, '20210913');
INSERT INTO `pharmacy` VALUES (322, '至灵菌丝胶囊 (瑞森)', 8, 669, 18, 1, '2021-12-16', '2023-09-27', 80, '20211216');
INSERT INTO `pharmacy` VALUES (323, '补脑安神片 (舒康静)', 9, 406, 4, 10, '2021-02-09', '2023-06-20', 173, '20210209');
INSERT INTO `pharmacy` VALUES (324, '盐酸二甲双胍缓释片 (倍顺)', 8, 861, 19, 11, '2021-08-27', '2023-04-10', 170, '20210827');
INSERT INTO `pharmacy` VALUES (325, '瑞舒伐他汀钙片 (海舒严)', 4, 668, 26, 10, '2021-12-04', '2023-11-15', 112, '20211204');
INSERT INTO `pharmacy` VALUES (326, '卡马西平片', 12, 849, 34, 12, '2021-02-24', '2023-04-29', 131, '20210224');
INSERT INTO `pharmacy` VALUES (327, '盐酸苯环壬酯片 (飞赛乐)', 1, 683, 18, 9, '2021-06-03', '2023-11-18', 164, '20210603');
INSERT INTO `pharmacy` VALUES (328, '凉血祛风糖浆 (吉春)', 14, 355, 6, 4, '2021-12-11', '2023-04-09', 182, '20211211');
INSERT INTO `pharmacy` VALUES (329, '一清颗粒 (刻康)', 4, 236, 20, 1, '2021-12-09', '2023-10-04', 193, '20211209');
INSERT INTO `pharmacy` VALUES (330, '康妇软膏 (玉仁)', 2, 562, 32, 1, '2021-07-06', '2023-02-01', 88, '20210706');
INSERT INTO `pharmacy` VALUES (331, '盐酸甲氯芬酯胶囊 (健瑙素)', 12, 324, 37, 4, '2021-06-15', '2023-09-24', 135, '20210615');
INSERT INTO `pharmacy` VALUES (332, '景天祛斑片', 8, 196, 45, 8, '2021-12-05', '2023-07-27', 161, '20211205');
INSERT INTO `pharmacy` VALUES (333, '猴头菌片 (场道邦克)', 8, 972, 29, 7, '2021-03-25', '2023-12-25', 106, '20210325');
INSERT INTO `pharmacy` VALUES (334, '促黄体生成激素(LH)检测试剂(乳胶法) (可丽蓝排卵检测笔)', 3, 427, 29, 4, '2021-03-10', '2023-07-18', 129, '20210310');
INSERT INTO `pharmacy` VALUES (335, '活络消痛片 (羚康)', 9, 913, 31, 4, '2021-11-20', '2023-05-18', 114, '20211120');
INSERT INTO `pharmacy` VALUES (336, '格列美脲片 (圣平)', 14, 967, 49, 12, '2021-05-01', '2023-02-13', 197, '20210501');
INSERT INTO `pharmacy` VALUES (337, '复肾宁胶囊 (吉春)', 12, 673, 21, 3, '2021-02-20', '2023-07-15', 139, '20210220');
INSERT INTO `pharmacy` VALUES (338, '复方愈创木酚磺酸钾口服溶液', 11, 869, 3, 4, '2021-05-08', '2023-03-19', 177, '20210508');
INSERT INTO `pharmacy` VALUES (339, '血栓心脉宁胶囊', 5, 613, 25, 11, '2021-07-30', '2023-10-07', 113, '20210730');
INSERT INTO `pharmacy` VALUES (340, '脑安滴丸 (安瑙)', 11, 547, 15, 11, '2021-08-14', '2023-08-12', 88, '20210814');
INSERT INTO `pharmacy` VALUES (341, '复方醋酸地塞米松乳膏 (德成)', 1, 365, 47, 8, '2021-09-15', '2023-05-02', 155, '20210915');
INSERT INTO `pharmacy` VALUES (342, '胃灵颗粒 (旺渭宝)', 13, 385, 1, 10, '2021-01-28', '2023-11-23', 160, '20210128');
INSERT INTO `pharmacy` VALUES (343, '复方南星止痛膏 (康缘)', 13, 358, 33, 11, '2021-02-01', '2023-08-27', 129, '20210201');
INSERT INTO `pharmacy` VALUES (344, '维磷葡钙片', 2, 691, 35, 2, '2021-07-27', '2023-05-30', 144, '20210727');
INSERT INTO `pharmacy` VALUES (345, '百合康牌芦荟软胶囊', 9, 185, 47, 9, '2021-02-17', '2023-07-26', 146, '20210217');
INSERT INTO `pharmacy` VALUES (346, '盐酸司来吉兰片 (金思平)', 4, 312, 38, 12, '2021-05-01', '2023-04-27', 130, '20210501');
INSERT INTO `pharmacy` VALUES (347, '鼻腔喷雾器 (鼻朗生理性海水)', 5, 423, 12, 9, '2021-02-23', '2023-11-14', 145, '20210223');
INSERT INTO `pharmacy` VALUES (348, '造口护理用品附件 (皮肤保护膜)', 6, 548, 6, 5, '2021-01-19', '2023-10-02', 97, '20210119');
INSERT INTO `pharmacy` VALUES (349, '痫愈胶囊', 3, 277, 23, 9, '2021-07-29', '2023-11-07', 159, '20210729');
INSERT INTO `pharmacy` VALUES (350, '清喉咽合剂', 8, 300, 12, 1, '2021-02-23', '2023-11-24', 184, '20210223');
INSERT INTO `pharmacy` VALUES (351, '十六味消渴胶囊 (颐圣)', 4, 520, 44, 8, '2021-10-04', '2023-10-03', 82, '20211004');
INSERT INTO `pharmacy` VALUES (352, '妇炎康分散片 (舒贝灵)', 5, 453, 25, 2, '2021-03-25', '2023-10-29', 171, '20210325');
INSERT INTO `pharmacy` VALUES (353, '参芪五味子片', 8, 199, 46, 4, '2021-07-05', '2023-07-17', 169, '20210705');
INSERT INTO `pharmacy` VALUES (354, '生理性海水鼻腔护理喷雾器 (诺斯清)', 6, 631, 47, 1, '2021-12-06', '2023-03-12', 113, '20211206');
INSERT INTO `pharmacy` VALUES (355, '麝香壮骨膏', 12, 646, 32, 10, '2021-12-03', '2023-10-16', 167, '20211203');
INSERT INTO `pharmacy` VALUES (356, '胃灵颗粒 (平康)', 13, 487, 25, 1, '2021-05-16', '2023-12-29', 164, '20210516');
INSERT INTO `pharmacy` VALUES (357, '伊曲康唑胶囊 (易启康)', 12, 587, 30, 9, '2021-09-11', '2023-02-17', 135, '20210911');
INSERT INTO `pharmacy` VALUES (358, '小儿维生素咀嚼片 (小施尔康)', 13, 959, 1, 3, '2021-12-28', '2023-09-30', 160, '20211228');
INSERT INTO `pharmacy` VALUES (359, '阿胶益寿口服液', 11, 481, 12, 1, '2021-09-18', '2023-07-14', 99, '20210918');
INSERT INTO `pharmacy` VALUES (360, '辛伐他汀片 (舒降之)', 12, 696, 31, 2, '2021-04-03', '2023-05-25', 122, '20210403');
INSERT INTO `pharmacy` VALUES (361, '清脑降压片 (盘龙)', 14, 789, 1, 1, '2021-04-13', '2023-11-27', 147, '20210413');
INSERT INTO `pharmacy` VALUES (362, '通乳颗粒', 8, 182, 46, 2, '2021-10-03', '2023-07-20', 154, '20211003');
INSERT INTO `pharmacy` VALUES (363, '通窍鼻炎片 (甲红)', 1, 359, 27, 4, '2021-09-20', '2023-08-26', 124, '20210920');
INSERT INTO `pharmacy` VALUES (364, '铝碳酸镁咀嚼片', 9, 313, 13, 12, '2021-04-10', '2023-02-15', 85, '20210410');
INSERT INTO `pharmacy` VALUES (365, '血塞通片', 13, 673, 2, 6, '2021-03-05', '2023-07-01', 176, '20210305');
INSERT INTO `pharmacy` VALUES (366, '妇炎康丸', 11, 834, 50, 9, '2021-09-14', '2023-12-09', 185, '20210914');
INSERT INTO `pharmacy` VALUES (367, '肝苏颗粒 (古蔺肝苏)', 14, 356, 9, 3, '2021-05-31', '2023-03-27', 136, '20210531');
INSERT INTO `pharmacy` VALUES (368, '肝喜乐胶囊', 11, 449, 40, 3, '2021-06-15', '2023-10-24', 185, '20210615');
INSERT INTO `pharmacy` VALUES (369, '通天口服液 (太极)', 14, 137, 31, 2, '2021-06-13', '2023-05-30', 92, '20210613');
INSERT INTO `pharmacy` VALUES (370, '克霉唑阴道片 (伊悦)', 4, 395, 1, 8, '2021-11-22', '2023-12-26', 146, '20211122');
INSERT INTO `pharmacy` VALUES (371, '复方苯巴比妥溴化钠片', 1, 217, 42, 5, '2021-04-07', '2023-03-11', 109, '20210407');
INSERT INTO `pharmacy` VALUES (372, '十八味党参丸 (卓玛丹)', 5, 541, 17, 11, '2021-02-22', '2023-07-11', 163, '20210222');
INSERT INTO `pharmacy` VALUES (373, '甲钴胺胶囊 (悦敏兴)', 1, 340, 38, 8, '2021-04-11', '2023-04-13', 153, '20210411');
INSERT INTO `pharmacy` VALUES (374, '盐酸特比萘芬喷雾剂 (丁克)', 11, 483, 49, 6, '2021-03-22', '2023-12-09', 111, '20210322');
INSERT INTO `pharmacy` VALUES (375, '前列地尔注射液', 14, 704, 24, 3, '2021-01-06', '2023-01-09', 184, '20210106');
INSERT INTO `pharmacy` VALUES (376, '美洛昔康片 (则立)', 2, 875, 1, 12, '2021-10-27', '2023-11-17', 93, '20211027');
INSERT INTO `pharmacy` VALUES (377, '舒筋活血丸', 4, 259, 5, 3, '2021-06-30', '2023-09-13', 197, '20210630');
INSERT INTO `pharmacy` VALUES (378, '首乌延寿片 (龙门)', 11, 681, 20, 10, '2021-06-18', '2023-07-09', 96, '20210618');
INSERT INTO `pharmacy` VALUES (379, '伤湿祛痛膏', 4, 935, 26, 8, '2021-02-01', '2023-07-15', 169, '20210201');
INSERT INTO `pharmacy` VALUES (380, '复方醋酸氟轻松酊', 13, 21, 10, 2, '2021-11-06', '2023-03-22', 155, '20211106');
INSERT INTO `pharmacy` VALUES (381, '回春如意胶囊 (星宝)', 10, 186, 38, 4, '2021-07-08', '2023-05-16', 104, '20210708');
INSERT INTO `pharmacy` VALUES (382, '芪参益气滴丸 (天士力)', 12, 169, 46, 12, '2021-10-19', '2023-02-27', 127, '20211019');
INSERT INTO `pharmacy` VALUES (383, '盐酸酚苄明片', 10, 969, 7, 8, '2021-05-01', '2023-12-04', 153, '20210501');
INSERT INTO `pharmacy` VALUES (384, '益母草颗粒(无糖型)', 12, 477, 8, 5, '2021-12-26', '2023-05-25', 81, '20211226');
INSERT INTO `pharmacy` VALUES (385, '盐酸曲美他嗪片', 7, 487, 48, 1, '2021-04-29', '2023-07-17', 81, '20210429');
INSERT INTO `pharmacy` VALUES (386, '复方脑蛋白水解物片 (三精)', 11, 85, 1, 9, '2021-06-03', '2023-05-26', 167, '20210603');
INSERT INTO `pharmacy` VALUES (387, '清肺抑火片', 14, 305, 44, 11, '2021-12-19', '2023-08-03', 118, '20211219');
INSERT INTO `pharmacy` VALUES (388, '乳核散结胶囊 (百氏福)', 9, 102, 5, 1, '2021-05-08', '2023-07-03', 149, '20210508');
INSERT INTO `pharmacy` VALUES (389, '天麻胶囊 (一正)', 4, 311, 47, 2, '2021-05-19', '2023-06-20', 90, '20210519');
INSERT INTO `pharmacy` VALUES (390, '消癌平胶囊', 13, 318, 33, 4, '2021-11-13', '2023-03-31', 191, '20211113');
INSERT INTO `pharmacy` VALUES (391, 'DHA牛磺酸蛋白质粉 (康美宁)', 8, 529, 12, 6, '2021-03-18', '2023-08-25', 94, '20210318');
INSERT INTO `pharmacy` VALUES (392, '钙铁锌蛋白质粉 (康芝佳)', 13, 891, 29, 8, '2021-03-21', '2023-12-29', 131, '20210321');
INSERT INTO `pharmacy` VALUES (393, '百邦牌天然维生素E软胶囊 (妙姿)', 7, 921, 24, 11, '2021-12-31', '2023-11-03', 193, '20211231');
INSERT INTO `pharmacy` VALUES (394, '威莱斯牌大豆异黄酮维E胶囊 (千泉)', 7, 855, 17, 1, '2021-03-29', '2023-11-07', 93, '20210329');
INSERT INTO `pharmacy` VALUES (395, '铁叶酸片 (紫一)', 12, 127, 21, 11, '2021-12-31', '2023-11-24', 129, '20211231');
INSERT INTO `pharmacy` VALUES (396, '退热贴 (兵兵)', 12, 229, 45, 8, '2021-01-26', '2023-11-21', 119, '20210126');
INSERT INTO `pharmacy` VALUES (397, '柠檬酸苹果酸钙葡萄糖酸锌咀嚼片(少儿型)', 9, 690, 48, 5, '2021-03-05', '2023-10-16', 128, '20210305');
INSERT INTO `pharmacy` VALUES (398, '凯蒂仙牌减肥胶囊 (广济堂)', 8, 568, 22, 12, '2021-11-14', '2023-10-02', 177, '20211114');
INSERT INTO `pharmacy` VALUES (399, '益肝灵片 (山岳)', 11, 627, 12, 2, '2021-08-31', '2023-04-23', 128, '20210831');
INSERT INTO `pharmacy` VALUES (400, '消炎利胆胶囊', 9, 134, 9, 10, '2021-12-19', '2023-11-28', 156, '20211219');
INSERT INTO `pharmacy` VALUES (401, '风湿马钱片 (康平)', 7, 550, 9, 12, '2021-12-07', '2023-05-20', 157, '20211207');
INSERT INTO `pharmacy` VALUES (402, '头孢地尼分散片', 12, 483, 15, 6, '2021-12-29', '2023-06-26', 93, '20211229');
INSERT INTO `pharmacy` VALUES (403, '可轻牌减肥胶囊', 5, 566, 12, 7, '2021-05-25', '2023-12-20', 189, '20210525');
INSERT INTO `pharmacy` VALUES (404, '中天骏康牌人参氨基酸口服液', 12, 603, 47, 9, '2021-04-12', '2023-12-06', 184, '20210412');
INSERT INTO `pharmacy` VALUES (405, '缩泉胶囊 (汉森)', 7, 871, 35, 12, '2021-10-02', '2023-02-15', 175, '20211002');
INSERT INTO `pharmacy` VALUES (406, '远红外腰痛贴 (苗宝堂)', 7, 966, 32, 12, '2021-01-07', '2023-09-23', 124, '20210107');
INSERT INTO `pharmacy` VALUES (407, '清火胶囊', 2, 249, 24, 3, '2021-03-20', '2023-02-22', 182, '20210320');
INSERT INTO `pharmacy` VALUES (408, '偏瘫复原丸', 1, 100, 36, 6, '2021-01-16', '2023-08-21', 143, '20210116');
INSERT INTO `pharmacy` VALUES (409, '跌打损伤丸', 14, 981, 8, 11, '2021-07-17', '2023-10-18', 180, '20210717');
INSERT INTO `pharmacy` VALUES (410, '舒筋活血片', 8, 255, 36, 1, '2021-08-28', '2023-04-30', 120, '20210828');
INSERT INTO `pharmacy` VALUES (411, '肤痒颗粒', 1, 983, 27, 5, '2021-02-04', '2023-10-10', 169, '20210204');
INSERT INTO `pharmacy` VALUES (412, '鼻舒适片', 14, 224, 49, 3, '2021-11-23', '2023-11-10', 130, '20211123');
INSERT INTO `pharmacy` VALUES (413, '盐酸洛美沙星滴眼液', 7, 291, 34, 8, '2021-07-19', '2023-02-07', 114, '20210719');
INSERT INTO `pharmacy` VALUES (414, '玄麦甘桔颗粒', 10, 390, 2, 4, '2021-10-17', '2023-07-27', 180, '20211017');
INSERT INTO `pharmacy` VALUES (415, '炎立消胶囊', 12, 941, 39, 6, '2021-12-08', '2023-05-05', 145, '20211208');
INSERT INTO `pharmacy` VALUES (416, '纳米银妇女外用抗菌凝胶 (爱杰特凝胶)', 3, 989, 11, 3, '2021-06-17', '2023-05-20', 160, '20210617');
INSERT INTO `pharmacy` VALUES (417, '妇炎消胶囊 (益佰)', 2, 356, 18, 4, '2021-08-04', '2023-09-05', 154, '20210804');
INSERT INTO `pharmacy` VALUES (418, '注射用丙戊酸钠 (德巴金)', 13, 995, 2, 7, '2021-03-14', '2023-08-05', 95, '20210314');
INSERT INTO `pharmacy` VALUES (419, '麝香祛痛气雾剂', 2, 579, 40, 12, '2021-12-23', '2023-04-28', 153, '20211223');
INSERT INTO `pharmacy` VALUES (420, '蜜炼川贝枇杷膏', 6, 816, 18, 9, '2021-07-21', '2023-06-29', 168, '20210721');
INSERT INTO `pharmacy` VALUES (421, '复方阿胶浆', 11, 657, 27, 12, '2021-01-15', '2023-10-14', 94, '20210115');
INSERT INTO `pharmacy` VALUES (422, '妇科止血灵', 11, 866, 15, 4, '2021-11-22', '2023-12-13', 83, '20211122');
INSERT INTO `pharmacy` VALUES (423, '抗宫炎软胶囊', 6, 489, 34, 6, '2021-10-04', '2023-03-27', 174, '20211004');
INSERT INTO `pharmacy` VALUES (424, '感冒灵胶囊', 14, 338, 44, 12, '2021-10-16', '2023-06-02', 185, '20211016');
INSERT INTO `pharmacy` VALUES (425, '养血安神颗粒', 7, 990, 36, 11, '2021-11-20', '2023-03-25', 97, '20211120');
INSERT INTO `pharmacy` VALUES (426, '克霉唑溶液', 9, 116, 39, 3, '2021-05-16', '2023-05-11', 95, '20210516');
INSERT INTO `pharmacy` VALUES (427, '盐酸布替萘芬乳膏 (孚答静)', 14, 456, 1, 1, '2021-03-29', '2023-08-09', 146, '20210329');
INSERT INTO `pharmacy` VALUES (428, '抗病毒口服液', 11, 852, 38, 4, '2021-05-26', '2023-07-08', 198, '20210526');
INSERT INTO `pharmacy` VALUES (429, '克霉唑阴道片 (正美汀)', 6, 833, 19, 6, '2021-09-05', '2023-06-04', 164, '20210905');
INSERT INTO `pharmacy` VALUES (430, '益母草颗粒(金鸡)', 11, 451, 37, 8, '2021-03-18', '2023-10-20', 134, '20210318');
INSERT INTO `pharmacy` VALUES (431, '开塞露(含甘油) (一新)', 12, 660, 42, 5, '2021-10-13', '2023-08-05', 140, '20211013');
INSERT INTO `pharmacy` VALUES (432, '盐酸金霉素眼膏', 11, 653, 24, 7, '2021-03-21', '2023-01-01', 115, '20210321');
INSERT INTO `pharmacy` VALUES (433, '大山楂颗粒', 13, 376, 44, 5, '2021-08-20', '2023-12-13', 140, '20210820');
INSERT INTO `pharmacy` VALUES (434, '舒肝健胃丸(水丸)', 2, 72, 5, 1, '2021-12-24', '2023-11-18', 130, '20211224');
INSERT INTO `pharmacy` VALUES (435, '喷托维林氯化铵糖浆', 4, 851, 50, 4, '2021-07-27', '2023-09-04', 171, '20210727');
INSERT INTO `pharmacy` VALUES (436, '温胃舒片', 9, 858, 28, 5, '2021-05-23', '2023-05-25', 149, '20210523');
INSERT INTO `pharmacy` VALUES (437, '酒石酸美托洛尔片', 7, 189, 34, 7, '2021-09-29', '2023-02-06', 146, '20210929');
INSERT INTO `pharmacy` VALUES (438, '肠康片(正清)', 8, 276, 24, 3, '2021-03-12', '2023-08-29', 83, '20210312');
INSERT INTO `pharmacy` VALUES (439, '杜仲补腰合剂', 1, 343, 27, 7, '2021-10-02', '2023-01-28', 93, '20211002');
INSERT INTO `pharmacy` VALUES (440, '酮康唑胶囊', 3, 257, 47, 9, '2021-03-31', '2023-09-26', 82, '20210331');
INSERT INTO `pharmacy` VALUES (441, '脉平片', 3, 389, 47, 10, '2022-01-01', '2023-04-26', 116, '20220101');
INSERT INTO `pharmacy` VALUES (442, '金防感冒颗粒 (999)', 11, 941, 23, 6, '2021-03-04', '2023-03-10', 163, '20210304');
INSERT INTO `pharmacy` VALUES (443, '通宣理肺丸', 1, 440, 37, 1, '2021-07-11', '2023-09-24', 183, '20210711');
INSERT INTO `pharmacy` VALUES (444, '前列舒乐颗粒', 13, 870, 11, 3, '2021-10-09', '2023-03-17', 162, '20211009');
INSERT INTO `pharmacy` VALUES (445, '六神丸', 13, 44, 40, 6, '2021-05-21', '2023-04-07', 171, '20210521');
INSERT INTO `pharmacy` VALUES (446, '正柴胡饮颗粒', 13, 645, 19, 1, '2021-09-11', '2023-11-11', 158, '20210911');
INSERT INTO `pharmacy` VALUES (447, '黑鬼油', 2, 645, 26, 3, '2021-03-02', '2023-10-22', 145, '20210302');
INSERT INTO `pharmacy` VALUES (448, '止咳宁嗽胶囊', 4, 908, 13, 9, '2021-01-06', '2023-01-21', 178, '20210106');
INSERT INTO `pharmacy` VALUES (449, '加味八珍益母胶囊 (七奇)', 14, 170, 11, 8, '2021-12-30', '2023-11-14', 109, '20211230');
INSERT INTO `pharmacy` VALUES (450, '甜梦口服液 (荣昌制药)', 3, 544, 12, 12, '2021-06-12', '2023-08-08', 155, '20210612');
INSERT INTO `pharmacy` VALUES (451, '脂降宁片', 11, 149, 48, 4, '2021-07-12', '2023-09-03', 197, '20210712');
INSERT INTO `pharmacy` VALUES (452, '普乐安片', 2, 381, 38, 12, '2021-12-21', '2023-08-11', 188, '20211221');
INSERT INTO `pharmacy` VALUES (453, '益肾灵颗粒 (颐乐)', 13, 509, 49, 3, '2021-04-29', '2023-12-17', 131, '20210429');
INSERT INTO `pharmacy` VALUES (454, '康复新液', 7, 71, 20, 1, '2021-12-26', '2023-03-01', 135, '20211226');
INSERT INTO `pharmacy` VALUES (455, '麝香祛风湿油 (人字)', 11, 365, 44, 1, '2021-06-27', '2023-04-30', 80, '20210627');
INSERT INTO `pharmacy` VALUES (456, '归脾丸 (九芝堂)', 2, 141, 40, 4, '2021-11-09', '2023-01-15', 144, '20211109');
INSERT INTO `pharmacy` VALUES (457, '金胆片', 6, 882, 41, 6, '2021-04-01', '2023-09-10', 146, '20210401');
INSERT INTO `pharmacy` VALUES (458, '顽癣净 (南洋)', 11, 91, 6, 4, '2021-08-25', '2023-10-30', 162, '20210825');
INSERT INTO `pharmacy` VALUES (459, '奥美拉唑肠溶片 (瑞奥)', 2, 968, 41, 9, '2021-04-17', '2023-02-09', 134, '20210417');
INSERT INTO `pharmacy` VALUES (460, '复合维生素B片', 11, 636, 18, 3, '2021-11-08', '2023-11-12', 126, '20211108');
INSERT INTO `pharmacy` VALUES (461, '通窍鼻炎胶囊', 3, 821, 27, 12, '2021-01-05', '2023-05-11', 141, '20210105');
INSERT INTO `pharmacy` VALUES (462, '消栓再造丸 (木鱼石)', 13, 483, 15, 1, '2021-12-03', '2023-12-31', 92, '20211203');
INSERT INTO `pharmacy` VALUES (463, '二十五味鬼臼丸', 5, 273, 47, 7, '2021-06-23', '2023-04-13', 125, '20210623');
INSERT INTO `pharmacy` VALUES (464, '胃刻宁片 (双药)', 13, 721, 32, 10, '2021-01-04', '2023-01-19', 86, '20210104');
INSERT INTO `pharmacy` VALUES (465, '仙灵骨葆片 (同济堂)', 9, 913, 33, 6, '2021-06-20', '2023-03-03', 94, '20210620');
INSERT INTO `pharmacy` VALUES (466, '盐酸二甲双胍缓释胶囊 (唐落)', 10, 968, 46, 8, '2021-05-18', '2023-08-12', 192, '20210518');
INSERT INTO `pharmacy` VALUES (467, '妥布霉素滴眼液', 14, 766, 43, 7, '2021-08-07', '2023-02-21', 188, '20210807');
INSERT INTO `pharmacy` VALUES (468, '阿莫西林克拉维酸钾胶囊(4:1) (巨泰)', 7, 536, 16, 5, '2021-03-30', '2023-05-02', 84, '20210330');
INSERT INTO `pharmacy` VALUES (469, '同仁乌鸡白凤丸', 2, 995, 43, 10, '2021-01-09', '2023-11-11', 100, '20210109');
INSERT INTO `pharmacy` VALUES (470, '参茸强肾片', 12, 83, 22, 3, '2021-01-27', '2023-03-28', 186, '20210127');
INSERT INTO `pharmacy` VALUES (471, '盐酸洛美沙星胶囊 (诺灵盾)', 8, 513, 3, 10, '2021-01-07', '2023-02-18', 160, '20210107');
INSERT INTO `pharmacy` VALUES (472, '强力脑心康胶囊 (金汇)', 3, 294, 16, 4, '2021-05-30', '2023-08-14', 137, '20210530');
INSERT INTO `pharmacy` VALUES (473, '复方地龙胶囊', 14, 790, 16, 8, '2021-02-26', '2023-07-07', 168, '20210226');
INSERT INTO `pharmacy` VALUES (474, '云芝胞内糖肽胶囊', 2, 206, 7, 9, '2021-11-19', '2023-10-31', 171, '20211119');
INSERT INTO `pharmacy` VALUES (475, '夏枯草胶囊 (紫辰宣)', 13, 853, 35, 10, '2021-06-28', '2023-10-30', 168, '20210628');
INSERT INTO `pharmacy` VALUES (476, '碳酸钙片 (盖舒泰)', 12, 521, 29, 9, '2021-03-06', '2023-04-06', 137, '20210306');
INSERT INTO `pharmacy` VALUES (477, '咽炎片 (999)', 9, 936, 48, 9, '2021-09-27', '2023-06-06', 182, '20210927');
INSERT INTO `pharmacy` VALUES (478, '奥氮平片 (悉敏)', 4, 620, 16, 2, '2021-08-04', '2023-09-27', 176, '20210804');
INSERT INTO `pharmacy` VALUES (479, '三七伤药片', 9, 317, 41, 12, '2021-01-21', '2023-03-16', 112, '20210121');
INSERT INTO `pharmacy` VALUES (480, '灰黄霉素片 (特一)', 6, 522, 17, 1, '2021-09-19', '2023-02-08', 186, '20210919');
INSERT INTO `pharmacy` VALUES (481, '托吡卡胺滴眼液', 2, 923, 48, 7, '2021-04-26', '2023-08-23', 175, '20210426');
INSERT INTO `pharmacy` VALUES (482, '克痒敏醑', 13, 96, 16, 6, '2021-08-27', '2023-11-05', 186, '20210827');
INSERT INTO `pharmacy` VALUES (483, '胃康灵胶囊 (东方金宝)', 13, 348, 45, 1, '2021-09-05', '2023-08-06', 122, '20210905');
INSERT INTO `pharmacy` VALUES (484, '盐酸二甲双胍缓释片 (同盛兰威/允康)', 6, 685, 25, 8, '2021-09-16', '2023-07-17', 131, '20210916');
INSERT INTO `pharmacy` VALUES (485, '牛黄解毒胶囊 (东泰)', 5, 210, 29, 2, '2021-12-03', '2023-07-10', 187, '20211203');
INSERT INTO `pharmacy` VALUES (486, '珍珠明目滴眼液 (润宁/天天明)', 13, 432, 36, 11, '2021-08-30', '2023-10-14', 80, '20210830');
INSERT INTO `pharmacy` VALUES (487, '盐酸环丙沙星胶囊', 13, 625, 24, 2, '2021-04-14', '2023-01-30', 130, '20210414');
INSERT INTO `pharmacy` VALUES (488, '寒喘丸 (藏药)', 6, 688, 24, 1, '2021-10-03', '2023-02-12', 164, '20211003');
INSERT INTO `pharmacy` VALUES (489, '手参肾宝胶囊 (龙抬头)', 1, 168, 43, 9, '2021-10-28', '2023-05-13', 144, '20211028');
INSERT INTO `pharmacy` VALUES (490, '锁阳补肾胶囊 (紫鑫)', 2, 345, 41, 5, '2021-01-09', '2023-02-20', 82, '20210109');
INSERT INTO `pharmacy` VALUES (491, '归脾丸', 5, 153, 46, 1, '2021-07-24', '2023-06-25', 93, '20210724');
INSERT INTO `pharmacy` VALUES (492, '二甲双胍格列本脲片(Ⅰ) (唐柯柠)', 13, 807, 24, 9, '2021-10-13', '2023-05-14', 87, '20211013');
INSERT INTO `pharmacy` VALUES (493, '卡托普利片', 14, 124, 20, 12, '2021-08-16', '2023-01-08', 180, '20210816');
INSERT INTO `pharmacy` VALUES (494, '倍仕好牌硒磷脂软胶囊', 12, 509, 2, 11, '2021-12-23', '2023-03-10', 180, '20211223');
INSERT INTO `pharmacy` VALUES (495, '盐酸氟桂利嗪胶囊 (福元)', 13, 571, 48, 7, '2021-01-23', '2023-01-21', 111, '20210123');
INSERT INTO `pharmacy` VALUES (496, '替硝唑片', 8, 164, 43, 4, '2021-10-10', '2023-01-05', 130, '20211010');
INSERT INTO `pharmacy` VALUES (497, '安宫牛黄丸', 8, 846, 19, 8, '2021-04-11', '2023-06-24', 151, '20210411');
INSERT INTO `pharmacy` VALUES (498, '回春散 (冯了性)', 1, 525, 28, 2, '2021-12-25', '2023-07-10', 150, '20211225');
INSERT INTO `pharmacy` VALUES (499, '千柏鼻炎胶囊 (葵花)', 12, 588, 45, 5, '2021-11-05', '2023-06-16', 158, '20211105');
INSERT INTO `pharmacy` VALUES (500, '维肝福泰片 (羚康)', 14, 172, 28, 5, '2021-02-02', '2023-08-20', 110, '20210202');
INSERT INTO `pharmacy` VALUES (501, '内消瘰疬丸', 10, 665, 36, 7, '2021-03-31', '2023-05-12', 174, '20210331');
INSERT INTO `pharmacy` VALUES (502, '脑络通胶囊 (白云山)', 7, 479, 49, 7, '2021-12-20', '2023-06-14', 159, '20211220');
INSERT INTO `pharmacy` VALUES (503, '艾庄体香露', 2, 435, 35, 9, '2021-08-10', '2023-03-17', 199, '20210810');
INSERT INTO `pharmacy` VALUES (504, '屏风生脉胶囊 (一康)', 14, 384, 18, 11, '2021-09-28', '2023-08-10', 83, '20210928');
INSERT INTO `pharmacy` VALUES (505, '铋镁碳酸氢钠片', 7, 453, 14, 1, '2021-09-16', '2023-09-21', 152, '20210916');
INSERT INTO `pharmacy` VALUES (506, '痛可贴 (满汉御宝)', 5, 214, 8, 10, '2021-09-28', '2023-09-29', 111, '20210928');
INSERT INTO `pharmacy` VALUES (507, '六味消痔片', 1, 551, 42, 10, '2021-03-27', '2023-09-09', 90, '20210327');
INSERT INTO `pharmacy` VALUES (508, '四味脾胃舒片', 12, 185, 35, 2, '2021-04-04', '2023-01-05', 84, '20210404');
INSERT INTO `pharmacy` VALUES (509, '健脑胶囊', 5, 903, 44, 7, '2021-11-17', '2023-03-11', 115, '20211117');
INSERT INTO `pharmacy` VALUES (510, '保和丸', 14, 904, 10, 4, '2021-02-21', '2023-09-09', 133, '20210221');
INSERT INTO `pharmacy` VALUES (511, '调经种子丸 (康乐果)', 2, 860, 26, 1, '2021-05-14', '2023-09-10', 167, '20210514');
INSERT INTO `pharmacy` VALUES (512, '小儿清热宁颗粒', 5, 386, 14, 5, '2021-02-14', '2023-08-04', 139, '20210214');
INSERT INTO `pharmacy` VALUES (513, '排石颗粒', 1, 605, 50, 9, '2021-08-27', '2023-09-01', 169, '20210827');
INSERT INTO `pharmacy` VALUES (514, '乳安胶囊', 5, 313, 13, 9, '2021-10-06', '2023-10-06', 105, '20211006');
INSERT INTO `pharmacy` VALUES (515, '苦参洗液', 5, 208, 17, 1, '2021-08-22', '2023-06-21', 116, '20210822');
INSERT INTO `pharmacy` VALUES (516, '参归润燥搽剂 (参归堂)', 12, 143, 29, 1, '2021-03-09', '2023-09-27', 95, '20210309');
INSERT INTO `pharmacy` VALUES (517, '香砂养胃丸', 5, 442, 11, 11, '2021-09-20', '2023-09-05', 130, '20210920');
INSERT INTO `pharmacy` VALUES (518, '暖胃舒乐片', 1, 450, 8, 2, '2021-08-23', '2023-05-13', 82, '20210823');
INSERT INTO `pharmacy` VALUES (519, '藿香清胃胶囊 (大峻)', 12, 246, 48, 4, '2021-01-01', '2023-10-11', 194, '20210101');
INSERT INTO `pharmacy` VALUES (520, '乳酸菌素片 (三精诺捷康)', 8, 574, 25, 11, '2021-04-27', '2023-06-08', 117, '20210427');
INSERT INTO `pharmacy` VALUES (521, '肾宝胶囊 (桑海)', 12, 453, 8, 9, '2021-12-27', '2023-09-06', 167, '20211227');
INSERT INTO `pharmacy` VALUES (522, '仙人掌胃康胶囊 (等茯康)', 13, 219, 4, 10, '2021-06-13', '2023-05-31', 99, '20210613');
INSERT INTO `pharmacy` VALUES (523, '壮腰健肾丸 (舒康岸)', 1, 734, 10, 4, '2021-07-24', '2023-02-21', 111, '20210724');
INSERT INTO `pharmacy` VALUES (524, '百癣夏塔热片 (章卫健)', 6, 111, 9, 4, '2021-06-29', '2023-12-30', 200, '20210629');
INSERT INTO `pharmacy` VALUES (525, '双辛鼻窦炎颗粒', 4, 529, 23, 2, '2021-02-05', '2023-12-09', 106, '20210205');
INSERT INTO `pharmacy` VALUES (526, '逍遥颗粒 (勃然)', 1, 495, 26, 8, '2021-07-02', '2023-03-20', 190, '20210702');
INSERT INTO `pharmacy` VALUES (527, '四味珍层冰硼滴眼液 (珍视明)', 12, 222, 20, 7, '2021-01-20', '2023-03-15', 136, '20210120');
INSERT INTO `pharmacy` VALUES (528, '宁神灵颗粒', 13, 237, 11, 11, '2021-06-20', '2023-05-02', 112, '20210620');
INSERT INTO `pharmacy` VALUES (529, '复方丹参片', 8, 264, 34, 8, '2021-10-03', '2023-05-04', 121, '20211003');
INSERT INTO `pharmacy` VALUES (530, '脑血栓片 (天强)', 14, 55, 26, 12, '2021-05-29', '2023-03-09', 189, '20210529');
INSERT INTO `pharmacy` VALUES (531, '克林特牌蜂胶胶囊', 9, 283, 31, 6, '2021-06-16', '2023-12-20', 158, '20210616');
INSERT INTO `pharmacy` VALUES (532, '小儿暖脐膏 (双井)', 10, 94, 41, 6, '2021-10-20', '2023-09-20', 149, '20211020');
INSERT INTO `pharmacy` VALUES (533, '健脑补肾丸', 12, 108, 24, 12, '2021-07-16', '2023-11-01', 172, '20210716');
INSERT INTO `pharmacy` VALUES (534, '康琪壹佰牌液体钙软胶囊 (康琪壹佰)', 2, 518, 1, 2, '2021-05-06', '2023-08-19', 134, '20210506');
INSERT INTO `pharmacy` VALUES (535, '银杏三七山楂茶多酚胶囊', 2, 528, 35, 4, '2021-10-21', '2023-12-23', 191, '20211021');
INSERT INTO `pharmacy` VALUES (536, '莫匹罗星软膏 (百多邦)', 9, 348, 35, 5, '2021-07-16', '2023-03-07', 89, '20210716');
INSERT INTO `pharmacy` VALUES (537, '胃乐新胶囊 (林海汝立康)', 14, 975, 38, 1, '2021-03-02', '2023-01-25', 117, '20210302');
INSERT INTO `pharmacy` VALUES (538, '止嗽立效胶囊 (奇特)', 7, 994, 22, 2, '2021-12-19', '2023-06-14', 199, '20211219');
INSERT INTO `pharmacy` VALUES (539, '甲磺酸多沙唑嗪片 (伊粒平)', 5, 23, 10, 5, '2021-08-17', '2023-08-08', 109, '20210817');
INSERT INTO `pharmacy` VALUES (540, '藿香正气水 (金鸡)', 13, 803, 42, 4, '2021-03-23', '2023-08-28', 111, '20210323');
INSERT INTO `pharmacy` VALUES (541, '清开灵颗粒', 8, 436, 16, 5, '2021-03-23', '2023-04-15', 168, '20210323');
INSERT INTO `pharmacy` VALUES (542, '克霉唑阴道泡腾片 (东信)', 2, 823, 39, 3, '2021-03-25', '2023-05-19', 90, '20210325');
INSERT INTO `pharmacy` VALUES (543, '红药片 (广仁)', 12, 237, 8, 4, '2021-03-28', '2023-09-21', 144, '20210328');
INSERT INTO `pharmacy` VALUES (544, '阿司匹林维生素C泡腾片 (白加黑)', 1, 152, 39, 1, '2021-09-27', '2023-05-09', 193, '20210927');
INSERT INTO `pharmacy` VALUES (545, '5D血糖试条 (怡成 5秒血糖试条)', 4, 941, 46, 9, '2021-11-04', '2023-02-27', 144, '20211104');
INSERT INTO `pharmacy` VALUES (546, '酮康他索乳膏 (顺峰康王)', 14, 1000, 39, 9, '2021-08-05', '2023-07-28', 91, '20210805');
INSERT INTO `pharmacy` VALUES (547, '马来酸依那普利片 (依苏)', 5, 707, 22, 6, '2021-03-04', '2023-01-31', 139, '20210304');
INSERT INTO `pharmacy` VALUES (548, '知柏地黄丸 (孙真人)', 8, 904, 3, 1, '2021-01-06', '2023-06-17', 166, '20210106');
INSERT INTO `pharmacy` VALUES (549, '藿阳补肾胶囊', 4, 301, 9, 9, '2021-07-26', '2023-01-18', 100, '20210726');
INSERT INTO `pharmacy` VALUES (550, '炎立消胶囊 (刻康)', 13, 319, 48, 4, '2021-12-18', '2023-07-13', 105, '20211218');
INSERT INTO `pharmacy` VALUES (551, '男宝胶囊', 12, 327, 48, 1, '2021-01-18', '2023-07-31', 176, '20210118');
INSERT INTO `pharmacy` VALUES (552, '泮托拉唑钠肠溶片 (泰美尼克)', 3, 475, 26, 8, '2021-08-23', '2023-05-12', 83, '20210823');
INSERT INTO `pharmacy` VALUES (553, '仙茸壮阳口服液 (颐君)', 4, 911, 38, 2, '2021-06-04', '2023-05-09', 144, '20210604');
INSERT INTO `pharmacy` VALUES (554, '三宝胶囊 (佰年龄)', 7, 102, 30, 10, '2021-01-26', '2023-07-13', 188, '20210126');
INSERT INTO `pharmacy` VALUES (555, '鹿茸口服液', 10, 827, 26, 6, '2021-08-05', '2023-06-15', 175, '20210805');
INSERT INTO `pharmacy` VALUES (556, '清肺抑火片', 8, 747, 48, 3, '2021-02-01', '2023-07-28', 120, '20210201');
INSERT INTO `pharmacy` VALUES (557, '多维元素片(21) (思达康)', 10, 642, 12, 5, '2021-01-13', '2023-07-31', 97, '20210113');
INSERT INTO `pharmacy` VALUES (558, '盐酸二甲双胍缓释片', 8, 95, 45, 2, '2021-01-17', '2023-03-08', 164, '20210117');
INSERT INTO `pharmacy` VALUES (559, '三味清热止痒洗剂 (白云山)', 7, 461, 25, 1, '2021-03-13', '2023-07-16', 131, '20210313');
INSERT INTO `pharmacy` VALUES (560, '沙棘干乳剂', 14, 22, 30, 8, '2021-07-16', '2023-06-28', 147, '20210716');
INSERT INTO `pharmacy` VALUES (561, '精子密度检测试剂盒(比色法) (伊健仕)', 10, 156, 21, 3, '2021-01-15', '2023-06-11', 88, '20210115');
INSERT INTO `pharmacy` VALUES (562, '变通牌通便胶囊 (御芝林)', 1, 455, 11, 3, '2021-10-03', '2023-05-18', 195, '20211003');
INSERT INTO `pharmacy` VALUES (563, '氯美扎酮片 (芬那露)', 2, 614, 47, 4, '2021-11-10', '2023-02-14', 101, '20211110');
INSERT INTO `pharmacy` VALUES (564, '银离子鼻炎抗菌喷剂 (银医生)', 14, 581, 15, 10, '2021-07-16', '2023-03-26', 86, '20210716');
INSERT INTO `pharmacy` VALUES (565, '复方红衣补血口服液 (翔宇红衣)', 8, 526, 36, 4, '2021-12-02', '2023-11-25', 183, '20211202');
INSERT INTO `pharmacy` VALUES (566, '烫熨治疗包 (隔物灸)', 6, 331, 37, 7, '2021-04-27', '2023-12-12', 120, '20210427');
INSERT INTO `pharmacy` VALUES (567, '淋病(GNH)检测试纸(胶体金法) (大卫)', 9, 220, 30, 1, '2021-10-15', '2023-01-05', 108, '20211015');
INSERT INTO `pharmacy` VALUES (568, '多维铁口服溶液', 4, 570, 50, 9, '2021-03-26', '2023-04-21', 112, '20210326');
INSERT INTO `pharmacy` VALUES (569, '参桂鹿茸丸', 2, 456, 35, 10, '2021-03-18', '2023-08-09', 192, '20210318');
INSERT INTO `pharmacy` VALUES (570, '健力多R氨糖软骨素钙片', 4, 147, 20, 2, '2021-09-02', '2023-01-17', 111, '20210902');
INSERT INTO `pharmacy` VALUES (571, '小儿氨酚黄那敏颗粒 (小快克)', 2, 961, 7, 9, '2021-01-11', '2023-11-20', 99, '20210111');
INSERT INTO `pharmacy` VALUES (572, '百合康牌苦瓜洋参软胶囊 (康乃健)', 6, 929, 25, 5, '2021-11-29', '2023-02-02', 191, '20211129');
INSERT INTO `pharmacy` VALUES (573, '清热通淋片', 13, 465, 15, 11, '2021-03-23', '2023-06-10', 195, '20210323');
INSERT INTO `pharmacy` VALUES (574, '天麻丸', 2, 969, 27, 5, '2021-02-12', '2023-04-12', 83, '20210212');
INSERT INTO `pharmacy` VALUES (575, '沉香舒气丸 (同仁堂)', 8, 628, 33, 6, '2021-03-16', '2023-08-05', 118, '20210316');
INSERT INTO `pharmacy` VALUES (576, '维生素C泡腾片 (力度伸)', 9, 805, 11, 5, '2021-11-15', '2023-07-06', 181, '20211115');
INSERT INTO `pharmacy` VALUES (577, '盐酸洛美沙星滴眼液', 7, 933, 38, 12, '2021-05-03', '2023-01-07', 175, '20210503');
INSERT INTO `pharmacy` VALUES (578, '西格列汀二甲双胍片(I) (捷诺达)', 14, 303, 45, 2, '2021-10-10', '2023-10-10', 106, '20211010');
INSERT INTO `pharmacy` VALUES (579, '亚叶酸钙片 (福能)', 9, 394, 19, 2, '2021-09-10', '2023-10-22', 104, '20210910');
INSERT INTO `pharmacy` VALUES (580, '利拉萘酯乳膏 (当止)', 3, 198, 36, 10, '2021-04-22', '2023-05-07', 103, '20210422');
INSERT INTO `pharmacy` VALUES (581, '前列舒乐片 (天洌舒康)', 3, 830, 32, 2, '2021-03-02', '2023-08-14', 126, '20210302');
INSERT INTO `pharmacy` VALUES (582, '安胃片', 10, 116, 23, 12, '2021-08-27', '2023-01-10', 123, '20210827');
INSERT INTO `pharmacy` VALUES (583, '安坤片', 5, 485, 36, 8, '2021-02-05', '2023-11-01', 187, '20210205');
INSERT INTO `pharmacy` VALUES (584, '金砂五淋丸', 11, 983, 5, 11, '2021-08-01', '2023-02-01', 191, '20210801');
INSERT INTO `pharmacy` VALUES (585, '黄藤素片', 14, 223, 10, 12, '2021-11-22', '2023-03-08', 137, '20211122');
INSERT INTO `pharmacy` VALUES (586, '肺宁颗粒', 6, 226, 23, 1, '2021-10-19', '2023-10-17', 110, '20211019');
INSERT INTO `pharmacy` VALUES (587, '丁硼乳膏', 3, 970, 13, 12, '2021-05-04', '2023-10-13', 164, '20210504');
INSERT INTO `pharmacy` VALUES (588, '盐酸特比萘芬乳膏 (兰美抒)', 1, 184, 28, 8, '2021-12-30', '2023-05-10', 180, '20211230');
INSERT INTO `pharmacy` VALUES (589, '正柴胡饮颗粒 (v)', 12, 650, 25, 11, '2021-11-11', '2023-10-16', 132, '20211111');
INSERT INTO `pharmacy` VALUES (590, '肝速康胶囊 (远达)', 14, 726, 37, 3, '2021-08-12', '2023-04-05', 193, '20210812');
INSERT INTO `pharmacy` VALUES (591, '保和口服液', 12, 520, 39, 5, '2021-07-05', '2023-09-15', 118, '20210705');
INSERT INTO `pharmacy` VALUES (592, '抗妇炎胶囊 (远程)', 14, 493, 24, 1, '2021-09-13', '2023-04-07', 88, '20210913');
INSERT INTO `pharmacy` VALUES (593, '乙肝解毒胶囊 (健民)', 1, 349, 36, 4, '2021-01-17', '2023-05-17', 164, '20210117');
INSERT INTO `pharmacy` VALUES (594, '热淋清胶囊 (百慈)', 7, 415, 35, 3, '2021-07-20', '2023-04-07', 156, '20210720');
INSERT INTO `pharmacy` VALUES (595, '血塞通软胶囊', 13, 85, 50, 6, '2021-04-17', '2023-04-07', 104, '20210417');
INSERT INTO `pharmacy` VALUES (596, '阿咖酚散', 3, 127, 3, 8, '2021-08-07', '2023-03-07', 121, '20210807');
INSERT INTO `pharmacy` VALUES (597, '萘敏维滴眼液 (闪亮)', 12, 253, 15, 5, '2021-06-24', '2023-10-23', 82, '20210624');
INSERT INTO `pharmacy` VALUES (598, '嘎日迪五味丸', 7, 130, 50, 10, '2021-07-10', '2023-06-23', 98, '20210710');
INSERT INTO `pharmacy` VALUES (599, '自粘性软聚硅酮有边型泡沫敷料 (美皮康)', 11, 941, 2, 12, '2021-05-04', '2023-12-06', 158, '20210504');
INSERT INTO `pharmacy` VALUES (600, '清咽滴丸 (松柏)', 3, 562, 43, 3, '2021-01-12', '2023-05-03', 127, '20210112');
INSERT INTO `pharmacy` VALUES (601, '地衣芽孢杆菌活菌胶囊', 8, 320, 8, 5, '2021-04-21', '2023-09-13', 126, '20210421');
INSERT INTO `pharmacy` VALUES (602, '克拉霉素胶囊', 8, 701, 28, 6, '2021-06-13', '2023-09-16', 141, '20210613');
INSERT INTO `pharmacy` VALUES (603, '苦参片', 1, 907, 38, 7, '2021-12-19', '2023-04-06', 174, '20211219');
INSERT INTO `pharmacy` VALUES (604, '疏痛安涂膜剂 (津奉)', 8, 755, 36, 5, '2021-02-03', '2023-12-31', 108, '20210203');
INSERT INTO `pharmacy` VALUES (605, '苄达赖氨酸滴眼液 (嘉仕力)', 5, 590, 5, 11, '2021-09-24', '2023-08-26', 146, '20210924');
INSERT INTO `pharmacy` VALUES (606, '强力枇杷露', 14, 838, 1, 12, '2021-06-23', '2023-09-01', 88, '20210623');
INSERT INTO `pharmacy` VALUES (607, '苯磺酸氨氯地平片 (奥瑞拉)', 6, 477, 49, 12, '2021-05-27', '2023-09-02', 189, '20210527');
INSERT INTO `pharmacy` VALUES (608, '阿司匹林肠溶缓释片 (介宁)', 4, 402, 33, 4, '2021-12-30', '2023-10-17', 158, '20211230');
INSERT INTO `pharmacy` VALUES (609, '他克莫司胶囊 (福美欣)', 10, 890, 24, 1, '2021-05-17', '2023-09-16', 100, '20210517');
INSERT INTO `pharmacy` VALUES (610, '多潘立酮口腔崩解片 (卫好)', 8, 245, 23, 7, '2021-01-19', '2023-09-14', 190, '20210119');
INSERT INTO `pharmacy` VALUES (611, '碳酸钙D3片(Ⅱ) (朗迪)', 9, 351, 29, 10, '2021-11-29', '2023-10-29', 161, '20211129');
INSERT INTO `pharmacy` VALUES (612, '兰索拉唑片', 11, 730, 16, 7, '2021-05-28', '2023-07-04', 87, '20210528');
INSERT INTO `pharmacy` VALUES (613, '猴菇饮(口服液)', 10, 632, 29, 11, '2021-02-18', '2023-02-07', 177, '20210218');
INSERT INTO `pharmacy` VALUES (614, '参茸延龄片 (林海)', 2, 90, 2, 11, '2021-10-11', '2023-01-26', 90, '20211011');
INSERT INTO `pharmacy` VALUES (615, '心达康胶囊 (美大康)', 13, 560, 14, 9, '2021-07-16', '2023-01-28', 137, '20210716');
INSERT INTO `pharmacy` VALUES (616, '藿香正气水', 10, 865, 23, 3, '2021-02-04', '2023-11-02', 86, '20210204');
INSERT INTO `pharmacy` VALUES (617, '养血安神糖浆', 3, 452, 14, 2, '2021-05-21', '2023-10-26', 104, '20210521');
INSERT INTO `pharmacy` VALUES (618, '胃乐新胶囊', 14, 959, 2, 7, '2021-11-03', '2023-06-14', 151, '20211103');
INSERT INTO `pharmacy` VALUES (619, '杜仲平压片 (彤升)', 12, 333, 35, 10, '2021-08-29', '2023-02-07', 186, '20210829');
INSERT INTO `pharmacy` VALUES (620, '济生肾气丸', 3, 360, 11, 12, '2021-07-04', '2023-09-10', 146, '20210704');
INSERT INTO `pharmacy` VALUES (621, '六味地黄丸(浓缩丸) (雷允上)', 9, 253, 8, 11, '2021-07-25', '2023-05-12', 178, '20210725');
INSERT INTO `pharmacy` VALUES (622, '六味地黄丸', 10, 296, 3, 9, '2021-01-02', '2023-05-02', 87, '20210102');
INSERT INTO `pharmacy` VALUES (623, '归龙筋骨宁片 (老君炉)', 4, 775, 3, 1, '2021-09-06', '2023-01-17', 181, '20210906');
INSERT INTO `pharmacy` VALUES (624, '舒筋定痛片 (永孜堂)', 3, 394, 37, 12, '2021-02-26', '2023-03-26', 162, '20210226');
INSERT INTO `pharmacy` VALUES (625, '感冒灵颗粒 (忠宁)', 4, 116, 3, 8, '2021-11-05', '2023-05-24', 139, '20211105');
INSERT INTO `pharmacy` VALUES (626, '逐瘀通脉胶囊 (三精)', 8, 182, 5, 3, '2021-04-10', '2023-08-09', 155, '20210410');
INSERT INTO `pharmacy` VALUES (627, '盐酸氨溴索口服溶液', 10, 234, 19, 12, '2021-09-04', '2023-06-15', 119, '20210904');
INSERT INTO `pharmacy` VALUES (628, '洛伐他汀片', 8, 880, 3, 2, '2021-01-04', '2023-07-01', 182, '20210104');
INSERT INTO `pharmacy` VALUES (629, '头孢羟氨苄颗粒', 1, 105, 36, 7, '2021-07-10', '2023-09-17', 135, '20210710');
INSERT INTO `pharmacy` VALUES (630, '益肾灵颗粒', 1, 508, 36, 5, '2021-05-05', '2023-10-17', 124, '20210505');
INSERT INTO `pharmacy` VALUES (631, '尿素乳膏', 6, 671, 5, 5, '2021-08-09', '2023-09-11', 140, '20210809');
INSERT INTO `pharmacy` VALUES (632, '苯磺酸氨氯地平片 (诺尔玛)', 11, 783, 43, 7, '2021-05-24', '2023-02-09', 195, '20210524');
INSERT INTO `pharmacy` VALUES (633, '盐酸二甲双胍缓释片 (都乐宁)', 4, 637, 6, 7, '2021-01-07', '2023-02-20', 132, '20210107');
INSERT INTO `pharmacy` VALUES (634, '格列齐特缓释片 (正唐宁)', 8, 498, 39, 3, '2021-05-24', '2023-09-11', 152, '20210524');
INSERT INTO `pharmacy` VALUES (635, '大活络丸', 11, 224, 36, 1, '2021-01-07', '2023-04-14', 112, '20210107');
INSERT INTO `pharmacy` VALUES (636, '净石灵胶囊', 3, 841, 10, 11, '2021-12-03', '2023-11-24', 161, '20211203');
INSERT INTO `pharmacy` VALUES (637, '利科康奇牌康奇胶囊', 2, 123, 43, 5, '2021-04-10', '2023-07-26', 124, '20210410');
INSERT INTO `pharmacy` VALUES (638, '玉屏风口服液 (聚荣)', 12, 126, 11, 7, '2021-04-28', '2023-01-03', 170, '20210428');
INSERT INTO `pharmacy` VALUES (639, '痔炎消胶囊 (子午)', 8, 285, 29, 5, '2021-12-07', '2023-10-26', 159, '20211207');
INSERT INTO `pharmacy` VALUES (640, '复方斑蝥胶囊', 4, 251, 19, 1, '2021-11-12', '2023-09-26', 97, '20211112');
INSERT INTO `pharmacy` VALUES (641, '溃疡胶囊', 11, 595, 13, 8, '2021-08-16', '2023-07-21', 195, '20210816');
INSERT INTO `pharmacy` VALUES (642, '布洛芬缓释片 (芬尼康)', 5, 28, 1, 5, '2021-09-05', '2023-12-15', 149, '20210905');
INSERT INTO `pharmacy` VALUES (643, '盐酸左西替利嗪胶囊 (畅然)', 10, 771, 38, 4, '2021-09-09', '2023-02-28', 144, '20210909');
INSERT INTO `pharmacy` VALUES (644, '元胡止痛软胶囊 (康缘)', 2, 837, 33, 12, '2021-11-02', '2023-01-01', 160, '20211102');
INSERT INTO `pharmacy` VALUES (645, '克拉霉素片', 12, 559, 17, 5, '2021-06-09', '2023-09-02', 183, '20210609');
INSERT INTO `pharmacy` VALUES (646, '盐酸二甲双胍缓释片 (倍顺)', 4, 640, 37, 8, '2021-04-02', '2023-06-13', 170, '20210402');
INSERT INTO `pharmacy` VALUES (647, '肤痒颗粒 (葵花)', 14, 998, 30, 3, '2021-06-23', '2023-02-15', 176, '20210623');
INSERT INTO `pharmacy` VALUES (648, '盐酸多奈哌齐片 (诺冲)', 14, 64, 9, 12, '2021-02-28', '2023-10-23', 158, '20210228');
INSERT INTO `pharmacy` VALUES (649, '人工牛黄甲硝唑胶囊', 8, 607, 14, 6, '2021-10-14', '2023-10-27', 138, '20211014');
INSERT INTO `pharmacy` VALUES (650, '消化酶片', 7, 443, 22, 10, '2021-08-04', '2023-01-11', 148, '20210804');
INSERT INTO `pharmacy` VALUES (651, '跌打扭伤灵酊', 5, 108, 48, 4, '2021-11-23', '2023-12-13', 99, '20211123');
INSERT INTO `pharmacy` VALUES (652, '去痛片', 9, 186, 28, 1, '2021-04-08', '2023-10-09', 121, '20210408');
INSERT INTO `pharmacy` VALUES (653, '盆炎净胶囊', 10, 288, 36, 3, '2021-06-18', '2023-12-01', 87, '20210618');
INSERT INTO `pharmacy` VALUES (654, '抗骨增生片', 11, 935, 20, 4, '2021-04-21', '2023-03-28', 121, '20210421');
INSERT INTO `pharmacy` VALUES (655, '盐酸二甲双胍缓释片 (同盛兰威)', 4, 171, 20, 12, '2021-07-26', '2023-05-13', 191, '20210726');
INSERT INTO `pharmacy` VALUES (656, '盐酸地芬尼多片', 11, 544, 26, 4, '2021-12-03', '2023-12-06', 156, '20211203');
INSERT INTO `pharmacy` VALUES (657, '复方醋酸地塞米松乳膏', 13, 687, 8, 5, '2021-06-12', '2023-06-30', 181, '20210612');
INSERT INTO `pharmacy` VALUES (658, '复方热敷散 (福贴)', 6, 337, 42, 10, '2021-03-10', '2023-01-08', 83, '20210310');
INSERT INTO `pharmacy` VALUES (659, '当归补血口服液 (和美)', 14, 537, 33, 12, '2021-12-23', '2023-01-25', 185, '20211223');
INSERT INTO `pharmacy` VALUES (660, '复方鱼腥草合剂', 7, 144, 3, 12, '2021-04-20', '2023-03-19', 96, '20210420');
INSERT INTO `pharmacy` VALUES (661, '消炎止咳片', 7, 976, 49, 7, '2021-10-03', '2023-09-15', 181, '20211003');
INSERT INTO `pharmacy` VALUES (662, '盐酸多西环素片 (特一)', 10, 180, 9, 10, '2021-08-04', '2023-08-08', 155, '20210804');
INSERT INTO `pharmacy` VALUES (663, '维生素E软胶囊 (哈药)', 3, 97, 21, 12, '2021-01-04', '2023-08-24', 183, '20210104');
INSERT INTO `pharmacy` VALUES (664, '泻痢消片', 13, 926, 44, 11, '2021-11-10', '2023-06-27', 85, '20211110');
INSERT INTO `pharmacy` VALUES (665, '鬼臼毒素酊 (尤脱欣)', 11, 717, 35, 6, '2021-02-23', '2023-10-13', 167, '20210223');
INSERT INTO `pharmacy` VALUES (666, '消旋卡多曲颗粒 (杜拉宝)', 7, 253, 36, 11, '2021-05-10', '2023-10-02', 138, '20210510');
INSERT INTO `pharmacy` VALUES (667, '清胰利胆颗粒 (银诺克)', 13, 726, 19, 2, '2021-12-15', '2023-02-12', 172, '20211215');
INSERT INTO `pharmacy` VALUES (668, '舍雷肽酶肠溶片 (曲坦)', 5, 346, 16, 11, '2021-12-04', '2023-10-06', 101, '20211204');
INSERT INTO `pharmacy` VALUES (669, '羟基脲片', 5, 288, 3, 11, '2021-03-27', '2023-09-12', 183, '20210327');
INSERT INTO `pharmacy` VALUES (670, '左归丸', 13, 146, 8, 7, '2021-10-24', '2023-12-23', 181, '20211024');
INSERT INTO `pharmacy` VALUES (671, '固本咳喘胶囊 (济仁)', 3, 209, 44, 1, '2021-03-20', '2023-09-26', 96, '20210320');
INSERT INTO `pharmacy` VALUES (672, '咳感康口服液 (奇力)', 10, 571, 21, 11, '2021-09-28', '2023-01-06', 102, '20210928');
INSERT INTO `pharmacy` VALUES (673, '伤痛宁片', 5, 159, 28, 5, '2021-04-06', '2023-08-08', 82, '20210406');
INSERT INTO `pharmacy` VALUES (674, '血塞通片 (美尔福)', 8, 222, 28, 4, '2021-10-25', '2023-08-11', 180, '20211025');
INSERT INTO `pharmacy` VALUES (675, '赖诺普利片', 7, 573, 49, 6, '2021-02-09', '2023-02-03', 171, '20210209');
INSERT INTO `pharmacy` VALUES (676, '乳癖消胶囊', 8, 114, 22, 11, '2021-07-15', '2023-09-16', 141, '20210715');
INSERT INTO `pharmacy` VALUES (677, '阿莫西林克拉维酸钾片', 14, 297, 1, 1, '2021-06-12', '2023-08-24', 93, '20210612');
INSERT INTO `pharmacy` VALUES (678, '复方克霉唑乳膏', 1, 83, 18, 3, '2021-10-06', '2023-07-10', 143, '20211006');
INSERT INTO `pharmacy` VALUES (679, '双氯芬酸钠肠溶缓释胶囊 (诺福丁)', 6, 761, 47, 12, '2021-10-12', '2023-08-12', 95, '20211012');
INSERT INTO `pharmacy` VALUES (680, '麝香壮骨膏', 13, 907, 15, 3, '2021-12-12', '2023-01-21', 82, '20211212');
INSERT INTO `pharmacy` VALUES (681, '琥乙红霉素胶囊 (利君沙)', 14, 582, 23, 10, '2021-01-31', '2023-08-01', 169, '20210131');
INSERT INTO `pharmacy` VALUES (682, '克拉霉素分散片', 14, 652, 47, 5, '2021-12-19', '2023-07-05', 171, '20211219');
INSERT INTO `pharmacy` VALUES (683, '盐酸金霉素眼膏 (白敬宇)', 11, 640, 43, 10, '2021-06-25', '2023-02-09', 141, '20210625');
INSERT INTO `pharmacy` VALUES (684, '吲哚美辛肠溶片 (消炎痛)', 11, 141, 9, 4, '2021-08-19', '2023-08-30', 176, '20210819');
INSERT INTO `pharmacy` VALUES (685, '天舒胶囊 (康缘)', 14, 192, 31, 4, '2021-05-06', '2023-01-29', 86, '20210506');
INSERT INTO `pharmacy` VALUES (686, '小儿四维葡钙颗粒', 5, 513, 14, 2, '2021-10-17', '2023-07-12', 159, '20211017');
INSERT INTO `pharmacy` VALUES (687, '伊曲康唑颗粒 (罗宣)', 5, 593, 27, 6, '2021-01-04', '2023-02-23', 160, '20210104');
INSERT INTO `pharmacy` VALUES (688, '头孢特仑新戊酯片 (巴妥)', 12, 501, 28, 5, '2021-01-11', '2023-05-14', 100, '20210111');
INSERT INTO `pharmacy` VALUES (689, '兰索拉唑胶囊', 5, 158, 39, 8, '2021-08-10', '2023-02-20', 121, '20210810');
INSERT INTO `pharmacy` VALUES (690, '复方鱼腥草片 (南京同仁堂)', 5, 568, 32, 3, '2021-12-01', '2023-01-22', 158, '20211201');
INSERT INTO `pharmacy` VALUES (691, '沈阳红药', 8, 345, 27, 7, '2021-10-08', '2023-04-13', 161, '20211008');
INSERT INTO `pharmacy` VALUES (692, '六味地黄丸 (乐家老铺)', 5, 858, 41, 12, '2021-06-08', '2023-02-11', 115, '20210608');
INSERT INTO `pharmacy` VALUES (693, '橘红片 (同仁堂)', 3, 293, 34, 5, '2021-11-27', '2023-09-15', 188, '20211127');
INSERT INTO `pharmacy` VALUES (694, '前列舒丸', 1, 636, 30, 9, '2021-12-16', '2023-11-12', 176, '20211216');
INSERT INTO `pharmacy` VALUES (695, '清凉油(白色) (天坛)', 9, 584, 24, 8, '2021-01-13', '2023-04-22', 145, '20210113');
INSERT INTO `pharmacy` VALUES (696, '阿司匹林泡腾片 (巴米尔)', 8, 124, 22, 5, '2021-06-21', '2023-12-20', 172, '20210621');
INSERT INTO `pharmacy` VALUES (697, '通窍鼻炎片', 4, 432, 29, 4, '2021-03-21', '2023-08-21', 179, '20210321');
INSERT INTO `pharmacy` VALUES (698, '阿司匹林维生素C分散片', 10, 436, 14, 10, '2021-04-06', '2023-09-23', 145, '20210406');
INSERT INTO `pharmacy` VALUES (699, '八珍益母胶囊 (桑海)', 3, 178, 2, 8, '2021-05-08', '2023-06-12', 112, '20210508');
INSERT INTO `pharmacy` VALUES (700, '宁心宝胶囊', 3, 442, 20, 1, '2021-09-18', '2023-07-09', 80, '20210918');
INSERT INTO `pharmacy` VALUES (701, '双黄连口服液', 11, 904, 49, 11, '2021-11-24', '2023-09-04', 147, '20211124');
INSERT INTO `pharmacy` VALUES (702, '半夏止咳糖浆', 12, 937, 24, 9, '2021-08-27', '2023-11-11', 163, '20210827');
INSERT INTO `pharmacy` VALUES (703, '关节止痛膏 (雷公)', 13, 458, 3, 9, '2021-06-03', '2023-11-25', 113, '20210603');
INSERT INTO `pharmacy` VALUES (704, '甲硝唑片 (灭滴灵)', 7, 458, 8, 12, '2021-06-08', '2023-11-10', 151, '20210608');
INSERT INTO `pharmacy` VALUES (705, '野马追片 (步刻)', 10, 428, 37, 4, '2021-12-19', '2023-07-01', 97, '20211219');
INSERT INTO `pharmacy` VALUES (706, '盐酸小檗碱片 (东北)', 6, 653, 18, 2, '2021-01-19', '2023-02-22', 188, '20210119');
INSERT INTO `pharmacy` VALUES (707, '桂附地黄丸 (同仁堂)', 5, 310, 38, 4, '2021-07-12', '2023-12-26', 170, '20210712');
INSERT INTO `pharmacy` VALUES (708, '银黄颗粒', 3, 399, 49, 6, '2021-07-18', '2023-05-09', 98, '20210718');
INSERT INTO `pharmacy` VALUES (709, '阿胶益寿口服液', 13, 668, 2, 9, '2021-10-11', '2023-02-17', 126, '20211011');
INSERT INTO `pharmacy` VALUES (710, '七味通痹口服液 (康缘)', 11, 468, 12, 10, '2021-02-28', '2023-09-17', 165, '20210228');
INSERT INTO `pharmacy` VALUES (711, '考来烯胺散 (沁心青)', 9, 160, 3, 6, '2021-11-20', '2023-04-15', 180, '20211120');
INSERT INTO `pharmacy` VALUES (712, '西咪替丁片', 8, 976, 5, 12, '2021-10-30', '2023-07-04', 170, '20211030');
INSERT INTO `pharmacy` VALUES (713, '清热化毒丸', 10, 252, 26, 8, '2021-05-02', '2023-10-19', 185, '20210502');
INSERT INTO `pharmacy` VALUES (714, '阿莫西林双氯西林钠胶囊 (澳广)', 5, 45, 49, 10, '2021-03-02', '2023-03-12', 93, '20210302');
INSERT INTO `pharmacy` VALUES (715, '冬凌草片', 3, 762, 2, 8, '2021-04-13', '2023-11-17', 199, '20210413');
INSERT INTO `pharmacy` VALUES (716, '滋肾丸 (本草纲目)', 1, 989, 47, 7, '2021-05-11', '2023-08-11', 189, '20210511');
INSERT INTO `pharmacy` VALUES (717, '红桃K生血剂', 3, 592, 39, 3, '2021-08-13', '2023-04-03', 120, '20210813');
INSERT INTO `pharmacy` VALUES (718, '苍耳子鼻炎胶囊', 12, 801, 32, 9, '2021-08-22', '2023-08-02', 142, '20210822');
INSERT INTO `pharmacy` VALUES (719, '补中益气丸', 1, 52, 49, 8, '2021-05-23', '2023-07-16', 137, '20210523');
INSERT INTO `pharmacy` VALUES (720, '和胃整肠丸', 9, 271, 41, 4, '2021-10-12', '2023-10-05', 82, '20211012');
INSERT INTO `pharmacy` VALUES (721, '盐酸雷尼替丁胶囊', 1, 436, 41, 1, '2021-12-12', '2023-09-17', 132, '20211212');
INSERT INTO `pharmacy` VALUES (722, '合生元牌益生菌冲剂(儿童型)', 9, 193, 40, 7, '2021-10-10', '2023-04-02', 174, '20211010');
INSERT INTO `pharmacy` VALUES (723, '金砂消食口服液', 8, 75, 36, 11, '2021-03-01', '2023-06-25', 132, '20210301');
INSERT INTO `pharmacy` VALUES (724, '前列癃闭通片 (兆誉隆)', 9, 363, 36, 1, '2021-02-23', '2023-06-07', 115, '20210223');
INSERT INTO `pharmacy` VALUES (725, '感冒解毒颗粒 (黑中研)', 11, 370, 3, 3, '2021-06-02', '2023-12-24', 152, '20210602');
INSERT INTO `pharmacy` VALUES (726, '藿香正气丸 (宝药堂)', 1, 780, 8, 10, '2021-01-15', '2023-09-13', 98, '20210115');
INSERT INTO `pharmacy` VALUES (727, '恩替卡韦分散片 (维力青)', 8, 355, 46, 1, '2021-12-09', '2023-03-19', 94, '20211209');
INSERT INTO `pharmacy` VALUES (728, '活血止痛胶囊 (莫愁)', 7, 388, 37, 11, '2021-11-23', '2023-07-24', 154, '20211123');
INSERT INTO `pharmacy` VALUES (729, '藤黄健骨丸 (汝立康)', 11, 511, 19, 10, '2021-12-03', '2023-03-04', 117, '20211203');
INSERT INTO `pharmacy` VALUES (730, '百合康牌芦荟软胶囊 (葆宁)', 8, 822, 35, 9, '2021-09-01', '2023-10-26', 104, '20210901');
INSERT INTO `pharmacy` VALUES (731, '复方银翘氨酚维C片 (九州通)', 1, 681, 14, 5, '2021-04-06', '2023-09-28', 119, '20210406');
INSERT INTO `pharmacy` VALUES (732, '复合阿胶蛋白质粉 (正康惠仁)', 7, 58, 7, 3, '2021-07-01', '2023-07-18', 132, '20210701');
INSERT INTO `pharmacy` VALUES (733, '心脑清软胶囊 (力维旨)', 14, 585, 30, 11, '2021-01-18', '2023-06-11', 100, '20210118');
INSERT INTO `pharmacy` VALUES (734, '丹珍头痛胶囊', 8, 315, 45, 9, '2021-02-06', '2023-11-23', 179, '20210206');
INSERT INTO `pharmacy` VALUES (735, '金银花枇杷糖 (美莱健)', 7, 101, 18, 5, '2021-06-25', '2023-02-28', 158, '20210625');
INSERT INTO `pharmacy` VALUES (736, '血塞通分散片 (速协安)', 13, 573, 23, 8, '2021-12-18', '2023-11-21', 181, '20211218');
INSERT INTO `pharmacy` VALUES (737, '愈风宁心胶囊 (宗药师)', 5, 656, 31, 6, '2021-10-09', '2023-04-28', 188, '20211009');
INSERT INTO `pharmacy` VALUES (738, '复方吲哚美辛达克罗宁贴膏 (苏青)', 14, 396, 8, 7, '2021-11-07', '2023-08-25', 111, '20211107');
INSERT INTO `pharmacy` VALUES (739, '壮腰健肾丸 (青春康源)', 11, 706, 23, 7, '2021-03-02', '2023-07-29', 122, '20210302');
INSERT INTO `pharmacy` VALUES (740, '跌打丸 (樱花牌)', 10, 548, 11, 12, '2021-01-19', '2023-11-13', 135, '20210119');
INSERT INTO `pharmacy` VALUES (741, '理气舒心片 (石药)', 1, 948, 50, 3, '2021-11-10', '2023-01-26', 124, '20211110');
INSERT INTO `pharmacy` VALUES (742, '消炎退热颗粒', 6, 478, 8, 8, '2021-05-05', '2023-12-02', 136, '20210505');
INSERT INTO `pharmacy` VALUES (743, '无糖型蛋白质粉 (施圣)', 1, 182, 20, 7, '2021-12-21', '2023-03-30', 150, '20211221');
INSERT INTO `pharmacy` VALUES (744, '孕产妇蛋白质粉 (施圣)', 2, 287, 48, 5, '2021-02-21', '2023-04-12', 176, '20210221');
INSERT INTO `pharmacy` VALUES (745, '热毒平颗粒 (银涛)', 3, 272, 15, 11, '2021-03-18', '2023-11-13', 115, '20210318');
INSERT INTO `pharmacy` VALUES (746, '痛可贴 (满汉御宝)', 1, 197, 28, 4, '2021-07-24', '2023-04-06', 137, '20210724');
INSERT INTO `pharmacy` VALUES (747, '多种维生素加矿物质片 (牛千岁)', 12, 951, 12, 6, '2021-01-04', '2023-03-06', 191, '20210104');
INSERT INTO `pharmacy` VALUES (748, '补肾养血丸 (仁和)', 1, 707, 24, 12, '2021-03-22', '2023-05-30', 114, '20210322');
INSERT INTO `pharmacy` VALUES (749, '咳特灵胶囊 (东日)', 14, 795, 12, 10, '2021-03-24', '2023-11-14', 154, '20210324');
INSERT INTO `pharmacy` VALUES (750, '一清颗粒 (徳济)', 11, 905, 32, 12, '2021-12-09', '2023-02-15', 91, '20211209');
INSERT INTO `pharmacy` VALUES (751, '川奇牌葡萄糖酸锌口服液', 7, 165, 35, 6, '2021-02-01', '2023-05-06', 179, '20210201');
INSERT INTO `pharmacy` VALUES (752, '阿莫西林胶囊', 6, 103, 22, 1, '2021-10-05', '2023-11-08', 166, '20211005');
INSERT INTO `pharmacy` VALUES (753, '乳安贴 (赵俊峰)', 1, 377, 1, 3, '2021-07-17', '2023-09-05', 152, '20210717');
INSERT INTO `pharmacy` VALUES (754, '痛可贴 (赵俊峰/颈肩腰腿痛贴)', 8, 642, 1, 12, '2021-07-21', '2023-09-27', 183, '20210721');
INSERT INTO `pharmacy` VALUES (755, '胎菊王茶 (远甜)', 6, 436, 11, 2, '2021-07-22', '2023-10-03', 173, '20210722');
INSERT INTO `pharmacy` VALUES (756, '动力源牌力源酒', 3, 42, 17, 6, '2021-11-18', '2023-05-19', 87, '20211118');
INSERT INTO `pharmacy` VALUES (757, '温胃舒片', 7, 235, 30, 3, '2021-07-21', '2023-12-03', 92, '20210721');
INSERT INTO `pharmacy` VALUES (758, '小儿化痰止咳颗粒', 7, 836, 14, 1, '2021-05-27', '2023-05-26', 156, '20210527');
INSERT INTO `pharmacy` VALUES (759, '磁疗巴布贴 (颈椎病贴)', 1, 359, 16, 5, '2021-11-22', '2023-09-16', 111, '20211122');
INSERT INTO `pharmacy` VALUES (760, '坤复康片', 3, 758, 48, 6, '2021-06-15', '2023-11-30', 126, '20210615');
INSERT INTO `pharmacy` VALUES (761, '风热感冒颗粒 (叶开泰)', 4, 278, 31, 3, '2021-06-17', '2023-04-26', 180, '20210617');
INSERT INTO `pharmacy` VALUES (762, '医用防护口罩 (棉花朵朵)', 11, 986, 16, 2, '2021-11-06', '2023-10-27', 135, '20211106');
INSERT INTO `pharmacy` VALUES (763, '桂附地黄丸 (徐一刀)', 14, 250, 33, 7, '2021-12-05', '2023-10-03', 147, '20211205');
INSERT INTO `pharmacy` VALUES (764, '穿心莲片 (天圣)', 10, 882, 20, 12, '2021-09-15', '2023-05-18', 168, '20210915');
INSERT INTO `pharmacy` VALUES (765, '知柏地黄丸 (辰济)', 10, 37, 10, 7, '2021-12-23', '2023-04-05', 105, '20211223');
INSERT INTO `pharmacy` VALUES (766, '健脾丸 (辰济)', 2, 940, 37, 9, '2021-12-08', '2023-02-10', 87, '20211208');
INSERT INTO `pharmacy` VALUES (767, '上清片 (太极)', 6, 554, 30, 4, '2021-06-19', '2023-06-25', 90, '20210619');
INSERT INTO `pharmacy` VALUES (768, '维生素B6片 (经略堂)', 5, 148, 32, 12, '2021-02-23', '2023-11-14', 165, '20210223');
INSERT INTO `pharmacy` VALUES (769, '生命力牌钙咀嚼片', 3, 246, 3, 5, '2021-09-25', '2023-06-22', 85, '20210925');
INSERT INTO `pharmacy` VALUES (770, '一次性口罩 (银京)', 11, 212, 28, 3, '2021-03-30', '2023-06-09', 104, '20210330');
INSERT INTO `pharmacy` VALUES (771, 'β-胡萝卜素软胶囊 (葆宁)', 1, 195, 2, 3, '2021-07-22', '2023-09-14', 80, '20210722');
INSERT INTO `pharmacy` VALUES (772, '复方丹参片 (咏福祥)', 10, 825, 10, 6, '2021-03-29', '2023-01-15', 189, '20210329');
INSERT INTO `pharmacy` VALUES (773, '血栓心脉宁胶囊 (德济)', 7, 440, 27, 3, '2021-03-01', '2023-07-21', 177, '20210301');
INSERT INTO `pharmacy` VALUES (774, '立健牌三清冲剂', 3, 253, 15, 1, '2021-11-02', '2023-06-04', 123, '20211102');
INSERT INTO `pharmacy` VALUES (775, '海瑞康牌铁锌钙硒维生素口服液', 2, 701, 8, 9, '2021-04-19', '2023-07-26', 140, '20210419');
INSERT INTO `pharmacy` VALUES (776, '喜悦童年牌钙加锌口服液(儿童型)', 5, 667, 22, 2, '2021-07-05', '2023-06-10', 132, '20210705');
INSERT INTO `pharmacy` VALUES (777, '复方丹参片 (长恒)', 10, 947, 41, 2, '2021-07-03', '2023-11-09', 151, '20210703');
INSERT INTO `pharmacy` VALUES (778, '龙胆泻肝丸 (乐家老铺)', 3, 243, 26, 5, '2021-04-13', '2023-08-06', 148, '20210413');
INSERT INTO `pharmacy` VALUES (779, '心脑康胶囊', 7, 166, 29, 6, '2021-01-23', '2023-05-27', 158, '20210123');
INSERT INTO `pharmacy` VALUES (780, '复方丹参片 (远佳)', 11, 909, 4, 8, '2021-01-22', '2023-03-21', 115, '20210122');
INSERT INTO `pharmacy` VALUES (781, '脑络通胶囊 (辅仁)', 11, 108, 6, 3, '2021-11-12', '2023-12-12', 169, '20211112');
INSERT INTO `pharmacy` VALUES (782, '清火栀麦片', 8, 799, 25, 2, '2021-12-31', '2023-11-02', 153, '20211231');
INSERT INTO `pharmacy` VALUES (783, '四季感冒片', 5, 665, 30, 3, '2021-07-01', '2023-09-30', 179, '20210701');
INSERT INTO `pharmacy` VALUES (784, '头孢克洛胶囊 (九州通)', 11, 58, 34, 8, '2021-08-12', '2023-01-27', 130, '20210812');
INSERT INTO `pharmacy` VALUES (785, '明目蒺藜丸 (保定中药)', 9, 72, 7, 8, '2021-02-23', '2023-07-11', 88, '20210223');
INSERT INTO `pharmacy` VALUES (786, '郢天牌维生素E硒片', 2, 507, 3, 12, '2021-02-24', '2023-09-19', 149, '20210224');
INSERT INTO `pharmacy` VALUES (787, '桑菊感冒颗粒 (回春堂)', 8, 291, 28, 12, '2021-01-03', '2023-11-02', 153, '20210103');
INSERT INTO `pharmacy` VALUES (788, 'B族维生素片 (牛千岁)', 6, 85, 1, 2, '2021-10-16', '2023-03-16', 138, '20211016');
INSERT INTO `pharmacy` VALUES (789, '感冒清热颗粒 (康恩贝)', 2, 633, 34, 2, '2021-01-31', '2023-07-04', 93, '20210131');
INSERT INTO `pharmacy` VALUES (790, '参茸三肾胶囊 (俊宏)', 5, 640, 6, 4, '2021-07-11', '2023-09-19', 185, '20210711');
INSERT INTO `pharmacy` VALUES (791, '对乙酰氨基酚栓 (东信)', 6, 58, 13, 6, '2021-07-16', '2023-07-08', 146, '20210716');
INSERT INTO `pharmacy` VALUES (792, '黄精赞育胶囊', 13, 516, 41, 6, '2021-01-07', '2023-07-11', 107, '20210107');
INSERT INTO `pharmacy` VALUES (793, '酪蛋白铁复合粉 (佰氏护彤)', 12, 627, 42, 2, '2021-08-07', '2023-02-19', 123, '20210807');
INSERT INTO `pharmacy` VALUES (794, '碧迪牌通便茶', 9, 553, 48, 4, '2021-11-17', '2023-05-02', 154, '20211117');
INSERT INTO `pharmacy` VALUES (795, '消渴降糖片 (刻康)', 3, 725, 10, 1, '2021-03-06', '2023-10-29', 137, '20210306');
INSERT INTO `pharmacy` VALUES (796, '轩生堂牌美通宁片 (唐仁康/金眠安)', 12, 206, 13, 7, '2021-04-06', '2023-03-08', 104, '20210406');
INSERT INTO `pharmacy` VALUES (797, '维生素AD滴剂(胶囊型) (舒尔馨)', 8, 258, 21, 11, '2021-04-07', '2023-09-02', 174, '20210407');
INSERT INTO `pharmacy` VALUES (798, '迪美兰牌鱼油软胶囊 (渔夫堡)', 7, 38, 30, 5, '2021-02-09', '2023-03-30', 96, '20210209');
INSERT INTO `pharmacy` VALUES (799, '压片糖果 (康一博特/孕妇羊乳钙)', 9, 726, 40, 4, '2021-05-15', '2023-10-29', 154, '20210515');
INSERT INTO `pharmacy` VALUES (800, '康富丽牌康富丽螺旋藻片 (美莱健)', 11, 122, 13, 6, '2021-10-08', '2023-01-21', 156, '20211008');
INSERT INTO `pharmacy` VALUES (801, '医用冷敷贴 (千藥坊/藏方黑膏药/腰椎间盘突出贴)', 12, 106, 11, 8, '2021-12-08', '2023-05-06', 87, '20211208');
INSERT INTO `pharmacy` VALUES (802, '御和坊牌海狗丸 (千泉)', 3, 20, 19, 8, '2021-07-08', '2023-10-12', 162, '20210708');
INSERT INTO `pharmacy` VALUES (803, '天然胶乳橡胶避孕套 (雄邦)', 14, 208, 43, 3, '2021-01-10', '2023-09-05', 128, '20210110');
INSERT INTO `pharmacy` VALUES (804, '维生素E软胶囊 (美莱健)', 5, 823, 7, 10, '2021-06-17', '2023-08-25', 156, '20210617');
INSERT INTO `pharmacy` VALUES (805, '骨刺消痛胶囊 (克迈龙)', 5, 337, 28, 9, '2021-09-11', '2023-06-21', 99, '20210911');
INSERT INTO `pharmacy` VALUES (806, '医用冷敷贴 (金泰康帝/苗师傅/骨质增生型)', 9, 495, 10, 8, '2021-01-27', '2023-12-06', 135, '20210127');
INSERT INTO `pharmacy` VALUES (807, '医用退热贴 (白云山潘高寿/婴宝型)', 13, 906, 43, 6, '2021-11-14', '2023-10-27', 170, '20211114');
INSERT INTO `pharmacy` VALUES (808, '盐酸伐昔洛韦片 (润都)', 11, 357, 6, 6, '2021-01-03', '2023-02-12', 102, '20210103');
INSERT INTO `pharmacy` VALUES (809, '维生素D3软胶囊 (惠优喜)', 14, 322, 4, 1, '2021-10-17', '2023-05-09', 137, '20211017');
INSERT INTO `pharmacy` VALUES (810, '活络消痛片 (赑康)', 13, 844, 14, 9, '2021-05-29', '2023-06-20', 176, '20210529');
INSERT INTO `pharmacy` VALUES (811, '骨刺片 (品修堂)', 14, 313, 20, 9, '2021-10-12', '2023-04-30', 161, '20211012');
INSERT INTO `pharmacy` VALUES (812, '海王牌金牡蛎胶囊', 4, 130, 15, 8, '2021-09-24', '2023-03-03', 147, '20210924');
INSERT INTO `pharmacy` VALUES (813, '哈贝高牌左旋肉碱几丁聚糖胶囊 (民生健康)', 1, 81, 8, 9, '2021-04-17', '2023-05-29', 191, '20210417');
INSERT INTO `pharmacy` VALUES (814, '抗骨增生片 (福临门)', 10, 832, 21, 8, '2021-05-23', '2023-08-24', 133, '20210523');
INSERT INTO `pharmacy` VALUES (815, '钙镁锌咀嚼片 (康比特)', 6, 172, 45, 7, '2021-07-11', '2023-12-02', 100, '20210711');
INSERT INTO `pharmacy` VALUES (816, '骨痛贴 (川药太极/黑蚂蚁透骨贴)', 12, 939, 5, 6, '2021-04-06', '2023-11-02', 186, '20210406');
INSERT INTO `pharmacy` VALUES (817, '天狮牌靓颜胶囊', 12, 778, 18, 10, '2021-10-06', '2023-12-15', 182, '20211006');
INSERT INTO `pharmacy` VALUES (818, '医用冷敷贴 (鸿茅/腰椎型)', 14, 192, 2, 8, '2021-03-08', '2023-03-24', 168, '20210308');
INSERT INTO `pharmacy` VALUES (819, '维生素D钙咀嚼片(孕妇乳母型) (百合康)', 12, 358, 30, 4, '2021-02-25', '2023-01-20', 182, '20210225');
INSERT INTO `pharmacy` VALUES (820, '舒筋活血片 (长恒)', 12, 187, 33, 4, '2021-06-19', '2023-04-18', 182, '20210619');
INSERT INTO `pharmacy` VALUES (821, '冷敷理疗贴 (华北制药/跌打损伤)', 13, 154, 44, 11, '2021-07-27', '2023-11-27', 192, '20210727');
INSERT INTO `pharmacy` VALUES (822, '天然胶乳橡胶避孕套 (7DAYS)', 12, 617, 49, 7, '2021-10-05', '2023-06-13', 189, '20211005');
INSERT INTO `pharmacy` VALUES (823, '天然胶乳橡胶避孕套 (邦德007)', 3, 209, 15, 9, '2021-10-15', '2023-04-20', 93, '20211015');
INSERT INTO `pharmacy` VALUES (824, '天然维生素E软胶囊 (恩百)', 5, 767, 39, 2, '2021-04-17', '2023-08-02', 139, '20210417');
INSERT INTO `pharmacy` VALUES (825, '花蛇解痒片 (海外/鉴康)', 6, 148, 28, 6, '2021-06-09', '2023-10-03', 129, '20210609');
INSERT INTO `pharmacy` VALUES (826, '天然胶乳橡胶避孕套 (醉清风)', 2, 50, 34, 1, '2021-08-16', '2023-11-23', 153, '20210816');
INSERT INTO `pharmacy` VALUES (827, '鑫福来牌锌硒咀嚼片', 12, 958, 20, 9, '2021-04-27', '2023-08-13', 102, '20210427');
INSERT INTO `pharmacy` VALUES (828, '天然乳胶橡胶避孕套 (千江)', 10, 655, 5, 10, '2021-04-13', '2023-06-22', 159, '20210413');
INSERT INTO `pharmacy` VALUES (829, '鱼油DHA藻油软胶囊 (麦金利)', 1, 597, 12, 12, '2021-03-01', '2023-10-02', 118, '20210301');
INSERT INTO `pharmacy` VALUES (830, '咽炎片 (赑康)', 4, 160, 11, 3, '2021-09-11', '2023-03-18', 196, '20210911');
INSERT INTO `pharmacy` VALUES (831, '好体面牌芦荟祛斑胶囊', 2, 489, 1, 2, '2021-05-06', '2023-09-03', 113, '20210506');
INSERT INTO `pharmacy` VALUES (832, '天然胶乳橡胶避孕套 (雄邦)', 12, 251, 10, 3, '2021-05-01', '2023-12-03', 121, '20210501');
INSERT INTO `pharmacy` VALUES (833, '辅酶Q10软胶囊 (展望生命)', 3, 889, 33, 1, '2021-06-17', '2023-12-14', 142, '20210617');
INSERT INTO `pharmacy` VALUES (834, '天然胶乳橡胶避孕套 (雄邦/爱的经典)', 11, 661, 26, 8, '2021-10-19', '2023-08-17', 181, '20211019');
INSERT INTO `pharmacy` VALUES (835, '彼阳新盖牌中老年钙片 (益寿堂)', 7, 757, 36, 1, '2021-06-11', '2023-03-20', 128, '20210611');
INSERT INTO `pharmacy` VALUES (836, '破壁灵芝孢子粉胶囊 (艾力特)', 5, 316, 44, 9, '2021-06-14', '2023-04-11', 92, '20210614');
INSERT INTO `pharmacy` VALUES (837, '气血双补丸 (如意)', 13, 161, 26, 12, '2021-03-18', '2023-07-16', 90, '20210318');
INSERT INTO `pharmacy` VALUES (838, '金咳息颗粒 (泰尔舒)', 9, 234, 1, 5, '2021-06-12', '2023-03-20', 110, '20210612');
INSERT INTO `pharmacy` VALUES (839, '维尔健牌B族维生素软胶囊', 2, 33, 23, 10, '2021-07-03', '2023-05-07', 88, '20210703');
INSERT INTO `pharmacy` VALUES (840, '宇露牌阿胶乌鸡口服液', 12, 895, 13, 5, '2021-06-18', '2023-01-25', 195, '20210618');
INSERT INTO `pharmacy` VALUES (841, '维尔健牌丽尔钙咀嚼片 (汤普生/孕善)', 9, 887, 7, 2, '2021-07-05', '2023-12-06', 154, '20210705');
INSERT INTO `pharmacy` VALUES (842, '舒更胶囊', 11, 873, 21, 3, '2021-03-27', '2023-08-28', 169, '20210327');
INSERT INTO `pharmacy` VALUES (843, '华敷牌绛芝胶囊', 7, 455, 44, 5, '2021-09-01', '2023-07-17', 173, '20210901');
INSERT INTO `pharmacy` VALUES (844, '华敷牌灵芝孢子粉软胶囊', 10, 916, 14, 8, '2021-03-10', '2023-01-25', 188, '20210310');
INSERT INTO `pharmacy` VALUES (845, '总统牌易钙软胶囊', 4, 988, 45, 10, '2021-02-24', '2023-12-21', 126, '20210224');
INSERT INTO `pharmacy` VALUES (846, '食元牌缓解视疲劳片 (食元畅视)', 6, 581, 20, 2, '2021-07-16', '2023-04-17', 105, '20210716');
INSERT INTO `pharmacy` VALUES (847, '同仁堂牌芊芊口服液', 11, 180, 9, 9, '2021-06-16', '2023-04-12', 170, '20210616');
INSERT INTO `pharmacy` VALUES (848, '同仁堂牌氨基酸香杞口服液', 7, 649, 44, 11, '2021-07-29', '2023-02-12', 118, '20210729');
INSERT INTO `pharmacy` VALUES (849, '同仁堂牌警醒片', 6, 612, 6, 11, '2021-04-24', '2023-08-17', 179, '20210424');
INSERT INTO `pharmacy` VALUES (850, '红景天软胶囊 (长兴)', 5, 563, 17, 8, '2021-08-19', '2023-09-18', 175, '20210819');
INSERT INTO `pharmacy` VALUES (851, '地平线牌美拉托宁含片', 9, 481, 25, 5, '2021-03-02', '2023-08-29', 143, '20210302');
INSERT INTO `pharmacy` VALUES (852, '宝健牌灵动胺糖钙胶囊', 10, 563, 47, 11, '2021-10-13', '2023-01-11', 134, '20211013');
INSERT INTO `pharmacy` VALUES (853, '培元通脑胶囊 (羚锐)', 9, 181, 32, 11, '2021-05-19', '2023-12-24', 98, '20210519');
INSERT INTO `pharmacy` VALUES (854, '屯河牌番茄红素沙棘籽油红花籽油维生素E软胶囊', 12, 713, 34, 7, '2021-06-07', '2023-03-02', 198, '20210607');
INSERT INTO `pharmacy` VALUES (855, '独一味分散片', 9, 881, 25, 5, '2021-06-12', '2023-04-06', 170, '20210612');
INSERT INTO `pharmacy` VALUES (856, '褪黑素维生素B6片 (活力达)', 5, 130, 45, 9, '2021-12-13', '2023-08-07', 173, '20211213');
INSERT INTO `pharmacy` VALUES (857, '川贝清肺糖浆 (端药)', 10, 193, 22, 3, '2021-06-05', '2023-06-14', 100, '20210605');
INSERT INTO `pharmacy` VALUES (858, '参术儿康糖浆 (宝康/红石)', 5, 747, 19, 10, '2021-02-23', '2023-05-01', 90, '20210223');
INSERT INTO `pharmacy` VALUES (859, '降糖宁胶囊 (鸿羽)', 11, 791, 9, 3, '2021-05-25', '2023-07-17', 164, '20210525');
INSERT INTO `pharmacy` VALUES (860, '脑心通胶囊 (步长)', 8, 607, 14, 12, '2021-08-18', '2023-12-31', 154, '20210818');
INSERT INTO `pharmacy` VALUES (861, '那格列奈片', 12, 128, 28, 9, '2021-05-30', '2023-11-03', 156, '20210530');
INSERT INTO `pharmacy` VALUES (862, '远红外磁疗巴布贴 (苗老八)', 10, 55, 24, 10, '2021-12-23', '2023-08-20', 118, '20211223');
INSERT INTO `pharmacy` VALUES (863, '风湿马钱片 (润华)', 11, 637, 46, 2, '2021-11-09', '2023-12-30', 107, '20211109');
INSERT INTO `pharmacy` VALUES (864, '前列倍喜胶囊', 7, 45, 44, 2, '2021-05-27', '2023-05-01', 124, '20210527');
INSERT INTO `pharmacy` VALUES (865, '乳腺增生贴 (佰诺康)', 4, 267, 31, 3, '2021-05-26', '2023-02-24', 110, '20210526');
INSERT INTO `pharmacy` VALUES (866, '注射用重组人生长激素 (海之元)', 3, 626, 48, 12, '2021-08-10', '2023-02-25', 157, '20210810');
INSERT INTO `pharmacy` VALUES (867, '妇炎舒片 (三源)', 6, 895, 44, 10, '2021-07-28', '2023-10-16', 103, '20210728');
INSERT INTO `pharmacy` VALUES (868, '盐酸氟桂利嗪胶囊 (迪沙)', 14, 447, 8, 4, '2021-09-08', '2023-05-25', 171, '20210908');
INSERT INTO `pharmacy` VALUES (869, '威士雅R破壁灵芝孢子粉胶囊', 5, 418, 31, 7, '2021-04-17', '2023-03-01', 184, '20210417');
INSERT INTO `pharmacy` VALUES (870, '读书郎R益智仁枸杞山楂牛磺酸口服液 (威士雅)', 4, 508, 35, 2, '2021-06-15', '2023-06-16', 157, '20210615');
INSERT INTO `pharmacy` VALUES (871, '盐酸左氧氟沙星片', 8, 912, 48, 5, '2021-04-11', '2023-05-11', 83, '20210411');
INSERT INTO `pharmacy` VALUES (872, '仙牌灵芝胶囊', 3, 547, 22, 8, '2021-07-26', '2023-08-21', 127, '20210726');
INSERT INTO `pharmacy` VALUES (873, '金日牌心源素胶囊', 11, 791, 10, 12, '2021-08-01', '2023-11-21', 185, '20210801');
INSERT INTO `pharmacy` VALUES (874, '无限极牌常欣卫口服液', 12, 294, 17, 10, '2021-01-12', '2023-01-03', 125, '20210112');
INSERT INTO `pharmacy` VALUES (875, '三九牌长线条口服液 (九生堂)', 13, 362, 20, 10, '2021-04-12', '2023-06-18', 95, '20210412');
INSERT INTO `pharmacy` VALUES (876, '蜂胶软胶囊 (沂山康宝)', 12, 166, 44, 4, '2021-08-08', '2023-05-24', 184, '20210808');
INSERT INTO `pharmacy` VALUES (877, '冠心苏合丸 (普林松)', 7, 589, 34, 6, '2021-10-19', '2023-03-11', 182, '20211019');
INSERT INTO `pharmacy` VALUES (878, '甘氨酸碳酸钙胶囊 (动力先锋)', 7, 632, 2, 2, '2021-01-26', '2023-04-04', 149, '20210126');
INSERT INTO `pharmacy` VALUES (879, '硒麦芽五味子片 (体恒健)', 5, 792, 38, 8, '2021-07-26', '2023-11-06', 169, '20210726');
INSERT INTO `pharmacy` VALUES (880, '威士雅R维D钙片', 7, 607, 18, 4, '2021-10-25', '2023-04-26', 97, '20211025');
INSERT INTO `pharmacy` VALUES (881, '威士雅R褪黑素胶囊', 14, 96, 8, 7, '2021-05-07', '2023-09-30', 97, '20210507');
INSERT INTO `pharmacy` VALUES (882, '威士雅牌氨基酸口服液', 10, 759, 13, 12, '2021-06-22', '2023-10-14', 127, '20210622');
INSERT INTO `pharmacy` VALUES (883, '苯磺酸氨氯地平片 (兰迪)', 7, 363, 12, 11, '2021-07-11', '2023-07-07', 182, '20210711');
INSERT INTO `pharmacy` VALUES (884, '澳天力牌蜂胶软胶囊', 8, 746, 9, 11, '2021-02-03', '2023-06-07', 174, '20210203');
INSERT INTO `pharmacy` VALUES (885, '威士雅牌惠血营养液', 1, 968, 36, 3, '2021-06-10', '2023-09-23', 159, '20210610');
INSERT INTO `pharmacy` VALUES (886, '绿仙牌螺旋藻片 (能量堡垒)', 9, 414, 12, 3, '2021-02-15', '2023-07-02', 147, '20210215');
INSERT INTO `pharmacy` VALUES (887, '维血牌氨基酸胶囊 (长兴)', 8, 840, 26, 11, '2021-08-30', '2023-06-30', 84, '20210830');
INSERT INTO `pharmacy` VALUES (888, '维生素E软胶囊 (特格尔)', 5, 804, 5, 8, '2021-03-15', '2023-08-23', 81, '20210315');
INSERT INTO `pharmacy` VALUES (889, '天麻胶囊', 6, 202, 45, 11, '2021-11-28', '2023-03-25', 181, '20211128');
INSERT INTO `pharmacy` VALUES (890, '头孢羟氨苄片 (欧意)', 3, 856, 17, 6, '2021-05-19', '2023-01-29', 100, '20210519');
INSERT INTO `pharmacy` VALUES (891, '舒神灵胶囊 (仁和)', 6, 738, 50, 12, '2021-01-13', '2023-01-05', 100, '20210113');
INSERT INTO `pharmacy` VALUES (892, '耳聋左慈丸 (紫鑫)', 2, 425, 24, 12, '2021-03-18', '2023-04-03', 174, '20210318');
INSERT INTO `pharmacy` VALUES (893, '痔速宁片 (德济)', 12, 890, 3, 7, '2021-06-09', '2023-03-27', 100, '20210609');
INSERT INTO `pharmacy` VALUES (894, '膳能牌补钙咀嚼片 (康博特)', 7, 893, 22, 5, '2021-09-14', '2023-03-06', 144, '20210914');
INSERT INTO `pharmacy` VALUES (895, '番茄红素软胶囊 (金奥力)', 11, 262, 19, 6, '2021-04-07', '2023-04-26', 98, '20210407');
INSERT INTO `pharmacy` VALUES (896, '牛黄清胃丸', 6, 700, 18, 9, '2021-07-06', '2023-11-07', 138, '20210706');
INSERT INTO `pharmacy` VALUES (897, '生脉饮(党参方)', 6, 710, 30, 8, '2021-08-25', '2023-09-23', 112, '20210825');
INSERT INTO `pharmacy` VALUES (898, '精制狗皮膏', 1, 753, 20, 10, '2021-05-25', '2023-10-30', 141, '20210525');
INSERT INTO `pharmacy` VALUES (899, '参茸补肾片', 14, 550, 22, 3, '2021-04-07', '2023-10-08', 175, '20210407');
INSERT INTO `pharmacy` VALUES (900, '大山楂丸 (樱花牌)', 11, 975, 14, 12, '2021-10-16', '2023-04-14', 103, '20211016');
INSERT INTO `pharmacy` VALUES (901, '甲芬那酸胶囊 (加芬/100芬)', 3, 742, 47, 5, '2021-06-07', '2023-11-23', 155, '20210607');
INSERT INTO `pharmacy` VALUES (902, '壮腰健身丸 (半边天)', 5, 827, 28, 10, '2021-12-14', '2023-06-02', 169, '20211214');
INSERT INTO `pharmacy` VALUES (903, '海王牌牛初乳粉', 9, 576, 18, 9, '2021-07-04', '2023-10-09', 128, '20210704');
INSERT INTO `pharmacy` VALUES (904, '早孕测试仪', 1, 569, 48, 11, '2021-02-15', '2023-06-12', 157, '20210215');
INSERT INTO `pharmacy` VALUES (905, '盛之源牌姬松茸胶囊', 8, 998, 33, 11, '2021-07-03', '2023-03-06', 109, '20210703');
INSERT INTO `pharmacy` VALUES (906, '板蓝根颗粒 (海尔思)', 11, 80, 15, 7, '2021-04-27', '2023-10-22', 118, '20210427');
INSERT INTO `pharmacy` VALUES (907, '维生素AD滴剂 (星鲨)', 5, 720, 16, 11, '2021-04-10', '2023-11-28', 90, '20210410');
INSERT INTO `pharmacy` VALUES (908, '斯卡纯修复乳液 (斯卡纯)', 2, 813, 35, 3, '2021-12-28', '2023-06-06', 90, '20211228');
INSERT INTO `pharmacy` VALUES (909, '钙咀嚼片(牛乳味) (美澳健)', 9, 371, 39, 5, '2021-02-19', '2023-09-09', 123, '20210219');
INSERT INTO `pharmacy` VALUES (910, '血塞通胶囊 (维和)', 5, 450, 33, 1, '2021-01-19', '2023-08-29', 145, '20210119');
INSERT INTO `pharmacy` VALUES (911, '珍宝解毒胶囊', 6, 177, 12, 5, '2021-10-26', '2023-06-13', 94, '20211026');
INSERT INTO `pharmacy` VALUES (912, '氧氟沙星胶囊 (方舟/氟欣)', 6, 629, 3, 10, '2021-04-21', '2023-12-20', 101, '20210421');
INSERT INTO `pharmacy` VALUES (913, '参芪肝康胶囊 (兆兴)', 11, 995, 8, 12, '2021-08-20', '2023-05-02', 192, '20210820');
INSERT INTO `pharmacy` VALUES (914, '西洋参破壁饮片 (草精华/破壁草本)', 11, 37, 24, 5, '2021-02-05', '2023-10-22', 152, '20210205');
INSERT INTO `pharmacy` VALUES (915, '山药破壁饮片 (草精华/破壁草本)', 10, 836, 10, 1, '2021-08-29', '2023-03-01', 80, '20210829');
INSERT INTO `pharmacy` VALUES (916, '千柏鼻炎片 (亚洲制药)', 9, 156, 6, 12, '2021-07-25', '2023-12-19', 88, '20210725');
INSERT INTO `pharmacy` VALUES (917, '曲安奈德益康唑乳膏 (永信/益富清)', 11, 536, 44, 12, '2021-07-28', '2023-03-17', 144, '20210728');
INSERT INTO `pharmacy` VALUES (918, '“忘不了”3A脑营养胶丸', 12, 835, 34, 11, '2021-09-10', '2023-04-07', 113, '20210910');
INSERT INTO `pharmacy` VALUES (919, '三宝胶囊 (鼎鹤)', 3, 441, 6, 12, '2021-11-20', '2023-02-19', 182, '20211120');
INSERT INTO `pharmacy` VALUES (920, '来氟米特片 (爱若华)', 1, 609, 23, 8, '2021-10-12', '2023-01-09', 171, '20211012');
INSERT INTO `pharmacy` VALUES (921, '天麻胶囊 (老专家)', 9, 827, 7, 11, '2021-09-23', '2023-06-23', 101, '20210923');
INSERT INTO `pharmacy` VALUES (922, '呼吸面罩及管路配件系统 (凯迪泰)', 14, 936, 4, 7, '2021-04-28', '2023-01-19', 164, '20210428');
INSERT INTO `pharmacy` VALUES (923, '丙戊酸钠片 (永康)', 3, 650, 43, 2, '2021-07-12', '2023-12-28', 131, '20210712');
INSERT INTO `pharmacy` VALUES (924, '复方聚乙二醇电解质散(Ⅰ) (恒康正清)', 7, 291, 46, 9, '2021-04-09', '2023-10-19', 86, '20210409');
INSERT INTO `pharmacy` VALUES (925, '丽得姿领先润美茶树控油多效面膜', 12, 437, 17, 1, '2021-05-24', '2023-07-30', 129, '20210524');
INSERT INTO `pharmacy` VALUES (926, '猴耳环消炎胶囊 (花城)', 4, 50, 31, 6, '2021-12-09', '2023-07-21', 88, '20211209');
INSERT INTO `pharmacy` VALUES (927, '三七伤药片', 11, 870, 17, 7, '2021-02-01', '2023-05-04', 114, '20210201');
INSERT INTO `pharmacy` VALUES (928, '玛奈菲百合美白亮肤面膜', 13, 112, 17, 10, '2021-03-09', '2023-09-09', 129, '20210309');
INSERT INTO `pharmacy` VALUES (929, '复方对乙酰氨基酚片', 9, 943, 18, 6, '2021-09-10', '2023-11-20', 108, '20210910');
INSERT INTO `pharmacy` VALUES (930, '凯卓纯净之水男用香水 (KENZO)', 9, 433, 12, 8, '2021-04-06', '2023-03-07', 198, '20210406');
INSERT INTO `pharmacy` VALUES (931, '盐酸左氧氟沙星片 (汇仁)', 3, 245, 40, 5, '2021-03-19', '2023-05-23', 123, '20210319');
INSERT INTO `pharmacy` VALUES (932, '藿香正气口服液', 6, 546, 37, 11, '2021-05-05', '2023-01-17', 198, '20210505');
INSERT INTO `pharmacy` VALUES (933, '生脉饮(党参方) (福爱康)', 2, 929, 10, 8, '2021-03-04', '2023-03-30', 158, '20210304');
INSERT INTO `pharmacy` VALUES (934, '理肤泉特安洁面泡沫', 14, 188, 26, 6, '2021-06-22', '2023-02-08', 110, '20210622');
INSERT INTO `pharmacy` VALUES (935, '薇姿净颜无瑕祛痘保湿洁面啫喱 (VICHY)', 4, 970, 24, 12, '2021-12-13', '2023-02-14', 187, '20211213');
INSERT INTO `pharmacy` VALUES (936, '薇姿净颜无瑕泡沫洁面乳 (VICHY)', 8, 338, 6, 7, '2021-11-18', '2023-01-23', 95, '20211118');
INSERT INTO `pharmacy` VALUES (937, '兰芝净透毛孔洁颜油 (LANEIGE)', 5, 314, 2, 5, '2021-03-10', '2023-08-19', 175, '20210310');
INSERT INTO `pharmacy` VALUES (938, '薇姿温泉矿物水活精华露 (VICHY)', 4, 721, 22, 3, '2021-08-24', '2023-12-22', 135, '20210824');
INSERT INTO `pharmacy` VALUES (939, '鱼腥草滴眼液 (朗逸)', 14, 386, 2, 5, '2021-08-27', '2023-10-29', 170, '20210827');
INSERT INTO `pharmacy` VALUES (940, '欧舒丹乳木果卸妆洁面乳 (L‘OCCITANE)', 10, 804, 39, 11, '2021-04-12', '2023-03-10', 182, '20210412');
INSERT INTO `pharmacy` VALUES (941, '阿司匹林肠溶片 (鸿羽)', 2, 825, 42, 2, '2021-09-09', '2023-09-16', 90, '20210909');
INSERT INTO `pharmacy` VALUES (942, '兰蔻新水份缘舒缓精华液 (LANCOME)', 4, 371, 20, 3, '2021-08-05', '2023-09-14', 118, '20210805');
INSERT INTO `pharmacy` VALUES (943, '洗颜专科柔澈净颜泡沫 (资生堂)', 4, 147, 6, 10, '2021-07-19', '2023-08-30', 166, '20210719');
INSERT INTO `pharmacy` VALUES (944, '头孢拉定胶囊 (汇仁)', 12, 120, 20, 5, '2021-09-12', '2023-04-26', 176, '20210912');
INSERT INTO `pharmacy` VALUES (945, '远红外理疗贴 (日复)', 10, 424, 38, 10, '2021-11-23', '2023-01-08', 164, '20211123');
INSERT INTO `pharmacy` VALUES (946, '医用护理垫 (乐洁爽/银京)', 14, 31, 50, 10, '2021-09-04', '2023-11-26', 191, '20210904');
INSERT INTO `pharmacy` VALUES (947, '复方鱼腥草片 (桔王)', 13, 256, 18, 1, '2021-05-23', '2023-10-18', 143, '20210523');
INSERT INTO `pharmacy` VALUES (948, '接触性创面敷贴 (稳健医疗)', 3, 773, 10, 6, '2021-11-07', '2023-02-21', 145, '20211107');
INSERT INTO `pharmacy` VALUES (949, '暖宫孕子丸 (宝乐慷)', 1, 719, 24, 3, '2021-04-04', '2023-06-20', 89, '20210404');
INSERT INTO `pharmacy` VALUES (950, '宏济堂牌阿胶片', 6, 642, 47, 3, '2021-09-06', '2023-08-20', 162, '20210906');
INSERT INTO `pharmacy` VALUES (951, '厄多司坦胶囊 (坦通)', 4, 186, 19, 2, '2021-12-28', '2023-10-27', 139, '20211228');
INSERT INTO `pharmacy` VALUES (952, '一次性口罩 (银京)', 14, 718, 5, 9, '2021-05-28', '2023-05-05', 127, '20210528');
INSERT INTO `pharmacy` VALUES (953, '匹多莫德口服溶液 (芙露饮)', 4, 833, 34, 11, '2021-06-02', '2023-10-28', 134, '20210602');
INSERT INTO `pharmacy` VALUES (954, '耳背式助听器 (先霸 省电王系列)', 11, 720, 7, 5, '2021-03-23', '2023-12-03', 158, '20210323');
INSERT INTO `pharmacy` VALUES (955, '纱布绷带 (欧卡诺)', 5, 924, 5, 12, '2021-03-05', '2023-10-18', 102, '20210305');
INSERT INTO `pharmacy` VALUES (956, '活性炭创可贴 (登胜)', 13, 899, 48, 12, '2021-04-05', '2023-03-14', 166, '20210405');
INSERT INTO `pharmacy` VALUES (957, '创可贴 (石药集团/若舒)', 2, 141, 21, 5, '2021-03-08', '2023-01-28', 117, '20210308');
INSERT INTO `pharmacy` VALUES (958, '森山牌铁皮枫斗胶囊', 10, 653, 4, 9, '2021-10-30', '2023-05-05', 152, '20211030');
INSERT INTO `pharmacy` VALUES (959, '医用纱布(纱布块) (银京)', 5, 966, 27, 9, '2021-07-31', '2023-02-16', 115, '20210731');
INSERT INTO `pharmacy` VALUES (960, '银离子医用抗菌凝胶 (斯丽凯)', 3, 323, 33, 5, '2021-03-10', '2023-01-18', 86, '20210310');
INSERT INTO `pharmacy` VALUES (961, '促黄体生成素检测试纸(胶体金免疫层析法)', 4, 816, 24, 2, '2021-04-26', '2023-04-21', 180, '20210426');
INSERT INTO `pharmacy` VALUES (962, '血糖测试仪', 7, 845, 32, 8, '2021-12-06', '2023-01-04', 121, '20211206');
INSERT INTO `pharmacy` VALUES (963, '益气养血口服液 (玉仁)', 12, 469, 32, 12, '2021-04-10', '2023-03-25', 135, '20210410');
INSERT INTO `pharmacy` VALUES (964, '磁疗贴 (修正)', 14, 104, 36, 1, '2021-11-12', '2023-09-24', 181, '20211112');
INSERT INTO `pharmacy` VALUES (965, '健胃消食片 (济药)', 14, 171, 12, 12, '2021-07-19', '2023-10-16', 186, '20210719');
INSERT INTO `pharmacy` VALUES (966, '昂立牌心邦片', 12, 530, 7, 9, '2021-09-13', '2023-10-20', 88, '20210913');
INSERT INTO `pharmacy` VALUES (967, '坤春牌澜伊胶囊 (惠普生)', 8, 923, 25, 4, '2021-03-27', '2023-05-21', 145, '20210327');
INSERT INTO `pharmacy` VALUES (968, '蜂之语牌蜂胶软胶囊', 12, 542, 8, 4, '2021-02-07', '2023-04-19', 177, '20210207');
INSERT INTO `pharmacy` VALUES (969, '艾申特牌B族维生素片', 1, 777, 11, 6, '2021-02-21', '2023-05-25', 150, '20210221');
INSERT INTO `pharmacy` VALUES (970, '神威牌健身茶 (神威药业)', 13, 206, 27, 2, '2021-09-18', '2023-05-28', 152, '20210918');
INSERT INTO `pharmacy` VALUES (971, '胃舒片 (畅通/修医堂)', 2, 103, 4, 2, '2021-09-20', '2023-05-06', 188, '20210920');
INSERT INTO `pharmacy` VALUES (972, '螺旋藻片 (金善福)', 6, 140, 18, 5, '2021-04-04', '2023-05-08', 189, '20210404');
INSERT INTO `pharmacy` VALUES (973, '乌鸡桂圆养血口服液 (凯镛)', 8, 460, 28, 2, '2021-04-17', '2023-12-06', 179, '20210417');
INSERT INTO `pharmacy` VALUES (974, '三合钙咀嚼片 (福尔康)', 13, 853, 8, 6, '2021-06-12', '2023-08-27', 155, '20210612');
INSERT INTO `pharmacy` VALUES (975, '灭滴栓 (伊人美)', 13, 138, 16, 9, '2021-03-03', '2023-09-17', 168, '20210303');
INSERT INTO `pharmacy` VALUES (976, '止咳宁嗽胶囊 (吉春)', 13, 41, 41, 8, '2021-01-05', '2023-11-13', 178, '20210105');
INSERT INTO `pharmacy` VALUES (977, '肺宁丸 (吉春)', 11, 366, 6, 1, '2021-10-24', '2023-10-31', 111, '20211024');
INSERT INTO `pharmacy` VALUES (978, '颈腰康胶囊 (行空)', 6, 203, 31, 8, '2021-08-31', '2023-12-28', 140, '20210831');
INSERT INTO `pharmacy` VALUES (979, '祛痛橡胶膏 嘎日迪-5', 4, 280, 42, 6, '2021-07-15', '2023-09-11', 178, '20210715');
INSERT INTO `pharmacy` VALUES (980, '复方百部止咳糖浆', 13, 475, 40, 4, '2021-10-17', '2023-01-10', 165, '20211017');
INSERT INTO `pharmacy` VALUES (981, '感冒止咳颗粒', 3, 939, 7, 9, '2021-07-28', '2023-04-26', 166, '20210728');
INSERT INTO `pharmacy` VALUES (982, '双歧杆菌四联活菌片 (思连康)', 11, 966, 37, 8, '2021-12-10', '2023-07-24', 83, '20211210');
INSERT INTO `pharmacy` VALUES (983, '降糖通脉片 (龙泰)', 2, 552, 1, 7, '2021-06-14', '2023-06-02', 176, '20210614');
INSERT INTO `pharmacy` VALUES (984, '生化丸 (立效)', 6, 147, 1, 5, '2021-06-09', '2023-04-20', 184, '20210609');
INSERT INTO `pharmacy` VALUES (985, '复方感冒灵片', 11, 852, 19, 8, '2021-08-02', '2023-07-04', 198, '20210802');
INSERT INTO `pharmacy` VALUES (986, '复方地茯口服液 (仁和)', 9, 246, 12, 9, '2021-02-22', '2023-01-29', 173, '20210222');
INSERT INTO `pharmacy` VALUES (987, '多功能冲洗器 (兰润)', 4, 104, 43, 1, '2021-03-09', '2023-07-20', 194, '20210309');
INSERT INTO `pharmacy` VALUES (988, '金月子暖宫贴 (远红外热疗贴)', 10, 184, 3, 6, '2021-11-25', '2023-06-01', 199, '20211125');
INSERT INTO `pharmacy` VALUES (989, '银翘解毒颗粒', 4, 936, 40, 2, '2021-05-20', '2023-06-02', 193, '20210520');
INSERT INTO `pharmacy` VALUES (990, '降压平片 (亿佰清)', 1, 298, 21, 4, '2021-01-30', '2023-02-20', 107, '20210130');
INSERT INTO `pharmacy` VALUES (991, '复方石韦胶囊 (舒甚)', 5, 386, 46, 9, '2021-03-31', '2023-10-01', 159, '20210331');
INSERT INTO `pharmacy` VALUES (992, '健脑补肾丸 (999)', 4, 23, 24, 12, '2021-07-28', '2023-07-26', 89, '20210728');
INSERT INTO `pharmacy` VALUES (993, '小柴胡颗粒 (邦宁药业)', 10, 722, 2, 7, '2021-10-26', '2023-01-14', 144, '20211026');
INSERT INTO `pharmacy` VALUES (994, '壮腰健肾丸 (御生堂/宫廷)', 14, 507, 19, 5, '2021-08-09', '2023-12-29', 134, '20210809');
INSERT INTO `pharmacy` VALUES (995, '通宣理肺丸 (御生堂/宫廷)', 12, 669, 39, 10, '2021-02-25', '2023-03-01', 140, '20210225');
INSERT INTO `pharmacy` VALUES (996, '百合固金片 (旺方)', 7, 789, 32, 3, '2021-01-15', '2023-06-02', 175, '20210115');
INSERT INTO `pharmacy` VALUES (997, '消瘀定痛膏 (玺福康)', 13, 419, 8, 11, '2021-04-18', '2023-08-06', 137, '20210418');
INSERT INTO `pharmacy` VALUES (998, '乌兰三味汤散 (安友)', 13, 551, 18, 9, '2021-06-15', '2023-02-06', 173, '20210615');
INSERT INTO `pharmacy` VALUES (999, '贝特晓芙牌鳕鱼肝油软胶囊 (贝特晓芙)', 9, 621, 45, 12, '2021-11-22', '2023-07-07', 105, '20211122');
INSERT INTO `pharmacy` VALUES (1000, '阿莫西林胶囊 (南洋)', 1, 318, 14, 11, '2021-03-08', '2023-06-17', 129, '20210308');

-- ----------------------------
-- Table structure for projecttype
-- ----------------------------
DROP TABLE IF EXISTS `projecttype`;
CREATE TABLE `projecttype`  (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`projectId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of projecttype
-- ----------------------------
INSERT INTO `projecttype` VALUES (1, '综合医疗服务类');
INSERT INTO `projecttype` VALUES (2, '医技诊疗类');
INSERT INTO `projecttype` VALUES (3, '临床诊疗类');
INSERT INTO `projecttype` VALUES (4, '后勤消费类');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `registerId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmentId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `diagnose` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idcard` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerDate` datetime(0) NULL DEFAULT NULL,
  `bedId` int(11) NULL DEFAULT NULL,
  `operator` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL COMMENT '预交费用',
  `state` int(11) NULL DEFAULT NULL,
  `endDate` date NULL DEFAULT NULL,
  `price` double UNSIGNED NULL DEFAULT NULL,
  `medicarePercent` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zhuan` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`registerId`) USING BTREE,
  INDEX `fk_regdepartment`(`departmentId`) USING BTREE,
  INDEX `fk_regdoctor`(`doctorId`) USING BTREE,
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `register_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES (1, '昊强韩', 41, '女', 12, 50, '病历概述...', '176 浩轩 桥 Apt. 155', '13768000454', '671707085884663879', '2022-04-11 01:18:38', 175, NULL, 1000, 1, '2022-05-17', 322, '30%', NULL);
INSERT INTO `register` VALUES (2, '鸿煊沈', 82, '男', 15, 22, '病历概述...', '722 姚 街 Apt. 178', '13786572875', '090889343345549816', '2022-04-02 01:20:13', 64, NULL, 1000, 1, '2022-05-18', 30, '35%', NULL);
INSERT INTO `register` VALUES (3, '烨霖姚', 63, '男', 19, 44, '病历概述...', '3419 荣轩 侬 Apt. 429', '13798029038', '796838088325006837', '2022-04-03 13:27:19', 65, NULL, 1000, 1, '2022-05-16', 40, '0%', NULL);
INSERT INTO `register` VALUES (4, '荣轩邱', 35, '女', 14, 84, '病历概述...', '6393 邵 旁 Suite 851', '13755006177', '570555627931336139', '2022-04-02 04:04:12', 7, NULL, 1000, 1, '2022-05-16', 40, '30%', NULL);
INSERT INTO `register` VALUES (5, '越彬彭', 76, '男', 1, 97, '病历概述...', '5211 何 桥 Apt. 132', '13752945585', '433023923179442162', '2022-04-01 09:17:52', 67, NULL, 1000, 1, '2022-05-18', 40, '0%', NULL);
INSERT INTO `register` VALUES (6, '思源尹', 54, '女', 1, 75, '病历概述...', '864 钟 街 Suite 317', '13734608481', '575217471575276205', '2022-04-02 14:53:06', 48, NULL, 1000, 1, '2022-05-18', 40, '0%', NULL);
INSERT INTO `register` VALUES (7, '晓啸邹', 75, '女', 6, 50, '病历概述...', '94387 孟 巷 Suite 020', '13764503695', '949746666690363354', '2022-04-02 14:46:19', 51, NULL, 1000, 1, '2022-05-18', 50, '35%', NULL);
INSERT INTO `register` VALUES (8, '雪松段', 49, '男', 1, 93, '病历概述...', '0360 烨霖 桥 Suite 801', '13774754618', '471775340398652791', '2022-04-03 06:15:24', 27, NULL, 1000, 1, '2022-05-18', 50, '35%', NULL);
INSERT INTO `register` VALUES (9, '越彬郝', 50, '女', 15, 24, '病历概述...', '355 邱 路 Suite 040', '13783763583', '909092361488340533', '2022-04-13 21:27:48', 159, NULL, 1000, 1, '2022-05-18', 50, '35%', NULL);
INSERT INTO `register` VALUES (10, '懿轩郝', 34, '女', 14, 22, '病历概述...', '5160 鑫鹏 路 Suite 008', '13762179429', '866713942057330044', '2022-04-02 10:04:59', 182, NULL, 1000, 1, '2022-05-20', 4026, '35%', NULL);
INSERT INTO `register` VALUES (11, '耀杰赖', 69, '女', 7, 72, '病历概述...', '3102 伟泽 街 Suite 987', '13731986893', '620013409828429298', '2022-04-05 04:37:09', 43, NULL, 1000, 1, '2022-05-19', 10, '35%', NULL);
INSERT INTO `register` VALUES (12, '思杜', 28, '女', 5, 25, '病历概述...', '84550 明哲 桥 Apt. 229', '13769514669', '539317117191051812', '2022-04-02 11:51:03', 148, NULL, 1000, 1, '2022-05-19', 10, '35%', NULL);
INSERT INTO `register` VALUES (13, '锦程谢', 50, '男', 4, 63, '病历概述...', '8684 明哲 栋 Suite 144', '13756383568', '511622822695679835', '2022-04-15 07:55:19', 106, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (14, '思远沈', 51, '女', 10, 21, '病历概述...', '8643 尹 街 Suite 091', '13793808213', '087232696483286609', '2022-04-15 07:55:19', 155, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (15, '伟泽何', 33, '男', 4, 59, '病历概述...', '073 鸿煊 巷 Apt. 583', '13721327321', '607536799481173419', '2022-05-17 00:00:00', 136, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (16, '志泽石', 13, '女', 3, 41, '病历概述...', '7633 聪健 中心 Suite 863', '13766374142', '856791730613124683', '2022-05-17 00:00:00', 120, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (17, '烨霖龙', 89, '男', 10, 23, '病历概述...', '327 金 巷 Apt. 483', '13708556250', '538172191101293307', '2022-05-18 00:00:00', 131, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (18, '远航孙', 10, '男', 19, 13, '病历概述...', '8964 杨 路 Apt. 037', '13741375632', '556448725552909967', '2022-05-18 00:00:00', 77, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (19, '智宸戴', 57, '男', 17, 96, '病历概述...', '607 涛 巷 Apt. 807', '13748877109', '365253251936672982', '2022-04-04 22:28:44', 61, NULL, 1000, 1, '2022-04-15', 178.75, '35%', NULL);
INSERT INTO `register` VALUES (20, '博超廖', 72, '女', 19, 70, '病历概述...', '764 罗 巷 Suite 057', '13760600417', '054168423763439806', '2022-05-18 00:00:00', 52, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (21, '志泽潘', 48, '女', 15, 76, '病历概述...', '1363 钟 街 Apt. 096', '13799630083', '776474616531934450', '2022-05-18 00:00:00', 6, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (22, '苑博姚', 50, '女', 1, 79, '病历概述...', '35216 邵 旁 Apt. 830', '13746197865', '061288482728257402', '2022-05-18 00:00:00', 154, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (23, '智渊梁', 77, '女', 6, 64, '病历概述...', '94976 陆 旁 Suite 964', '13763039181', '451891867381862672', '2022-05-18 00:00:00', 129, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (24, '靖琪孔', 43, '男', 19, 32, '病历概述...', '69521 夏 桥 Apt. 464', '13732392538', '579959446588678964', '2022-04-04 04:33:59', 47, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (25, '熠彤宋', 85, '女', 7, 14, '病历概述...', '93615 戴 桥 Apt. 970', '13781239525', '086916140767521839', '2022-04-02 03:26:22', 2, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (26, '瑞霖陆', 51, '男', 17, 4, '病历概述...', '9601 鸿涛 栋 Apt. 559', '13775169606', '911065967823421804', '2022-04-04 03:04:25', 69, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (27, '绍齐韩', 83, '女', 16, 92, '病历概述...', '5925 孟 旁 Apt. 899', '13709038454', '297795788998076846', '2022-04-02 04:04:19', 4, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (28, '晓啸姜', 20, '男', 6, 95, '病历概述...', '329 谭 侬 Suite 388', '13755655331', '470763782588479908', '2022-04-12 12:44:42', 126, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (29, '天翊宋', 27, '男', 19, 15, '病历概述...', '621 李 栋 Apt. 900', '13758031850', '096846711096374246', '2022-04-02 15:28:19', 74, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (30, '伟宸曹', 33, '男', 19, 75, '病历概述...', '243 智渊 栋 Suite 720', '13720500899', '913334037161148964', '2022-04-12 17:52:46', 118, NULL, 1000, 1, '2022-05-19', 30, '0%', NULL);
INSERT INTO `register` VALUES (31, '浩张', 16, '女', 5, 77, '病历概述...', '65886 叶 中心 Apt. 162', '13716311869', '580506574323169750', '2022-04-04 16:20:32', 44, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (32, '昊焱韦', 44, '男', 19, 99, '病历概述...', '59422 昊天 中心 Apt. 167', '13712591866', '426945190203838046', '2022-04-01 20:24:58', 38, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (33, '文昊钱', 42, '男', 18, 69, '病历概述...', '504 龚 中心 Apt. 501', '13703986361', '728997904512708016', '2022-04-03 13:23:27', 150, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (34, '楷瑞曹', 64, '男', 20, 33, '病历概述...', '6974 龙 路 Suite 221', '13788023090', '033958572866593172', '2022-04-13 05:07:52', 157, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (36, '炫明沈', 38, '女', 10, 34, '病历概述...', '934 志泽 路 Apt. 816', '13772056977', '545178656047139580', '2022-04-05 06:17:18', 42, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (37, '天宇罗', 13, '女', 8, 92, '病历概述...', '81581 丁 巷 Apt. 288', '13730902913', '954596697224658303', '2022-04-13 13:43:12', 70, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (38, '梓晨侯', 73, '女', 3, 64, '病历概述...', '082 建辉 旁 Apt. 250', '13781756769', '662588593157684782', '2022-04-13 06:06:56', 114, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (39, '凯瑞潘', 66, '女', 4, 41, '病历概述...', '802 煜祺 桥 Apt. 954', '13776221363', '182357900966632219', '2022-05-19 17:51:24', 107, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (40, '驰黄', 77, '男', 11, 86, '病历概述...', '72722 嘉熙 侬 Apt. 660', '13747436165', '272152598191926952', '2022-05-19 17:51:24', 127, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (41, '梓晨张', 27, '女', 20, 94, '病历概述...', '272 风华 桥 Apt. 435', '13731851882', '836377008628603166', '2022-05-19 17:51:24', 3, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (42, '涛宋', 58, '女', 4, 66, '病历概述...', '2852 越泽 侬 Suite 098', '13709972977', '442144214198983887', '2022-05-19 17:51:24', 121, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (43, '立辉阎', 64, '男', 13, 14, '病历概述...', '3931 郑 侬 Suite 447', '13709260000', '013488334379525688', '2022-05-19 17:51:24', 116, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (45, '雨泽许', 87, '女', 16, 82, '病历概述...', '10729 邓 桥 Apt. 540', '13781449140', '324777520001518763', '2022-05-19 17:51:24', 193, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (46, '浩宇曾', 25, '男', 6, 11, '病历概述...', '967 志泽 旁 Suite 124', '13786189433', '728804366712068112', '2022-05-19 17:51:24', 192, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (47, '炫明魏', 24, '女', 6, 23, '病历概述...', '5541 晓啸 路 Apt. 063', '13771911153', '257647459134933868', '2022-05-19 17:51:24', 113, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (48, '立诚冯', 68, '女', 14, 88, '病历概述...', '8054 语堂 桥 Apt. 144', '13707246412', '328621270951256686', '2022-04-02 09:08:47', 22, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (49, '彬沈', 55, '女', 8, 32, '病历概述...', '593 修杰 侬 Apt. 958', '13776292080', '349778245680236028', '2022-04-01 10:23:10', 99, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (51, '智宸潘', 15, '女', 17, 23, '病历概述...', '7194 萧 侬 Apt. 806', '13772216545', '353835667940149136', '2022-04-04 16:57:16', 12, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (52, '语堂马', 39, '女', 13, 98, '病历概述...', '2135 姜 路 Suite 633', '13762867881', '602578699312561902', '2022-04-02 11:25:17', 117, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (53, '擎苍龙', 40, '男', 6, 4, '病历概述...', '85622 耀杰 路 Suite 215', '13729235129', '770396595700216569', '2022-04-01 21:02:50', 81, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (54, '思聪钟', 36, '女', 8, 65, '病历概述...', '47533 任 街 Suite 033', '13729601725', '212441230548066090', '2022-04-04 12:59:47', 110, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (55, '思曹', 62, '男', 10, 7, '病历概述...', '833 锦程 路 Apt. 718', '13774088945', '780270599153372841', '2022-04-03 16:19:16', 123, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (57, '立辉方', 84, '女', 15, 71, '病历概述...', '7851 雷 栋 Apt. 047', '13760118007', '809466474018872007', '2022-04-04 17:08:44', 142, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (58, '晓博余', 74, '男', 2, 37, '病历概述...', '4185 夏 旁 Apt. 720', '13755524069', '892838110320131055', '2022-04-04 15:42:38', 41, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (59, '明哲程', 27, '男', 4, 87, '病历概述...', '796 江 巷 Suite 857', '13771039378', '615624899784157513', '2022-05-20 21:11:45', 103, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (60, '鸿煊余', 18, '女', 17, 59, '病历概述...', '451 瑞霖 中心 Suite 991', '13745297160', '865895231925277444', '2022-04-12 02:42:27', 57, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (61, '绍齐杨', 18, '男', 12, 27, '病历概述...', '290 孙 旁 Apt. 208', '13712216535', '801438665407022221', '2022-04-02 16:28:28', 8, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (62, '鸿煊林', 87, '男', 16, 73, '病历概述...', '71829 雪松 栋 Apt. 166', '13747734596', '255735316783014039', '2022-05-20 21:11:45', 176, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (63, '立轩汪', 73, '女', 2, 45, '病历概述...', '130 思远 旁 Apt. 969', '13776667355', '499506667454580289', '2022-05-20 21:11:45', 15, NULL, 2000, 1, '2022-05-20', 416, '35%', '2022-05-20 21:37:45');
INSERT INTO `register` VALUES (64, '聪健白', 68, '男', 18, 43, '病历概述...', '2411 雪松 街 Apt. 836', '13771117329', '329430352019763731', '2022-05-20 21:11:45', 5, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (65, '智辉任', 83, '男', 4, 51, '病历概述...', '5568 君浩 街 Apt. 302', '13750868430', '817965583953512148', '2022-04-01 15:31:24', 1, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (66, '博文何', 10, '男', 7, 79, '病历概述...', '3202 孔 街 Suite 005', '13770310007', '068591161002955717', '2022-04-04 16:21:10', 9, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (67, '涛马', 33, '男', 13, 9, '病历概述...', '168 明辉 中心 Suite 515', '13753050511', '658351919775265624', '2022-04-04 16:21:10', 59, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (68, '绍齐杜', 38, '女', 11, 31, '病历概述...', '197 余 侬 Apt. 288', '13719415081', '040800976676350917', '2022-04-03 15:24:37', 119, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (69, '文轩白', 46, '女', 14, 1, '病历概述...', '27314 孙 栋 Suite 484', '13780727021', '355667720360940197', '2022-04-01 10:37:36', 26, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (70, '智辉苏', 81, '女', 3, 70, '病历概述...', '76481 智宸 街 Suite 148', '13748402925', '571470983690317230', '2022-04-15 02:54:09', 143, NULL, 1000, 1, '2022-05-16', 5794, '0%', NULL);
INSERT INTO `register` VALUES (71, '明轩熊', 86, '女', 14, 42, '病历概述...', '18104 汪 桥 Apt. 008', '13707750048', '505224883496991238', '2022-04-03 03:09:44', 115, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (72, '航许', 37, '女', 13, 42, '病历概述...', '82568 顾 桥 Suite 931', '13719512040', '717706801972353038', '2022-04-04 12:09:07', 46, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (73, '越泽张', 70, '女', 2, 12, '病历概述...', '833 钟 栋 Apt. 312', '13758111247', '754191800765063322', '2022-04-04 21:10:11', 66, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (74, '浩轩范', 46, '女', 6, 1, '病历概述...', '31522 贾 桥 Apt. 361', '13768738236', '712003005268727945', '2022-04-03 14:51:41', 170, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (75, '烨霖陶', 84, '男', 11, 7, '病历概述...', '1895 博涛 路 Suite 311', '13762990734', '318313441557234471', '2022-04-03 03:16:35', 49, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (77, '胤祥毛', 71, '女', 6, 96, '病历概述...', '794 伟祺 路 Apt. 790', '13715881198', '046153168736466721', '2022-04-15 07:55:19', 21, NULL, 1000, 1, '2022-04-15', 32.5, '35%', NULL);
INSERT INTO `register` VALUES (79, '明辉傅', 69, '女', 12, 89, '病历概述...', '786 丁 路 Apt. 307', '13730556323', '799641002489531731', '2022-04-02 17:50:47', 53, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (80, '瑾瑜董', 84, '女', 2, 86, '病历概述...', '9243 郑 侬 Suite 458', '13723496129', '414705790972363723', '2022-04-01 16:03:25', 86, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (81, '鑫鹏周', 43, '女', 16, 26, '病历概述...', '866 峻熙 巷 Suite 239', '13736265212', '266279721874108916', '2022-04-01 14:32:49', 177, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (82, '博文郭', 25, '女', 10, 34, '病历概述...', '785 钟 街 Apt. 232', '13796223088', '466831311340566113', '2022-04-03 13:36:58', 14, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (83, '修洁邱', 87, '男', 19, 1, '病历概述...', '39279 文 栋 Apt. 039', '13702108434', '995912844559915458', '2022-04-01 16:07:14', 56, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (84, '烨霖曹', 78, '女', 11, 95, '病历概述...', '560 谢 桥 Suite 666', '13710053801', '098677033601137034', '2022-04-03 23:24:29', 181, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (86, '修杰董', 82, '女', 11, 83, '病历概述...', '306 烨伟 旁 Apt. 245', '13763865954', '124707515326653154', '2022-04-02 23:46:15', 11, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (87, '雨泽曾', 16, '男', 19, 47, '病历概述...', '08197 洪 巷 Suite 257', '13777442941', '089376591250232872', '2022-04-01 16:01:52', 156, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (88, '乐驹丁', 16, '女', 14, 85, '病历概述...', '42362 孔 路 Apt. 018', '13772491285', '337481032239804507', '2022-04-03 01:33:51', 132, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (89, '嘉懿廖', 53, '女', 15, 73, '病历概述...', '90643 曹 栋 Suite 897', '13777260063', '950300694361281960', '2022-04-04 18:50:52', 125, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (90, '昊焱崔', 78, '女', 4, 57, '病历概述...', '266 思淼 侬 Suite 909', '13719770326', '759728092251220175', '2022-04-05 01:26:22', 199, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (91, '锦程汪', 82, '男', 18, 67, '病历概述...', '149 俊驰 桥 Apt. 385', '13763748436', '401956752185604809', '2022-04-03 08:05:07', 197, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (92, '明刘', 36, '男', 11, 19, '病历概述...', '475 胤祥 栋 Apt. 261', '13739350298', '749099384686467232', '2022-04-05 02:41:49', 190, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (93, '立轩范', 85, '女', 13, 13, '病历概述...', '64516 峻熙 巷 Suite 841', '13765095697', '549212115104223836', '2022-04-03 11:18:57', 29, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (94, '苑博曾', 21, '女', 5, 49, '病历概述...', '358 徐 桥 Suite 943', '13779522664', '341201034001159495', '2022-04-03 10:56:03', 58, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (95, '明辉苏', 56, '男', 2, 71, '病历概述...', '3192 史 路 Suite 378', '13748801140', '989432827616356858', '2022-04-03 15:07:00', 98, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (96, '远航崔', 43, '女', 2, 37, '病历概述...', '5758 修洁 巷 Suite 990', '13704371921', '223180353623614935', '2022-04-03 12:55:24', 16, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (97, '博文邓', 71, '女', 12, 83, '病历概述...', '226 罗 旁 Apt. 787', '13752559577', '527270853339993781', '2022-04-03 08:13:54', 62, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (98, '黎昕陶', 67, '女', 19, 96, '病历概述...', '66275 孟 侬 Suite 071', '13771416115', '246517340877390553', '2022-04-05 06:09:20', 40, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (99, '荣轩夏', 10, '男', 1, 83, '病历概述...', '078 弘文 栋 Apt. 537', '13715204522', '457501157928554639', '2022-04-01 20:14:52', 13, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (100, '志泽叶', 79, '男', 12, 1, '病历概述...', '2669 鑫鹏 旁 Suite 717', '13713455491', '545029086097759660', '2022-04-02 23:18:12', 122, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (101, '鹭洋尹', 31, '男', 12, 35, '病历概述...', '9222 郑 中心 Suite 705', '13788305614', '143875098328932976', '2022-04-04 19:12:21', 10, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (102, '涛赖', 49, '男', 8, 95, '病历概述...', '1964 彭 街 Apt. 738', '13727214017', '648584305227471265', '2022-04-05 02:01:18', 183, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (103, '聪健覃', 17, '男', 13, 80, '病历概述...', '606 弘文 栋 Suite 552', '13720524109', '317020325333252486', '2022-04-02 07:58:03', 167, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (104, '浩郑', 75, '男', 10, 5, '病历概述...', '744 贾 中心 Apt. 632', '13755851794', '777403416584486822', '2022-04-04 18:39:46', 20, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (105, '子默范', 49, '男', 3, 17, '病历概述...', '453 雪松 侬 Suite 116', '13710796650', '282183970410503581', '2022-04-02 01:01:19', 161, NULL, 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (106, '晓博白', 74, '女', 1, 28, '病历概述...', '16151 钱 巷 Apt. 939', '13791687283', '199586016541142187', '2022-04-05 03:23:05', 45, NULL, 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (107, '炫明赵', 16, '男', 14, 47, '病历概述...', '4101 炎彬 栋 Suite 424', '13700590265', '751293156429094908', '2022-04-04 08:19:13', 140, NULL, 1000, 0, NULL, NULL, '35%', NULL);
INSERT INTO `register` VALUES (113, '测试1', 20, '男', 2, 76, '感冒', '山西', '12345678910', '142378899949573817', '2022-04-15 17:47:50', 17, '超级管理员', 2000, 1, '2022-05-19', 226, '0%', NULL);
INSERT INTO `register` VALUES (114, 'test', 12, '男', 2, 45, 'haha ', 'adf', '12345678910', '123456789004958173', '2022-05-16 22:46:35', 17, '超级管理员', 1000, 0, NULL, NULL, '0%', NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spread` int(255) NULL DEFAULT NULL COMMENT '0不展开1展开',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(255) NULL DEFAULT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '住院信息系统', '', 1, NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2, 1, '业务管理', '', 0, '_self', '', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '系统管理', '', 0, '_self', '', 1);
INSERT INTO `sys_menu` VALUES (4, 2, '住院管理', '', 0, '_self', 'fa fa-hospital-o', 1);
INSERT INTO `sys_menu` VALUES (5, 2, '药房管理', '', 0, '_self', 'fa fa-medkit', 1);
INSERT INTO `sys_menu` VALUES (6, 3, '数据中心', '', 0, '_self', 'fa fa-database', 1);
INSERT INTO `sys_menu` VALUES (7, 3, '角色管理', 'page/roleManage.html', 0, '_self', 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (8, 3, '用户管理', 'page/userManage.html', 0, '_self', 'fa fa-users', 1);
INSERT INTO `sys_menu` VALUES (9, 4, '入院登记', 'page/inHospital.html', 0, '_self', 'fa fa-angle-double-right', 1);
INSERT INTO `sys_menu` VALUES (10, 4, '缴费管理', 'page/payManage.html', 0, '_self', 'fa fa-jpy', 1);
INSERT INTO `sys_menu` VALUES (11, 4, '药品记账', 'page/drugCharge.html', 0, '_self', 'fa fa-file-text-o', 1);
INSERT INTO `sys_menu` VALUES (12, 4, '项目记账', 'page/techCharge.html', 0, '_self', 'fa fa-file-text-o', 1);
INSERT INTO `sys_menu` VALUES (13, 4, '出院结算', 'page/outHospital.html', 0, '_self', 'fa fa-angle-double-left', 1);
INSERT INTO `sys_menu` VALUES (14, 5, '药房详情', 'page/pharmacyDetails.html', 0, '_self', 'fa fa-list-ul', 1);
INSERT INTO `sys_menu` VALUES (15, 5, '住院取药', 'page/takeMedicine.html', 0, '_self', 'fa fa-file-text-o', 1);
INSERT INTO `sys_menu` VALUES (16, 6, '科室中心', 'page/department.html', 0, '_self', 'fa fa-sitemap', 1);
INSERT INTO `sys_menu` VALUES (17, 6, '医生列表', 'page/doctor.html', 0, '_self', 'fa fa-user-md', 1);
INSERT INTO `sys_menu` VALUES (18, 6, '项目管理', 'page/medicalTech.html', 0, '_self', 'fa fa-stethoscope', 1);
INSERT INTO `sys_menu` VALUES (19, 6, '供货单位', 'page/area.html', 0, '_self', 'fa fa-shopping-cart', 1);
INSERT INTO `sys_menu` VALUES (20, 6, '药品类型', 'page/drugType.html', 0, '_self', 'fa fa-tags', 1);
INSERT INTO `sys_menu` VALUES (21, 6, '计量单位', 'page/drugUnit.html', 0, '_self', 'fa fa-flask', 1);
INSERT INTO `sys_menu` VALUES (22, 6, '公告管理', 'page/noticeManage.html', 0, '_self', 'fa fa-bell', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1);
INSERT INTO `sys_role` VALUES (2, '系统管理员', '拥有管理用户、角色的权限', 1);
INSERT INTO `sys_role` VALUES (3, '业务数据管理员', '拥有修改业务数据的权限', 1);
INSERT INTO `sys_role` VALUES (4, '住院管理', '拥有住院管理的权限', 1);
INSERT INTO `sys_role` VALUES (5, '药房管理', '拥有药房管理权限', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`rid`, `mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (3, 16);
INSERT INTO `sys_role_menu` VALUES (3, 17);
INSERT INTO `sys_role_menu` VALUES (3, 18);
INSERT INTO `sys_role_menu` VALUES (3, 19);
INSERT INTO `sys_role_menu` VALUES (3, 20);
INSERT INTO `sys_role_menu` VALUES (3, 21);
INSERT INTO `sys_role_menu` VALUES (3, 22);
INSERT INTO `sys_role_menu` VALUES (4, 9);
INSERT INTO `sys_role_menu` VALUES (4, 10);
INSERT INTO `sys_role_menu` VALUES (4, 11);
INSERT INTO `sys_role_menu` VALUES (4, 12);
INSERT INTO `sys_role_menu` VALUES (4, 13);
INSERT INTO `sys_role_menu` VALUES (5, 14);
INSERT INTO `sys_role_menu` VALUES (5, 15);
INSERT INTO `sys_role_menu` VALUES (8, 7);
INSERT INTO `sys_role_menu` VALUES (8, 8);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (2, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id有且只有一个自增',
  `loginName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账户',
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户身份证号',
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `sex` int(255) NULL DEFAULT NULL COMMENT '用户性别:0女1男',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '此账户的密码',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户描述',
  `type` int(255) NULL DEFAULT 2 COMMENT '1,超级管理员,2,系统用户',
  `available` int(255) NULL DEFAULT NULL COMMENT '账户是否启用',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码撒盐',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '412365199601236544', '超级管理员', 1, '山西123', '13183380740', '4acb4bc224acbbe3c2bfdcaa39a4324e', 'CEO', 1, 1, 'd21fd4');
INSERT INTO `sys_user` VALUES (6, 'doctor', '157943399947581736', '张三', 1, '北京天安门', '12345678910', 'e10adc3949ba59abbe56e057f20f883e', '主任医师', 2, 1, NULL);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '血清');
INSERT INTO `type` VALUES (2, '疫苗');
INSERT INTO `type` VALUES (3, '中药材');
INSERT INTO `type` VALUES (4, '中成药');
INSERT INTO `type` VALUES (5, '抗生素');
INSERT INTO `type` VALUES (6, '中药饮片');
INSERT INTO `type` VALUES (7, '中西成药');
INSERT INTO `type` VALUES (8, '血液制品');
INSERT INTO `type` VALUES (9, '生化药品');
INSERT INTO `type` VALUES (10, '放射性药品');
INSERT INTO `type` VALUES (11, '诊断药品等');
INSERT INTO `type` VALUES (12, '化学原料药及其制剂');

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `unitId` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`unitId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES (1, '盒');
INSERT INTO `unit` VALUES (2, '瓶');
INSERT INTO `unit` VALUES (3, '支');
INSERT INTO `unit` VALUES (4, '个');
INSERT INTO `unit` VALUES (5, '管');
INSERT INTO `unit` VALUES (6, '次');
INSERT INTO `unit` VALUES (7, '台');
INSERT INTO `unit` VALUES (8, '包');
INSERT INTO `unit` VALUES (9, '袋');
INSERT INTO `unit` VALUES (10, '卷');
INSERT INTO `unit` VALUES (11, '条');
INSERT INTO `unit` VALUES (12, '碗');
INSERT INTO `unit` VALUES (13, '张');
INSERT INTO `unit` VALUES (14, '桶');

SET FOREIGN_KEY_CHECKS = 1;
