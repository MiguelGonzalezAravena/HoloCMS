/*
 Navicat Premium Data Transfer

 Source Server         : HoloCMS
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : z37udk8g6jiaqcbx.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306
 Source Schema         : m0wwy64nt6johmj1

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 04/07/2018 13:29:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for applications
-- ----------------------------
DROP TABLE IF EXISTS `applications`;
CREATE TABLE `applications` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `appstatus` text NOT NULL,
  `age` text NOT NULL,
  `country` text NOT NULL,
  `timezone` text NOT NULL,
  `realname` text NOT NULL,
  `modname` text NOT NULL,
  `time` text NOT NULL,
  `experience` text NOT NULL,
  `message1` text NOT NULL,
  `message2` text NOT NULL,
  `message3` text NOT NULL,
  `users` text NOT NULL,
  `visitoripaddy` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for catalogue_deals
-- ----------------------------
DROP TABLE IF EXISTS `catalogue_deals`;
CREATE TABLE `catalogue_deals` (
  `id` int(10) NOT NULL COMMENT 'The ID of this deal [the part after "deal"]',
  `tid` int(10) NOT NULL COMMENT 'The template ID of the item that should be in this deal',
  `amount` int(10) NOT NULL COMMENT 'The amount, of how many items of the type _TID should be in this deal'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of catalogue_deals
-- ----------------------------
BEGIN;
INSERT INTO `catalogue_deals` VALUES (2, 272, 1);
INSERT INTO `catalogue_deals` VALUES (3, 325, 1);
INSERT INTO `catalogue_deals` VALUES (3, 485, 1);
INSERT INTO `catalogue_deals` VALUES (2, 270, 2);
INSERT INTO `catalogue_deals` VALUES (2, 484, 1);
INSERT INTO `catalogue_deals` VALUES (1, 69, 3);
INSERT INTO `catalogue_deals` VALUES (1, 72, 1);
INSERT INTO `catalogue_deals` VALUES (3, 318, 2);
INSERT INTO `catalogue_deals` VALUES (4, 76, 1);
INSERT INTO `catalogue_deals` VALUES (4, 410, 1);
INSERT INTO `catalogue_deals` VALUES (4, 328, 1);
INSERT INTO `catalogue_deals` VALUES (5, 312, 1);
INSERT INTO `catalogue_deals` VALUES (5, 313, 3);
INSERT INTO `catalogue_deals` VALUES (6, 402, 1);
INSERT INTO `catalogue_deals` VALUES (6, 352, 4);
INSERT INTO `catalogue_deals` VALUES (97, 41, 6);
INSERT INTO `catalogue_deals` VALUES (98, 42, 6);
INSERT INTO `catalogue_deals` VALUES (99, 43, 6);
INSERT INTO `catalogue_deals` VALUES (96, 44, 6);
INSERT INTO `catalogue_deals` VALUES (2, 272, 1);
INSERT INTO `catalogue_deals` VALUES (3, 325, 1);
INSERT INTO `catalogue_deals` VALUES (3, 485, 1);
INSERT INTO `catalogue_deals` VALUES (2, 270, 2);
INSERT INTO `catalogue_deals` VALUES (2, 484, 1);
INSERT INTO `catalogue_deals` VALUES (1, 69, 3);
INSERT INTO `catalogue_deals` VALUES (1, 72, 1);
INSERT INTO `catalogue_deals` VALUES (3, 318, 2);
INSERT INTO `catalogue_deals` VALUES (4, 76, 1);
INSERT INTO `catalogue_deals` VALUES (4, 410, 1);
INSERT INTO `catalogue_deals` VALUES (4, 328, 1);
INSERT INTO `catalogue_deals` VALUES (5, 312, 1);
INSERT INTO `catalogue_deals` VALUES (5, 313, 3);
INSERT INTO `catalogue_deals` VALUES (6, 402, 1);
INSERT INTO `catalogue_deals` VALUES (6, 352, 4);
INSERT INTO `catalogue_deals` VALUES (97, 41, 6);
INSERT INTO `catalogue_deals` VALUES (98, 42, 6);
INSERT INTO `catalogue_deals` VALUES (99, 43, 6);
INSERT INTO `catalogue_deals` VALUES (96, 44, 6);
COMMIT;

-- ----------------------------
-- Table structure for catalogue_items
-- ----------------------------
DROP TABLE IF EXISTS `catalogue_items`;
CREATE TABLE `catalogue_items` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `catalogue_name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `catalogue_description` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `catalogue_cost` int(5) NOT NULL,
  `typeid` tinyint(1) NOT NULL,
  `length` tinyint(2) NOT NULL,
  `width` tinyint(2) NOT NULL,
  `top` double(4,2) NOT NULL,
  `name_cct` varchar(110) COLLATE latin1_general_ci NOT NULL,
  `colour` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `catalogue_id_page` tinyint(3) NOT NULL,
  `door` int(3) NOT NULL,
  `tradeable` int(1) NOT NULL,
  `recycleable` int(1) NOT NULL,
  `catalogue_id_index` int(5) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=13583 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of catalogue_items
-- ----------------------------
BEGIN;
INSERT INTO `catalogue_items` VALUES (1, 'Green Parasol', 'Block those rays!', 25, 1, 1, 1, 0.00, 'rare_parasol*0', '#ffffff,#ffffff,#ffffff,#94f718', 80, 0, 1, 1, 1);
INSERT INTO `catalogue_items` VALUES (2, 'floor', 'Floor', 3, 0, 0, 0, 0.00, 'floor', '0', 7, 0, 1, 1, 2);
INSERT INTO `catalogue_items` VALUES (3, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 1', '0', 7, 0, 1, 1, 3);
INSERT INTO `catalogue_items` VALUES (4, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 2', '0', 7, 0, 1, 1, 4);
INSERT INTO `catalogue_items` VALUES (5, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 3', '0', 7, 0, 1, 1, 5);
INSERT INTO `catalogue_items` VALUES (6, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 4', '0', 7, 0, 1, 1, 6);
INSERT INTO `catalogue_items` VALUES (7, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 5', '0', 7, 0, 1, 1, 7);
INSERT INTO `catalogue_items` VALUES (8, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 6', '0', 7, 0, 1, 1, 8);
INSERT INTO `catalogue_items` VALUES (9, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 7', '0', 7, 0, 1, 1, 9);
INSERT INTO `catalogue_items` VALUES (10, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 8', '0', 7, 0, 1, 1, 10);
INSERT INTO `catalogue_items` VALUES (11, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 9', '0', 7, 0, 1, 1, 11);
INSERT INTO `catalogue_items` VALUES (12, 'wallpaper', 'wallpaper', 3, 0, 0, 0, 0.00, 'wallpaper 10', '0', 7, 0, 1, 1, 12);
INSERT INTO `catalogue_items` VALUES (13, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 11', '0', 7, 0, 1, 1, 13);
INSERT INTO `catalogue_items` VALUES (14, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 12', '0', 7, 0, 1, 1, 14);
INSERT INTO `catalogue_items` VALUES (15, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 13', '0', 7, 0, 1, 1, 15);
INSERT INTO `catalogue_items` VALUES (16, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 14', '0', 7, 0, 1, 1, 16);
INSERT INTO `catalogue_items` VALUES (17, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 15', '0', 7, 0, 1, 1, 17);
INSERT INTO `catalogue_items` VALUES (18, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 16', '0', 7, 0, 1, 1, 18);
INSERT INTO `catalogue_items` VALUES (19, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 17', '0', 7, 0, 1, 1, 19);
INSERT INTO `catalogue_items` VALUES (20, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 18', '0', 7, 0, 1, 1, 20);
INSERT INTO `catalogue_items` VALUES (21, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 19', '0', 7, 0, 1, 1, 21);
INSERT INTO `catalogue_items` VALUES (22, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 20', '0', 7, 0, 1, 1, 22);
INSERT INTO `catalogue_items` VALUES (23, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 21', '0', 7, 0, 1, 1, 23);
INSERT INTO `catalogue_items` VALUES (24, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 22', '0', 7, 0, 1, 1, 24);
INSERT INTO `catalogue_items` VALUES (25, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 23', '0', 7, 0, 1, 1, 25);
INSERT INTO `catalogue_items` VALUES (26, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 24', '0', 7, 0, 1, 1, 26);
INSERT INTO `catalogue_items` VALUES (27, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 25', '0', 7, 0, 1, 1, 27);
INSERT INTO `catalogue_items` VALUES (28, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 26', '0', 7, 0, 1, 1, 28);
INSERT INTO `catalogue_items` VALUES (29, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 27', '0', 7, 0, 1, 1, 29);
INSERT INTO `catalogue_items` VALUES (30, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 28', '0', 7, 0, 1, 1, 30);
INSERT INTO `catalogue_items` VALUES (31, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 29', '0', 7, 0, 1, 1, 31);
INSERT INTO `catalogue_items` VALUES (32, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 30', '0', 7, 0, 1, 1, 32);
INSERT INTO `catalogue_items` VALUES (33, 'wallpaper', 'wallpaper', 5, 0, 0, 0, 0.00, 'wallpaper 31', '0', 7, 0, 1, 1, 33);
INSERT INTO `catalogue_items` VALUES (34, 'Basket', 'Night, night', 20, 1, 1, 1, 0.00, 'nest', '0,0,0', 8, 0, 0, 1, 34);
INSERT INTO `catalogue_items` VALUES (35, 'Basket', 'Night, night', 20, 1, 1, 1, 0.00, 'nest', '0,0,0', 8, 0, 0, 1, 35);
INSERT INTO `catalogue_items` VALUES (36, 'Basket', 'Night, night', 20, 1, 1, 1, 0.00, 'nest', '0,0,0', 8, 0, 0, 1, 36);
INSERT INTO `catalogue_items` VALUES (37, 'Doggy Bones', 'Natural nutrition for the barking one', 2, 4, 1, 1, 0.00, 'deal97', '0,0,0', 9, 0, 1, 1, 37);
INSERT INTO `catalogue_items` VALUES (38, 'Sardines', 'Fresh catch of the day', 2, 4, 1, 1, 0.00, 'deal98', '0,0,0', 9, 0, 1, 1, 38);
INSERT INTO `catalogue_items` VALUES (39, 'Cabbage', 'Health food for pets', 2, 4, 1, 1, 0.00, 'deal99', '0,0,0', 9, 0, 1, 1, 39);
INSERT INTO `catalogue_items` VALUES (40, 'T-Bones', 'For the croc!', 2, 4, 1, 1, 0.00, 'deal96', '0,0,0', 9, 0, 1, 1, 40);
INSERT INTO `catalogue_items` VALUES (41, 'Bones Mega Multipack', 'Fantastic 20% Saving!', 1, 4, 1, 1, 0.00, 'petfood1', '0,0,0', 9, 0, 1, 1, 41);
INSERT INTO `catalogue_items` VALUES (42, 'Sardines Mega Multipack', 'Fantastic 20% Saving!', 1, 4, 1, 1, 0.00, 'petfood2', '0,0,0', 9, 0, 1, 1, 42);
INSERT INTO `catalogue_items` VALUES (43, 'Cabbage Mega Multipack', 'Fantastic 20% Saving!', 1, 4, 1, 1, 0.00, 'petfood3', '0,0,0', 9, 0, 1, 1, 43);
INSERT INTO `catalogue_items` VALUES (44, 'T-Bones Mega Multipack', 'Fantastic 20% Saving!', 1, 4, 1, 1, 0.00, 'petfood4', '0,0,0', 9, 0, 1, 1, 44);
INSERT INTO `catalogue_items` VALUES (45, 'Red Water Bowl', 'Aqua unlimited', 2, 4, 1, 1, 0.00, 'waterbowl*1', '#ff3f3f,#ffffff,#ffffff', 9, 0, 1, 1, 45);
INSERT INTO `catalogue_items` VALUES (46, 'Green Water Bowl', 'Aqua unlimited', 2, 4, 1, 1, 0.00, 'waterbowl*2', '#3fff3f,#ffffff,#ffffff', 9, 0, 1, 1, 46);
INSERT INTO `catalogue_items` VALUES (47, 'Yellow Water Bowl', 'Aqua unlimited', 2, 4, 1, 1, 0.00, 'waterbowl*3', '#ffff00,#ffffff,#ffffff', 9, 0, 1, 1, 47);
INSERT INTO `catalogue_items` VALUES (48, 'Blue Water Bowl', 'Aqua unlimited', 2, 4, 1, 1, 0.00, 'waterbowl*4', '#0099ff,#ffffff,#ffffff', 9, 0, 1, 1, 48);
INSERT INTO `catalogue_items` VALUES (49, 'Brown Water Bowl', 'Aqua unlimited', 2, 4, 1, 1, 0.00, 'waterbowl*5', '#bf7f00,#ffffff,#ffffff', 9, 0, 1, 1, 49);
INSERT INTO `catalogue_items` VALUES (50, 'Chocolate Mouse', 'For gourmet kittens', 1, 4, 1, 1, 0.00, 'goodie2', '0,0,0', 9, 0, 1, 1, 50);
INSERT INTO `catalogue_items` VALUES (51, 'Marzipan Man', 'Crunchy Dog Treat', 1, 4, 1, 1, 0.00, 'goodie1', '#ff4cbf,#ffffff', 9, 0, 1, 1, 51);
INSERT INTO `catalogue_items` VALUES (52, 'Marzipan Man', 'Crunchy Dog Treat', 1, 4, 1, 1, 0.00, 'goodie1*1', '#3fffff,#ffffff', 9, 0, 1, 1, 52);
INSERT INTO `catalogue_items` VALUES (53, 'Marzipan Man', 'Crunchy Dog Treat', 1, 4, 1, 1, 0.00, 'goodie1*2', '#ffbf00,#ffffff', 9, 0, 1, 1, 53);
INSERT INTO `catalogue_items` VALUES (54, 'Rubber Ball', 'it\'s bouncy-tastic', 2, 4, 1, 1, 0.00, 'toy1', '#ff0000,#ffff00,#ffffff,#ffffff', 9, 0, 1, 1, 54);
INSERT INTO `catalogue_items` VALUES (55, 'Rubber Ball', 'it\'s bouncy-tastic', 2, 4, 1, 1, 0.00, 'toy1*1', '#ff7f00,#007f00,#ffffff,#ffffff', 9, 0, 1, 1, 55);
INSERT INTO `catalogue_items` VALUES (56, 'Rubber Ball', 'it\'s bouncy-tastic', 2, 4, 1, 1, 0.00, 'toy1*2', '#003f7f,#ff00bf,#ffffff,#ffffff', 9, 0, 1, 1, 56);
INSERT INTO `catalogue_items` VALUES (57, 'Rubber Ball', 'it\'s bouncy-tastic', 2, 4, 1, 1, 0.00, 'toy1*3', '#bf1900,#00bfbf,#ffffff,#ffffff', 9, 0, 1, 1, 57);
INSERT INTO `catalogue_items` VALUES (58, 'Rubber Ball', 'it\'s bouncy-tastic', 2, 4, 1, 1, 0.00, 'toy1*4', '#000000,#ffffff,#ffffff,#ffffff', 9, 0, 1, 1, 58);
INSERT INTO `catalogue_items` VALUES (59, 'Amanjena Table', 'It must be Jinn-er time!', 5, 1, 3, 2, 1.00, 'arabian_bigtb', '0,0,0', 10, 0, 1, 1, 59);
INSERT INTO `catalogue_items` VALUES (60, 'Green Blossom Chair', 'Exotic, soft seating', 5, 2, 1, 1, 1.00, 'arabian_chair', '0,0,0', 10, 0, 1, 1, 60);
INSERT INTO `catalogue_items` VALUES (61, 'Carved Cedar Divider', 'Soft wooden screen', 6, 1, 1, 2, 0.00, 'arabian_divdr', '0,0,0', 10, 0, 1, 1, 61);
INSERT INTO `catalogue_items` VALUES (62, 'Green Blossom Pillow', 'Exotic comfort', 4, 2, 1, 1, 1.00, 'arabian_pllw', '0,0,0', 10, 0, 1, 1, 62);
INSERT INTO `catalogue_items` VALUES (63, 'Berber Kilim Rug', 'Green blossom design', 5, 4, 3, 5, 0.00, 'arabian_rug', '0,0,0', 10, 0, 1, 1, 63);
INSERT INTO `catalogue_items` VALUES (64, 'Ornamental Urn', 'Beware the snake!', 6, 1, 1, 1, 0.00, 'arabian_snake', '0,0,0', 10, 0, 1, 1, 64);
INSERT INTO `catalogue_items` VALUES (65, 'Ancestral Scimitars', 'Not for yielding', 3, 0, 0, 0, 0.00, 'arabian_swords', '0,0,0', 10, 0, 1, 1, 65);
INSERT INTO `catalogue_items` VALUES (66, 'Tea Maker', 'Quench that desert thirst', 8, 1, 1, 1, 0.00, 'arabian_teamk', '0,0,0', 10, 0, 1, 1, 66);
INSERT INTO `catalogue_items` VALUES (67, 'Hexagonal Tea Table', 'Serve up a treat', 4, 1, 1, 1, 0.00, 'arabian_tetbl', '0,0,0', 10, 0, 1, 1, 67);
INSERT INTO `catalogue_items` VALUES (68, 'Mint Tea Tray', 'Tea for every occasion', 3, 1, 1, 1, 0.00, 'arabian_tray1', '0,0,0', 10, 0, 1, 1, 68);
INSERT INTO `catalogue_items` VALUES (69, 'Name', 'Desc', 3, 1, 1, 1, 0.00, 'arabian_tray2', '0,0,0', 10, 0, 1, 1, 69);
INSERT INTO `catalogue_items` VALUES (70, 'Sweets Tray', 'Indulge yourself!', 3, 1, 1, 1, 0.00, 'arabian_tray3', '0,0,0', 10, 0, 1, 1, 70);
INSERT INTO `catalogue_items` VALUES (71, 'Fruit Tray', 'Sweet, juicy and ripe', 3, 1, 1, 1, 0.00, 'arabian_tray4', '0,0,0', 10, 0, 1, 1, 71);
INSERT INTO `catalogue_items` VALUES (72, 'Arabian Window Frame', 'Arabian days and nights', 3, 0, 0, 0, 0.00, 'arabian_wndw', '0,0,0', 10, 0, 1, 1, 72);
INSERT INTO `catalogue_items` VALUES (73, 'Candle Tray', 'For those Arabian nights', 3, 1, 1, 1, 0.20, 'arabian_tray2', '0,0,0', 10, 0, 1, 1, 73);
INSERT INTO `catalogue_items` VALUES (74, 'AlhambraTrax 1', 'Music of the Arabian night!', 3, 1, 1, 1, 0.20, 'sound_set_62', '0,0,0', 10, 0, 1, 1, 74);
INSERT INTO `catalogue_items` VALUES (75, 'AlhambraTrax 2', 'Desert hits by the oasis!', 3, 1, 1, 1, 0.20, 'sound_set_63', '0,0,0', 10, 0, 1, 1, 75);
INSERT INTO `catalogue_items` VALUES (76, 'AlhambraTrax 3', 'Make a little Jinn-gle!', 3, 1, 1, 1, 0.20, 'sound_set_64', '0,0,0', 10, 0, 1, 1, 76);
INSERT INTO `catalogue_items` VALUES (77, 'Marble Tile', 'Slick sophistication, don\'t slip!', 1, 4, 1, 1, 1.00, 'tile_marble', '0,0,0', 10, 0, 1, 1, 77);
INSERT INTO `catalogue_items` VALUES (78, 'Red Tile', 'Ideal for your downtown promenades & piazzas', 1, 4, 1, 1, 1.00, 'tile_brown', '0,0,0', 10, 0, 1, 1, 78);
INSERT INTO `catalogue_items` VALUES (79, 'Area Quest Desk', 'For the true Habbo Scholars', 15, 1, 2, 1, 0.00, 'silo_studydesk', '0,0,0', 11, 0, 1, 1, 79);
INSERT INTO `catalogue_items` VALUES (80, 'Double Bed', 'Plain and simple x2', 3, 3, 2, 3, 1.50, 'bed_silo_two', '0,0,0', 11, 0, 1, 1, 80);
INSERT INTO `catalogue_items` VALUES (81, 'Single Bed', 'Plain and simple', 3, 3, 1, 3, 1.50, 'bed_silo_one', '0,0,0', 11, 0, 1, 1, 81);
INSERT INTO `catalogue_items` VALUES (82, 'Bookcase', 'For nic naks and art deco books', 3, 1, 2, 1, 2.85, 'shelves_silo', '0,0,0', 11, 0, 1, 1, 82);
INSERT INTO `catalogue_items` VALUES (83, 'Two-Seater Sofa', 'Cushioned, understated comfort', 3, 2, 2, 1, 1.00, 'sofa_silo', '#ffffff,#ffffff,#ffffff,#ffffff,#A2C6C8,#A2C6C8,#A2C6C8,#A2C6C8', 11, 0, 1, 1, 83);
INSERT INTO `catalogue_items` VALUES (84, 'Armchair', 'Large, but worth it', 3, 2, 1, 1, 1.00, 'sofachair_silo', '#ffffff,#ffffff,#A2C6C8,#A2C6C8,#ffffff', 11, 0, 1, 1, 84);
INSERT INTO `catalogue_items` VALUES (85, 'Occasional Table', 'For those random moments', 1, 1, 1, 1, 1.00, 'table_silo_small', '#ffffff,#A2C6C8,#ffffff,#A2C6C8', 11, 0, 1, 1, 85);
INSERT INTO `catalogue_items` VALUES (86, 'Gate (lockable)', 'Form following function', 6, 1, 1, 1, 0.00, 'divider_silo3', '#ffffff,#ffffff,#ffffff,#A2C6C8', 11, 1, 1, 1, 86);
INSERT INTO `catalogue_items` VALUES (87, 'Screen', 'Stylish sectioning', 3, 1, 2, 1, 1.20, 'divider_silo2', '0,0,0', 11, 0, 1, 1, 87);
INSERT INTO `catalogue_items` VALUES (88, 'Corner Shelf', 'Neat and natty', 3, 1, 1, 1, 1.20, 'divider_silo1', '#ffffff,#A2C6C8,0,#A2C6C8', 11, 0, 1, 1, 88);
INSERT INTO `catalogue_items` VALUES (89, 'Dining Chair', 'Keep it simple', 3, 2, 1, 1, 1.00, 'chair_silo', '#ffffff,#ffffff,#A2C6C8,#A2C6C8,#ffffff', 11, 0, 1, 1, 89);
INSERT INTO `catalogue_items` VALUES (90, 'Safe Minibar', 'Totally shatter-proof!', 3, 1, 1, 1, 0.00, 'safe_silo', '#ffffff,#A2C6C8,#ffffff', 11, 0, 1, 1, 90);
INSERT INTO `catalogue_items` VALUES (91, 'Bar Stool', 'Practical and convenient', 3, 2, 1, 1, 1.50, 'barchair_silo', '#ffffff,#A2C6C8,#ffffff', 11, 0, 1, 1, 91);
INSERT INTO `catalogue_items` VALUES (92, 'Coffee Table', 'Wipe clean and unobtrusive', 3, 1, 2, 2, 0.80, 'table_silo_med', '#ffffff,#8FAEAF', 11, 0, 1, 1, 92);
INSERT INTO `catalogue_items` VALUES (93, 'The Wheel of Destiny!', 'So you gotta ask yourself \"Do I feel lucky?\"', 10, 0, 0, 0, 0.00, 'habbowheel', '0,0,0', 12, 0, 1, 1, 93);
INSERT INTO `catalogue_items` VALUES (94, 'Digital TV', 'Bang up to date', 6, 1, 1, 3, 0.00, 'tv_luxus', '0,0,0', 12, 0, 1, 1, 94);
INSERT INTO `catalogue_items` VALUES (95, 'Large TV', 'For family viewing', 4, 1, 1, 2, 0.00, 'wood_tv', '0,0,0', 12, 0, 1, 1, 95);
INSERT INTO `catalogue_items` VALUES (96, 'Portable TV', 'Don\'t miss those soaps', 3, 1, 1, 1, 0.00, 'red_tv', '0,0,0', 12, 0, 1, 1, 96);
INSERT INTO `catalogue_items` VALUES (97, 'Pad of stickies', 'Pad of stickies', 3, 0, 0, 0, 0.00, 'post.it', '0,0,0', 12, 0, 1, 1, 97);
INSERT INTO `catalogue_items` VALUES (98, 'Pizza Box', 'You dirty Habbo', 3, 1, 1, 1, 0.00, 'pizza', '0,0,0', 12, 0, 1, 1, 98);
INSERT INTO `catalogue_items` VALUES (99, 'Empty Cans', 'Are you a slob too?', 3, 1, 1, 1, 0.00, 'drinks', '0,0,0', 12, 0, 1, 1, 99);
INSERT INTO `catalogue_items` VALUES (100, 'Empty Spinning Bottle', 'For interesting games!', 3, 4, 1, 1, 0.00, 'bottle', '0,0,0', 12, 0, 1, 1, 100);
INSERT INTO `catalogue_items` VALUES (101, 'Holo-dice', 'What\'s your lucky number?', 6, 1, 1, 1, 0.00, 'edice', '0,0,0', 12, 0, 1, 1, 101);
INSERT INTO `catalogue_items` VALUES (102, 'Cake', 'Save me a slice!', 4, 1, 1, 1, 0.00, 'habbocake', '0,0,0', 12, 0, 1, 1, 102);
INSERT INTO `catalogue_items` VALUES (103, 'Menorah', 'Light up your room', 3, 1, 1, 1, 0.00, 'menorah', '0,0,0', 12, 0, 1, 1, 103);
INSERT INTO `catalogue_items` VALUES (104, 'Squidgy Bunny', 'Yours to cuddle up to', 3, 1, 1, 1, 0.00, 'bunny', '0,0,0', 12, 0, 1, 1, 104);
INSERT INTO `catalogue_items` VALUES (105, 'Mummy', 'Beware the curse...', 3, 0, 0, 0, 0.00, 'poster 44', '0,0,0', 12, 0, 1, 1, 105);
INSERT INTO `catalogue_items` VALUES (106, 'White Candle Plate', 'Simple but stylish', 3, 1, 1, 1, 0.00, 'wcandleset', '0,0,0', 12, 0, 1, 1, 106);
INSERT INTO `catalogue_items` VALUES (107, 'Red Candle Plate', 'Simple but stylish', 3, 1, 1, 1, 0.00, 'rcandleset', '0,0,0', 12, 0, 1, 1, 107);
INSERT INTO `catalogue_items` VALUES (108, 'Joint of Ham', 'Tuck in', 3, 1, 1, 1, 0.00, 'ham', '0,0,0', 12, 0, 1, 1, 108);
INSERT INTO `catalogue_items` VALUES (109, 'Lert', 'Set it off.', 5, 1, 1, 1, 0.00, 'hockey_light', '0,0,0', 12, 0, 1, 1, 109);
INSERT INTO `catalogue_items` VALUES (110, 'Yellow Maze Barrier', 'No escape this way!', 25, 1, 1, 2, 0.00, 'barrier*1', '0,0,#FFC927,#FFC927', 12, 0, 1, 1, 110);
INSERT INTO `catalogue_items` VALUES (111, 'White Road Barrier', 'No trespassing, please!', 25, 1, 1, 2, 0.00, 'barrier*2', '0,0,#FFC927,#FFC927', 12, 0, 1, 1, 111);
INSERT INTO `catalogue_items` VALUES (112, 'Red Road Barrier', 'No trespassing, please!', 25, 1, 1, 2, 0.00, 'barrier*3', '0,0,#FFC927,#FFC927', 12, 0, 1, 1, 112);
INSERT INTO `catalogue_items` VALUES (113, 'Classic Traffic Light', 'Chill and wait your turn!', 25, 1, 1, 1, 0.00, 'traffic_light', '0,#D91E26,0', 12, 0, 1, 1, 113);
INSERT INTO `catalogue_items` VALUES (114, 'Blue Traffic Light', 'Chill and wait your turn!', 25, 1, 1, 1, 0.00, 'traffic_light', '0,#D91E26,0', 12, 0, 1, 1, 114);
INSERT INTO `catalogue_items` VALUES (115, 'Purple Traffic Light', 'Chill and wait your turn!', 25, 1, 1, 1, 0.00, 'traffic_light', '0,#D91E26,0', 12, 0, 1, 1, 115);
INSERT INTO `catalogue_items` VALUES (116, 'Yellow Traffic Light', 'Chill and wait your turn!', 25, 1, 1, 1, 0.00, 'traffic_light', '0,#D91E26,0', 12, 0, 1, 1, 116);
INSERT INTO `catalogue_items` VALUES (117, 'White Traffic Light', 'Chill and wait your turn!', 25, 1, 1, 1, 0.00, 'traffic_light', '0,#D91E26,0', 12, 0, 1, 1, 117);
INSERT INTO `catalogue_items` VALUES (118, 'Red Traffic Light', 'Chill and wait your turn!', 25, 1, 1, 1, 0.00, 'traffic_light', '0,#D91E26,0', 12, 0, 1, 1, 118);
INSERT INTO `catalogue_items` VALUES (119, 'Dragon Screen', 'For your great wall', 8, 1, 1, 1, 0.00, 'wall_china', '0,0,0', 13, 0, 1, 1, 119);
INSERT INTO `catalogue_items` VALUES (120, 'Dragon Screen', 'Firm, fireproof foundation', 8, 1, 1, 1, 0.00, 'corner_china', '0,0,0', 13, 0, 1, 1, 120);
INSERT INTO `catalogue_items` VALUES (121, 'Chinese Lacquer Bookshelf', 'To hold the mind\'s treasures', 8, 2, 2, 1, 0.00, 'china_shelve', '0,0,0', 13, 0, 1, 1, 121);
INSERT INTO `catalogue_items` VALUES (122, 'Chinese Lacquer Table', 'Exotic and classy', 5, 1, 1, 1, 0.80, 'china_table', '0,0,0', 13, 0, 1, 1, 122);
INSERT INTO `catalogue_items` VALUES (123, 'Chinese Lacquer Chair', 'The elegant beauty of tradition', 5, 2, 1, 1, 1.00, 'chair_china', '0,0,0', 13, 0, 1, 1, 123);
INSERT INTO `catalogue_items` VALUES (124, 'Calligraphy poster', 'chinese calligraphy', 3, 0, 0, 0, 0.00, 'poster 57', '0,0,0', 13, 0, 1, 1, 124);
INSERT INTO `catalogue_items` VALUES (125, 'Red knots poster', 'whish you luck', 5, 0, 0, 0, 0.00, 'poster 58', '0,0,0', 13, 0, 1, 1, 125);
INSERT INTO `catalogue_items` VALUES (126, 'Chinese Sofa', 'Seating,Oriental style!', 10, 2, 3, 1, 1.00, 'cn_sofa', '0,0,0', 13, 0, 1, 1, 126);
INSERT INTO `catalogue_items` VALUES (127, 'Lantern', 'Light of the East', 15, 1, 1, 1, 1.00, 'cn_lamp', '0,0,0', 13, 0, 1, 1, 127);
INSERT INTO `catalogue_items` VALUES (128, 'Bubble Bath', 'The ultimate in pampering', 6, 2, 1, 2, 1.20, 'bath', '0,0,0', 14, 0, 1, 1, 128);
INSERT INTO `catalogue_items` VALUES (129, 'Sink', 'Hot and cold thrown in for no charge', 3, 1, 1, 1, 0.00, 'sink', '0,0,0', 14, 0, 1, 1, 129);
INSERT INTO `catalogue_items` VALUES (130, 'Rubber Duck', 'Every bather needs one', 1, 1, 1, 1, 0.00, 'duck', '0,0,0', 14, 0, 1, 1, 130);
INSERT INTO `catalogue_items` VALUES (131, 'Loo Seat', 'Loo Seat', 4, 2, 1, 1, 1.20, 'toilet', '0,0,0', 14, 0, 1, 1, 131);
INSERT INTO `catalogue_items` VALUES (132, 'Loo Seat', 'Loo Seat', 4, 2, 1, 1, 1.20, 'toilet_red', '0,0,0', 14, 0, 1, 1, 132);
INSERT INTO `catalogue_items` VALUES (133, 'Loo Seat', 'Loo Seat', 4, 2, 1, 1, 1.20, 'toilet_yell', '0,0,0', 14, 0, 1, 1, 133);
INSERT INTO `catalogue_items` VALUES (134, 'Floor Tiles', 'In a choice of colours', 3, 4, 4, 4, 0.00, 'tile', '0,0,0', 14, 0, 1, 1, 134);
INSERT INTO `catalogue_items` VALUES (135, 'Floor Tiles', 'In a choice of colours', 3, 4, 4, 4, 0.00, 'tile_red', '0,0,0', 14, 0, 1, 1, 135);
INSERT INTO `catalogue_items` VALUES (136, 'Floor Tiles', 'In a choice of colours', 3, 4, 4, 4, 0.00, 'tile_yell', '0,0,0', 14, 0, 1, 1, 136);
INSERT INTO `catalogue_items` VALUES (137, 'Candy Bar', 'For cute constructions', 3, 1, 2, 1, 1.00, 'bardesk_polyfon*5', '#ffffff,#ffffff,#FF9BBD,#FF9BBD', 15, 0, 1, 1, 137);
INSERT INTO `catalogue_items` VALUES (138, 'Candy Corner', 'For sweet corners!', 3, 1, 1, 1, 1.00, 'bardeskcorner_polyfon*5', '#ffffff,#FF9BBD', 15, 0, 1, 1, 138);
INSERT INTO `catalogue_items` VALUES (139, 'Candy Hatch (lockable)', 'Keep the Pink in!', 6, 1, 1, 1, 0.00, 'divider_poly3*5', '#ffffff,#ffffff,#ffffff,#EE7EA4,#EE7EA4', 15, 1, 1, 1, 139);
INSERT INTO `catalogue_items` VALUES (140, 'Armchair', 'Think pink', 3, 2, 1, 1, 1.20, 'sofachair_polyfon_girl', '#ffffff,#ffffff,#EE7EA4,#EE7EA4', 15, 0, 1, 1, 140);
INSERT INTO `catalogue_items` VALUES (141, 'Two-seater Sofa', 'Romantic pink for two', 4, 2, 2, 1, 1.20, 'sofa_polyfon_girl', '#ffffff,#ffffff,#ffffff,#ffffff,#EE7EA4,#EE7EA4,#EE7EA4,#EE7EA4', 15, 0, 1, 1, 141);
INSERT INTO `catalogue_items` VALUES (142, 'Pink Faux-Fur', 'Bear Rug Cute', 4, 4, 2, 3, 0.00, 'carpet_polar*1', '#ffbbcf,#ffbbcf,#ffddef', 15, 0, 1, 1, 142);
INSERT INTO `catalogue_items` VALUES (143, 'Single Bed', 'Snuggle down in princess pink', 3, 3, 1, 3, 1.50, 'bed_polyfon_girl_one', '#ffffff,#ffffff,#ffffff,#EE7EA4,#EE7EA4', 15, 0, 1, 1, 143);
INSERT INTO `catalogue_items` VALUES (144, 'Double Bed', 'Snuggle down in princess pink', 4, 3, 2, 3, 1.50, 'bed_polyfon_girl', '#ffffff,#ffffff,#EE7EA4,#EE7EA4', 15, 0, 1, 1, 144);
INSERT INTO `catalogue_items` VALUES (145, 'Camera', 'Smile!', 10, 1, 1, 1, 0.00, 'camera', '0,0,0', 16, 0, 1, 1, 145);
INSERT INTO `catalogue_items` VALUES (146, 'Film', 'Film for five photos', 6, 0, 0, 0, 0.00, 'photo_film', '0,0,0', 16, 0, 0, 0, 146);
INSERT INTO `catalogue_items` VALUES (147, 'Union Jack', 'The UK flag', 3, 0, 0, 0, 0.00, 'poster 500', '0,0,0', 17, 0, 1, 1, 147);
INSERT INTO `catalogue_items` VALUES (148, 'Jolly Roger', 'For pirates everywhere', 3, 0, 0, 0, 0.00, 'poster 501', '0,0,0', 17, 0, 1, 1, 148);
INSERT INTO `catalogue_items` VALUES (149, 'The Stars and Stripes', 'The US flag', 3, 0, 0, 0, 0.00, 'poster 502', '0,0,0', 17, 0, 1, 1, 149);
INSERT INTO `catalogue_items` VALUES (150, 'The Swiss flag', 'There\'s no holes in this...', 3, 0, 0, 0, 0.00, 'poster 503', '0,0,0', 17, 0, 1, 1, 150);
INSERT INTO `catalogue_items` VALUES (151, 'The Bundesflagge', 'The German flag', 3, 0, 0, 0, 0.00, 'poster 504', '0,0,0', 17, 0, 1, 1, 151);
INSERT INTO `catalogue_items` VALUES (152, 'The Maple Leaf', 'The Canadian flag', 3, 0, 0, 0, 0.00, 'poster 505', '0,0,0', 17, 0, 1, 1, 152);
INSERT INTO `catalogue_items` VALUES (153, 'The flag of Finland', 'To \'Finnish\' your decor...', 3, 0, 0, 0, 0.00, 'poster 506', '0,0,0', 17, 0, 1, 1, 153);
INSERT INTO `catalogue_items` VALUES (154, 'The French Tricolore', 'The French flag', 3, 0, 0, 0, 0.00, 'poster 507', '0,0,0', 17, 0, 1, 1, 154);
INSERT INTO `catalogue_items` VALUES (155, 'The Spanish flag', 'The flag of Spain', 3, 0, 0, 0, 0.00, 'poster 508', '0,0,0', 17, 0, 1, 1, 155);
INSERT INTO `catalogue_items` VALUES (156, 'The Jamaican flag', 'The flag of Jamaica', 3, 0, 0, 0, 0.00, 'poster 509', '0,0,0', 17, 0, 1, 1, 156);
INSERT INTO `catalogue_items` VALUES (157, 'The Italian flag', 'The flag of Italy', 3, 0, 0, 0, 0.00, 'poster 510', '0,0,0', 17, 0, 1, 1, 157);
INSERT INTO `catalogue_items` VALUES (158, 'The Dutch flag', 'The flag of The Netherlands', 3, 0, 0, 0, 0.00, 'poster 511', '0,0,0', 17, 0, 1, 1, 158);
INSERT INTO `catalogue_items` VALUES (159, 'The Irish flag', 'The flag of Ireland', 3, 0, 0, 0, 0.00, 'poster 512', '0,0,0', 17, 0, 1, 1, 159);
INSERT INTO `catalogue_items` VALUES (160, 'The Australian flag', 'Aussies rule!', 3, 0, 0, 0, 0.00, 'poster 513', '0,0,0', 17, 0, 1, 1, 160);
INSERT INTO `catalogue_items` VALUES (161, 'The EU flag', 'Be proud to be in the Union!', 3, 0, 0, 0, 0.00, 'poster 514', '0,0,0', 17, 0, 1, 1, 161);
INSERT INTO `catalogue_items` VALUES (162, 'The Swedish flag', 'Waved by Swedes everywhere', 3, 0, 0, 0, 0.00, 'poster 515', '0,0,0', 17, 0, 1, 1, 162);
INSERT INTO `catalogue_items` VALUES (163, 'The English flag', 'Eng-er-land', 3, 0, 0, 0, 0.00, 'poster 516', '0,0,0', 17, 0, 1, 1, 163);
INSERT INTO `catalogue_items` VALUES (164, 'The Scottish flag', 'Where\'s your kilt?', 3, 0, 0, 0, 0.00, 'poster 517', '0,0,0', 17, 0, 1, 1, 164);
INSERT INTO `catalogue_items` VALUES (165, 'The Welsh flag', 'A fiery dragon for your wall', 3, 0, 0, 0, 0.00, 'poster 518', '0,0,0', 17, 0, 1, 1, 165);
INSERT INTO `catalogue_items` VALUES (166, 'The Rainbow Flag', 'Every colour for everyone', 3, 0, 0, 0, 0.00, 'poster 520', '0,0,0', 17, 0, 1, 1, 166);
INSERT INTO `catalogue_items` VALUES (167, 'Flag of Brazil', 'Ordem e progresso', 3, 0, 0, 0, 0.00, 'poster 521', '0,0,0', 17, 0, 1, 1, 167);
INSERT INTO `catalogue_items` VALUES (168, 'The flag of Japan', 'The flag of Japan', 3, 0, 0, 0, 0.00, 'poster 522', '0,0,0', 17, 0, 1, 1, 168);
INSERT INTO `catalogue_items` VALUES (169, 'The flag of India', 'The flag of India', 3, 0, 0, 0, 0.00, 'poster 523', '0,0,0', 17, 0, 1, 1, 169);
INSERT INTO `catalogue_items` VALUES (170, 'Comedy Poster', 'The Noble and Silver Show', 3, 0, 0, 0, 0.00, 'poster 1', '0,0,0', 18, 0, 1, 1, 170);
INSERT INTO `catalogue_items` VALUES (171, 'Carrot Plaque', 'Take pride in your veg!', 3, 0, 0, 0, 0.00, 'poster 2', '0,0,0', 18, 0, 1, 1, 171);
INSERT INTO `catalogue_items` VALUES (172, 'Fish Plaque', 'Smells fishy, looks cool', 3, 0, 0, 0, 0.00, 'poster 3', '0,0,0', 18, 0, 1, 1, 172);
INSERT INTO `catalogue_items` VALUES (173, 'Bear Plaque', 'Fake of course!', 3, 0, 0, 0, 0.00, 'poster 4', '0,0,0', 18, 0, 1, 1, 173);
INSERT INTO `catalogue_items` VALUES (174, 'Duck Poster', 'Quacking good design!', 3, 0, 0, 0, 0.00, 'poster 5', '0,0,0', 18, 0, 1, 1, 174);
INSERT INTO `catalogue_items` VALUES (175, 'Abstract Poster', 'But is it the right way up?', 3, 0, 0, 0, 0.00, 'poster 6', '0,0,0', 18, 0, 1, 1, 175);
INSERT INTO `catalogue_items` VALUES (176, 'Hammer Cabinet', 'For emergencies only', 3, 0, 0, 0, 0.00, 'poster 7', '0,0,0', 18, 0, 1, 1, 176);
INSERT INTO `catalogue_items` VALUES (177, 'Habbo Colours', 'Habbos come in all colours', 3, 0, 0, 0, 0.00, 'poster 8', '0,0,0', 18, 0, 1, 1, 177);
INSERT INTO `catalogue_items` VALUES (178, 'Rainforest Poster', 'Do your bit for the environment', 3, 0, 0, 0, 0.00, 'poster 9', '0,0,0', 18, 0, 1, 1, 178);
INSERT INTO `catalogue_items` VALUES (179, 'Lapland Poster', 'Beautiful sunset', 3, 0, 0, 0, 0.00, 'poster 10', '0,0,0', 18, 0, 1, 1, 179);
INSERT INTO `catalogue_items` VALUES (180, 'Certificate', 'I obey the Habbo way!', 3, 0, 0, 0, 0.00, 'poster 11', '0,0,0', 18, 0, 1, 1, 180);
INSERT INTO `catalogue_items` VALUES (181, 'Lapland Poster', 'a beautiful sunset', 3, 0, 0, 0, 0.00, 'poster 12', '0,0,0', 18, 0, 1, 1, 181);
INSERT INTO `catalogue_items` VALUES (182, 'BW Skyline Poster', 'Arty black and white', 3, 0, 0, 0, 0.00, 'poster 13', '0,0,0', 18, 0, 1, 1, 182);
INSERT INTO `catalogue_items` VALUES (183, 'Fox Poster', 'A cunning painting', 3, 0, 0, 0, 0.00, 'poster 14', '0,0,0', 18, 0, 1, 1, 183);
INSERT INTO `catalogue_items` VALUES (184, 'Himalayas Poster', 'Marvellous mountains', 3, 0, 0, 0, 0.00, 'poster 15', '0,0,0', 18, 0, 1, 1, 184);
INSERT INTO `catalogue_items` VALUES (185, 'Bars', 'Added security', 3, 0, 0, 0, 0.00, 'poster 16', '0,0,0', 18, 0, 1, 1, 185);
INSERT INTO `catalogue_items` VALUES (186, 'Butterfly Cabinet 1', 'Beautiful reproduction butterfly', 3, 0, 0, 0, 0.00, 'poster 17', '0,0,0', 18, 0, 1, 1, 186);
INSERT INTO `catalogue_items` VALUES (187, 'Butterfly Cabinet 2', 'Beautiful reproduction butterfly', 3, 0, 0, 0, 0.00, 'poster 18', '0,0,0', 18, 0, 1, 1, 187);
INSERT INTO `catalogue_items` VALUES (188, 'Hole In The Wall', 'Trying to get in or out?', 3, 0, 0, 0, 0.00, 'poster 19', '0,0,0', 18, 0, 1, 1, 188);
INSERT INTO `catalogue_items` VALUES (189, 'Siva Poster', 'The Auspicious One', 3, 0, 0, 0, 0.00, 'poster 32', '0,0,0', 18, 0, 1, 1, 189);
INSERT INTO `catalogue_items` VALUES (190, 'Save the Panda', 'We can\'t bear to lose them', 3, 0, 0, 0, 0.00, 'poster 33', '0,0,0', 18, 0, 1, 1, 190);
INSERT INTO `catalogue_items` VALUES (191, 'Scamme\'d', 'Habbo-punk for the never-agreeing', 3, 0, 0, 0, 0.00, 'poster 34', '0,0,0', 18, 0, 1, 1, 191);
INSERT INTO `catalogue_items` VALUES (192, 'The Habbo Babes 1', 'The Hotel\'s girlband. Dream on!', 3, 0, 0, 0, 0.00, 'poster 35', '0,0,0', 18, 0, 1, 1, 192);
INSERT INTO `catalogue_items` VALUES (193, 'The Habbo Babes 2', 'The Hotels girlband. Dream on!', 3, 0, 0, 0, 0.00, 'poster 36', '0,0,0', 18, 0, 1, 1, 193);
INSERT INTO `catalogue_items` VALUES (194, 'The Habbo Babes 3', 'The Hotels girlband. Dream on!', 3, 0, 0, 0, 0.00, 'poster 37', '0,0,0', 18, 0, 1, 1, 194);
INSERT INTO `catalogue_items` VALUES (195, 'Smiling Headbangerz', 'For really TOUGH Habbos!', 3, 0, 0, 0, 0.00, 'poster 38', '0,0,0', 18, 0, 1, 1, 195);
INSERT INTO `catalogue_items` VALUES (196, 'Screaming Furnies', 'The rock masters of virtual music', 3, 0, 0, 0, 0.00, 'poster 39', '0,0,0', 18, 0, 1, 1, 196);
INSERT INTO `catalogue_items` VALUES (197, 'Bonnie Blonde', 'The one and only. Adore her!', 3, 0, 0, 0, 0.00, 'poster 40', '0,0,0', 18, 0, 1, 1, 197);
INSERT INTO `catalogue_items` VALUES (198, 'Habbo Golden Record', 'For the best music-makers', 3, 0, 0, 0, 0.00, 'poster 41', '0,0,0', 18, 0, 1, 1, 198);
INSERT INTO `catalogue_items` VALUES (199, 'Tree on the beach', 'Relaxing scene', 3, 0, 0, 0, 0.00, 'poster 55', '0,0,0', 18, 0, 1, 1, 199);
INSERT INTO `catalogue_items` VALUES (200, 'Comedy Poster', 'The Noble and Silver Show', 3, 0, 0, 0, 0.00, 'poster 1000', '0,0,0', 18, 0, 1, 1, 200);
INSERT INTO `catalogue_items` VALUES (201, 'Prince Charles Poster', 'even walls have ears', 3, 0, 0, 0, 0.00, 'poster 1001', '0,0,0', 18, 0, 1, 1, 201);
INSERT INTO `catalogue_items` VALUES (202, 'Queen Mum Poster', 'aw, bless...', 3, 0, 0, 0, 0.00, 'poster 1002', '0,0,0', 18, 0, 1, 1, 202);
INSERT INTO `catalogue_items` VALUES (203, 'UK Map', 'get the lovely isles on your walls', 3, 0, 0, 0, 0.00, 'poster 1003', '0,0,0', 18, 0, 1, 1, 203);
INSERT INTO `catalogue_items` VALUES (204, 'Eid Mubarak Poster', 'Celebrate with us', 3, 0, 0, 0, 0.00, 'poster 1004', '0,0,0', 18, 0, 1, 1, 204);
INSERT INTO `catalogue_items` VALUES (205, 'Johnny Squabble', 'The muscly movie hero', 3, 0, 0, 0, 0.00, 'poster 1005', '0,0,0', 18, 0, 1, 1, 205);
INSERT INTO `catalogue_items` VALUES (206, 'Hoot Poster', 'The eyes follow you...', 3, 0, 0, 0, 0.00, 'poster 1006', '0,0,0', 18, 0, 1, 1, 206);
INSERT INTO `catalogue_items` VALUES (207, 'Suomen kartta', 'Suomen kartta', 3, 0, 0, 0, 0.00, 'poster 2000', '0,0,0', 18, 0, 1, 1, 207);
INSERT INTO `catalogue_items` VALUES (208, 'SeinNightitititititdiskotappaja', 'Perinteinen ryijy,', 3, 0, 0, 0, 0.00, 'poster 2001', '0,0,0', 18, 0, 1, 1, 208);
INSERT INTO `catalogue_items` VALUES (209, 'Urho Kaleva Kekkonen', 'Presidentin muotokuva', 3, 0, 0, 0, 0.00, 'poster 2002', '0,0,0', 18, 0, 1, 1, 209);
INSERT INTO `catalogue_items` VALUES (210, 'Dodgy Geezer', 'Would you trust this man?', 3, 0, 0, 0, 0.00, 'poster 2003', '0,0,0', 18, 0, 1, 1, 210);
INSERT INTO `catalogue_items` VALUES (211, 'Rasta Poster', 'irie!', 3, 0, 0, 0, 0.00, 'poster 2004', '0,0,0', 18, 0, 1, 1, 211);
INSERT INTO `catalogue_items` VALUES (212, 'DJ Throne', 'He is the magic Habbo', 3, 0, 0, 0, 0.00, 'poster 2006', '0,0,0', 18, 0, 1, 1, 212);
INSERT INTO `catalogue_items` VALUES (213, 'The Father Of Habbo', 'The legendary founder of the Hotel', 3, 0, 0, 0, 0.00, 'poster 2007', '0,0,0', 18, 0, 1, 1, 213);
INSERT INTO `catalogue_items` VALUES (214, 'Habbo Leap Day Poster', 'Once every four Habbo years!', 3, 0, 0, 0, 0.00, 'poster 2008', '0,0,0', 18, 0, 1, 1, 214);
INSERT INTO `catalogue_items` VALUES (215, 'Glass shelf', 'Translucent beauty', 4, 1, 2, 1, 0.00, 'glass_shelf', '0,0,0', 19, 0, 1, 1, 215);
INSERT INTO `catalogue_items` VALUES (216, 'Glass sofa', 'Translucent beauty', 4, 2, 2, 1, 1.20, 'glass_sofa', '#ffffff,#ABD0D2,#ABD0D2,#ffffff,#ffffff,#ABD0D2,#ffffff,#ABD0D2', 19, 0, 1, 1, 216);
INSERT INTO `catalogue_items` VALUES (217, 'Glass table', 'Translucent beauty', 4, 1, 2, 2, 0.80, 'glass_table', '#ffffff,#ABD0D2,#ABD0D2,#ffffff', 19, 0, 1, 1, 217);
INSERT INTO `catalogue_items` VALUES (218, 'Glass chair', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_chair', '#ffffff,#ABD0D2,#ABD0D2,#ffffff', 19, 0, 1, 1, 218);
INSERT INTO `catalogue_items` VALUES (219, 'Glass stool', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_stool', '#ffffff,#ABD0D2,#ABD0D2,#ffffff', 19, 0, 1, 1, 219);
INSERT INTO `catalogue_items` VALUES (220, 'Glass sofa', 'Translucent beauty', 4, 2, 2, 1, 1.20, 'glass_sofa*2', '#ffffff,#525252,#525252,#ffffff,#ffffff,#525252,#ffffff,#525252', 19, 0, 1, 1, 220);
INSERT INTO `catalogue_items` VALUES (221, 'Glass table', 'Translucent beauty', 4, 1, 2, 2, 0.80, 'glass_table*2', '#ffffff,#525252,#525252,#ffffff', 19, 0, 1, 1, 221);
INSERT INTO `catalogue_items` VALUES (222, 'Glass chair', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_chair*2', '#ffffff,#525252,#525252,#ffffff', 19, 0, 1, 1, 222);
INSERT INTO `catalogue_items` VALUES (223, 'Glass stool', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_stool*2', '#ffffff,#525252,#525252,#ffffff', 19, 0, 1, 1, 223);
INSERT INTO `catalogue_items` VALUES (224, 'Glass sofa', 'Translucent beauty', 4, 2, 2, 1, 1.20, 'glass_sofa*3', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 19, 0, 1, 1, 224);
INSERT INTO `catalogue_items` VALUES (225, 'Glass table', 'Translucent beauty', 4, 1, 2, 2, 0.80, 'glass_table*3', '#ffffff,#ffffff,#ffffff,#ffffff', 19, 0, 1, 1, 225);
INSERT INTO `catalogue_items` VALUES (226, 'Glass chair', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_chair*3', '#ffffff,#ffffff,#ffffff,#ffffff', 19, 0, 1, 1, 226);
INSERT INTO `catalogue_items` VALUES (227, 'Glass stool', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_stool*3', '#ffffff,#ffffff,#ffffff,#ffffff', 19, 0, 1, 1, 227);
INSERT INTO `catalogue_items` VALUES (228, 'Glass sofa', 'Translucent beauty', 4, 2, 2, 1, 1.20, 'glass_sofa*4', '#ffffff,#F7EBBC,#F7EBBC,#ffffff,#ffffff,#F7EBBC,#ffffff,#F7EBBC', 19, 0, 1, 1, 228);
INSERT INTO `catalogue_items` VALUES (229, 'Glass table', 'Translucent beauty', 4, 1, 2, 2, 0.80, 'glass_table*4', '#ffffff,#F7EBBC,#F7EBBC,#ffffff', 19, 0, 1, 1, 229);
INSERT INTO `catalogue_items` VALUES (230, 'Glass chair', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_chair*4', '#ffffff,#F7EBBC,#F7EBBC,#ffffff', 19, 0, 1, 1, 230);
INSERT INTO `catalogue_items` VALUES (231, 'Glass stool', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_stool*4', '#ffffff,#F7EBBC,#F7EBBC,#ffffff', 19, 0, 1, 1, 231);
INSERT INTO `catalogue_items` VALUES (232, 'Glass sofa', 'Translucent beauty', 4, 2, 2, 1, 1.20, 'glass_sofa*5', '#ffffff,#FF99BC,#FF99BC,#ffffff,#ffffff,#FF99BC,#ffffff,#FF99BC', 19, 0, 1, 1, 232);
INSERT INTO `catalogue_items` VALUES (233, 'Glass table', 'Translucent beauty', 4, 1, 2, 2, 0.80, 'glass_table*5', '#ffffff,#FF99BC,#FF99BC,#ffffff', 19, 0, 1, 1, 233);
INSERT INTO `catalogue_items` VALUES (234, 'Glass chair', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_chair*5', '#ffffff,#FF99BC,#FF99BC,#ffffff', 19, 0, 1, 1, 234);
INSERT INTO `catalogue_items` VALUES (235, 'Glass stool', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_stool*5', '#ffffff,#FF99BC,#FF99BC,#ffffff', 19, 0, 1, 1, 235);
INSERT INTO `catalogue_items` VALUES (236, 'Glass sofa', 'Translucent beauty', 4, 2, 2, 1, 1.20, 'glass_sofa*6', '#ffffff,#5EAAF8,#5EAAF8,#ffffff,#ffffff,#5EAAF8,#ffffff,#5EAAF8', 19, 0, 1, 1, 236);
INSERT INTO `catalogue_items` VALUES (237, 'Glass table', 'Translucent beauty', 4, 1, 2, 2, 0.80, 'glass_table*6', '#ffffff,#5EAAF8,#5EAAF8,#ffffff', 19, 0, 1, 1, 237);
INSERT INTO `catalogue_items` VALUES (238, 'Glass chair', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_chair*6', '#ffffff,#5EAAF8,#5EAAF8,#ffffff', 19, 0, 1, 1, 238);
INSERT INTO `catalogue_items` VALUES (239, 'Glass stool', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_stool*6', '#ffffff,#5EAAF8,#5EAAF8,#ffffff', 19, 0, 1, 1, 239);
INSERT INTO `catalogue_items` VALUES (240, 'Glass sofa', 'Habbo Club', 4, 2, 2, 1, 1.20, 'glass_sofa*7', '#ffffff,#92D13D,#92D13D,#ffffff,#ffffff,#92D13D,#ffffff,#92D13D', 19, 0, 1, 1, 240);
INSERT INTO `catalogue_items` VALUES (241, 'Glass table', 'Habbo Club', 4, 1, 2, 2, 0.80, 'glass_table*7', '#ffffff,#92D13D,#92D13D,#ffffff', 19, 0, 1, 1, 241);
INSERT INTO `catalogue_items` VALUES (242, 'Glass chair', 'Habbo Club', 3, 2, 1, 1, 1.20, 'glass_chair*7', '#ffffff,#92D13D,#92D13D,#ffffff', 19, 0, 1, 1, 242);
INSERT INTO `catalogue_items` VALUES (243, 'Glass stool', 'Habbo Club', 3, 2, 1, 1, 1.20, 'glass_stool*7', '#ffffff,#92D13D,#92D13D,#ffffff', 19, 0, 1, 1, 243);
INSERT INTO `catalogue_items` VALUES (244, 'Glass sofa', 'Translucent beauty', 4, 2, 2, 1, 1.20, 'glass_sofa*8', '#ffffff,#FFD837,#FFD837,#ffffff,#ffffff,#FFD837,#ffffff,#FFD837', 19, 0, 1, 1, 244);
INSERT INTO `catalogue_items` VALUES (245, 'Glass table', 'Translucent beauty', 4, 1, 2, 2, 0.80, 'glass_table*8', '#ffffff,#FFD837,#FFD837,#ffffff', 19, 0, 1, 1, 245);
INSERT INTO `catalogue_items` VALUES (246, 'Glass chair', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_chair*8', '#ffffff,#FFD837,#FFD837,#ffffff', 19, 0, 1, 1, 246);
INSERT INTO `catalogue_items` VALUES (247, 'Glass stool', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_stool*8', '#ffffff,#FFD837,#FFD837,#ffffff', 19, 0, 1, 1, 247);
INSERT INTO `catalogue_items` VALUES (248, 'Glass sofa', 'Translucent beauty', 4, 2, 2, 1, 1.20, 'glass_sofa*9', '#ffffff,#E14218,#E14218,#ffffff,#ffffff,#E14218,#ffffff,#E14218', 19, 0, 1, 1, 248);
INSERT INTO `catalogue_items` VALUES (249, 'Glass table', 'Translucent beauty', 4, 1, 2, 2, 0.80, 'glass_table*9', '#ffffff,#E14218,#E14218,#ffffff', 19, 0, 1, 1, 249);
INSERT INTO `catalogue_items` VALUES (250, 'Glass chair', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_chair*9', '#ffffff,#E14218,#E14218,#ffffff', 19, 0, 1, 1, 250);
INSERT INTO `catalogue_items` VALUES (251, 'Glass stool', 'Translucent beauty', 3, 2, 1, 1, 1.20, 'glass_stool*9', '#ffffff,#E14218,#E14218,#ffffff', 19, 0, 1, 1, 251);
INSERT INTO `catalogue_items` VALUES (252, 'Red Gothic Chair', 'The head of the table', 10, 2, 1, 1, 1.20, 'gothic_chair*3', '#ffffff,#dd0000,#ffffff,#dd0000', 20, 0, 1, 1, 252);
INSERT INTO `catalogue_items` VALUES (253, 'Gothic Sofa Red', 'The dark side of Habbo', 7, 2, 2, 1, 1.20, 'gothic_sofa*3', '#ffffff,#dd0000,#ffffff,#ffffff,#dd0000,#ffffff', 20, 0, 1, 1, 253);
INSERT INTO `catalogue_items` VALUES (254, 'Gothic Stool Red', 'The dark side of Habbo', 5, 2, 1, 1, 1.20, 'gothic_stool*3', '#ffffff,#dd0000,#ffffff', 20, 0, 1, 1, 254);
INSERT INTO `catalogue_items` VALUES (255, 'Cobbled Path', 'The path less travelled', 5, 4, 2, 4, 0.00, 'gothic_carpet', '0,0,0', 20, 0, 1, 1, 255);
INSERT INTO `catalogue_items` VALUES (256, 'Dungeon Floor', 'What lies beneath?', 5, 4, 2, 4, 0.00, 'gothic_carpet2', '0,0,0', 20, 0, 1, 1, 256);
INSERT INTO `catalogue_items` VALUES (257, 'Gothic Table', 'The dark side of Habbo', 15, 1, 1, 5, 1.00, 'goth_table', '0,0,0', 20, 0, 1, 1, 257);
INSERT INTO `catalogue_items` VALUES (258, 'Gothic Railing', 'The dark side of Habbo', 8, 1, 2, 1, 0.00, 'gothrailing', '0,0,0', 20, 0, 1, 1, 258);
INSERT INTO `catalogue_items` VALUES (259, 'Gothic Torch', 'The dark side of Habbo', 10, 0, 0, 0, 0.00, 'torch', '0,0,0', 20, 0, 1, 1, 259);
INSERT INTO `catalogue_items` VALUES (260, 'Gothic Ectoplasm Fountain', 'Not suitable for drinking!', 10, 0, 0, 0, 0.00, 'gothicfountain', '0,0,0', 20, 0, 1, 1, 260);
INSERT INTO `catalogue_items` VALUES (261, 'Gothic Candelabra', 'The dark side of Habbo', 10, 1, 1, 1, 0.00, 'gothiccandelabra', '0,0,0', 20, 0, 1, 1, 261);
INSERT INTO `catalogue_items` VALUES (262, 'Gothic Portcullis', 'The dark side of Habbo', 10, 1, 2, 1, 0.00, 'gothgate', '0,0,0', 20, 1, 1, 1, 262);
INSERT INTO `catalogue_items` VALUES (263, 'Industrial Turbine', 'Powerful and resilient', 10, 0, 0, 0, 0.00, 'industrialfan', '0,0,0', 20, 0, 1, 1, 263);
INSERT INTO `catalogue_items` VALUES (264, 'Flaming Barrel', 'Beacon of light!', 3, 1, 1, 1, 0.00, 'grunge_barrel', '0,0,0', 21, 0, 1, 1, 264);
INSERT INTO `catalogue_items` VALUES (265, 'Bench', 'Laid back seating', 3, 2, 3, 1, 1.20, 'grunge_bench', '0,0,0', 21, 0, 1, 1, 265);
INSERT INTO `catalogue_items` VALUES (266, 'Candle Box', 'Late night debate', 2, 1, 1, 1, 0.00, 'grunge_candle', '0,0,0', 21, 0, 1, 1, 266);
INSERT INTO `catalogue_items` VALUES (267, 'Grunge Chair', 'Alternative chair for alternative people', 4, 2, 1, 1, 1.20, 'grunge_chair', '0,0,0', 21, 0, 1, 1, 267);
INSERT INTO `catalogue_items` VALUES (268, 'Grunge Mattress', 'Beats sleeping on the floor!', 3, 2, 3, 1, 1.00, 'grunge_mattress', '0,0,0', 21, 0, 1, 1, 268);
INSERT INTO `catalogue_items` VALUES (269, 'Radiator', 'Started cool but now it\'s hot!', 3, 1, 1, 1, 0.00, 'grunge_radiator', '0,0,0', 21, 0, 1, 1, 269);
INSERT INTO `catalogue_items` VALUES (270, 'Grunge Bookshelf', 'Scrap books and photo albums', 5, 1, 3, 1, 0.00, 'grunge_shelf', '0,0,0', 21, 0, 1, 1, 270);
INSERT INTO `catalogue_items` VALUES (271, 'Road Sign', 'Bought legitimately from an M1 cafe.', 3, 1, 1, 1, 0.00, 'grunge_sign', '0,0,0', 21, 0, 1, 1, 271);
INSERT INTO `catalogue_items` VALUES (272, 'Grunge Table', 'Students of the round table!', 4, 1, 2, 2, 0.80, 'grunge_table', '0,0,0', 21, 0, 1, 1, 272);
INSERT INTO `catalogue_items` VALUES (273, 'Bronze Coin', 'Worth 1 Habbo Credit', 1, 1, 1, 1, 0.15, 'CF_1_coin_bronze', '0,0,0', 22, 0, 1, 1, 273);
INSERT INTO `catalogue_items` VALUES (274, 'Silver Coin', 'Worth 5 Habbo Credits', 5, 1, 1, 1, 0.15, 'CF_5_coin_silver', '0,0,0', 22, 0, 1, 1, 274);
INSERT INTO `catalogue_items` VALUES (275, 'Gold Coin', 'Worth 10 Habbo Credits', 10, 1, 1, 1, 0.15, 'CF_10_coin_gold', '0,0,0', 22, 0, 1, 1, 275);
INSERT INTO `catalogue_items` VALUES (276, 'Sack of Credits', 'Worth 20 Habbo Credits', 20, 1, 1, 1, 1.00, 'CF_20_moneybag', '0,0,0', 22, 0, 1, 1, 276);
INSERT INTO `catalogue_items` VALUES (277, 'Gold Bar', 'Worth 50 Habbo Credits', 50, 1, 1, 1, 0.40, 'CF_50_goldbar', '0,0,0', 22, 0, 1, 1, 277);
INSERT INTO `catalogue_items` VALUES (278, 'Bronze Coin (China)', 'Worth 10 Credits', 10, 1, 1, 1, 0.15, 'CFC_10_coin_bronze', '0,0,0', 22, 0, 1, 1, 278);
INSERT INTO `catalogue_items` VALUES (279, 'Silver Coin (China)', 'Worth 50 Credits', 50, 1, 1, 1, 0.15, 'CFC_50_coin_silver', '0,0,0', 22, 0, 1, 1, 279);
INSERT INTO `catalogue_items` VALUES (280, 'Gold Coin (China)', 'Worth 100 Credits', 100, 1, 1, 1, 0.15, 'CFC_100_coin_gold', '0,0,0', 22, 0, 1, 1, 280);
INSERT INTO `catalogue_items` VALUES (281, 'Sack of Credits (China)', 'Worth 200 Credits', 200, 1, 1, 1, 1.00, 'CFC_200_moneybag', '0,0,0', 22, 0, 1, 1, 281);
INSERT INTO `catalogue_items` VALUES (282, 'Gold Bar (China)', 'Worth 500 Credits', 500, 1, 1, 1, 0.40, 'CFC_500_goldbar', '0,0,0', 22, 0, 1, 1, 282);
INSERT INTO `catalogue_items` VALUES (283, 'Director\'s Chair', 'Exclusively for Directors', 5, 2, 1, 1, 1.20, 'habbowood_chair', '0,0,0', 23, 0, 1, 1, 283);
INSERT INTO `catalogue_items` VALUES (284, 'Rope Divider', 'Rope Divider', 5, 1, 2, 1, 0.00, 'rope_divider', '0,0,0', 23, 1, 1, 1, 284);
INSERT INTO `catalogue_items` VALUES (285, 'Habbowood Spotlight', 'For the star of the show', 15, 1, 1, 1, 0.00, 'spotlight', '0,0,0', 23, 0, 1, 1, 285);
INSERT INTO `catalogue_items` VALUES (286, 'Deluxe Theatre Chair', 'For Lazy boys and girls!', 10, 2, 1, 1, 1.20, 'theatre_seat', '0,0,0', 23, 0, 1, 1, 286);
INSERT INTO `catalogue_items` VALUES (287, 'Rare icecream white', 'Basic model', 25, 1, 1, 1, 0.00, 'rare_icecream_campaign', '0,0,0', 23, 0, 1, 1, 287);
INSERT INTO `catalogue_items` VALUES (288, 'Habbowood Mirror', 'Star of the show!', 10, 0, 0, 0, 0.00, 'habw_mirror', '0,0,0', 23, 0, 1, 1, 288);
INSERT INTO `catalogue_items` VALUES (289, 'Star Tile', '10% off the walk of fame!', 1, 4, 1, 1, 0.00, 'tile_stella', '0,0,0', 23, 0, 1, 1, 289);
INSERT INTO `catalogue_items` VALUES (290, 'Chair', 'Sleek and chic for each cheek', 3, 2, 1, 1, 1.00, 'chair_norja', '#ffffff,#ffffff,#F7EBBC,#F7EBBC', 24, 0, 1, 1, 290);
INSERT INTO `catalogue_items` VALUES (291, 'Bench', 'Two can perch comfortably', 3, 2, 2, 1, 1.00, 'couch_norja', '#ffffff,#ffffff,#ffffff,#ffffff,#F7EBBC,#F7EBBC,#F7EBBC,#F7EBBC', 24, 0, 1, 1, 291);
INSERT INTO `catalogue_items` VALUES (292, 'Coffee Table', 'Elegance embodied', 3, 1, 2, 2, 0.80, 'table_norja_med', '#ffffff,#F7EBBC', 24, 0, 1, 1, 292);
INSERT INTO `catalogue_items` VALUES (293, 'Bookcase', 'For nic naks and art deco books', 3, 1, 1, 1, 0.00, 'shelves_norja', '#ffffff,#F7EBBC', 24, 0, 1, 1, 293);
INSERT INTO `catalogue_items` VALUES (294, 'iced sofachair', 'Soft iced sofachair', 3, 2, 1, 1, 1.00, 'soft_sofachair_norja', '#ffffff,#F7EBBC,#F7EBBC', 24, 0, 1, 1, 294);
INSERT INTO `catalogue_items` VALUES (295, 'iced sofa', 'A soft iced sofa', 4, 2, 2, 1, 1.00, 'soft_sofa_norja', '#ffffff,#F7EBBC,#ffffff,#F7EBBC,#F7EBBC,#F7EBBC', 24, 0, 1, 1, 295);
INSERT INTO `catalogue_items` VALUES (296, 'Ice Bar-Desk', 'Strong, yet soft looking', 3, 1, 2, 1, 1.20, 'divider_nor2', '#ffffff,#ffffff,#F7EBBC,#F7EBBC', 24, 0, 1, 1, 296);
INSERT INTO `catalogue_items` VALUES (297, 'Ice Corner', 'Looks squishy, but isn\'t', 3, 1, 1, 1, 1.20, 'divider_nor1', '#ffffff,#F7EBBC', 24, 0, 1, 1, 297);
INSERT INTO `catalogue_items` VALUES (298, 'Door (Lockable)', 'Do go through...', 6, 1, 1, 1, 0.00, 'divider_nor3', '#ffffff,#ffffff,#F7EBBC,#F7EBBC', 24, 1, 1, 1, 298);
INSERT INTO `catalogue_items` VALUES (299, 'Iced Auto Shutter', 'Habbos, roll out!', 3, 1, 2, 1, 0.00, 'divider_nor4', '#ffffff,#ffffff,#F7EBBC,#F7EBBC,#F7EBBC,#F7EBBC', 24, 1, 1, 1, 299);
INSERT INTO `catalogue_items` VALUES (300, 'Iced Angle', 'Cool cornering for you!', 3, 1, 1, 1, 0.00, 'divider_nor5', '#ffffff,#F7EBBC,#F7EBBC,#F7EBBC,#F7EBBC,#F7EBBC', 24, 1, 1, 1, 300);
INSERT INTO `catalogue_items` VALUES (301, 'Bamboo Forest', 'Watch out for pandas!', 25, 4, 2, 2, 0.00, 'jp_bamboo', '0,0,0', 25, 0, 1, 1, 301);
INSERT INTO `catalogue_items` VALUES (302, 'Pillow Chair', 'Comfy and classical', 5, 2, 1, 1, 0.80, 'jp_pillow', '0,0,0', 25, 0, 1, 1, 302);
INSERT INTO `catalogue_items` VALUES (303, 'Irori', 'Traditional heating and eating', 10, 1, 2, 2, 0.00, 'jp_irori', '0,0,0', 25, 0, 1, 1, 303);
INSERT INTO `catalogue_items` VALUES (304, 'Small Tatami Mat', 'Shoes off please', 6, 4, 2, 2, 0.00, 'jp_tatami', '0,0,0', 25, 0, 1, 1, 304);
INSERT INTO `catalogue_items` VALUES (305, 'Large Tatami Mat', 'Shoes off please', 8, 4, 2, 4, 0.00, 'jp_tatami2', '0,0,0', 25, 0, 1, 1, 305);
INSERT INTO `catalogue_items` VALUES (306, 'Japanese Lantern', 'For a mellow Eastern glow', 10, 1, 1, 1, 0.00, 'jp_lantern', '0,0,0', 25, 0, 1, 1, 306);
INSERT INTO `catalogue_items` VALUES (307, 'Japanese Drawer', 'Spiritual home for odds and ends', 6, 1, 1, 1, 0.00, 'jp_drawer', '0,0,0', 25, 0, 1, 1, 307);
INSERT INTO `catalogue_items` VALUES (308, 'Ninja Stars', 'Not a frisbee', 10, 0, 0, 0, 0.00, 'jp_ninjastars', '0,0,0', 25, 0, 1, 1, 308);
INSERT INTO `catalogue_items` VALUES (309, 'NAME', 'DESC', 3, 0, 0, 0, 0.00, 'jp_sheet1', '0,0,0', 25, 0, 1, 1, 309);
INSERT INTO `catalogue_items` VALUES (310, 'NAME', 'DESC', 3, 0, 0, 0, 0.00, 'jp_sheet2', '0,0,0', 25, 0, 1, 1, 310);
INSERT INTO `catalogue_items` VALUES (311, 'NAME', 'DESC', 3, 0, 0, 0, 0.00, 'jp_sheet3', '0,0,0', 25, 0, 1, 1, 311);
INSERT INTO `catalogue_items` VALUES (312, 'NAME', 'DESC', 3, 1, 1, 1, 0.00, 'jp_tray1', '0,0,0', 25, 0, 1, 1, 312);
INSERT INTO `catalogue_items` VALUES (313, 'NAME', 'DESC', 3, 1, 1, 1, 0.00, 'jp_tray2', '0,0,0', 25, 0, 1, 1, 313);
INSERT INTO `catalogue_items` VALUES (314, 'NAME', 'DESC', 3, 1, 1, 1, 0.00, 'jp_tray3', '0,0,0', 25, 0, 1, 1, 314);
INSERT INTO `catalogue_items` VALUES (315, 'NAME', 'DESC', 3, 1, 1, 1, 0.00, 'jp_tray4', '0,0,0', 25, 0, 1, 1, 315);
INSERT INTO `catalogue_items` VALUES (316, 'NAME', 'DESC', 3, 1, 1, 1, 0.00, 'jp_tray5', '0,0,0', 25, 0, 1, 1, 316);
INSERT INTO `catalogue_items` VALUES (317, 'NAME', 'DESC', 3, 1, 1, 1, 0.00, 'jp_tray6', '0,0,0', 25, 0, 1, 1, 317);
INSERT INTO `catalogue_items` VALUES (318, 'Double Bed', 'King-sized pine comfort', 3, 3, 2, 3, 1.70, 'bed_armas_two', '0,0,0', 26, 0, 1, 1, 318);
INSERT INTO `catalogue_items` VALUES (319, 'Single Bed', 'Rustic charm for one', 3, 3, 1, 3, 1.70, 'bed_armas_one', '0,0,0', 26, 0, 1, 1, 319);
INSERT INTO `catalogue_items` VALUES (320, 'Fireplace', 'Authentic, real flame fire', 4, 1, 2, 1, 0.00, 'fireplace_armas', '0,0,0', 26, 0, 1, 1, 320);
INSERT INTO `catalogue_items` VALUES (321, 'Bardesk', 'Bar-Style Table - essential for extra guests', 3, 1, 1, 3, 1.20, 'bartable_armas', '0,0,0', 26, 0, 1, 1, 321);
INSERT INTO `catalogue_items` VALUES (322, 'Dining Table', 'For informal dining', 3, 1, 2, 2, 1.00, 'table_armas', '0,0,0', 26, 0, 1, 1, 322);
INSERT INTO `catalogue_items` VALUES (323, 'Bench', 'To complete the dining set', 3, 2, 2, 1, 1.20, 'bench_armas', '0,0,0', 26, 0, 1, 1, 323);
INSERT INTO `catalogue_items` VALUES (324, 'Gate (lockable)', 'Knock, knock...', 6, 1, 1, 1, 0.00, 'divider_arm3', '0,0,0', 26, 1, 1, 1, 324);
INSERT INTO `catalogue_items` VALUES (325, 'Corner plinth', 'Good solid wood', 3, 1, 1, 1, 1.20, 'divider_arm1', '0,0,0', 26, 0, 1, 1, 325);
INSERT INTO `catalogue_items` VALUES (326, 'Room divider', 'I wooden go there', 3, 1, 2, 1, 1.20, 'divider_arm2', '0,0,0', 26, 0, 1, 1, 326);
INSERT INTO `catalogue_items` VALUES (327, 'Bookcase', 'For all those fire-side stories', 3, 1, 2, 1, 3.20, 'shelves_armas', '0,0,0', 26, 0, 1, 1, 327);
INSERT INTO `catalogue_items` VALUES (328, 'Barrel Minibar', 'It\'s a barrel of laughs and a great talking point', 4, 1, 1, 1, 0.00, 'bar_armas', '0,0,0', 26, 0, 1, 1, 328);
INSERT INTO `catalogue_items` VALUES (329, 'Barrel Stool', 'The ultimate recycled furniture', 1, 2, 1, 1, 1.30, 'bar_chair_armas', '0,0,0', 26, 0, 1, 1, 329);
INSERT INTO `catalogue_items` VALUES (330, 'Table Lamp', 'Ambient lighting is essential', 3, 1, 1, 1, 0.00, 'lamp_armas', '0,0,0', 26, 0, 1, 1, 330);
INSERT INTO `catalogue_items` VALUES (331, 'Lodge Candle', 'Wax lyrical with some old-world charm', 3, 1, 1, 1, 0.00, 'lamp2_armas', '0,0,0', 26, 0, 1, 1, 331);
INSERT INTO `catalogue_items` VALUES (332, 'Occasional Table', 'Practical and beautiful', 2, 1, 1, 1, 1.00, 'small_table_armas', '0,0,0', 26, 0, 1, 1, 332);
INSERT INTO `catalogue_items` VALUES (333, 'Stool', 'Rustic charm at it\'s best', 1, 2, 1, 1, 1.20, 'small_chair_armas', '0,0,0', 26, 0, 1, 1, 333);
INSERT INTO `catalogue_items` VALUES (334, 'Double Bed', 'Give yourself space to stretch out', 4, 3, 2, 3, 1.50, 'bed_polyfon', '#ffffff,#ffffff,#ABD0D2,#ABD0D2', 27, 0, 1, 1, 334);
INSERT INTO `catalogue_items` VALUES (335, 'Single Bed', 'Cot of the artistic', 3, 3, 1, 3, 1.50, 'bed_polyfon_one', 'ffffff,#ffffff,#ffffff,#ABD0D2,#ABD0D2', 27, 0, 1, 1, 335);
INSERT INTO `catalogue_items` VALUES (336, 'Fireplace', 'Comfort in stainless steel', 5, 1, 2, 1, 0.00, 'fireplace_polyfon', '0,0,0', 27, 0, 1, 1, 336);
INSERT INTO `catalogue_items` VALUES (337, 'Two-seater Sofa', 'Comfort for stylish couples', 4, 2, 2, 1, 1.20, 'sofa_polyfon', '#ffffff,#ffffff,#ffffff,#ffffff,#ABD0D2,#ABD0D2,#ABD0D2,#ABD0D2', 27, 0, 1, 1, 337);
INSERT INTO `catalogue_items` VALUES (338, 'Armchair', 'Loft-style comfort', 3, 2, 1, 1, 1.20, 'sofachair_polyfon', '#ffffff,#ffffff,#ABD0D2,#ABD0D2', 27, 0, 1, 1, 338);
INSERT INTO `catalogue_items` VALUES (339, 'Mini-Bar', 'You naughty Habbo!', 5, 1, 1, 1, 0.00, 'bar_polyfon', '0,0,0', 27, 0, 1, 1, 339);
INSERT INTO `catalogue_items` VALUES (340, 'Hatch (Lockable)', 'All bars should have one', 6, 1, 1, 1, 0.00, 'divider_poly3', '#ffffff,#ffffff,#ffffff,#ABD0D2,#ABD0D2', 27, 1, 1, 1, 340);
INSERT INTO `catalogue_items` VALUES (341, 'Bar/desk', 'Perfect for work or play', 3, 1, 2, 1, 1.00, 'bardesk_polyfon', '#ffffff,#ffffff,#ABD0D2,#ABD0D2', 27, 0, 1, 1, 341);
INSERT INTO `catalogue_items` VALUES (342, 'Corner Cabinet/Desk', 'Tuck it away', 3, 1, 1, 1, 1.00, 'bardeskcorner_polyfon', '#ffffff,#ABD0D2', 27, 0, 1, 1, 342);
INSERT INTO `catalogue_items` VALUES (343, 'Dining Chair', 'Metallic seating experience', 3, 2, 1, 1, 1.00, 'chair_polyfon', '0,0,0', 27, 0, 1, 1, 343);
INSERT INTO `catalogue_items` VALUES (344, 'Large Coffee Table', 'For larger gatherings', 4, 1, 2, 2, 0.80, 'table_polyfon', '0,0,0', 27, 0, 1, 1, 344);
INSERT INTO `catalogue_items` VALUES (345, 'Large Coffee Table', 'For larger gatherings', 3, 1, 2, 2, 0.80, 'table_polyfon_med', '0,0,0', 27, 0, 1, 1, 345);
INSERT INTO `catalogue_items` VALUES (346, 'Small Coffee Table', 'For serving a stylish latte', 1, 1, 2, 2, 0.00, 'table_polyfon_small', '0,0,0', 27, 0, 1, 1, 346);
INSERT INTO `catalogue_items` VALUES (347, 'Large Dining Table', 'For larger gatherings', 4, 1, 2, 2, 0.80, 'smooth_table_polyfon', '0,0,0', 27, 0, 1, 1, 347);
INSERT INTO `catalogue_items` VALUES (348, 'Shelf', 'Tidy up', 1, 1, 1, 1, 0.60, 'stand_polyfon_z', '0,0,0', 27, 0, 1, 1, 348);
INSERT INTO `catalogue_items` VALUES (349, 'Bookcase', 'For the arty pad', 4, 1, 2, 1, 0.00, 'shelves_polyfon', '0,0,0', 27, 0, 1, 1, 349);
INSERT INTO `catalogue_items` VALUES (350, 'Dining Chair', 'Keep it simple', 5, 0, 0, 0, 0.00, 'deal1', '0,0,0', 28, 0, 0, 0, 350);
INSERT INTO `catalogue_items` VALUES (351, 'Doormat', 'Welcome Habbos in style', 5, 0, 0, 0, 0.00, 'deal2', '0,0,0', 28, 0, 0, 0, 351);
INSERT INTO `catalogue_items` VALUES (352, 'Large Coffee Table', 'For larger gatherings', 5, 0, 0, 0, 0.00, 'deal3', '0,0,0', 28, 0, 0, 0, 352);
INSERT INTO `catalogue_items` VALUES (353, 'Shelf', 'Tidy up', 5, 0, 0, 0, 0.00, 'deal4', '0,0,0', -1, 0, 0, 0, 353);
INSERT INTO `catalogue_items` VALUES (354, 'Stool', 'Rustic charm at it\'s best', 5, 0, 0, 0, 0.00, 'deal5', '0,0,0', -1, 0, 0, 0, 354);
INSERT INTO `catalogue_items` VALUES (355, 'Chair', 'Hip plastic furniture', 5, 0, 0, 0, 0.00, 'deal6', '0,0,0', -1, 0, 0, 0, 355);
INSERT INTO `catalogue_items` VALUES (356, 'Vase of Flowers', 'Guaranteed to stay fresh', 4, 1, 1, 1, 0.00, 'giftflowers', '0,0,0', 29, 0, 1, 1, 356);
INSERT INTO `catalogue_items` VALUES (357, 'Cut Roses', 'Sleek and chic', 3, 1, 1, 1, 0.00, 'plant_rose', '0,0,0', 29, 0, 1, 1, 357);
INSERT INTO `catalogue_items` VALUES (358, 'Cut Sunflower', 'For happy Habbos', 3, 1, 1, 1, 0.00, 'plant_sunflower', '0,0,0', 29, 0, 1, 1, 358);
INSERT INTO `catalogue_items` VALUES (359, 'Yukka Plant', 'Easy to care for', 3, 1, 1, 1, 0.00, 'plant_yukka', '0,0,0', 29, 0, 1, 1, 359);
INSERT INTO `catalogue_items` VALUES (360, 'Pineapple Plant', 'Needs loving glances', 3, 1, 1, 1, 0.00, 'plant_pineapple', '0,0,0', 29, 0, 1, 1, 360);
INSERT INTO `catalogue_items` VALUES (361, 'Bonsai Tree', 'You can be sure it lives', 3, 1, 1, 1, 0.00, 'plant_bonsai', '0,0,0', 29, 0, 1, 1, 361);
INSERT INTO `catalogue_items` VALUES (362, 'Mature Cactus', 'Habbo Dreams monster in hiding!  Shhhh', 3, 1, 1, 1, 0.00, 'plant_big_cactus', '0,0,0', 29, 0, 1, 1, 362);
INSERT INTO `catalogue_items` VALUES (363, 'Fruit Tree', 'Great yield and sweet fruit', 3, 1, 1, 1, 0.00, 'plant_fruittree', '0,0,0', 29, 0, 1, 1, 363);
INSERT INTO `catalogue_items` VALUES (364, 'Small Cactus', 'Even less watering than the real world', 1, 1, 1, 1, 0.00, 'plant_small_cactus', '0,0,0', 29, 0, 1, 1, 364);
INSERT INTO `catalogue_items` VALUES (365, 'Maze Shrubbery', 'Build your maze!', 5, 1, 2, 1, 0.00, 'plant_maze', '0,0,0', 29, 0, 1, 1, 365);
INSERT INTO `catalogue_items` VALUES (366, 'Maze Shrubbery Gate', 'Did we make it?', 6, 1, 2, 1, 0.00, 'plant_mazegate', '0,0,0', 29, 0, 1, 1, 366);
INSERT INTO `catalogue_items` VALUES (367, 'Bulrush', 'Ideal for the riverside', 3, 1, 1, 1, 0.00, 'plant_bulrush', '0,0,0', 29, 0, 1, 1, 367);
INSERT INTO `catalogue_items` VALUES (368, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*16', '#ffffff,#CC3399,#ffffff,#CC3399', 30, 0, 1, 1, 368);
INSERT INTO `catalogue_items` VALUES (369, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*15', '#ffffff,#FF97BA,#ffffff,#FF97BA', 30, 0, 1, 1, 369);
INSERT INTO `catalogue_items` VALUES (370, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*5', '#ffffff,#54ca00,#ffffff,#54ca00', 30, 0, 1, 1, 370);
INSERT INTO `catalogue_items` VALUES (371, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto', '0,0,0', 30, 0, 1, 1, 371);
INSERT INTO `catalogue_items` VALUES (372, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*8', '#ffffff,#c38d1a,#ffffff,#c38d1a', 30, 0, 1, 1, 372);
INSERT INTO `catalogue_items` VALUES (373, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*7', '#ffffff,#ff6d00,#ffffff,#ff6d00', 30, 0, 1, 1, 373);
INSERT INTO `catalogue_items` VALUES (374, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*1', '#ffffff,#ff1f08,#ffffff,#ff1f08', 30, 0, 1, 1, 374);
INSERT INTO `catalogue_items` VALUES (375, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*4', '#ffffff,#ccddff,#ffffff,#ccddff', 30, 0, 1, 1, 375);
INSERT INTO `catalogue_items` VALUES (376, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*6', '#ffffff,#3444ff,#ffffff,#3444ff', 30, 0, 1, 1, 376);
INSERT INTO `catalogue_items` VALUES (377, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*3', '#ffffff,#ffee00,#ffffff,#ffee00', 30, 0, 1, 1, 377);
INSERT INTO `catalogue_items` VALUES (378, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*2', '#ffffff,#99DCCC,#ffffff,#99DCCc', 30, 0, 1, 1, 378);
INSERT INTO `catalogue_items` VALUES (379, 'Occasional Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*15', '#ffffff,#FF97BA', 30, 0, 1, 1, 379);
INSERT INTO `catalogue_items` VALUES (380, 'Occasional Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*14', '#ffffff,#CC3399', 30, 0, 1, 1, 380);
INSERT INTO `catalogue_items` VALUES (381, 'Occasional Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*1', '#ffffff,#ff1f08', 30, 0, 1, 1, 381);
INSERT INTO `catalogue_items` VALUES (382, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*7', '#ffffff,#ff6d00', 30, 0, 1, 1, 382);
INSERT INTO `catalogue_items` VALUES (383, 'Occasional Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square', '0,0,0', 30, 0, 1, 1, 383);
INSERT INTO `catalogue_items` VALUES (384, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*2', '#ffffff,#99DCCC', 30, 0, 1, 1, 384);
INSERT INTO `catalogue_items` VALUES (385, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*4', '#ffffff,#ccddff', 30, 0, 1, 1, 385);
INSERT INTO `catalogue_items` VALUES (386, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*6', '#ffffff,#3444ff', 30, 0, 1, 1, 386);
INSERT INTO `catalogue_items` VALUES (387, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*3', '#ffffff,#ffee00', 30, 0, 1, 1, 387);
INSERT INTO `catalogue_items` VALUES (388, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*9', '#ffffff,#533e10', 30, 0, 1, 1, 388);
INSERT INTO `catalogue_items` VALUES (389, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*5', '#ffffff,#54ca00', 30, 0, 1, 1, 389);
INSERT INTO `catalogue_items` VALUES (390, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 1, 1, 1.00, 'table_plasto_square*8', '#ffffff,#c38d1a', 30, 0, 1, 1, 390);
INSERT INTO `catalogue_items` VALUES (391, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*15', '#ffffff,#FF97BA', 30, 0, 1, 1, 391);
INSERT INTO `catalogue_items` VALUES (392, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*14', '#ffffff,#CC3399', 30, 0, 1, 1, 392);
INSERT INTO `catalogue_items` VALUES (393, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*7', '#ffffff,#ff6d00', 30, 0, 1, 1, 393);
INSERT INTO `catalogue_items` VALUES (394, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*1', '#ffffff,#ff1f08', 30, 0, 1, 1, 394);
INSERT INTO `catalogue_items` VALUES (395, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*2', '#ffffff,#99DCCC', 30, 0, 1, 1, 395);
INSERT INTO `catalogue_items` VALUES (396, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*4', '#ffffff,#ccddff', 30, 0, 1, 1, 396);
INSERT INTO `catalogue_items` VALUES (397, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*6', '#ffffff,#3444ff', 30, 0, 1, 1, 397);
INSERT INTO `catalogue_items` VALUES (398, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*3', '#ffffff,#ffee00', 30, 0, 1, 1, 398);
INSERT INTO `catalogue_items` VALUES (399, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*9', '#ffffff,#533e10', 30, 0, 1, 1, 399);
INSERT INTO `catalogue_items` VALUES (400, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round', '0,0,0', 30, 0, 1, 1, 400);
INSERT INTO `catalogue_items` VALUES (401, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*5', '#ffffff,#54ca00', 30, 0, 1, 1, 401);
INSERT INTO `catalogue_items` VALUES (402, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_round*8', '#ffffff,#c38d1a', 30, 0, 1, 1, 402);
INSERT INTO `catalogue_items` VALUES (403, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*15', '#ffffff,#FF97BA', 30, 0, 1, 1, 403);
INSERT INTO `catalogue_items` VALUES (404, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*14', '#ffffff,#CC3399', 30, 0, 1, 1, 404);
INSERT INTO `catalogue_items` VALUES (405, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*7', '#ffffff,#ff6d00', 30, 0, 1, 1, 405);
INSERT INTO `catalogue_items` VALUES (406, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*1', '#ffffff,#ff1f08', 30, 0, 1, 1, 406);
INSERT INTO `catalogue_items` VALUES (407, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*2', '#ffffff,#99DCCC', 30, 0, 1, 1, 407);
INSERT INTO `catalogue_items` VALUES (408, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare', '0,0,0', 30, 0, 1, 1, 408);
INSERT INTO `catalogue_items` VALUES (409, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*8', '#ffffff,#c38d1a', 30, 0, 1, 1, 409);
INSERT INTO `catalogue_items` VALUES (410, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*5', '#ffffff,#54ca00', 30, 0, 1, 1, 410);
INSERT INTO `catalogue_items` VALUES (411, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*9', '#ffffff,#533e10', 30, 0, 1, 1, 411);
INSERT INTO `catalogue_items` VALUES (412, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*3', '#ffffff,#ffee00', 30, 0, 1, 1, 412);
INSERT INTO `catalogue_items` VALUES (413, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*6', '#ffffff,#3444ff', 30, 0, 1, 1, 413);
INSERT INTO `catalogue_items` VALUES (414, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_bigsquare*4', '#ffffff,#ccddff', 30, 0, 1, 1, 414);
INSERT INTO `catalogue_items` VALUES (415, 'Occasional table Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*6', '#ffffff,#3444ff', 30, 0, 1, 1, 415);
INSERT INTO `catalogue_items` VALUES (416, 'Square Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*1', '#ffffff,#ff1f08', 30, 0, 1, 1, 416);
INSERT INTO `catalogue_items` VALUES (417, 'Round Dining Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*3', '#ffffff,#ffee00', 30, 0, 1, 1, 417);
INSERT INTO `catalogue_items` VALUES (418, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*9', '#ffffff,#533e10', 30, 0, 1, 1, 418);
INSERT INTO `catalogue_items` VALUES (419, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg', '0,0,0', 30, 0, 1, 1, 419);
INSERT INTO `catalogue_items` VALUES (420, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*5', '#ffffff,#54ca00', 30, 0, 1, 1, 420);
INSERT INTO `catalogue_items` VALUES (421, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*2', '#ffffff,#99DCCC', 30, 0, 1, 1, 421);
INSERT INTO `catalogue_items` VALUES (422, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*8', '#ffffff,#c38d1a', 30, 0, 1, 1, 422);
INSERT INTO `catalogue_items` VALUES (423, 'Occasional table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*7', '#ffffff,#ff6d00', 30, 0, 1, 1, 423);
INSERT INTO `catalogue_items` VALUES (424, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*10', '#ffffff,#ccddff', 30, 0, 1, 1, 424);
INSERT INTO `catalogue_items` VALUES (425, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*15', '#ffffff,#FF97BA', 30, 0, 1, 1, 425);
INSERT INTO `catalogue_items` VALUES (426, 'Occasional Table', 'Hip plastic furniture', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*16', '#ffffff,#CC3399', 30, 0, 1, 1, 426);
INSERT INTO `catalogue_items` VALUES (427, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty', '0,0,0', 30, 0, 1, 1, 427);
INSERT INTO `catalogue_items` VALUES (428, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*1', '#ffffff,#8EB5D1,#ffffff,#8EB5D1', 30, 0, 1, 1, 428);
INSERT INTO `catalogue_items` VALUES (429, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*2', '#ffffff,#ff9900,#ffffff,#ff9900', 30, 0, 1, 1, 429);
INSERT INTO `catalogue_items` VALUES (430, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*3', '#ffffff,#ff2200,#ffffff,#ff2200', 30, 0, 1, 1, 430);
INSERT INTO `catalogue_items` VALUES (431, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*4', '#ffffff,#00cc00,#ffffff,#00cc00', 30, 0, 1, 1, 431);
INSERT INTO `catalogue_items` VALUES (432, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*4', '#ffffff,#0033CC,#ffffff,#0033CC', 30, 0, 1, 1, 432);
INSERT INTO `catalogue_items` VALUES (433, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*4', '#ffffff,#333333,#ffffff,#333333', 30, 0, 1, 1, 433);
INSERT INTO `catalogue_items` VALUES (434, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*7', '#ffffff,#99DCCc,#ffffff,#99DCCc', 30, 0, 1, 1, 434);
INSERT INTO `catalogue_items` VALUES (435, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*8', '#ffffff,#c38d1a,#ffffff,#c38d1a', 30, 0, 1, 1, 435);
INSERT INTO `catalogue_items` VALUES (436, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*9', '#ffffff,#533e10,#ffffff,#533e10', 30, 0, 1, 1, 436);
INSERT INTO `catalogue_items` VALUES (437, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*10', '#ffffff,#CC3399,#ffffff,#CC3399', 30, 0, 1, 1, 437);
INSERT INTO `catalogue_items` VALUES (438, 'Plastic Pod Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasty*11', '#ffffff,#FF97BA,#ffffff,#FF97BA', 30, 0, 1, 1, 438);
INSERT INTO `catalogue_items` VALUES (439, 'Chair', 'Hip plastic furniture', 3, 2, 1, 1, 1.00, 'chair_plasto*9', '#ffffff,#533e10,#ffffff,#533e10', 30, 0, 1, 1, 439);
INSERT INTO `catalogue_items` VALUES (440, 'Pura Shelves', 'Pura Series 404 shelves', 3, 1, 2, 1, 0.00, 'shelves_basic', '0,0,0', 32, 0, 1, 1, 440);
INSERT INTO `catalogue_items` VALUES (441, 'A Pura Minibar', 'A Pura series 300 minibar', 4, 1, 1, 1, 0.00, 'bar_basic', '0,0,0', 32, 0, 1, 1, 441);
INSERT INTO `catalogue_items` VALUES (442, 'Pura Refridgerator', 'Keep cool with a chilled snack or drink', 6, 1, 1, 1, 0.00, 'fridge', '0,0,0', 32, 0, 1, 1, 442);
INSERT INTO `catalogue_items` VALUES (443, 'Pura Lamp', 'Switch on the atmosphere with this sophisticated light', 3, 1, 1, 1, 0.00, 'lamp_basic', '0,0,0', 32, 0, 1, 1, 443);
INSERT INTO `catalogue_items` VALUES (444, 'White Plain Double Bed', 'Sweet dreams for two', 3, 3, 2, 3, 1.50, 'bed_budgetb', '#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 32, 0, 1, 1, 444);
INSERT INTO `catalogue_items` VALUES (445, 'White Plain Single Bed', 'All you need for a good night\'s kip', 3, 3, 1, 3, 1.50, 'bed_budgetb_one', '#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 32, 0, 1, 1, 445);
INSERT INTO `catalogue_items` VALUES (446, 'Aqua Plain Double Bed', 'Sweet dreams for two', 3, 3, 2, 3, 1.50, 'bed_budget', '#FFFFFF,#FFFFFF,#FFFFFF,#ABD0D2,#ABD0D2,#ABD0D2', 32, 0, 1, 1, 446);
INSERT INTO `catalogue_items` VALUES (447, 'Aqua Plain Single Bed', 'All you need for a good night\'s kip', 3, 3, 1, 3, 1.50, 'bed_budget_one', '#FFFFFF,#FFFFFF,#FFFFFF,#ABD0D2,#ABD0D2,#ABD0D2', 32, 0, 1, 1, 447);
INSERT INTO `catalogue_items` VALUES (448, 'Pink Plain Double Bed', 'Sweet dreams for two', 3, 3, 2, 3, 1.50, 'bed_budgetb', '#FFFFFF,#FFFFFF,#FFFFFF,#FF99BC,#FF99BC,#FF99BC', 32, 0, 1, 1, 448);
INSERT INTO `catalogue_items` VALUES (449, 'Pink Plain Single Bed', 'All you need for a good night\'s kip', 3, 3, 1, 3, 1.50, 'bed_budgetb_one', '#FFFFFF,#FFFFFF,#FFFFFF,#FF99BC,#FF99BC,#FF99BC', 32, 0, 1, 1, 449);
INSERT INTO `catalogue_items` VALUES (450, 'Black Plain Double Bed', 'Sweet dreams for two', 3, 3, 2, 3, 1.50, 'bed_budget', '#FFFFFF,#FFFFFF,#FFFFFF,#525252,#525252,#525252', 32, 0, 1, 1, 450);
INSERT INTO `catalogue_items` VALUES (451, 'Black Plain Single Bed', 'All you need for a good night\'s kip', 3, 3, 1, 3, 1.50, 'bed_budget_one', '#FFFFFF,#FFFFFF,#FFFFFF,#525252,#525252,#525252', 32, 0, 1, 1, 451);
INSERT INTO `catalogue_items` VALUES (452, 'Beige Plain Double Bed', 'Sweet dreams for two', 3, 3, 2, 3, 1.50, 'bed_budgetb', '#FFFFFF,#FFFFFF,#FFFFFF,#F7EBBC,#F7EBBC,#F7EBBC', 32, 0, 1, 1, 452);
INSERT INTO `catalogue_items` VALUES (453, 'Beige Plain Single Bed', 'All you need for a good night\'s kip', 3, 3, 1, 3, 1.50, 'bed_budgetb_one', '#FFFFFF,#FFFFFF,#FFFFFF,#F7EBBC,#F7EBBC,#F7EBBC', 32, 0, 1, 1, 453);
INSERT INTO `catalogue_items` VALUES (454, 'Blue Plain Single Bed', 'Sweet dreams for two', 3, 3, 2, 3, 1.50, 'bed_budget', '#FFFFFF,#FFFFFF,#FFFFFF,#5EAAF8,#5EAAF8,#5EAAF8', 32, 0, 1, 1, 454);
INSERT INTO `catalogue_items` VALUES (455, 'Blue Plain Single Bed', 'All you need for a good night\'s kip', 3, 3, 1, 3, 1.50, 'bed_budget_one', '#FFFFFF,#FFFFFF,#FFFFFF,#5EAAF8,#5EAAF8,#5EAAF8', 32, 0, 1, 1, 455);
INSERT INTO `catalogue_items` VALUES (456, 'Green Plain Single Bed', 'Sweet dreams for two', 3, 3, 2, 3, 1.50, 'bed_budgetb', '#FFFFFF,#FFFFFF,#FFFFFF,#92D13D,#92D13D,#92D13D', 32, 0, 1, 1, 456);
INSERT INTO `catalogue_items` VALUES (457, 'Green Plain Single Bed', 'All you need for a good night\'s kip', 3, 3, 1, 3, 1.50, 'bed_budgetb_one', '#FFFFFF,#FFFFFF,#FFFFFF,#92D13D,#92D13D,#92D13D', 32, 0, 1, 1, 457);
INSERT INTO `catalogue_items` VALUES (458, 'Yellow Plain Single Bed', 'Sweet dreams for two', 3, 3, 2, 3, 1.50, 'bed_budget', '#FFFFFF,#FFFFFF,#FFFFFF,#FFD837,#FFD837,#FFD837', 32, 0, 1, 1, 458);
INSERT INTO `catalogue_items` VALUES (459, 'Yellow Plain Single Bed', 'All you need for a good night\'s kip', 3, 3, 1, 3, 1.50, 'bed_budget_one', '#FFFFFF,#FFFFFF,#FFFFFF,#FFD837,#FFD837,#FFD837', 32, 0, 1, 1, 459);
INSERT INTO `catalogue_items` VALUES (460, 'Red Plain Single Bed', 'Sweet dreams for two', 3, 3, 2, 3, 1.50, 'bed_budgetb', '#FFFFFF,#FFFFFF,#FFFFFF,#E14218,#E14218,#E14218', 32, 0, 1, 1, 460);
INSERT INTO `catalogue_items` VALUES (461, 'Red Plain Single Bed', 'All you need for a good night\'s kip', 3, 3, 1, 3, 1.50, 'bed_budgetb_one', '#FFFFFF,#FFFFFF,#FFFFFF,#E14218,#E14218,#E14218', 32, 0, 1, 1, 461);
INSERT INTO `catalogue_items` VALUES (462, 'Polar Sofa', 'Snuggle up together', 25, 2, 2, 1, 1.00, 'rclr_sofa', '0,0,0', -1, 0, 1, 1, 462);
INSERT INTO `catalogue_items` VALUES (463, 'Palm Chair', 'Watch out for coconuts', 25, 2, 1, 1, 1.00, 'rclr_chair', '0,0,0', -1, 0, 1, 1, 463);
INSERT INTO `catalogue_items` VALUES (464, 'Water Garden', 'Self watering', 25, 1, 1, 3, 0.00, 'rclr_garden', '0,0,0', -1, 0, 1, 1, 464);
INSERT INTO `catalogue_items` VALUES (465, 'White Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*0', '#ffffff,#ffffff,#ffffff,#ffffff', 34, 0, 1, 1, 465);
INSERT INTO `catalogue_items` VALUES (466, 'Pink Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*1', '#ffffff,#FF7C98,#ffffff,#ffffff', 34, 0, 1, 1, 466);
INSERT INTO `catalogue_items` VALUES (467, 'Red Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*2', '#ffffff,#FF3333,#ffffff,#ffffff', 34, 0, 1, 1, 467);
INSERT INTO `catalogue_items` VALUES (468, 'Aqua Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*3', '#ffffff,#67c39c,#ffffff,#ffffff', 34, 0, 1, 1, 468);
INSERT INTO `catalogue_items` VALUES (469, 'Gold Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*4', '#ffffff,#FFAA2B,#ffffff,#ffffff', 34, 0, 1, 1, 469);
INSERT INTO `catalogue_items` VALUES (470, 'Knight Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*5', '#ffffff,#555A37,#ffffff,#ffffff', 34, 0, 1, 1, 470);
INSERT INTO `catalogue_items` VALUES (471, 'Blue Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*6', '#ffffff,#A2E8FA,#ffffff,#ffffff', 34, 0, 1, 1, 471);
INSERT INTO `catalogue_items` VALUES (472, 'Purple Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*7', '#ffffff,#FC5AFF,#ffffff,#ffffff', 34, 0, 1, 1, 472);
INSERT INTO `catalogue_items` VALUES (473, 'Navy Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*8', '#ffffff,#1E8AA5,#ffffff,#ffffff', 34, 0, 1, 1, 473);
INSERT INTO `catalogue_items` VALUES (474, 'Green Habbo Roller', 'The power of movement', 5, 1, 1, 1, 0.50, 'queue_tile1*9', '#ffffff,#9AFF60,#ffffff,#ffffff', 34, 0, 1, 1, 474);
INSERT INTO `catalogue_items` VALUES (475, 'Rose Quartz Grand Piano', 'Chopin\'s revolutionary instrument', 10, 1, 2, 2, 0.00, 'grand_piano*1', '#FFFFFF,#FF8B8B,#FFFFFF', 35, 0, 1, 1, 475);
INSERT INTO `catalogue_items` VALUES (476, 'Rose Quartz Piano Stool', 'Here sat the legend of 1900', 2, 2, 1, 1, 1.20, 'romantique_pianochair*1', '#FFFFFF,#FF8B8B,#FFFFFF', 35, 0, 1, 1, 476);
INSERT INTO `catalogue_items` VALUES (477, 'Rose Quartz Chaise-Longue', 'Recline in continental comfort', 6, 2, 2, 1, 1.00, 'romantique_divan*1', '#FFFFFF,#FFFFFF,#FFFFFF,#FF8B8B', 35, 0, 1, 1, 477);
INSERT INTO `catalogue_items` VALUES (478, 'Rose Quartz Chair', 'Elegant seating for elegant Habbos', 5, 2, 1, 1, 1.00, 'romantique_chair*1', '#FFFFFF,#FF8B8B,#FFFFFF', 35, 0, 1, 1, 478);
INSERT INTO `catalogue_items` VALUES (479, 'Rose Quartz Screen', 'Beauty lies within', 6, 1, 2, 1, 0.00, 'romantique_divider*1', '#FF8B8B,#FF8B8B,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 35, 0, 1, 1, 479);
INSERT INTO `catalogue_items` VALUES (480, 'Rose Quartz Tray Table', 'Every tray needs a table...', 4, 1, 1, 1, 0.80, 'romantique_smalltabl*1', '#FFFFFF,#FF8B8B,#FFFFFF', 35, 0, 1, 1, 480);
INSERT INTO `catalogue_items` VALUES (481, 'Wall Mirror', 'Mirror, mirror on the wall', 4, 0, 0, 0, 0.00, 'wallmirror', '0,0,0', 35, 0, 1, 1, 481);
INSERT INTO `catalogue_items` VALUES (482, 'Treats Tray', 'Spoil yourself', 5, 1, 1, 1, 0.00, 'romantique_tray2', '0,0,0', 35, 0, 1, 1, 482);
INSERT INTO `catalogue_items` VALUES (483, 'Crystal Lamp', 'Light up your life', 6, 1, 1, 1, 0.00, 'rom_lamp', '0,0,0', 35, 0, 1, 1, 483);
INSERT INTO `catalogue_items` VALUES (484, 'Dressing Table', 'Get ready for your big date', 8, 1, 1, 1, 0.00, 'romantique_mirrortabl', '0,0,0', 35, 0, 1, 1, 484);
INSERT INTO `catalogue_items` VALUES (485, 'Romantique Clock', 'Tick-Tock!', 25, 1, 1, 1, 0.00, 'romantique_clock', '0,0,0', 35, 0, 1, 1, 485);
INSERT INTO `catalogue_items` VALUES (486, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard', '0,0,0', 36, 0, 1, 1, 486);
INSERT INTO `catalogue_items` VALUES (487, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*a', '#55AC00,#55AC00,#55AC00', 36, 0, 1, 1, 487);
INSERT INTO `catalogue_items` VALUES (488, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*b', '#336666,#336666,#336666', 36, 0, 1, 1, 488);
INSERT INTO `catalogue_items` VALUES (489, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*1', '#ff1f08', 36, 0, 1, 1, 489);
INSERT INTO `catalogue_items` VALUES (490, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*2', '#99DCCC', 36, 0, 1, 1, 490);
INSERT INTO `catalogue_items` VALUES (491, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*3', '#ffee00', 36, 0, 1, 1, 491);
INSERT INTO `catalogue_items` VALUES (492, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*4', '#ccddff', 36, 0, 1, 1, 492);
INSERT INTO `catalogue_items` VALUES (493, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*5', '#ddccff', 36, 0, 1, 1, 493);
INSERT INTO `catalogue_items` VALUES (494, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*6', '#777777', 36, 0, 1, 1, 494);
INSERT INTO `catalogue_items` VALUES (495, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*7', '#99CCFF,#99CCFF,#99CCFF', 36, 0, 1, 1, 495);
INSERT INTO `catalogue_items` VALUES (496, 'Floor Rug', 'Available in a variety of colours', 3, 4, 3, 5, 0.00, 'carpet_standard*8', '#999966,#999966,#999966', 36, 0, 1, 1, 496);
INSERT INTO `catalogue_items` VALUES (497, 'Soft Wool Rug', 'Soft Wool Rug', 3, 4, 2, 4, 0.00, 'carpet_soft', '', 36, 0, 1, 1, 497);
INSERT INTO `catalogue_items` VALUES (498, 'Soft Wool Rug', 'Soft Wool Rug', 3, 4, 2, 4, 0.00, 'carpet_soft*1', '#CC3333', 36, 0, 1, 1, 498);
INSERT INTO `catalogue_items` VALUES (499, 'Soft Wool Rug', 'Soft Wool Rug', 3, 4, 2, 4, 0.00, 'carpet_soft*2', '#66FFFF', 36, 0, 1, 1, 499);
INSERT INTO `catalogue_items` VALUES (500, 'Soft Wool Rug', 'Soft Wool Rug', 3, 4, 2, 4, 0.00, 'carpet_soft*3', '#FFCC99', 36, 0, 1, 1, 500);
INSERT INTO `catalogue_items` VALUES (501, 'Soft Wool Rug', 'Soft Wool Rug', 3, 4, 2, 4, 0.00, 'carpet_soft*4', '#FFCCFF', 36, 0, 1, 1, 501);
INSERT INTO `catalogue_items` VALUES (502, 'Soft Wool Rug', 'Soft Wool Rug', 3, 4, 2, 4, 0.00, 'carpet_soft*5', '#FFFF66', 36, 0, 1, 1, 502);
INSERT INTO `catalogue_items` VALUES (503, 'Soft Wool Rug', 'Soft Wool Rug', 3, 4, 2, 4, 0.00, 'carpet_soft*6', '#669933', 36, 0, 1, 1, 503);
INSERT INTO `catalogue_items` VALUES (504, 'Doormat', 'Welcome Habbos in style', 1, 4, 1, 1, 0.00, 'doormat_love', '0,0,0', 36, 0, 1, 1, 504);
INSERT INTO `catalogue_items` VALUES (505, 'Doormat', 'Available in a variety of colours', 1, 4, 1, 1, 0.00, 'doormat_plain', '0,0,0', 36, 0, 1, 1, 505);
INSERT INTO `catalogue_items` VALUES (506, 'Doormat', 'Available in a variety of colours', 1, 4, 1, 1, 0.00, 'doormat_plain*1', '#ff1f08', 36, 0, 1, 1, 506);
INSERT INTO `catalogue_items` VALUES (507, 'Doormat', 'Available in a variety of colours', 1, 4, 1, 1, 0.00, 'doormat_plain*2', '#99DCCC', 36, 0, 1, 1, 507);
INSERT INTO `catalogue_items` VALUES (508, 'Doormat', 'Available in a variety of colours', 1, 4, 1, 1, 0.00, 'doormat_plain*3', '#ffee00', 36, 0, 1, 1, 508);
INSERT INTO `catalogue_items` VALUES (509, 'Doormat', 'Available in a variety of colours', 1, 4, 1, 1, 0.00, 'doormat_plain*4', '#ccddff', 36, 0, 1, 1, 509);
INSERT INTO `catalogue_items` VALUES (510, 'Doormat', 'Available in a variety of colours', 1, 4, 1, 1, 0.00, 'doormat_plain*5', '#ddccff', 36, 0, 1, 1, 510);
INSERT INTO `catalogue_items` VALUES (511, 'Doormat', 'Available in a variety of colours', 1, 4, 1, 1, 0.00, 'doormat_plain*6', '#777777', 36, 0, 1, 1, 511);
INSERT INTO `catalogue_items` VALUES (512, 'Hand-Woven Rug', 'Adds instant warmth', 3, 4, 2, 4, 0.00, 'carpet_armas', '0,0,0', 36, 0, 1, 1, 512);
INSERT INTO `catalogue_items` VALUES (513, 'Faux-Fur Bear Rug', 'For cuddling up on', 4, 4, 2, 3, 0.00, 'carpet_polar', '#ffffff,#ffffff,#ffffff', 36, 0, 1, 1, 513);
INSERT INTO `catalogue_items` VALUES (514, 'Blue Bear Rug', 'Snuggle up on a Funky bear rug...', 10, 4, 2, 3, 0.00, 'carpet_polar*2', '#ccddff,#ccddff,#ffffff', 36, 0, 1, 1, 514);
INSERT INTO `catalogue_items` VALUES (515, 'Yellow Bear Rug', 'Snuggle up on a Funky bear rug...', 10, 4, 2, 3, 0.00, 'carpet_polar*3', '#ffee99,#ffee99,#ffffff', 36, 0, 1, 1, 515);
INSERT INTO `catalogue_items` VALUES (516, 'Green Bear Rug', 'Snuggle up on a Funky bear rug...', 10, 4, 2, 3, 0.00, 'carpet_polar*4', '#ddffaa,#ddffaa,#ffffff', 36, 0, 1, 1, 516);
INSERT INTO `catalogue_items` VALUES (517, 'Hockey stick', 'whack that ball!', 3, 0, 0, 0, 0.00, 'poster 52', '0,0,0', 37, 0, 1, 1, 517);
INSERT INTO `catalogue_items` VALUES (518, 'Hockey stick', 'whack that ball!', 3, 0, 0, 0, 0.00, 'poster 53', '0,0,0', 37, 0, 1, 1, 518);
INSERT INTO `catalogue_items` VALUES (519, 'Hockey stick', 'whack that ball!', 3, 0, 0, 0, 0.00, 'poster 54', '0,0,0', 37, 0, 1, 1, 519);
INSERT INTO `catalogue_items` VALUES (520, 'Scoreboard', '...for keeping your score', 6, 1, 1, 1, 0.00, 'hockey_score', '0,0,0', 37, 0, 1, 1, 520);
INSERT INTO `catalogue_items` VALUES (521, 'Basketball Trophy', 'For the winning team', 3, 1, 1, 1, 0.00, 'legotrophy', '0,0,0', 37, 0, 1, 1, 521);
INSERT INTO `catalogue_items` VALUES (522, 'Basketball Hoop', '2 points for every basket', 3, 0, 0, 0, 0.00, 'poster 51', '0,0,0', 37, 0, 1, 1, 522);
INSERT INTO `catalogue_items` VALUES (523, 'Basketball Court', 'Line up your slam dunk', 3, 4, 3, 3, 0.00, 'carpet_legocourt', '0,0,0', 37, 0, 1, 1, 523);
INSERT INTO `catalogue_items` VALUES (524, 'Team Bench', 'For your reserve players', 6, 2, 4, 1, 1.00, 'bench_lego', '0,0,0', 37, 0, 1, 1, 524);
INSERT INTO `catalogue_items` VALUES (525, 'Football Lamp', 'Let\'s get sporty!', 10, 4, 1, 1, 0.00, 'footylamp', '0,0,0', 37, 0, 1, 1, 525);
INSERT INTO `catalogue_items` VALUES (526, 'Sport track straight', 'Let\'s get sporty!', 3, 4, 2, 2, 0.00, 'sporttrack1*1', '#ffffff,#e4592d,#ffffff', 37, 0, 1, 1, 526);
INSERT INTO `catalogue_items` VALUES (527, 'Sport track straight asphalt', 'Let\'s get sporty!', 3, 4, 2, 2, 0.00, 'sporttrack1*2', '#ffffff,#62818b,#ffffff', 37, 0, 1, 1, 527);
INSERT INTO `catalogue_items` VALUES (528, 'Sport track straight grass', 'Let\'s get sporty!', 3, 4, 2, 2, 0.00, 'sporttrack1*3', '#ffffff,#5cb800,#ffffff', 37, 0, 1, 1, 528);
INSERT INTO `catalogue_items` VALUES (529, 'Sport corner', 'Let\'s get sporty!', 3, 4, 2, 2, 0.00, 'sporttrack2*1', '#ffffff,#e4592d,#ffffff', 37, 0, 1, 1, 529);
INSERT INTO `catalogue_items` VALUES (530, 'Sport corner asphalt', 'Let\'s get sporty!', 3, 4, 2, 2, 0.00, 'sporttrack2*2', '#ffffff,#62818b,#ffffff', 37, 0, 1, 1, 530);
INSERT INTO `catalogue_items` VALUES (531, 'Sport corner grass', 'Let\'s get sporty!', 3, 4, 2, 2, 0.00, 'sporttrack2*3', '#ffffff,#5cb800,#ffffff', 37, 0, 1, 1, 531);
INSERT INTO `catalogue_items` VALUES (532, 'Sport goal', 'Let\'s get sporty!', 3, 4, 2, 2, 0.00, 'sporttrack3*1', '#ffffff,#e4592d,#ffffff', 37, 0, 1, 1, 532);
INSERT INTO `catalogue_items` VALUES (533, 'Sport goal asphalt', 'Let\'s get sporty!', 3, 4, 2, 2, 0.00, 'sporttrack3*2', '#ffffff,#62818b,#ffffff', 37, 0, 1, 1, 533);
INSERT INTO `catalogue_items` VALUES (534, 'Sport goal grass', 'Let\'s get sporty!', 3, 4, 2, 2, 0.00, 'sporttrack3*3', '#ffffff,#5cb800,#ffffff', 37, 0, 1, 1, 534);
INSERT INTO `catalogue_items` VALUES (535, 'Telephone Box', 'Dr Who?', 5, 1, 1, 1, 0.00, 'door', '0,0,0', 38, 0, 1, 1, 535);
INSERT INTO `catalogue_items` VALUES (536, 'Portaloo', 'In a hurry?', 4, 1, 1, 1, 0.00, 'doorC', '0,0,0', 38, 0, 1, 1, 536);
INSERT INTO `catalogue_items` VALUES (537, 'Wardrobe', 'Narnia this way!', 3, 1, 1, 1, 0.00, 'doorB', '0,0,0', 38, 0, 1, 1, 537);
INSERT INTO `catalogue_items` VALUES (538, 'Teleport Door', 'Magic doorway to anywhere!', 6, 1, 1, 1, 0.00, 'teleport_door', '0,0,0', 38, 0, 1, 1, 538);
INSERT INTO `catalogue_items` VALUES (539, 'Gray Traxmachine', 'Feel tha beat', 8, 1, 1, 1, 2.10, 'sound_machine', '#FFFFFF,#FFFFFF,#828282,#FFFFFF', 39, 0, 1, 1, 539);
INSERT INTO `catalogue_items` VALUES (540, 'Ambient 1', 'Chilled out beats', 5, 1, 1, 1, 0.20, 'sound_set_4', '0,0,0', 39, 0, 1, 1, 540);
INSERT INTO `catalogue_items` VALUES (541, 'Ambient 2', 'Mellow electric grooves', 5, 1, 1, 1, 0.20, 'sound_set_8', '0,0,0', 39, 0, 1, 1, 541);
INSERT INTO `catalogue_items` VALUES (542, 'Ambient 3', 'Background ambience loops', 5, 1, 1, 1, 0.20, 'sound_set_6', '0,0,0', 39, 0, 1, 1, 542);
INSERT INTO `catalogue_items` VALUES (543, 'Ambient 4', 'The dark side of Habbo', 5, 1, 1, 1, 0.20, 'sound_set_5', '0,0,0', 39, 0, 1, 1, 543);
INSERT INTO `catalogue_items` VALUES (544, 'Groove 1', 'Bollywood Beats!', 5, 1, 1, 1, 0.20, 'sound_set_26', '0,0,0', 39, 0, 1, 1, 544);
INSERT INTO `catalogue_items` VALUES (545, 'Groove 2', 'Jingle Bells will never be the same...', 5, 1, 1, 1, 0.20, 'sound_set_27', '0,0,0', 39, 0, 1, 1, 545);
INSERT INTO `catalogue_items` VALUES (546, 'Groove 3', 'Jive\'s Alive!', 5, 1, 1, 1, 0.20, 'sound_set_17', '0,0,0', 39, 0, 1, 1, 546);
INSERT INTO `catalogue_items` VALUES (547, 'Groove 4', 'Listen while you tan', 5, 1, 1, 1, 0.20, 'sound_set_18', '0,0,0', 39, 0, 1, 1, 547);
INSERT INTO `catalogue_items` VALUES (548, 'Electronic 1', 'Chilled grooves', 5, 1, 1, 1, 0.20, 'sound_set_3', '0,0,0', 39, 0, 1, 1, 548);
INSERT INTO `catalogue_items` VALUES (549, 'Electronic 2', 'Mystical ambient soundscapes', 5, 1, 1, 1, 0.20, 'sound_set_9', '0,0,0', 39, 0, 1, 1, 549);
INSERT INTO `catalogue_items` VALUES (550, 'Jukebox', 'For your Happy Days!', 5, 1, 1, 1, 0.00, 'jukebox*1', '0,0,0', 40, 0, 1, 1, 550);
INSERT INTO `catalogue_items` VALUES (551, 'Disco Sign', 'Serious partying going on!', 15, 0, 0, 0, 0.00, 'poster 56', '0,0,0', 40, 0, 1, 1, 551);
INSERT INTO `catalogue_items` VALUES (552, 'Club 1', 'De bada bada bo!', 5, 1, 1, 1, 0.20, 'sound_set_46', '0,0,0', 40, 0, 1, 1, 552);
INSERT INTO `catalogue_items` VALUES (553, 'Club 2', 'Storm the UKCharts!', 5, 1, 1, 1, 0.20, 'sound_set_47', '0,0,0', 40, 0, 1, 1, 553);
INSERT INTO `catalogue_items` VALUES (554, 'Club 3', 'Sweet party beat', 5, 1, 1, 1, 0.20, 'sound_set_48', '0,0,0', 40, 0, 1, 1, 554);
INSERT INTO `catalogue_items` VALUES (555, 'Club 4', 'You will belong', 5, 1, 1, 1, 0.20, 'sound_set_49', '0,0,0', 40, 0, 1, 1, 555);
INSERT INTO `catalogue_items` VALUES (556, 'Club 5', 'The harder generation', 5, 1, 1, 1, 0.20, 'sound_set_50', '0,0,0', 40, 0, 1, 1, 556);
INSERT INTO `catalogue_items` VALUES (557, 'Club 6', 'Bop to the beat', 5, 1, 1, 1, 0.20, 'sound_set_51', '0,0,0', 40, 0, 1, 1, 557);
INSERT INTO `catalogue_items` VALUES (558, 'Dance 1', 'Actually, it\'s Partay!', 5, 1, 1, 1, 0.20, 'sound_set_25', '0,0,0', 40, 0, 1, 1, 558);
INSERT INTO `catalogue_items` VALUES (559, 'Dance 2', 'Electronic house', 5, 1, 1, 1, 0.20, 'sound_set_29', '0,0,0', 40, 0, 1, 1, 559);
INSERT INTO `catalogue_items` VALUES (560, 'Dance 3', 'House loops', 5, 1, 1, 1, 0.20, 'sound_set_31', '0,0,0', 40, 0, 1, 1, 560);
INSERT INTO `catalogue_items` VALUES (561, 'Dance 4', 'Music you can really sink your teeth into', 5, 1, 1, 1, 0.20, 'sound_set_11', '0,0,0', 40, 0, 1, 1, 561);
INSERT INTO `catalogue_items` VALUES (562, 'Dance 5', 'Let Music be the food of Habbo', 5, 1, 1, 1, 0.20, 'sound_set_13', '0,0,0', 40, 0, 1, 1, 562);
INSERT INTO `catalogue_items` VALUES (563, 'Dance 6', 'Groovelicious', 5, 1, 1, 1, 0.20, 'sound_set_35', '0,0,0', 40, 0, 1, 1, 563);
INSERT INTO `catalogue_items` VALUES (564, 'Jukebox', 'For your Happy Days!', 5, 1, 1, 1, 0.00, 'jukebox*1', '0,0,0', 41, 0, 1, 1, 564);
INSERT INTO `catalogue_items` VALUES (565, 'V-Guitar', 'V-Guitar', 5, 0, 0, 0, 0.00, 'guitar_v', '0,0,0', 41, 0, 1, 1, 565);
INSERT INTO `catalogue_items` VALUES (566, 'Skull-Guitar', 'Skull-Guitar', 5, 0, 0, 0, 0.00, 'guitar_skull', '0,0,0', 41, 0, 1, 1, 566);
INSERT INTO `catalogue_items` VALUES (567, 'Rock 1', 'Headbanging riffs', 5, 1, 1, 1, 0.20, 'sound_set_21', '0,0,0', 41, 0, 1, 1, 567);
INSERT INTO `catalogue_items` VALUES (568, 'Rock 2', 'Head for the pit!', 5, 1, 1, 1, 0.20, 'sound_set_28', '0,0,0', 41, 0, 1, 1, 568);
INSERT INTO `catalogue_items` VALUES (569, 'Rock 3', 'Guitar solo set', 5, 1, 1, 1, 0.20, 'sound_set_33', '0,0,0', 41, 0, 1, 1, 569);
INSERT INTO `catalogue_items` VALUES (570, 'Rock 4', 'Dude? Cheese!', 5, 1, 1, 1, 0.20, 'sound_set_40', '0,0,0', 41, 0, 1, 1, 570);
INSERT INTO `catalogue_items` VALUES (571, 'Rock 5', 'For guitar heroes', 5, 1, 1, 1, 0.20, 'sound_set_34', '0,0,0', 41, 0, 1, 1, 571);
INSERT INTO `catalogue_items` VALUES (572, 'Rock 6', 'Rock and Roses!', 5, 1, 1, 1, 0.20, 'sound_set_38', '0,0,0', 41, 0, 1, 1, 572);
INSERT INTO `catalogue_items` VALUES (573, 'Rock 7', 'Rock with a roll', 5, 1, 1, 1, 0.20, 'sound_set_39', '0,0,0', 41, 0, 1, 1, 573);
INSERT INTO `catalogue_items` VALUES (574, 'Rock 8', 'Burning Riffs', 5, 1, 1, 1, 0.20, 'sound_set_41', '0,0,0', 41, 0, 1, 1, 574);
INSERT INTO `catalogue_items` VALUES (575, 'Jukebox', 'For your Happy Days!', 5, 1, 1, 1, 0.00, 'jukebox*1', '0,0,0', 42, 0, 1, 1, 575);
INSERT INTO `catalogue_items` VALUES (576, 'Habbo Sounds 1', 'Get the party started!', 5, 1, 1, 1, 0.20, 'sound_set_1', '0,0,0', 42, 0, 1, 1, 576);
INSERT INTO `catalogue_items` VALUES (577, 'Habbo Sounds 2', 'Unusual as Standard', 5, 1, 1, 1, 0.20, 'sound_set_12', '0,0,0', 42, 0, 1, 1, 577);
INSERT INTO `catalogue_items` VALUES (578, 'Habbo Sounds 3', 'Get the party started!', 5, 1, 1, 1, 0.20, 'sound_set_2', '0,0,0', 42, 0, 1, 1, 578);
INSERT INTO `catalogue_items` VALUES (579, 'Habbo Sounds 4', 'It\'s all about the Pentiums, baby!', 5, 1, 1, 1, 0.20, 'sound_set_24', '0,0,0', 42, 0, 1, 1, 579);
INSERT INTO `catalogue_items` VALUES (580, 'SFX 1', 'Beware zombies!', 5, 1, 1, 1, 0.20, 'sound_set_43', '0,0,0', 42, 0, 1, 1, 580);
INSERT INTO `catalogue_items` VALUES (581, 'SFX 2', 'Musical heaven', 5, 1, 1, 1, 0.20, 'sound_set_20', '0,0,0', 42, 0, 1, 1, 581);
INSERT INTO `catalogue_items` VALUES (582, 'SFX 3', 'With a hamper full of sounds, not sarnies', 5, 1, 1, 1, 0.20, 'sound_set_22', '0,0,0', 42, 0, 1, 1, 582);
INSERT INTO `catalogue_items` VALUES (583, 'SFX 4', 'Don\'t be afraid of the dark', 5, 1, 1, 1, 0.20, 'sound_set_23', '0,0,0', 42, 0, 1, 1, 583);
INSERT INTO `catalogue_items` VALUES (584, 'SFX 5', 'Sound effects for Furni', 5, 1, 1, 1, 0.20, 'sound_set_7', '0,0,0', 42, 0, 1, 1, 584);
INSERT INTO `catalogue_items` VALUES (585, 'Instrumental 1', 'Moments in love', 5, 1, 1, 1, 0.20, 'sound_set_30', '0,0,0', 42, 0, 1, 1, 585);
INSERT INTO `catalogue_items` VALUES (586, 'Instrumental 2', 'Piano concert set', 5, 1, 1, 1, 0.20, 'sound_set_32', '0,0,0', 42, 0, 1, 1, 586);
INSERT INTO `catalogue_items` VALUES (587, 'Latin Love 1', 'For adult minded', 5, 1, 1, 1, 0.20, 'sound_set_36', '0,0,0', 43, 0, 1, 1, 587);
INSERT INTO `catalogue_items` VALUES (588, 'Latin Love 2', 'Love and affection!', 5, 1, 1, 1, 0.20, 'sound_set_60', '0,0,0', 43, 0, 1, 1, 588);
INSERT INTO `catalogue_items` VALUES (589, 'Latin Love 3', 'Straight from the heart', 5, 1, 1, 1, 0.20, 'sound_set_61', '0,0,0', 43, 0, 1, 1, 589);
INSERT INTO `catalogue_items` VALUES (590, 'RnB Grooves 1', 'Can you fill me in?', 5, 1, 1, 1, 0.20, 'sound_set_55', '0,0,0', 43, 0, 1, 1, 590);
INSERT INTO `catalogue_items` VALUES (591, 'RnB Grooves 2', 'Get down tonight!', 5, 1, 1, 1, 0.20, 'sound_set_56', '0,0,0', 43, 0, 1, 1, 591);
INSERT INTO `catalogue_items` VALUES (592, 'RnB Grooves 3', 'Feel the groove', 5, 1, 1, 1, 0.20, 'sound_set_57', '0,0,0', 43, 0, 1, 1, 592);
INSERT INTO `catalogue_items` VALUES (593, 'RnB Grooves 4', 'Sh-shake it!', 5, 1, 1, 1, 0.20, 'sound_set_58', '0,0,0', 43, 0, 1, 1, 593);
INSERT INTO `catalogue_items` VALUES (594, 'RnB Grooves 5', 'Urban break beats', 5, 1, 1, 1, 0.20, 'sound_set_59', '0,0,0', 43, 0, 1, 1, 594);
INSERT INTO `catalogue_items` VALUES (595, 'RnB Grooves 6', 'Unadulterated essentials', 5, 1, 1, 1, 0.20, 'sound_set_15', '0,0,0', 43, 0, 1, 1, 595);
INSERT INTO `catalogue_items` VALUES (596, 'Hip Hop Beats 1', 'Made from real Boy Bands!', 5, 1, 1, 1, 0.20, 'sound_set_10', '0,0,0', 43, 0, 1, 1, 596);
INSERT INTO `catalogue_items` VALUES (597, 'Hip Hop Beats 2', 'Rock them bodies', 5, 1, 1, 1, 0.20, 'sound_set_14', '0,0,0', 43, 0, 1, 1, 597);
INSERT INTO `catalogue_items` VALUES (598, 'Hip Hop Beats 3', 'Ferry, ferry good!', 5, 1, 1, 1, 0.20, 'sound_set_16', '0,0,0', 43, 0, 1, 1, 598);
INSERT INTO `catalogue_items` VALUES (599, 'Hip Hop Beats 4', 'Shake your body!', 5, 1, 1, 1, 0.20, 'sound_set_19', '0,0,0', 43, 0, 1, 1, 599);
INSERT INTO `catalogue_items` VALUES (600, 'Classic trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy*1', '#ffffff,#ffffff,#FFDD3F', 44, 0, 1, 1, 600);
INSERT INTO `catalogue_items` VALUES (601, 'Classic trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy*2', '#ffffff,#ffffff,#ffffff', 44, 0, 1, 1, 601);
INSERT INTO `catalogue_items` VALUES (602, 'Classic trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy*3', '#ffffff,#ffffff,#996600', 44, 0, 1, 1, 602);
INSERT INTO `catalogue_items` VALUES (603, 'Duck trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy2*1', '#ffffff,#ffffff,#FFDD3F', 44, 0, 1, 1, 603);
INSERT INTO `catalogue_items` VALUES (604, 'Duck trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy2*2', '#ffffff,#ffffff,#ffffff', 44, 0, 1, 1, 604);
INSERT INTO `catalogue_items` VALUES (605, 'Duck trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy2*3', '#ffffff,#ffffff,#996600', 44, 0, 1, 1, 605);
INSERT INTO `catalogue_items` VALUES (606, 'Globe trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy3*1', '#ffffff,#ffffff,#FFDD3F', 44, 0, 1, 1, 606);
INSERT INTO `catalogue_items` VALUES (607, 'Globe trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy3*2', '#ffffff,#ffffff,#ffffff', 44, 0, 1, 1, 607);
INSERT INTO `catalogue_items` VALUES (608, 'Globe trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy3*3', '#ffffff,#ffffff,#996600', 44, 0, 1, 1, 608);
INSERT INTO `catalogue_items` VALUES (609, 'Fish trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy4*1', '#ffffff,#ffffff,#FFDD3F', 44, 0, 1, 1, 609);
INSERT INTO `catalogue_items` VALUES (610, 'Fish trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy4*2', '#ffffff,#ffffff,#ffffff', 44, 0, 1, 1, 610);
INSERT INTO `catalogue_items` VALUES (611, 'Fish trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy4*3', '#ffffff,#ffffff,#996600', 44, 0, 1, 1, 611);
INSERT INTO `catalogue_items` VALUES (612, 'Duo trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy5*1', '#ffffff,#ffffff,#FFDD3F', 44, 0, 1, 1, 612);
INSERT INTO `catalogue_items` VALUES (613, 'Duo trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy5*2', '#ffffff,#ffffff,#ffffff', 44, 0, 1, 1, 613);
INSERT INTO `catalogue_items` VALUES (614, 'Duo trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy5*3', '#ffffff,#ffffff,#996600', 44, 0, 1, 1, 614);
INSERT INTO `catalogue_items` VALUES (615, 'Champion trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy6*1', '#ffffff,#ffffff,#FFDD3F', 44, 0, 1, 1, 615);
INSERT INTO `catalogue_items` VALUES (616, 'Champion trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy6*2', '#ffffff,#ffffff,#ffffff', 44, 0, 1, 1, 616);
INSERT INTO `catalogue_items` VALUES (617, 'Champion trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy6*3', '#ffffff,#ffffff,#996600', 44, 0, 1, 1, 617);
INSERT INTO `catalogue_items` VALUES (618, 'Duo trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy8*1', '#ffffff,#ffffff,#FFDD3F', 44, 0, 1, 1, 618);
INSERT INTO `catalogue_items` VALUES (619, 'Champion trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy9*1', '#ffffff,#ffffff,#FFDD3F', 44, 0, 1, 1, 619);
INSERT INTO `catalogue_items` VALUES (620, 'Snowman Poster', 'A new use for carrots!', 3, 0, 0, 0, 0.00, 'poster 20', '0,0,0', 45, 0, 1, 1, 620);
INSERT INTO `catalogue_items` VALUES (621, 'Angel Poster', 'See that halo gleam!', 3, 0, 0, 0, 0.00, 'poster 21', '0,0,0', 45, 0, 1, 1, 621);
INSERT INTO `catalogue_items` VALUES (622, 'Winter Wonderland Poster', 'A chilly snowy scene', 3, 0, 0, 0, 0.00, 'poster 22', '0,0,0', 45, 0, 1, 1, 622);
INSERT INTO `catalogue_items` VALUES (623, 'Santa Poster Poster', 'The jolly fat man himself', 3, 0, 0, 0, 0.00, 'poster 23', '0,0,0', 45, 0, 1, 1, 623);
INSERT INTO `catalogue_items` VALUES (624, 'Three Wise Men Poster', 'Following the star!', 3, 0, 0, 0, 0.00, 'poster 24', '0,0,0', 45, 0, 1, 1, 624);
INSERT INTO `catalogue_items` VALUES (625, 'Reindeer Poster', 'Doing a hard night\'s work', 3, 0, 0, 0, 0.00, 'poster 25', '0,0,0', 45, 0, 1, 1, 625);
INSERT INTO `catalogue_items` VALUES (626, 'Stocking', 'Hung yours up yet?', 3, 0, 0, 0, 0.00, 'poster 26', '0,0,0', 45, 0, 1, 1, 626);
INSERT INTO `catalogue_items` VALUES (627, 'Holly Garland', 'Deck the halls!', 3, 0, 0, 0, 0.00, 'poster 27', '0,0,0', 45, 0, 1, 1, 627);
INSERT INTO `catalogue_items` VALUES (628, 'Tinsel (silver)', 'A touch of festive sparkle', 3, 0, 0, 0, 0.00, 'poster 28', '0,0,0', 45, 0, 1, 1, 628);
INSERT INTO `catalogue_items` VALUES (629, 'Tinsel (gold)', 'A touch of festive sparkle', 3, 0, 0, 0, 0.00, 'poster 29', '0,0,0', 45, 0, 1, 1, 629);
INSERT INTO `catalogue_items` VALUES (630, 'Mistletoe', 'Pucker up', 3, 0, 0, 0, 0.00, 'poster 30', '0,0,0', 45, 0, 1, 1, 630);
INSERT INTO `catalogue_items` VALUES (631, 'Small gold star', 'Twinkle, twinkle', 3, 0, 0, 0, 0.00, 'poster 46', '0,0,0', 45, 0, 1, 1, 631);
INSERT INTO `catalogue_items` VALUES (632, 'Small silver star', 'Twinkle, twinkle', 3, 0, 0, 0, 0.00, 'poster 47', '0,0,0', 45, 0, 1, 1, 632);
INSERT INTO `catalogue_items` VALUES (633, 'Large gold star', 'All that glitters...', 3, 0, 0, 0, 0.00, 'poster 48', '0,0,0', 45, 0, 1, 1, 633);
INSERT INTO `catalogue_items` VALUES (634, 'Large silver star', 'All that glitters...', 3, 0, 0, 0, 0.00, 'poster 49', '0,0,0', 45, 0, 1, 1, 634);
INSERT INTO `catalogue_items` VALUES (635, 'Dead tree', 'Dead christmas tree', 6, 1, 1, 1, 0.00, 'tree1', '0,0,0', -1, 0, 1, 1, 635);
INSERT INTO `catalogue_items` VALUES (636, 'Old Christmas Tree', 'Old Christmas Tree', 6, 1, 1, 1, 0.00, 'tree2', '0,0,0', 45, 0, 1, 1, 636);
INSERT INTO `catalogue_items` VALUES (637, 'Christmas Tree 1', 'Any presents under it yet?', 6, 1, 1, 1, 0.00, 'tree3', '0,0,0', 45, 0, 1, 1, 637);
INSERT INTO `catalogue_items` VALUES (638, 'Christmas Tree 2', 'Any presents under it yet?', 6, 1, 1, 1, 0.00, 'tree4', '0,0,0', 45, 0, 1, 1, 638);
INSERT INTO `catalogue_items` VALUES (639, 'Christmas Tree 3', 'Any presents under it yet?', 6, 1, 1, 1, 0.00, 'tree5', '0,0,0', 45, 0, 1, 1, 639);
INSERT INTO `catalogue_items` VALUES (640, 'Flashy Christmas Tree', 'The future\'s bright!', 6, 1, 1, 1, 0.00, 'tree6', '0,0,0', -1, 0, 1, 1, 640);
INSERT INTO `catalogue_items` VALUES (641, 'Electric Candles', 'No need to worry about wax drips', 3, 1, 1, 1, 0.00, 'triplecandle', '0,0,0', 45, 0, 1, 1, 641);
INSERT INTO `catalogue_items` VALUES (642, 'Roast Turkey', 'Where\'s the cranberry sauce?', 3, 1, 1, 1, 0.00, 'turkey', '0,0,0', 45, 0, 1, 1, 642);
INSERT INTO `catalogue_items` VALUES (643, 'Gingerbread House', 'Good enough to eat', 3, 1, 1, 1, 0.00, 'house', '0,0,0', 45, 0, 1, 1, 643);
INSERT INTO `catalogue_items` VALUES (644, 'Gingerbread House', 'Good enough to eat', 3, 1, 1, 1, 0.00, 'house2', '0,0,0', 45, 0, 1, 1, 644);
INSERT INTO `catalogue_items` VALUES (645, 'Christmas Pudding', 'Will you get the lucky sixpence?', 3, 1, 1, 1, 0.00, 'pudding', '0,0,0', 45, 0, 1, 1, 645);
INSERT INTO `catalogue_items` VALUES (646, 'Christmas Rubber Duck', 'A right Christmas quacker!', 2, 1, 1, 1, 0.00, 'xmasduck', '0,0,0', 45, 0, 1, 1, 646);
INSERT INTO `catalogue_items` VALUES (647, 'Pink Hyacinth', 'Beautiful bulb', 3, 1, 1, 1, 0.00, 'hyacinth1', '0,0,0', 45, 0, 1, 1, 647);
INSERT INTO `catalogue_items` VALUES (648, 'Blue Hyacinth', 'Beautiful bulb', 3, 1, 1, 1, 0.00, 'hyacinth2', '0,0,0', 45, 0, 1, 1, 648);
INSERT INTO `catalogue_items` VALUES (649, 'Poinsetta', 'Christmas in a pot', 3, 1, 1, 1, 0.00, 'joulutahti', '0,0,0', 45, 0, 1, 1, 649);
INSERT INTO `catalogue_items` VALUES (650, 'Red Candle', 'Xmas tea light', 3, 1, 1, 1, 0.00, 'rcandle', '0,0,0', 45, 0, 1, 1, 650);
INSERT INTO `catalogue_items` VALUES (651, 'White Candle', 'Xmas tea light', 3, 1, 1, 1, 0.00, 'wcandle', '0,0,0', 45, 0, 1, 1, 651);
INSERT INTO `catalogue_items` VALUES (652, 'Wannabe bunny', 'Can you tell what it is yet?', 2, 1, 1, 1, 0.00, 'easterduck', '0,0,0', 46, 0, 1, 1, 652);
INSERT INTO `catalogue_items` VALUES (653, 'Pop-up Egg', 'Cheep (!) and cheerful', 5, 1, 1, 1, 0.00, 'birdie', '0,0,0', 46, 0, 1, 1, 653);
INSERT INTO `catalogue_items` VALUES (654, 'Basket Of Eggs', 'Eggs-actly what you want for Easter', 4, 1, 1, 1, 0.00, 'basket', '0,0,0', 46, 0, 1, 1, 654);
INSERT INTO `catalogue_items` VALUES (655, 'Squidgy Bunny', 'Yours to cuddle up to', 3, 1, 1, 1, 0.00, 'bunny', '0,0,0', 46, 0, 1, 1, 655);
INSERT INTO `catalogue_items` VALUES (656, 'Pumpkin Lamp', 'Cast a spooky glow', 6, 1, 1, 1, 0.00, 'pumpkin', '0,0,0', 47, 0, 1, 1, 656);
INSERT INTO `catalogue_items` VALUES (657, 'Spiderweb', 'Not something you want to run into', 3, 0, 0, 0, 0.00, 'poster 42', '0,0,0', 47, 0, 1, 1, 657);
INSERT INTO `catalogue_items` VALUES (658, 'Chains', 'Shake, rattle and roll!', 4, 0, 0, 0, 0.00, 'poster 43', '0,0,0', 47, 0, 1, 1, 658);
INSERT INTO `catalogue_items` VALUES (659, 'Skull Candle Holder', 'Alas poor Yorrick...', 4, 1, 1, 1, 0.00, 'skullcandle', '0,0,0', 47, 0, 1, 1, 659);
INSERT INTO `catalogue_items` VALUES (660, 'Skeleton', 'Needs a few more Habburgers', 3, 0, 0, 0, 0.00, 'poster 45', '0,0,0', 47, 0, 1, 1, 660);
INSERT INTO `catalogue_items` VALUES (661, 'Mummy', 'Beware the curse...', 3, 0, 0, 0, 0.00, 'poster 44', '0,0,0', 47, 0, 1, 1, 661);
INSERT INTO `catalogue_items` VALUES (662, 'Dead Duck', 'Blood, but no guts', 2, 1, 1, 1, 0.00, 'deadduck', '0,0,0', 47, 0, 1, 1, 662);
INSERT INTO `catalogue_items` VALUES (663, 'Dead Duck 2', 'Someone forgot to feed me...', 2, 1, 1, 1, 0.00, 'deadduck2', '0,0,0', 47, 0, 1, 1, 663);
INSERT INTO `catalogue_items` VALUES (664, 'Dead Duck 3', 'With added ectoplasm', 2, 1, 1, 1, 0.00, 'deadduck3', '0,0,0', 47, 0, 1, 1, 664);
INSERT INTO `catalogue_items` VALUES (665, 'Bat Poster', 'flap, flap, screech, screech...', 3, 0, 0, 0, 0.00, 'poster 50', '0,0,0', 47, 0, 1, 1, 665);
INSERT INTO `catalogue_items` VALUES (666, 'Jolly Roger', 'For pirates everywhere', 3, 0, 0, 0, 0.00, 'poster 501', '0,0,0', 47, 0, 1, 1, 666);
INSERT INTO `catalogue_items` VALUES (667, 'Eaten Ham', 'Looks like you\'re too late!', 3, 1, 1, 1, 0.00, 'ham2', '0,0,0', 47, 0, 1, 1, 667);
INSERT INTO `catalogue_items` VALUES (668, 'Creepy Crypt', 'What lurks inside?', 5, 3, 1, 3, 1.00, 'habboween_crypt', '0,0,0', 47, 0, 1, 1, 668);
INSERT INTO `catalogue_items` VALUES (669, 'Unholy Ground', 'Autumnal chills with each rotation!', 5, 4, 2, 2, 0.00, 'habboween_grass', '0,0,0', 47, 0, 1, 1, 669);
INSERT INTO `catalogue_items` VALUES (670, 'Habboween Cauldron', 'Eye of Habbo and toe of Mod!', 5, 1, 1, 1, 0.00, 'hal_cauldron', '0,0,0', 47, 0, 1, 1, 670);
INSERT INTO `catalogue_items` VALUES (671, 'Haunted Grave', 'We\'re raising the dead!', 5, 1, 1, 1, 0.00, 'hal_grave', '0,0,0', 47, 0, 1, 1, 671);
INSERT INTO `catalogue_items` VALUES (672, 'Heart Sofa', 'Perfect for snuggling up on', 5, 2, 2, 1, 1.00, 'heartsofa', '0,0,0', 48, 0, 1, 1, 672);
INSERT INTO `catalogue_items` VALUES (673, 'Cupid Statue', 'Watch out for those arrows!', 3, 1, 1, 1, 0.00, 'statue', '0,0,0', 48, 0, 1, 1, 673);
INSERT INTO `catalogue_items` VALUES (674, 'Giant Heart', 'Full of love', 6, 1, 2, 1, 0.00, 'heart', '0,0,0', 48, 0, 1, 1, 674);
INSERT INTO `catalogue_items` VALUES (675, 'Valentine\'s Duck', 'He\'s lovestruck', 2, 1, 1, 1, 0.00, 'valeduck', '0,0,0', 48, 0, 1, 1, 675);
INSERT INTO `catalogue_items` VALUES (676, 'Heart stickies', 'Heart stickies', 3, 0, 0, 0, 0.00, 'post.it.vd', '0,0,0', 48, 0, 1, 1, 676);
INSERT INTO `catalogue_items` VALUES (677, 'Red Carpet', 'For making an entrance.', 15, 4, 2, 7, 0.00, 'carpet_valentine', '0,0,0', 48, 0, 1, 1, 677);
INSERT INTO `catalogue_items` VALUES (678, 'Valentine\'s lamp', 'Valentine\'s lamp', 10, 0, 0, 0, 0.00, 'val_heart', '0,0,0', 48, 0, 1, 1, 678);
INSERT INTO `catalogue_items` VALUES (679, 'Valentine rose Red', 'For a love that it true', 8, 1, 1, 1, 0.00, 'plant_valentinerose*1', '#FFFFFF,#FF1E1E,#FFFFFF,#FFFFFF', 48, 0, 1, 1, 679);
INSERT INTO `catalogue_items` VALUES (680, 'White Valentine Rose', 'Your secret love', 8, 1, 1, 1, 0.00, 'plant_valentinerose*2', '#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 48, 0, 1, 1, 680);
INSERT INTO `catalogue_items` VALUES (681, 'Yellow Valentine Rose', 'Relight your passions', 8, 1, 1, 1, 0.00, 'plant_valentinerose*3', '#FFFFFF,#ffee00,#FFFFFF,#FFFFFF', 48, 0, 1, 1, 681);
INSERT INTO `catalogue_items` VALUES (682, 'Pink Valentine\'s Rose', 'Be mine!', 8, 1, 1, 1, 0.00, 'plant_valentinerose*4', '#FFFFFF,#ffbbcf,#FFFFFF,#FFFFFF', 48, 0, 1, 1, 682);
INSERT INTO `catalogue_items` VALUES (683, 'Purple Valentine Rose', 'For that special pixel', 8, 1, 1, 1, 0.00, 'plant_valentinerose*5', '#FFFFFF,#CC3399,#FFFFFF,#FFFFFF', 48, 0, 1, 1, 683);
INSERT INTO `catalogue_items` VALUES (684, 'Two-Seater Sofa', 'Cushioned, understated comfort', 3, 2, 2, 1, 1.00, 'sofa_silo*2', '#ffffff,#ffffff,#ffffff,#ffffff,#525252,#525252,#525252,#525252', 49, 0, 1, 1, 684);
INSERT INTO `catalogue_items` VALUES (685, 'Armchair', 'Large, but worth it', 3, 1, 1, 1, 1.00, 'sofachair_silo*2', '#ffffff,#ffffff,#525252,#525252', 49, 0, 1, 1, 685);
INSERT INTO `catalogue_items` VALUES (686, 'Occasional Table', 'For those random moments', 1, 1, 1, 1, 1.00, 'table_silo_small*2', '#ffffff,#525252', 49, 0, 1, 1, 686);
INSERT INTO `catalogue_items` VALUES (687, 'Gate (lockable)', 'Form following function', 6, 1, 1, 1, 0.00, 'divider_silo3*2', '#ffffff,#ffffff,#ffffff,#525252', 49, 1, 1, 1, 687);
INSERT INTO `catalogue_items` VALUES (688, 'Corner Shelf', 'Neat and natty', 3, 1, 1, 1, 1.20, 'divider_silo1*2', '#ffffff,#525252', 49, 0, 1, 1, 688);
INSERT INTO `catalogue_items` VALUES (689, 'Dining Chair', 'Keep it simple', 3, 2, 1, 1, 1.00, 'chair_silo*2', '#ffffff,#ffffff,#525252,#525252', 49, 0, 1, 1, 689);
INSERT INTO `catalogue_items` VALUES (690, 'Safe Minibar', 'Totally shatter-proof!', 3, 1, 1, 1, 0.00, 'safe_silo*2', '#ffffff,#525252', 49, 0, 1, 1, 690);
INSERT INTO `catalogue_items` VALUES (691, 'Bar Stool', 'Practical and convenient', 3, 1, 1, 1, 1.50, 'barchair_silo*2', '#ffffff,#525252', 49, 0, 1, 1, 691);
INSERT INTO `catalogue_items` VALUES (692, 'Coffee Table', 'Wipe clean and unobtrusive', 3, 1, 2, 2, 0.80, 'table_silo_med*2', '#ffffff,#525252', 49, 0, 1, 1, 692);
INSERT INTO `catalogue_items` VALUES (693, 'Two-Seater Sofa', 'Cushioned, understated comfort', 3, 2, 2, 1, 1.00, 'sofa_silo*3', '#ffffff,#ffffff,#ffffff,#ffffff,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 49, 0, 1, 1, 693);
INSERT INTO `catalogue_items` VALUES (694, 'Armchair', 'Large, but worth it', 3, 1, 1, 1, 1.00, 'sofachair_silo*3', '#ffffff,#ffffff,#FFFFFF,#FFFFFF', 49, 0, 1, 1, 694);
INSERT INTO `catalogue_items` VALUES (695, 'Occasional Table', 'For those random moments', 1, 1, 1, 1, 1.00, 'table_silo_small*3', '#ffffff,#FFFFFF', 49, 0, 1, 1, 695);
INSERT INTO `catalogue_items` VALUES (696, 'Gate (lockable)', 'Form following function', 6, 1, 1, 1, 0.00, 'divider_silo3*3', '#ffffff,#ffffff,#ffffff,#FFFFFF', 49, 1, 1, 1, 696);
INSERT INTO `catalogue_items` VALUES (697, 'Corner Shelf', 'Neat and natty', 3, 1, 1, 1, 1.20, 'divider_silo1*3', '#ffffff,#FFFFFF', 49, 0, 1, 1, 697);
INSERT INTO `catalogue_items` VALUES (698, 'Dining Chair', 'Keep it simple', 3, 2, 1, 1, 1.00, 'chair_silo*3', '#ffffff,#ffffff,#FFFFFF,#FFFFFF', 49, 0, 1, 1, 698);
INSERT INTO `catalogue_items` VALUES (699, 'Safe Minibar', 'Totally shatter-proof!', 3, 1, 1, 1, 0.00, 'safe_silo*3', '#ffffff,#FFFFFF', 49, 0, 1, 1, 699);
INSERT INTO `catalogue_items` VALUES (700, 'Bar Stool', 'Practical and convenient', 3, 1, 1, 1, 1.50, 'barchair_silo*3', '#ffffff,#FFFFFF', 49, 0, 1, 1, 700);
INSERT INTO `catalogue_items` VALUES (701, 'Coffee Table', 'Wipe clean and unobtrusive', 3, 1, 2, 2, 0.80, 'table_silo_med*3', '#ffffff,#FFFFFF', 49, 0, 1, 1, 701);
INSERT INTO `catalogue_items` VALUES (702, 'Two-Seater Sofa', 'Cushioned, understated comfort', 3, 2, 2, 1, 1.00, 'sofa_silo*4', '#ffffff,#ffffff,#ffffff,#ffffff,#F7EBBC,#F7EBBC,#F7EBBC,#F7EBBC', 49, 0, 1, 1, 702);
INSERT INTO `catalogue_items` VALUES (703, 'Armchair', 'Large, but worth it', 3, 1, 1, 1, 1.00, 'sofachair_silo*4', '#ffffff,#ffffff,#F7EBBC,#F7EBBC', 49, 0, 1, 1, 703);
INSERT INTO `catalogue_items` VALUES (704, 'Occasional Table', 'For those random moments', 1, 1, 1, 1, 1.00, 'table_silo_small*4', '#ffffff,#F7EBBC', 49, 0, 1, 1, 704);
INSERT INTO `catalogue_items` VALUES (705, 'Gate (lockable)', 'Form following function', 6, 1, 1, 1, 0.00, 'divider_silo3*4', '#ffffff,#ffffff,#ffffff,#F7EBBC', 49, 1, 1, 1, 705);
INSERT INTO `catalogue_items` VALUES (706, 'Corner Shelf', 'Neat and natty', 3, 1, 1, 1, 1.20, 'divider_silo1*4', '#ffffff,#F7EBBC', 49, 0, 1, 1, 706);
INSERT INTO `catalogue_items` VALUES (707, 'Dining Chair', 'Keep it simple', 3, 2, 1, 1, 1.00, 'chair_silo*4', '#ffffff,#ffffff,#F7EBBC,#F7EBBC', 49, 0, 1, 1, 707);
INSERT INTO `catalogue_items` VALUES (708, 'Safe Minibar', 'Totally shatter-proof!', 3, 1, 1, 1, 0.00, 'safe_silo*4', '#ffffff,#F7EBBC', 49, 0, 1, 1, 708);
INSERT INTO `catalogue_items` VALUES (709, 'Bar Stool', 'Practical and convenient', 3, 1, 1, 1, 1.50, 'barchair_silo*4', '#ffffff,#F7EBBC', 49, 0, 1, 1, 709);
INSERT INTO `catalogue_items` VALUES (710, 'Coffee Table', 'Wipe clean and unobtrusive', 3, 1, 2, 2, 0.80, 'table_silo_med*4', '#ffffff,#F7EBBC', 49, 0, 1, 1, 710);
INSERT INTO `catalogue_items` VALUES (711, 'Two-Seater Sofa', 'Cushioned, understated comfort', 3, 2, 2, 1, 1.00, 'sofa_silo*5', '#ffffff,#ffffff,#ffffff,#ffffff,#FF99BC,#FF99BC,#FF99BC,#FF99BC', 49, 0, 1, 1, 711);
INSERT INTO `catalogue_items` VALUES (712, 'Armchair', 'Large, but worth it', 3, 1, 1, 1, 1.00, 'sofachair_silo*5', '#ffffff,#ffffff,#FF99BC,#FF99BC', 49, 0, 1, 1, 712);
INSERT INTO `catalogue_items` VALUES (713, 'Occasional Table', 'For those random moments', 1, 1, 1, 1, 1.00, 'table_silo_small*5', '#ffffff,#FF99BC', 49, 0, 1, 1, 713);
INSERT INTO `catalogue_items` VALUES (714, 'Gate (lockable)', 'Form following function', 6, 1, 1, 1, 0.00, 'divider_silo3*5', '#ffffff,#ffffff,#ffffff,#FF99BC', 49, 1, 1, 1, 714);
INSERT INTO `catalogue_items` VALUES (715, 'Corner Shelf', 'Neat and natty', 3, 1, 1, 1, 1.20, 'divider_silo1*5', '#ffffff,#FF99BC', 49, 0, 1, 1, 715);
INSERT INTO `catalogue_items` VALUES (716, 'Dining Chair', 'Keep it simple', 3, 2, 1, 1, 1.00, 'chair_silo*5', '#ffffff,#ffffff,#FF99BC,#FF99BC', 49, 0, 1, 1, 716);
INSERT INTO `catalogue_items` VALUES (717, 'Safe Minibar', 'Totally shatter-proof!', 3, 1, 1, 1, 0.00, 'safe_silo*5', '#ffffff,#FF99BC', 49, 0, 1, 1, 717);
INSERT INTO `catalogue_items` VALUES (718, 'Bar Stool', 'Practical and convenient', 3, 1, 1, 1, 1.50, 'barchair_silo*5', '#ffffff,#FF99BC', 49, 0, 1, 1, 718);
INSERT INTO `catalogue_items` VALUES (719, 'Coffee Table', 'Wipe clean and unobtrusive', 3, 1, 2, 2, 0.80, 'table_silo_med*5', '#ffffff,#FF99BC', 49, 0, 1, 1, 719);
INSERT INTO `catalogue_items` VALUES (720, 'Two-Seater Sofa', 'Cushioned, understated comfort', 3, 2, 2, 1, 1.00, 'sofa_silo*6', '#ffffff,#ffffff,#ffffff,#ffffff,#5EAAF8,#5EAAF8,#5EAAF8,#5EAAF8', 49, 0, 1, 1, 720);
INSERT INTO `catalogue_items` VALUES (721, 'Armchair', 'Large, but worth it', 3, 1, 1, 1, 1.00, 'sofachair_silo*6', '#ffffff,#ffffff,#5EAAF8,#5EAAF8', 49, 0, 1, 1, 721);
INSERT INTO `catalogue_items` VALUES (722, 'Occasional Table', 'For those random moments', 1, 1, 1, 1, 1.00, 'table_silo_small*6', '#ffffff,#5EAAF8', 49, 0, 1, 1, 722);
INSERT INTO `catalogue_items` VALUES (723, 'Gate (lockable)', 'Form following function', 6, 1, 1, 1, 0.00, 'divider_silo3*6', '#ffffff,#ffffff,#ffffff,#5EAAF8', 49, 1, 1, 1, 723);
INSERT INTO `catalogue_items` VALUES (724, 'Corner Shelf', 'Neat and natty', 3, 1, 1, 1, 1.20, 'divider_silo1*6', '#ffffff,#5EAAF8', 49, 0, 1, 1, 724);
INSERT INTO `catalogue_items` VALUES (725, 'Dining Chair', 'Keep it simple', 3, 2, 1, 1, 1.00, 'chair_silo*6', '#ffffff,#ffffff,#5EAAF8,#5EAAF8', 49, 0, 1, 1, 725);
INSERT INTO `catalogue_items` VALUES (726, 'Safe Minibar', 'Totally shatter-proof!', 3, 1, 1, 1, 0.00, 'safe_silo*6', '#ffffff,#5EAAF8', 49, 0, 1, 1, 726);
INSERT INTO `catalogue_items` VALUES (727, 'Bar Stool', 'Practical and convenient', 3, 1, 1, 1, 1.50, 'barchair_silo*6', '#ffffff,#5EAAF8', 49, 0, 1, 1, 727);
INSERT INTO `catalogue_items` VALUES (728, 'Coffee Table', 'Wipe clean and unobtrusive', 3, 1, 2, 2, 0.80, 'table_silo_med*6', '#ffffff,#5EAAF8', 49, 0, 1, 1, 728);
INSERT INTO `catalogue_items` VALUES (729, 'Two-Seater Sofa', 'Cushioned, understated comfort', 3, 2, 2, 1, 1.00, 'sofa_silo*7', '#ffffff,#ffffff,#ffffff,#ffffff,#92D13D,#92D13D,#92D13D,#92D13D', 49, 0, 1, 1, 729);
INSERT INTO `catalogue_items` VALUES (730, 'Armchair', 'Large, but worth it', 3, 1, 1, 1, 1.00, 'sofachair_silo*7', '#ffffff,#ffffff,#92D13D,#92D13D', 49, 0, 1, 1, 730);
INSERT INTO `catalogue_items` VALUES (731, 'Occasional Table', 'For those random moments', 1, 1, 1, 1, 1.00, 'table_silo_small*7', '#ffffff,#92D13D', 49, 0, 1, 1, 731);
INSERT INTO `catalogue_items` VALUES (732, 'Gate (lockable)', 'Form following function', 6, 1, 1, 1, 0.00, 'divider_silo3*7', '#ffffff,#ffffff,#ffffff,#92D13D', 49, 1, 1, 1, 732);
INSERT INTO `catalogue_items` VALUES (733, 'Corner Shelf', 'Neat and natty', 3, 1, 1, 1, 1.20, 'divider_silo1*7', '#ffffff,#92D13D', 49, 0, 1, 1, 733);
INSERT INTO `catalogue_items` VALUES (734, 'Dining Chair', 'Keep it simple', 3, 2, 1, 1, 1.00, 'chair_silo*7', '#ffffff,#ffffff,#92D13D,#92D13D', 49, 0, 1, 1, 734);
INSERT INTO `catalogue_items` VALUES (735, 'Safe Minibar', 'Totally shatter-proof!', 3, 1, 1, 1, 0.00, 'safe_silo*7', '#ffffff,#92D13D', 49, 0, 1, 1, 735);
INSERT INTO `catalogue_items` VALUES (736, 'Bar Stool', 'Practical and convenient', 3, 1, 1, 1, 1.50, 'barchair_silo*7', '#ffffff,#92D13D', 49, 0, 1, 1, 736);
INSERT INTO `catalogue_items` VALUES (737, 'Coffee Table', 'Wipe clean and unobtrusive', 3, 1, 2, 2, 0.80, 'table_silo_med*7', '#ffffff,#92D13D', 49, 0, 1, 1, 737);
INSERT INTO `catalogue_items` VALUES (738, 'Two-Seater Sofa', 'Cushioned, understated comfort', 3, 2, 2, 1, 1.00, 'sofa_silo*8', '#ffffff,#ffffff,#ffffff,#ffffff,#FFD837,#FFD837,#FFD837,#FFD837', 49, 0, 1, 1, 738);
INSERT INTO `catalogue_items` VALUES (739, 'Armchair', 'Large, but worth it', 3, 1, 1, 1, 1.00, 'sofachair_silo*8', '#ffffff,#ffffff,#FFD837,#FFD837', 49, 0, 1, 1, 739);
INSERT INTO `catalogue_items` VALUES (740, 'Occasional Table', 'For those random moments', 1, 1, 1, 1, 1.00, 'table_silo_small*8', '#ffffff,#FFD837', 49, 0, 1, 1, 740);
INSERT INTO `catalogue_items` VALUES (741, 'Gate (lockable)', 'Form following function', 6, 1, 1, 1, 0.00, 'divider_silo3*8', '#ffffff,#ffffff,#ffffff,#FFD837', 49, 1, 1, 1, 741);
INSERT INTO `catalogue_items` VALUES (742, 'Corner Shelf', 'Neat and natty', 3, 1, 1, 1, 1.20, 'divider_silo1*8', '#ffffff,#FFD837', 49, 0, 1, 1, 742);
INSERT INTO `catalogue_items` VALUES (743, 'Dining Chair', 'Keep it simple', 3, 2, 1, 1, 1.00, 'chair_silo*8', '#ffffff,#ffffff,#FFD837,#FFD837', 49, 0, 1, 1, 743);
INSERT INTO `catalogue_items` VALUES (744, 'Safe Minibar', 'Totally shatter-proof!', 3, 1, 1, 1, 0.00, 'safe_silo*8', '#ffffff,#FFD837', 49, 0, 1, 1, 744);
INSERT INTO `catalogue_items` VALUES (745, 'Bar Stool', 'Practical and convenient', 3, 1, 1, 1, 1.50, 'barchair_silo*8', '#ffffff,#FFD837', 49, 0, 1, 1, 745);
INSERT INTO `catalogue_items` VALUES (746, 'Coffee Table', 'Wipe clean and unobtrusive', 3, 1, 2, 2, 0.80, 'table_silo_med*8', '#ffffff,#FFD837', 49, 0, 1, 1, 746);
INSERT INTO `catalogue_items` VALUES (747, 'Two-Seater Sofa', 'Cushioned, understated comfort', 3, 2, 2, 1, 1.00, 'sofa_silo*9', '#ffffff,#ffffff,#ffffff,#ffffff,#E14218,#E14218,#E14218,#E14218', 49, 0, 1, 1, 747);
INSERT INTO `catalogue_items` VALUES (748, 'Armchair', 'Large, but worth it', 3, 1, 1, 1, 1.00, 'sofachair_silo*9', '#ffffff,#ffffff,#E14218,#E14218', 49, 0, 1, 1, 748);
INSERT INTO `catalogue_items` VALUES (749, 'Occasional Table', 'For those random moments', 1, 1, 1, 1, 1.00, 'table_silo_small*9', '#ffffff,#E14218', 49, 0, 1, 1, 749);
INSERT INTO `catalogue_items` VALUES (750, 'Gate (lockable)', 'Form following function', 6, 1, 1, 1, 0.00, 'divider_silo3*9', '#ffffff,#ffffff,#ffffff,#E14218', 49, 1, 1, 1, 750);
INSERT INTO `catalogue_items` VALUES (751, 'Corner Shelf', 'Neat and natty', 3, 1, 1, 1, 1.20, 'divider_silo1*9', '#ffffff,#E14218', 49, 0, 1, 1, 751);
INSERT INTO `catalogue_items` VALUES (752, 'Dining Chair', 'Keep it simple', 3, 2, 1, 1, 1.00, 'chair_silo*9', '#ffffff,#ffffff,#E14218,#E14218', 49, 0, 1, 1, 752);
INSERT INTO `catalogue_items` VALUES (753, 'Safe Minibar', 'Totally shatter-proof!', 3, 1, 1, 1, 0.00, 'safe_silo*9', '#ffffff,#E14218', 49, 0, 1, 1, 753);
INSERT INTO `catalogue_items` VALUES (754, 'Bar Stool', 'Practical and convenient', 3, 1, 1, 1, 1.50, 'barchair_silo*9', '#ffffff,#E14218', 49, 0, 1, 1, 754);
INSERT INTO `catalogue_items` VALUES (755, 'Coffee Table', 'Wipe clean and unobtrusive', 3, 1, 2, 2, 0.80, 'table_silo_med*9', '#ffffff,#E14218', 49, 0, 1, 1, 755);
INSERT INTO `catalogue_items` VALUES (756, 'Chair', 'Sleek and chic for each cheek', 3, 2, 1, 1, 1.00, 'chair_norja*2', '#ffffff,#ffffff,#525252,#525252', 50, 0, 1, 1, 756);
INSERT INTO `catalogue_items` VALUES (757, 'Bench', 'Two can perch comfortably', 3, 2, 2, 1, 1.00, 'couch_norja*2', '#ffffff,#ffffff,#ffffff,#ffffff,#525252,#525252,#525252,#525252', 50, 0, 1, 1, 757);
INSERT INTO `catalogue_items` VALUES (758, 'Coffee Table', 'Elegance embodied', 3, 1, 2, 2, 0.80, 'table_norja_med*2', '#ffffff,#525252', 50, 0, 1, 1, 758);
INSERT INTO `catalogue_items` VALUES (759, 'Bookcase', 'For nic naks and art deco books', 3, 1, 1, 1, 0.00, 'shelves_norja*2', '#ffffff,#525252', 50, 0, 1, 1, 759);
INSERT INTO `catalogue_items` VALUES (760, 'iced sofachair', 'Soft iced sofachair', 3, 2, 1, 1, 1.00, 'soft_sofachair_norja*2', '#ffffff,#525252,#525252', 50, 0, 1, 1, 760);
INSERT INTO `catalogue_items` VALUES (761, 'iced sofa', 'A soft iced sofa', 4, 2, 2, 1, 1.00, 'soft_sofa_norja*2', '#ffffff,#525252,#ffffff,#525252,#525252,#525252', 50, 0, 1, 1, 761);
INSERT INTO `catalogue_items` VALUES (762, 'Ice Bar-Desk', 'Strong, yet soft looking', 3, 1, 2, 1, 1.20, 'divider_nor2*2', '#ffffff,#ffffff,#525252,#525252', 50, 0, 1, 1, 762);
INSERT INTO `catalogue_items` VALUES (763, 'Ice Corner', 'Looks squishy, but isn\'t', 3, 1, 1, 1, 1.20, 'divider_nor1*2', '#ffffff,#525252', 50, 0, 1, 1, 763);
INSERT INTO `catalogue_items` VALUES (764, 'Door (Lockable)', 'Do go through...', 6, 1, 1, 1, 0.00, 'divider_nor3*2', '#ffffff,#ffffff,#525252,#525252', 50, 1, 1, 1, 764);
INSERT INTO `catalogue_items` VALUES (765, 'Iced Auto Shutter', 'Habbos, roll out!', 3, 1, 2, 1, 0.00, 'divider_nor4*2', '#ffffff,#ffffff,#525252,#525252,#525252,#525252', 50, 1, 1, 1, 765);
INSERT INTO `catalogue_items` VALUES (766, 'Iced Angle', 'Cool cornering for you!', 3, 1, 1, 1, 0.00, 'divider_nor5*2', '#ffffff,#525252,#525252,#525252,#525252,#525252', 50, 1, 1, 1, 766);
INSERT INTO `catalogue_items` VALUES (767, 'Chair', 'Sleek and chic for each cheek', 3, 2, 1, 1, 1.00, 'chair_norja*3', '#ffffff,#ffffff,#ffffff,#ffffff', 50, 0, 1, 1, 767);
INSERT INTO `catalogue_items` VALUES (768, 'Bench', 'Two can perch comfortably', 3, 2, 2, 1, 1.00, 'couch_norja*3', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 50, 0, 1, 1, 768);
INSERT INTO `catalogue_items` VALUES (769, 'Coffee Table', 'Elegance embodied', 3, 1, 2, 2, 0.80, 'table_norja_med*3', '#ffffff,#ffffff', 50, 0, 1, 1, 769);
INSERT INTO `catalogue_items` VALUES (770, 'Bookcase', 'For nic naks and art deco books', 3, 1, 1, 1, 0.00, 'shelves_norja*3', '#ffffff,#ffffff', 50, 0, 1, 1, 770);
INSERT INTO `catalogue_items` VALUES (771, 'iced sofachair', 'Soft iced sofachair', 3, 2, 1, 1, 1.00, 'soft_sofachair_norja*3', '#ffffff,#ffffff,#ffffff', 50, 0, 1, 1, 771);
INSERT INTO `catalogue_items` VALUES (772, 'iced sofa', 'A soft iced sofa', 4, 2, 2, 1, 1.00, 'soft_sofa_norja*3', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 50, 0, 1, 1, 772);
INSERT INTO `catalogue_items` VALUES (773, 'Ice Bar-Desk', 'Strong, yet soft looking', 3, 1, 2, 1, 1.20, 'divider_nor2*3', '#ffffff,#ffffff,#ffffff,#ffffff', 50, 0, 1, 1, 773);
INSERT INTO `catalogue_items` VALUES (774, 'Ice Corner', 'Looks squishy, but isn\'t', 3, 1, 1, 1, 1.20, 'divider_nor1*3', '#ffffff,#ffffff', 50, 0, 1, 1, 774);
INSERT INTO `catalogue_items` VALUES (775, 'Door (Lockable)', 'Do go through...', 6, 1, 1, 1, 0.00, 'divider_nor3*3', '#ffffff,#ffffff,#ffffff,#ffffff', 50, 1, 1, 1, 775);
INSERT INTO `catalogue_items` VALUES (776, 'Iced Auto Shutter', 'Habbos, roll out!', 3, 1, 2, 1, 0.00, 'divider_nor4*3', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 50, 1, 1, 1, 776);
INSERT INTO `catalogue_items` VALUES (777, 'Iced Angle', 'Cool cornering for you!', 3, 1, 1, 1, 0.00, 'divider_nor5*3', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 50, 1, 1, 1, 777);
INSERT INTO `catalogue_items` VALUES (778, 'Chair', 'Sleek and chic for each cheek', 3, 2, 1, 1, 1.00, 'chair_norja*4', '#ffffff,#ffffff,#ABD0D2,#ABD0D2', 50, 0, 1, 1, 778);
INSERT INTO `catalogue_items` VALUES (779, 'Bench', 'Two can perch comfortably', 3, 2, 2, 1, 1.00, 'couch_norja*4', '#ffffff,#ffffff,#ffffff,#ffffff,#ABD0D2,#ABD0D2,#ABD0D2,#ABD0D2', 50, 0, 1, 1, 779);
INSERT INTO `catalogue_items` VALUES (780, 'Coffee Table', 'Elegance embodied', 3, 1, 2, 2, 0.80, 'table_norja_med*4', '#ffffff,#ABD0D2', 50, 0, 1, 1, 780);
INSERT INTO `catalogue_items` VALUES (781, 'Bookcase', 'For nic naks and art deco books', 3, 1, 1, 1, 0.00, 'shelves_norja*4', '#ffffff,#ABD0D2', 50, 0, 1, 1, 781);
INSERT INTO `catalogue_items` VALUES (782, 'iced sofachair', 'Soft iced sofachair', 3, 2, 1, 1, 1.00, 'soft_sofachair_norja*4', '#ffffff,#ABD0D2,#ABD0D2', 50, 0, 1, 1, 782);
INSERT INTO `catalogue_items` VALUES (783, 'iced sofa', 'A soft iced sofa', 4, 2, 2, 1, 1.00, 'soft_sofa_norja*4', '#ffffff,#ABD0D2,#ffffff,#ABD0D2,#ABD0D2,#ABD0D2', 50, 0, 1, 1, 783);
INSERT INTO `catalogue_items` VALUES (784, 'Ice Bar-Desk', 'Strong, yet soft looking', 3, 1, 2, 1, 1.20, 'divider_nor2*4', '#ffffff,#ffffff,#ABD0D2,#ABD0D2', 50, 0, 1, 1, 784);
INSERT INTO `catalogue_items` VALUES (785, 'Ice Corner', 'Looks squishy, but isn\'t', 3, 1, 1, 1, 1.20, 'divider_nor1*4', '#ffffff,#ABD0D2', 50, 0, 1, 1, 785);
INSERT INTO `catalogue_items` VALUES (786, 'Door (Lockable)', 'Do go through...', 6, 1, 1, 1, 0.00, 'divider_nor3*4', '#ffffff,#ffffff,#ABD0D2,#ABD0D2', 50, 1, 1, 1, 786);
INSERT INTO `catalogue_items` VALUES (787, 'Iced Auto Shutter', 'Habbos, roll out!', 3, 1, 2, 1, 0.00, 'divider_nor4*4', '#ffffff,#ffffff,#ABD0D2,#ABD0D2,#ABD0D2,#ABD0D2', 50, 1, 1, 1, 787);
INSERT INTO `catalogue_items` VALUES (788, 'Iced Angle', 'Cool cornering for you!', 3, 1, 1, 1, 0.00, 'divider_nor5*4', '#ffffff,#ABD0D2,#ABD0D2,#ABD0D2,#ABD0D2,#ABD0D2', 50, 1, 1, 1, 788);
INSERT INTO `catalogue_items` VALUES (789, 'Chair', 'Sleek and chic for each cheek', 3, 2, 1, 1, 1.00, 'chair_norja*5', '#ffffff,#ffffff,#EE7EA4,#EE7EA4', 50, 0, 1, 1, 789);
INSERT INTO `catalogue_items` VALUES (790, 'Bench', 'Two can perch comfortably', 3, 2, 2, 1, 1.00, 'couch_norja*5', '#ffffff,#ffffff,#ffffff,#ffffff,#EE7EA4,#EE7EA4,#EE7EA4,#EE7EA4', 50, 0, 1, 1, 790);
INSERT INTO `catalogue_items` VALUES (791, 'Coffee Table', 'Elegance embodied', 3, 1, 2, 2, 0.80, 'table_norja_med*5', '#ffffff,#EE7EA4', 50, 0, 1, 1, 791);
INSERT INTO `catalogue_items` VALUES (792, 'Bookcase', 'For nic naks and art deco books', 3, 1, 1, 1, 0.00, 'shelves_norja*5', '#ffffff,#EE7EA4', 50, 0, 1, 1, 792);
INSERT INTO `catalogue_items` VALUES (793, 'iced sofachair', 'Soft iced sofachair', 3, 2, 1, 1, 1.00, 'soft_sofachair_norja*5', '#ffffff,#EE7EA4,#EE7EA4', 50, 0, 1, 1, 793);
INSERT INTO `catalogue_items` VALUES (794, 'iced sofa', 'A soft iced sofa', 4, 2, 2, 1, 1.00, 'soft_sofa_norja*5', '#ffffff,#EE7EA4,#ffffff,#EE7EA4,#EE7EA4,#EE7EA4', 50, 0, 1, 1, 794);
INSERT INTO `catalogue_items` VALUES (795, 'Ice Bar-Desk', 'Strong, yet soft looking', 3, 1, 2, 1, 1.20, 'divider_nor2*5', '#ffffff,#ffffff,#EE7EA4,#EE7EA4', 50, 0, 1, 1, 795);
INSERT INTO `catalogue_items` VALUES (796, 'Ice Corner', 'Looks squishy, but isn\'t', 3, 1, 1, 1, 1.20, 'divider_nor1*5', '#ffffff,#EE7EA4', 50, 0, 1, 1, 796);
INSERT INTO `catalogue_items` VALUES (797, 'Door (Lockable)', 'Do go through...', 6, 1, 1, 1, 0.00, 'divider_nor3*5', '#ffffff,#ffffff,#EE7EA4,#EE7EA4', 50, 1, 1, 1, 797);
INSERT INTO `catalogue_items` VALUES (798, 'Iced Auto Shutter', 'Habbos, roll out!', 3, 1, 2, 1, 0.00, 'divider_nor4*5', '#ffffff,#ffffff,#EE7EA4,#EE7EA4,#EE7EA4,#EE7EA4', 50, 1, 1, 1, 798);
INSERT INTO `catalogue_items` VALUES (799, 'Iced Angle', 'Cool cornering for you!', 3, 1, 1, 1, 0.00, 'divider_nor5*5', '#ffffff,#EE7EA4,#EE7EA4,#EE7EA4,#EE7EA4,#EE7EA4', 50, 1, 1, 1, 799);
INSERT INTO `catalogue_items` VALUES (800, 'Chair', 'Sleek and chic for each cheek', 3, 2, 1, 1, 1.00, 'chair_norja*6', '#ffffff,#ffffff,#5EAAF8,#5EAAF8', 50, 0, 1, 1, 800);
INSERT INTO `catalogue_items` VALUES (801, 'Bench', 'Two can perch comfortably', 3, 2, 2, 1, 1.00, 'couch_norja*6', '#ffffff,#ffffff,#ffffff,#ffffff,#5EAAF8,#5EAAF8,#5EAAF8,#5EAAF8', 50, 0, 1, 1, 801);
INSERT INTO `catalogue_items` VALUES (802, 'Coffee Table', 'Elegance embodied', 3, 1, 2, 2, 0.80, 'table_norja_med*6', '#ffffff,#5EAAF8', 50, 0, 1, 1, 802);
INSERT INTO `catalogue_items` VALUES (803, 'Bookcase', 'For nic naks and art deco books', 3, 1, 1, 1, 0.00, 'shelves_norja*6', '#ffffff,#5EAAF8', 50, 0, 1, 1, 803);
INSERT INTO `catalogue_items` VALUES (804, 'iced sofachair', 'Soft iced sofachair', 3, 2, 1, 1, 1.00, 'soft_sofachair_norja*6', '#ffffff,#5EAAF8,#5EAAF8', 50, 0, 1, 1, 804);
INSERT INTO `catalogue_items` VALUES (805, 'iced sofa', 'A soft iced sofa', 4, 2, 2, 1, 1.00, 'soft_sofa_norja*6', '#ffffff,#5EAAF8,#ffffff,#5EAAF8,#5EAAF8,#5EAAF8', 50, 0, 1, 1, 805);
INSERT INTO `catalogue_items` VALUES (806, 'Ice Bar-Desk', 'Strong, yet soft looking', 3, 1, 2, 1, 1.20, 'divider_nor2*6', '#ffffff,#ffffff,#5EAAF8,#5EAAF8', 50, 0, 1, 1, 806);
INSERT INTO `catalogue_items` VALUES (807, 'Ice Corner', 'Looks squishy, but isn\'t', 3, 1, 1, 1, 1.20, 'divider_nor1*6', '#ffffff,#5EAAF8', 50, 0, 1, 1, 807);
INSERT INTO `catalogue_items` VALUES (808, 'Door (Lockable)', 'Do go through...', 6, 1, 1, 1, 0.00, 'divider_nor3*6', '#ffffff,#ffffff,#5EAAF8,#5EAAF8', 50, 1, 1, 1, 808);
INSERT INTO `catalogue_items` VALUES (809, 'Iced Auto Shutter', 'Habbos, roll out!', 3, 1, 2, 1, 0.00, 'divider_nor4*6', '#ffffff,#ffffff,#5EAAF8,#5EAAF8,#5EAAF8,#5EAAF8', 50, 1, 1, 1, 809);
INSERT INTO `catalogue_items` VALUES (810, 'Iced Angle', 'Cool cornering for you!', 3, 1, 1, 1, 0.00, 'divider_nor5*6', '#ffffff,#5EAAF8,#5EAAF8,#5EAAF8,#5EAAF8,#5EAAF8', 50, 1, 1, 1, 810);
INSERT INTO `catalogue_items` VALUES (811, 'Chair', 'Sleek and chic for each cheek', 3, 2, 1, 1, 1.00, 'chair_norja*7', '#ffffff,#ffffff,#7CB135,#7CB135', 50, 0, 1, 1, 811);
INSERT INTO `catalogue_items` VALUES (812, 'Bench', 'Two can perch comfortably', 3, 2, 2, 1, 1.00, 'couch_norja*7', '#ffffff,#ffffff,#ffffff,#ffffff,#7CB135,#7CB135,#7CB135,#7CB135', 50, 0, 1, 1, 812);
INSERT INTO `catalogue_items` VALUES (813, 'Coffee Table', 'Elegance embodied', 3, 1, 2, 2, 0.80, 'table_norja_med*7', '#ffffff,#7CB135', 50, 0, 1, 1, 813);
INSERT INTO `catalogue_items` VALUES (814, 'Bookcase', 'For nic naks and art deco books', 3, 1, 1, 1, 0.00, 'shelves_norja*7', '#ffffff,#7CB135', 50, 0, 1, 1, 814);
INSERT INTO `catalogue_items` VALUES (815, 'iced sofachair', 'Soft iced sofachair', 3, 2, 1, 1, 1.00, 'soft_sofachair_norja*7', '#ffffff,#7CB135,#7CB135', 50, 0, 1, 1, 815);
INSERT INTO `catalogue_items` VALUES (816, 'iced sofa', 'A soft iced sofa', 4, 2, 2, 1, 1.00, 'soft_sofa_norja*7', '#ffffff,#7CB135,#ffffff,#7CB135,#7CB135,#7CB135', 50, 0, 1, 1, 816);
INSERT INTO `catalogue_items` VALUES (817, 'Ice Bar-Desk', 'Strong, yet soft looking', 3, 1, 2, 1, 1.20, 'divider_nor2*7', '#ffffff,#ffffff,#7CB135,#7CB135', 50, 0, 1, 1, 817);
INSERT INTO `catalogue_items` VALUES (818, 'Ice Corner', 'Looks squishy, but isn\'t', 3, 1, 1, 1, 1.20, 'divider_nor1*7', '#ffffff,#7CB135', 50, 0, 1, 1, 818);
INSERT INTO `catalogue_items` VALUES (819, 'Door (Lockable)', 'Do go through...', 6, 1, 1, 1, 0.00, 'divider_nor3*7', '#ffffff,#ffffff,#7CB135,#7CB135', 50, 1, 1, 1, 819);
INSERT INTO `catalogue_items` VALUES (820, 'Iced Auto Shutter', 'Habbos, roll out!', 3, 1, 2, 1, 0.00, 'divider_nor4*7', '#ffffff,#ffffff,#7CB135,#7CB135,#7CB135,#7CB135', 50, 1, 1, 1, 820);
INSERT INTO `catalogue_items` VALUES (821, 'Iced Angle', 'Cool cornering for you!', 3, 1, 1, 1, 0.00, 'divider_nor5*7', '#ffffff,#7CB135,#7CB135,#7CB135,#7CB135,#7CB135', 50, 1, 1, 1, 821);
INSERT INTO `catalogue_items` VALUES (822, 'Chair', 'Sleek and chic for each cheek', 3, 2, 1, 1, 1.00, 'chair_norja*8', '#ffffff,#ffffff,#FFD837,#FFD837', 50, 0, 1, 1, 822);
INSERT INTO `catalogue_items` VALUES (823, 'Bench', 'Two can perch comfortably', 3, 2, 2, 1, 1.00, 'couch_norja*8', '#ffffff,#ffffff,#ffffff,#ffffff,#FFD837,#FFD837,#FFD837,#FFD837', 50, 0, 1, 1, 823);
INSERT INTO `catalogue_items` VALUES (824, 'Coffee Table', 'Elegance embodied', 3, 1, 2, 2, 0.80, 'table_norja_med*8', '#ffffff,#FFD837', 50, 0, 1, 1, 824);
INSERT INTO `catalogue_items` VALUES (825, 'Bookcase', 'For nic naks and art deco books', 3, 1, 1, 1, 0.00, 'shelves_norja*8', '#ffffff,#FFD837', 50, 0, 1, 1, 825);
INSERT INTO `catalogue_items` VALUES (826, 'iced sofachair', 'Soft iced sofachair', 3, 2, 1, 1, 1.00, 'soft_sofachair_norja*8', '#ffffff,#FFD837,#FFD837', 50, 0, 1, 1, 826);
INSERT INTO `catalogue_items` VALUES (827, 'iced sofa', 'A soft iced sofa', 4, 2, 2, 1, 1.00, 'soft_sofa_norja*8', '#ffffff,#FFD837,#ffffff,#FFD837,#FFD837,#FFD837', 50, 0, 1, 1, 827);
INSERT INTO `catalogue_items` VALUES (828, 'Ice Bar-Desk', 'Strong, yet soft looking', 3, 1, 2, 1, 1.20, 'divider_nor2*8', '#ffffff,#ffffff,#FFD837,#FFD837', 50, 0, 1, 1, 828);
INSERT INTO `catalogue_items` VALUES (829, 'Ice Corner', 'Looks squishy, but isn\'t', 3, 1, 1, 1, 1.20, 'divider_nor1*8', '#ffffff,#FFD837', 50, 0, 1, 1, 829);
INSERT INTO `catalogue_items` VALUES (830, 'Door (Lockable)', 'Do go through...', 6, 1, 1, 1, 0.00, 'divider_nor3*8', '#ffffff,#ffffff,#FFD837,#FFD837', 50, 1, 1, 1, 830);
INSERT INTO `catalogue_items` VALUES (831, 'Iced Auto Shutter', 'Habbos, roll out!', 3, 1, 2, 1, 0.00, 'divider_nor4*8', '#ffffff,#ffffff,#FFD837,#FFD837,#FFD837,#FFD837', 50, 1, 1, 1, 831);
INSERT INTO `catalogue_items` VALUES (832, 'Iced Angle', 'Cool cornering for you!', 3, 1, 1, 1, 0.00, 'divider_nor5*8', '#ffffff,#FFD837,#FFD837,#FFD837,#FFD837,#FFD837', 50, 1, 1, 1, 832);
INSERT INTO `catalogue_items` VALUES (833, 'Chair', 'Sleek and chic for each cheek', 3, 2, 1, 1, 1.00, 'chair_norja*9', '#ffffff,#ffffff,#E14218,#E14218', 50, 0, 1, 1, 833);
INSERT INTO `catalogue_items` VALUES (834, 'Bench', 'Two can perch comfortably', 3, 2, 2, 1, 1.00, 'couch_norja*9', '#ffffff,#ffffff,#ffffff,#ffffff,#E14218,#E14218,#E14218,#E14218', 50, 0, 1, 1, 834);
INSERT INTO `catalogue_items` VALUES (835, 'Coffee Table', 'Elegance embodied', 3, 1, 2, 2, 0.80, 'table_norja_med*9', '#ffffff,#E14218', 50, 0, 1, 1, 835);
INSERT INTO `catalogue_items` VALUES (836, 'Bookcase', 'For nic naks and art deco books', 3, 1, 1, 1, 0.00, 'shelves_norja*9', '#ffffff,#E14218', 50, 0, 1, 1, 836);
INSERT INTO `catalogue_items` VALUES (837, 'iced sofachair', 'Soft iced sofachair', 3, 2, 1, 1, 1.00, 'soft_sofachair_norja*9', '#ffffff,#E14218,#E14218', 50, 0, 1, 1, 837);
INSERT INTO `catalogue_items` VALUES (838, 'iced sofa', 'A soft iced sofa', 4, 2, 2, 1, 1.00, 'soft_sofa_norja*9', '#ffffff,#E14218,#ffffff,#E14218,#E14218,#E14218', 50, 0, 1, 1, 838);
INSERT INTO `catalogue_items` VALUES (839, 'Ice Bar-Desk', 'Strong, yet soft looking', 3, 1, 2, 1, 1.20, 'divider_nor2*9', '#ffffff,#ffffff,#E14218,#E14218', 50, 0, 1, 1, 839);
INSERT INTO `catalogue_items` VALUES (840, 'Ice Corner', 'Looks squishy, but isn\'t', 3, 1, 1, 1, 1.20, 'divider_nor1*9', '#ffffff,#E14218', 50, 0, 1, 1, 840);
INSERT INTO `catalogue_items` VALUES (841, 'Door (Lockable)', 'Do go through...', 6, 1, 1, 1, 0.00, 'divider_nor3*9', '#ffffff,#ffffff,#E14218,#E14218', 50, 1, 1, 1, 841);
INSERT INTO `catalogue_items` VALUES (842, 'Iced Auto Shutter', 'Habbos, roll out!', 3, 1, 2, 1, 0.00, 'divider_nor4*9', '#ffffff,#ffffff,#E14218,#E14218,#E14218,#E14218', 50, 1, 1, 1, 842);
INSERT INTO `catalogue_items` VALUES (843, 'Iced Angle', 'Cool cornering for you!', 3, 1, 1, 1, 0.00, 'divider_nor5*9', '#ffffff,#E14218,#E14218,#E14218,#E14218,#E14218', 50, 1, 1, 1, 843);
INSERT INTO `catalogue_items` VALUES (844, 'Double Bed', 'Give yourself space to stretch out', 4, 2, 2, 3, 1.50, 'bed_polyfon*2', '#ffffff,#ffffff,#525252,#525252', 51, 0, 1, 1, 844);
INSERT INTO `catalogue_items` VALUES (845, 'Single Bed', 'Cot of the artistic', 3, 2, 1, 3, 1.50, 'bed_polyfon_one*2', '#ffffff,#ffffff,#ffffff,#525252,#525252', 51, 0, 1, 1, 845);
INSERT INTO `catalogue_items` VALUES (846, 'Two-seater Sofa', 'Comfort for stylish couples', 4, 2, 2, 1, 1.20, 'sofa_polyfon*2', '#ffffff,#ffffff,#ffffff,#ffffff,#525252,#525252,#525252,#525252', 51, 0, 1, 1, 846);
INSERT INTO `catalogue_items` VALUES (847, 'Armchair', 'Loft-style comfort', 3, 2, 1, 1, 1.20, 'sofachair_polyfon*2', '#ffffff,#ffffff,#525252,#525252', 51, 0, 1, 1, 847);
INSERT INTO `catalogue_items` VALUES (848, 'Hatch (Lockable)', 'All bars should have one', 6, 1, 1, 1, 0.00, 'divider_poly3*2', '#ffffff,#ffffff,#ffffff,#525252,#525252', 51, 1, 1, 1, 848);
INSERT INTO `catalogue_items` VALUES (849, 'Bar/desk', 'Perfect for work or play', 3, 1, 2, 1, 1.00, 'bardesk_polyfon*2', '#ffffff,#ffffff,#525252,#525252', 51, 0, 1, 1, 849);
INSERT INTO `catalogue_items` VALUES (850, 'Corner Cabinet/Desk', 'Tuck it away', 3, 1, 1, 1, 1.00, 'bardeskcorner_polyfon*2', '#ffffff,#525252', 51, 0, 1, 1, 850);
INSERT INTO `catalogue_items` VALUES (851, 'Double Bed', 'Give yourself space to stretch out', 4, 2, 2, 3, 1.50, 'bed_polyfon*3', '#ffffff,#ffffff,#ffffff,#ffffff', 51, 0, 1, 1, 851);
INSERT INTO `catalogue_items` VALUES (852, 'Single Bed', 'Cot of the artistic', 3, 2, 1, 3, 1.50, 'bed_polyfon_one*3', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 51, 0, 1, 1, 852);
INSERT INTO `catalogue_items` VALUES (853, 'Two-seater Sofa', 'Comfort for stylish couples', 4, 2, 2, 1, 1.20, 'sofa_polyfon*3', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 51, 0, 1, 1, 853);
INSERT INTO `catalogue_items` VALUES (854, 'Armchair', 'Loft-style comfort', 3, 2, 1, 1, 1.20, 'sofachair_polyfon*3', '#ffffff,#ffffff,#ffffff,#ffffff', 51, 0, 1, 1, 854);
INSERT INTO `catalogue_items` VALUES (855, 'Hatch (Lockable)', 'All bars should have one', 6, 1, 1, 1, 0.00, 'divider_poly3*3', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 51, 1, 1, 1, 855);
INSERT INTO `catalogue_items` VALUES (856, 'Bar/desk', 'Perfect for work or play', 3, 1, 2, 1, 1.00, 'bardesk_polyfon*3', '#ffffff,#ffffff,#ffffff,#ffffff', 51, 0, 1, 1, 856);
INSERT INTO `catalogue_items` VALUES (857, 'Corner Cabinet/Desk', 'Tuck it away', 3, 1, 1, 1, 1.00, 'bardeskcorner_polyfon*3', '#ffffff,#ffffff', 51, 0, 1, 1, 857);
INSERT INTO `catalogue_items` VALUES (858, 'Double Bed', 'Give yourself space to stretch out', 4, 2, 2, 3, 1.50, 'bed_polyfon*4', '#ffffff,#ffffff,#F7EBBC,#F7EBBC', 51, 0, 1, 1, 858);
INSERT INTO `catalogue_items` VALUES (859, 'Single Bed', 'Cot of the artistic', 3, 2, 1, 3, 1.50, 'bed_polyfon_one*4', '#ffffff,#ffffff,#ffffff,#F7EBBC,#F7EBBC', 51, 0, 1, 1, 859);
INSERT INTO `catalogue_items` VALUES (860, 'Two-seater Sofa', 'Comfort for stylish couples', 4, 2, 2, 1, 1.20, 'sofa_polyfon*4', '#ffffff,#ffffff,#ffffff,#ffffff,#F7EBBC,#F7EBBC,#F7EBBC,#F7EBBC', 51, 0, 1, 1, 860);
INSERT INTO `catalogue_items` VALUES (861, 'Armchair', 'Loft-style comfort', 3, 2, 1, 1, 1.20, 'sofachair_polyfon*4', '#ffffff,#ffffff,#F7EBBC,#F7EBBC', 51, 0, 1, 1, 861);
INSERT INTO `catalogue_items` VALUES (862, 'Hatch (Lockable)', 'All bars should have one', 6, 1, 1, 1, 0.00, 'divider_poly3*4', '#ffffff,#ffffff,#ffffff,#F7EBBC,#F7EBBC', 51, 1, 1, 1, 862);
INSERT INTO `catalogue_items` VALUES (863, 'Bar/desk', 'Perfect for work or play', 3, 1, 2, 1, 1.00, 'bardesk_polyfon*4', '#ffffff,#ffffff,#F7EBBC,#F7EBBC', 51, 0, 1, 1, 863);
INSERT INTO `catalogue_items` VALUES (864, 'Corner Cabinet/Desk', 'Tuck it away', 3, 1, 1, 1, 1.00, 'bardeskcorner_polyfon*4', '#ffffff,#F7EBBC', 51, 0, 1, 1, 864);
INSERT INTO `catalogue_items` VALUES (865, 'Double Bed', 'Give yourself space to stretch out', 4, 2, 2, 3, 1.50, 'bed_polyfon*6', '#ffffff,#ffffff,#5EAAF8,#5EAAF8', 51, 0, 1, 1, 865);
INSERT INTO `catalogue_items` VALUES (866, 'Single Bed', 'Cot of the artistic', 3, 2, 1, 3, 1.50, 'bed_polyfon_one*6', '#ffffff,#ffffff,#ffffff,#5EAAF8,#5EAAF8', 51, 0, 1, 1, 866);
INSERT INTO `catalogue_items` VALUES (867, 'Two-seater Sofa', 'Comfort for stylish couples', 4, 2, 2, 1, 1.20, 'sofa_polyfon*6', '#ffffff,#ffffff,#ffffff,#ffffff,#5EAAF8,#5EAAF8,#5EAAF8,#5EAAF8', 51, 0, 1, 1, 867);
INSERT INTO `catalogue_items` VALUES (868, 'Armchair', 'Loft-style comfort', 3, 2, 1, 1, 1.20, 'sofachair_polyfon*6', '#ffffff,#ffffff,#5EAAF8,#5EAAF8', 51, 0, 1, 1, 868);
INSERT INTO `catalogue_items` VALUES (869, 'Hatch (Lockable)', 'All bars should have one', 6, 1, 1, 1, 0.00, 'divider_poly3*6', '#ffffff,#ffffff,#ffffff,#5EAAF8,#5EAAF8', 51, 1, 1, 1, 869);
INSERT INTO `catalogue_items` VALUES (870, 'Bar/desk', 'Perfect for work or play', 3, 1, 2, 1, 1.00, 'bardesk_polyfon*6', '#ffffff,#ffffff,#5EAAF8,#5EAAF8', 51, 0, 1, 1, 870);
INSERT INTO `catalogue_items` VALUES (871, 'Corner Cabinet/Desk', 'Tuck it away', 3, 1, 1, 1, 1.00, 'bardeskcorner_polyfon*6', '#ffffff,#5EAAF8', 51, 0, 1, 1, 871);
INSERT INTO `catalogue_items` VALUES (872, 'Double Bed', 'Give yourself space to stretch out', 4, 2, 2, 3, 1.50, 'bed_polyfon*7', '#ffffff,#ffffff,#7CB135,#7CB135', 51, 0, 1, 1, 872);
INSERT INTO `catalogue_items` VALUES (873, 'Single Bed', 'Cot of the artistic', 3, 2, 1, 3, 1.50, 'bed_polyfon_one*7', '#ffffff,#ffffff,#ffffff,#7CB135,#7CB135', 51, 0, 1, 1, 873);
INSERT INTO `catalogue_items` VALUES (874, 'Two-seater Sofa', 'Comfort for stylish couples', 4, 2, 2, 1, 1.20, 'sofa_polyfon*7', '#ffffff,#ffffff,#ffffff,#ffffff,#7CB135,#7CB135,#7CB135,#7CB135', 51, 0, 1, 1, 874);
INSERT INTO `catalogue_items` VALUES (875, 'Armchair', 'Loft-style comfort', 3, 2, 1, 1, 1.20, 'sofachair_polyfon*7', '#ffffff,#ffffff,#7CB135,#7CB135', 51, 0, 1, 1, 875);
INSERT INTO `catalogue_items` VALUES (876, 'Hatch (Lockable)', 'All bars should have one', 6, 1, 1, 1, 0.00, 'divider_poly3*7', '#ffffff,#ffffff,#ffffff,#7CB135,#7CB135', 51, 1, 1, 1, 876);
INSERT INTO `catalogue_items` VALUES (877, 'Bar/desk', 'Perfect for work or play', 3, 1, 2, 1, 1.00, 'bardesk_polyfon*7', '#ffffff,#ffffff,#7CB135,#7CB135', 51, 0, 1, 1, 877);
INSERT INTO `catalogue_items` VALUES (878, 'Corner Cabinet/Desk', 'Tuck it away', 3, 1, 1, 1, 1.00, 'bardeskcorner_polyfon*7', '#ffffff,#7CB135', 51, 0, 1, 1, 878);
INSERT INTO `catalogue_items` VALUES (879, 'Double Bed', 'Give yourself space to stretch out', 4, 2, 2, 3, 1.50, 'bed_polyfon*8', '#ffffff,#ffffff,#FFD837,#FFD837', 51, 0, 1, 1, 879);
INSERT INTO `catalogue_items` VALUES (880, 'Single Bed', 'Cot of the artistic', 3, 2, 1, 3, 1.50, 'bed_polyfon_one*8', '#ffffff,#ffffff,#ffffff,#FFD837,#FFD837', 51, 0, 1, 1, 880);
INSERT INTO `catalogue_items` VALUES (881, 'Two-seater Sofa', 'Comfort for stylish couples', 4, 2, 2, 1, 1.20, 'sofa_polyfon*8', '#ffffff,#ffffff,#ffffff,#ffffff,#FFD837,#FFD837,#FFD837,#FFD837', 51, 0, 1, 1, 881);
INSERT INTO `catalogue_items` VALUES (882, 'Armchair', 'Loft-style comfort', 3, 2, 1, 1, 1.20, 'sofachair_polyfon*8', '#ffffff,#ffffff,#FFD837,#FFD837', 51, 0, 1, 1, 882);
INSERT INTO `catalogue_items` VALUES (883, 'Hatch (Lockable)', 'All bars should have one', 6, 1, 1, 1, 0.00, 'divider_poly3*8', '#ffffff,#ffffff,#ffffff,#FFD837,#FFD837', 51, 1, 1, 1, 883);
INSERT INTO `catalogue_items` VALUES (884, 'Bar/desk', 'Perfect for work or play', 3, 1, 2, 1, 1.00, 'bardesk_polyfon*8', '#ffffff,#ffffff,#FFD837,#FFD837', 51, 0, 1, 1, 884);
INSERT INTO `catalogue_items` VALUES (885, 'Corner Cabinet/Desk', 'Tuck it away', 3, 1, 1, 1, 1.00, 'bardeskcorner_polyfon*8', '#ffffff,#FFD837', 51, 0, 1, 1, 885);
INSERT INTO `catalogue_items` VALUES (886, 'Double Bed', 'Give yourself space to stretch out', 4, 2, 2, 3, 1.50, 'bed_polyfon*9', '#ffffff,#ffffff,#E14218,#E14218', 51, 0, 1, 1, 886);
INSERT INTO `catalogue_items` VALUES (887, 'Single Bed', 'Cot of the artistic', 3, 2, 1, 3, 1.50, 'bed_polyfon_one*9', '#ffffff,#ffffff,#ffffff,#E14218,#E14218', 51, 0, 1, 1, 887);
INSERT INTO `catalogue_items` VALUES (888, 'Two-seater Sofa', 'Comfort for stylish couples', 4, 2, 2, 1, 1.20, 'sofa_polyfon*9', '#ffffff,#ffffff,#ffffff,#ffffff,#E14218,#E14218,#E14218,#E14218', 51, 0, 1, 1, 888);
INSERT INTO `catalogue_items` VALUES (889, 'Armchair', 'Loft-style comfort', 3, 2, 1, 1, 1.20, 'sofachair_polyfon*9', '#ffffff,#ffffff,#E14218,#E14218', 51, 0, 1, 1, 889);
INSERT INTO `catalogue_items` VALUES (890, 'Hatch (Lockable)', 'All bars should have one', 6, 1, 1, 1, 0.00, 'divider_poly3*9', '#ffffff,#ffffff,#ffffff,#E14218,#E14218', 51, 1, 1, 1, 890);
INSERT INTO `catalogue_items` VALUES (891, 'Bar/desk', 'Perfect for work or play', 3, 1, 2, 1, 1.00, 'bardesk_polyfon*9', '#ffffff,#ffffff,#E14218,#E14218', 51, 0, 1, 1, 891);
INSERT INTO `catalogue_items` VALUES (892, 'Corner Cabinet/Desk', 'Tuck it away', 3, 1, 1, 1, 1.00, 'bardeskcorner_polyfon*9', '#ffffff,#E14218', 51, 0, 1, 1, 892);
INSERT INTO `catalogue_items` VALUES (893, 'Aqua Pura module 1', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl1*1', '#FFFFFF,#ABD0D2,#ABD0D2,#FFFFFF', 52, 0, 1, 1, 893);
INSERT INTO `catalogue_items` VALUES (894, 'Aqua Pura module 2', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl2*1', '#FFFFFF,#ABD0D2,#ABD0D2,#FFFFFF', 52, 0, 1, 1, 894);
INSERT INTO `catalogue_items` VALUES (895, 'Aqua Pura module 3', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl3*1', '#FFFFFF,#ABD0D2,#ABD0D2,#FFFFFF', 52, 0, 1, 1, 895);
INSERT INTO `catalogue_items` VALUES (896, 'Aqua Pura module 4', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl4*1', '#FFFFFF,#ABD0D2,#ABD0D2,#ABD0D2', 52, 0, 1, 1, 896);
INSERT INTO `catalogue_items` VALUES (897, 'Aqua Pura module 5', 'Endless fun!', 1, 2, 1, 1, 1.00, 'pura_mdl5*1', '#FFFFFF,#ABD0D2,#FFFFFF', 52, 0, 1, 1, 897);
INSERT INTO `catalogue_items` VALUES (898, 'Pink Pura module 1', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl1*2', '#FFFFFF,#FF99BC,#FF99BC,#FFFFFF', 52, 0, 1, 1, 898);
INSERT INTO `catalogue_items` VALUES (899, 'Pink Pura module 2', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl2*2', '#FFFFFF,#FF99BC,#FF99BC,#FFFFFF', 52, 0, 1, 1, 899);
INSERT INTO `catalogue_items` VALUES (900, 'Pink Pura module 3', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl3*2', '#FFFFFF,#FF99BC,#FF99BC,#FFFFFF', 52, 0, 1, 1, 900);
INSERT INTO `catalogue_items` VALUES (901, 'Pink Pura module 4', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl4*2', '#FFFFFF,#FF99BC,#FF99BC,#FF99BC', 52, 0, 1, 1, 901);
INSERT INTO `catalogue_items` VALUES (902, 'Pink Pura module 5', 'Endless fun!', 1, 2, 1, 1, 1.00, 'pura_mdl5*2', '#FFFFFF,#FF99BC,#FF99BC,#FFFFFF', 52, 0, 1, 1, 902);
INSERT INTO `catalogue_items` VALUES (903, 'Black Pura module 1', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl1*3', '#FFFFFF,#525252,#525252,#FFFFFF', 52, 0, 1, 1, 903);
INSERT INTO `catalogue_items` VALUES (904, 'Black Pura module 2', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl2*3', '#FFFFFF,#525252,#525252,#FFFFFF', 52, 0, 1, 1, 904);
INSERT INTO `catalogue_items` VALUES (905, 'Black Pura module 3', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl3*3', '#FFFFFF,#525252,#525252,#FFFFFF', 52, 0, 1, 1, 905);
INSERT INTO `catalogue_items` VALUES (906, 'Black Pura module 4', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl4*3', '#FFFFFF,#525252,#525252,#525252', 52, 0, 1, 1, 906);
INSERT INTO `catalogue_items` VALUES (907, 'Black Pura module 5', 'Endless fun!', 1, 2, 1, 1, 1.00, 'pura_mdl5*3', '#FFFFFF,#525252,#525252,#FFFFFF', 52, 0, 1, 1, 907);
INSERT INTO `catalogue_items` VALUES (908, 'White Pura module 1', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl1*4', '#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 52, 0, 1, 1, 908);
INSERT INTO `catalogue_items` VALUES (909, 'White Pura module 2', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl2*4', '#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 52, 0, 1, 1, 909);
INSERT INTO `catalogue_items` VALUES (910, 'White Pura module 3', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl3*4', '#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 52, 0, 1, 1, 910);
INSERT INTO `catalogue_items` VALUES (911, 'White Pura module 4', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl4*4', '#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 52, 0, 1, 1, 911);
INSERT INTO `catalogue_items` VALUES (912, 'White Pura module 5', 'Endless fun!', 1, 2, 1, 1, 1.00, 'pura_mdl5*4', '#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 52, 0, 1, 1, 912);
INSERT INTO `catalogue_items` VALUES (913, 'Beige Pura module 1', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl1*5', '#FFFFFF,#F7EBBC,#F7EBBC,#FFFFFF', 52, 0, 1, 1, 913);
INSERT INTO `catalogue_items` VALUES (914, 'Beige Pura module 2', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl2*5', '#FFFFFF,#F7EBBC,#F7EBBC,#FFFFFF', 52, 0, 1, 1, 914);
INSERT INTO `catalogue_items` VALUES (915, 'Beige Pura module 3', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl3*5', '#FFFFFF,#F7EBBC,#F7EBBC,#FFFFFF', 52, 0, 1, 1, 915);
INSERT INTO `catalogue_items` VALUES (916, 'Beige Pura module 4', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl4*5', '#FFFFFF,#F7EBBC,#F7EBBC,#F7EBBC', 52, 0, 1, 1, 916);
INSERT INTO `catalogue_items` VALUES (917, 'Beige Pura module 5', 'Endless fun!', 1, 2, 1, 1, 1.00, 'pura_mdl5*5', '#FFFFFF,#F7EBBC,#F7EBBC,#FFFFFF', 52, 0, 1, 1, 917);
INSERT INTO `catalogue_items` VALUES (918, 'Blue Pura module 1', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl1*6', '#FFFFFF,#5EAAF8,#5EAAF8,#FFFFFF', 52, 0, 1, 1, 918);
INSERT INTO `catalogue_items` VALUES (919, 'Blue Pura module 2', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl2*6', '#FFFFFF,#5EAAF8,#5EAAF8,#FFFFFF', 52, 0, 1, 1, 919);
INSERT INTO `catalogue_items` VALUES (920, 'Blue Pura module 3', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl3*6', '#FFFFFF,#5EAAF8,#5EAAF8,#FFFFFF', 52, 0, 1, 1, 920);
INSERT INTO `catalogue_items` VALUES (921, 'Blue Pura module 4', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl4*6', '#FFFFFF,#5EAAF8,#5EAAF8,#5EAAF8', 52, 0, 1, 1, 921);
INSERT INTO `catalogue_items` VALUES (922, 'Blue Pura module 5', 'Endless fun!', 1, 2, 1, 1, 1.00, 'pura_mdl5*6', '#FFFFFF,#5EAAF8,#5EAAF8,#FFFFFF', 52, 0, 1, 1, 922);
INSERT INTO `catalogue_items` VALUES (923, 'Green Pura module 1', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl1*7', '#FFFFFF,#92D13D,#92D13D,#FFFFFF', 52, 0, 1, 1, 923);
INSERT INTO `catalogue_items` VALUES (924, 'Green Pura module 2', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl2*7', '#FFFFFF,#92D13D,#92D13D,#FFFFFF', 52, 0, 1, 1, 924);
INSERT INTO `catalogue_items` VALUES (925, 'Green Pura module 3', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl3*7', '#FFFFFF,#92D13D,#92D13D,#FFFFFF', 52, 0, 1, 1, 925);
INSERT INTO `catalogue_items` VALUES (926, 'Green Pura module 4', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl4*7', '#FFFFFF,#92D13D,#92D13D,#92D13D', 52, 0, 1, 1, 926);
INSERT INTO `catalogue_items` VALUES (927, 'Green Pura module 5', 'Endless fun!', 1, 2, 1, 1, 1.00, 'pura_mdl5*7', '#FFFFFF,#92D13D,#92D13D,#FFFFFF', 52, 0, 1, 1, 927);
INSERT INTO `catalogue_items` VALUES (928, 'Yellow Pura module 1', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl1*8', '#FFFFFF,#FFD837,#FFD837,#FFFFFF', 52, 0, 1, 1, 928);
INSERT INTO `catalogue_items` VALUES (929, 'Yellow Pura module 2', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl2*8', '#FFFFFF,#FFD837,#FFD837,#FFFFFF', 52, 0, 1, 1, 929);
INSERT INTO `catalogue_items` VALUES (930, 'Yellow Pura module 3', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl3*8', '#FFFFFF,#FFD837,#FFD837,#FFFFFF', 52, 0, 1, 1, 930);
INSERT INTO `catalogue_items` VALUES (931, 'Yellow Pura module 4', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl4*8', '#FFFFFF,#FFD837,#FFD837,#FFD837', 52, 0, 1, 1, 931);
INSERT INTO `catalogue_items` VALUES (932, 'Yellow Pura module 5', 'Endless fun!', 1, 2, 1, 1, 1.00, 'pura_mdl5*8', '#FFFFFF,#FFD837,#FFD837,#FFFFFF', 52, 0, 1, 1, 932);
INSERT INTO `catalogue_items` VALUES (933, 'Red Pura module 1', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl1*9', '#FFFFFF,#E14218,#E14218,#FFFFFF', 52, 0, 1, 1, 933);
INSERT INTO `catalogue_items` VALUES (934, 'Red Pura module 2', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl2*9', '#FFFFFF,#E14218,#E14218,#FFFFFF', 52, 0, 1, 1, 934);
INSERT INTO `catalogue_items` VALUES (935, 'Red Pura module 3', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl3*9', '#FFFFFF,#E14218,#E14218,#FFFFFF', 52, 0, 1, 1, 935);
INSERT INTO `catalogue_items` VALUES (936, 'Red Pura module 4', 'Endless fun!', 2, 2, 1, 1, 1.00, 'pura_mdl4*9', '#FFFFFF,#E14218,#E14218,#E14218', 52, 0, 1, 1, 936);
INSERT INTO `catalogue_items` VALUES (937, 'Red Pura module 5', 'Endless fun!', 1, 2, 1, 1, 1.00, 'pura_mdl5*9', '#FFFFFF,#E14218,#E14218,#FFFFFF', 52, 0, 1, 1, 937);
INSERT INTO `catalogue_items` VALUES (938, 'Aqua Retro Chair', 'Sitback and relax', 5, 2, 1, 1, 1.00, 'chair_basic*1', '#FFFFFF,#ABD0D2,#FFFFFF', 52, 0, 1, 1, 938);
INSERT INTO `catalogue_items` VALUES (939, 'Pink Retro Chair', 'Sitback and relax', 5, 2, 1, 1, 1.00, 'chair_basic*1', '#FFFFFF,#FF99BC,#FFFFFF', 52, 0, 1, 1, 939);
INSERT INTO `catalogue_items` VALUES (940, 'Black Retro Chair', 'Sitback and relax', 5, 2, 1, 1, 1.00, 'chair_basic*1', '#FFFFFF,#525252,#FFFFFF', 52, 0, 1, 1, 940);
INSERT INTO `catalogue_items` VALUES (941, 'White Retro Chair', 'Sitback and relax', 5, 2, 1, 1, 1.00, 'chair_basic*1', '#FFFFFF,#FFFFFF,#FFFFFF', 52, 0, 1, 1, 941);
INSERT INTO `catalogue_items` VALUES (942, 'Beige Retro Chair', 'Sitback and relax', 5, 2, 1, 1, 1.00, 'chair_basic*1', '#FFFFFF,#F7EBBC,#FFFFFF', 52, 0, 1, 1, 942);
INSERT INTO `catalogue_items` VALUES (943, 'Blue Retro Chair', 'Sitback and relax', 5, 2, 1, 1, 1.00, 'chair_basic*1', '#FFFFFF,#5EAAF8,#FFFFFF', 52, 0, 1, 1, 943);
INSERT INTO `catalogue_items` VALUES (944, 'Green Retro Chair', 'Sitback and relax', 5, 2, 1, 1, 1.00, 'chair_basic*1', '#FFFFFF,#92D13D,#FFFFFF', 52, 0, 1, 1, 944);
INSERT INTO `catalogue_items` VALUES (945, 'Yellow Retro Chair', 'Sitback and relax', 5, 2, 1, 1, 1.00, 'chair_basic*1', '#FFFFFF,#FFD837,#FFFFFF', 52, 0, 1, 1, 945);
INSERT INTO `catalogue_items` VALUES (946, 'Red Retro Chair', 'Sitback and relax', 5, 2, 1, 1, 1.00, 'chair_basic*1', '#FFFFFF,#E14218,#FFFFFF', 52, 0, 1, 1, 946);
INSERT INTO `catalogue_items` VALUES (947, 'Rose Grand Piano', 'Rose Grand Piano', 10, 1, 2, 2, 0.00, 'grand_piano*1', '#FFFFFF,#FF8B8B,#FFFFFF', 53, 0, 1, 1, 947);
INSERT INTO `catalogue_items` VALUES (948, 'Rose Quartz Piano Stool', 'Here sat the legend of 1900', 2, 2, 1, 1, 1.20, 'romantique_pianochair*1', '#FFFFFF,#FF8B8B,#FFFFFF', 53, 0, 1, 1, 948);
INSERT INTO `catalogue_items` VALUES (949, 'Rose Quartz Chair', 'Elegant seating for elegant Habbos', 5, 2, 1, 1, 1.00, 'romantique_chair*1', '#FFFFFF,#FF8B8B,#FFFFFF', 53, 0, 1, 1, 949);
INSERT INTO `catalogue_items` VALUES (950, 'Rose Romantique Divan', 'null', 6, 2, 2, 1, 1.00, 'romantique_divan*1', '#FFFFFF,#FFFFFF,#FFFFFF,#FF8B8B', 53, 0, 1, 1, 950);
INSERT INTO `catalogue_items` VALUES (951, 'Rose Quartz Screen', 'Beauty lies within', 6, 1, 2, 1, 0.00, 'romantique_divider*1', '#FF8B8B,#FF8B8B,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 53, 0, 1, 1, 951);
INSERT INTO `catalogue_items` VALUES (952, 'Rose Quartz Tray Table', 'Every tray needs a table...', 4, 1, 1, 1, 0.80, 'romantique_smalltabl*1', '#FFFFFF,#FF8B8B,#FFFFFF', 53, 0, 1, 1, 952);
INSERT INTO `catalogue_items` VALUES (953, 'Lime Grand Piano', 'Lime Grand Piano', 10, 1, 2, 2, 0.00, 'grand_piano*2', '#FFFFFF,#A1DC67,#FFFFFF', 53, 0, 1, 1, 953);
INSERT INTO `catalogue_items` VALUES (954, 'Lime Piano Chair', 'Let the music begin', 2, 2, 1, 1, 1.20, 'romantique_pianochair*2', '#FFFFFF,#A1DC67,#FFFFFF', 53, 0, 1, 1, 954);
INSERT INTO `catalogue_items` VALUES (955, 'Lime Romantique Chair', 'null', 5, 2, 1, 1, 1.00, 'romantique_chair*2', '#FFFFFF,#A1DC67,#FFFFFF', 53, 0, 1, 1, 955);
INSERT INTO `catalogue_items` VALUES (956, 'Emerald Chaise-Longue', 'Recline in continental comfort', 6, 2, 2, 1, 1.00, 'romantique_divan*2', '#FFFFFF,#FFFFFF,#FFFFFF,#A1DC67', 53, 0, 1, 1, 956);
INSERT INTO `catalogue_items` VALUES (957, 'Green Screen', 'Keeping things separated', 6, 1, 2, 1, 0.00, 'romantique_divider*2', '#A1DC67,#A1DC67,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 53, 0, 1, 1, 957);
INSERT INTO `catalogue_items` VALUES (958, 'Lime Tray Table', 'Every tray needs a table...', 4, 1, 1, 1, 0.80, 'romantique_smalltabl*2', '#FFFFFF,#A1DC67,#FFFFFF', 53, 0, 1, 1, 958);
INSERT INTO `catalogue_items` VALUES (959, 'Pink Grand Piano', 'Make sure you play in key!', 10, 1, 2, 2, 0.00, 'grand_piano*3', '#FFFFFF,#5BD1D2,#FFFFFF', 53, 0, 1, 1, 959);
INSERT INTO `catalogue_items` VALUES (960, 'Turquoise Piano Chair', 'null', 2, 2, 1, 1, 1.20, 'romantique_pianochair*3', '#FFFFFF,#5BD1D2,#FFFFFF', 53, 0, 1, 1, 960);
INSERT INTO `catalogue_items` VALUES (961, 'Turquoise Chair', 'null', 5, 2, 1, 1, 1.00, 'romantique_chair*3', '#FFFFFF,#5BD1D2,#FFFFFF', 53, 0, 1, 1, 961);
INSERT INTO `catalogue_items` VALUES (962, 'Turquoise Divan', 'null', 6, 2, 2, 1, 1.00, 'romantique_divan*3', '#FFFFFF,#FFFFFF,#FFFFFF,#5BD1D2', 53, 0, 1, 1, 962);
INSERT INTO `catalogue_items` VALUES (963, 'Turquoise Screen', 'Keeping things separated', 6, 1, 2, 1, 0.00, 'romantique_divider*3', '#5BD1D2,#5BD1D2,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 53, 0, 1, 1, 963);
INSERT INTO `catalogue_items` VALUES (964, 'Turquoise Tray Table', 'Every tray needs a table...', 4, 1, 1, 1, 0.80, 'romantique_smalltabl*3', '#FFFFFF,#5BD1D2,#FFFFFF', 53, 0, 1, 1, 964);
INSERT INTO `catalogue_items` VALUES (965, 'Amber Grand Piano', 'Why is that key green?', 10, 1, 2, 2, 0.00, 'grand_piano*4', '#FFFFFF,#FFC924,#FFFFFF', 53, 0, 1, 1, 965);
INSERT INTO `catalogue_items` VALUES (966, 'Amber Piano Stool', 'I can feel air coming through...', 2, 2, 1, 1, 1.20, 'romantique_pianochair*4', '#FFFFFF,#FFC924,#FFFFFF', 53, 0, 1, 1, 966);
INSERT INTO `catalogue_items` VALUES (967, 'Amber Chair', 'What does this button do?', 5, 2, 1, 1, 1.00, 'romantique_chair*4', '#FFFFFF,#FFC924,#FFFFFF', 53, 0, 1, 1, 967);
INSERT INTO `catalogue_items` VALUES (968, 'Amber Chaise-Longue', 'Is that a cape hanging there?', 6, 2, 2, 1, 1.00, 'romantique_divan*4', '#FFFFFF,#FFFFFF,#FFFFFF,#FFC924', 53, 0, 1, 1, 968);
INSERT INTO `catalogue_items` VALUES (969, 'Ochre Screen', 'Keeping things separated', 6, 1, 2, 1, 0.00, 'romantique_divider*4', '#FFC924,#FFC924,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 53, 0, 1, 1, 969);
INSERT INTO `catalogue_items` VALUES (970, 'Amber Tray Table', 'Why is one leg different?', 4, 1, 1, 1, 0.80, 'romantique_smalltabl*4', '#FFFFFF,#FFC924,#FFFFFF', 53, 0, 1, 1, 970);
INSERT INTO `catalogue_items` VALUES (971, 'Onyx Grand Piano', 'Why is that key green?', 10, 1, 2, 2, 0.00, 'grand_piano*5', '#FFFFFF,#323C46,#FFFFFF', 53, 0, 1, 1, 971);
INSERT INTO `catalogue_items` VALUES (972, 'Onyx Piano Stool', 'I can feel air coming through...', 2, 2, 1, 1, 1.20, 'romantique_pianochair*5', '#FFFFFF,#323C46,#FFFFFF', 53, 0, 1, 1, 972);
INSERT INTO `catalogue_items` VALUES (973, 'Onyx Chair', 'What does this button do?', 5, 2, 1, 1, 1.00, 'romantique_chair*5', '#FFFFFF,#323C46,#FFFFFF', 53, 0, 1, 1, 973);
INSERT INTO `catalogue_items` VALUES (974, 'Onyx Chaise-Longue', 'Is that a cape hanging there?', 6, 2, 2, 1, 1.00, 'romantique_divan*5', '#FFFFFF,#FFFFFF,#FFFFFF,#323C46', 53, 0, 1, 1, 974);
INSERT INTO `catalogue_items` VALUES (975, 'Onyx Quartz Screen', 'Beauty lies within', 6, 1, 2, 1, 0.00, 'romantique_divider*5', '#323C46,#323C46,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 53, 0, 1, 1, 975);
INSERT INTO `catalogue_items` VALUES (976, 'Onyx Tray Table', 'Why is one leg different?', 4, 1, 1, 1, 0.80, 'romantique_smalltabl*5', '#FFFFFF,#323C46,#FFFFFF', 53, 0, 1, 1, 976);
INSERT INTO `catalogue_items` VALUES (977, 'Club sofa', 'Importants habbos only', 25, 2, 2, 1, 1.00, 'club_sofa', '0,0,0', 54, 0, 1, 1, 977);
INSERT INTO `catalogue_items` VALUES (978, 'HC chair', 'Aqua chair', 3, 2, 1, 1, 1.00, 'chair_plasto*14', '#ffffff,#3CB4F0,#ffffff,#3CB4F0', 54, 0, 1, 1, 978);
INSERT INTO `catalogue_items` VALUES (979, 'HC table', 'Aqua table', 3, 1, 2, 2, 1.00, 'table_plasto_4leg*14', '#ffffff,#3CB4F0,#ffffff,#3CB4F0', 54, 0, 1, 1, 979);
INSERT INTO `catalogue_items` VALUES (980, 'Mochamaster', 'Wake up and smell it!', 25, 1, 1, 1, 0.00, 'mocchamaster', '0,0,0', 54, 0, 1, 1, 980);
INSERT INTO `catalogue_items` VALUES (981, 'Dicemaster', 'Click and roll!', 25, 1, 1, 1, 0.00, 'edicehc', '0,0,0', 54, 0, 1, 1, 981);
INSERT INTO `catalogue_items` VALUES (982, 'Tubmaster', 'Time for a soak', 25, 2, 1, 2, 1.00, 'hcamme', '0,0,0', 54, 0, 1, 1, 982);
INSERT INTO `catalogue_items` VALUES (983, 'Imperial Teleport', 'Let\'s go over tzar!', 25, 1, 1, 1, 0.00, 'doorD', '0,0,0', 54, 0, 1, 1, 983);
INSERT INTO `catalogue_items` VALUES (984, 'Throne Sofa', 'For royal bottoms...', 25, 2, 2, 1, 1.00, 'hcsohva', '0,0,0', 54, 0, 1, 1, 984);
INSERT INTO `catalogue_items` VALUES (985, 'Oil Lamp', 'Be enlightened', 25, 1, 1, 1, 0.00, 'hc_lmp', '0,0,0', 54, 0, 1, 1, 985);
INSERT INTO `catalogue_items` VALUES (986, 'Nordic Table', 'Perfect for banquets', 25, 1, 1, 3, 1.00, 'hc_tbl', '0,0,0', 54, 0, 1, 1, 986);
INSERT INTO `catalogue_items` VALUES (987, 'Majestic Chair', 'Royal comfort', 25, 2, 1, 1, 1.00, 'hc_chr', '0,0,0', 54, 0, 1, 1, 987);
INSERT INTO `catalogue_items` VALUES (988, 'Study Desk', 'For Habbo scholars', 25, 1, 1, 2, 0.00, 'hc_dsk', '0,0,0', 54, 0, 1, 1, 988);
INSERT INTO `catalogue_items` VALUES (989, 'Drinks Trolley', 'For swanky dinners only', 25, 1, 1, 2, 0.00, 'hc_trll', '0,0,0', 54, 0, 1, 1, 989);
INSERT INTO `catalogue_items` VALUES (990, 'Persian Carpet', 'Ultimate craftsmanship', 25, 4, 3, 5, 0.00, 'hc_crpt', '0,0,0', 54, 0, 1, 1, 990);
INSERT INTO `catalogue_items` VALUES (991, 'Victorian Street Light', 'Somber and atmospheric', 25, 1, 1, 1, 0.00, 'hc_lmpst', '0,0,0', 54, 0, 1, 1, 991);
INSERT INTO `catalogue_items` VALUES (992, 'Antique Drapery', 'Topnotch privacy protection', 25, 1, 2, 1, 0.00, 'hc_crtn', '0,0,0', 54, 1, 1, 1, 992);
INSERT INTO `catalogue_items` VALUES (993, 'Mega TV Set', 'Forget plasma, go HC!', 25, 2, 2, 1, 1.30, 'hc_tv', '0,0,0', 54, 0, 1, 1, 993);
INSERT INTO `catalogue_items` VALUES (994, 'Electric Butler', 'Your personal caretaker', 25, 1, 1, 1, 0.00, 'hc_btlr', '0,0,0', 54, 0, 1, 1, 994);
INSERT INTO `catalogue_items` VALUES (995, 'Medieval Bookcase', 'For the scholarly ones', 25, 1, 1, 4, 0.00, 'hc_bkshlf', '0,0,0', 54, 0, 1, 1, 995);
INSERT INTO `catalogue_items` VALUES (996, 'X-Ray Divider', 'Believe it or not!', 25, 1, 2, 1, 0.00, 'hc_rntgn', '0,0,0', 54, 0, 1, 1, 996);
INSERT INTO `catalogue_items` VALUES (997, 'Weird Science Machine', 'By and for mad inventors', 25, 1, 1, 3, 0.00, 'hc_machine', '0,0,0', 54, 0, 1, 1, 997);
INSERT INTO `catalogue_items` VALUES (998, 'Heavy Duty Fireplace', 'Pixel-powered for maximum heating', 25, 1, 1, 3, 0.00, 'hc_frplc', '0,0,0', 54, 0, 1, 1, 998);
INSERT INTO `catalogue_items` VALUES (999, 'The Grammophon', 'Very old skool scratch\'n\'spin', 25, 1, 3, 1, 0.00, 'hc_djset', '0,0,0', 54, 0, 1, 1, 999);
INSERT INTO `catalogue_items` VALUES (1000, 'HC Rollers Set', 'Highest class transportation', 25, 1, 1, 1, 0.20, 'hc_rllr', '0,0,0', 54, 0, 1, 1, 1000);
INSERT INTO `catalogue_items` VALUES (1001, 'Retro Wall Lamp', 'Tres chic!', 25, 0, 0, 0, 0.00, 'hc_wall_lamp', '0,0,0', 54, 0, 1, 1, 1001);
INSERT INTO `catalogue_items` VALUES (1002, 'Mood Light', 'Superior lighting for your room', 25, 0, 0, 0, 0.00, 'roomdimmer', '0,0,0', 55, 0, 1, 1, 1002);
INSERT INTO `catalogue_items` VALUES (1003, 'Fire Dragon Lamp', 'George and the...', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*0', '#ffffff,#fa2d00,#fa2d00', 56, 0, 1, 1, 1003);
INSERT INTO `catalogue_items` VALUES (1004, 'Sea Dragon Lamp', 'Out of the deep blue!', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*1', '#ffffff,#3470ff,#3470ff', 56, 0, 1, 1, 1004);
INSERT INTO `catalogue_items` VALUES (1005, 'Jade Dragon Lamp', 'Oriental beast of legends', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*2', '#ffffff,#02bb70,#02bb70', 56, 0, 1, 1, 1005);
INSERT INTO `catalogue_items` VALUES (1006, 'Silver Dragon Lamp', 'Scary and scorching!', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*3', '#ffffff,#ffffff,#ffffff', 56, 0, 1, 1, 1006);
INSERT INTO `catalogue_items` VALUES (1007, 'Serpent of Doom', 'Scary and scorching!', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*4', '#ffffff,#3e3d40,#3e3d40', 56, 0, 1, 1, 1007);
INSERT INTO `catalogue_items` VALUES (1008, 'Elf Green Dragon Lamp', 'Roast your chestnuts here!', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*5', '#ffffff,#589a03,#589a03', 56, 0, 1, 1, 1008);
INSERT INTO `catalogue_items` VALUES (1009, 'Gold Dragon Lamp', 'Scary and scorching!', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*6', '#ffffff,#ffbc00,#ffbc00', 56, 0, 1, 1, 1009);
INSERT INTO `catalogue_items` VALUES (1010, 'Sky Dragon Lamp', 'Scary and scorching!', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*7', '#ffffff,#83aeff,#83aeff', 56, 0, 1, 1, 1010);
INSERT INTO `catalogue_items` VALUES (1011, 'Bronze Dragon Lamp', 'Scary and scorching!', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*8', '#ffffff,#ff5f01,#ff5f01', 56, 0, 1, 1, 1011);
INSERT INTO `catalogue_items` VALUES (1012, 'Purple Dragon Lamp', 'Scary and scorching!', 25, 1, 1, 1, 0.00, 'rare_dragonlamp*9', '#FFFFFF,#B357FF,#B357FF', 56, 0, 1, 1, 1012);
INSERT INTO `catalogue_items` VALUES (1013, 'Festive Fan', 'As red as Rudolph\'s nose', 25, 1, 1, 1, 0.00, 'rare_fan*0', '#F43100,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1013);
INSERT INTO `catalogue_items` VALUES (1014, 'Blue Powered Fan', 'It\'ll blow you away!', 25, 1, 1, 1, 0.00, 'rare_fan*1', '#3C75FF,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1014);
INSERT INTO `catalogue_items` VALUES (1015, 'Green Powered Fan', 'It\'ll blow you away!', 25, 1, 1, 1, 0.00, 'rare_fan*2', '#55CD01,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1015);
INSERT INTO `catalogue_items` VALUES (1016, 'Purple Powered Fan', 'It\'ll blow you away!', 25, 1, 1, 1, 0.00, 'rare_fan*3', '#BC9BFF,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1016);
INSERT INTO `catalogue_items` VALUES (1017, 'SUPERLOVE Fan', 'Fanning the fires of SUPERLOVE...', 25, 1, 1, 1, 0.00, 'rare_fan*4', '#e78b8b,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1017);
INSERT INTO `catalogue_items` VALUES (1018, 'Yellow Powered Fan', 'It\'ll blow you away!', 25, 1, 1, 1, 0.00, 'rare_fan*5', '#ffcc00,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1018);
INSERT INTO `catalogue_items` VALUES (1019, 'Ochre Powered Fan', 'It\'ll blow you away!', 25, 1, 1, 1, 0.00, 'rare_fan*6', '#FF8000,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1019);
INSERT INTO `catalogue_items` VALUES (1020, 'Brown Powered Fan', 'It\'ll blow you away!', 25, 1, 1, 1, 0.00, 'rare_fan*7', '#682B00,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1020);
INSERT INTO `catalogue_items` VALUES (1021, 'Habbo Wind Turbine', 'Stylish, Eco-Energy!', 25, 1, 1, 1, 0.00, 'rare_fan*8', '#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1021);
INSERT INTO `catalogue_items` VALUES (1022, 'Fucsia Powered Fan', 'It\'ll blow you away!', 25, 1, 1, 1, 0.00, 'rare_fan*9', '#FF60B0,#FFFFFF,#FFFFFF,#FFFFFF', 57, 0, 1, 1, 1022);
INSERT INTO `catalogue_items` VALUES (1023, 'Cherry Ice Cream', 'Virtual cherry rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*0', '#FFFFFF,#d02a1f', 58, 0, 1, 1, 1023);
INSERT INTO `catalogue_items` VALUES (1024, 'Blueberry Ice Cream', 'Virtual blueberry rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*1', '#FFFFFF,#55c4de', 58, 0, 1, 1, 1024);
INSERT INTO `catalogue_items` VALUES (1025, 'Pistachio Ice Cream', 'Virtual pistachio rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*2', '#FFFFFF,#94f718', 58, 0, 1, 1, 1025);
INSERT INTO `catalogue_items` VALUES (1026, 'Blackcurrant Ice Cream', 'Virtual blackcurrant rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*3', '#FFFFFF,#B357FF', 58, 0, 1, 1, 1026);
INSERT INTO `catalogue_items` VALUES (1027, 'Strawberry Ice Cream', 'Virtual strawberry rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*4', '#FFFFFF,#e78b8b', 58, 0, 1, 1, 1027);
INSERT INTO `catalogue_items` VALUES (1028, 'Vanilla Ice Cream', 'Virtual vanilla rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*5', '#FFFFFF,#E1CC00', 58, 0, 1, 1, 1028);
INSERT INTO `catalogue_items` VALUES (1029, 'Toffee Ice Cream', 'Virtual toffee rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*6', '#FFFFFF,#FF8000', 58, 0, 1, 1, 1029);
INSERT INTO `catalogue_items` VALUES (1030, 'Chocolate Ice Cream', 'Virtual chocolate rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*7', '#FFFFFF,#97420C', 58, 0, 1, 1, 1030);
INSERT INTO `catalogue_items` VALUES (1031, 'Peppermint Ice Cream', 'Virtual peppermint rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*8', '#FFFFFF,#00E5E2', 58, 0, 1, 1, 1031);
INSERT INTO `catalogue_items` VALUES (1032, 'Bubblegum Ice Cream', 'Virtual bubblegum rocks!', 25, 1, 1, 1, 0.00, 'rare_icecream*9', '#FFFFFF,#FF60B0', 58, 0, 1, 1, 1032);
INSERT INTO `catalogue_items` VALUES (1033, 'Blue Inflatable Chair', 'Soft and stylish HC chair', 25, 2, 1, 1, 1.00, 'rubberchair*1', '#0080FF,0,0', 59, 0, 1, 1, 1033);
INSERT INTO `catalogue_items` VALUES (1034, 'Pink Inflatable Chair', 'Soft and tearproof!', 25, 2, 1, 1, 1.00, 'rubberchair*2', '#FF8B8B,0,0', 59, 0, 1, 1, 1034);
INSERT INTO `catalogue_items` VALUES (1035, 'Orange Inflatable Chair', 'Soft and tearproof!', 25, 2, 1, 1, 1.00, 'rubberchair*3', '#FF8000,0,0', 59, 0, 1, 1, 1035);
INSERT INTO `catalogue_items` VALUES (1036, 'Ocean Inflatable Chair', 'Soft and tearproof!', 25, 2, 1, 1, 1.00, 'rubberchair*4', '#00E5E2,0,0', 59, 0, 1, 1, 1036);
INSERT INTO `catalogue_items` VALUES (1037, 'Lime Inflatable Chair', 'Soft and tearproof!', 25, 2, 1, 1, 1.00, 'rubberchair*5', '#A1DC67,0,0', 59, 0, 1, 1, 1037);
INSERT INTO `catalogue_items` VALUES (1038, 'Violet Inflatable Chair', 'Soft and tearproof!', 25, 2, 1, 1, 1.00, 'rubberchair*6', '#B357FF,0,0', 59, 0, 1, 1, 1038);
INSERT INTO `catalogue_items` VALUES (1039, 'White Inflatable Chair', 'Soft and tearproof!', 25, 2, 1, 1, 1.00, 'rubberchair*7', '#CFCFCF,0,0', 59, 0, 1, 1, 1039);
INSERT INTO `catalogue_items` VALUES (1040, 'Black Inflatable Chair', 'Soft and tearproof for HC!', 25, 2, 1, 1, 1.00, 'rubberchair*8', '#333333,0,0', 59, 0, 1, 1, 1040);
INSERT INTO `catalogue_items` VALUES (1041, 'Red Laser Door', 'Energy beams. No trespassers!', 25, 1, 1, 1, 0.00, 'scifiport*0', '#ffffff,#dd2d22,#ffffff,#ffffff,#ffffff,#dd2d22', 60, 1, 1, 1, 1041);
INSERT INTO `catalogue_items` VALUES (1042, 'Gold Laser Gate', 'Energy beams. No trespassers!', 25, 1, 1, 1, 0.00, 'scifiport*1', '#ffffff,#ffbc00,#ffffff,#ffffff,#ffffff,#ffbc00', 60, 1, 1, 1, 1042);
INSERT INTO `catalogue_items` VALUES (1043, 'Blue Laser Gate', 'Get in the ring!', 25, 1, 1, 1, 0.00, 'scifiport*2', '#ffffff,#5599ff,#ffffff,#ffffff,#ffffff,#5599ff', 60, 1, 1, 1, 1043);
INSERT INTO `catalogue_items` VALUES (1044, 'Jade Sci-Fi Port', 'Energy beams. No trespassers!', 25, 1, 1, 1, 0.00, 'scifiport*3', '#ffffff,#02bb70,#ffffff,#ffffff,#ffffff,#02bb70', 60, 1, 1, 1, 1044);
INSERT INTO `catalogue_items` VALUES (1045, 'Pink Sci-Fi Port', 'Energy beams. No trespassers!', 25, 1, 1, 1, 0.00, 'scifiport*4', '#ffffff,#ff5577,#ffffff,#ffffff,#ffffff,#ff5577', 60, 1, 1, 1, 1045);
INSERT INTO `catalogue_items` VALUES (1046, 'Security Fence', 'Recovered from Roswell', 25, 1, 1, 1, 0.00, 'scifiport*5', '#ffffff,#555555,#ffffff,#ffffff,#ffffff,#555555', 60, 1, 1, 1, 1046);
INSERT INTO `catalogue_items` VALUES (1047, 'White Sci-Fi Port', 'Energy beams. No trespassers!', 25, 1, 1, 1, 0.00, 'scifiport*6', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 60, 1, 1, 1, 1047);
INSERT INTO `catalogue_items` VALUES (1048, 'Turquoise Sci-Fi Port', 'Energy beams. No trespassers!', 25, 1, 1, 1, 0.00, 'scifiport*7', '#ffffff,#00cccc,#ffffff,#ffffff,#ffffff,#00cccc', 60, 1, 1, 1, 1048);
INSERT INTO `catalogue_items` VALUES (1049, 'Purple Sci-Fi Port', 'Energy beams. No trespassers!', 25, 1, 1, 1, 0.00, 'scifiport*8', '#ffffff,#bb55cc,#ffffff,#ffffff,#ffffff,#bb55cc', 60, 1, 1, 1, 1049);
INSERT INTO `catalogue_items` VALUES (1050, 'Violet Sci-Fi Port', 'Energy beams. No trespassers!', 25, 1, 1, 1, 0.00, 'scifiport*9', '#ffffff,#7733ff,#ffffff,#ffffff,#ffffff,#7733ff', 60, 1, 1, 1, 1050);
INSERT INTO `catalogue_items` VALUES (1051, 'Pink marquee', 'It\'s both door and a shade!', 25, 1, 1, 1, 0.00, 'marquee*1', '#ffffff,#ffffff,#ffffff,#e78b8b', 61, 1, 1, 1, 1051);
INSERT INTO `catalogue_items` VALUES (1052, 'Red Dragon Marquee', 'Dragons out and Davids in!', 25, 1, 1, 1, 0.00, 'marquee*2', '#ffffff,#ffffff,#ffffff,#d02a1f', 61, 1, 1, 1, 1052);
INSERT INTO `catalogue_items` VALUES (1053, 'Aqua Marquee', 'It\'s both door and a shade!', 25, 1, 1, 1, 0.00, 'marquee*3', '#ffffff,#ffffff,#ffffff,#3399FF', 61, 1, 1, 1, 1053);
INSERT INTO `catalogue_items` VALUES (1054, 'Yellow Marquee', 'It\'s both door and a shade!', 25, 1, 1, 1, 0.00, 'marquee*4', '#ffffff,#ffffff,#ffffff,#efbf00', 61, 1, 1, 1, 1054);
INSERT INTO `catalogue_items` VALUES (1055, 'Graphite Marquee', 'It\'s both door and a shade!', 25, 1, 1, 1, 0.00, 'marquee*5', '#ffffff,#ffffff,#ffffff,#666666', 61, 1, 1, 1, 1055);
INSERT INTO `catalogue_items` VALUES (1056, 'Blue Marquee', 'It\'s both door and a shade!', 25, 1, 1, 1, 0.00, 'marquee*6', '#ffffff,#ffffff,#ffffff,#0000FF', 61, 1, 1, 1, 1056);
INSERT INTO `catalogue_items` VALUES (1057, 'Purple Marquee', 'It\'s both door and a shade!', 25, 1, 1, 1, 0.00, 'marquee*7', '#ffffff,#ffffff,#ffffff,#B357FF', 61, 1, 1, 1, 1057);
INSERT INTO `catalogue_items` VALUES (1058, 'Ultramarine Marquee', 'It\'s both door and a shade!', 25, 1, 1, 1, 0.00, 'marquee*8', '#ffffff,#ffffff,#ffffff,#006699', 61, 1, 1, 1, 1058);
INSERT INTO `catalogue_items` VALUES (1059, 'Green Marquee', 'It\'s both door and a shade!', 25, 1, 1, 1, 0.00, 'marquee*9', '#ffffff,#ffffff,#ffffff,#89ca35', 61, 1, 1, 1, 1059);
INSERT INTO `catalogue_items` VALUES (1060, 'Pink Spaceship Door', 'There out of this world!', 25, 1, 1, 1, 0.00, 'scifidoor*1', '#ffffff,#ffaaaa,#ffaaaa,#ffaaaa,#ffffff', 62, 1, 1, 1, 1060);
INSERT INTO `catalogue_items` VALUES (1061, 'Yellow Spaceship Door', 'There out of this world!', 25, 1, 1, 1, 0.00, 'scifidoor*2', '#ffffff,#ffee66,#ffee66,#ffee66,#ffffff', 62, 1, 1, 1, 1061);
INSERT INTO `catalogue_items` VALUES (1062, 'Lightblue Spaceship Door', 'There out of this world!', 25, 1, 1, 1, 0.00, 'scifidoor*3', '#ffffff,#aaccff,#aaccff,#aaccff,#ffffff', 62, 1, 1, 1, 1062);
INSERT INTO `catalogue_items` VALUES (1063, 'Emerald Spaceship Door', 'Protect your pot of gold!', 25, 1, 1, 1, 0.00, 'scifidoor*4', '#ffffff,#99dd77,#99dd77,#99dd77,#ffffff', 62, 1, 1, 1, 1063);
INSERT INTO `catalogue_items` VALUES (1064, 'White Spaceship Door', 'There out of this world!', 25, 1, 1, 1, 0.00, 'scifidoor*5', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 62, 1, 1, 1, 1064);
INSERT INTO `catalogue_items` VALUES (1065, 'Black Monolith', 'Monolith goes up! Monolith goes down!', 25, 1, 1, 1, 0.00, 'scifidoor*6', '#ffffff,#333333,#333333,#333333,#ffffff', 62, 1, 1, 1, 1065);
INSERT INTO `catalogue_items` VALUES (1066, 'Aqua Spaceship Door', 'There out of this world!', 25, 1, 1, 1, 0.00, 'scifidoor*7', '#ffffff,#aaffff,#aaffff,#aaffff,#ffffff', 62, 1, 1, 1, 1066);
INSERT INTO `catalogue_items` VALUES (1067, 'Purple Spaceship Door', 'There out of this world!', 25, 1, 1, 1, 0.00, 'scifidoor*8', '#ffffff,#ff99cc,#ff99cc,#ff99cc,#ffffff', 62, 1, 1, 1, 1067);
INSERT INTO `catalogue_items` VALUES (1068, 'Blue Spaceship Door', 'There out of this world!', 25, 1, 1, 1, 0.00, 'scifidoor*9', '#ffffff,#4488ff,#4488ff,#4488ff,#ffffff', 62, 1, 1, 1, 1068);
INSERT INTO `catalogue_items` VALUES (1069, 'Violet Spaceship Door', 'There out of this world!', 25, 1, 1, 1, 0.00, 'scifidoor*10', '#ffffff,#bb99ff,#bb99ff,#bb99ff,#ffffff', 62, 1, 1, 1, 1069);
INSERT INTO `catalogue_items` VALUES (1070, 'White Oriental Screen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*0', '#ffffff,#ffffff,#ffffff,#ffffff,#ffffff,#ffffff', 63, 0, 1, 1, 1070);
INSERT INTO `catalogue_items` VALUES (1071, 'Pink Oriental screen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*1', '#ffffff,#ffffff,#FFA795,#FFA795,#ffffff,#ffffff', 63, 0, 1, 1, 1071);
INSERT INTO `catalogue_items` VALUES (1072, 'RosewoodScreen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*2', '#ffffff,#ffffff,#bb0000,#bb0000,#ffffff,#ffffff', 63, 0, 1, 1, 1072);
INSERT INTO `catalogue_items` VALUES (1073, 'Aqua Oriental Screen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*3', '#ffffff,#ffffff,#79E4B3,#79E4B3,#ffffff,#ffffff', 63, 0, 1, 1, 1073);
INSERT INTO `catalogue_items` VALUES (1074, 'Golden Oriental Screen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*4', '#ffffff,#ffffff,#F7B800,#F7B800,#ffffff,#ffffff', 63, 0, 1, 1, 1074);
INSERT INTO `catalogue_items` VALUES (1075, 'Gray Oriental Screen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*5', '#ffffff,#ffffff,#778B61,#778B61,#ffffff,#ffffff', 63, 0, 1, 1, 1075);
INSERT INTO `catalogue_items` VALUES (1076, 'Blue Oriental Screen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*6', '#ffffff,#ffffff,#72B6D1,#72B6D1,#ffffff,#ffffff', 63, 0, 1, 1, 1076);
INSERT INTO `catalogue_items` VALUES (1077, 'Purple Oriental Screen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*7', '#ffffff,#ffffff,#DA2591,#DA2591,#ffffff,#ffffff', 63, 0, 1, 1, 1077);
INSERT INTO `catalogue_items` VALUES (1078, 'Night Blue Oriental Screen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*8', '#ffffff,#ffffff,#004B5E,#004B5E,#ffffff,#ffffff', 63, 0, 1, 1, 1078);
INSERT INTO `catalogue_items` VALUES (1079, 'Green Oriental Screen', 'Add an exotic touch to your room', 25, 1, 1, 2, 0.00, 'wooden_screen*9', 'ffffff,#ffffff,#A0BE1F,#A0BE1F,#ffffff,#ffffff', 63, 0, 1, 1, 1079);
INSERT INTO `catalogue_items` VALUES (1080, 'Greek Pillar', 'Classy architect, for holding up ceilings!', 25, 1, 1, 1, 3.70, 'pillar*0', '#ffffff,#ffffff,#ffffff', 64, 0, 1, 1, 1080);
INSERT INTO `catalogue_items` VALUES (1081, 'Pink Pillar', 'Classy architect, for holding up ceilings!', 25, 1, 1, 1, 3.70, 'pillar*1', '#ffffff,#FFD0D2,#FFD0D2', 64, 0, 1, 1, 1081);
INSERT INTO `catalogue_items` VALUES (1082, 'Wood Pillar', 'Classy architect, for holding up ceilings!', 25, 1, 1, 1, 3.70, 'pillar*2', '#ffffff,#7B5922,#7B5922', 64, 0, 1, 1, 1082);
INSERT INTO `catalogue_items` VALUES (1083, 'Blue Pillar', 'Ancient and stately', 25, 1, 1, 1, 3.70, 'pillar*3', '#ffffff,#BDCDEA,#BDCDEA', 64, 0, 1, 1, 1083);
INSERT INTO `catalogue_items` VALUES (1084, 'Graphite Pillar', 'Classy architect, for holding up ceilings!', 25, 1, 1, 1, 3.70, 'pillar*4', '#ffffff,#71797C,#71797C', 64, 0, 1, 1, 1084);
INSERT INTO `catalogue_items` VALUES (1085, 'Green Pillar', 'Classy architect, for holding up ceilings!', 25, 1, 1, 1, 3.70, 'pillar*5', '#ffffff,#CEDD65,#CEDD65', 64, 0, 1, 1, 1085);
INSERT INTO `catalogue_items` VALUES (1086, 'Terracotta Pillar', 'Ancient and stately', 25, 1, 1, 1, 3.70, 'pillar*6', '#ffffff,#972e2a,#972e2a', 64, 0, 1, 1, 1086);
INSERT INTO `catalogue_items` VALUES (1087, 'Atlantean Pillar', 'Recovered from Habblantis', 25, 1, 1, 1, 3.70, 'pillar*7', '#ffffff,#e3ca0e,#e3ca0e', 64, 0, 1, 1, 1087);
INSERT INTO `catalogue_items` VALUES (1088, 'Olive Green Pillar', 'Classy architect, for holding up ceilings!', 25, 1, 1, 1, 3.70, 'pillar*8', '#ffffff,#9A924B,#9A924B', 64, 0, 1, 1, 1088);
INSERT INTO `catalogue_items` VALUES (1089, 'Rock Pillar', 'Classy architect, for holding up ceilings!', 25, 1, 1, 1, 3.70, 'pillar*9', '#ffffff,#B2A69D,#B2A69D', 64, 0, 1, 1, 1089);
INSERT INTO `catalogue_items` VALUES (1090, 'White Lace Pillow', 'Minimalist comfort!', 25, 2, 1, 1, 0.80, 'pillow*0', '#ffffff,#ffffff,#ffffff,#ffffff', 65, 0, 1, 1, 1090);
INSERT INTO `catalogue_items` VALUES (1091, 'Pink Fluffy Pillow', 'Puffy, soft and huge', 25, 2, 1, 1, 0.90, 'pillow*1', '#FF8888,#FF8888,#ffffff,#ffffff', 65, 0, 1, 1, 1091);
INSERT INTO `catalogue_items` VALUES (1092, 'Red Silk Pillow', 'Puffy, soft and huge', 25, 2, 1, 1, 0.80, 'pillow*2', '#F00000,#F00000,#ffffff,#ffffff', 65, 0, 1, 1, 1092);
INSERT INTO `catalogue_items` VALUES (1093, 'Turquoise Satin Pillow', 'Puffy, soft and huge', 25, 2, 1, 1, 0.80, 'pillow*3', '#83aeff,#83aeff,#ffffff,#ffffff', 65, 0, 1, 1, 1093);
INSERT INTO `catalogue_items` VALUES (1094, 'Gold Feather Pillow', 'Puffy, soft and huge', 25, 2, 1, 1, 0.80, 'pillow*4', '#FFBD18,#FFBD18,#ffffff,#ffffff', 65, 0, 1, 1, 1094);
INSERT INTO `catalogue_items` VALUES (1095, 'Black Leather Pillow', 'Puffy, soft and huge', 25, 2, 1, 1, 0.80, 'pillow*5', '#494D29,#494D29,#ffffff,#ffffff', 65, 0, 1, 1, 1095);
INSERT INTO `catalogue_items` VALUES (1096, 'Blue Cotton Pillow', 'Puffy, soft and huge', 25, 2, 1, 1, 0.80, 'pillow*6', '#5DAAC9,#5DAAC9,#ffffff,#ffffff', 65, 0, 1, 1, 1096);
INSERT INTO `catalogue_items` VALUES (1097, 'Purple Velvet Pillow', 'Bonnie\'s pillow of choice!', 25, 2, 1, 1, 0.80, 'pillow*7', '#E532CA,#E532CA,#ffffff,#ffffff', 65, 0, 1, 1, 1097);
INSERT INTO `catalogue_items` VALUES (1098, 'Navy Cord Pillow', 'Puffy, soft and huge', 25, 2, 1, 1, 0.80, 'pillow*8', '#214E68,#214E68,#ffffff,#ffffff', 65, 0, 1, 1, 1098);
INSERT INTO `catalogue_items` VALUES (1099, 'Green Wooly Pillow', 'Puffy, soft and VERY fluffy!', 25, 2, 1, 1, 0.80, 'pillow*9', '#B9FF4B,#B9FF4B,#ffffff,#ffffff', 65, 0, 1, 1, 1099);
INSERT INTO `catalogue_items` VALUES (1100, 'Mars Smoke Machine', 'See in 2007 with a bang!', 25, 1, 1, 1, 0.00, 'scifirocket*0', '#ffffff,#ffffff,#dd2d22,#ffffff', 66, 0, 1, 1, 1100);
INSERT INTO `catalogue_items` VALUES (1101, 'Saturn Smoke Machine', 'There is always space for this!', 25, 1, 1, 1, 0.00, 'scifirocket*1', '#ffffff,#ffffff,#f1b000,#ffffff', 66, 0, 1, 1, 1101);
INSERT INTO `catalogue_items` VALUES (1102, 'Earth Smoke Machine', 'A little closer to home!', 25, 1, 1, 1, 0.00, 'scifirocket*2', '#ffffff,#ffffff,#009900,#ffffff', 66, 0, 1, 1, 1102);
INSERT INTO `catalogue_items` VALUES (1103, 'Endor Smoke Machine', 'Caution! Unknown Location!', 25, 1, 1, 1, 0.00, 'scifirocket*3', '#ffffff,#ffffff,#02bb70,#ffffff', 66, 0, 1, 1, 1103);
INSERT INTO `catalogue_items` VALUES (1104, 'Venus Smoke Machine', 'Welcome... to planet love', 25, 1, 1, 1, 0.00, 'scifirocket*4', '#ffffff,#ffffff,#ff5577,#ffffff', 66, 0, 1, 1, 1104);
INSERT INTO `catalogue_items` VALUES (1105, 'Uranus Smoke Machine', 'From the unknown depths of space', 25, 1, 1, 1, 0.00, 'scifirocket*5', '#ffffff,#ffffff,#555555,#ffffff', 66, 0, 1, 1, 1105);
INSERT INTO `catalogue_items` VALUES (1106, 'Mercury Smoke Machine', 'Too hot to handle!', 25, 1, 1, 1, 0.00, 'scifirocket*6', '#ffffff,#ffffff,#ffffff,#ffffff', 66, 0, 1, 1, 1106);
INSERT INTO `catalogue_items` VALUES (1107, 'Jupiter Smoke Machine', 'Larger than life!', 25, 1, 1, 1, 0.00, 'scifirocket*7', '#ffffff,#ffffff,#00cccc,#ffffff', 66, 0, 1, 1, 1107);
INSERT INTO `catalogue_items` VALUES (1108, 'Pluto Smoke Machine', 'From a space far, far away!', 25, 1, 1, 1, 0.00, 'scifirocket*8', '#ffffff,#ffffff,#bb55cc,#ffffff', 66, 0, 1, 1, 1108);
INSERT INTO `catalogue_items` VALUES (1109, 'Neptune Smoke Machine', 'Something fishy is going on...', 25, 1, 1, 1, 0.00, 'scifirocket*9', '#ffffff,#ffffff,#0077FF,#ffffff', 66, 0, 1, 1, 1109);
INSERT INTO `catalogue_items` VALUES (1110, 'Blue Summer Pool', 'Fancy a dip?', 25, 4, 2, 2, 0.00, 'summer_pool*1', '#5EAAF8,#5EAAF8,#5EAAF8,#5EAAF8,#ffffff,#ffffff,#ffffff,#ffffff,#5EAAF8', 67, 0, 1, 1, 1110);
INSERT INTO `catalogue_items` VALUES (1111, 'Red Summer Pool', 'Fancy a dip?', 25, 4, 2, 2, 0.00, 'summer_pool*2', '#E14218,#E14218,#E14218,#E14218,#ffffff,#ffffff,#ffffff,#ffffff,#E14218', 67, 0, 1, 1, 1111);
INSERT INTO `catalogue_items` VALUES (1112, 'Green Summer Pool', 'Fancy a dip?', 25, 4, 2, 2, 0.00, 'summer_pool*3', '#92D13D,#92D13D,#92D13D,#92D13D,#ffffff,#ffffff,#ffffff,#ffffff,#92D13D', 67, 0, 1, 1, 1112);
INSERT INTO `catalogue_items` VALUES (1113, 'Yellow Summer Pool', 'Fancy a dip?', 25, 4, 2, 2, 0.00, 'summer_pool*4', '#FFD837,#FFD837,#FFD837,#FFD837,#ffffff,#ffffff,#ffffff,#ffffff,#FFD837', 67, 0, 1, 1, 1113);
INSERT INTO `catalogue_items` VALUES (1114, 'Habbo Turntable', 'For the retro music-lover', 25, 1, 1, 1, 0.00, 'djesko_turntable', '0,0,0', 68, 0, 1, 1, 1114);
INSERT INTO `catalogue_items` VALUES (1115, 'Holopod', 'As if by magic...', 25, 1, 1, 1, 0.00, 'hologram', '0,0,0', 68, 0, 1, 1, 1115);
INSERT INTO `catalogue_items` VALUES (1116, 'Holo-girl', 'You\'re her only hope...', 25, 1, 1, 1, 0.00, 'redhologram', '0,0,0', 68, 0, 1, 1, 1116);
INSERT INTO `catalogue_items` VALUES (1117, 'Typewriter', 'Write that bestseller', 25, 1, 1, 1, 0.00, 'typingmachine', '0,0,0', 68, 0, 1, 1, 1117);
INSERT INTO `catalogue_items` VALUES (1118, 'Dragon Egg', 'The stuff of legend', 25, 1, 1, 1, 0.00, 'spyro', '0,0,0', 68, 0, 1, 1, 1118);
INSERT INTO `catalogue_items` VALUES (1119, 'Snow Globe', 'It\'s all white..', 25, 1, 1, 1, 0.00, 'rare_globe', '0,0,0', 68, 0, 1, 1, 1119);
INSERT INTO `catalogue_items` VALUES (1120, 'Lappland Greetings', 'Ho Ho Ho!', 25, 2, 2, 1, 0.70, 'rare_xmas_screen', '0,0,0', 68, 0, 1, 1, 1120);
INSERT INTO `catalogue_items` VALUES (1121, 'Holiday Romance', 'Peep through and smile!', 25, 2, 2, 1, 1.10, 'valentinescreen', '0,0,0', 68, 0, 1, 1, 1121);
INSERT INTO `catalogue_items` VALUES (1122, 'Hammock', 'Eco bed', 25, 3, 1, 3, 1.50, 'rare_hammock', '0,0,0', 68, 0, 1, 1, 1122);
INSERT INTO `catalogue_items` VALUES (1123, 'Jamaican Sand Patch', 'Your own paradise island', 25, 4, 2, 2, 0.00, 'sandrug', '0,0,0', 68, 0, 1, 1, 1123);
INSERT INTO `catalogue_items` VALUES (1124, 'Snow Rug', 'Let\'s get sporty!', 25, 4, 2, 2, 0.00, 'rare_snowrug', '0,0,0', 68, 0, 1, 1, 1124);
INSERT INTO `catalogue_items` VALUES (1125, 'Moon Rug', 'Made in 1969', 25, 4, 2, 2, 0.00, 'rare_moonrug', '0,0,0', 68, 0, 1, 1, 1125);
INSERT INTO `catalogue_items` VALUES (1126, 'Petal Patch', 'A little bit of outdoors indoors...', 25, 4, 2, 2, 0.00, 'rare_daffodil_rug', '0,0,0', 68, 0, 1, 1, 1126);
INSERT INTO `catalogue_items` VALUES (1127, 'Aloe Vera', 'Goodbye Bert...', 25, 1, 1, 1, 0.00, 'plant_cruddy', '0,0,0', 68, 0, 1, 1, 1127);
INSERT INTO `catalogue_items` VALUES (1128, 'Man Eating Plant', 'How do you give it water?', 25, 1, 1, 1, 0.00, 'rare_mnstr', '0,0,0', 68, 0, 1, 1, 1128);
INSERT INTO `catalogue_items` VALUES (1129, 'Gold Trophy', 'Gorgeously glittery', 25, 1, 1, 1, 0.00, 'prize1', '0,0,0', 68, 0, 1, 1, 1129);
INSERT INTO `catalogue_items` VALUES (1130, 'Silver Trophy', 'Nice and shiny', 25, 1, 1, 1, 0.00, 'prize2', '0,0,0', 68, 0, 1, 1, 1130);
INSERT INTO `catalogue_items` VALUES (1131, 'Bronse Trophy', 'A weighty award', 25, 1, 1, 1, 0.00, 'prize3', '0,0,0', 68, 0, 1, 1, 1131);
INSERT INTO `catalogue_items` VALUES (1132, 'Blue Amber Lamp', 'A honey-hued glow', 25, 1, 1, 1, 0.00, 'rare_beehive_bulb', '#ffffff,#ffffff,#ffffff,#ffffff,#55c4de,#ffffff', 68, 0, 1, 1, 1132);
INSERT INTO `catalogue_items` VALUES (1133, 'Red Amber Lamp', 'A honey-hued glow', 25, 1, 1, 1, 0.00, 'rare_beehive_bulb*1', '#ffffff,#ffffff,#ffffff,#ffffff,#de5555,#ffffff', 68, 0, 1, 1, 1133);
INSERT INTO `catalogue_items` VALUES (1134, 'Yellow Amber Lamp', 'A honey-hued glow', 25, 1, 1, 1, 0.00, 'rare_beehive_bulb*2', '#ffffff,#ffffff,#ffffff,#ffffff,#ffcc00,#ffffff', 68, 0, 1, 1, 1134);
INSERT INTO `catalogue_items` VALUES (1135, 'Golden Elephant', 'Say hello to Nelly', 25, 1, 1, 1, 0.00, 'rare_elephant_statue', '#ffffff,#ffcc00', 68, 0, 1, 1, 1135);
INSERT INTO `catalogue_items` VALUES (1136, 'Silver Elephant', 'Say hello to Nelly', 25, 1, 1, 1, 0.00, 'rare_elephant_statue*1', '#ffffff,#bfbfbf', 68, 0, 1, 1, 1136);
INSERT INTO `catalogue_items` VALUES (1137, 'Bronze Elephant', 'Say hello to Nelly', 25, 1, 1, 1, 0.00, 'rare_elephant_statue*2', '#ffffff,#cc6600', 68, 0, 1, 1, 1137);
INSERT INTO `catalogue_items` VALUES (1138, 'Bird Bath (red)', 'For our feathered friends', 25, 1, 1, 1, 0.00, 'rare_fountain', '#ffffff,#ffffff,#ef5a5a', 68, 0, 1, 1, 1138);
INSERT INTO `catalogue_items` VALUES (1139, 'Bird Bath (grey)', 'For our feathered friends', 25, 1, 1, 1, 0.00, 'rare_fountain*1', '#ffffff,#ffffff,#ffffff', 68, 0, 1, 1, 1139);
INSERT INTO `catalogue_items` VALUES (1140, 'Bird Bath (green)', 'For our feathered friends', 25, 1, 1, 1, 0.00, 'rare_fountain*2', '#ffffff,#ffffff,#b8cf00', 68, 0, 1, 1, 1140);
INSERT INTO `catalogue_items` VALUES (1141, 'Bird Bath (blue)', 'For our feathered friends', 25, 1, 1, 1, 0.00, 'rare_fountain*3', '#ffffff,#ffffff,#52bdbd', 68, 0, 1, 1, 1141);
INSERT INTO `catalogue_items` VALUES (1142, 'Russian Samovar', 'Click for a refreshing cuppa', 25, 1, 1, 1, 0.00, 'samovar', '0,0,0', 68, 0, 1, 1, 1142);
INSERT INTO `catalogue_items` VALUES (1143, 'Habbo Cola Machine', 'A sparkling and refreshing pixel drink!', 25, 1, 1, 1, 0.00, 'md_limukaappi', '0,0,0', 68, 0, 1, 1, 1143);
INSERT INTO `catalogue_items` VALUES (1144, 'Speaker\'s Corner', 'Stand and Deliver!', 25, 2, 1, 1, 1.80, 'rare_stand', '0,0,0', 68, 0, 1, 1, 1144);
INSERT INTO `catalogue_items` VALUES (1145, 'Infobus', 'The Special Infobus Poster', 15, 0, 0, 0, 0.00, 'poster 2005', '0,0,0', 68, 0, 1, 1, 1145);
INSERT INTO `catalogue_items` VALUES (1146, 'Green Parasol', 'Block those rays!', 25, 1, 1, 1, 0.00, 'rare_parasol*0', '#ffffff,#ffffff,#ffffff,#94f718', 68, 0, 1, 1, 1146);
INSERT INTO `catalogue_items` VALUES (1147, 'Yellow Parasol', 'Block those rays!', 25, 1, 1, 1, 0.00, 'rare_parasol*1', '#ffffff,#ffffff,#ffffff,#ffff11', 68, 0, 1, 1, 1147);
INSERT INTO `catalogue_items` VALUES (1148, 'Orange Parasol', 'Block those rays!', 25, 1, 1, 1, 0.00, 'rare_parasol*2', '#ffffff,#ffffff,#ffffff,#ff8f61', 68, 0, 1, 1, 1148);
INSERT INTO `catalogue_items` VALUES (1149, 'Violet Parasol', 'Block those rays!', 25, 1, 1, 1, 0.00, 'rare_parasol*3', '#ffffff,#ffffff,#ffffff,#d47fff', 68, 0, 1, 1, 1149);
INSERT INTO `catalogue_items` VALUES (1150, 'Sleeping bag', 'Ultimate Coziness', 25, 3, 1, 3, 0.80, 'sleepingbag*1', '#BB5F54,0,#BB5F54,0,#BB5F54', 68, 0, 1, 1, 1150);
INSERT INTO `catalogue_items` VALUES (1151, 'Solarium', 'Rejuvenate your pixels!', 25, 1, 1, 1, 0.00, 'solarium_norja', '0,#E2DAAC', 68, 0, 1, 1, 1151);
INSERT INTO `catalogue_items` VALUES (1152, 'Throne', 'Important Habbos only', 25, 2, 1, 1, 1.00, 'throne', '0,0,0', 68, 0, 1, 1, 1152);
INSERT INTO `catalogue_items` VALUES (1153, 'Habbo trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy7*3', '#ffffff,#ffffff,#996600', 69, 0, 1, 1, 1153);
INSERT INTO `catalogue_items` VALUES (1154, 'Fish trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy4*3', '#ffffff,#ffffff,#996600', 69, 0, 1, 1, 1154);
INSERT INTO `catalogue_items` VALUES (1155, 'Globe trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy3*3', '#ffffff,#ffffff,#996600', 69, 0, 1, 1, 1155);
INSERT INTO `catalogue_items` VALUES (1156, 'Champion trophy', 'Breathtaking bronze', 8, 1, 1, 1, 0.00, 'prizetrophy6*3', '#ffffff,#ffffff,#996600', 69, 0, 1, 1, 1156);
INSERT INTO `catalogue_items` VALUES (1157, 'Fish trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy4*2', '#ffffff,#ffffff,#ffffff', 69, 0, 1, 1, 1157);
INSERT INTO `catalogue_items` VALUES (1158, 'Habbo trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy7*2', '#ffffff,#ffffff,#ffffff', 69, 0, 1, 1, 1158);
INSERT INTO `catalogue_items` VALUES (1159, 'Globe trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy3*2', '#ffffff,#ffffff,#ffffff', 69, 0, 1, 1, 1159);
INSERT INTO `catalogue_items` VALUES (1160, 'Champion trophy', 'Shiny silver', 10, 1, 1, 1, 0.00, 'prizetrophy6*2', '#ffffff,#ffffff,#ffffff', 69, 0, 1, 1, 1160);
INSERT INTO `catalogue_items` VALUES (1161, 'Fish trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy4*1', '#ffffff,#ffffff,#FFDD3F', 69, 0, 1, 1, 1161);
INSERT INTO `catalogue_items` VALUES (1162, 'Globe trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy3*1', '#ffffff,#ffffff,#FFDD3F', 69, 0, 1, 1, 1162);
INSERT INTO `catalogue_items` VALUES (1163, 'Habbo trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy7*1', '#ffffff,#ffffff,#FFDD3F', 69, 0, 1, 1, 1163);
INSERT INTO `catalogue_items` VALUES (1164, 'Champion trophy', 'Glittery gold', 12, 1, 1, 1, 0.00, 'prizetrophy6*1', '#ffffff,#ffffff,#FFDD3F', 69, 0, 1, 1, 1164);
INSERT INTO `catalogue_items` VALUES (1165, 'Noob Chair', 'Noob Chair', 3, 2, 1, 1, 1.00, 'noob_chair', '#FFFFFF,#EFE853,#EFE853,#FFFFFF,#EFE853,#EFE853', 70, 0, 1, 1, 1165);
INSERT INTO `catalogue_items` VALUES (1166, 'Noob Chair', 'Noob Chair', 3, 2, 1, 1, 1.00, 'noob_chair', '#FFFFFF,#4C526E,#8D92AB,#FFFFFF,#8D92AB,#4C526E', 70, 0, 1, 1, 1166);
INSERT INTO `catalogue_items` VALUES (1167, 'Noob Chair', 'Noob Chair', 3, 2, 1, 1, 1.00, 'noob_chair', '#FFFFFF,#985A47,#D9AD90,#FFFFFF,#D9AD90,#985A47', 70, 0, 1, 1, 1167);
INSERT INTO `catalogue_items` VALUES (1168, 'Noob Chair', 'Noob Chair', 3, 2, 1, 1, 1.00, 'noob_chair', '#FFFFFF,#80B1BC,#DAF4FA,#FFFFFF,#DAF4FA,#80B1BC', 70, 0, 1, 1, 1168);
INSERT INTO `catalogue_items` VALUES (1169, 'Noob Chair', 'Noob Chair', 3, 2, 1, 1, 1.00, 'noob_chair', '#FFFFFF,#F6C0C0,#F6C0C0,#FFFFFF,#F6C0C0,#F6C0C0', 70, 0, 1, 1, 1169);
INSERT INTO `catalogue_items` VALUES (1170, 'Noob Chair', 'Noob Chair', 3, 2, 1, 1, 1.00, 'noob_chair', '#FFFFFF,#FFD923,#B1B400,#FFFFFF,#B1B400,#FFD923', 70, 0, 1, 1, 1170);
INSERT INTO `catalogue_items` VALUES (1171, 'Noob Lamp', 'Noob Lamp', 3, 1, 1, 1, 0.00, 'noob_lamp', '#EFE853,#FFFFFF,#FFFFFF', 70, 0, 1, 1, 1171);
INSERT INTO `catalogue_items` VALUES (1172, 'Noob Lamp', 'Noob Lamp', 3, 1, 1, 1, 0.00, 'noob_lamp', '#4C526E,#FFFFFF,#FFFFFF', 70, 0, 1, 1, 1172);
INSERT INTO `catalogue_items` VALUES (1173, 'Noob Lamp', 'Noob Lamp', 3, 1, 1, 1, 0.00, 'noob_lamp', '#D9AD90,#FFFFFF,#FFFFFF', 70, 0, 1, 1, 1173);
INSERT INTO `catalogue_items` VALUES (1174, 'Noob Lamp', 'Noob Lamp', 3, 1, 1, 1, 0.00, 'noob_lamp', '#94CBD7,#FFFFFF,#FFFFFF', 70, 0, 1, 1, 1174);
INSERT INTO `catalogue_items` VALUES (1175, 'Noob Lamp', 'Noob Lamp', 3, 1, 1, 1, 0.00, 'noob_lamp', '#F5779F,#FFFFFF,#FFFFFF', 70, 0, 1, 1, 1175);
INSERT INTO `catalogue_items` VALUES (1176, 'Noob Lamp', 'Noob Lamp', 3, 1, 1, 1, 0.00, 'noob_lamp', '#FFD406,#FFFFFF,#FFFFFF', 70, 0, 1, 1, 1176);
INSERT INTO `catalogue_items` VALUES (1177, 'Noob Rug', 'Noob Rug', 3, 4, 2, 3, 0.00, 'noob_rug', '#FC9C45,#F4EC36', 70, 0, 1, 1, 1177);
INSERT INTO `catalogue_items` VALUES (1178, 'Noob Rug', 'Noob Rug', 3, 4, 2, 3, 0.00, 'noob_rug', '#4C526E,#8D92AB', 70, 0, 1, 1, 1178);
INSERT INTO `catalogue_items` VALUES (1179, 'Noob Rug', 'Noob Rug', 3, 4, 2, 3, 0.00, 'noob_rug', '#985A47,#D9AD90', 70, 0, 1, 1, 1179);
INSERT INTO `catalogue_items` VALUES (1180, 'Noob Rug', 'Noob Rug', 3, 4, 2, 3, 0.00, 'noob_rug', '#94CBD7,#DAF4FA', 70, 0, 1, 1, 1180);
INSERT INTO `catalogue_items` VALUES (1181, 'Noob Rug', 'Noob Rug', 3, 4, 2, 3, 0.00, 'noob_rug', '#F5779F,#F6C0C0', 70, 0, 1, 1, 1181);
INSERT INTO `catalogue_items` VALUES (1182, 'Noob Rug', 'Noob Rug', 3, 4, 2, 3, 0.00, 'noob_rug', '#B1B400,#FFD406', 70, 0, 1, 1, 1182);
INSERT INTO `catalogue_items` VALUES (1183, 'Noob Stool', 'Noob Stool', 3, 2, 1, 1, 1.20, 'noob_stool', '#FFFFFF,#F38420', 70, 0, 1, 1, 1183);
INSERT INTO `catalogue_items` VALUES (1184, 'Noob Stool', 'Noob Stool', 3, 2, 1, 1, 1.20, 'noob_stool', '#FFFFFF,#4C526E', 70, 0, 1, 1, 1184);
INSERT INTO `catalogue_items` VALUES (1185, 'Noob Stool', 'Noob Stool', 3, 2, 1, 1, 1.20, 'noob_stool', '#FFFFFF,#985A47', 70, 0, 1, 1, 1185);
INSERT INTO `catalogue_items` VALUES (1186, 'Noob Stool', 'Noob Stool', 3, 2, 1, 1, 1.20, 'noob_stool', '#FFFFFF,#94CBD7', 70, 0, 1, 1, 1186);
INSERT INTO `catalogue_items` VALUES (1187, 'Noob Stool', 'Noob Stool', 3, 2, 1, 1, 1.20, 'noob_stool', '#FFFFFF,#F5779F', 70, 0, 1, 1, 1187);
INSERT INTO `catalogue_items` VALUES (1188, 'Noob Stool', 'Noob Stool', 3, 2, 1, 1, 1.20, 'noob_stool', '#FFFFFF,#B1B400', 70, 0, 1, 1, 1188);
INSERT INTO `catalogue_items` VALUES (1189, 'Noob Table', 'Noob Table', 3, 1, 2, 2, 1.00, 'noob_table', '#FFFFFF,#F1E93A,#F38420', 70, 0, 1, 1, 1189);
INSERT INTO `catalogue_items` VALUES (1190, 'Noob Table', 'Noob Table', 3, 1, 2, 2, 1.00, 'noob_table', '#FFFFFF,#A5A9BC,#4C526E', 70, 0, 1, 1, 1190);
INSERT INTO `catalogue_items` VALUES (1191, 'Noob Table', 'Noob Table', 3, 1, 2, 2, 1.00, 'noob_table', '#FFFFFF,#D9AD90,#985A47', 70, 0, 1, 1, 1191);
INSERT INTO `catalogue_items` VALUES (1192, 'Noob Table', 'Noob Table', 3, 1, 2, 2, 1.00, 'noob_table', '#FFFFFF,#DAF4FA,#94CBD7', 70, 0, 1, 1, 1192);
INSERT INTO `catalogue_items` VALUES (1193, 'Noob Table', 'Noob Table', 3, 1, 2, 2, 1.00, 'noob_table', '#FFFFFF,#F6C0C0,#F5779F', 70, 0, 1, 1, 1193);
INSERT INTO `catalogue_items` VALUES (1194, 'Noob Table', 'Noob Table', 3, 1, 2, 2, 1.00, 'noob_table', '#FFFFFF,#FFD406,#B1B400', 70, 0, 1, 1, 1194);
INSERT INTO `catalogue_items` VALUES (1195, 'Welcome Mat', 'Welcome, enjoy your stay!', 3, 4, 1, 1, 0.00, 'carpet_soft_tut', '0,0,0', 70, 0, 1, 1, 1195);
INSERT INTO `catalogue_items` VALUES (1196, 'Room with a view', 'Room with a view', 5, 0, 0, 0, 0.00, 'noob_window_double', '0,0,0', 71, 0, 1, 1, 1196);
INSERT INTO `catalogue_items` VALUES (1197, 'Small 70s Window', 'A view of the past', 5, 0, 0, 0, 0.00, 'window_70s_narrow', '0,0,0', 71, 0, 1, 1, 1197);
INSERT INTO `catalogue_items` VALUES (1198, 'Large 70s Window', 'A view of the past', 5, 0, 0, 0, 0.00, 'window_70s_wide', '0,0,0', 71, 0, 1, 1, 1198);
INSERT INTO `catalogue_items` VALUES (1199, 'Plain and simple', 'Plain and simple', 5, 0, 0, 0, 0.00, 'window_basic', '0,0,0', 71, 0, 1, 1, 1199);
INSERT INTO `catalogue_items` VALUES (1200, 'Small Oriental Window', 'Small Oriental Window', 5, 0, 0, 0, 0.00, 'window_chinese_narrow', '0,0,0', 71, 0, 1, 1, 1200);
INSERT INTO `catalogue_items` VALUES (1201, 'Large Oriental Window', 'Dreaming of a Chinese summer', 5, 0, 0, 0, 0.00, 'window_chinese_wide', '0,0,0', 71, 0, 1, 1, 1201);
INSERT INTO `catalogue_items` VALUES (1202, 'Double Window', 'Double Window', 5, 0, 0, 0, 0.00, 'window_double_default', '0,0,0', 71, 0, 1, 1, 1202);
INSERT INTO `catalogue_items` VALUES (1203, 'Golden Window', 'Golden Window', 5, 0, 0, 0, 0.00, 'window_golden', '0,0,0', 71, 0, 1, 1, 1203);
INSERT INTO `catalogue_items` VALUES (1204, 'Don\'t get too close!', 'Don\'t get too close!', 5, 0, 0, 0, 0.00, 'window_grunge', '0,0,0', 71, 0, 1, 1, 1204);
INSERT INTO `catalogue_items` VALUES (1205, 'Small Romantic Window', 'Small Romantic Window', 5, 0, 0, 0, 0.00, 'window_romantic_narrow', '0,0,0', 71, 0, 1, 1, 1205);
INSERT INTO `catalogue_items` VALUES (1206, 'Large Romantic Window', 'Heavenly scent of flowers', 5, 0, 0, 0, 0.00, 'window_romantic_wide', '0,0,0', 71, 0, 1, 1, 1206);
INSERT INTO `catalogue_items` VALUES (1207, 'Single Window', 'A simple view', 5, 0, 0, 0, 0.00, 'window_single_default', '0,0,0', 71, 0, 1, 1, 1207);
INSERT INTO `catalogue_items` VALUES (1208, 'Square Window', 'Square Window', 5, 0, 0, 0, 0.00, 'window_square', '0,0,0', 71, 0, 1, 1, 1208);
INSERT INTO `catalogue_items` VALUES (1209, 'Triple Window', 'Triple Window', 5, 0, 0, 0, 0.00, 'window_triple', '0,0,0', 71, 0, 1, 1, 1209);
INSERT INTO `catalogue_items` VALUES (1210, 'Xmas Light', 'Xmas Light', 3, 0, 0, 0, 0.00, 'xmas_light', '0,0,0', 72, 0, 1, 1, 1210);
INSERT INTO `catalogue_items` VALUES (1211, 'Reindeer Droppings', 'Bob\'s magical fertilizer', 3, 4, 1, 1, 0.00, 'christmas_poop', '0,0,0', 72, 0, 1, 1, 1211);
INSERT INTO `catalogue_items` VALUES (1212, 'Reindeer', 'Prancer becomes Rudolph in a click!', 25, 2, 1, 2, 2.00, 'christmas_reindeer', '0,0,0', 72, 0, 1, 1, 1212);
INSERT INTO `catalogue_items` VALUES (1213, 'Winter Sleigh', 'Ready for your Xmas cheer', 25, 2, 2, 2, 1.00, 'christmas_sleigh', '0,0,0', 72, 0, 1, 1, 1213);
INSERT INTO `catalogue_items` VALUES (1214, 'Flashy Christmas Tree', 'The future\'s bright!', 5, 1, 1, 1, 0.00, 'tree6', '0,0,0', 72, 0, 1, 1, 1214);
INSERT INTO `catalogue_items` VALUES (1215, 'Snowy Christmas Tree', 'Walking in a winter wonderland!', 5, 1, 1, 1, 0.00, 'tree7', '0,0,0', 72, 0, 1, 1, 1215);
INSERT INTO `catalogue_items` VALUES (1216, 'Ice Castle Gate', 'Let that icy draft out!', 5, 1, 2, 1, 0.00, 'xmas_cstl_gate', '0,0,0', 72, 1, 1, 1, 1216);
INSERT INTO `catalogue_items` VALUES (1217, 'Ice Castle Tower', 'All I see from up here is snow!', 5, 1, 1, 1, 3.50, 'xmas_cstl_twr', '0,0,0', 72, 0, 1, 1, 1217);
INSERT INTO `catalogue_items` VALUES (1218, 'Ice Castle Wall', 'Solid blocks of ice and snow', 5, 1, 2, 1, 3.00, 'xmas_cstl_wall', '0,0,0', 72, 0, 1, 1, 1218);
INSERT INTO `catalogue_items` VALUES (1219, 'Lantern Bundle 2', '20 lanterns for the price of 6!', 5, 1, 1, 1, 1.00, 'xmas_icelamp', '0,0,0', 72, 0, 1, 1, 1219);
INSERT INTO `catalogue_items` VALUES (1220, 'Snowy Maze Bundle 2', '20 x Snowy Maze Shrubbery', 5, 1, 2, 1, 0.00, 'plant_maze_snow', '0,0,0', 72, 0, 1, 1, 1220);
INSERT INTO `catalogue_items` VALUES (1221, 'Snowy Maze Gate', 'There\'s snow way through!', 5, 1, 2, 1, 0.00, 'plant_mazegate_snow', '0,0,0', 72, 1, 1, 1, 1221);
INSERT INTO `catalogue_items` VALUES (1222, '', '', 5, 1, 1, 1, 0.00, 'safe_silo_pb', '0,0,0', 72, 0, 1, 1, 1222);
INSERT INTO `catalogue_items` VALUES (1223, 'Executive Bar Desk', 'Divide the profits!', 5, 1, 1, 1, 1.00, 'exe_bardesk', '0,0,0', 72, 0, 1, 1, 1223);
INSERT INTO `catalogue_items` VALUES (1224, 'Executive Corner Desk', 'Tuck it away', 5, 1, 1, 1, 1.00, 'exe_corner', '0,0,0', 72, 0, 1, 1, 1224);
INSERT INTO `catalogue_items` VALUES (1225, 'Executive Sofa Chair', 'Relaxing leather comfort', 5, 2, 1, 1, 1.00, 'exe_chair', '0,0,0', 72, 0, 1, 1, 1225);
INSERT INTO `catalogue_items` VALUES (1226, 'Executive Boss Chair', 'You\'re fired!', 5, 2, 1, 1, 1.00, 'exe_chair2', '0,0,0', 72, 0, 1, 1, 1226);
INSERT INTO `catalogue_items` VALUES (1227, 'Executive Drinks Tray', 'Give a warm welcome', 5, 1, 1, 1, 0.00, 'exe_drinks', '0,0,0', 72, 0, 1, 1, 1227);
INSERT INTO `catalogue_items` VALUES (1228, 'Executive 3-Seater Sofa', 'Relaxing leather comfort', 5, 2, 3, 1, 1.00, 'exe_sofa', '0,0,0', 72, 0, 1, 1, 1228);
INSERT INTO `catalogue_items` VALUES (1229, 'Executive Desk', 'Take a memo, Featherstone', 5, 1, 3, 2, 0.00, 'exe_table', '0,0,0', 72, 0, 1, 1, 1229);
INSERT INTO `catalogue_items` VALUES (1230, 'Disco Rug', 'Wow', 5, 4, 3, 3, 0.00, 'exe_rug', '0,0,0', 72, 0, 1, 1, 1230);
INSERT INTO `catalogue_items` VALUES (1231, 'Light up Table', 'Turn on the light!', 4, 1, 2, 2, 0.80, 'exe_s_table', '0,0,0', 72, 0, 1, 1, 1231);
INSERT INTO `catalogue_items` VALUES (1232, 'Power Globe', 'The power is yours!', 3, 1, 1, 1, 0.00, 'exe_globe', '0,0,0', 72, 0, 1, 1, 1232);
INSERT INTO `catalogue_items` VALUES (1233, 'Executive Plant', 'Exe Plant', 3, 1, 1, 1, 0.00, 'exe_plant', '0,0,0', 72, 0, 1, 1, 1233);
INSERT INTO `catalogue_items` VALUES (1234, 'Crystal Ball', 'Gaze into the future', 3, 1, 1, 1, 0.00, 'fortune', '0,0,0', 72, 0, 1, 1, 1234);
INSERT INTO `catalogue_items` VALUES (1235, 'Heart Shaped Box', 'One for them. Two for me!', 3, 1, 1, 1, 0.00, 'val_choco', '0,0,0', 72, 0, 1, 1, 1235);
INSERT INTO `catalogue_items` VALUES (1236, 'Love Randomiser', 'Surprise surprise! (Cilla Black not included)', 3, 2, 4, 1, 1.00, 'val_randomizer', '0,0,0', 72, 0, 1, 1, 1236);
INSERT INTO `catalogue_items` VALUES (1237, 'Porthole', 'Brighten up your cabin', 3, 0, 0, 0, 0.00, 'hrella_poster_1', '0,0,0', 72, 0, 1, 1, 1237);
INSERT INTO `catalogue_items` VALUES (1238, 'Life Buoy', 'For those scary Lido moments', 3, 0, 0, 0, 0.00, 'hrella_poster_2', '0,0,0', 72, 0, 1, 1, 1238);
INSERT INTO `catalogue_items` VALUES (1239, 'Anchor', 'Don\'t drift away!', 3, 0, 0, 0, 0.00, 'hrella_poster_3', '0,0,0', 72, 0, 1, 1, 1239);
INSERT INTO `catalogue_items` VALUES (1240, 'Grey Share Bear', 'The grey bear of affection', 3, 2, 1, 1, 0.90, 'val_teddy*1', '0,0,0', 72, 0, 1, 1, 1240);
INSERT INTO `catalogue_items` VALUES (1241, 'Pink Share Bear', 'The pink bear of passion', 3, 2, 1, 1, 0.90, 'val_teddy*2', '#EE7EA4,#FFFFFF,#EE7EA4,#EE7EA4,#FFFFFF', 72, 0, 1, 1, 1241);
INSERT INTO `catalogue_items` VALUES (1242, 'Green Share Bear', 'The green bear of friendship', 3, 2, 1, 1, 0.90, 'val_teddy*3', '0,0,0', 72, 0, 1, 1, 1242);
INSERT INTO `catalogue_items` VALUES (1243, 'Brown Share Bear', 'The brown bear of naughtiness', 3, 2, 1, 1, 0.90, 'val_teddy*4', '#965014,#FFFFFF,#965014,#965014,#FFFFFF', 72, 0, 1, 1, 1243);
INSERT INTO `catalogue_items` VALUES (1244, 'Yellow Share Bear', 'The yellow bear of understanding', 3, 2, 1, 1, 0.90, 'val_teddy*5', '0,0,0', 72, 0, 1, 1, 1244);
INSERT INTO `catalogue_items` VALUES (1245, 'Blue Share Bear', 'The blue bear of happiness', 3, 2, 1, 1, 0.90, 'val_teddy*6', '#ABD0D2,#FFFFFF,#ABD0D2,#ABD0D2,#FFFFFF', 72, 0, 1, 1, 1245);
INSERT INTO `catalogue_items` VALUES (1246, 'Sand Gate', 'Sand Gate', 5, 1, 2, 1, 0.00, 'sand_cstl_gate', '0,0,0', 72, 1, 1, 1, 1246);
INSERT INTO `catalogue_items` VALUES (1247, 'Sand Tower', 'Sand Tower', 5, 1, 1, 1, 3.50, 'sand_cstl_twr', '0,0,0', 72, 0, 1, 1, 1247);
INSERT INTO `catalogue_items` VALUES (1248, 'Sand Wall', 'Sand Wall', 5, 1, 2, 1, 3.00, 'sand_cstl_wall', '0,0,0', 72, 0, 1, 1, 1248);
INSERT INTO `catalogue_items` VALUES (1249, 'Aqua Deck Chair', 'Got your swimming trunks?', 5, 2, 1, 1, 1.20, 'summer_chair*1', '#ffffff,#ffffff,#ffffff,#ffffff,#ABD0D2', 72, 0, 1, 1, 1249);
INSERT INTO `catalogue_items` VALUES (1250, 'Deck Chair', 'Pink', 5, 2, 1, 1, 1.20, 'summer_chair*2', '#ffffff,#ffffff,#ffffff,#ffffff,#FF99BC', 72, 0, 1, 1, 1250);
INSERT INTO `catalogue_items` VALUES (1251, 'Deck Chair', 'Black', 5, 2, 1, 1, 1.20, 'summer_chair*3', '#ffffff,#ffffff,#ffffff,#ffffff,#525252', 72, 0, 1, 1, 1251);
INSERT INTO `catalogue_items` VALUES (1252, 'Deck Chair', 'White', 5, 2, 1, 1, 1.20, 'summer_chair*4', '#ffffff,#ffffff,#ffffff,#FFFFFF,#ffffff', 72, 0, 1, 1, 1252);
INSERT INTO `catalogue_items` VALUES (1253, 'Deck Chair', 'Beige', 5, 2, 1, 1, 1.20, 'summer_chair*5', '#ffffff,#ffffff,#ffffff,#ffffff,#F7EBBC', 72, 0, 1, 1, 1253);
INSERT INTO `catalogue_items` VALUES (1254, 'Deck Chair', 'Blue', 5, 2, 1, 1, 1.20, 'summer_chair*6', '#ffffff,#ffffff,#ffffff,#ffffff,#5EAAF8', 72, 0, 1, 1, 1254);
INSERT INTO `catalogue_items` VALUES (1255, 'Green Deck Chair', 'Reserved!', 5, 2, 1, 1, 1.20, 'summer_chair*7', '#ffffff,#ffffff,#ffffff,#ffffff,#92D13D', 72, 0, 1, 1, 1255);
INSERT INTO `catalogue_items` VALUES (1256, 'Yellow Deck Chair', 'Got your sun cream?', 5, 2, 1, 1, 1.20, 'summer_chair*8', '#ffffff,#ffffff,#ffffff,#ffffff,#FFD837', 72, 0, 1, 1, 1256);
INSERT INTO `catalogue_items` VALUES (1257, 'Red Deck Chair', 'Got your sunglasses?', 5, 2, 1, 1, 1.20, 'summer_chair*9', '#ffffff,#ffffff,#ffffff,#ffffff,#E14218', 72, 0, 1, 1, 1257);
INSERT INTO `catalogue_items` VALUES (1258, 'Blue Barbeque Grill', 'Plenty of ribs on that barbie', 10, 2, 2, 1, 0.00, 'summer_grill*1', '#ffffff,#5EAAF8,#ffffff,#ffffff,#5EAAF8,#5EAAF8,#5EAAF8', 72, 0, 1, 1, 1258);
INSERT INTO `catalogue_items` VALUES (1259, 'Red Barbeque Grill', 'Plenty of shrimp on that barbie', 10, 2, 2, 1, 0.00, 'summer_grill*2', '#ffffff,#E14218,#ffffff,#ffffff,#E14218,#E14218,#E14218', 72, 0, 1, 1, 1259);
INSERT INTO `catalogue_items` VALUES (1260, 'Yellow Barbeque Grill', 'Plenty of steak on that barbie', 10, 2, 2, 1, 0.00, 'summer_grill*3', '#ffffff,#92D13D,#ffffff,#ffffff,#92D13D,#92D13D,#92D13D', 72, 0, 1, 1, 1260);
INSERT INTO `catalogue_items` VALUES (1261, 'Green Barbeque Grill', 'Plenty of burgers on that barbie', 10, 2, 2, 1, 0.00, 'summer_grill*4', '#ffffff,#FFD837,#ffffff,#ffffff,#FFD837,#FFD837,#FFD837', 72, 0, 1, 1, 1261);
INSERT INTO `catalogue_items` VALUES (1262, 'Adventure Desk', 'Where will you go today?', 10, 1, 1, 2, 0.00, 'sw_table', '0,0,0', 2, 0, 1, 1, 1262);
INSERT INTO `catalogue_items` VALUES (1263, 'Swords', 'The other kind of fencing...', 3, 0, 0, 0, 0.00, 'sw_swords', '0,0,0', 2, 0, 1, 1, 1263);
INSERT INTO `catalogue_items` VALUES (1264, 'Mysterious Necklace', 'Why does the stone glow at night?', 3, 0, 0, 0, 0.00, 'sw_stone', '0,0,0', 2, 0, 1, 1, 1264);
INSERT INTO `catalogue_items` VALUES (1265, 'Raven', 'Lurking... with intent', 8, 1, 1, 1, 1.00, 'sw_raven', '0,0,0', 2, 0, 1, 1, 1265);
INSERT INTO `catalogue_items` VALUES (1266, 'Ventilation Duct', 'Full of creepy crawlies', 3, 0, 0, 0, 0.00, 'sw_hole', '0,0,0', 2, 0, 1, 1, 1266);
INSERT INTO `catalogue_items` VALUES (1267, 'Chest', 'Chest', 5, 1, 1, 2, 1.00, 'sw_chest', '0,0,0', 2, 0, 1, 1, 1267);
INSERT INTO `catalogue_items` VALUES (1268, 'NAME', 'DESC', 3, 1, 1, 1, 1.00, 'jp_katana1', '0,0,0', 73, 0, 1, 1, 1268);
INSERT INTO `catalogue_items` VALUES (1269, 'NAME', 'DESC', 3, 1, 1, 1, 1.00, 'jp_katana2', '0,0,0', 73, 0, 1, 1, 1269);
INSERT INTO `catalogue_items` VALUES (1270, 'NAME', 'DESC', 3, 1, 1, 1, 1.00, 'jp_katana3', '0,0,0', 73, 0, 1, 1, 1270);
INSERT INTO `catalogue_items` VALUES (1271, 'NAME', 'DESC', 3, 1, 2, 2, 0.80, 'jp_table', '0,0,0', 73, 0, 1, 1, 1271);
INSERT INTO `catalogue_items` VALUES (1272, 'NAME', 'DESC', 3, 4, 2, 2, 0.00, 'jp_rare', '0,0,0', 73, 0, 1, 1, 1272);
INSERT INTO `catalogue_items` VALUES (1273, 'Jukebox Pacha TV', 'Jukebox Pacha TV', 25, 1, 1, 1, 0.00, 'jukebox_ptv*1', '0,0,0', 73, 0, 1, 1, 1273);
INSERT INTO `catalogue_items` VALUES (1274, 'Calippo icecream machine', 'Basic model', 25, 1, 1, 1, 0.00, 'calippo', '0,0,0', 73, 0, 1, 1, 1274);
INSERT INTO `catalogue_items` VALUES (1275, 'Nouvelle', 'Nouvelle Trax', 25, 1, 1, 1, 0.00, 'nouvelle_trax', '0,0,0', 73, 0, 1, 1, 1275);
INSERT INTO `catalogue_items` VALUES (1276, 'Bubble Juice Can', 'Enough bubbling juice for one evening', 3, 0, 0, 0, 0.00, 'md_can', '0,0,0', 73, 0, 1, 1, 1276);
INSERT INTO `catalogue_items` VALUES (1277, 'Bubble Juice Logo', 'Bubble up your wall', 3, 0, 0, 0, 0.00, 'md_logo_wall', '0,0,0', 73, 0, 1, 1, 1277);
INSERT INTO `catalogue_items` VALUES (1278, 'Bubble Juice Floor', 'Bubbles under your steps', 3, 4, 4, 4, 1.00, 'md_rug', '0,0,0', 73, 0, 1, 1, 1278);
INSERT INTO `catalogue_items` VALUES (1279, 'Moon Lamp', 'Light your space', 3, 1, 1, 1, 1.00, 'rclr_lamp', '0,0,0', 73, 0, 1, 1, 1279);
INSERT INTO `catalogue_items` VALUES (1280, 'Sound 53', 'Sound 53', 5, 1, 1, 1, 0.20, 'sound_set_53', '0,0,0', 73, 0, 1, 1, 1280);
INSERT INTO `catalogue_items` VALUES (1281, 'Sound 54', 'Sound 54', 5, 1, 1, 1, 0.20, 'sound_set_54', '0,0,0', 73, 0, 1, 1, 1281);
INSERT INTO `catalogue_items` VALUES (1282, 'jp_teamaker', 'jp_teamaker', 3, 1, 1, 1, 0.00, 'jp_teamaker', '0,0,0', 74, 0, 1, 1, 1282);
INSERT INTO `catalogue_items` VALUES (1283, 'tiki_tray0', 'tiki_tray0', 3, 1, 1, 1, 0.00, 'tiki_tray0', '0,0,0', 74, 0, 1, 1, 1283);
INSERT INTO `catalogue_items` VALUES (1284, 'tiki_tray1', 'tiki_tray1', 3, 1, 1, 1, 0.00, 'tiki_tray1', '0,0,0', 74, 0, 1, 1, 1284);
INSERT INTO `catalogue_items` VALUES (1285, 'tiki_tray2', 'tiki_tray2', 3, 1, 1, 1, 0.00, 'tiki_tray2', '0,0,0', 74, 0, 1, 1, 1285);
INSERT INTO `catalogue_items` VALUES (1286, 'tiki_tray3', 'tiki_tray3', 3, 1, 1, 1, 0.00, 'tiki_tray3', '0,0,0', 74, 0, 1, 1, 1286);
INSERT INTO `catalogue_items` VALUES (1287, 'tiki_tray4', 'tiki_tray4', 3, 1, 1, 1, 0.00, 'tiki_tray4', '0,0,0', 74, 0, 1, 1, 1287);
INSERT INTO `catalogue_items` VALUES (1288, 'stater furni', 'for noobs', 3, 1, 1, 1, 0.00, 'noob_plant', '0,0,0', 74, 0, 1, 1, 1288);
INSERT INTO `catalogue_items` VALUES (1289, 'tampax_wall', 'tampax_wall', 3, 0, 0, 0, 0.00, 'tampax_wall', '0,0,0', 73, 0, 1, 1, 1289);
INSERT INTO `catalogue_items` VALUES (1290, 'tampax_rug', 'tampax_rug', 3, 4, 3, 4, 0.00, 'tampax_rug', '0,0,0', 73, 0, 1, 1, 1290);
INSERT INTO `catalogue_items` VALUES (1291, 'tiki_wallplnt', 'tiki_wallplnt', 3, 0, 3, 3, 0.00, 'tiki_wallplnt', '0,0,0', 74, 0, 1, 1, 1291);
INSERT INTO `catalogue_items` VALUES (1292, 'tiki_bardesk', 'tiki_bardesk', 3, 1, 1, 1, 1.00, 'tiki_bardesk', '0,0,0', 74, 0, 1, 1, 1292);
INSERT INTO `catalogue_items` VALUES (1293, 'tiki_bench', 'tiki_bench', 3, 2, 1, 1, 1.00, 'tiki_bench', '0,0,0', 74, 0, 1, 1, 1293);
INSERT INTO `catalogue_items` VALUES (1294, 'tiki_bflies', 'tiki_bflies', 3, 4, 1, 1, 0.00, 'tiki_bflies', '0,0,0', 74, 0, 1, 1, 1294);
INSERT INTO `catalogue_items` VALUES (1295, 'tiki_junglerug', 'tiki_junglerug', 3, 4, 2, 2, 0.00, 'tiki_junglerug', '0,0,0', 74, 0, 1, 1, 1295);
INSERT INTO `catalogue_items` VALUES (1296, 'tiki_parasol', 'tiki_parasol', 3, 1, 1, 1, 0.00, 'tiki_parasol', '0,0,0', 74, 0, 1, 1, 1296);
INSERT INTO `catalogue_items` VALUES (1297, 'tiki_sand', 'tiki_sand', 3, 4, 2, 2, 0.00, 'tiki_sand', '0,0,0', 74, 0, 1, 1, 1297);
INSERT INTO `catalogue_items` VALUES (1298, 'tiki_statue', 'tiki_statue', 3, 1, 1, 1, 0.00, 'tiki_statue', '0,0,0', 74, 0, 1, 1, 1298);
INSERT INTO `catalogue_items` VALUES (1299, 'tiki_torch', 'tiki_torch', 3, 1, 1, 1, 0.00, 'tiki_torch', '0,0,0', 74, 0, 1, 1, 1299);
INSERT INTO `catalogue_items` VALUES (1300, 'tiki_toucan', 'tiki_toucan', 3, 1, 1, 1, 0.00, 'tiki_toucan', '0,0,0', 74, 0, 1, 1, 1300);
INSERT INTO `catalogue_items` VALUES (1301, 'tiki_waterfall', 'tiki_waterfall', 3, 1, 3, 2, 0.00, 'tiki_waterfall', '0,0,0', 74, 0, 1, 1, 1301);
INSERT INTO `catalogue_items` VALUES (1302, 'tiki_surfboard', 'tiki_surfboard', 3, 0, 1, 1, 0.00, 'tiki_surfboard', '0,0,0', 74, 0, 1, 1, 1302);
INSERT INTO `catalogue_items` VALUES (1303, 'tiki_cornor', 'tiki_corner', 3, 1, 1, 1, 1.00, 'tiki_corner', '0,0,0', 74, 0, 1, 1, 1303);
INSERT INTO `catalogue_items` VALUES (1329, 'diner_shaker', 'diner_shaker', 15, 1, 1, 1, 0.00, 'diner_shaker', '0,0,0', 78, 0, 0, 0, 1329);
INSERT INTO `catalogue_items` VALUES (1330, 'diner_gumvendor', 'diner_gumvendor', 15, 1, 1, 1, 0.00, 'diner_gumvendor', '0,0,0', 78, 0, 1, 0, 1330);
INSERT INTO `catalogue_items` VALUES (1331, 'diner_sofa_2', 'diner_sofa_2', 15, 2, 1, 1, 1.20, 'diner_sofa_2', '0,0,0', 78, 0, 1, 1, 1331);
INSERT INTO `catalogue_items` VALUES (1332, 'diner_rug', 'diner_rug', 15, 4, 2, 2, 0.00, 'diner_rug', '0,0,0', 78, 0, 1, 1, 1332);
INSERT INTO `catalogue_items` VALUES (1333, 'svnr_de', 'svnr_de', 15, 1, 1, 1, 0.00, 'svnr_de', '0,0,0', 73, 0, 1, 1, 1333);
INSERT INTO `catalogue_items` VALUES (1334, 'svnr_uk', 'svnr_uk', 15, 1, 1, 1, 0.00, 'svnr_uk', '0,0,0', 73, 0, 1, 1, 1334);
INSERT INTO `catalogue_items` VALUES (1335, 'svnr_it', 'svnr_it', 15, 2, 2, 1, 1.20, 'svnr_it', '0,0,0', 73, 0, 1, 1, 1335);
INSERT INTO `catalogue_items` VALUES (1336, 'svnr_nl', 'svnr_nl', 15, 1, 1, 2, 0.00, 'svnr_nl', '0,0,0', 73, 0, 1, 1, 1336);
INSERT INTO `catalogue_items` VALUES (1337, 'diner_tray_0', 'diner_tray_0', 5, 1, 1, 1, 0.00, 'diner_tray_0', '0,0,0', 78, 0, 1, 1, 1337);
INSERT INTO `catalogue_items` VALUES (1338, 'diner_tray_1', 'diner_tray_1', 5, 1, 1, 1, 0.00, 'diner_tray_1', '0,0,0', 78, 0, 1, 1, 1338);
INSERT INTO `catalogue_items` VALUES (1339, 'diner_tray_2', 'diner_tray_2', 5, 1, 1, 1, 0.00, 'diner_tray_2', '0,0,0', 78, 0, 1, 1, 1339);
INSERT INTO `catalogue_items` VALUES (1340, 'diner_tray_3', 'diner_tray_3', 5, 1, 1, 1, 0.00, 'diner_tray_3', '0,0,0', 78, 0, 1, 1, 1340);
INSERT INTO `catalogue_items` VALUES (1341, 'diner_tray_4', 'diner_tray_4', 5, 1, 1, 1, 0.00, 'diner_tray_4', '0,0,0', 78, 0, 1, 1, 1341);
INSERT INTO `catalogue_items` VALUES (1342, 'diner_tray_4', 'diner_tray_5', 5, 1, 1, 1, 0.00, 'diner_tray_5', '0,0,0', 78, 0, 1, 1, 1342);
INSERT INTO `catalogue_items` VALUES (1343, 'diner_tray_5', 'diner_tray_6', 5, 1, 1, 1, 0.00, 'diner_tray_6', '0,0,0', 78, 0, 1, 1, 1343);
INSERT INTO `catalogue_items` VALUES (1344, 'diner_tray_6', 'diner_tray_7', 5, 1, 1, 1, 0.00, 'diner_tray_7', '0,0,0', 78, 0, 1, 1, 1344);
INSERT INTO `catalogue_items` VALUES (1346, 'ads_sunnyd', 'ads_sunnyd', 5, 0, 1, 1, 0.00, 'ads_sunnyd', '0,0,0', 73, 0, 1, 1, 1345);
INSERT INTO `catalogue_items` VALUES (1349, 'sound_set_67', 'sound_set_67', 5, 1, 1, 1, 0.20, 'sound_set_67', '0,0,0', 42, 0, 1, 1, 1349);
INSERT INTO `catalogue_items` VALUES (1354, 'sound_set_66', 'sound_set_66', 5, 1, 1, 1, 0.20, 'sound_set_66', '0,0,0', 42, 0, 1, 1, 1354);
INSERT INTO `catalogue_items` VALUES (1360, 'svnr_aus', 'svnr_aus', 5, 1, 1, 1, 0.00, 'svnr_aus', '0,0,0', 73, 0, 1, 1, 1360);
INSERT INTO `catalogue_items` VALUES (1348, 'sound_set_65', 'sound_set_65', 5, 1, 1, 1, 0.20, 'sound_set_65', '0,0,0', 42, 0, 1, 1, 1349);
INSERT INTO `catalogue_items` VALUES (1351, 'sound_set_68', 'sound_set_68', 5, 1, 1, 1, 0.20, 'sound_set_68', '0,0,0', 42, 0, 1, 1, 1351);
INSERT INTO `catalogue_items` VALUES (1352, 'sound_set_69', 'sound_set_69', 5, 1, 1, 1, 0.20, 'sound_set_69', '0,0,0', 42, 0, 1, 1, 1352);
INSERT INTO `catalogue_items` VALUES (1353, 'sound_set_70', 'sound_set_70', 5, 1, 1, 1, 0.20, 'sound_set_70', '0,0,0', 42, 0, 1, 1, 1353);
INSERT INTO `catalogue_items` VALUES (1355, 'song disk', 'song disk', 1, 1, 1, 1, 0.20, 'song_disk', '0,0,0', -1, 0, 1, 1, 1355);
INSERT INTO `catalogue_items` VALUES (1356, 'diner_table_1', 'diner_table_1', 5, 1, 2, 2, 0.00, 'diner_table_1', '0,0,0', 78, 0, 1, 1, 1356);
INSERT INTO `catalogue_items` VALUES (1357, 'diner_table_2', 'diner_table_2', 5, 1, 3, 2, 0.00, 'diner_table_2', '0,0,0', 78, 0, 1, 1, 1357);
INSERT INTO `catalogue_items` VALUES (1358, 'window_diner', 'window_diner', 5, 0, 0, 0, 0.00, 'window_diner', '0,0,0', 78, 0, 1, 1, 1358);
INSERT INTO `catalogue_items` VALUES (1359, 'window_diner2', 'window_diner2', 5, 0, 0, 0, 0.00, 'window_diner2', '0,0,0', 78, 0, 1, 1, 1359);
INSERT INTO `catalogue_items` VALUES (1361, 'diner_bardesk', 'diner_bardesk', 5, 1, 1, 1, 0.00, 'diner_bardesk', '0,0,0', 78, 0, 1, 1, 1361);
INSERT INTO `catalogue_items` VALUES (1362, 'diner_bardesk_corner', 'diner_bardesk_corner', 5, 1, 1, 1, 0.00, 'diner_bardesk_corner', '0,0,0', 78, 0, 1, 1, 1362);
INSERT INTO `catalogue_items` VALUES (1363, 'diner_bardesk_gate', 'diner_bardesk_gate', 5, 1, 1, 1, 0.00, 'diner_bardesk_gate', '0,0,0', 78, 1, 1, 1, 1363);
INSERT INTO `catalogue_items` VALUES (1364, 'diner_chair', 'diner_chair', 5, 2, 1, 1, 1.40, 'diner_chair', '0,0,0', 78, 0, 1, 1, 1364);
INSERT INTO `catalogue_items` VALUES (1365, 'ads_dave_cns', 'ads_dave_cns', 5, 1, 1, 1, 0.00, 'ads_dave_cns', '0,0,0', 78, 0, 1, 1, 1365);
INSERT INTO `catalogue_items` VALUES (1366, 'ads_dave_wall', 'ads_dave_wall', 5, 0, 0, 0, 0.00, 'ads_dave_wall', '0,0,0', 78, 0, 1, 1, 1366);
INSERT INTO `catalogue_items` VALUES (1367, 'diner_walltable', 'diner_walltable', 5, 0, 0, 0, 0.00, 'diner_walltable', '0,0,0', 78, 0, 1, 1, 1367);
INSERT INTO `catalogue_items` VALUES (1368, 'diner_table_1', 'diner_table_1', 5, 1, 2, 2, 0.00, 'diner_table_1', '#ffffff,#3444FF', 78, 0, 1, 1, 1356);
INSERT INTO `catalogue_items` VALUES (1369, 'diner_table_2', 'diner_table_2', 5, 1, 3, 2, 0.00, 'diner_table_2', '#ffffff,#3444FF', 78, 0, 1, 1, 1357);
INSERT INTO `catalogue_items` VALUES (1370, 'diner_cashreg', 'diner_cashreg', 5, 1, 1, 1, 0.00, 'diner_cashreg', '0,0,0', 78, 0, 1, 0, 1370);
INSERT INTO `catalogue_items` VALUES (1371, 'Calippo icecream machine', 'Basic model', 25, 1, 1, 1, 0.00, 'calippo', '0,0,0', 6, 0, 1, 1, 1371);
INSERT INTO `catalogue_items` VALUES (1372, '', '', 0, 1, 1, 1, 1.00, 'present_gen1', '', -1, 0, 0, 0, 1372);
INSERT INTO `catalogue_items` VALUES (1373, '', '', 0, 1, 1, 1, 1.00, 'present_gen2', '', -1, 0, 0, 0, 1373);
INSERT INTO `catalogue_items` VALUES (1374, '', '', 0, 1, 1, 1, 1.00, 'present_gen3', '', -1, 0, 0, 0, 1374);
INSERT INTO `catalogue_items` VALUES (1375, '', '', 0, 1, 1, 1, 1.00, 'present_gen4', '', -1, 0, 0, 0, 1375);
INSERT INTO `catalogue_items` VALUES (1376, '', '', 0, 1, 1, 1, 1.00, 'present_gen5', '', -1, 0, 0, 0, 1376);
INSERT INTO `catalogue_items` VALUES (1377, '', '', 0, 1, 1, 1, 1.00, 'present_gen6', '', -1, 0, 0, 0, 1377);
INSERT INTO `catalogue_items` VALUES (1378, 'NAME', 'DESC', 5, 1, 1, 1, 3.00, 'greek_corner', '0,0,0', 80, 0, 1, 1, 1378);
INSERT INTO `catalogue_items` VALUES (1379, 'NAME', 'DESC', 5, 1, 2, 1, 0.00, 'greek_gate', '0,0,0', 80, 1, 1, 1, 1379);
INSERT INTO `catalogue_items` VALUES (1380, 'NAME', 'DESC', 5, 1, 2, 1, 3.00, 'greek_pillars', '0,0,0', 80, 0, 1, 1, 1380);
INSERT INTO `catalogue_items` VALUES (1381, 'NAME', 'DESC', 5, 4, 1, 1, 0.20, 'greek_seat', '0,0,0', 80, 0, 1, 1, 1381);
INSERT INTO `catalogue_items` VALUES (1382, 'NAME', 'DESC', 5, 1, 1, 1, 0.00, 'greektrophy*1', '#ffffff,#ffffff,#FFDD3F', 44, 0, 1, 1, 1382);
INSERT INTO `catalogue_items` VALUES (1383, 'NAME', 'DESC', 5, 1, 1, 1, 0.00, 'greektrophy*2', '#ffffff,#ffffff,#ffffff', 44, 0, 1, 1, 1383);
INSERT INTO `catalogue_items` VALUES (1384, 'NAME', 'DESC', 5, 1, 1, 1, 0.00, 'greektrophy*3', '#ffffff,#ffffff,#996600', 44, 0, 1, 1, 1384);
INSERT INTO `catalogue_items` VALUES (1385, 'NAME', 'DESC', 5, 1, 1, 1, 0.00, 'easy_bowl2', '0,0,0', 79, 0, 1, 1, 1385);
INSERT INTO `catalogue_items` VALUES (1386, 'NAME', 'DESC', 5, 4, 4, 4, 1.00, 'easy_carpet', '0,0,0', 79, 0, 1, 1, 1386);
INSERT INTO `catalogue_items` VALUES (1387, 'NAME', 'DESC', 5, 0, 0, 0, 0.00, 'easy_poster', '0,0,0', 79, 0, 1, 1, 1387);
INSERT INTO `catalogue_items` VALUES (1388, 'NAME', 'DESC', 5, 0, 0, 0, 0.00, 'ads_nokia_logo', '0,0,0', 79, 0, 1, 1, 1388);
INSERT INTO `catalogue_items` VALUES (1389, 'NAME', 'DESC', 5, 0, 0, 0, 0.00, 'ads_nokia_phone', '0,0,0', 79, 0, 1, 1, 1389);
INSERT INTO `catalogue_items` VALUES (1390, 'NAME', 'DESC', 5, 0, 0, 0, 0.00, 'window_hole', '0,0,0', 79, 0, 1, 1, 1390);
INSERT INTO `catalogue_items` VALUES (1391, 'window_skyscraper', 'window_skyscraper', 5, 0, 0, 0, 0.00, 'window_skyscraper', '', 71, 0, 1, 1, 1391);
INSERT INTO `catalogue_items` VALUES (1392, 'landscape', 'landscape', 15, 0, 0, 0, 0.00, 'landscape 1', '', 7, 0, 0, 0, 1392);
INSERT INTO `catalogue_items` VALUES (1393, 'landscape', 'landscape', 15, 0, 0, 0, 0.00, 'landscape 2', '', 7, 0, 0, 0, 1393);
INSERT INTO `catalogue_items` VALUES (1394, 'landscape', 'landscape', 15, 0, 0, 0, 0.00, 'landscape 3', '', 7, 0, 0, 0, 1394);
INSERT INTO `catalogue_items` VALUES (1395, 'landscape', 'landscape', 15, 0, 0, 0, 0.00, 'landscape 4', '', 7, 0, 0, 0, 1395);
INSERT INTO `catalogue_items` VALUES (1396, 'landscape', 'landscape', 15, 0, 0, 0, 0.00, 'landscape 5', '', 7, 0, 0, 0, 1396);
INSERT INTO `catalogue_items` VALUES (1397, 'landscape', 'landscape', 15, 0, 0, 0, 0.00, 'landscape 6', '', 7, 0, 0, 0, 1397);
INSERT INTO `catalogue_items` VALUES (1398, 'landscape', 'landscape', 15, 0, 0, 0, 0.00, 'landscape 7', '', 7, 0, 0, 0, 1398);
INSERT INTO `catalogue_items` VALUES (1399, 'landscape', 'landscape', 15, 0, 0, 0, 0.00, 'landscape 8', '', 7, 0, 0, 0, 1399);
INSERT INTO `catalogue_items` VALUES (1400, 'det_body', 'det_body', 15, 4, 2, 3, 0.00, 'det_body', '', 81, 0, 1, 1, 1400);
INSERT INTO `catalogue_items` VALUES (1401, 'det_divider', 'det_divider', 15, 1, 2, 1, 0.00, 'det_divider', '', 81, 1, 1, 1, 1401);
INSERT INTO `catalogue_items` VALUES (1402, 'det_bhole', 'det_bhole', 15, 0, 0, 0, 0.00, 'det_bhole', '', 81, 0, 1, 1, 1402);
INSERT INTO `catalogue_items` VALUES (1403, 'hcc_chair', 'hcc_chair', 15, 2, 1, 1, 1.00, 'hcc_chair', '', 81, 0, 1, 1, 1403);
INSERT INTO `catalogue_items` VALUES (1404, 'hcc_minibar', 'hcc_minibar', 15, 1, 1, 1, 1.00, 'hcc_minibar', '', 81, 1, 1, 1, 1404);
INSERT INTO `catalogue_items` VALUES (1405, 'hcc_shelf', 'hcc_shelf', 15, 1, 1, 2, 1.00, 'hcc_shelf', '', 81, 0, 1, 1, 1405);
INSERT INTO `catalogue_items` VALUES (1406, 'hcc_sofa', 'hcc_sofa', 15, 2, 2, 1, 1.00, 'hcc_sofa', '', 81, 0, 1, 1, 1406);
INSERT INTO `catalogue_items` VALUES (1407, 'hcc_sofachair', 'hcc_sofachair', 15, 2, 1, 1, 1.00, 'hcc_sofachair', '', 81, 0, 1, 1, 1407);
INSERT INTO `catalogue_items` VALUES (1408, 'hcc_stool', 'hcc_stool', 15, 2, 1, 1, 1.00, 'hcc_stool', '', 81, 0, 1, 1, 1408);
INSERT INTO `catalogue_items` VALUES (13573, 'hcc_table', 'hcc_table', 15, 1, 1, 2, 0.00, 'hcc_table', '', 81, 0, 1, 1, 1409);
INSERT INTO `catalogue_items` VALUES (13581, 'netari_carpet', 'netari_carpet', 5, 4, 3, 5, 0.00, 'netari_carpet', '', 81, 0, 1, 1, 1410);
INSERT INTO `catalogue_items` VALUES (13582, 'netari_poster', 'netari_poster', 15, 0, 0, 0, 0.00, 'netari_poster', '', 81, 0, 1, 1, 1411);
COMMIT;

-- ----------------------------
-- Table structure for catalogue_pages
-- ----------------------------
DROP TABLE IF EXISTS `catalogue_pages`;
CREATE TABLE `catalogue_pages` (
  `indexid` tinyint(3) NOT NULL,
  `minrank` tinyint(1) NOT NULL,
  `indexname` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `displayname` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `style_layout` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `img_header` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `img_side` text COLLATE latin1_general_ci,
  `label_description` text COLLATE latin1_general_ci,
  `label_misc` text COLLATE latin1_general_ci,
  `label_moredetails` varchar(150) COLLATE latin1_general_ci DEFAULT NULL,
  `opt_bodyreplace` text COLLATE latin1_general_ci,
  PRIMARY KEY (`indexid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of catalogue_pages
-- ----------------------------
BEGIN;
INSERT INTO `catalogue_pages` VALUES (5, 7, 'no rares', 'Rare', 'ctlg_norares', 'catalog_rares_headline1', 'ctlg_norare_char1,', 'There isn\'t a rare item to buy at the moment, but it\'s coming soon! Please don\'t email us about it - we\'re keeping it secret...<br>', '', '', NULL);
INSERT INTO `catalogue_pages` VALUES (6, 1, 'Rare', 'Rare', 'ctlg_productpage1', 'catalog_rares_headline1', '', 'It\'s Spring, and it\'s the best time to stock up on Parasols! Go get your Green Parasol Now!:', 's:Only for 2 weeks!!!', '', NULL);
INSERT INTO `catalogue_pages` VALUES (7, 1, 'Spaces', 'Spaces', 'ctlg_spaces', 'catalog_spaces_headline1', NULL, 'Floors, wallpapers and landscapes - get a groovy new look for your room. Use our virtual room preview below to test out the combinations before you buy. Select the design and colour you desire and click buy. OFFER: Great value on Landscapes - from 2 Credits!', 't5:Pattern\r\nt2:Floor\r\nt8:Pattern\r\nt11:Landscape\r\nt10:Floor\r\nt6:Colour\r\nt3:Pattern\r\nt9:Colour', 't7:Preview t4:Colour t1:Wall', NULL);
INSERT INTO `catalogue_pages` VALUES (8, 1, 'Pets', 'Pets', 'ctlg_pets', 'catalog_pet_headline1', 'catalog_pets_teaser1,', 'Fluff, scales and whiskers, meows, snaps and woofs!  Anyone can have a pet on Habbo!  Select your new pet from our ever changing selection, just click to page two then click back, to see more pets!', 'u:Pets2', 'Adopt a Pet today!', NULL);
INSERT INTO `catalogue_pages` VALUES (9, 1, 'Pet Accessories', 'Pet Accessories', 'ctlg_layout2', 'catalog_pet_headline2', 'ctlg_pet_teaser1,', 'You\'ll need to take care of your pet to keep it happy and healthy. This section of the Catalogue has EVERYTHING you?ll need to satisfy your pet?s needs.', 's:You\'ll have to share it!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (11, 1, 'Area', 'Area', 'ctlg_layout2', 'catalog_area_headline1', 'catalog_area_teaser1,', 'Introducing the Area Collection...  Clean, chunky lines set this collection apart as a preserve of the down-to-earth Habbo. It\'s beautiful in its simplicity, and welcoming to everyone.', 's:2: Beautiful in it\'s simplicity!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (12, 1, 'Accessories', 'Accessories', 'ctlg_layout2', 'catalog_extra_headline1', 'catalog_extra_teaser1,', 'Is your room missing something?  Well, now you can add the finishing touches that express your true personality. And don\'t forget, like everything else, these accessories can be moved about to suit your mood.', 's:2: I love my rabbit...', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (13, 1, 'Asian', 'Asian', 'ctlg_layout2', 'catalog_asian_headline1', 'catalog_asian_teaser1,', 'Dit pure haandwerk uit de eeuwenoude oosterse pixeltraditie brengt balans in elk Habbointerieur. Jin en Yang vloeien samen met Feng en Shui in een uitgebalanceerde collectie meubi. ', 's:2: Oh, look there! Is Mulan the girl of Disney xD', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (14, 1, 'Bathroom', 'Bathroom', 'ctlg_layout2', 'catalog_bath_headline1', 'catalog_bath_teaser1,', 'Introducing the Bathroom Collection...  Have some fun with the cheerful bathroom collection. Give yourself and your guests somewhere to freshen up - vital if you want to avoid nasty niffs. Put your loo in a corner though...', 's:2: Every Habbo needs one!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (15, 1, 'Candy', 'Candy', 'ctlg_layout2', 'catalog_candy_headline1', 'catalog_candy_teaser1,', 'Introducing the Candy Collection...  Candy combines the cool, clean lines of the Mode collection with a softer, more soothing style. It\'s urban sharpness with a hint of the feminine.', 's:2: Relax! It\'s faux-fur.', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (16, 1, 'Camera', 'Camera', 'ctlg_camera1', 'catalog_camera_headline1', 'campic_cam,campic_film,', 'Take a picture and keep a record of those special moments forever.  With your Habbo camera you can take pictures of just about anything in the Hotel ? Even your friend on the loo...<br><br>A Camera costs 10 Credits (TWO FREE photos  included).', '', 't1:When you\'ve used your free photos, you\'ll need to buy more? Each Film (5 photos) costs 6 Credits.  <br><br>Your Camera will show how much film you ', NULL);
INSERT INTO `catalogue_pages` VALUES (17, 1, 'Flags', 'Flags', 'ctlg_layout2', 'catalog_flags_headline1', 'catalog_flags_teaser1,', 'If you\'re feeling patriotic, get a flag to prove it. Our finest cloth flags will brighten up the dullest walls.', 's:2: Flag this section for later!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (18, 1, 'Gallery', 'Gallery', 'ctlg_layout2', 'catalog_gallery_headline1', 'catalog_posters_teaser1,', 'Adorn your walls with wondrous works of art, posters, plaques and wall hangings. We have items to suit all tastes, from kitsch to cool, traditional to modern.', 's:2: Brighten up your walls!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (19, 1, 'Glass', 'Glass', 'ctlg_layout2', 'catalog_glass_headline1', 'catalog_glass_teaser1,', 'Glass: Habbo Hotels exclusive furni line made from plexiglass, in different colors! Buy here your furni for a modern lounge!', 's:2: Oh My God, it\'s transparant!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (20, 1, 'Gothic', 'Gothic', 'ctlg_layout2', 'catalog_gothic_headline1', 'catalog_gothic_teaser1,', 'The Gothic section is full of medieval looking Furni. Check back for additions to this section as there are still some unreleased items to come!', 's:Gothic is my style.', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (21, 1, 'Grunge', 'Grunge', 'ctlg_layout2', 'catalog_gru_headline1', 'catalog_gru_teaser,', 'Introducing the Grunge Range. Alternative Habbos with alternative style or rebellious students with a point to prove. The Grunge range will get your bedroom looking just the way you like it - organised, neat and tidy!', '', 'New! Flaming Barrels out now!', NULL);
INSERT INTO `catalogue_pages` VALUES (22, 1, 'Habbo Exchange', 'Habbo Exchange', 'ctlg_layout2', 'catalog_bank_headline1', 'catalog_bank_teaser,', 'The Habbo Exchange is where you can convert your Habbo Credits into a tradable currency. You can use this tradable currency to exchange Habbo Credits for Furni!', 's:Refundable goods!', 'Click on an item to see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (23, 1, 'Habbowood', 'Habbowood', 'ctlg_layout2', 'catalog_limited_headline1', 'catalog_limited_teaser1,', 'Exclusive: the new Habbowood furni, collect them all!', 's:1: Light, Camera, Action!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (24, 1, 'Iced', 'Iced', 'ctlg_layout2', 'catalog_iced_headline1', 'catalog_iced_teaser1,', 'Introducing the Iced Collection...  For the Habbo who needs no introduction. It\'s so chic, it says everything and nothing. It\'s a blank canvas, let your imagination to run wild!', 's:2: These chairs are so comfy.', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (25, 1, 'Japanese', 'Japanese', 'ctlg_layout2', 'catalog_jap_headline2', 'catalog_jap_teaser3,', 'Here you can find the new Japanese furni! Get them now!', 's:1: Brand new furni!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (26, 1, 'Lodge', 'Lodge', 'ctlg_layout2', 'catalog_lodge_headline1', 'catalog_lodge_teaser1,', 'Introducing the Lodge Collection...  Do you appreciate the beauty of wood?  For that ski lodge effect, or to match that open fire... Lodge is the Furni of choice for Habbos with that no frills approach to decorating.  <br>', 's:2: I LOVE this wood Furni!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (27, 1, 'Mode', 'Mode', 'ctlg_layout2', 'catalog_mode_headline1', 'catalog_mode_teaser1,', 'Introducing the Mode Collection...  Steely grey functionality combined with sleek designer upholstery. The Habbo that chooses this furniture is a cool urban cat - streetwise, sassy and so slightly untouchable.', 's:2: So shiny and new...', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (28, 1, 'Offers', 'Offers', 'ctlg_layout2', 'catalog_deals_headline1', 'catalog_deals_teaser1,', 'Special Offers are great if you?re just starting out. Take a look at our special collections, all at a great price.<br><br>Check them out!', '', 'Click on a deal to find out what\'s included and how much it costs.', NULL);
INSERT INTO `catalogue_pages` VALUES (29, 1, 'Plants', 'Plants', 'ctlg_layout2', 'catalog_plants_headline1', 'catalog_plants_teaser1,', 'New, never before seen Bulrush Plant is here for a limited time only. Buy it now!<br>Introducing the Plant Collection...  Every room needs a plant! Not only do they bring a bit of the outside inside, they also enhance the air quality!', 's:2: I am at one with the trees', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (30, 1, 'Plastic', 'Plasto', 'ctlg_plasto', 'catalog_plasto_headline1', NULL, 'Introducing The Plastic Collection...  Can you feel that 1970s vibe?  Decorate with Plastic and add some colour to your life. Choose a colour that reflect your mood, or just pick your favourite shade.', 't2:Select The Colour\rs:New colours!\rt3:Preview\rt1:Choose An Item', 'Select an item and a colour and buy!', NULL);
INSERT INTO `catalogue_pages` VALUES (31, 1, 'Presents', 'Presents', 'ctlg_presents', 'catalog_gifts_headline1', 'catalog_presents_teaser1,catalog_presents_teaser2,', 'Show your Habbo friends just how much you care and send them a gift from the Habbo Catalogue.  ANY Catalogue item can be sent as a gift to ANY Habbo, all you need is their Habbo name!', 't1:Buying an item as a gift couldn?to be simpler...  <br><br>Buy an item from the Catalogue in the normal way, but tick \'buy as a gift\'. Tell us which Habbo you want to give the gift to and we\'ll gift wrap it and deliver it straight to their hand.', '', NULL);
INSERT INTO `catalogue_pages` VALUES (32, 1, 'Pura', 'Pura', 'ctlg_layout2', 'catalog_pura_headline1', 'catalog_pura_teaser1,', 'Introducing the Pura Collection...  This collection breathes fresh, clean air and cool tranquility. The Pura Waltzer has arrived!  Check back regularly to see  new colours of Pura on sale!', '', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (33, 1, 'Recycler', 'Ecotron', 'ctlg_recycler', 'catalog_recycler_headline1', NULL, NULL, '', NULL, NULL);
INSERT INTO `catalogue_pages` VALUES (34, 1, 'Rollers', 'Rollers', 'ctlg_layout2', 'catalog_roller_headline1', '', 'Move your imagination, while you move your Habbo!  Perfect for mazes, games, for keeping your queue moving or making your pet go round in circles for hours.  Available in multi-packs ? the more you buy the cheaper the Roller! Pink Rollers out now!', 's:You can fit 35 Rollers in a Guest Room!', 'Click on a Roller to see more information!', NULL);
INSERT INTO `catalogue_pages` VALUES (35, 1, 'Romantique', 'Romantique', 'ctlg_layout2', 'catalog_romantique_headline1', 'catalog_rom_teaser,', 'The Romantique range features Grand Pianos, old antique lamps and tables. It is the ideal range for setting a warm and loving mood in your room. Spruce up your room and invite that special someone over. Now featuring the extra special COLOUR edition.', '', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (36, 1, 'Rugs', 'Rugs', 'ctlg_layout2', 'catalog_rugs_headline1', 'catalog_rugs_teaser1,', 'We have rugs for all occasions.  All rugs are non-slip and washable.', 's:2: Rugs, rugs and more rugs!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (37, 1, 'Sports', 'Sport', 'ctlg_layout2', 'catalog_sports_headline1', 'catalog_sports_teaser1,', 'For the sporty habbos, here is the sports section!', NULL, 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (38, 1, 'Teleport', 'Teleport', 'ctlg_layout2', 'catalog_doors_headline1', 'catalog_teleports_teaser2,catalog_door_c,catalog_door_b,', 'Beam your Habbo from one room to another with one of our cunningly disguised, space age teleports. Now you can link any two rooms together! Teleports are sold in pairs, so if you trade for them, check you\'re getting a linked pair.', 's:Teleport!', 'Select an item by clicking one of the icons on the left.', NULL);
INSERT INTO `catalogue_pages` VALUES (39, 1, 'Trax Ambient', 'Trax Ambient', 'ctlg_soundmachine', 'catalog_trx_header1', 'catalog_trx_teaser1,', 'Welcome to the Ambient Trax Store! With groovy beats and chilled out melodies, this is the section for some cool and relaxing tunes.', NULL, NULL, NULL);
INSERT INTO `catalogue_pages` VALUES (40, 1, 'Trax Dance', 'Trax Dance', 'ctlg_soundmachine', 'catalog_trx_header2', 'catalog_trx_teaser2,', 'Welcome to the Dance Trax Store! With funky beats and catchy melodies, this is the section for every clubber  to indulge in.', NULL, NULL, NULL);
INSERT INTO `catalogue_pages` VALUES (41, 1, 'Trax Rock', 'Trax Rock', 'ctlg_soundmachine', 'catalog_trx_header3', 'catalog_trx_teaser3,', 'Welcome to the Rock Trax Store! With heavy beats and rockin\' riffs, this is the section for every rock fan to experiment with.', NULL, NULL, NULL);
INSERT INTO `catalogue_pages` VALUES (42, 1, 'Trax SFX', 'Trax SFX', 'ctlg_soundmachine', 'catalog_trx_header4', 'catalog_trx_teaser4,', 'Welcome to the SFX Trax Store! With crazy sounds and weird noises, this is the section for every creative room builder  to indulge in.', NULL, NULL, NULL);
INSERT INTO `catalogue_pages` VALUES (43, 1, 'Trax Urban', 'Trax Urban', 'ctlg_soundmachine', 'catalog_trx_header5', 'catalog_trx_teaser5,', 'Welcome to the Urban Trax Store! With hip hop beats and RnB vocals, this is the section for every city bopper  to indulge in.', NULL, NULL, NULL);
INSERT INTO `catalogue_pages` VALUES (44, 1, 'Trophies', 'Trophies', 'ctlg_trophies', 'catalog_trophies_headline1', '', 'Reward your Habbo friends, or yourself with one of our fabulous glittering array of bronze, silver and gold trophies.<br><br>First choose the trophy model (click on the arrows to see all the different styles) and then the metal (click on the seal below the trophy). Type your inscription below and we\'ll engrave it on the trophy along with your name and today\'s date.', 't1:Type your inscription CAREFULLY, it\'s permanent!', NULL, NULL);
INSERT INTO `catalogue_pages` VALUES (45, 1, 'Christmas', 'Christmas', 'ctlg_layout2', 'catalog_xmas_headline1', 'catalog_xmas_teaser,', 'The Habbo Christmas catalogue has everything you need to make the perfect festive room: Trees, ducks with santa hats on, puddings and of course, Menorahs!', 's:2:Tuck into Christmas!', 'Click on an item to see a bigger version of it!', NULL);
INSERT INTO `catalogue_pages` VALUES (46, 1, 'Easter', 'Easter', 'ctlg_layout2', 'catalog_easter_headline1', 'catalog_easter_teaser1,', '\'Egg\'cellent furni - Bouncing bunnies, fluffy chicks, choccy eggs... Yep, it\'s Easter! Celebrate with something \'eggs\'tra special from our Easter range. But hurry - it\'s not here for long this year!', 's:2: \'Egg\'-Tastic!', 'Click on an item for more details.', NULL);
INSERT INTO `catalogue_pages` VALUES (47, 1, 'Halloween', 'Halloween', 'ctlg_layout2', 'catalog_halloween_headline1', 'catalog_halloween_teaser,', 'Yes, it\'s a spookfest! Get your boney hands on our creepy collection of ghoulish goodies. But be quick - they\'ll be gone from the Catalogue after two weeks!', 's:2:Halloween is My day!', 'Click on an item to see a bigger version of it!', NULL);
INSERT INTO `catalogue_pages` VALUES (48, 1, 'Love', 'Love', 'ctlg_layout2', 'catalog_love_headline1', 'catalog_love_teaser1,', 'The love collection has everything to create the perfect love room, for a good price!', 's:2:Oh! Comes Valentine\'s Day!', 'Click on an item to see a bigger version of it!', NULL);
INSERT INTO `catalogue_pages` VALUES (49, 1, 'Area Colour', 'Area Colour', 'ctlg_layout2', 'catalog_area_headline1', 'catalog_area_teaser1,', 'Introducing the Area Collection...  Clean, chunky lines set this collection apart as a preserve of the down-to-earth Habbo. It\'s beautiful in its simplicity, and welcoming to everyone.', 's:Much More Colours!!!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (50, 1, 'Iced Colour', 'Iced Colour', 'ctlg_layout2', 'catalog_iced_headline1', 'catalog_iced_teaser1,', 'Introducing the Iced Collection...  For the Habbo who needs no introduction. It\'s so chic, it says everything and nothing. It\'s a blank canvas, let your imagination to run wild!', 's:Much More Colours!!!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (51, 1, 'Mode Colour', 'Mode Colour', 'ctlg_layout2', 'catalog_mode_headline1', 'catalog_mode_teaser1,', 'Introducing the Mode Collection...  Steely grey functionality combined with sleek designer upholstery. The Habbo that chooses this furniture is a cool urban cat - streetwise, sassy and so slightly untouchable.', 's:Much More Colours!!!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (52, 1, 'Pura Colour', 'Pura Colour', 'ctlg_layout2', 'catalog_pura_headline1', 'catalog_pura_teaser1,', 'Introducing the Pura Collection...  This collection breathes fresh, clean air and cool tranquility. The Pura Waltzer has arrived!  Check back regularly to see  new colours of Pura on sale!', 's:Much More Colours!!!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (53, 1, 'Romantique Colour', 'Romantique Colour', 'ctlg_layout2', 'catalog_romantique_headline1', 'catalog_rom_teaser,', 'The Romantique range features Grand Pianos, old antique lamps and tables. It is the ideal range for setting a warm and loving mood in your room. Spruce up your room and invite that special someone over. Now featuring the extra special COLOUR edition.', 's:Much More Colours!!!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (54, 1, 'Club Furni', 'Club Furni', 'ctlg_layout2', 'catalog_club_headline1', 'catalog_hc_teaser,', 'Welcome to the club furni page. Here you can buy any club furni for just 25 credits!', 's:For Habbo Club members only!', 'Click on an item to see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (55, 1, 'Club Shop', 'Club Shop', 'ctlg_layout2', 'catalog_club_headline1', 'catalog_hc_teaser,', 'Welcome to the Brand New Habbo Club Shop, where Habbo Club members can purchase exclusive items!<br>The Furni in this section can only be purchased by Habbos who have joined Habbo Club.', 's:For Habbo Club members only!', 'Click on an item to see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (56, 7, 'Dragons', 'Dragons', 'ctlg_layout2', 'catalog_jap_headline2', 'catalog_jap_teaser3,', 'Here you can find the Power of Dragons! Get them now!', 's:1: All Colours!', 'Click on the item you want for more information.', NULL);
INSERT INTO `catalogue_pages` VALUES (57, 7, 'Fans', 'Fans', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (58, 7, 'Ice Cream Rare', 'Ice Cream Rare', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (59, 7, 'Inflatables', 'Inflatables', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (60, 1, 'Laser Gates', 'Laser Gates', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (61, 7, 'Marquee', 'Marquee', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (62, 7, 'Monoliths', 'Monoliths', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (63, 7, 'Oriental Screen', 'Oriental Screen', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (64, 7, 'Pilars Rare', 'Pilars Rare', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (65, 7, 'Pillow Rare', 'Pillow Rare', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (66, 7, 'Smoke Machines', 'Smoke Machines', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (67, 1, 'Summer Pools', 'Summer Pools', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (68, 7, 'Rares', 'Rares', 'ctlg_layout2', 'catalog_rares_headline1', '', 'Hm... You have permission to stay here? Oh! if you don\'t have permission, please go away!!!', 's:Restricted Zone', 'Select a item, and see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (69, 7, 'Trophies Rare', 'Tropies Rare', 'ctlg_trophies', 'catalog_trophies_headline1', '', 'Reward your Habbo friends, or yourself with one of our fabulous glittering array of bronze, silver and gold trophies.<br><br>First choose the trophy model (click on the arrows to see all the different styles) and then the metal (click on the seal below the trophy). Type your inscription below and we\'ll engrave it on the trophy along with your name and today\'s date.<br>', 't1:Type your inscription CAREFULLY, it\'s permanent!', '', NULL);
INSERT INTO `catalogue_pages` VALUES (70, 1, 'Noob Edition', 'Noob Edition', 'ctlg_layout2', 'catalog_limited_headline1', 'catalog_limited_teaser1,', 'Get it while its hot.. <br><br>LIMITED EDITION FURNITURE!', '', 'For a limited time only!', NULL);
INSERT INTO `catalogue_pages` VALUES (72, 1, 'Ver. 18 to 20', 'Ver. 18 to 20', 'ctlg_layout2', 'catalog_limited_headline1', 'catalog_limited_teaser1,', 'Get it while its hot.. <br><br>LIMITED EDITION FURNITURE!', '', 'For a limited time only!', NULL);
INSERT INTO `catalogue_pages` VALUES (71, 1, 'Windows', 'Ramen', 'ctlg_layout2', 'ctlg_windows_headline1', 'ctlg_windows_teaser1', 'Let some sunshine in! Our windows come in many styles to give an unique look to Your room. Who said Your room does not have a view? It does now', 's: Ooh, new view!', 'Click on an item to see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (73, 1, 'Ver. 21 to 23', 'Ver. 21 to 23', 'ctlg_layout2', 'catalog_limited_headline1', 'catalog_limited_teaser1,', 'Get it while its hot.. <br><br>LIMITED EDITION FURNITURE!', '', 'For a limited time only!', NULL);
INSERT INTO `catalogue_pages` VALUES (10, 1, 'Alhambra', 'Alhambra', 'ctlg_layout2', 'catalog_alh_headline2', 'catalog_alh_teaser2,', 'The Palace of Alhambra has appeared and with it this exotic and beautifully crafted range of Arabian Furni. Luxury seating and gourmet food combine to make your room sparkle with riches.', '', 'Click on an item to see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (74, 1, 'Tiki', 'Tiki', 'ctlg_layout2', 'catalog_tiki_header1', 'catalog_limited_teaser1,', 'nieuwe meubi in de cata', 's: Ooh, new view!', 'Click on an item to see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (78, 1, 'Ver.24', 'Ver.24', 'ctlg_layout2', 'catalog_limited_headline1', 'catalog_limited_teaser1,', 'nieuwe meubi in de cata', 's: Ooh, new view!', 'Click on an item to see more details', NULL);
INSERT INTO `catalogue_pages` VALUES (1, 1, 'Purse', 'Purse', 'ctlg_purse', 'catal_fp_header', 'catal_fp_pic4,', 'Need some furni for your Habbo room? Well, you\'re in the right place! This Catalogue is packed FULL of funky Furni, just click the tabs on the right to browse', NULL, 'Need some Funky Furni for your Habbo', NULL);
INSERT INTO `catalogue_pages` VALUES (3, 1, 'Collectables', 'Collectables', 'ctlg_collectibles', 'catalog_collectibles_headline1', 'collectible_page,', 'Collect your way to the riches! Collectables are special furniture sold only for a limited period of time. They cost a wee bit more, but make it up with an amazing trade value.\r\n', 't1:Find out what the latest Collectable is >>', 'Find out what the latest collectible is >>', NULL);
INSERT INTO `catalogue_pages` VALUES (80, 1, 'Greek', 'Greek', 'ctlg_layout2', 'catalog_limited_headline1', 'catalog_limited_teaser1,', 'Get it while its hot.. <br><br>LIMITED EDITION FURNITURE!', NULL, 'For a limited time only!', '');
INSERT INTO `catalogue_pages` VALUES (79, 1, 'Advertisement', 'Advertisement', 'ctlg_layout2', 'catalog_limited_headline1', 'catalog_limited_teaser1,', 'Get it while its hot.. <br><br>LIMITED EDITION FURNITURE!', NULL, 'For a limited time only!', '');
INSERT INTO `catalogue_pages` VALUES (81, 7, 'Ver.25', 'Ver.25', 'ctlg_layout2', 'catalog_limited_headline1', 'catalog_limited_teaser1,', 'Get it while its hot.. <br><br>LIMITED EDITION FURNITURE!', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_alerts
-- ----------------------------
DROP TABLE IF EXISTS `cms_alerts`;
CREATE TABLE `cms_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `alert` text NOT NULL,
  `type` enum('1','2') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1897 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_alerts
-- ----------------------------
BEGIN;
INSERT INTO `cms_alerts` VALUES (1804, 2, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1805, 3, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1806, 4, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1807, 5, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1809, 7, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1810, 8, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1811, 9, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1812, 10, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1813, 11, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1814, 12, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1815, 13, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1816, 14, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1817, 15, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1818, 16, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1819, 17, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1820, 18, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1821, 19, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1822, 20, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1823, 21, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1824, 22, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1825, 23, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1826, 24, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1827, 25, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1828, 26, 'BSS', '2');
INSERT INTO `cms_alerts` VALUES (1830, 2, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1831, 3, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1832, 4, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1833, 5, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1835, 7, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1836, 8, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1837, 9, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1838, 10, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1839, 11, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1840, 12, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1841, 13, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1842, 14, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1843, 15, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1844, 16, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1845, 17, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1846, 18, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1847, 19, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1848, 20, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1849, 21, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1850, 22, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1851, 23, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1852, 24, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1853, 25, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1854, 26, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1855, 27, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1856, 28, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1857, 29, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1858, 30, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1859, 31, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1860, 32, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1861, 33, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1862, 34, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1864, 2, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1865, 3, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1866, 4, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1867, 5, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1869, 7, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1870, 8, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1871, 9, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1872, 10, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1873, 11, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1874, 12, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1875, 13, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1876, 14, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1877, 15, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1878, 16, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1879, 17, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1880, 18, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1881, 19, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1882, 20, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1883, 21, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1884, 22, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1885, 23, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1886, 24, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1887, 25, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1888, 26, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1889, 27, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1890, 28, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1891, 29, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1892, 30, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1893, 31, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1894, 32, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1895, 33, 'hhhhhhhhhhhhhhhhhhhh', '2');
INSERT INTO `cms_alerts` VALUES (1896, 34, 'hhhhhhhhhhhhhhhhhhhh', '2');
COMMIT;

-- ----------------------------
-- Table structure for cms_application_forms
-- ----------------------------
DROP TABLE IF EXISTS `cms_application_forms`;
CREATE TABLE `cms_application_forms` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0' COMMENT 'For what rank can people applicate?',
  `introduction` text NOT NULL COMMENT 'What''s the description of the rank it self?',
  `requirements` text NOT NULL COMMENT 'What are the requirments if you want to do this job?',
  `hconly` int(1) NOT NULL DEFAULT '0' COMMENT 'Can only people who are HC applicate or everyone?',
  `username` int(1) NOT NULL DEFAULT '0' COMMENT 'Show username in application form?',
  `realname` int(1) NOT NULL DEFAULT '0' COMMENT 'Need people to fill in their real name?',
  `birth` int(1) NOT NULL DEFAULT '0' COMMENT 'Show birth in application form?',
  `sex` int(1) NOT NULL DEFAULT '0' COMMENT 'Need people to fill in what there sex is (male/female/shemale)?',
  `country` int(1) NOT NULL DEFAULT '0' COMMENT 'Need people to fill in, in what country they live?',
  `general_information` int(1) NOT NULL DEFAULT '0' COMMENT 'Need people to fill in general information (reasons why you''re interested/why the staff should choose you)?',
  `experience` int(1) NOT NULL DEFAULT '0' COMMENT 'Need people to fill in if they have work experience?',
  `education` int(1) NOT NULL DEFAULT '0' COMMENT 'Need people to fill in what level they (did) study?',
  `additional_information` int(1) NOT NULL DEFAULT '0' COMMENT 'Need people to fill in hobbies or interests?',
  `show_disclaimer` int(1) NOT NULL DEFAULT '0' COMMENT 'Must there be a disclaimer that the people who applicates need to accept?',
  `disclaimer_text` text NOT NULL COMMENT 'The disclaimer it self (shown if configurated).',
  `enabled` int(11) NOT NULL DEFAULT '0' COMMENT 'Can you right now apply for this rank?',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT 'If you ''delete'' a application form it will be invisible. We don''t delete it in the sql table so no errors come up if someone applied for this rank.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='You DO NOT find any applications in this table, only the for';

-- ----------------------------
-- Table structure for cms_applications
-- ----------------------------
DROP TABLE IF EXISTS `cms_applications`;
CREATE TABLE `cms_applications` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `rankname` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `realname` varchar(50) NOT NULL,
  `birth` varchar(15) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL,
  `general_information` text NOT NULL,
  `experience` text NOT NULL,
  `education` varchar(50) NOT NULL,
  `additional_information` text NOT NULL,
  `accepted_disclaimer` int(1) NOT NULL DEFAULT '0',
  `admin_reacted` int(1) NOT NULL DEFAULT '0',
  `admin_read` int(1) NOT NULL DEFAULT '0',
  `admin_deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_banners
-- ----------------------------
DROP TABLE IF EXISTS `cms_banners`;
CREATE TABLE `cms_banners` (
  `id` int(35) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `banner` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0',
  `advanced` int(1) DEFAULT NULL,
  `html` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_collectables
-- ----------------------------
DROP TABLE IF EXISTS `cms_collectables`;
CREATE TABLE `cms_collectables` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT 'Unknown furniture',
  `image_small` varchar(255) DEFAULT NULL,
  `image_large` varchar(255) NOT NULL,
  `tid` int(20) NOT NULL DEFAULT '0',
  `description` varchar(175) NOT NULL DEFAULT 'No description given!',
  `month` int(2) NOT NULL DEFAULT '1',
  `year` int(2) NOT NULL,
  `showroom` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_content
-- ----------------------------
DROP TABLE IF EXISTS `cms_content`;
CREATE TABLE `cms_content` (
  `contentkey` text NOT NULL,
  `contentvalue` text NOT NULL,
  `setting_title` text NOT NULL,
  `setting_desc` text NOT NULL,
  `fieldtype` enum('1','2','3') NOT NULL DEFAULT '1',
  `category` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_content
-- ----------------------------
BEGIN;
INSERT INTO `cms_content` VALUES ('credits1', 'Credits are the hotel&#039;s currency. You can use them to buy all kinds of things, from rubber ducks and sofas, to Holo Club membership, jukeboxes and teleports.', 'Credits Content Box 1', 'The text within a content box on the credits page.', '1', 3);
INSERT INTO `cms_content` VALUES ('credits2', '&lt;img class=&quot;credits-image&quot; src=&quot;./web-gallery/album1/palmchair.gif&quot; align=&quot;left&quot; /&gt;To buy furniture or play games, you need &lt;b&gt;credits&lt;/b&gt;. We provide you with free credits on registration, and if you run out, there are several ways you can earn more credits:\r\n&lt;li&gt;* Refer a friend to the hotel and earn credits&lt;/li&gt;&lt;li&gt;* Ask a staff member ingame&lt;/li&gt;&lt;li&gt;* Redeem a voucher if you have one&lt;/li&gt;&lt;li&gt;* Trade your furniture with others for credit furniture&lt;/li&gt;', 'Credits Content Box 2', 'The text within a content box on the credits page.', '1', 3);
INSERT INTO `cms_content` VALUES ('credits1-heading', 'What are credits?', 'Credits Content Box 1 Heading', 'The title (heading) of Credit Content Box 1.', '1', 3);
INSERT INTO `cms_content` VALUES ('credits2-heading', 'Get credits!', 'Credit Content Box 2 Heading', 'The title (heading) of Credit Content Box 2.', '1', 3);
INSERT INTO `cms_content` VALUES ('staff1', 'You can find the staff members all over the hotel -- in the public rooms, their own rooms, or that dark little corner in your room. But how can you call them if you actually need them!? Easy. If it\'s urgent, use the Call for Help system ingame by using the blue questionmark in the right bottom of your screen. If it isn\'t urgent, use the Help Tool on the website.', 'Staff Content Box 1', 'The text within a content box on the staff page (if enabled).', '1', 2);
INSERT INTO `cms_content` VALUES ('staff2', 'So you want that sexy staff badge next to your name in the hotel and on the site? Do you want to join Holo Hotel\'s moderation team? Keep your eyes focused on this section and the news -- if we\'re looking for staff it will be announced there, and surely you won\'t miss it!', 'Staff Content Box 2', 'The text within a content box on the staff page (if enabled).', '1', 2);
INSERT INTO `cms_content` VALUES ('staff1-heading', 'Need our help?', 'Staff Content Box 1 Heading', 'The title (heading) of Staff Content Box 1.', '1', 2);
INSERT INTO `cms_content` VALUES ('staff2-heading', 'Joining the Team', 'Staff Content Box 2 Heading', 'The title (heading) of Staff Content Box 2.', '1', 2);
INSERT INTO `cms_content` VALUES ('staff1-color', 'green', 'Staff Content Box 1 Color', 'Only valid colors defined in CSS such as \'orange\', \'blue\', etc', '3', 2);
INSERT INTO `cms_content` VALUES ('staff2-color', 'green', 'Staff Content Box 2 Color', 'Only valid colors defined in CSS such as \'orange\', \'blue\', etc', '3', 2);
INSERT INTO `cms_content` VALUES ('mod_staff-enabled', '1', 'Staff Module Enabled', 'This determines wether the Staff Module (staff.php) will be displayed/enabled.', '2', 2);
INSERT INTO `cms_content` VALUES ('client-widescreen', '1', 'Client in Widescreen', 'This determines wether the game client should display in widescreen mode or not.', '2', 1);
INSERT INTO `cms_content` VALUES ('birthday-notifications', '1', 'Birthday Notifications Enabled', 'This will determine wether a \'Happy birthday\' message will be shown on a user\'s birthday.', '2', 1);
INSERT INTO `cms_content` VALUES ('allow-group-purchase', '1', 'Group Purchasing Enabled', 'This determines wether new groups can be created or not.', '2', 1);
INSERT INTO `cms_content` VALUES ('forum-enabled', '1', 'Forum Enabled', 'This determines wether the Discussion Board will be shown/enabled.', '2', 4);
INSERT INTO `cms_content` VALUES ('smilies-enabled', '1', 'Smilies Enabled', 'This determines wether Smilies will be shown on the Discussion Board and on Homes.', '2', 4);
INSERT INTO `cms_content` VALUES ('enable-flash-promo', '1', 'Enable Flash Promo', 'This determines wether the Flash Promo on the login page will be displayed. If disabled, a HTML version will be used.', '2', 1);
INSERT INTO `cms_content` VALUES ('allow-guests', '1', 'Allow guests?', 'This determines wether guest mode is enabled. Guest Mode allows you to visit (parts of) your site (with limitations) without logging in.', '2', 1);
INSERT INTO `cms_content` VALUES ('hc-maxmonths', '6', 'HC Months Limit', 'This will limit the allowed amount of subscribed Club months per user at once to this number. Set to \'0\' to have no limit.', '1', 1);
COMMIT;

-- ----------------------------
-- Table structure for cms_faq
-- ----------------------------
DROP TABLE IF EXISTS `cms_faq`;
CREATE TABLE `cms_faq` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT 'type',
  `catid` int(11) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_faq
-- ----------------------------
BEGIN;
INSERT INTO `cms_faq` VALUES (10, 'cat', NULL, 'Test new FAQ! v3', 'This MUST BE WORKs!');
INSERT INTO `cms_faq` VALUES (13, 'item', 10, 'I&#039;m a topic&#039;', 'I&#039;m a content!');
INSERT INTO `cms_faq` VALUES (8, 'cat', NULL, 'First FAQ', 'This is a content for a faq category. v5');
INSERT INTO `cms_faq` VALUES (14, 'item', 10, 'Second topic', 'Yes, i&#039;m an another :D');
INSERT INTO `cms_faq` VALUES (17, 'item', 8, 'Yo soy un nuevo item', 'Listo para hacer testing!');
COMMIT;

-- ----------------------------
-- Table structure for cms_forum_posts
-- ----------------------------
DROP TABLE IF EXISTS `cms_forum_posts`;
CREATE TABLE `cms_forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `threadid` int(11) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `author` varchar(25) NOT NULL,
  `date` varchar(30) NOT NULL,
  `edit_date` varchar(30) NOT NULL,
  `edit_author` varchar(25) NOT NULL,
  `forumid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_forum_posts
-- ----------------------------
BEGIN;
INSERT INTO `cms_forum_posts` VALUES (63, 17, 'I&#039;m Miguel González Aravena. Now i&#039;m [b]testing[/b] the [u]forum[/u] with it functions. ([u]EDIT[/u])', 'Miguel', '25-09-2016 00:20:06', '28-09-2016 10:42:16', 'Miguel', 0);
INSERT INTO `cms_forum_posts` VALUES (64, 18, '[b]Beautiful[/b]! :)', 'Miguel', '03-10-2016 03:48:46', '', '', 1);
INSERT INTO `cms_forum_posts` VALUES (65, 17, 'hai', 'leo', '31-01-2017 14:24:29', '', '', NULL);
INSERT INTO `cms_forum_posts` VALUES (66, 18, 'ffff[color=green]hhhg[/color]', 'poko', '01-08-2017 20:18:11', '', '', NULL);
INSERT INTO `cms_forum_posts` VALUES (68, 17, '[size=small][/size][size=large][/size][url=][/url][color=gray][/color][b][/b]', 'poko', '20-08-2017 20:35:29', '', '', NULL);
INSERT INTO `cms_forum_posts` VALUES (69, 17, '[quote]hai[/quote]\nk', 'poko', '20-08-2017 20:35:44', '', '', NULL);
INSERT INTO `cms_forum_posts` VALUES (70, 20, 'lnjiohohmi', 'mercuryfr', '10-09-2017 02:52:16', '', '', 3);
INSERT INTO `cms_forum_posts` VALUES (71, 17, 'nice cms e nos crlh br hue', 'Richard', '25-09-2017 01:05:00', '', '', NULL);
INSERT INTO `cms_forum_posts` VALUES (73, 17, 'melhor cms, pqp', 'David', '12-01-2018 19:58:02', '', '', NULL);
INSERT INTO `cms_forum_posts` VALUES (74, 21, 'heloo, people!', 'rtiag0', '23-05-2018 17:13:40', '', '', 13);
INSERT INTO `cms_forum_posts` VALUES (75, 22, 'iamlitasf', 'phprewrite', '15-06-2018 16:19:35', '', '', 14);
INSERT INTO `cms_forum_posts` VALUES (77, 17, 'Have you ever try in your server? I modified all of this, for the new PHP versions!', 'Miguel', '03-07-2018 16:45:44', '', '', NULL);
INSERT INTO `cms_forum_posts` VALUES (78, 21, 'Hello boy!', 'Miguel', '03-07-2018 16:47:17', '', '', NULL);
INSERT INTO `cms_forum_posts` VALUES (79, 18, 'the memories &lt;3', 'Leooo', '03-07-2018 18:23:47', '', '', NULL);
INSERT INTO `cms_forum_posts` VALUES (80, 18, 'I love this version &lt;3', 'Miguel', '04-07-2018 14:57:38', '', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_forum_threads
-- ----------------------------
DROP TABLE IF EXISTS `cms_forum_threads`;
CREATE TABLE `cms_forum_threads` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `title` varchar(30) NOT NULL,
  `author` varchar(25) NOT NULL,
  `date` varchar(35) NOT NULL,
  `lastpost_author` varchar(25) NOT NULL,
  `lastpost_date` varchar(35) NOT NULL,
  `views` int(11) NOT NULL,
  `posts` tinyint(4) NOT NULL,
  `unix` varchar(40) NOT NULL,
  `forumid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_forum_threads
-- ----------------------------
BEGIN;
INSERT INTO `cms_forum_threads` VALUES (17, 3, 'New discussion board - EDIT', 'Miguel', '25-09-2016 00:20:06', 'Miguel', '03-07-2018 16:45:44', 111, 6, '1530636344', 0);
INSERT INTO `cms_forum_threads` VALUES (18, 1, 'This is a new topic in a group', 'Miguel', '03-10-2016 03:48:46', 'Miguel', '04-07-2018 14:57:38', 53, 3, '1530716258', 1);
INSERT INTO `cms_forum_threads` VALUES (20, 1, 'bigièg', 'mercuryfr', '10-09-2017 02:52:16', 'mercuryfr', '10-09-2017 02:52:16', 14, 0, '1505011936', 3);
INSERT INTO `cms_forum_threads` VALUES (21, 1, 'Oláaaaa', 'rtiag0', '23-05-2018 17:13:40', 'Miguel', '03-07-2018 16:47:17', 6, 1, '1530636437', 13);
INSERT INTO `cms_forum_threads` VALUES (22, 1, 'iamlitasf', 'phprewrite', '15-06-2018 16:19:35', 'phprewrite', '15-06-2018 16:19:35', 3, 0, '1529079575', 14);
COMMIT;

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook`;
CREATE TABLE `cms_guestbook` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) DEFAULT NULL,
  `time` varchar(1000) DEFAULT NULL,
  `widget_id` int(10) DEFAULT NULL,
  `userid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_guestbook
-- ----------------------------
BEGIN;
INSERT INTO `cms_guestbook` VALUES (130, 'You&#039;re [b]the best[/b]!', '20-09-2016 10:57:08', 14, 1);
COMMIT;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `ip` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `message` mediumtext COLLATE latin1_general_ci NOT NULL,
  `date` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `picked_up` enum('0','1') COLLATE latin1_general_ci NOT NULL,
  `subject` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `roomid` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='HoloCMS';

-- ----------------------------
-- Table structure for cms_homes_catalouge
-- ----------------------------
DROP TABLE IF EXISTS `cms_homes_catalouge`;
CREATE TABLE `cms_homes_catalouge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `type` varchar(1) NOT NULL,
  `subtype` varchar(1) NOT NULL,
  `data` text NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '1',
  `category` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4575 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_homes_catalouge
-- ----------------------------
BEGIN;
INSERT INTO `cms_homes_catalouge` VALUES (2, 'Trax Sfx', '1', '0', 'trax_sfx', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (3, 'Trax Disco', '1', '0', 'trax_disco', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (4, 'Trax 8 bit', '1', '0', 'trax_8_bit', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (5, 'Trax Electro', '1', '0', 'trax_electro', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (6, 'Trax Reggae', '1', '0', 'trax_reggae', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (7, 'Trax Ambient', '1', '0', 'trax_ambient', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (8, 'Trax Bling', '1', '0', 'trax_bling', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (9, 'Trax Heavy', '1', '0', 'trax_heavy', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (10, 'Trax Latin', '1', '0', 'trax_latin', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (11, 'Trax Rock', '1', '0', 'trax_rock', 1, 1, '3');
INSERT INTO `cms_homes_catalouge` VALUES (12, 'Rain Background', '4', '0', 'bg_rain', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (13, 'Notes', '3', '0', 'stickienote', 2, 5, '29');
INSERT INTO `cms_homes_catalouge` VALUES (14, 'Serpentine Darkblue Background', '4', '0', 'bg_serpentine_darkblue', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (15, 'Serpentine Darkred Background 2', '4', '0', 'bg_serpntine_darkred', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (16, 'Serpentine Background', '4', '0', 'bg_serpentine_1', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (17, 'Serpentine  Background 2', '4', '0', 'bg_serpentine_2', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (18, 'Denim Background', '4', '0', 'bg_denim', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (19, 'Lace Background', '4', '0', 'bg_lace', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (20, 'Stitched Background', '4', '0', 'bg_stitched', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (21, 'Wood Background', '4', '0', 'bg_wood', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (22, 'Cork Background', '4', '0', 'bg_cork', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (23, 'Stone Background', '4', '0', 'bg_stone', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (24, 'Pattern Bricks Background', '4', '0', 'bg_pattern_bricks', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (25, 'Ruled Paper Background', '4', '0', 'bg_ruled_paper', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (26, 'Grass Background', '4', '0', 'bg_grass', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (27, 'Hotel Background', '4', '0', 'bg_hotel', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (28, 'Bubble Background', '4', '0', 'bg_bubble', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (29, 'Pattern Bobbaskulls  Background', '4', '0', 'bg_pattern_bobbaskulls1', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (30, 'Pattern Space Background', '4', '0', 'bg_pattern_space', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (31, 'Image Submarine Background', '4', '0', 'bg_image_submarine', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (32, 'Metal Background 2', '4', '0', 'bg_metal2', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (33, 'Broken Glass Background', '4', '0', 'bg_broken_glass', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (34, 'Pattern Clouds Background', '4', '0', 'bg_pattern_clouds', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (35, 'Comic Background', '4', '0', 'bg_comic2', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (36, 'Pattern Floral Background 1', '4', '0', 'bg_pattern_floral_01', 3, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (37, 'A', '1', '0', 'a', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (38, 'B', '1', '0', 'b_2', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (39, 'C', '1', '0', 'c', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (40, 'D', '1', '0', 'd', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (41, 'E', '1', '0', 'e', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (42, 'F', '1', '0', 'f', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (43, 'G', '1', '0', 'g', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (44, 'H', '1', '0', 'h', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (45, 'I', '1', '0', 'i', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (46, 'J', '1', '0', 'j', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (47, 'K', '1', '0', 'k', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (48, 'L', '1', '0', 'l', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (49, 'M', '1', '0', 'm', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (50, 'N', '1', '0', 'n', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (51, 'O', '1', '0', 'o', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (52, 'P', '1', '0', 'p', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (53, 'Q', '1', '0', 'q', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (54, 'R', '1', '0', 'r', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (55, 'S', '1', '0', 's', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (56, 'T', '1', '0', 't', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (57, 'U', '1', '0', 'u', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (58, 'V', '1', '0', 'v', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (59, 'W', '1', '0', 'w', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (60, 'X', '1', '0', 'x', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (61, 'Y', '1', '0', 'y', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (62, 'Z', '1', '0', 'z', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (63, 'Bling Star', '1', '0', 'bling_star', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (64, 'Bling a', '1', '0', 'bling_a', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (65, 'Bling b', '1', '0', 'bling_b', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (66, 'Bling c', '1', '0', 'bling_c', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (67, 'Bling d', '1', '0', 'bling_d', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (68, 'Bling e', '1', '0', 'bling_e', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (69, 'Bling f', '1', '0', 'bling_f', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (70, 'Bling g', '1', '0', 'bling_g', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (71, 'Bling h', '1', '0', 'bling_h', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (72, 'Bling i', '1', '0', 'bling_i', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (73, 'Bling j', '1', '0', 'bling_j', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (74, 'Bling k', '1', '0', 'bling_k', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (75, 'Bling l', '1', '0', 'bling_l', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (76, 'Bling m', '1', '0', 'bling_m', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (77, 'Bling n', '1', '0', 'bling_n', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (78, 'Bling o', '1', '0', 'bling_o', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (79, 'Bling p', '1', '0', 'bling_p', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (80, 'Bling q', '1', '0', 'bling_q', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (81, 'Bling r', '1', '0', 'bling_r', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (82, 'Bling s', '1', '0', 'bling_s', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (83, 'Bling t', '1', '0', 'bling_t', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (84, 'Bling u', '1', '0', 'bling_u', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (85, 'Bling v', '1', '0', 'bling_v', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (86, 'Bling w', '1', '0', 'bling_w', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (87, 'Bling x', '1', '0', 'bling_x', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (88, 'Bling y', '1', '0', 'bling_y', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (89, 'Bling z', '1', '0', 'bling_z', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (90, 'Bling Underscore', '1', '0', 'bling_underscore', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (91, 'Bling Comma', '1', '0', 'bling_comma', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (92, 'Bling Dot', '1', '0', 'bling_dot', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (93, 'Bling Exclamation', '1', '0', 'bling_exclamation', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (94, 'Bling Question', '1', '0', 'bling_question', 1, 1, '6');
INSERT INTO `cms_homes_catalouge` VALUES (95, 'A with Circle', '1', '0', 'a_with_circle', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (96, 'A with Dots', '1', '0', 'a_with_dots', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (97, 'O with Dots', '1', '0', 'o_with_dots', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (98, 'Dot', '1', '0', 'dot', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (99, 'Acsent 1', '1', '0', 'acsent1', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (100, 'Acsent 2', '1', '0', 'acsent2', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (101, 'Underscore', '1', '0', 'underscore', 1, 1, '5');
INSERT INTO `cms_homes_catalouge` VALUES (103, 'Chain Horizontal', '1', '0', 'chain_horizontal', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (104, 'Chain Vertical', '1', '0', 'chain_vertical', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (105, 'Ruler Horizontal', '1', '0', 'ruler_horizontal', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (106, 'Ruler Vertical', '1', '0', 'ruler_vertical', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (107, 'Vine', '1', '0', 'vine', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (108, 'Vine 2', '1', '0', 'vine2', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (109, 'Leafs 1', '1', '0', 'leafs1', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (110, 'Leafs 2', '1', '0', 'leafs2', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (111, 'Sticker Zipper V Tile', '1', '0', 'sticker_zipper_v_tile', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (112, 'Sticker Zipper H Tile', '1', '0', 'sticker_zipper_h_tile', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (113, 'Sticker Zipper H Normal Lock', '1', '0', 'sticker_zipper_h_normal_lock', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (114, 'Sticker Zipper H Bobba Lock', '1', '0', 'sticker_zipper_h_bobba_lock', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (115, 'Sticker Zipper H End', '1', '0', 'sticker_zipper_h_end', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (116, 'Sticker Zipper V End', '1', '0', 'sticker_zipper_v_end', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (117, 'Sticker Zipper V Bobba Lock', '1', '0', 'sticker_zipper_v_bobba_lock', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (118, 'Sticker Zipper V Normal Lock', '1', '0', 'sticker_zipper_v_normal_lock', 1, 1, '7');
INSERT INTO `cms_homes_catalouge` VALUES (119, 'Wormhand', '1', '0', 'wormhand', 5, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (120, 'Sticker Gentleman', '1', '0', 'sticker_gentleman', 2, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (121, 'Chewed Bubblegum', '1', '0', 'chewed_bubblegum', 1, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (122, 'Cactus', '1', '0', 'sticker_cactus_anim', 2, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (123, 'Sticker Spaceduck', '1', '0', 'sticker_spaceduck', 1, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (124, 'Sticker Moonpig', '1', '0', 'sticker_moonpig', 2, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (125, 'Swimming Fish', '1', '0', 'swimming_fish', 2, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (126, 'Sticker Boxer', '1', '0', 'sticker_boxer', 2, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (127, 'Wunder Frank', '1', '0', 'wunderfrank', 1, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (128, 'Sticker Submarine', '1', '0', 'sticker_submarine', 2, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (129, 'Sticker Clown Anim', '1', '0', 'sticker_clown_anim', 2, 1, '8');
INSERT INTO `cms_homes_catalouge` VALUES (130, 'Bling Bling Stars', '1', '0', 'blingblingstars', 2, 1, '9');
INSERT INTO `cms_homes_catalouge` VALUES (131, 'Bling Hearts', '1', '0', 'blinghearts', 2, 1, '9');
INSERT INTO `cms_homes_catalouge` VALUES (132, 'Sticker Heartbeat', '1', '0', 'sticker_heartbeat', 2, 1, '9');
INSERT INTO `cms_homes_catalouge` VALUES (133, 'Sticker Catinabox', '1', '0', 'sticker_catinabox', 2, 1, '9');
INSERT INTO `cms_homes_catalouge` VALUES (134, 'Bear', '1', '0', 'bear', 2, 1, '9');
INSERT INTO `cms_homes_catalouge` VALUES (135, 'Gothic Draculacape', '1', '0', 'gothic_draculacape ', 3, 1, '10');
INSERT INTO `cms_homes_catalouge` VALUES (136, 'Evil Giant Bunny', '1', '0', 'evil_giant_bunny', 2, 1, '10');
INSERT INTO `cms_homes_catalouge` VALUES (137, 'Zombie Pupu', '1', '0', 'zombiepupu', 2, 1, '10');
INSERT INTO `cms_homes_catalouge` VALUES (138, 'Skeletor 1', '1', '0', 'skeletor_001', 2, 1, '10');
INSERT INTO `cms_homes_catalouge` VALUES (139, 'Skull', '1', '0', 'skull', 2, 1, '10');
INSERT INTO `cms_homes_catalouge` VALUES (140, 'Skull 2', '1', '0', 'skull2', 2, 1, '10');
INSERT INTO `cms_homes_catalouge` VALUES (141, 'Scubacapsule Anim', '1', '0', 'scubacapsule_anim', 2, 1, '10');
INSERT INTO `cms_homes_catalouge` VALUES (142, 'Bobbaskull', '1', '0', 'sticker_bobbaskull', 2, 1, '10');
INSERT INTO `cms_homes_catalouge` VALUES (143, 'Sticker Flower', '1', '0', 'sticker_flower1', 3, 5, '11');
INSERT INTO `cms_homes_catalouge` VALUES (144, 'Icecube Big', '1', '0', 'icecube_big', 3, 10, '11');
INSERT INTO `cms_homes_catalouge` VALUES (145, 'Leafs 2', '1', '0', 'leafs2', 5, 7, '11');
INSERT INTO `cms_homes_catalouge` VALUES (146, 'Vine 2', '1', '0', 'vine2', 3, 5, '11');
INSERT INTO `cms_homes_catalouge` VALUES (147, 'Chain Horizontal', '1', '0', 'chain_horizontal', 3, 5, '11');
INSERT INTO `cms_homes_catalouge` VALUES (148, 'Icecube Small', '1', '0', 'icecube_small', 3, 10, '11');
INSERT INTO `cms_homes_catalouge` VALUES (149, 'Sticker Arrow Up', '1', '0', 'sticker_arrow_up', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (150, 'Sticker Arrow Down', '1', '0', 'sticker_arrow_down', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (151, 'Sticker Arrow Left', '1', '0', 'sticker_arrow_left', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (152, 'Sticker Arrow Right', '1', '0', 'sticker_arrow_right', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (153, 'Sticker Pointing Hand 1', '1', '0', 'sticker_pointing_hand_1', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (154, 'Sticker Pointing Hand 2', '1', '0', 'sticker_pointing_hand_2', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (155, 'Sticker Pointing Hand 3', '1', '0', 'sticker_pointing_hand_3', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (156, 'Sticker Pointing Hand 4', '1', '0', 'sticker_pointing_hand_4', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (157, 'Nail 2', '1', '0', 'nail2', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (158, 'Nail 3', '1', '0', 'nail3', 2, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (159, 'Needle 1', '1', '0', 'needle_1', 1, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (160, 'Needle 2', '1', '0', 'needle_2', 1, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (161, 'Needle 3', '1', '0', 'needle_3', 1, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (162, 'Needle 4', '1', '0', 'needle_4', 1, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (163, 'Needle 5', '1', '0', 'needle_5', 1, 1, '12');
INSERT INTO `cms_homes_catalouge` VALUES (164, 'Grass Meadow', '1', '0', 'grass', 2, 1, '13');
INSERT INTO `cms_homes_catalouge` VALUES (165, 'Sticker Flower', '1', '0', 'sticker_flower1', 1, 1, '13');
INSERT INTO `cms_homes_catalouge` VALUES (166, 'Sticker Flower Big Yellow', '1', '0', 'sticker_flower_big_yellow', 1, 1, '13');
INSERT INTO `cms_homes_catalouge` VALUES (167, 'Sticker Flower Pink', '1', '0', 'sticker_flower_pink', 1, 1, '13');
INSERT INTO `cms_homes_catalouge` VALUES (168, 'Bobba badge', '1', '0', 'sticker_bobbaskull', 1, 1, '14');
INSERT INTO `cms_homes_catalouge` VALUES (169, 'I love Coffee', '1', '0', 'i_love_coffee', 1, 1, '14');
INSERT INTO `cms_homes_catalouge` VALUES (170, 'Sticker Effect Bam', '1', '0', 'sticker_effect_bam', 1, 1, '14');
INSERT INTO `cms_homes_catalouge` VALUES (171, 'Sticker Effect Burp', '1', '0', 'sticker_effect_burp', 1, 1, '14');
INSERT INTO `cms_homes_catalouge` VALUES (172, 'Sticker Effect Woosh', '1', '0', 'sticker_effect_woosh', 1, 1, '14');
INSERT INTO `cms_homes_catalouge` VALUES (173, 'Sticker Effect Zap', '1', '0', 'sticker_effect_zap', 1, 1, '14');
INSERT INTO `cms_homes_catalouge` VALUES (174, 'Sticker Effect Whoosh 2', '1', '0', 'sticker_effect_whoosh2', 1, 1, '14');
INSERT INTO `cms_homes_catalouge` VALUES (175, 'Icecube Small', '1', '0', 'icecube_small', 1, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (176, 'Snowball Machine', '1', '0', 'ss_snowballmachine', 1, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (177, 'Icecube Big', '1', '0', 'icecube_big', 1, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (178, 'Bootsitjalapaset Red', '1', '0', 'bootsitjalapaset_red', 2, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (179, 'Boots and Gloves', '1', '0', 'ss_bootsitjalapaset_blue', 2, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (180, 'Red SnowStorm Costume', '1', '0', 'ss_costume_red', 2, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (181, 'Snowstorm Blue Costume', '1', '0', 'ss_costume_blue', 2, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (182, 'Splash!', '1', '0', 'ss_hits_by_snowball', 1, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (183, 'SnowStorm Duck!', '1', '0', 'extra_ss_duck_left', 1, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (184, 'Snowtree', '1', '0', 'ss_snowtree', 2, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (185, 'SnowStorm Duck!', '1', '0', 'extra_ss_duck_right', 1, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (186, 'Snowman', '1', '0', 'ss_snowman', 2, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (187, 'Lumihiutale', '1', '0', 'ss_snowflake2', 1, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (188, 'Snow Queen', '1', '0', 'ss_snowqueen', 2, 1, '15');
INSERT INTO `cms_homes_catalouge` VALUES (189, 'Battle 1', '1', '0', 'battle1', 1, 1, '16');
INSERT INTO `cms_homes_catalouge` VALUES (190, 'Battle 3', '1', '0', 'battle3', 1, 1, '16');
INSERT INTO `cms_homes_catalouge` VALUES (191, 'HC Hat', '1', '0', 'hc_hat', 5, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (192, 'Eye Left', '1', '0', 'eyeleft', 2, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (193, 'Eye Right', '1', '0', 'eyeright', 2, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (194, 'Angel Wings', '1', '0', 'angelwings_anim', 3, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (195, 'Sticker Gurubeard Gray', '1', '0', 'sticker_gurubeard_gray', 1, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (196, 'Sticker Gurubeard Brown', '1', '0', 'sticker_gurubeard_brown', 1, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (197, 'Supernerd', '1', '0', 'sticker_glasses_supernerd', 1, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (198, 'Goofy Glasses', '1', '0', 'sticker_glasses_elton', 1, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (199, 'Blue Eyes', '1', '0', 'sticker_eyes_blue', 1, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (200, 'Sticker Eye Anim', '1', '0', 'sticker_eye_anim', 2, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (201, 'Sticker Eye Evil Anim', '1', '0', 'sticker_eye_evil_anim', 2, 1, '18');
INSERT INTO `cms_homes_catalouge` VALUES (202, 'Sticker Eraser', '1', '0', 'sticker_eraser', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (203, 'Star', '1', '0', 'star', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (204, 'Sticker Pencil', '1', '0', 'sticker_pencil', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (205, 'Sticker Dreamer', '1', '0', 'sticker_dreamer', 3, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (206, 'Sticker Pencil 2', '1', '0', 'sticker_pencil_2', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (207, 'Sticker Lonewolf', '1', '0', 'sticker_lonewolf', 3, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (208, 'Sticker Prankster', '1', '0', 'sticker_prankster', 3, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (209, 'Sticker Prankster', '1', '0', 'sticker_prankster', 3, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (210, 'Sticker Romantic', '1', '0', 'sticker_romantic', 3, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (211, 'Redlamp', '1', '0', 'redlamp', 2, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (212, 'Lightbulb', '1', '0', 'lightbulb', 2, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (213, 'Bullet 1', '1', '0', 'bullet1', 2, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (214, 'Spill 1', '1', '0', 'spill1', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (215, 'Spill 2', '1', '0', 'spill2', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (216, 'Spill 3', '1', '0', 'spill3', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (217, 'Sticker Coffee Stain', '1', '0', 'sticker_coffee_stain', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (218, 'Sticker Hole', '1', '0', 'sticker_hole', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (219, 'Sticker Flames', '1', '0', 'sticker_flames', 2, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (220, 'Paper Clip 1', '1', '0', 'paper_clip_1', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (221, 'Paper Clip 2', '1', '0', 'paper_clip_2', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (222, 'Paper Clip 3', '1', '0', 'paper_clip_3', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (223, 'Highlighter 1', '1', '0', 'highlighter_1', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (224, 'Highlighter Mark 5', '1', '0', 'highlighter_mark5', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (225, 'Highlighter Mark 6', '1', '0', 'highlighter_mark6', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (226, 'Highlighter Mark 4', '1', '0', 'highlighter_mark4b', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (227, 'Highlighter 2', '1', '0', 'highlighter_2', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (228, 'Highlighter Mark 1', '1', '0', 'highlighter_mark1', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (229, 'Highlighter Mark 2', '1', '0', 'highlighter_mark2', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (230, 'Highlighter Mark 3', '1', '0', 'highlighter_mark3', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (231, 'Plaster', '1', '0', 'plaster1', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (232, 'Plaster 2', '1', '0', 'plaster2', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (233, 'Sticker Croco', '1', '0', 'sticker_croco', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (234, 'Fish', '1', '0', 'fish', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (235, 'Parrot', '1', '0', 'parrot', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (236, 'Sticker Sleeping Habbo', '1', '0', 'sticker_sleeping_habbo', 2, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (237, 'Burger', '1', '0', 'burger', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (238, 'Juice', '1', '0', 'juice', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (239, 'Sticker Coffee Steam Blue', '1', '0', 'sticker_coffee_steam_blue', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (240, 'Sticker Coffee Steam Grey', '1', '0', 'sticker_coffee_steam_grey', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (241, 'Cassette 1', '1', '0', 'cassette1', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (242, 'Cassette 2', '1', '0', 'cassette2', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (243, 'Cassette 3', '1', '0', 'cassette3', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (244, 'Cassette 4', '1', '0', 'cassette4', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (245, 'Football', '1', '0', 'football', 1, 1, '20');
INSERT INTO `cms_homes_catalouge` VALUES (246, 'Pattern Floral Background 2', '4', '0', 'bg_pattern_floral_02', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (247, 'Pattern Floral Background 3', '4', '0', 'bg_pattern_floral_03', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (248, 'Pattern Cars Background', '4', '0', 'bg_pattern_cars', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (249, 'Pattern Carpants Background', '4', '0', 'bg_pattern_carpants', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (250, 'Pattern Plasto Background', '4', '0', 'bg_pattern_plasto', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (251, 'Pattern Tinyroom Background', '4', '0', 'bg_pattern_tinyroom', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (252, 'Pattern Hearts Background', '4', '0', 'bg_pattern_hearts', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (253, 'Pattern Abstract Background', '4', '0', 'bg_pattern_abstract1', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (254, 'Bathroom Tile Background', '4', '0', 'bg_bathroom_tile', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (255, 'Pattern Fish Background', '4', '0', 'bg_pattern_fish', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (256, 'Pattern Deepred Background', '4', '0', 'bg_pattern_deepred', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (257, 'Colour 02 Background', '4', '0', 'bg_colour_02', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (258, 'Colour 03 Background', '4', '0', 'bg_colour_03', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (259, 'Colour 04 Background', '4', '0', 'bg_colour_04', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (260, 'Colour 05 Background', '4', '0', 'bg_colour_05', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (261, 'Colour 06 Background', '4', '0', 'bg_colour_06', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (262, 'Colour 07 Background', '4', '0', 'bg_colour_07', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (263, 'Colour 08 Background', '4', '0', 'bg_colour_08', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (264, 'Colour 09 Background', '4', '0', 'bg_colour_09', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (265, 'Colour 10 Background', '4', '0', 'bg_colour_10', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (266, 'Colour 11 Background', '4', '0', 'bg_colour_11', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (267, 'Colour 12 Background', '4', '0', 'bg_colour_12', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (268, 'Colour 13 Background', '4', '0', 'bg_colour_13', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (269, 'Colour 14 Background', '4', '0', 'bg_colour_14', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (270, 'Colour 15 Background', '4', '0', 'bg_colour_15', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (271, 'Colour 17 Background', '4', '0', 'bg_colour_17', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (272, 'Tonga Background', '4', '0', 'bg_tonga', 2, 1, '27');
INSERT INTO `cms_homes_catalouge` VALUES (275, 'Alhambra Group', '4', '0', 'alhambragroup', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (276, 'Themepark Background 1', '4', '0', 'themepark_bg_01', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (277, 'Themepark Background 2', '4', '0', 'themepark_bg_02', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (278, 'Unofficial Fansites Background', '4', '0', 'bg_unofficial_fansites', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (279, 'Official Fansites Background', '4', '0', 'bg_official_fansites2', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (280, 'Welcoming Party', '4', '0', 'welcoming_party', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (281, 'Random Habbos', '4', '0', 'random_habbos', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (282, 'Habborella Sea Background', '4', '0', 'habborella_sea_bg', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (283, 'Penelope', '4', '0', 'penelope', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (284, 'Orca', '4', '0', 'orca', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (285, 'Sttrinians Group', '4', '0', 'sttriniansgroup', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (286, 'Sttrinians Blackboard', '4', '0', 'sttriniansblackboard', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (287, 'Habbox Background', '4', '0', 'habbox', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (288, 'Christmas Background 2 ', '4', '0', 'christmas2007bg_001', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (289, 'Kerrang', '4', '0', 'bg_kerrang2', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (291, 'Voice of Teens Background', '4', '0', 'bg_voiceofteens', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (292, 'Makeover Background', '4', '0', 'makeover', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (293, 'Snowstorm Background', '4', '0', 'snowstorm_bg', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (294, 'Habbo Group Background', '4', '0', 'habbogroup', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (295, 'Wobble Squabble Background', '4', '0', 'bg_wobble_squabble', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (296, 'VIP Background', '4', '0', 'bg_vip', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (297, 'Lido Background', '4', '0', 'bg_lidoo', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (298, 'Lido Flat Background', '4', '0', 'bg_lido_flat', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (299, 'Infobus Yellow Background', '4', '0', 'bg_infobus_yellow', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (300, 'Infobus White Background', '4', '0', 'bg_infobus_white', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (301, 'Infobus Blue Background', '4', '0', 'bg_infobus_blue', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (302, 'Battle Ball Background 2', '4', '0', 'bg_battle_ball2', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (303, 'Grunge Background', '4', '0', 'grungewall', 0, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (1001, 'OB Clubber', '1', '0', 'ob_clubber_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1002, 'OB Devil', '1', '0', 'ob_devil_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1003, 'OB Doctor', '1', '0', 'ob_doctor_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1004, 'OB Fairy', '1', '0', 'ob_fairy_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1005, 'OB Jetsetter', '1', '0', 'ob_jetsetter_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1006, 'OB Misuniverse', '1', '0', 'ob_misuniverse_146x146', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1007, 'OB Shopaholic', '1', '0', 'ob_shopaholic_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1008, 'OB Sport', '1', '0', 'ob_sporty_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1009, 'Edynamic Animator Sticker', '1', '0', 'edynamic_animator_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1010, 'Edynamic Sticker Avatar', '1', '0', 'edynamic_sticker_avatar', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1011, 'Sticker Themepark', '1', '0', '27224_sticker_themepark_001', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1012, '3 Year .ca', '1', '0', '3yearca', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1013, 'A', '1', '0', 'a', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1014, 'A with Circle', '1', '0', 'a_with_circle', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1015, 'A with Dots', '1', '0', 'a_with_dots', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1017, 'Acento', '1', '0', 'acento', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1018, 'Acentoagudo', '1', '0', 'acentoagudo', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1023, 'Acma Notepad Background', '1', '0', 'acma_notepad_bg_lge', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1026, 'Acsent 1', '1', '0', 'acsent1', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1027, 'Acsent 2', '1', '0', 'acsent2', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1028, 'Ad Cats', '1', '0', 'adcats', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1029, 'Ad Dogs', '1', '0', 'addogs', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1030, 'Ad Holiday', '1', '0', 'adholiday', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1031, 'Adidabounce Sticker', '1', '0', 'adidabounce_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1032, 'Ad Party', '1', '0', 'adparty', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1033, 'Ad Skating', '1', '0', 'adskating', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1034, 'Agudo', '1', '0', 'agudo', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1035, 'Alhambra Sticker', '1', '0', 'alhambra_sticker', 2, 1, '205');
INSERT INTO `cms_homes_catalouge` VALUES (1036, 'Alhambra Wallsticker', '1', '0', 'alhambra_wallsticker', 2, 1, '205');
INSERT INTO `cms_homes_catalouge` VALUES (1037, 'Alhambra Logo', '1', '0', 'alhambralogo', 2, 1, '205');
INSERT INTO `cms_homes_catalouge` VALUES (1039, 'Ametrin', '1', '0', 'ametrin', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1040, 'Angel', '1', '0', 'angel_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1041, 'Angel Winganim', '1', '0', 'angelwinganim', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1043, 'Anim Appart 732', '1', '0', 'anim_appart_732', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1044, 'Anim Boule Cristal', '1', '0', 'anim_boule_cristal', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1045, 'Anim Brasero', '1', '0', 'anim_brasero', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1046, 'Anim Cook', '1', '0', 'anim_cook', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1047, 'Anim Elvis', '1', '0', 'anim_elvis', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1048, 'Anim Enseigne', '1', '0', 'anim_enseigne', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1049, 'Anim Hockey', '1', '0', 'anim_hockey', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1051, 'Anim Oeil', '1', '0', 'anim_oeil', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1052, 'Anim Ventilo', '1', '0', 'anim_ventilo', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1053, 'Anim Viking Hole', '1', '0', 'anim_viking_hole', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1054, 'Anti Eco', '1', '0', 'anti_eco', 2, 1, '235');
INSERT INTO `cms_homes_catalouge` VALUES (1055, 'Aprilfool 08', '1', '0', 'aprilfool08', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1056, 'Aprilfool 08 2', '1', '0', 'aprilfool08_2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1057, 'Argentina', '1', '0', 'argentina', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1058, 'Asterisco 1', '1', '0', 'asterisco1', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1059, 'AU 3rd Bday 1', '1', '0', 'au_3rdbday_01', 2, 1, '206');
INSERT INTO `cms_homes_catalouge` VALUES (1060, 'AU 3rd Bday 2', '1', '0', 'au_3rdbday_02', 2, 1, '206');
INSERT INTO `cms_homes_catalouge` VALUES (1061, 'AU 3rd Bday 3', '1', '0', 'au_3rdbday_03', 2, 1, '206');
INSERT INTO `cms_homes_catalouge` VALUES (1062, 'AU Greengold', '1', '0', 'au_greengold', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1063, 'AU Lifesaver', '1', '0', 'au_lifesaver', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1064, 'AU Surfing', '1', '0', 'au_surfing', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1065, 'B', '1', '0', 'b', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1067, 'Ballsma Honey', '1', '0', 'ballsmahoney', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1068, 'Baltasar', '1', '0', 'baltasar', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1069, 'Banks Bobby', '1', '0', 'banksbobby', 2, 1, '236');
INSERT INTO `cms_homes_catalouge` VALUES (1070, 'Banks Can', '1', '0', 'bankscan', 2, 1, '236');
INSERT INTO `cms_homes_catalouge` VALUES (1071, 'Banks Door', '1', '0', 'banksdoor', 2, 1, '236');
INSERT INTO `cms_homes_catalouge` VALUES (1072, 'Banks Heater', '1', '0', 'banksheater', 2, 1, '236');
INSERT INTO `cms_homes_catalouge` VALUES (1073, 'Barbequeset', '1', '0', 'barbequeset', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1074, 'Barra', '1', '0', 'barra', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1075, 'Bartender Costume', '1', '0', 'bartender_costume', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1076, 'Batista', '1', '0', 'batista', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1077, 'Battle 1', '1', '0', 'battle1', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1078, 'Battle 3', '1', '0', 'battle3', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1079, 'Beachbunny Beachball', '1', '0', 'beachbunny_beachball', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1080, 'Beachbunny Beachball Bouncing', '1', '0', 'beachbunny_beachball_bouncing', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1081, 'Beachbunny Bmovie Poster', '1', '0', 'beachbunny_bmovieposter', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1082, 'Beachbunny Bunny Suit', '1', '0', 'beachbunny_bunny_suit', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1083, 'Beachbunny Peep', '1', '0', 'beachbunny_peep', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1084, 'Beachbunny Roaster Bunny', '1', '0', 'beachbunny_roaster_bunny', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1085, 'Beachgirl', '1', '0', 'beachgirl_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1086, 'Bear', '1', '0', 'bear', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (1087, 'Bellydancer', '1', '0', 'bellydancer', 2, 1, '205');
INSERT INTO `cms_homes_catalouge` VALUES (1088, 'Beth Phoenix', '1', '0', 'bethphoenix', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1089, 'Beth Phoenix Skinny', '1', '0', 'bethphoenixskinny', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1090, 'Groupinfo Background', '1', '0', 'bg_groupinfo', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1092, 'Big Daddy V', '1', '0', 'bigdaddyv', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1093, 'Big Show', '1', '0', 'bigshow', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1094, 'Billy Graham', '1', '0', 'billygraham', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1095, 'Bird Suit', '1', '0', 'bird_suit', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1096, 'Bling a', '1', '0', 'bling_a', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1097, 'Bling b', '1', '0', 'bling_b', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1098, 'Bling c', '1', '0', 'bling_c', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1099, 'Bling Comma', '1', '0', 'bling_comma', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1100, 'Bling d', '1', '0', 'bling_d', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1101, 'Bling Dot', '1', '0', 'bling_dot', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1102, 'Bling e', '1', '0', 'bling_e', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1103, 'Bling Exclamation', '1', '0', 'bling_exclamation', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1104, 'Bling f', '1', '0', 'bling_f', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1105, 'Bling g', '1', '0', 'bling_g', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1106, 'Bling h', '1', '0', 'bling_h', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1107, 'Bling i', '1', '0', 'bling_i', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1108, 'Bling j', '1', '0', 'bling_j', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1109, 'Bling k', '1', '0', 'bling_k', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1110, 'Bling l', '1', '0', 'bling_l', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1111, 'Bling Line', '1', '0', 'bling_line', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1112, 'Bling m', '1', '0', 'bling_m', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1113, 'Bling n', '1', '0', 'bling_n', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1114, 'Bling o', '1', '0', 'bling_o', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1115, 'Bling p', '1', '0', 'bling_p', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1116, 'Bling q', '1', '0', 'bling_q', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1117, 'Bling Question', '1', '0', 'bling_question', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1118, 'Bling r', '1', '0', 'bling_r', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1119, 'Bling s', '1', '0', 'bling_s', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1120, 'Bling Star', '1', '0', 'bling_star', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1121, 'Bling t', '1', '0', 'bling_t', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1122, 'Bling u', '1', '0', 'bling_u', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1123, 'Bling Underscore', '1', '0', 'bling_underscore', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1124, 'Bling v', '1', '0', 'bling_v', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1125, 'Bling w', '1', '0', 'bling_w', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1126, 'Bling x', '1', '0', 'bling_x', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1127, 'Bling y', '1', '0', 'bling_y', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1128, 'Bling z', '1', '0', 'bling_z', 2, 1, '211');
INSERT INTO `cms_homes_catalouge` VALUES (1129, 'Bling Bling Stars', '1', '0', 'blingblingstars', 2, 1, '237');
INSERT INTO `cms_homes_catalouge` VALUES (1130, 'Bling Hearts', '1', '0', 'blinghearts', 2, 1, '237');
INSERT INTO `cms_homes_catalouge` VALUES (1131, 'Bling Heartp', '1', '0', 'blingheartp', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1132, 'Blue Hockey Stick', '1', '0', 'bluehockeystick', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1133, 'Blue Starfish', '1', '0', 'bluestarfish', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1134, 'Bobba Curse', '1', '0', 'bobbacurse', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1136, 'Boborton', '1', '0', 'boborton', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1137, 'Bonbon Duck', '1', '0', 'bonbon_duck_146x146', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1138, 'Bonbon Mouse', '1', '0', 'bonbon_mouse_146x146', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1139, 'Bonbon Rat', '1', '0', 'bonbon_rat_146x146', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1140, 'Boogeyman', '1', '0', 'boogeyman', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1141, 'Bootsitjalapaset Red', '1', '0', 'bootsitjalapaset_red', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1142, 'Bottes Bleu', '1', '0', 'bottesbleu', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1143, 'Bouledeneige', '1', '0', 'bouledeneige', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1144, 'Bowser Sticker v1', '1', '0', 'bowser_sticker_v1', 2, 1, '212');
INSERT INTO `cms_homes_catalouge` VALUES (1145, 'Bozzanova', '1', '0', 'bozzanova', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1146, 'BRA Football Guest 2', '1', '0', 'bra_football_guest2', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1147, 'Bratz Featured Clique', '1', '0', 'bratz_featuredclique', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1148, 'Brian Kendrick', '1', '0', 'briankendrick', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1149, 'British Legion', '1', '0', 'britishlegion', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1150, 'Britney', '1', '0', 'britney', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1151, 'Bronze Medallion', '1', '0', 'bronzemedallion', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1152, 'Bullet 1', '1', '0', 'bullet1', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1153, 'Bullybuster', '1', '0', 'bullybuster', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1155, 'Burger', '1', '0', 'burger', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1156, 'Businesswoman', '1', '0', 'businesswoman_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1157, 'Butterfly', '1', '0', 'butterfly_01', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1158, 'C', '1', '0', 'c', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1159, 'CA Hockeygoalie 2', '1', '0', 'ca_hockeygoalie2', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1160, 'Camel', '1', '0', 'camel', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1162, 'Candice Michelle', '1', '0', 'candicemichelle', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1163, 'Candycorn', '1', '0', 'candycorn', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1164, 'Carlito', '1', '0', 'carlito', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1165, 'Cassette 1', '1', '0', 'cassette1', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1166, 'Cassette 2', '1', '0', 'cassette2', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1167, 'Cassette 3', '1', '0', 'cassette3', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1168, 'Cassette 4', '1', '0', 'cassette4', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1170, 'Celeb Ticket Veronicas', '1', '0', 'celebticket_veronicas', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1171, 'Cena', '1', '0', 'cena', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1172, 'Chain Horizontal', '1', '0', 'chain_horizontal', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (1173, 'Chain Vertical', '1', '0', 'chain_vertical', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (1174, 'Cheerleader', '1', '0', 'cheerleader_146x146', 2, 1, '201');
INSERT INTO `cms_homes_catalouge` VALUES (1175, 'Cheese Badge', '1', '0', 'cheese_badge', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1177, 'Cheese Suit Sticker', '1', '0', 'cheese_suit_sticker', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1178, 'Cheshirecat', '1', '0', 'cheshirecat', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1179, 'Chewed Bubblegum', '1', '0', 'chewed_bubblegum', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1180, 'Chile', '1', '0', 'chile', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1181, 'Chocolates', '1', '0', 'chocolates', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1183, 'Chris Jericho', '1', '0', 'chrisjericho', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1184, 'Chuck Palumbo', '1', '0', 'chuckpalumbo', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1185, 'Clothes line', '1', '0', 'clothesline', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1186, 'Clothes line 5', '1', '0', 'clothesline5', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1187, 'CM Punk', '1', '0', 'cmpunk', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1188, 'CN Teleskull', '1', '0', 'cn_teleskull', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1190, 'CNY Dragon Body L', '1', '0', 'cny_dragon_body_l', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1191, 'CNY Dragon Body R', '1', '0', 'cny_dragon_body_r', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1192, 'CNY Dragon Head L', '1', '0', 'cny_dragon_head_l', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1193, 'CNY Dragon Head R', '1', '0', 'cny_dragon_head_r', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1195, 'CNY Kunfu Dude', '1', '0', 'cny_kunfu_dude', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1197, 'CNY Kunfu Girl', '1', '0', 'cny_kungfu_girl', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1198, 'Colombia', '1', '0', 'colombia', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1199, 'Comma', '1', '0', 'comma', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1203, 'Crase', '1', '0', 'crase', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1205, 'Cube Deglace', '1', '0', 'cubedeglace', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1206, 'Curt Hawkins', '1', '0', 'curthawkins', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1207, 'D', '1', '0', 'd', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1208, 'Dag of Habbo Trophy', '1', '0', 'dagofhabbo_trophy', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1209, 'DagorNot', '1', '0', 'dagornot', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1210, 'DE 4th Bday', '1', '0', 'de_bday_4', 2, 1, '206');
INSERT INTO `cms_homes_catalouge` VALUES (1211, 'Deal Girasoles', '1', '0', 'dealgirasoles', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1214, 'Deal easter 6', '1', '0', 'deal_eas07_6', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1215, 'Deal easter 7', '1', '0', 'deal_eas07_7', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1216, 'Deal easter 8', '1', '0', 'deal_eas07_8', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1217, 'Deal goth border Horizontale', '1', '0', 'deal_goth_border_hor', 2, 1, '219');
INSERT INTO `cms_homes_catalouge` VALUES (1218, 'deal goth border Verticale', '1', '0', 'deal_goth_border_ver', 2, 1, '219');
INSERT INTO `cms_homes_catalouge` VALUES (1219, 'DH Smith', '1', '0', 'dhsmith', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1220, 'Dia de Internetsticker 2008', '1', '0', 'diadeinternetsticker2008_001', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1221, 'Diamond Reward', '1', '0', 'diamond_reward', 2, 1, '237');
INSERT INTO `cms_homes_catalouge` VALUES (1222, 'Dim Sims', '1', '0', 'dimsims', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1223, 'DK Bobbacurse 2', '1', '0', 'dk_bobbacurse_2', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1224, 'Doelee', '1', '0', 'doelee', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1225, 'Donk', '1', '0', 'donk', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1226, 'Dot', '1', '0', 'dot', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1227, 'Dudesons', '1', '0', 'dudesons', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1228, 'Durian', '1', '0', 'durian', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1230, 'E', '1', '0', 'e', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1231, 'Easter Bird', '1', '0', 'easter_bird', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1236, 'Easter Broomstick_001', '1', '0', 'easter_broomstick_001', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1238, 'Easter Bunnymoped', '1', '0', 'easter_bunnymoped', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1240, 'Easter Carrot_rocket', '1', '0', 'easter_carrot_rocket', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1251, 'Easter Pointyhat', '1', '0', 'easter_pointyhat', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1253, 'Easter Rabbit_in_hole', '1', '0', 'easter_rabbit_in_hole', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1255, 'Easter Egg Costume', '1', '0', 'easteregg_costume', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1258, 'Edge', '1', '0', 'edge', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1259, 'Edito Fisherman Bait', '1', '0', 'edito_fisherman_bait', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1260, 'Edito Logo', '1', '0', 'edito_logo', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1261, 'Edito Logo 1', '1', '0', 'edito_logo_001', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1262, 'Edito Petit Talingots', '1', '0', 'edito_petit_talingots', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1263, 'Eggs', '1', '0', 'eggs', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1264, 'Elegant Bling', '1', '0', 'elegant_bling', 2, 1, '237');
INSERT INTO `cms_homes_catalouge` VALUES (1265, 'Elijah Burke', '1', '0', 'elijahburke', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1266, 'E4 Years', '1', '0', 'e4_years', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1267, 'Educk Sticker', '1', '0', 'educk_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1268, 'Evil Easter Bunny', '1', '0', 'evil_easterbunny', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1269, 'Evil Giant Bunny', '1', '0', 'evil_giant_bunny', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1270, 'Exclamation', '1', '0', 'exclamation', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1271, 'Executive Cheappen', '1', '0', 'exe_sticker_cheappen', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1272, 'Executive Luxurypen', '1', '0', 'exe_sticker_luxurypen', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1273, 'Extra Sduck Left', '1', '0', 'extra_sduck_left', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1274, 'Extra Sduck Right', '1', '0', 'extra_sduck_right', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1275, 'Extra Ssnowball', '1', '0', 'extra_ssnowball', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1276, 'Extreme Dudesons', '1', '0', 'extreme_dudesons', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1277, 'Eye Left', '1', '0', 'eyeleft', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1278, 'Eye Right', '1', '0', 'eyeright', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1279, 'F', '1', '0', 'f', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1280, 'Fantastic Four Logo', '1', '0', 'fantasticfourlogo', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1281, 'Featuredgroup', '1', '0', 'featuredgroup', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (1283, 'Featuredgroup Sticker', '1', '0', 'featuredgroup_sticker', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (1284, 'Felix 1', '1', '0', 'felix01', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1285, 'Felix 2', '1', '0', 'felix02', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1286, 'Felix 3', '1', '0', 'felix03b', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1289, 'Festus', '1', '0', 'festus', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1290, 'Fikoirakisu', '1', '0', 'fikoirakisu', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1291, 'FI Golden Snake', '1', '0', 'fi_golden_snake', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1292, 'FI Koirakisu 2', '1', '0', 'fi_koirakisu2', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1293, 'FI Mino', '1', '0', 'fi_mino', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1294, 'FI Posti Box', '1', '0', 'fi_posti_box', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1295, 'FI Posti Girl', '1', '0', 'fi_posti_girl', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1296, 'FI Rasmu 2', '1', '0', 'fi_rasmu2_194x130', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1297, 'Fieldberries', '1', '0', 'fieldberries', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1298, 'Fiesta Chica Tampax', '1', '0', 'fiesta_chica_tampax', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1299, 'Fiesta Minifalda 1', '1', '0', 'fiesta_minifalda_1', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1300, 'Fiesta Minifalda 2', '1', '0', 'fiesta_minifalda_2', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1301, 'Fiesta Welcome', '1', '0', 'fiesta_welcome', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1302, 'Filmstrip Corner Botleft', '1', '0', 'filmstrip_corner_botleft', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1303, 'Filmstrip Corner Botright', '1', '0', 'filmstrip_corner_botright', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1304, 'Filmstrip Corner Topleft', '1', '0', 'filmstrip_corner_topleft', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1305, 'Filmstrip Corner Topright', '1', '0', 'filmstrip_corner_topright', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1306, 'Filmstrip Horiz', '1', '0', 'filmstrip_horiz', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1307, 'Filmstrip Vert', '1', '0', 'filmstrip_vert', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1308, 'Finger Push', '1', '0', 'finger_push', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1309, 'Fish', '1', '0', 'fish', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1310, 'Flameskull', '1', '0', 'flameskull', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1311, 'Flower 1', '1', '0', 'flower1png', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1312, 'Flower 2', '1', '0', 'flower2', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1313, 'Football', '1', '0', 'football', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1314, 'Free Hugs', '1', '0', 'free_hugs', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1317, 'Funaki', '1', '0', 'funaki', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1318, 'FWRK Blue', '1', '0', 'fwrk_blue', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1319, 'FWRK Pink', '1', '0', 'fwrk_pink', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1320, 'FWRK Yellow', '1', '0', 'fwrk_yellow', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1321, 'G', '1', '0', 'g', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1322, 'Galasticker', '1', '0', 'galasticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1323, 'Gamask', '1', '0', 'gamask', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1324, 'Gaspar', '1', '0', 'gaspar', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1325, 'Gaur', '1', '0', 'gaur', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1327, 'Gaursticker 3', '1', '0', 'gaursticker3', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1328, 'Genie Fire Head', '1', '0', 'genie_fire_head', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1330, 'Girlfriend Blue', '1', '0', 'gf_hotornot_blue', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1331, 'Girlfriend Pink', '1', '0', 'gf_hotornot_pink', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1332, 'Global World Sticker', '1', '0', 'globalw_sticker', 2, 1, '235');
INSERT INTO `cms_homes_catalouge` VALUES (1333, 'Global World Sticker 2', '1', '0', 'globalw_sticker_001', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1334, 'Global World Tstorieoldweb', '1', '0', 'globalw_tstorieoldweb', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1335, 'Gold Medallion', '1', '0', 'goldmedallion', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1336, 'Gorilla Hand', '1', '0', 'gorilla_hand', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1337, 'Gorilla Hand 1', '1', '0', 'gorillahand1', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1338, 'Gorilla Hand 2', '1', '0', 'gorillahand2', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1344, 'Gothic Draculacape', '1', '0', 'gothic_draculacape', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1346, 'Gothic Scienceplatform', '1', '0', 'gothic_scienceplatform', 2, 1, '219');
INSERT INTO `cms_homes_catalouge` VALUES (1348, 'GP Logo White', '1', '0', 'gplogo_white', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1351, 'Gras Deal', '1', '0', 'grasdeal', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1352, 'Grave Sticker', '1', '0', 'gravesticker', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1353, 'Grave Sticker 2', '1', '0', 'gravesticker2', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1354, 'Green Hockey Stick', '1', '0', 'greenhockeystick', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1355, 'Greenpeace', '1', '0', 'greenpeace', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1356, 'Greenpeace Sticker', '1', '0', 'greenpeace_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1357, 'Greenpeace White', '1', '0', 'greenpeacewhite', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1359, 'Grossebouledeneige', '1', '0', 'grossebouledeneige', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1360, 'Grunge Polaroid 1', '1', '0', 'grunge_polaroid_1', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1361, 'Grunge Polaroid 2', '1', '0', 'grunge_polaroid_2', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1362, 'Grunge Polaroid 3', '1', '0', 'grunge_polaroid_3', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1363, 'Grunge Polaroid 4', '1', '0', 'grunge_polaroid_4', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1364, 'Grunge Polaroid 5', '1', '0', 'grunge_polaroid_5', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1365, 'Guard 1', '1', '0', 'guard1', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1366, 'Guard 2', '1', '0', 'guard2', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1367, 'Guccimama', '1', '0', 'guccimama', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1368, 'H', '1', '0', 'h', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1370, 'Habbo Island', '1', '0', 'habbo_island', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1371, 'Habbo Toolbar Sticker', '1', '0', 'habbo_toolbar_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1372, 'Habbo By Night-sticker', '1', '0', 'habbobynightsticker', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1373, 'Habbohome Of The Month', '1', '0', 'habbohome_of_the_month', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (1375, 'Habborella Logo', '1', '0', 'habborella_logo', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1376, 'Habboween Background', '1', '0', 'habboween_bg', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1377, 'Hacksaw', '1', '0', 'hacksaw', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1378, 'Hat Clown 2', '1', '0', 'hat_clown2', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1379, 'HC Hat', '1', '0', 'hc_hat', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1380, 'Highlighter 1', '1', '0', 'highlighter_1', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (1381, 'Highlighter 2', '1', '0', 'highlighter_2', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (1382, 'Highlighter Mark 1', '1', '0', 'highlighter_mark1', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (1383, 'Highlighter Mark 2', '1', '0', 'highlighter_mark2', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (1384, 'Highlighter Mark 3', '1', '0', 'highlighter_mark3', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (1385, 'Highlighter Mark 4', '1', '0', 'highlighter_mark4b', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (1386, 'Highlighter Mark 5', '1', '0', 'highlighter_mark5', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (1387, 'Highlighter Mark 6', '1', '0', 'highlighter_mark6', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (1388, 'Hockey Habbo', '1', '0', 'hockey_habbo', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1389, 'Hockeyref', '1', '0', 'hockeyref', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1390, 'Holycarp', '1', '0', 'holycarp', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1391, 'Homer', '1', '0', 'homer', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1392, 'Horizontalink', '1', '0', 'horizontalink', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (1393, 'Hornswoggle', '1', '0', 'hornswoggle', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1394, 'HP Guest', '1', '0', 'hp_guest', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1421, 'JP 5 Years', '1', '0', 'hwjp_5years', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1422, 'HW Lapanen Blue', '1', '0', 'hwlapanen_blue', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1423, 'HW Ssnowqueen', '1', '0', 'hwssnowqueen', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1424, 'HW Sticker Galafinal', '1', '0', 'hwsticker_galafinal', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1425, 'Valentine Cupido Anim', '1', '0', 'hwval_cupido_anim', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1426, 'Valentine Sticker Bobbadice', '1', '0', 'hwval_sticker_bobbadice', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1427, 'Xmas Box Suit Mint 2', '1', '0', 'hwxmabox_suit_mint2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1428, 'Xmas Cat Animated', '1', '0', 'hwxmacat_animated', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1429, '3d Glasses', '1', '0', 'hw_3d_glasses', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1430, 'Actionstar', '1', '0', 'hw_actionstar', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1431, 'Amp Big', '1', '0', 'hw_amp_big', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1432, 'Amp Small', '1', '0', 'hw_amp_small', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1433, 'Bartender Costume', '1', '0', 'hw_bartender_costume', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1434, 'Bassplayer Boy', '1', '0', 'hw_bassplayer_boy', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1435, 'Bassplayer Girl', '1', '0', 'hw_bassplayer_girl', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1437, 'Skull Background', '1', '0', 'hw_bgpattern_skull', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1438, 'Bigcamera', '1', '0', 'hw_bigcamera', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1439, 'Bouncers', '1', '0', 'hw_bouncers', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1440, 'Camera L', '1', '0', 'hw_camera_l', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1441, 'Camera R', '1', '0', 'hw_camera_r', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1442, 'Camopant L', '1', '0', 'hw_camopantl', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1443, 'Camopant R', '1', '0', 'hw_camopantr', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1444, 'Camopant R1', '1', '0', 'hw_camopantr1', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1445, 'Carpet Corner Down', '1', '0', 'hw_carpet_corner_down', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1446, 'Carpet Corner Up', '1', '0', 'hw_carpet_corner_up', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1447, 'Carpet End Ldown', '1', '0', 'hw_carpet_end_ldown', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1448, 'Carpet End Lup', '1', '0', 'hw_carpet_end_lup', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1449, 'Carpet End Rdown', '1', '0', 'hw_carpet_end_rdown', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1450, 'Carpet End Rup', '1', '0', 'hw_carpet_end_rup', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1451, 'Carpet L', '1', '0', 'hw_carpet_l', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1452, 'Carpet R', '1', '0', 'hw_carpet_r', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1453, 'Drummer Boy', '1', '0', 'hw_drummer_boy', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1454, 'Drummer Girl', '1', '0', 'hw_drummer_girl', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1455, 'Edito Logo', '1', '0', 'hw_edito_logo', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1456, 'Guitarplayer Black', '1', '0', 'hw_guitarplayer_black', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1457, 'Guitarplayer White', '1', '0', 'hw_guitarplayer_white', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1458, 'Hairspray', '1', '0', 'hw_hairspray', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1459, 'Hippie', '1', '0', 'hw_hippie', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1460, 'Hitcher', '1', '0', 'hw_hitcher', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1461, 'Inmate', '1', '0', 'hw_inmate', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1462, 'Kenny Burger', '1', '0', 'hw_kenny_burger', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1463, 'Kenny Fight', '1', '0', 'hw_kenny_fight', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1464, 'Kenny Shock', '1', '0', 'hw_kenny_shock', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1465, 'Keyboards', '1', '0', 'hw_keyboards', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1468, 'Logoanim', '1', '0', 'hw_logoanim', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1469, 'Mega Afro', '1', '0', 'hw_mega_afro', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1470, 'Microphone', '1', '0', 'hw_microphone', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1471, 'Moh Logo', '1', '0', 'hw_moh_logo', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1472, 'Shades', '1', '0', 'hw_shades', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1473, 'Speedobunny', '1', '0', 'hw_speedobunny', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1474, 'Valentine Love Costume', '1', '0', 'hw_val_sticker_love-costume', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1475, 'Veronicas', '1', '0', 'hw_veronicas', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1476, 'Habbowood Klaffi 1', '1', '0', 'hwood07klaffi2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1477, 'Habbowood Klaffi 2', '1', '0', 'hwood07_klaffi2', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1478, 'I', '1', '0', 'i', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1480, 'I love Bobba', '1', '0', 'i_love_bobba', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1481, 'I love Coffee', '1', '0', 'i_love_coffee', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1483, 'Icecube Big', '1', '0', 'icecube_big', 2, 1, '235');
INSERT INTO `cms_homes_catalouge` VALUES (1484, 'Icecube Small', '1', '0', 'icecube_small', 2, 1, '235');
INSERT INTO `cms_homes_catalouge` VALUES (1487, 'Impactsdeneige', '1', '0', 'impactsdeneige', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1488, 'Inked Antisquidf', '1', '0', 'inked_antisquidf', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1489, 'Inked Antisquidm', '1', '0', 'inked_antisquidm', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1490, 'Inked Antisquidrank', '1', '0', 'inked_antisquidrank', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1491, 'Inked Inkedblink', '1', '0', 'inked_inkedblink', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1492, 'Inked Lamp', '1', '0', 'inked_lamp', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1493, 'Inked Love', '1', '0', 'inked_love', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1494, 'Inked Poster', '1', '0', 'inked_poster', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1495, 'Inked Ship', '1', '0', 'inked_ship', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1496, 'Inked Spit', '1', '0', 'inked_spit', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1497, 'Inked Squidpants', '1', '0', 'inked_squidpants', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1498, 'Inked Suidpatrol', '1', '0', 'inked_suidpatrol', 2, 1, '239');
INSERT INTO `cms_homes_catalouge` VALUES (1499, 'Island', '1', '0', 'island', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1500, 'IT Habbohome', '1', '0', 'it_habbohome', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (1501, 'IT Stickerpodio', '1', '0', 'it_stickerpodio', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1502, 'IT Toilet', '1', '0', 'it_toilet', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1503, 'J', '1', '0', 'j', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1504, 'James Curtis', '1', '0', 'jamescurtis', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1505, 'Jared', '1', '0', 'jared', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1506, 'Jarno Guest', '1', '0', 'jarno_guest', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1507, 'Jarppi Guest', '1', '0', 'jarppi_guest', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1508, 'Jarppi Guest 2', '1', '0', 'jarppi_guest2', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1509, 'JBL', '1', '0', 'jbl', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1510, 'Jeff Hardy', '1', '0', 'jeffhardy', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1511, 'Jenkki Monster Sticker', '1', '0', 'jenkki_monster_sticker', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1513, 'Jesse', '1', '0', 'jesse', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1514, 'Jigoku Shojo 1', '1', '0', 'jigoku_shojo_1', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1515, 'Jigoku Shojo 2', '1', '0', 'jigoku_shojo_2', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1516, 'Jimmyhart', '1', '0', 'jimmyhart', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1517, 'Jimmysnuka', '1', '0', 'jimmysnuka', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1518, 'Johnmorrison', '1', '0', 'johnmorrison', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1519, 'JP 5 Uears', '1', '0', 'jp_5years', 2, 1, '206');
INSERT INTO `cms_homes_catalouge` VALUES (1520, 'JP Godzilla', '1', '0', 'jp_godzilla', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1521, 'JP Sushi', '1', '0', 'jp_sushi', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1522, 'Juice', '1', '0', 'juice', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1523, 'Jukka Guest', '1', '0', 'jukka_guest', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1524, 'Jukka Guest2', '1', '0', 'jukka_guest2', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1525, 'July0408 Boom 1', '1', '0', 'july0408_boom_1', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1526, 'July408 Auntsamantha', '1', '0', 'july408_auntsamantha', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1527, 'July408 Boom 2', '1', '0', 'july408_boom_2', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1528, 'July408 Boom 3', '1', '0', 'july408_boom_3', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1529, 'July408 Boom 4', '1', '0', 'july408_boom_4', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1530, 'July408 Border', '1', '0', 'july408_border', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1531, 'July408 July4th', '1', '0', 'july408_july4th', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1532, 'July408 Unclesam', '1', '0', 'july408_unclesam', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1533, 'K', '1', '0', 'k', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1534, 'Karigrandi Sticker', '1', '0', 'karigrandi_sticker', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1535, 'Kennydy Kstra', '1', '0', 'kennydykstra', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1536, 'Ketupat', '1', '0', 'ketupat', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1537, 'Kevinthorn', '1', '0', 'kevinthorn', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1538, 'KFP Sticker 1', '1', '0', 'kfp_sticker_01', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1539, 'KFP Sticker 2', '1', '0', 'kfp_sticker_02', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1540, 'KFP Sticker 3', '1', '0', 'kfp_sticker_03', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1541, 'KFP Sticker 4', '1', '0', 'kfp_sticker_04', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1542, 'KFP Sticker 5', '1', '0', 'kfp_sticker_05', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1543, 'KFP Sticker 6', '1', '0', 'kfp_sticker_06', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1544, 'KFP Sticker 7', '1', '0', 'kfp_sticker_07', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1545, 'KIP Partnerbtn', '1', '0', 'kip_partnerbtn', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1546, 'KIR Stamp 1', '1', '0', 'kir-stamp1', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1547, 'KIR Bam Sticker', '1', '0', 'kir_bam_sticker', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1548, 'KIR Elkah Sticker', '1', '0', 'kir_elkah_sticker', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1549, 'KIR Foz Sticker', '1', '0', 'kir_foz_sticker', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1550, 'KIR Fushi Sticker', '1', '0', 'kir_fushi_sticker', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1551, 'KIR Stamp 1', '1', '0', 'kir_stamp1', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1552, 'KIR Stamp 2', '1', '0', 'kir_stamp2', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1553, 'KIR Stamp 3', '1', '0', 'kir_stamp3', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1555, 'Kir Stamp', '1', '0', 'kir_stamp4', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1557, 'KIR Stamp 5', '1', '0', 'kir_stamp5', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1558, 'KIR Stamp 6', '1', '0', 'kir_stamp6', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1559, 'KIR Stamp 7', '1', '0', 'kir_stamp6_002', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1561, 'KIR Sticker', '1', '0', 'kir_sticker', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1562, 'KIR Winner 1', '1', '0', 'kir_winner_01', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1563, 'KIR Winner 2', '1', '0', 'kir_winner_02', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1564, 'KIR Winner 3', '1', '0', 'kir_winner_03', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1565, 'KIR Winner 4', '1', '0', 'kir_winner_04', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1566, 'KIR Winner 5', '1', '0', 'kir_winner_05', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1567, 'KIR Winner 6', '1', '0', 'kir_winner_06', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1568, 'KIR Winner 7', '1', '0', 'kir_winner_07', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1569, 'KIR Winner 8', '1', '0', 'kir_winner_08', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1570, 'KIR Winner 9', '1', '0', 'kir_winner_09', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1571, 'KIR Winner 10', '1', '0', 'kir_winner_10', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1572, 'KIR Winner 11', '1', '0', 'kir_winner_11', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1573, 'KIR Yobbo Sticker', '1', '0', 'kir_yobbo_sticker', 2, 1, '225');
INSERT INTO `cms_homes_catalouge` VALUES (1574, 'Kitsune Wonders', '1', '0', 'kitsune_wonders', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1575, 'Kitsune Yelling', '1', '0', 'kitsune_yelling', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1576, 'Kitune Fighting', '1', '0', 'kitune_fighting', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1580, 'Krans', '1', '0', 'krans', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1581, 'L', '1', '0', 'l', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1582, 'Lamp 1', '1', '0', 'lamp_1', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (1583, 'Lamp 2', '1', '0', 'lamp_2', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1584, 'Lamp 3', '1', '0', 'lamp_3', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1585, 'Lamp 4', '1', '0', 'lamp_4', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1586, 'Lamp Group', '1', '0', 'lamp_group', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1588, 'Lapanen Blue', '1', '0', 'lapanen_blue', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1593, 'Lapanen Purple', '1', '0', 'lapanen_purple', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1594, 'Lapanen Red', '1', '0', 'lapanen_red', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1596, 'Lapanen Yellow', '1', '0', 'lapanen_yellow', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1597, 'Lashey', '1', '0', 'lashey', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1598, 'Leafs 1', '1', '0', 'leafs1', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (1599, 'Leafs 2', '1', '0', 'leafs2', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (1600, 'Leapday', '1', '0', 'leapday', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1602, 'Letrah', '1', '0', 'letrah', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1603, 'Letrai', '1', '0', 'letrai', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1604, 'Lightbulb', '1', '0', 'lightbulb', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1605, 'Limo Back', '1', '0', 'limo_back', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1606, 'Limo Doorpiece', '1', '0', 'limo_doorpiece', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1607, 'Limo Front', '1', '0', 'limo_front', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1608, 'Limo Windowpiece', '1', '0', 'limo_windowpiece', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1609, 'Linha', '1', '0', 'linha', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1610, 'Linnsticker', '1', '0', 'linnsticker', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1611, 'Little Dog Little Dog', '1', '0', 'littledoglittledog', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1612, 'Little Dog Mechahead', '1', '0', 'littledogmechahead', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1613, 'Little Dog Walking Mecha', '1', '0', 'littledogwalkingmecha', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1614, 'Loderse', '1', '0', 'loderse', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1616, 'Lovebed', '1', '0', 'lovebed', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (1617, 'M', '1', '0', 'm', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1620, 'Malecapitain Costume', '1', '0', 'malecapitain_costume', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1622, 'Mansikka Tarra', '1', '0', 'mansikka_tarra', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1623, 'Maria', '1', '0', 'maria', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1624, 'Mark Henry', '1', '0', 'markhenry', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1625, 'Matt Hardy', '1', '0', 'matthardy', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1626, 'Matt Striker', '1', '0', 'mattstriker', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1627, 'May Weather', '1', '0', 'mayweather', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1628, 'Melchor', '1', '0', 'melchor', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1629, 'Melina', '1', '0', 'melina', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1631, 'Mexico', '1', '0', 'mexico', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1633, 'Mid Sommar 1', '1', '0', 'midsommar_1', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1634, 'Mike Knoxx', '1', '0', 'mikeknoxx', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1635, 'Miss J', '1', '0', 'missj', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1636, 'Money Low', '1', '0', 'money_o', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (1637, 'Money Stash', '1', '0', 'money_stash', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (1638, 'Money High', '1', '0', 'money_v', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (1639, 'Mooncake Dark', '1', '0', 'mooncake_dark', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1640, 'Mooncake Light', '1', '0', 'mooncake_light', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1641, 'Mr Kennedy', '1', '0', 'mrkennedy', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1642, 'Mummimor', '1', '0', 'mummimor', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1643, 'N', '1', '0', 'n', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1644, 'Nail 2', '1', '0', 'nail2', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1645, 'Nail 3', '1', '0', 'nail3', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1646, 'Needle 1', '1', '0', 'needle_1', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1647, 'Needle 2', '1', '0', 'needle_2', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1648, 'Needle 3', '1', '0', 'needle_3', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1649, 'Needle 4', '1', '0', 'needle_4', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1650, 'Needle 5', '1', '0', 'needle_5', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1652, 'Newyear 2007', '1', '0', 'newyear_2007_anim', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1655, 'Newyear Sparkler', '1', '0', 'newyear_sparkler', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1656, 'Nigiri Sushi', '1', '0', 'nigirisushi', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1657, 'NL Coinguy Animated', '1', '0', 'nl_coinguy_animated', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1658, 'NL Cupido', '1', '0', 'nl_cupido', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (1659, 'NL Downtown Costume', '1', '0', 'nl_downtown_costume', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1660, 'NL Firecracker', '1', '0', 'nl_firecracker', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1661, 'NL Football Guest', '1', '0', 'nl_football_guest', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1662, 'NL Football Guest 2', '1', '0', 'nl_football_guest2', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1663, 'NL Limo', '1', '0', 'nl_limo', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1664, 'NL Wanted Costume', '1', '0', 'nl_wanted_costume', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1665, 'No Space Sticker', '1', '0', 'no_space_sticker', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1666, 'No Way Out Slanted', '1', '0', 'nowayout_slanted', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1667, 'N-Jury', '1', '0', 'njury', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1668, 'N-Logo', '1', '0', 'nlogo', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1669, 'N-Stage', '1', '0', 'nstage', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1670, 'Nunzio', '1', '0', 'nunzio', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1671, 'NZ Heart', '1', '0', 'nz_heart', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1672, 'NZ Tiki', '1', '0', 'nz_tiki', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1673, 'O', '1', '0', 'o', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1674, 'O with Dots', '1', '0', 'o_with_dots', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1675, 'Ogopogo 1', '1', '0', 'ogopogo1', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1676, 'Oldfence Left', '1', '0', 'oldfence_left', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1677, 'Oldfence Right', '1', '0', 'oldfence_right', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1678, 'Orca Ideal Home', '1', '0', 'orca_ideal_home', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1679, 'P', '1', '0', 'p', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1680, 'Paper Clip 1', '1', '0', 'paper_clip_1', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1681, 'Paper Clip 2', '1', '0', 'paper_clip_2', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1682, 'Paper Clip 3', '1', '0', 'paper_clip_3', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1683, 'Parrot', '1', '0', 'parrot', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1684, 'Patsday Claddagh', '1', '0', 'patsday_claddagh', 2, 1, '241');
INSERT INTO `cms_homes_catalouge` VALUES (1685, 'Patsday Kissme', '1', '0', 'patsday_kissme', 2, 1, '241');
INSERT INTO `cms_homes_catalouge` VALUES (1687, 'Patsday Potogold', '1', '0', 'patsday_potogold', 2, 1, '241');
INSERT INTO `cms_homes_catalouge` VALUES (1688, 'Patsday Shamborderh', '1', '0', 'patsday_shamborderh', 2, 1, '241');
INSERT INTO `cms_homes_catalouge` VALUES (1689, 'Patsday Shamborderv', '1', '0', 'patsday_shamborderv', 2, 1, '241');
INSERT INTO `cms_homes_catalouge` VALUES (1690, 'Patsday Shamrock', '1', '0', 'patsday_shamrock', 2, 1, '241');
INSERT INTO `cms_homes_catalouge` VALUES (1691, 'Paul London', '1', '0', 'paullondon', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1692, 'Paul Orndorff', '1', '0', 'paulorndorff', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1693, 'Petite Boule', '1', '0', 'petiteboule', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1694, 'Pinrock Inrio', '1', '0', 'pinrockinrio', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1695, 'Pirate', '1', '0', 'pirate', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1696, 'Pirate Captain', '1', '0', 'piratecaptain', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1697, 'Pirate Cutlass', '1', '0', 'piratecutlass', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1698, 'Pirate Dude 1', '1', '0', 'piratedude01', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1699, 'Pirate Dude 2', '1', '0', 'piratedude02', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1700, 'Pirate Flag', '1', '0', 'pirateflag', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1701, 'Pirate Scroll', '1', '0', 'piratescroll', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1702, 'Pirate Treasure 1', '1', '0', 'piratetreasure01', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1703, 'Pirate Treasure 2', '1', '0', 'piratetreasure02', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1704, 'Plaster', '1', '0', 'plaster', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1705, 'Plaster 2', '1', '0', 'plaster2', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1706, 'Ponto', '1', '0', 'ponto', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1707, 'Poppy', '1', '0', 'poppy', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1708, 'Poptart', '1', '0', 'poptartcv1b2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1710, 'Poptart 2', '1', '0', 'poptartcv2b2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1711, 'Poptart 3', '1', '0', 'poptartcv2ba', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1712, 'Poptarts 1', '1', '0', 'poptartsb1b', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1713, 'Poptarts 2', '1', '0', 'poptartsb2b', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1714, 'Pro Eco', '1', '0', 'pro_eco', 2, 1, '235');
INSERT INTO `cms_homes_catalouge` VALUES (1717, 'Prom of the Dead Sticker Brains', '1', '0', 'promofthedead_sticker_brains', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1718, 'Prom of the Dead Sticker Dress', '1', '0', 'promofthedead_sticker_dress', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1719, 'Prom of the Dead Sticker Duck', '1', '0', 'promofthedead_sticker_duck', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1720, 'Prom of the Dead Sticker Poster', '1', '0', 'promofthedead_sticker_poster', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1721, 'Prom of the Dead Sticker Suit', '1', '0', 'promofthedead_sticker_suit', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1722, 'Prom of the Dead Sticker Zombie', '1', '0', 'promofthedead_sticker_zombie', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (1723, 'Q', '1', '0', 'q', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1724, 'Queensibidi', '1', '0', 'queensibidi', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1725, 'Question', '1', '0', 'question', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1726, 'R', '1', '0', 'r', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1727, 'Radar', '1', '0', 'radar', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1728, 'Randy Orton', '1', '0', 'randyorton', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1729, 'Rasta', '1', '0', 'rasta', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1730, 'Ratv 2', '1', '0', 'ratv2', 2, 1, '217');
INSERT INTO `cms_homes_catalouge` VALUES (1731, 'Red Hockeystick', '1', '0', 'redhockeystick', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1732, 'Redlamp', '1', '0', 'redlamp', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1733, 'Red Starfish', '1', '0', 'redstarfish', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1734, 'Referee 1 Guest', '1', '0', 'referee_01_guest', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1735, 'Referee 2 Guest', '1', '0', 'referee_02_guest', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1736, 'Referee 3 Guest', '1', '0', 'referee_03_guest', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1737, 'Reymysterio', '1', '0', 'reymysterio', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1738, 'Ricflair', '1', '0', 'ricflair', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1739, 'Roddypiper', '1', '0', 'roddypiper', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1740, 'Ronsimmons', '1', '0', 'ronsimmons', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1741, 'Room of the Week', '1', '0', 'room_of_the_week', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (1742, 'Rt Stiker', '1', '0', 'rtsstciker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1744, 'Rt Sticker v1', '1', '0', 'rtsticker_v1', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1745, 'Ruler Horizontal', '1', '0', 'ruler_horizontal', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (1746, 'Ruler Vertical', '1', '0', 'ruler_vertical', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (1747, 'S', '1', '0', 's', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1748, 'Sack Costume', '1', '0', 'sackcostume', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1749, 'Safer Internet 2008', '1', '0', 'saferinternet2008', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1750, 'Samsung 1', '1', '0', 'samsung1', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1751, 'Samsung 2', '1', '0', 'samsung2', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1752, 'Samsung 3', '1', '0', 'samsung3', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1753, 'Samsung 4', '1', '0', 'samsung4', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1754, 'Samsung 5', '1', '0', 'samsung5', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1755, 'Santa 3000 Character', '1', '0', 'santa3000_character', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1756, 'Santinoma Rella', '1', '0', 'santinomarella', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1758, 'Sasquatch', '1', '0', 'sasquatch7', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1759, 'Sasquatch Hands', '1', '0', 'sasquatch_hands', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1760, 'Satay', '1', '0', 'satay', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1761, 'Scubacapsule Anim', '1', '0', 'scubacapsule_anim', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1762, 'SE Sticker Competition', '1', '0', 'se_sticker_competition', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1763, 'Seagull 1', '1', '0', 'seagull_01', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1764, 'Seagull 2', '1', '0', 'seagull_02', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1767, 'Sea Shell', '1', '0', 'seashell', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1768, 'Sergeant Slaughter', '1', '0', 'sergeantslaughter', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1769, 'MTV Sticker 1', '1', '0', 'sg_mtv_sticker_01', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1770, 'MTV Sticker 2', '1', '0', 'sg_mtv_sticker_02', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1771, 'MTV Sticker 3', '1', '0', 'sg_mtv_sticker_03', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1772, 'Shell', '1', '0', 'shell', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1773, 'Shelton Benjamin', '1', '0', 'sheltonbenjamin', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1774, 'Shrubbery', '1', '0', 'shrubbery', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1775, 'Silver Medallion', '1', '0', 'silvermedallion', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1776, 'Skeletor 1', '1', '0', 'skeletor_001', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1777, 'Skull', '1', '0', 'skull', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1778, 'Skull 2', '1', '0', 'skull2', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1779, 'Slash', '1', '0', 'slash', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1780, 'Smichaels', '1', '0', 'smichaels', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1781, 'Snitsky', '1', '0', 'snitsky', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1782, 'Snowball', '1', '0', 'snowball', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1783, 'Snowball Bumpy', '1', '0', 'snowball_bumpy', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1784, 'Snowball Smooth', '1', '0', 'snowball_smooth', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1785, 'Soccer Dude 1', '1', '0', 'soccer_dude_1', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1786, 'Soccer Dude 2', '1', '0', 'soccer_dude_2', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1787, 'Soccer Dude 3', '1', '0', 'soccer_dude_3', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1788, 'Soccer Dude 4', '1', '0', 'soccer_dude_4', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1789, 'Soccer Dude 5', '1', '0', 'soccer_dude_5', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (1790, 'Soccer Shirt 1', '1', '0', 'soccer_shirt1', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1791, 'Soccer Shirt 10', '1', '0', 'soccer_shirt10', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1792, 'Soccer Shirt 11', '1', '0', 'soccer_shirt11', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1793, 'Soccer Shirt 12', '1', '0', 'soccer_shirt12', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1794, 'Soccer Shirt 13', '1', '0', 'soccer_shirt13', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1795, 'Soccer Shirt 14', '1', '0', 'soccer_shirt14', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1796, 'Soccer Shirt 15', '1', '0', 'soccer_shirt15', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1797, 'Soccer Shirt 16', '1', '0', 'soccer_shirt16', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1798, 'Soccer Shirt  17', '1', '0', 'soccer_shirt17', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1799, 'Soccer Shirt 18', '1', '0', 'soccer_shirt18', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1800, 'Soccer Shirt 19', '1', '0', 'soccer_shirt19', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1801, 'Soccer Shirt 2', '1', '0', 'soccer_shirt2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1802, 'Soccer Shirt 20', '1', '0', 'soccer_shirt20', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1803, 'Soccer Shirt 3', '1', '0', 'soccer_shirt3', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1804, 'Soccer Shirt 4', '1', '0', 'soccer_shirt4', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1805, 'Soccer Shirt 5', '1', '0', 'soccer_shirt5', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1806, 'Soccer Shirt 6', '1', '0', 'soccer_shirt6', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1807, 'Soccer Shirt 7', '1', '0', 'soccer_shirt7', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1808, 'Soccer Shirt 8', '1', '0', 'soccer_shirt8', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1809, 'Soccer Shirt 9', '1', '0', 'soccer_shirt9', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1810, 'Soccer Short 1', '1', '0', 'soccer_short1', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1811, 'Soccer Short 10', '1', '0', 'soccer_short10', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1812, 'Soccer Short 11', '1', '0', 'soccer_short11', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1813, 'Soccer Short 12', '1', '0', 'soccer_short12', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1814, 'Soccer Short 13', '1', '0', 'soccer_short13', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1815, 'Soccer Short 14', '1', '0', 'soccer_short14', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1816, 'Soccer Short 15', '1', '0', 'soccer_short15', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1817, 'Soccer Short 16', '1', '0', 'soccer_short16', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1818, 'Soccer Short 17', '1', '0', 'soccer_short17', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1819, 'Soccer Short 18', '1', '0', 'soccer_short18', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1820, 'Soccer Short 19', '1', '0', 'soccer_short19', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1821, 'Soccer Short 2', '1', '0', 'soccer_short2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1822, 'Soccer Short 20', '1', '0', 'soccer_short20', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1823, 'Soccer Short 3', '1', '0', 'soccer_short3', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1824, 'Soccer Short 4', '1', '0', 'soccer_short4', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1825, 'Soccer Short 5', '1', '0', 'soccer_short5', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1826, 'Soccer Short 6', '1', '0', 'soccer_short6', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1827, 'Soccer Short 7', '1', '0', 'soccer_short7', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1828, 'Soccer Short 8', '1', '0', 'soccer_short8', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1829, 'Soccer Short 9', '1', '0', 'soccer_short9', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1830, 'Sofresh', '1', '0', 'sofresh', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1831, 'spiderwick Goblin 1 L', '1', '0', 'spiderwick_goblin1_l', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1832, 'spiderwick Goblin 1 R', '1', '0', 'spiderwick_goblin1_r', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1833, 'spiderwick Goblin 2 L', '1', '0', 'spiderwick_goblin2_l', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1834, 'spiderwick Goblin 2 R', '1', '0', 'spiderwick_goblin2_r', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1835, 'spiderwick Goblin Anim L', '1', '0', 'spiderwick_goblin_anim_l', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1836, 'spiderwick Goblin Anim R', '1', '0', 'spiderwick_goblin_anim_r', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1837, 'spiderwick Griffin L', '1', '0', 'spiderwick_griffin_l', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1838, 'spiderwick Griffin R', '1', '0', 'spiderwick_griffin_r', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1839, 'spiderwick Sprite 1 L', '1', '0', 'spiderwick_sprite1_l', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1840, 'spiderwick Sprite 1 R', '1', '0', 'spiderwick_sprite1_r', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1841, 'spiderwick Sprite 2 L', '1', '0', 'spiderwick_sprite2_l', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1842, 'spiderwick Sprite 2 R', '1', '0', 'spiderwick_sprite2_r', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1843, 'spiderwick Toadstooll', '1', '0', 'spiderwick_toadstooll', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1844, 'Spiderwick Toadstooll 2', '1', '0', 'spiderwick_toadstoolr', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1845, 'Spill 1', '1', '0', 'spill1', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1846, 'Spill 2', '1', '0', 'spill2', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1847, 'Spill 3', '1', '0', 'spill3', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1848, 'Spotlight Sticker', '1', '0', 'spotlight_sticker', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1849, 'Spotlight Sticker 2', '1', '0', 'spotlight_sticker2_001', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1852, 'Spray', '1', '0', 'spray1', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1853, 'Spray 2', '1', '0', 'spray2', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1854, 'Squib', '1', '0', 'squib', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1856, 'Snowstorm Boots Blue', '1', '0', 'sbootsitjalapaset_blue', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1857, 'Snowstorm Boots Red ', '1', '0', 'sbootsitjalapaset_red', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1858, 'Snowstorm Costume Blue', '1', '0', 'scostume_blue', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1859, 'Snowstorm Costume Red', '1', '0', 'scostume_red', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1860, 'Shitby Snowball', '1', '0', 'shitby_snowball', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1861, 'Snowstorm Ballmachine', '1', '0', 'ssnowballmachine', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1862, 'Snowstorm Flake', '1', '0', 'ssnowflake1', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1865, 'Snowstorm Flake 2', '1', '0', 'ssnowflake2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1866, 'Snowstorm Man', '1', '0', 'ssnowman', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1867, 'Snowstorm Queen', '1', '0', 'ssnowqueen', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1868, 'Snowstorm Tree', '1', '0', 'ssnowtree', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1869, 'Stanley Cup Sticker', '1', '0', 'stanleycupsticker', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1870, 'Star', '1', '0', 'star', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (1872, 'Starburst', '1', '0', 'starburst', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1873, 'Stevie Richards', '1', '0', 'stevierichards', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (1874, 'Stewardes Costume', '1', '0', 'stewardescostume', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1875, 'Sticker Aunt Samantha', '1', '0', 'stickerauntsamantha', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1876, 'Sticker Flagborder', '1', '0', 'stickerflagborder', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1877, 'Sticker 3 Years', '1', '0', 'sticker_3years', 2, 1, '206');
INSERT INTO `cms_homes_catalouge` VALUES (1879, 'Sticker Arrow Down', '1', '0', 'sticker_arrow_down', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1880, 'Sticker Arrow Left', '1', '0', 'sticker_arrow_left', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1881, 'Sticker Arrow Right', '1', '0', 'sticker_arrow_right', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1882, 'Sticker Arrow Up', '1', '0', 'sticker_arrow_up', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1883, 'Sticker Award Bronze', '1', '0', 'sticker_award_bronze', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (1884, 'Sticker Award Gold', '1', '0', 'sticker_award_gold', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (1886, 'Sticker Award Silver', '1', '0', 'sticker_award_silver', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (1888, 'Sticker Bonsai Ninjaf', '1', '0', 'sticker_bonsai_ninjaf', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1889, 'Sticker Bonsai Ninjafa', '1', '0', 'sticker_bonsai_ninjafa', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1890, 'Sticker Bonsai Ninjam', '1', '0', 'sticker_bonsai_ninjam', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1891, 'Sticker Bonsai Ninjama', '1', '0', 'sticker_bonsai_ninjama', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1892, 'Sticker Bonsai Samuraif', '1', '0', 'sticker_bonsai_samuraif', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1893, 'Sticker Bonsai Samuraifa', '1', '0', 'sticker_bonsai_samuraifa', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1894, 'Sticker Bonsai Samuraim', '1', '0', 'sticker_bonsai_samuraim', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1895, 'Sticker Bonsai Samuraima', '1', '0', 'sticker_bonsai_samuraima', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (1897, 'Sticker Boxer', '1', '0', 'sticker_boxer', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1898, 'Sticker Caballoons', '1', '0', 'sticker_caballoons', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1899, 'Sticker Cabin', '1', '0', 'sticker_cabin', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1900, 'Sticker Cactuanim', '1', '0', 'sticker_cactuanim', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1901, 'Sticker Cais 4', '1', '0', 'sticker_cais4', 2, 1, '213');
INSERT INTO `cms_homes_catalouge` VALUES (1902, 'sticker_Cape', '1', '0', 'sticker_cape', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1903, 'Sticker Catinabox', '1', '0', 'sticker_catinabox', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1904, 'Sticker Chauvesouri', '1', '0', 'sticker_chauvesouri', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1905, 'Sticker Chauvesouris', '1', '0', 'sticker_chauvesouris', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1906, 'Sticker Chica_Tampax', '1', '0', 'sticker_chica_tampax', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1907, 'Sticker Chica_Tampax 1', '1', '0', 'sticker_chica_tampax1', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1908, 'Sticker Chica Tampax 2', '1', '0', 'sticker_chica_tampax2', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1909, 'Sticker Chips', '1', '0', 'sticker_chips', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1910, 'Sticker Clown Anim', '1', '0', 'sticker_clown_anim', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1911, 'Sticker Coffee Stain', '1', '0', 'sticker_coffee_stain', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1912, 'Sticker Coffee Steam Blue', '1', '0', 'sticker_coffee_steam_blue', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1913, 'Sticker Coffee Steam Grey', '1', '0', 'sticker_coffee_steam_grey', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1914, 'Sticker Croco', '1', '0', 'sticker_croco', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1915, 'Sticker DA Blingclock', '1', '0', 'sticker_da_blingclock', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1916, 'Sticker Dreamer', '1', '0', 'sticker_dreamer', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1917, 'Sticker Effect Bam', '1', '0', 'sticker_effect_bam', 2, 1, '240');
INSERT INTO `cms_homes_catalouge` VALUES (1918, 'Sticker Effect Burp', '1', '0', 'sticker_effect_burp', 2, 1, '240');
INSERT INTO `cms_homes_catalouge` VALUES (1919, 'Sticker Effect Whoosh 2', '1', '0', 'sticker_effect_whoosh2', 2, 1, '240');
INSERT INTO `cms_homes_catalouge` VALUES (1920, 'Sticker Effect Woosh', '1', '0', 'sticker_effect_woosh', 2, 1, '240');
INSERT INTO `cms_homes_catalouge` VALUES (1921, 'Sticker Effect Zap', '1', '0', 'sticker_effect_zap', 2, 1, '240');
INSERT INTO `cms_homes_catalouge` VALUES (1922, 'Sticker Eraser', '1', '0', 'sticker_eraser', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1923, 'Sticker Eye Anim', '1', '0', 'sticker_eye_anim', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1924, 'Sticker Eye Evil Anim', '1', '0', 'sticker_eye_evil_anim', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1925, 'Sticker Eyeblue', '1', '0', 'sticker_eyeblue', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1926, 'Sticker Fireworkboom 3', '1', '0', 'sticker_fireworkboom3', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (1927, 'Sticker Flames', '1', '0', 'sticker_flames', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1928, 'Sticker Flameskull', '1', '0', 'sticker_flameskull', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1929, 'Sticker Flower', '1', '0', 'sticker_flower1', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1930, 'Sticker Flower Big Yellow', '1', '0', 'sticker_flower_big_yellow', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1931, 'Sticker Flower Pink', '1', '0', 'sticker_flower_pink', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (1932, 'Sticker Gala', '1', '0', 'sticker_gala', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1934, 'Sticker Gentleman', '1', '0', 'sticker_gentleman', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1935, 'Sticker Glasseelton', '1', '0', 'sticker_glasseelton', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1936, 'Sticker Glassesupernerd', '1', '0', 'sticker_glassesupernerd', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1945, 'Sticker Gurubeard Brown', '1', '0', 'sticker_gurubeard_brown', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1946, 'Sticker Gurubeard Gray', '1', '0', 'sticker_gurubeard_gray', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1947, 'Sticker Heartbeat', '1', '0', 'sticker_heartbeat', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (1949, 'Sticker Hole', '1', '0', 'sticker_hole', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1950, 'Sticker Hulkhogan', '1', '0', 'sticker_hulkhogan', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1951, 'Sticker Iheartfools', '1', '0', 'sticker_iheartfools', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (1952, 'Sticker Koopa', '1', '0', 'sticker_koopa', 2, 1, '212');
INSERT INTO `cms_homes_catalouge` VALUES (1953, 'Sticker Lonewolf', '1', '0', 'sticker_lonewolf', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1954, 'Sticker Luigi', '1', '0', 'sticker_luigi', 2, 1, '212');
INSERT INTO `cms_homes_catalouge` VALUES (1955, 'Sticker Mamasboy', '1', '0', 'sticker_mamasboy', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1956, 'Sticker Maquillage', '1', '0', 'sticker_maquillage', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1957, 'Sticker Mario', '1', '0', 'sticker_mario', 2, 1, '212');
INSERT INTO `cms_homes_catalouge` VALUES (1958, 'Sticker Masque', '1', '0', 'sticker_masque_01', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1959, 'Sticker Masque 2', '1', '0', 'sticker_masque_02', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1960, 'Sticker Masque 3', '1', '0', 'sticker_masque_03', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1961, 'sticker_Masque 4', '1', '0', 'sticker_masque_04', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1962, 'Sticker Masque 5', '1', '0', 'sticker_masque_05', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1963, 'Sticker Masque Or', '1', '0', 'sticker_masque_or', 2, 1, '208');
INSERT INTO `cms_homes_catalouge` VALUES (1964, 'Sticker Mathoffman', '1', '0', 'sticker_mathoffman', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (1965, 'Sticker Mineur', '1', '0', 'sticker_mineur', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1966, 'Sticker Monolithe', '1', '0', 'sticker_monolithe', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1967, 'Sticker Moonpig', '1', '0', 'sticker_moonpig', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1972, 'Sticker Peach', '1', '0', 'sticker_peach', 2, 1, '212');
INSERT INTO `cms_homes_catalouge` VALUES (1973, 'Sticker Pencil', '1', '0', 'sticker_pencil', 2, 1, '229');
INSERT INTO `cms_homes_catalouge` VALUES (1974, 'Sticker Pencil 2', '1', '0', 'sticker_pencil_2', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1975, 'Sticker Pointing Hand 1', '1', '0', 'sticker_pointing_hand_1', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1976, 'Sticker Pointing Hand 2', '1', '0', 'sticker_pointing_hand_2', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1977, 'Sticker Pointing Hand 3', '1', '0', 'sticker_pointing_hand_3', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1978, 'Sticker Pointing Hand 4', '1', '0', 'sticker_pointing_hand_4', 2, 1, '222');
INSERT INTO `cms_homes_catalouge` VALUES (1979, 'Sticker Prankster', '1', '0', 'sticker_prankster', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1980, 'Sticker Romantic', '1', '0', 'sticker_romantic', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2654, 'Sticker Spaceduck', '1', '0', 'sticker_spaceduck', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1985, 'Sticker Sboard 1', '1', '0', 'sticker_sboard1', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1986, 'Sticker Sboard 2', '1', '0', 'sticker_sboard2', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1987, 'Sticker Sboard 3', '1', '0', 'sticker_sboard3', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (1988, 'Sticker Skull', '1', '0', 'sticker_skull', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1989, 'Sticker Skull 2', '1', '0', 'sticker_skull2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (1990, 'Sticker Sleeping Habbo', '1', '0', 'sticker_sleeping_habbo', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (1992, 'Sticker Spiky Wristband', '1', '0', 'sticker_spiky_wristband', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1997, 'Sticker Squelette', '1', '0', 'sticker_squelette', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (1998, 'Sticker Submarine', '1', '0', 'sticker_submarine', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (1999, 'Sticker Teensberg', '1', '0', 'sticker_teensberg', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2000, 'Sticker Themepark 2', '1', '0', 'sticker_themepark_002', 2, 1, '228');
INSERT INTO `cms_homes_catalouge` VALUES (2001, 'Sticker Themepark 3', '1', '0', 'sticker_themepark_003', 2, 1, '234');
INSERT INTO `cms_homes_catalouge` VALUES (2002, 'Sticker Tiki Flamesboard', '1', '0', 'sticker_tiki_flamesboard', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2006, 'Sticker Tour', '1', '0', 'sticker_tour', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (2007, 'Sticker Trax Bling', '1', '0', 'sticker_trax_bling', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2008, 'Sticker Trax Heavy', '1', '0', 'sticker_trax_heavy', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2009, 'Sticker Trax Rock', '1', '0', 'sticker_trax_rock', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2010, 'Sticker Trophy Award', '1', '0', 'sticker_trophy_award', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2011, 'Sticker Unclesam', '1', '0', 'sticker_unclesam', 2, 1, '223');
INSERT INTO `cms_homes_catalouge` VALUES (2012, 'Sticker Woodboard', '1', '0', 'sticker_woodboard', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2013, 'Sticker Zipper H Bobba Lock', '1', '0', 'sticker_zipper_h_bobba_lock', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2014, 'Sticker Zipper H End', '1', '0', 'sticker_zipper_h_end', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2015, 'Sticker Zipper H Normal Lock', '1', '0', 'sticker_zipper_h_normal_lock', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2016, 'Sticker Zipper H Tile', '1', '0', 'sticker_zipper_h_tile', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2017, 'Sticker Zipper V Bobba Lock', '1', '0', 'sticker_zipper_v_bobba_lock', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2018, 'Sticker Zipper V End', '1', '0', 'sticker_zipper_v_end', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2019, 'Sticker Zipper V Normal Lock', '1', '0', 'sticker_zipper_v_normal_lock', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2020, 'Sticker Zipper V Tile', '1', '0', 'sticker_zipper_v_tile', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2021, 'Goth Border Vertical', '1', '0', 'goth_border_vertical', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2022, 'Stonecold', '1', '0', 'stonecold', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2023, 'Stray Pixels Winner', '1', '0', 'straypixelswinner', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2024, 'Streaker', '1', '0', 'streaker', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (2025, 'Summer Flowerwreath', '1', '0', 'summerflowerwreath', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2026, 'Summer Beachballafro', '1', '0', 'summer_beachballafro', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2027, 'Summer Blueberry Left', '1', '0', 'summer_blueberry_left', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2031, 'Summer Blueberry Right', '1', '0', 'summer_blueberry_right', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2033, 'Summer Cloud 1', '1', '0', 'summer_cloud1', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2035, 'Summer Cloud 2', '1', '0', 'summer_cloud2', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2037, 'Summer Cloud 3', '1', '0', 'summer_cloud3', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2039, 'Summer Flowerwreath 2', '1', '0', 'summer_flowerwreath', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2040, 'Summer Kite', '1', '0', 'summer_kite', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2043, 'Summer Rollerblades', '1', '0', 'summer_rollerblades', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2044, 'Summer Rowingboat', '1', '0', 'summer_rowingboat', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2045, 'Summer Skateboard', '1', '0', 'summer_skateboard', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2046, 'Summer Swim Trunk', '1', '0', 'summer_swim_trunk', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2047, 'Summer sticker_Strawberry', '1', '0', 'summersticker_strawberry', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2048, 'Sunflower', '1', '0', 'sunflower', 2, 1, '210');
INSERT INTO `cms_homes_catalouge` VALUES (2050, 'Supercrazy', '1', '0', 'supercrazy', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2051, 'Superjatt', '1', '0', 'superjatt', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2052, 'Surflifesaver', '1', '0', 'surflifesaver', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2053, 'Sushi Ika Squid', '1', '0', 'sushi_ika_squid', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (2054, 'Sushi Ikura Caviar', '1', '0', 'sushi_ikura_caviar', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (2055, 'Sushi Kohada Mackerel', '1', '0', 'sushi_kohada_mackerel', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (2056, 'Sushi Maguro', '1', '0', 'sushi_maguro', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (2057, 'Sushi Tamago Egg', '1', '0', 'sushi_tamago_egg', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (2058, 'Sushi Uni Sea Urchin', '1', '0', 'sushi_uni_sea_urchin', 2, 1, '224');
INSERT INTO `cms_homes_catalouge` VALUES (2059, 'Swimming Fish', '1', '0', 'swimming_fish', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2060, 'T', '1', '0', 't', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (2061, 'Tahti', '1', '0', 'tahti', 2, 1, '237');
INSERT INTO `cms_homes_catalouge` VALUES (2062, 'Tall Ship', '1', '0', 'tall_ship', 2, 1, '218');
INSERT INTO `cms_homes_catalouge` VALUES (2064, 'Tampax Signboard', '1', '0', 'tampax_signboard', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (2068, 'Tepetepe 2', '1', '0', 'tepetepe2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2069, 'Thanksgiving 07', '1', '0', 'thanksgiving07', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2070, 'The Great Khali', '1', '0', 'thegreatkhali', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2071, 'The Miz', '1', '0', 'themiz', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2072, 'The Safety Box', '1', '0', 'thesafetybox', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2073, 'Tiki Cloudtiki L', '1', '0', 'tiki_cloudtiki_l', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2074, 'Tiki Cloudtiki R', '1', '0', 'tiki_cloudtiki_r', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2075, 'Tiki Flowersboard', '1', '0', 'tiki_flowersboard', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2076, 'Tiki Greenboard', '1', '0', 'tiki_greenboard', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2077, 'Tiki Moarider F', '1', '0', 'tiki_moarider_f', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2078, 'Tiki Moarider M', '1', '0', 'tiki_moarider_m', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2079, 'Tiki Planttiki L', '1', '0', 'tiki_planttiki_l', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2080, 'Tiki Planttiki R', '1', '0', 'tiki_planttiki_r', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2081, 'Tiki Skulltiki L', '1', '0', 'tiki_skulltiki_l', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2082, 'Tiki Skulltiki R', '1', '0', 'tiki_skulltiki_r', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2083, 'Tiki Watertiki L', '1', '0', 'tiki_watertiki_l', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2084, 'Tiki Watertiki R', '1', '0', 'tiki_watertiki_r', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2085, 'Tiki Woodboard', '1', '0', 'tiki_woodboard', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (2086, 'Toffee Tarra', '1', '0', 'toffee_tarra', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (2087, 'Tokfia', '1', '0', 'tokfia', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (2088, 'Tommy Dreamer', '1', '0', 'tommydreamer', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2089, 'Tomo', '1', '0', 'tomo', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (2090, 'Toolbar Sticker', '1', '0', 'toolbar_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2091, 'Torrie Wilson', '1', '0', 'torriewilson', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2092, 'Tproll', '1', '0', 'tproll', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (2093, 'Tracinho', '1', '0', 'tracinho', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (2094, 'Trax 8 bit', '1', '0', 'trax_8_bit', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2095, 'Trax Ambient', '1', '0', 'trax_ambient', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2098, 'Trax Bling', '1', '0', 'trax_bling', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2101, 'Trax Disco', '1', '0', 'trax_disco', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2103, 'Trax Electro', '1', '0', 'trax_electro', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2106, 'Trax Heavy', '1', '0', 'trax_heavy', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2108, 'Trax Latin', '1', '0', 'trax_latin', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2110, 'Trax Log Not for sale', '1', '0', 'trax_log_not_for_sale', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2111, 'Trax Reggae', '1', '0', 'trax_reggae', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2112, 'Trax Rock', '1', '0', 'trax_rock', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2114, 'Trax Sfx', '1', '0', 'trax_sfx', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2116, 'Trax Goldrecord', '1', '0', 'traxgoldrecord', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2118, 'Tree Owl', '1', '0', 'tree_owl', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2119, 'Treestump', '1', '0', 'treestump', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2120, 'Tripleh', '1', '0', 'tripleh', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2121, 'U', '1', '0', 'u', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (2122, 'UK Childline', '1', '0', 'uk_childline_sticker', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2123, 'UK Habbo X', '1', '0', 'uk_habbo_x_sticker', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2124, 'UK Pixel Maze', '1', '0', 'uk_pixel_maze_sticker', 2, 1, '204');
INSERT INTO `cms_homes_catalouge` VALUES (2125, 'UK Only Homes', '1', '0', 'ukonly_disarno_homes', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2126, 'Umaga', '1', '0', 'umaga', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2127, 'Underscore', '1', '0', 'underscore', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (2128, 'Undertaker', '1', '0', 'undertaker', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2130, 'uFootball Guest', '1', '0', 'ufootball_guest', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2131, 'V', '1', '0', 'v', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (2134, 'Valentine Cupido', '1', '0', 'val_cupido_anim', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2136, 'Valentine Costume 3', '1', '0', 'val_lovecostume3', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2139, 'Valentine Lovedice', '1', '0', 'val_lovedice', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2140, 'Valentine Skull 360 Around', '1', '0', 'val_skull360around_anim', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2141, 'Valentine Barbwire Horis', '1', '0', 'val_sticker_barbwire_horis', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2143, 'Valentine Barbwire Vert', '1', '0', 'val_sticker_barbwire_vert', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2146, 'Valentine Bartender', '1', '0', 'val_sticker_bartender', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2147, 'Valentine Bartender2', '1', '0', 'val_sticker_bartender2', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2148, 'Valentine Bobbadice', '1', '0', 'val_sticker_bobbadice', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2150, 'Valentine Crew', '1', '0', 'val_sticker_crew', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2151, 'Valentine Croco', '1', '0', 'val_sticker_croco', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2152, 'Valentine Cupid Arrow', '1', '0', 'val_sticker_cupid_arrow', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2153, 'Valentine Femalecaptain', '1', '0', 'val_sticker_femalecaptain', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2157, 'Valentine Malecaptain', '1', '0', 'val_sticker_malecaptain', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2158, 'Valentine Malecrew', '1', '0', 'val_sticker_malecrew', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2159, 'Valentine Rosewire Corner', '1', '0', 'val_sticker_rosewire_corner', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2162, 'Valentine Rosewire Horis', '1', '0', 'val_sticker_rosewire_horis', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2163, 'Valentine Rosewire Vert', '1', '0', 'val_sticker_rosewire_vert', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2165, 'Valentine Skull 360', '1', '0', 'val_sticker_skull360', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2166, 'Valentine Skull 360 Circle', '1', '0', 'val_sticker_skull360_circle', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2167, 'Valentine Stewardess', '1', '0', 'val_sticker_stewardess', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2168, 'Valentine Stewardess 2', '1', '0', 'val_sticker_stewardess2', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2169, 'Valentine Storm Costume', '1', '0', 'val_sticker_storm-costume', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2171, 'Valentine Voodoo Suit', '1', '0', 'val_sticker_voodoo_suit', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2172, 'Valentine Captain', '1', '0', 'valcaptain', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2174, 'Valentine Welcome Sticker', '1', '0', 'valentine_welcome_sticker', 2, 1, '226');
INSERT INTO `cms_homes_catalouge` VALUES (2177, 'Valvenis', '1', '0', 'valvenis', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2178, 'Vanilja Tarra', '1', '0', 'vanilja_tarra', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (2179, 'Venezuela', '1', '0', 'venezuela', 2, 1, '232');
INSERT INTO `cms_homes_catalouge` VALUES (2180, 'Venti', '1', '0', 'venti', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2181, 'Veronicas', '1', '0', 'veronicas', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (2182, 'Vertical Ink', '1', '0', 'verticalink', 2, 1, '238');
INSERT INTO `cms_homes_catalouge` VALUES (2184, 'Victoria', '1', '0', 'victoria', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2185, 'Vincent Viga', '1', '0', 'vincentviga', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (2186, 'Vine', '1', '0', 'vine', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2187, 'Vine 2', '1', '0', 'vine2', 2, 1, '215');
INSERT INTO `cms_homes_catalouge` VALUES (2188, 'VIP Pin', '1', '0', 'vip_pin', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (2189, 'Voice Articleimage', '1', '0', 'voice_articleimage', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2191, 'W', '1', '0', 'w', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (2192, 'Whimsy', '1', '0', 'whimsy', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2193, 'Wood A', '1', '0', 'wood_a', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2194, 'Wood Acircle', '1', '0', 'wood_acircle', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2195, 'Wood Acsent', '1', '0', 'wood_acsent', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2196, 'Wood Acsent 2', '1', '0', 'wood_acsent2', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2197, 'Wood Adots', '1', '0', 'wood_adots', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2198, 'Wood B', '1', '0', 'wood_b', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2199, 'Wood C', '1', '0', 'wood_c', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2200, 'Wood Comma', '1', '0', 'wood_comma', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2201, 'Wood D', '1', '0', 'wood_d', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2202, 'Wood Dot', '1', '0', 'wood_dot', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2203, 'Wood E', '1', '0', 'wood_e', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2204, 'Wood Exclamation', '1', '0', 'wood_exclamation', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2205, 'Wood F', '1', '0', 'wood_f', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2206, 'Wood G', '1', '0', 'wood_g', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2207, 'Wood H', '1', '0', 'wood_h', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2208, 'Wood I', '1', '0', 'wood_i', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2209, 'Wood J', '1', '0', 'wood_j', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2210, 'Wood K', '1', '0', 'wood_k', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2211, 'Wood L', '1', '0', 'wood_l', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2212, 'Wood M', '1', '0', 'wood_m', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2213, 'Wood N', '1', '0', 'wood_n', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2214, 'Wood O', '1', '0', 'wood_o', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2215, 'Wood Odots', '1', '0', 'wood_odots', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2216, 'Wood P', '1', '0', 'wood_p', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2217, 'Wood Q', '1', '0', 'wood_q', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2218, 'Wood Question', '1', '0', 'wood_question', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2219, 'Wood R', '1', '0', 'wood_r', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2220, 'Wood S', '1', '0', 'wood_s', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2221, 'Wood T', '1', '0', 'wood_t', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2222, 'Wood U', '1', '0', 'wood_u', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2223, 'Wood Undermark', '1', '0', 'wood_undermark', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2224, 'Wood V', '1', '0', 'wood_v', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2225, 'Wood W', '1', '0', 'wood_w', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2226, 'Wood X', '1', '0', 'wood_x', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2227, 'Wood Y', '1', '0', 'wood_y', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2228, 'Wood Z', '1', '0', 'wood_z', 2, 1, '227');
INSERT INTO `cms_homes_catalouge` VALUES (2229, 'Wormhand', '1', '0', 'wormhand', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (2230, 'Wunder Frank', '1', '0', 'wunderfrank', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2231, 'Wordwrestling', '1', '0', 'wwemvp', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2232, 'X', '1', '0', 'x', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (2233, 'Xmas Angel Wings', '1', '0', 'xmaangel_wings', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2234, 'Xmas Angel Wing Animated', '1', '0', 'xmaangelwinganim', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2236, 'Xmas Box Darkred', '1', '0', 'xmabox_darkred', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2237, 'Xmas Box Darkred 2', '1', '0', 'xmabox_darkred2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2238, 'Xmas Box Darkred 3', '1', '0', 'xmabox_darkred4', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2239, 'Xmas Box Green', '1', '0', 'xmabox_green', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2240, 'Xmas Box Green 2', '1', '0', 'xmabox_green_2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2241, 'Xmas Box Lime', '1', '0', 'xmabox_lime', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2242, 'Xmas Box Lime 2', '1', '0', 'xmabox_lime_2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2243, 'Xmas Box Orange', '1', '0', 'xmabox_orange', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2244, 'Xmas Box Red', '1', '0', 'xmabox_red', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2245, 'Xmas Box Suit Blue', '1', '0', 'xmabox_suit_blue', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2246, 'Xmas Box Suit Mint', '1', '0', 'xmabox_suit_mint', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2248, 'Xmas Box Suit Mint 2', '1', '0', 'xmabox_suit_mint2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2249, 'Xmas Box Suit Mint 3', '1', '0', 'xmabox_suit_mint3', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2250, 'Xmas Box Suit Orange', '1', '0', 'xmabox_suit_orange', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2251, 'Xmas Box Suit Pink', '1', '0', 'xmabox_suit_pink', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2252, 'Xmas Box Violet', '1', '0', 'xmabox_violet', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2253, 'Xmas Box', '1', '0', 'xmaboxs', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2255, 'Xmas Cat Animated', '1', '0', 'xmacat_animated', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2256, 'Xmas Dog Animated', '1', '0', 'xmadogi_animated', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2257, 'Xmas Dog Reindeer Sticker', '1', '0', 'xmadograindeer_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2258, 'Xmas Dog Reindeer Thumb', '1', '0', 'xmadograindeer_sticker.thumb', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2259, 'Xmas Gift-Afro', '1', '0', 'xmagift-afro', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2260, 'Xmas Gift Afro', '1', '0', 'xmagift_afro', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2261, 'Xmas Gift Strap Corner L', '1', '0', 'xmagift_strap_corner_l', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2262, 'Xmas Gift Strap Corner Bundle', '1', '0', 'xmagift_strap_corner_l_bundle', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2263, 'Xmas Gift Strap Corner R', '1', '0', 'xmagift_strap_corner_r', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2264, 'Xmas Gift Strap H', '1', '0', 'xmagift_strap_h', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2265, 'Xmas Gift Strap V', '1', '0', 'xmagift_strap_v', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2266, 'Xmas HC Ribbon', '1', '0', 'xmahc_ribbon', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2267, 'Xmas HC Ribbon 2', '1', '0', 'xmahc_ribbon_2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2268, 'Xmas Cicles', '1', '0', 'xmaicicles', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2269, 'Xmas Donkey Reindeer Sticker', '1', '0', 'xmajeff_donkey_reindeer_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2270, 'Xmas Sinister', '1', '0', 'xmamr_sinister', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2271, 'Xmas Rasta Santa', '1', '0', 'xmarastasanta', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2272, 'Xmas Skater Costume', '1', '0', 'xmaskater_costume', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2273, 'Xmas Smilla Snowboard', '1', '0', 'xmasmilla_snowboard', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2274, 'Xmas Snowcone Costume', '1', '0', 'xmasnowcone_costume', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2275, 'Xmas Snowlantern', '1', '0', 'xmasnowlantern_anim', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2276, 'Xmas Reindeer Dog', '1', '0', 'xmasticker_dograindeer', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2277, 'Xmas Horizontale Gold', '1', '0', 'xmastrap_horiz_gold', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2278, 'Xmas Horizontale Silver', '1', '0', 'xmastrap_horiz_silve', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2279, 'Xmas Vertical Gold', '1', '0', 'xmastrap_vertical_gold', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2280, 'Xmas Vertical Silver', '1', '0', 'xmastrap_vertical_silver', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2281, 'Xmas Animated Thumb', '1', '0', 'xmatree01_animated', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2282, 'Xmas Animated Thumb 2', '1', '0', 'xmatree01_animated_thumb2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2283, 'Xmas Tree Costume', '1', '0', 'xmatree_costume', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2284, 'Xmas Tree Sticker', '1', '0', 'xmaxtree_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2285, 'Xmas Light Animated', '1', '0', 'xmaslightanim', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2286, 'Xmas 3000 Animated Sticker', '1', '0', 'xmassticker_anim_3000', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2287, 'Y', '1', '0', 'y', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (2288, 'Yearbook Ribbon Sticker', '1', '0', 'yearbook_ribbon_sticker', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (2289, 'Yellow Starfish', '1', '0', 'yellowstarfish', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2290, 'Z', '1', '0', 'z', 2, 1, '203');
INSERT INTO `cms_homes_catalouge` VALUES (2291, 'Zack Ryder', '1', '0', 'zackryder', 2, 1, '209');
INSERT INTO `cms_homes_catalouge` VALUES (2292, 'Zombie Hand', '1', '0', 'zombiehand', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2293, 'Zombie Pupu', '1', '0', 'zombiepupu', 2, 1, '220');
INSERT INTO `cms_homes_catalouge` VALUES (2294, 'Kaatissakki Tausta', '4', '0', '27368_kaatissakki_tausta', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2295, 'Appart. 723 Scene', '4', '0', '27419_appart732_scene', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2296, 'Get it Card Background', '4', '0', '27835_getitcard_bg', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2297, 'GSOK', '4', '0', '27857_gsok_928x1360', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2298, 'HMF Principale', '4', '0', '28182_hmf_917x1360_principale', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2299, 'HMF Dediee', '4', '0', '28183_hmf_917x1360_dediee', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2300, 'HMF Principale B', '4', '0', '28184_hmf_917x1360_principale_b', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2301, 'Comic Style Orange', '4', '0', '28221_comic_style_orange', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2302, 'Productboard', '4', '0', '928x1360_productboard', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2303, 'Abrinq Infobus', '4', '0', 'abrinq_infobus', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2304, 'Abrinq Infobus G', '4', '0', 'abrinq_infobusg', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2305, 'Acma Cork Background', '4', '0', 'acma_cork_bg', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2306, 'Alhambra Group', '4', '0', 'alhambragroup', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2307, 'All Habbos Group', '4', '0', 'allhabbos_group', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2308, 'Amango Background', '4', '0', 'amango_bg', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2309, 'Ametrin', '4', '0', 'ametrin', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2310, 'Armin van Buren Background', '4', '0', 'arminvanbuuren_928x1360', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2311, 'Around the World Background', '4', '0', 'aroundtheworld_bg', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2312, 'AU Rock The Schools Background', '4', '0', 'au_rocktheschools_bg', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2313, 'AU Rock The Schools Background 2', '4', '0', 'au_rocktheschools_bg_v2', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2314, 'Background Tour', '4', '0', 'background_tour', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2315, 'Group Background', '4', '0', 'bgroup', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2316, 'Beachbunny Wallpaper', '4', '0', 'beachbunny_wallpaper', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2317, 'SPI Japaneese Petit', '4', '0', 'bg_27372_spi_jap_petit_03', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2318, 'Comic Style Orange Background', '4', '0', 'bg_28221_comic_style_orange_001', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2320, 'Background EF', '4', '0', 'bg_background_ef', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2321, 'Bathroom Tile Background', '4', '0', 'bg_bathroom_tile', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2322, 'Battle Ball Background 2', '4', '0', 'bg_battle_ball2', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2323, 'Infobus White Background 2', '4', '0', 'bg_bg_infobus_white', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2324, 'BHabboeart Background', '4', '0', 'bg_bHabboeart', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2325, 'Bonsai Background', '4', '0', 'bg_bonsai', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2326, 'Broken Glass Background', '4', '0', 'bg_broken_glass', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2327, 'Bubble Background', '4', '0', 'bg_bubble', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2328, 'Christmas 2007 Background', '4', '0', 'bg_christmas2007bg', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2330, 'Colour 01 Background', '4', '0', 'bg_colour_01', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2331, 'Colour 02 Background', '4', '0', 'bg_colour_02', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2332, 'Colour 03 Background', '4', '0', 'bg_colour_03', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2333, 'Colour 04 Background', '4', '0', 'bg_colour_04', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2334, 'Colour 05 Background', '4', '0', 'bg_colour_05', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2335, 'Colour 06 Background', '4', '0', 'bg_colour_06', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2336, 'Colour 07 Background', '4', '0', 'bg_colour_07', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2337, 'Colour 08 Background', '4', '0', 'bg_colour_08', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2338, 'Colour 09 Background', '4', '0', 'bg_colour_09', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2339, 'Colour 10 Background', '4', '0', 'bg_colour_10', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2340, 'Colour 11 Background', '4', '0', 'bg_colour_11', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2341, 'Colour 12 Background', '4', '0', 'bg_colour_12', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2342, 'Colour 13 Background', '4', '0', 'bg_colour_13', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2343, 'Colour 14 Background', '4', '0', 'bg_colour_14', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2344, 'Colour 15 Background', '4', '0', 'bg_colour_15', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2345, 'Colour 16 Background', '4', '0', 'bg_colour_16', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2346, 'Colour 17 Background', '4', '0', 'bg_colour_17', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2347, 'Comic Background', '4', '0', 'bg_comic2', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2348, 'Comic Sisters Background', '4', '0', 'bg_comic_sisters', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2349, 'Cork Background', '4', '0', 'bg_cork', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2350, 'Dark Floors Background', '4', '0', 'bg_dark_floors', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2351, 'Denim Background', '4', '0', 'bg_denim', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2352, 'Easter Eggs Background', '4', '0', 'bg_easter_eggs_wallpaper', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2353, 'Fansites Background', '4', '0', 'bg_fansites', 2, 1, '127');
INSERT INTO `cms_homes_catalouge` VALUES (2354, 'Goth Pattern Background', '4', '0', 'bg_goth_pattern', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2355, 'Grass Background', '4', '0', 'bg_grass', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2356, 'Habbo Lido Background', '4', '0', 'bg_habbolido', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2357, 'Habboween Background', '4', '0', 'bg_habboween', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2358, 'Hotel Background', '4', '0', 'bg_hotel', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2359, 'Valentine Love Background', '4', '0', 'bg_hw_val_bgpattern_love', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2360, 'Image Submarine Background', '4', '0', 'bg_image_submarine', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2361, 'Infobus Blue Background', '4', '0', 'bg_infobus_blue', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2362, 'Infobus White Background', '4', '0', 'bg_infobus_white', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2363, 'Infobus Yellow Background', '4', '0', 'bg_infobus_yellow', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2364, 'Kerrang', '4', '0', 'bg_kerrang2', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2365, 'Kingcorp Background', '4', '0', 'bg_kingcorp', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2366, 'Kingcorp Background 2', '4', '0', 'bg_kingcorp_928x1360', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2367, 'Konkur Rence Background', '4', '0', 'bg_konkurrence', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2368, 'Konkur Renceno Background', '4', '0', 'bg_konkurrenceno', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2369, 'Lace Background', '4', '0', 'bg_lace', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2370, 'Lido Flat Background', '4', '0', 'bg_lido_flat', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2371, 'Lido Background', '4', '0', 'bg_lidoo', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2372, 'Madball 2008 Background', '4', '0', 'bg_madball_2008_bg_001', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2373, 'Metal Background 2', '4', '0', 'bg_metal2', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2374, 'Natasha Bedingfield Background', '4', '0', 'bg_natashabedingfield', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2375, 'Newyear Background', '4', '0', 'bg_newyear', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2376, 'Newyear Fireworks Background', '4', '0', 'bg_newyear_bg_fireworks', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2377, 'Official Fansites Background', '4', '0', 'bg_official_fansites2', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2378, 'Pattern Abstract Background', '4', '0', 'bg_pattern_abstract1', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2379, 'Pattern Abstract Background 2', '4', '0', 'bg_pattern_abstract2', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2380, 'Pattern Bobbaskulls  Background', '4', '0', 'bg_pattern_bobbaskulls1', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2381, 'Pattern Bricks Background', '4', '0', 'bg_pattern_bricks', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2382, 'Pattern Bulb Background', '4', '0', 'bg_pattern_bulb', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2383, 'Pattern Carpants Background', '4', '0', 'bg_pattern_carpants', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2384, 'Pattern Cars Background', '4', '0', 'bg_pattern_cars', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2385, 'Pattern Clouds Background', '4', '0', 'bg_pattern_clouds', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2386, 'Pattern Deepred Background', '4', '0', 'bg_pattern_deepred', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2387, 'Pattern Fish Background', '4', '0', 'bg_pattern_fish', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2388, 'Pattern Floral Background 1', '4', '0', 'bg_pattern_floral_01', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2389, 'Pattern Floral Background 2', '4', '0', 'bg_pattern_floral_02', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2390, 'Pattern Floral Background 3', '4', '0', 'bg_pattern_floral_03', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2391, 'Pattern Floral Background', '4', '0', 'bg_pattern_floral_test', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2392, 'Pattern Hearts Background', '4', '0', 'bg_pattern_hearts', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2393, 'Pattern Plasto Background', '4', '0', 'bg_pattern_plasto', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2394, 'Pattern Space Background', '4', '0', 'bg_pattern_space', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2395, 'Pattern Tinyroom Background', '4', '0', 'bg_pattern_tinyroom', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2396, 'Poptarts CV Background', '4', '0', 'bg_poptarts_cv', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2397, 'Poptarts SB Background', '4', '0', 'bg_poptarts_sb', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2398, 'Rain Background', '4', '0', 'bg_rain', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2399, 'Rasta Background', '4', '0', 'bg_rasta_99x99', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2400, 'Ruled Paper Background', '4', '0', 'bg_ruled_paper', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2401, 'Serpentine Background', '4', '0', 'bg_serpentine_1', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2402, 'Serpentine  Background 2', '4', '0', 'bg_serpentine_2', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2403, 'Serpentine Darkblue Background', '4', '0', 'bg_serpentine_darkblue', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2404, 'Serpentine Darkred Background', '4', '0', 'bg_serpentine_darkred', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2405, 'Serpentine Darkred Background 2', '4', '0', 'bg_serpntine_darkred', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2406, 'Sexy Dance Background', '4', '0', 'bg_sexy_dance_2_group_opt2', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2407, 'Shabbolin Background', '4', '0', 'bg_shabbolin', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2408, 'Solid Black Background', '4', '0', 'bg_solid_black', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2409, 'Solid White Background', '4', '0', 'bg_solid_white', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2410, 'Starburst Raspberry Background', '4', '0', 'bg_starburst_raspberry', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2411, 'Stitched Background', '4', '0', 'bg_stitched', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2412, 'Stone Background', '4', '0', 'bg_stone', 2, 1, '128');
INSERT INTO `cms_homes_catalouge` VALUES (2413, 'Tonga Background', '4', '0', 'bg_tonga', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2414, 'Unofficial Fansites Background', '4', '0', 'bg_unofficial_fansites', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2415, 'US Staffers Background', '4', '0', 'bg_us_staffers', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2416, 'VIP Background', '4', '0', 'bg_vip', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2417, 'Voice of Teens Background', '4', '0', 'bg_voiceofteens', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2418, 'Wobble Squabble Background', '4', '0', 'bg_wobble_squabble', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2419, 'Wood Background', '4', '0', 'bg_wood', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2420, 'Xmas Starsky Background', '4', '0', 'bg_xmasbgpatternstarsky', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2421, 'Xmas Gift Background', '4', '0', 'bg_xmas_gift', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2422, 'Starysky  Background', '4', '0', 'bgpattern_starsky', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2423, 'Bionicle 2', '4', '0', 'bionicle2', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2424, 'Bubblejuice Background', '4', '0', 'bubblejuice_bg', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2425, 'Camo Cheese Background', '4', '0', 'camo_cheese_wallpaper', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2426, 'Cheese Suit', '4', '0', 'cheese_suit', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2427, 'Cheesewedge Background', '4', '0', 'cheesewedge_wallpaper', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2429, 'Christmas Background 2 ', '4', '0', 'christmas2007bg_001', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2430, 'CN Background', '4', '0', 'cn_mgpam_bg', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2431, 'CN Background 2', '4', '0', 'cn_mgpam_bg_v2', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2432, 'CN Background 3', '4', '0', 'cn_mgpam_bg_v3', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2433, 'China Kunfu Girl', '4', '0', 'cny_kunfu_girl', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2434, 'Comic Style', '4', '0', 'comic_style', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2435, 'Dia de Internet 2008', '4', '0', 'diadeinternet2008', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2436, 'Donnas Background 2', '4', '0', 'donnaswallpaper', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2437, 'Donnas Background', '4', '0', 'donnas_wallpaper', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2438, 'Earthday Background', '4', '0', 'earthday_bk', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2439, 'Easter Birdie', '4', '0', 'easter_birdie', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2440, 'Easter Broomstick', '4', '0', 'easter_broomstick_002', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2441, 'Easter Eggs Wallpaper', '4', '0', 'easter_egg_wallpaper', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2442, 'Easter Eggs Horizontal', '4', '0', 'easter_eggs_horizontal', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2443, 'Easter Eggs Vertical', '4', '0', 'easter_eggs_vertical_001', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2446, 'Easter Egg Costume', '4', '0', 'easteregg_costume', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2447, 'E-Wallpaper', '4', '0', 'e928x1360', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2448, 'ES Calandar Background', '4', '0', 'es_calendarbg', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2449, 'ES Italia Background', '4', '0', 'es_wallpaper_italia', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2450, 'ES Obrero Background', '4', '0', 'es_wallpaper_obrero', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2451, 'ES Sralim Background', '4', '0', 'es_wallpaper_sralim', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2452, 'Executive Background', '4', '0', 'exe_background', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2453, 'Executive Wood Background', '4', '0', 'exe_wood_background', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2454, 'Executive Viilu Background', '4', '0', 'exec_bg_viilu', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2455, 'Expert Background', '4', '0', 'expert_backround', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2456, 'Fantastic Four 3', '4', '0', 'fan43', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2457, 'Fantastic Four 1', '4', '0', 'fantastic4', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2458, 'Fantastic Four 2', '4', '0', 'fantastic42', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2459, 'Fantastic Four', '4', '0', 'fantasticfour', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2460, 'Felix 3rd', '4', '0', 'felix03', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2461, 'Felix Ryhmasivutausta', '4', '0', 'felix_ryhmasivutausta', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2462, 'Felix Ryhmasivutaustakuva', '4', '0', 'felix_ryhmasivutaustakuva', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2463, 'Festade Boasvindas', '4', '0', 'festadeboasvindas', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2464, 'FI Linnamaki Background', '4', '0', 'fi_linnanmaki_bg', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2465, 'FI Puffet Background', '4', '0', 'fi_puffet_bg', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2466, 'Fondo Habbo Cibervoluntarios', '4', '0', 'fondo_habbo_cibervoluntarios', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2467, 'FR Spiderwick', '4', '0', 'fr_spiderwick', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2468, 'Global World Background', '4', '0', 'globalw_background', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2469, 'Goth Pattern', '4', '0', 'goth_pattern', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2470, 'Goth Pattern 2', '4', '0', 'goth_patternn', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2471, 'Grandi Habbo Ryhma', '4', '0', 'grandi_habbo_ryhma', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2472, 'Snowbattle Background 2', '4', '0', 'grouppage_snowbattle2', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2473, 'Grunge Background', '4', '0', 'grungewall', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2474, 'Gruposeda Teens', '4', '0', 'gruposedateens', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2475, 'Guidesgroup Background', '4', '0', 'guidesgroup_bg', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2476, 'Habbo Group Tutorial', '4', '0', 'habbo_group_tutorial', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2478, 'Habbo Ryhmatausta', '4', '0', 'habbo_ryhmatausta', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2479, 'Habbo Social Game', '4', '0', 'habbo_social_game_001_opt', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2480, 'Habbo Social Game 2', '4', '0', 'habbo_social_game_002', 2, 1, '129');
INSERT INTO `cms_homes_catalouge` VALUES (2481, 'Habbo Toolbar Background', '4', '0', 'habbo_toolbar', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2482, 'Habbo Classifieds Background', '4', '0', 'habboclassifieds', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2483, 'Habbo Fest 2008 Background', '4', '0', 'habbofest2008_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2484, 'Habbo Group Background', '4', '0', 'habbogroup', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2485, 'Habboguide Background', '4', '0', 'habboguide', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2486, 'Habborella Sea Background', '4', '0', 'habborella_sea_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2487, 'Habborella Background', '4', '0', 'habborellabg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2488, 'Habbos Background', '4', '0', 'habbos_group', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2489, 'Habboween Background', '4', '0', 'habboween_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2491, 'Habbox Background', '4', '0', 'habbox', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2493, 'Hanna Montana Background', '4', '0', 'hannamontanawp', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2494, 'HC Machine Background', '4', '0', 'hc_bg_machine', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2495, 'HC Pillow Background', '4', '0', 'hc_bg_pillow', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2496, 'HC Royal Background', '4', '0', 'hc_bg_royal', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2497, 'Dediee', '4', '0', 'hmf_928x1360_dediee', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2498, 'Principale', '4', '0', 'hmf_928x1360_principale', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2499, 'Principale 2', '4', '0', 'hmf_928x1360_principale_b', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2500, 'Hundredmillion Background', '4', '0', 'hundredmillionbg', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2501, 'Hundredmillion Background', '4', '0', 'hundredmillion_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2502, 'Around the World Wallpaper', '4', '0', 'hwaround_the_world_wallpaper', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2503, 'BGUS Staff', '4', '0', 'hwbgus-staff', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2504, 'Easter Egg Wallpaper', '4', '0', 'hweaster_egg_wallpaper', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2505, 'Xmas Gifts Background', '4', '0', 'hwxmas_gifts_bg', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2506, 'Bassplayer Girl', '4', '0', 'hw_bassplayer_girl', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2507, 'Valentine Love Background', '4', '0', 'hw_val_bgpattern_love', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2508, 'Infobus SEM Logo', '4', '0', 'infobus_abrinq_sem_logo', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2509, 'Inked Background', '4', '0', 'inked_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2510, 'Jopelines', '4', '0', 'jopelines', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2511, 'Jordin Parks', '4', '0', 'jordinparks', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2512, 'Japaneese Valentine', '4', '0', 'jpvalentine', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2513, 'Japaneese Background', '4', '0', 'jp_prom_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2514, 'Japaneese Valentine', '4', '0', 'jp_valentine', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2515, 'July Wallpaper', '4', '0', 'july408_wallpaper', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2516, 'Kerrang', '4', '0', 'kerrang2', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2517, 'KFP Background', '4', '0', 'kfp_grouppage_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2518, 'Kingcorps', '4', '0', 'kingcorp928x1360', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2519, 'Kingcorps', '4', '0', 'kingcorp_928x1360', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2520, 'Kir Background', '4', '0', 'kir_grouppage_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2521, 'Kir Stamp', '4', '0', 'kir_stamp4', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2522, 'Kungfu Background', '4', '0', 'kungfu_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2523, 'Madball 2008 Background', '4', '0', 'madball_2008_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2525, 'Makeover Background', '4', '0', 'makeover', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2526, 'Manteli Background', '4', '0', 'manteli_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2527, 'Meet Dave Background', '4', '0', 'meet_dave_groupbg_01', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2528, 'Meet Dave Background 2', '4', '0', 'meet_dave_groupbg_02', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2529, 'Misshabbo Scene', '4', '0', 'misshabbo_scene', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2530, 'Mmoore Wallpaper', '4', '0', 'mmoorewallpaper', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2531, 'MMS', '4', '0', 'mms', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2532, 'Netari Background', '4', '0', 'netaribg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2534, 'Newyear Fireworks Background', '4', '0', 'newyear_bg_fireworks', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2536, 'Newyear Fireworks Background 2', '4', '0', 'newyear_bg_fireworks2', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2537, 'Green Background', '4', '0', 'nl_green_bg', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2538, 'NS France', '4', '0', 'nsfrance', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2539, 'NS France 2', '4', '0', 'nsfrance2', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2540, 'OB', '4', '0', 'ob1', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2541, 'OB 2', '4', '0', 'ob2', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2542, 'Orca', '4', '0', 'orca', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2543, 'Penelope', '4', '0', 'penelope', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2544, 'Poptarts CV', '4', '0', 'poptarts_cv', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2546, 'Promofthedead Wallpaper', '4', '0', 'promofthedead_wallpaper', 2, 1, '130');
INSERT INTO `cms_homes_catalouge` VALUES (2547, 'Random Habbos', '4', '0', 'random_habbos', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2548, 'Robojam Wallpaper', '4', '0', 'robojam_wallpaper', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2549, 'Room of the Week Background', '4', '0', 'room_of_the_week_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2550, 'Safetyweek Background', '4', '0', 'safetyweek2008', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2551, 'Safetyweek Background 2', '4', '0', 'safetyweek2008_b', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2552, 'Safetyweek Background 3', '4', '0', 'safetyweek2008_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2553, 'Samsungclouds', '4', '0', 'samsungclouds', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2554, 'Samsunlight', '4', '0', 'samsungnight', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2555, 'Sasquatch Background', '4', '0', 'sasquatch_hhbg3', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2556, 'Scarecrow Background', '4', '0', 'scarecrowbg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2557, 'Animax Keroro', '4', '0', 'sg_animax_keroro', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2558, 'MTV Background', '4', '0', 'sg_mtv_grouppage_bg_v1', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2559, 'MTV Background 2', '4', '0', 'sg_mtv_grouppage_bg_v2', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2560, 'Shabbo Line', '4', '0', 'shabboline', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2561, 'Silver Surfer', '4', '0', 'silversurfer', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2564, 'Simpleplan Background', '4', '0', 'simpleplan_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2566, 'Slamdunk', '4', '0', 'slamdunk', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2567, 'Snowstorm Background', '4', '0', 'snowstorm_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2568, 'Sofresh Background', '4', '0', 'sofresh_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2569, 'Solid Background Black', '4', '0', 'solid_bg_black', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2570, 'Solid Background White', '4', '0', 'solid_bg_white', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2571, 'Spiderwick Beware', '4', '0', 'spiderwick_beware', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2572, 'Spiderwick Fairy', '4', '0', 'spiderwick_fairy', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2573, 'Spiderwick Goblin', '4', '0', 'spiderwick_goblin', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2574, 'Spiderwick Main', '4', '0', 'spiderwick_main', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2575, 'SPM Background', '4', '0', 'spm_background', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2576, 'SPM Background 2', '4', '0', 'spm_bg_version_041207', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2577, 'Snowstorm Red Costume', '4', '0', 'ss_bootsitjalapaset_red', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2578, 'Snowstorm Blue Costume', '4', '0', 'ss_costume_blue', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2579, 'Raspberry', '4', '0', 'starburstraspberry', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2580, 'sticker_Cape', '4', '0', 'sticker_cape', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2581, 'sticker_Heartbeat ', '4', '0', 'sticker_heartbeat_2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2582, 'sticker_Masque 4', '4', '0', 'sticker_masque_04', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2583, 'Stray Pixel Background', '4', '0', 'straypixelsbg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2584, 'Streaming 1', '4', '0', 'streaming001', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2585, 'Streaming 2', '4', '0', 'streaming002', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2586, 'Streaming 3', '4', '0', 'streaming003', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2587, 'Sttrinians Blackboard', '4', '0', 'sttriniansblackboard', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2588, 'Sttrinians Group', '4', '0', 'sttriniansgroup', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2589, 'Summer Background', '4', '0', 'summer_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2590, 'Summer Background Optimal', '4', '0', 'summer_bg_optimal', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2592, 'The Green', '4', '0', 'the_green', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2593, 'Themepark Background 1', '4', '0', 'themepark_bg_01', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2594, 'Themepark Background 2', '4', '0', 'themepark_bg_02', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2595, 'Tiki Firehead Background', '4', '0', 'tiki_firehead_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2596, 'Tokiohotel Wallpaper', '4', '0', 'tokiohotel2', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2597, 'Tokiohotel Scream Wallpaper', '4', '0', 'tokiohotel_scream_wallpaper', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2599, 'Top Gamers Background', '4', '0', 'top_gamers_bg_64', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2600, 'Trax Bling', '4', '0', 'trax_bling', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2602, 'USA Staff Wallpaper', '4', '0', 'usastaff-wall', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2605, 'Valentine Costume 4', '4', '0', 'val_love-costume4', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2606, 'Valentine Costume 3', '4', '0', 'val_lovecostume3', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2607, 'Vale Rose Background', '4', '0', 'vale_rose_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2608, 'Vale Skull Background', '4', '0', 'vale_skull_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2609, 'VIP Group', '4', '0', 'vip_group', 2, 1, '50');
INSERT INTO `cms_homes_catalouge` VALUES (2611, 'Wallpaper Voiceofteens', '4', '0', 'voiceofteens', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2612, 'Wallepixar Background', '4', '0', 'wallepixar_bg', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2613, 'Wallpaper 1', '4', '0', 'wallpaper1', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2614, 'Wallpaper 2', '4', '0', 'wallpaper2', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2616, 'Wallpaper 3', '4', '0', 'wallpaper3', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2617, 'Wallpaper 4', '4', '0', 'wallpaper4', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2618, 'Wallpaper Bonsai', '4', '0', 'wallpaper_bonsai', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2619, 'Wallpaper Cais', '4', '0', 'wallpaper_cais4', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2620, 'Wallpaper Earthday', '4', '0', 'wallpaper_earthday', 2, 1, '131');
INSERT INTO `cms_homes_catalouge` VALUES (2621, 'Wallpaper Mshepard', '4', '0', 'wallpaper_mshepard', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2622, 'Wallpaper Newsiesca', '4', '0', 'wallpaper_newsiesca', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2623, 'Wallpaper Veronicas', '4', '0', 'wallpaper_veronicas', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2624, 'Wallpaper Victoriaday', '4', '0', 'wallpaper_victoriaday', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2625, 'Welcoming Party', '4', '0', 'welcoming_party', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2626, 'Wrestlemania Nowayout Wallpaper', '4', '0', 'wwe_nowayout_wallpaper', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2627, 'Wrestlemania Wallpaper', '4', '0', 'wwe_wallpaper', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2628, 'Wrestlemania Big Battle', '4', '0', 'wwe_wrestlemania_big_battle', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2629, 'Wrestlemania Bunnymania', '4', '0', 'wwe_wrestlemania_bunnymania', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2630, 'Wrestlemania Ladder Match', '4', '0', 'wwe_wrestlemania_ladder_match', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2631, 'Wrestlemania Main', '4', '0', 'wwe_wrestlemania_main', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2632, 'Wrestlemania Triple Champ', '4', '0', 'wwe_wrestlemania_triple_champ', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2633, 'Wrestlemania World Champ', '4', '0', 'wwe_wrestlemania_world_champ', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2634, 'Xmas 2006 Background', '4', '0', 'xmas2006backgrounds', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2635, 'Xmas Background Starsky', '4', '0', 'xmasbgpatternstarsky', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2636, 'Xmas Background Starsky', '4', '0', 'xmas_bgpattern_starsky', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2637, 'Xmas Box Darkred', '4', '0', 'xmas_box_darkred', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2638, 'Xmas Box Darkred 2', '4', '0', 'xmas_box_darkred2', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2639, 'Xmas Box Darkred 3', '4', '0', 'xmas_box_darkred3', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2640, 'Xmas Box Green', '4', '0', 'xmas_box_green', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2641, 'Xmas Box Lime', '4', '0', 'xmas_box_lime', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2642, 'Xmas Gifts Background', '4', '0', 'xmas_gifts_bg', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2645, 'Xmas Gifts Background 2', '4', '0', 'xmas_gifts_gb', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (2646, 'Xmas HC Ribbon', '4', '0', 'xmas_hc_ribbon', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2647, 'Xmas Reindeer Sticker', '4', '0', 'xmas_jeff_donkey_reindeer_sticker', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2648, 'Xmas Tree Animated', '4', '0', 'xmas_tree01_animated', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2649, 'Yearbook Wallpaper', '4', '0', 'yearbook_wallpaper', 2, 1, '132');
INSERT INTO `cms_homes_catalouge` VALUES (1, 'Genie Fire Head', '1', '0', 'geniefirehead', 2, 1, '19');
INSERT INTO `cms_homes_catalouge` VALUES (2781, 'blue_diner_a', '1', '0', 'blue_diner_a', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2782, 'blue_diner_a_umlaut', '1', '0', 'blue_diner_a_umlaut', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2783, 'blue_diner_ae', '1', '0', 'blue_diner_ae', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2784, 'blue_diner_b', '1', '0', 'blue_diner_b', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2785, 'blue_diner_c', '1', '0', 'blue_diner_c', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2786, 'blue_diner_c_cedilla', '1', '0', 'blue_diner_c_cedilla', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2787, 'blue_diner_d', '1', '0', 'blue_diner_d', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2788, 'blue_diner_e', '1', '0', 'blue_diner_e', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2789, 'blue_diner_e_acc', '1', '0', 'blue_diner_e_acc', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2790, 'blue_diner_e_acc_grave', '1', '0', 'blue_diner_e_acc_grave', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2791, 'blue_diner_eight', '1', '0', 'blue_diner_eight', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2792, 'blue_diner_exclamation', '1', '0', 'blue_diner_exclamation', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2793, 'blue_diner_f', '1', '0', 'blue_diner_f', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2794, 'blue_diner_five', '1', '0', 'blue_diner_five', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2795, 'blue_diner_four', '1', '0', 'blue_diner_four', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2796, 'blue_diner_g', '1', '0', 'blue_diner_g', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2797, 'blue_diner_h', '1', '0', 'blue_diner_h', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2798, 'blue_diner_i', '1', '0', 'blue_diner_i', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2799, 'blue_diner_j', '1', '0', 'blue_diner_j', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2800, 'blue_diner_k', '1', '0', 'blue_diner_k', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2801, 'blue_diner_l', '1', '0', 'blue_diner_l', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2802, 'blue_diner_m', '1', '0', 'blue_diner_m', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2803, 'blue_diner_n', '1', '0', 'blue_diner_n', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2804, 'blue_diner_nine', '1', '0', 'blue_diner_nine', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2805, 'blue_diner_o', '1', '0', 'blue_diner_o', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2806, 'blue_diner_o_accute', '1', '0', 'blue_diner_o_accute', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2807, 'blue_diner_o_cc_grave', '1', '0', 'blue_diner_o_cc_grave', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2808, 'blue_diner_o_umlaut', '1', '0', 'blue_diner_o_umlaut', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2809, 'blue_diner_one', '1', '0', 'blue_diner_one', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2810, 'blue_diner_p', '1', '0', 'blue_diner_p', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2811, 'blue_diner_q', '1', '0', 'blue_diner_q', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2812, 'blue_diner_question', '1', '0', 'blue_diner_question', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2813, 'blue_diner_r', '1', '0', 'blue_diner_r', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2814, 'blue_diner_s', '1', '0', 'blue_diner_s', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2815, 'blue_diner_seven', '1', '0', 'blue_diner_seven', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2816, 'blue_diner_six', '1', '0', 'blue_diner_six', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2817, 'blue_diner_t', '1', '0', 'blue_diner_t', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2818, 'blue_diner_three', '1', '0', 'blue_diner_three', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2819, 'blue_diner_two', '1', '0', 'blue_diner_two', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2820, 'blue_diner_u', '1', '0', 'blue_diner_u', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2821, 'blue_diner_u_acc', '1', '0', 'blue_diner_u_acc', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2822, 'blue_diner_u_acc_grave', '1', '0', 'blue_diner_u_acc_grave', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2823, 'blue_diner_u_umlaut', '1', '0', 'blue_diner_u_umlaut', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2824, 'blue_diner_upsidedown', '1', '0', 'blue_diner_upsidedown', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2825, 'blue_diner_v', '1', '0', 'blue_diner_v', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2826, 'blue_diner_w', '1', '0', 'blue_diner_w', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2827, 'blue_diner_x', '1', '0', 'blue_diner_x', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2828, 'blue_diner_y', '1', '0', 'blue_diner_y', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2829, 'blue_diner_z', '1', '0', 'blue_diner_z', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2830, 'blue_diner_zero', '1', '0', 'blue_diner_zero', 2, 1, '242');
INSERT INTO `cms_homes_catalouge` VALUES (2930, 'diner_belair', '1', '0', 'diner_belair', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2933, 'diner_gaspump_blue', '1', '0', 'diner_gaspump_blue', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2934, 'diner_gaspump_green', '1', '0', 'diner_gaspump_green', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2935, 'diner_gaspump_red', '1', '0', 'diner_gaspump_red', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2941, 'diner_hotrod', '1', '0', 'diner_hotrod', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2943, 'diner_plymouth', '1', '0', 'diner_plymouth', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2944, 'diner_poster', '1', '0', 'diner_poster', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2945, 'diner_sign', '1', '0', 'diner_sign', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2947, 'diner_trophy_bronze', '1', '0', 'diner_trophy_bronze', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2948, 'diner_trophy_gold', '1', '0', 'diner_trophy_gold', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2949, 'diner_trophy_silver', '1', '0', 'diner_trophy_silver', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (3080, 'green_diner_a', '1', '0', 'green_diner_a', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3081, 'green_diner_a_umlaut', '1', '0', 'green_diner_a_umlaut', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3082, 'green_diner_ae', '1', '0', 'green_diner_ae', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3083, 'green_diner_b', '1', '0', 'green_diner_b', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3084, 'green_diner_c', '1', '0', 'green_diner_c', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3085, 'green_diner_c_cedilla', '1', '0', 'green_diner_c_cedilla', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3086, 'green_diner_d', '1', '0', 'green_diner_d', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3087, 'green_diner_e', '1', '0', 'green_diner_e', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3088, 'green_diner_e_acc', '1', '0', 'green_diner_e_acc', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3089, 'green_diner_e_cc_grave', '1', '0', 'green_diner_e_cc_grave', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3090, 'green_diner_eight', '1', '0', 'green_diner_eight', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3091, 'green_diner_exclamation', '1', '0', 'green_diner_exclamation', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3092, 'green_diner_f', '1', '0', 'green_diner_f', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3093, 'green_diner_five', '1', '0', 'green_diner_five', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3094, 'green_diner_four', '1', '0', 'green_diner_four', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3095, 'green_diner_g', '1', '0', 'green_diner_g', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3096, 'green_diner_h', '1', '0', 'green_diner_h', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3097, 'green_diner_i', '1', '0', 'green_diner_i', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3098, 'green_diner_j', '1', '0', 'green_diner_j', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3099, 'green_diner_k', '1', '0', 'green_diner_k', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3100, 'green_diner_l', '1', '0', 'green_diner_l', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3101, 'green_diner_m', '1', '0', 'green_diner_m', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3102, 'green_diner_n', '1', '0', 'green_diner_n', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3103, 'green_diner_nine', '1', '0', 'green_diner_nine', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3104, 'green_diner_o', '1', '0', 'green_diner_o', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3105, 'green_diner_o_accute', '1', '0', 'green_diner_o_accute', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3106, 'green_diner_o_cc_grave', '1', '0', 'green_diner_o_cc_grave', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3107, 'green_diner_o_umlaut', '1', '0', 'green_diner_o_umlaut', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3108, 'green_diner_one', '1', '0', 'green_diner_one', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3109, 'green_diner_p', '1', '0', 'green_diner_p', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3110, 'green_diner_q', '1', '0', 'green_diner_q', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3111, 'green_diner_question', '1', '0', 'green_diner_question', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3112, 'green_diner_r', '1', '0', 'green_diner_r', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3113, 'green_diner_s', '1', '0', 'green_diner_s', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3114, 'green_diner_seven', '1', '0', 'green_diner_seven', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3115, 'green_diner_six', '1', '0', 'green_diner_six', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3116, 'green_diner_t', '1', '0', 'green_diner_t', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3117, 'green_diner_three', '1', '0', 'green_diner_three', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3118, 'green_diner_two', '1', '0', 'green_diner_two', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3119, 'green_diner_u', '1', '0', 'green_diner_u', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3120, 'green_diner_u_acc', '1', '0', 'green_diner_u_acc', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3121, 'green_diner_u_acc_grave', '1', '0', 'green_diner_u_acc_grave', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3122, 'green_diner_u_umlaut', '1', '0', 'green_diner_u_umlaut', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3123, 'green_diner_upsidedown', '1', '0', 'green_diner_upsidedown', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3124, 'green_diner_v', '1', '0', 'green_diner_v', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3125, 'green_diner_w', '1', '0', 'green_diner_w', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3126, 'green_diner_x', '1', '0', 'green_diner_x', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3127, 'green_diner_y', '1', '0', 'green_diner_y', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (3128, 'green_diner_z', '1', '0', 'green_diner_z', 2, 1, '244');
INSERT INTO `cms_homes_catalouge` VALUES (2911, 'darkknight_batman_suit', '1', '0', 'darkknight_batman_suit', 2, 1, '245');
INSERT INTO `cms_homes_catalouge` VALUES (2912, 'darkknight_clownface', '1', '0', 'darkknight_clownface', 2, 1, '245');
INSERT INTO `cms_homes_catalouge` VALUES (2913, 'darkknight_dentbutton', '1', '0', 'darkknight_dentbutton', 2, 1, '245');
INSERT INTO `cms_homes_catalouge` VALUES (2914, 'darkknight_jokercard', '1', '0', 'darkknight_jokercard', 2, 1, '245');
INSERT INTO `cms_homes_catalouge` VALUES (2915, 'darkknight_jokerface', '1', '0', 'darkknight_jokerface', 2, 1, '245');
INSERT INTO `cms_homes_catalouge` VALUES (2916, 'darkknight_logo', '1', '0', 'darkknight_logo', 2, 1, '245');
INSERT INTO `cms_homes_catalouge` VALUES (4324, 'darkknight_wallpaper', '4', '0', 'darkknight_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (3530, 'red_diner_a', '1', '0', 'red_diner_a', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3531, 'red_diner_a_umlaut', '1', '0', 'red_diner_a_umlaut', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3532, 'red_diner_ae', '1', '0', 'red_diner_ae', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3533, 'red_diner_b', '1', '0', 'red_diner_b', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3534, 'red_diner_c', '1', '0', 'red_diner_c', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3535, 'red_diner_c_cedilla', '1', '0', 'red_diner_c_cedilla', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3536, 'red_diner_d', '1', '0', 'red_diner_d', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3537, 'red_diner_e', '1', '0', 'red_diner_e', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3538, 'red_diner_e_acc', '1', '0', 'red_diner_e_acc', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3539, 'red_diner_e_cc_grave', '1', '0', 'red_diner_e_cc_grave', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3540, 'red_diner_eight', '1', '0', 'red_diner_eight', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3541, 'red_diner_exclamation', '1', '0', 'red_diner_exclamation', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3542, 'red_diner_f', '1', '0', 'red_diner_f', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3543, 'red_diner_five', '1', '0', 'red_diner_five', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3544, 'red_diner_four', '1', '0', 'red_diner_four', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3545, 'red_diner_g', '1', '0', 'red_diner_g', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3546, 'red_diner_h', '1', '0', 'red_diner_h', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3547, 'red_diner_i', '1', '0', 'red_diner_i', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3548, 'red_diner_j', '1', '0', 'red_diner_j', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3549, 'red_diner_k', '1', '0', 'red_diner_k', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3550, 'red_diner_l', '1', '0', 'red_diner_l', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3551, 'red_diner_m', '1', '0', 'red_diner_m', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3552, 'red_diner_n', '1', '0', 'red_diner_n', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3553, 'red_diner_nine', '1', '0', 'red_diner_nine', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3554, 'red_diner_o', '1', '0', 'red_diner_o', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3555, 'red_diner_o_accute', '1', '0', 'red_diner_o_accute', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3556, 'red_diner_o_cc_grave', '1', '0', 'red_diner_o_cc_grave', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3557, 'red_diner_o_umlaut', '1', '0', 'red_diner_o_umlaut', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3558, 'red_diner_one', '1', '0', 'red_diner_one', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3559, 'red_diner_p', '1', '0', 'red_diner_p', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3560, 'red_diner_q', '1', '0', 'red_diner_q', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3561, 'red_diner_question', '1', '0', 'red_diner_question', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3562, 'red_diner_r', '1', '0', 'red_diner_r', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3563, 'red_diner_s', '1', '0', 'red_diner_s', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3564, 'red_diner_seven', '1', '0', 'red_diner_seven', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3565, 'red_diner_six', '1', '0', 'red_diner_six', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3566, 'red_diner_t', '1', '0', 'red_diner_t', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3567, 'red_diner_three', '1', '0', 'red_diner_three', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3568, 'red_diner_two', '1', '0', 'red_diner_two', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3569, 'red_diner_u', '1', '0', 'red_diner_u', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3570, 'red_diner_u_acc', '1', '0', 'red_diner_u_acc', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3571, 'red_diner_u_acc_grave', '1', '0', 'red_diner_u_acc_grave', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3572, 'red_diner_u_umlaut', '1', '0', 'red_diner_u_umlaut', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3573, 'red_diner_upsidedown', '1', '0', 'red_diner_upsidedown', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3574, 'red_diner_v', '1', '0', 'red_diner_v', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3575, 'red_diner_w', '1', '0', 'red_diner_w', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3576, 'red_diner_x', '1', '0', 'red_diner_x', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3577, 'red_diner_y', '1', '0', 'red_diner_y', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3578, 'red_diner_z', '1', '0', 'red_diner_z', 2, 1, '246');
INSERT INTO `cms_homes_catalouge` VALUES (3464, 'olym_carson', '1', '0', 'olym_carson', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3465, 'olym_cresthawk', '1', '0', 'olym_cresthawk', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3466, 'olym_inari', '1', '0', 'olym_inari', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3467, 'olym_jandelee', '1', '0', 'olym_jandelee', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3468, 'olym_lady', '1', '0', 'olym_lady', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3469, 'olym_loderse', '1', '0', 'olym_loderse', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3470, 'olym_moiraine', '1', '0', 'olym_moiraine', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3471, 'olym_nme', '1', '0', 'olym_nme', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3472, 'olym_smoothcriminal', '1', '0', 'olym_smoothcriminal', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3473, 'olym_spartan', '1', '0', 'olym_spartan', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3474, 'olym_squib', '1', '0', 'olym_squib', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (3475, 'olym_thegirls', '1', '0', 'olym_thegirls', 2, 1, '247');
INSERT INTO `cms_homes_catalouge` VALUES (2655, '25_146x146_habbo_sticker_fi', '1', '0', '25_146x146_habbo_sticker_fi', 2, 1, '214');
INSERT INTO `cms_homes_catalouge` VALUES (2713, 'backtoschool_badapple', '1', '0', 'backtoschool_badapple', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2714, 'backtoschool_goldapple', '1', '0', 'backtoschool_goldapple', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2715, 'backtoschool_trophy', '1', '0', 'backtoschool_trophy', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (2740, 'bg_stickie', '4', '0', 'bg_stickie', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2868, 'cat_animated', '1', '0', 'cat_animated', 2, 1, '1000');
INSERT INTO `cms_homes_catalouge` VALUES (2873, 'checker_border_h', '1', '0', 'checker_border_h', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (2874, 'checker_border_v', '1', '0', 'checker_border_v', 2, 1, '243');
INSERT INTO `cms_homes_catalouge` VALUES (3148, 'habbo_x_home_sticker', '1', '0', 'habbo_x_home_sticker', 2, 1, '230');
INSERT INTO `cms_homes_catalouge` VALUES (3180, 'hw_bassplayer_girl2', '1', '0', 'hw_bassplayer_girl2', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (3210, 'hw_keyboards1', '1', '0', 'hw_keyboards1', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (3211, 'hw_keyboards2', '1', '0', 'hw_keyboards2', 2, 1, '221');
INSERT INTO `cms_homes_catalouge` VALUES (3512, 'pretzel', '1', '0', 'pretzel', 2, 1, '216');
INSERT INTO `cms_homes_catalouge` VALUES (3927, 'teensbear', '1', '0', 'teensbear', 2, 1, '235');
INSERT INTO `cms_homes_catalouge` VALUES (3945, 'tiki_volcano', '1', '0', 'tiki_volcano', 2, 1, '207');
INSERT INTO `cms_homes_catalouge` VALUES (4160, '10kbc_habbo_grouppage_bg_2b', '4', '0', '10kbc_habbo_grouppage_bg_2b', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4161, '10kbc_habbo_grouppage_bg_3b', '4', '0', '10kbc_habbo_grouppage_bg_3b', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4162, '26_habbo_background_fi', '4', '0', '26_habbo_background_fi', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4182, 'au_iflyvampwasp_bg_v1', '4', '0', 'au_iflyvampwasp_bg_v1', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4183, 'au_iflyvampwasp_bg_v2', '4', '0', 'au_iflyvampwasp_bg_v2', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4186, 'au_spiderwick_bg', '4', '0', 'au_spiderwick_bg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4187, 'background_momie3_928x1360', '4', '0', 'background_momie3_928x1360', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4189, 'backtoschool_wallpaper', '4', '0', 'backtoschool_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4194, 'bg_alhambra', '4', '0', 'bg_alhambra', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4195, 'bg_animegroup', '4', '0', 'bg_animegroup', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4251, 'bg_moviesgroup', '4', '0', 'bg_moviesgroup', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4252, 'bg_musicgroup', '4', '0', 'bg_musicgroup', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4287, 'bg_solid_bg_white', '4', '0', 'bg_solid_bg_white', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4296, 'bg_videogamesgroup', '4', '0', 'bg_videogamesgroup', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4306, 'bmx_tailwhip', '4', '0', 'bmx_tailwhip', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4309, 'camocheese_wallpaper', '4', '0', 'camocheese_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4319, 'cw_group_1', '4', '0', 'cw_group_1', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4321, 'cw_group_2', '4', '0', 'cw_group_2', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4323, 'cw_poster', '4', '0', 'cw_poster', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4328, 'diner_global', '4', '0', 'diner_global', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4337, 'easter_eggs_wallpaper', '4', '0', 'easter_eggs_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4338, 'easter_eggs_wallpaper2', '4', '0', 'easter_eggs_wallpaper2', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4361, 'geeks_wallpaper', '4', '0', 'geeks_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4366, 'greasers_wallpaper', '4', '0', 'greasers_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4369, 'gruposedateens.jpg', '4', '0', 'gruposedateens.jpg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4371, 'guitarhero', '4', '0', 'guitarhero', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4372, 'gyroscope_grouppage_bg_v1', '4', '0', 'gyroscope_grouppage_bg_v1', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4374, 'habbo_bmx_foot_jam_tailwhip_bg', '4', '0', 'habbo_bmx_foot_jam_tailwhip_bg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4376, 'habbo_group_tutorial_bg', '4', '0', 'habbo_group_tutorial_bg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4385, 'habbolympics_bg_final', '4', '0', 'habbolympics_bg_final', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4390, 'habboween_bg_bg', '4', '0', 'habboween_bg_bg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4392, 'hannah_montana_background', '4', '0', 'hannah_montana_background', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4397, 'head_guides_germany', '4', '0', 'head_guides_germany', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4398, 'head_guides_switserland', '4', '0', 'head_guides_switserland', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4412, 'jocks_wallpaper', '4', '0', 'jocks_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4419, 'kerli_wallpaper', '4', '0', 'kerli_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4427, 'landing_page_comp', '4', '0', 'landing_page_comp', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4429, 'madball_2008_bg_001', '4', '0', 'madball_2008_bg_001', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4430, 'madball_wallpaper', '4', '0', 'madball_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4438, 'myspy_group', '4', '0', 'myspy_group', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4444, 'nicolajrasted_vip', '4', '0', 'nicolajrasted_vip', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4453, 'poptarts_cv_002.jpg', '4', '0', 'poptarts_cv_002.jpg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4456, 'rexona_bg', '4', '0', 'rexona_bg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4471, 'silversurfer2', '4', '0', 'silversurfer2', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4472, 'silversurfer3', '4', '0', 'silversurfer3', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4475, 'skateollie_bg', '4', '0', 'skateollie_bg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4476, 'skateollie_bg2', '4', '0', 'skateollie_bg2', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4477, 'skulls_wallpaper', '4', '0', 'skulls_wallpaper', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4505, 'test', '4', '0', 'test', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4512, 'toolbar_bg', '4', '0', 'toolbar_bg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4513, 'toolbar_bg2', '4', '0', 'toolbar_bg2', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4514, 'top_gamers_bg', '4', '0', 'top_gamers_bg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4517, 'tutorial_bg', '4', '0', 'tutorial_bg', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4519, 'val_bgpattern_love', '4', '0', 'val_bgpattern_love', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4520, 'val_bgpattern_skull', '4', '0', 'val_bgpattern_skull', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4526, 'vip_group.png', '4', '0', 'vip_group.png', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4529, 'wallpaper_alkalinetrio', '4', '0', 'wallpaper_alkalinetrio', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4532, 'wallpaper_dinerduck', '4', '0', 'wallpaper_dinerduck', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4533, 'wallpaper_dinergeeks', '4', '0', 'wallpaper_dinergeeks', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4534, 'wallpaper_dinergreasers', '4', '0', 'wallpaper_dinergreasers', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4535, 'wallpaper_dinerjocks', '4', '0', 'wallpaper_dinerjocks', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4536, 'wallpaper_dinermapusa', '4', '0', 'wallpaper_dinermapusa', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4538, 'wallpaper_dinerus', '4', '0', 'wallpaper_dinerus', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4539, 'wallpaper_droney', '4', '0', 'wallpaper_droney', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4541, 'wallpaper_katiestill', '4', '0', 'wallpaper_katiestill', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4542, 'wallpaper_lauraduncan', '4', '0', 'wallpaper_lauraduncan', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4543, 'wallpaper_lenka', '4', '0', 'wallpaper_lenka', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4544, 'wallpaper_monet', '4', '0', 'wallpaper_monet', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4547, 'wallpaper_sprousebrothers', '4', '0', 'wallpaper_sprousebrothers', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4548, 'wallpaper_submarines', '4', '0', 'wallpaper_submarines', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4549, 'wallpaper_tmobile', '4', '0', 'wallpaper_tmobile', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4554, 'wallpaper2_001', '4', '0', 'wallpaper2_001', 2, 1, '248');
INSERT INTO `cms_homes_catalouge` VALUES (4574, 'xmas_gifts_bg2', '4', '0', 'xmas_gifts_bg2', 2, 1, '248');
COMMIT;

-- ----------------------------
-- Table structure for cms_homes_group_linker
-- ----------------------------
DROP TABLE IF EXISTS `cms_homes_group_linker`;
CREATE TABLE `cms_homes_group_linker` (
  `userid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `active` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_homes_group_linker
-- ----------------------------
BEGIN;
INSERT INTO `cms_homes_group_linker` VALUES (1, 1, '1');
INSERT INTO `cms_homes_group_linker` VALUES (3, 2, '1');
INSERT INTO `cms_homes_group_linker` VALUES (40, 4, '1');
INSERT INTO `cms_homes_group_linker` VALUES (45, 7, '1');
INSERT INTO `cms_homes_group_linker` VALUES (41, 8, '0');
INSERT INTO `cms_homes_group_linker` VALUES (50, 12, '1');
INSERT INTO `cms_homes_group_linker` VALUES (78, 14, '1');
COMMIT;

-- ----------------------------
-- Table structure for cms_homes_inventory
-- ----------------------------
DROP TABLE IF EXISTS `cms_homes_inventory`;
CREATE TABLE `cms_homes_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `subtype` varchar(1) NOT NULL,
  `data` text NOT NULL,
  `amount` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_homes_inventory
-- ----------------------------
BEGIN;
INSERT INTO `cms_homes_inventory` VALUES (1, 2, '1', '0', 'sticker_gala', '2');
INSERT INTO `cms_homes_inventory` VALUES (2, 2, '1', '0', 'july0408_boom_1', '1');
INSERT INTO `cms_homes_inventory` VALUES (3, 2, '1', '0', 'july408_unclesam', '2');
INSERT INTO `cms_homes_inventory` VALUES (4, 2, '4', '0', 'habbo_social_game_002', '1');
INSERT INTO `cms_homes_inventory` VALUES (5, 2, '4', '0', 'bg_lidoo', '1');
INSERT INTO `cms_homes_inventory` VALUES (6, 2, '1', '0', 'i_love_bobba', '1');
INSERT INTO `cms_homes_inventory` VALUES (11, 1, '4', '0', 'habbo_social_game_002', '1');
INSERT INTO `cms_homes_inventory` VALUES (31, 41, '4', '0', 'bg_comic2', '1');
INSERT INTO `cms_homes_inventory` VALUES (19, 45, '1', '0', 'a', '1');
INSERT INTO `cms_homes_inventory` VALUES (25, 41, '4', '0', 'alhambragroup', '1');
INSERT INTO `cms_homes_inventory` VALUES (22, 45, '1', '0', 'slash', '1');
INSERT INTO `cms_homes_inventory` VALUES (30, 41, '4', '0', 'bg_cork', '1');
INSERT INTO `cms_homes_inventory` VALUES (28, 41, '4', '0', 'bg_28221_comic_style_orange_001', '1');
INSERT INTO `cms_homes_inventory` VALUES (29, 41, '4', '0', 'easter_eggs_wallpaper', '1');
INSERT INTO `cms_homes_inventory` VALUES (32, 41, '4', '0', 'bg_colour_10', '1');
INSERT INTO `cms_homes_inventory` VALUES (33, 41, '4', '0', 'au_rocktheschools_bg', '1');
INSERT INTO `cms_homes_inventory` VALUES (34, 41, '4', '0', 'bg_denim', '1');
INSERT INTO `cms_homes_inventory` VALUES (35, 41, '4', '0', 'habboween_bg', '1');
INSERT INTO `cms_homes_inventory` VALUES (36, 41, '4', '0', 'hc_bg_machine', '1');
INSERT INTO `cms_homes_inventory` VALUES (37, 41, '4', '0', 'meet_dave_groupbg_02', '1');
INSERT INTO `cms_homes_inventory` VALUES (38, 41, '4', '0', 'infobus_abrinq_sem_logo', '1');
INSERT INTO `cms_homes_inventory` VALUES (39, 41, '4', '0', 'penelope', '1');
INSERT INTO `cms_homes_inventory` VALUES (40, 41, '4', '0', 'habboguide', '1');
INSERT INTO `cms_homes_inventory` VALUES (41, 41, '4', '0', 'bg_vip', '1');
INSERT INTO `cms_homes_inventory` VALUES (42, 50, '4', '0', 'bg_metal2', '1');
COMMIT;

-- ----------------------------
-- Table structure for cms_homes_stickers
-- ----------------------------
DROP TABLE IF EXISTS `cms_homes_stickers`;
CREATE TABLE `cms_homes_stickers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `x` varchar(6) NOT NULL DEFAULT '1' COMMENT 'left',
  `y` varchar(6) NOT NULL DEFAULT '1' COMMENT 'top',
  `z` varchar(6) NOT NULL DEFAULT '1' COMMENT 'z-index',
  `data` text NOT NULL,
  `type` varchar(1) NOT NULL DEFAULT '1',
  `subtype` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Widget Type (if widget)',
  `skin` text NOT NULL,
  `groupid` int(11) NOT NULL DEFAULT '-1',
  `var` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_homes_stickers
-- ----------------------------
BEGIN;
INSERT INTO `cms_homes_stickers` VALUES (1, 1, '660', '2', '55', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (2, 2, '491', '2', '235', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (7, 2, '-1', '-1', '-1', 'bg_lidoo', '4', '0', '-1', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (6, 2, '494', '261', '89', '', '2', '8', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (5, 2, '4', '4', '37', '', '2', '3', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (8, 2, '92', '478', '285', 'sticker_gala', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (9, 2, '28', '219', '229', 'i_love_bobba', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (10, 2, '45', '386', '291', 'sticker_hulkhogan', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (11, 2, '602', '465', '221', 'kip_partnerbtn', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (12, 2, '296', '8', '280', 'kir-stamp1', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (13, 2, '16', '1223', '283', 'kir_stamp6', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (14, 1, '590', '573', '133', '', '2', '4', 'noteitskin', -1, 0);
INSERT INTO `cms_homes_stickers` VALUES (15, 1, '662', '290', '96', '', '2', '8', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (16, 1, '785', '75', '107', 'nl_downtown_costume', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (17, 1, '-1', '-1', '-1', 'habbo_social_game_002', '4', '0', '-1', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (20, 1, '1', '601', '119', '', '2', '3', 'notepadskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (21, 1, '168', '78', '113', 'money_v', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (22, -1, '629', '11', '16', '', '2', '1', 'speechbubbleskin', 1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (23, 1, '822', '124', '18', 'streaker', '1', '0', '', 1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (24, 1, '17', '12', '23', '', '2', '3', 'noteitskin', 1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (25, -1, '192', '97', '7', '', '2', '1', 'defaultskin', 2, NULL);
INSERT INTO `cms_homes_stickers` VALUES (26, 3, '628', '132', '10', 'diadeinternetsticker2008_001', '1', '0', '', 2, NULL);
INSERT INTO `cms_homes_stickers` VALUES (27, 3, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (28, 4, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (29, 5, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (30, 6, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (31, 8, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (32, 14, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (33, 16, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (34, 17, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (35, 20, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (36, 23, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (37, 26, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (38, 28, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (39, 29, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (40, 36, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (41, 34, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (42, 38, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (43, 25, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (44, 27, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (45, 30, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (46, 15, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (47, 21, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (48, 39, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (49, -1, '25', '25', '5', '', '2', '1', 'defaultskin', 3, NULL);
INSERT INTO `cms_homes_stickers` VALUES (50, 40, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (51, -1, '25', '25', '5', '', '2', '1', 'defaultskin', 4, NULL);
INSERT INTO `cms_homes_stickers` VALUES (52, 40, '152', '266', '20', 'money_stash', '1', '0', '', 4, NULL);
INSERT INTO `cms_homes_stickers` VALUES (53, 41, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (54, 43, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (55, -1, '25', '25', '5', '', '2', '1', 'defaultskin', 6, NULL);
INSERT INTO `cms_homes_stickers` VALUES (56, 44, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (57, 45, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (58, -1, '25', '25', '5', '', '2', '1', 'hc_machineskin', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (59, 45, '231', '237', '38', 'b', '1', '0', '', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (60, 45, '286', '234', '42', 'r', '1', '0', '', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (61, 45, '330', '229', '44', 'a', '1', '0', '', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (62, 45, '381', '231', '46', 's', '1', '0', '', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (63, 45, '437', '229', '48', 'barra', '1', '0', '', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (64, 45, '537', '29', '25', '', '2', '3', 'hc_machineskin', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (65, 45, '470', '223', '50', 'l', '1', '0', '', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (66, 45, '20', '20', '51', '', '2', '4', 'defaultskin', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (67, 45, '20', '20', '67', '', '2', '4', 'defaultskin', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (68, 45, '7', '414', '71', '', '2', '5', 'hc_machineskin', 7, NULL);
INSERT INTO `cms_homes_stickers` VALUES (69, 46, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (70, 48, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (71, 49, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (72, 50, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (73, -1, '25', '25', '5', '', '2', '1', 'defaultskin', 5, NULL);
INSERT INTO `cms_homes_stickers` VALUES (74, 58, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (75, -1, '127', '32', '7', '', '2', '1', 'defaultskin', 8, NULL);
INSERT INTO `cms_homes_stickers` VALUES (76, 41, '384', '263', '10', 'wood_c', '1', '0', '', 8, NULL);
INSERT INTO `cms_homes_stickers` VALUES (77, 41, '483', '45', '13', 'celebticket_veronicas', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (78, 41, '597', '141', '11', 'beachbunny_bmovieposter', '1', '0', '', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (79, 60, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (80, 64, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (81, 67, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (82, 68, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (83, -1, '25', '25', '5', '', '2', '1', 'defaultskin', 9, NULL);
INSERT INTO `cms_homes_stickers` VALUES (84, 69, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (85, -1, '25', '25', '5', '', '2', '1', 'defaultskin', 11, NULL);
INSERT INTO `cms_homes_stickers` VALUES (86, -1, '25', '25', '5', '', '2', '1', 'defaultskin', 12, NULL);
INSERT INTO `cms_homes_stickers` VALUES (88, 50, '482', '35', '15', 'alhambra_wallsticker', '1', '0', '', 12, NULL);
INSERT INTO `cms_homes_stickers` VALUES (89, 72, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (90, 7, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (91, 37, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (92, 54, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (93, -1, '25', '25', '5', '', '2', '1', 'defaultskin', 10, NULL);
INSERT INTO `cms_homes_stickers` VALUES (94, 9, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (95, 71, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (96, 11, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (97, 10, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (98, 75, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (99, -1, '25', '25', '5', '', '2', '1', 'defaultskin', 13, NULL);
INSERT INTO `cms_homes_stickers` VALUES (100, 77, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (101, 78, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (102, -1, '481', '163', '8', '', '2', '1', 'defaultskin', 14, NULL);
INSERT INTO `cms_homes_stickers` VALUES (103, 78, '649', '203', '15', 'blue_diner_d', '1', '0', '', 14, NULL);
INSERT INTO `cms_homes_stickers` VALUES (104, 35, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (105, 24, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (106, 52, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (107, 79, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (108, 83, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (109, 84, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (110, 86, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (111, 87, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
INSERT INTO `cms_homes_stickers` VALUES (112, 89, '25', '25', '5', '', '2', '1', 'defaultskin', -1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_minimail
-- ----------------------------
DROP TABLE IF EXISTS `cms_minimail`;
CREATE TABLE `cms_minimail` (
  `senderid` int(11) NOT NULL,
  `to_id` int(11) DEFAULT NULL,
  `subject` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `message` text NOT NULL,
  `read_mail` enum('0','1') NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deleted` int(10) DEFAULT '0',
  `conversationid` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_news
-- ----------------------------
DROP TABLE IF EXISTS `cms_news`;
CREATE TABLE `cms_news` (
  `num` int(4) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE latin1_general_ci NOT NULL,
  `category` text COLLATE latin1_general_ci NOT NULL,
  `topstory` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `short_story` text COLLATE latin1_general_ci NOT NULL,
  `story` longtext COLLATE latin1_general_ci NOT NULL,
  `date` date NOT NULL,
  `author` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='HoloCMS';

-- ----------------------------
-- Records of cms_news
-- ----------------------------
BEGIN;
INSERT INTO `cms_news` VALUES (1, 'Report a bug', 'HoloCMS', 'http://127.0.0.1/HoloCMS/web-gallery/images/top-story/top_story_bugs.png', 'Tell us a bug and win credits!', 'Tell us a bug and win credits. Until tomorrow.', '2016-09-11', 'Moderators');
COMMIT;

-- ----------------------------
-- Table structure for cms_noobgifts
-- ----------------------------
DROP TABLE IF EXISTS `cms_noobgifts`;
CREATE TABLE `cms_noobgifts` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(30) NOT NULL,
  `gift` int(2) NOT NULL,
  `read` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_recommended
-- ----------------------------
DROP TABLE IF EXISTS `cms_recommended`;
CREATE TABLE `cms_recommended` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rec_id` int(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT 'group',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_system
-- ----------------------------
DROP TABLE IF EXISTS `cms_system`;
CREATE TABLE `cms_system` (
  `systemVar` varchar(50) NOT NULL,
  `value` text,
  PRIMARY KEY (`systemVar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_system
-- ----------------------------
BEGIN;
INSERT INTO `cms_system` VALUES ('admin_notes', 'Último archivo editado: subheader.php [13-09-2016 13:37]\r\nSiguiente archivo a editar: transactions.php\r\n\r\nLista de funcionalidades por hacer:\r\n+ Salas públicas:\r\n|-- Agregar\r\n|-- Editar\r\n|-- Eliminar');
INSERT INTO `cms_system` VALUES ('analytics', '');
INSERT INTO `cms_system` VALUES ('dcr', 'http://127.0.0.1/holov3/dcr/habbo.dcr');
INSERT INTO `cms_system` VALUES ('enable_sso', '1');
INSERT INTO `cms_system` VALUES ('ip', '127.0.0.1');
INSERT INTO `cms_system` VALUES ('language', 'en');
INSERT INTO `cms_system` VALUES ('loader', '1');
INSERT INTO `cms_system` VALUES ('localhost', '0');
INSERT INTO `cms_system` VALUES ('port', '21');
INSERT INTO `cms_system` VALUES ('reload_url', 'http://127.0.0.1/holov3/client.php');
INSERT INTO `cms_system` VALUES ('shortname', 'Holo');
INSERT INTO `cms_system` VALUES ('sitename', 'Holo Hotel');
INSERT INTO `cms_system` VALUES ('site_closed', '0');
INSERT INTO `cms_system` VALUES ('start_credits', '5000');
INSERT INTO `cms_system` VALUES ('texts', 'http://127.0.0.1/holov3/gamedata/external_texts.txt');
INSERT INTO `cms_system` VALUES ('variables', 'http://127.0.0.1/holov3/gamedata/external_variables.txt');
COMMIT;

-- ----------------------------
-- Table structure for cms_system_backup
-- ----------------------------
DROP TABLE IF EXISTS `cms_system_backup`;
CREATE TABLE `cms_system_backup` (
  `sitename` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `shortname` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `site_closed` enum('0','1') COLLATE latin1_general_ci NOT NULL COMMENT 'Maintenance Mode',
  `enable_sso` enum('0','1') COLLATE latin1_general_ci NOT NULL,
  `language` varchar(2) COLLATE latin1_general_ci NOT NULL,
  `ip` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `port` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `texts` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `variables` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `dcr` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `reload_url` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `localhost` enum('0','1') COLLATE latin1_general_ci NOT NULL COMMENT 'Local server?',
  `start_credits` int(11) NOT NULL DEFAULT '0',
  `admin_notes` text COLLATE latin1_general_ci NOT NULL,
  `loader` int(1) NOT NULL DEFAULT '1',
  `analytics` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='HoloCMS';

-- ----------------------------
-- Records of cms_system_backup
-- ----------------------------
BEGIN;
INSERT INTO `cms_system_backup` VALUES ('Holo Hotel', 'Holo', '0', '1', 'en', '127.0.0.1', '21', 'http://127.0.0.1/holov3/gamedata/external_texts.txt', 'http://127.0.0.1/holov3/gamedata/external_variables.txt', 'http://127.0.0.1/holov3/dcr/habbo.dcr', 'http://127.0.0.1/holov3/client.php', '1', 5000, 'You can use this to keep notes for yourself, other mods or admins, etc', 1, '');
COMMIT;

-- ----------------------------
-- Table structure for cms_tags
-- ----------------------------
DROP TABLE IF EXISTS `cms_tags`;
CREATE TABLE `cms_tags` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(25) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=417 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='HoloCMS';

-- ----------------------------
-- Records of cms_tags
-- ----------------------------
BEGIN;
INSERT INTO `cms_tags` VALUES (394, 1, 'miguel');
INSERT INTO `cms_tags` VALUES (395, 1, 'holocms');
INSERT INTO `cms_tags` VALUES (396, 1, 'holo');
INSERT INTO `cms_tags` VALUES (397, 2, 'holocms');
INSERT INTO `cms_tags` VALUES (398, 2, 'meth0d');
INSERT INTO `cms_tags` VALUES (399, 3, 'blue');
INSERT INTO `cms_tags` VALUES (400, 0, 'xxx');
INSERT INTO `cms_tags` VALUES (401, 0, 'play');
INSERT INTO `cms_tags` VALUES (402, 6, 'zccz');
INSERT INTO `cms_tags` VALUES (403, 6, 'xxx');
INSERT INTO `cms_tags` VALUES (404, 6, 'cc');
INSERT INTO `cms_tags` VALUES (405, 38, 'pato');
INSERT INTO `cms_tags` VALUES (406, 44, 'kk');
INSERT INTO `cms_tags` VALUES (407, 44, 'br');
INSERT INTO `cms_tags` VALUES (408, 44, 'ff');
INSERT INTO `cms_tags` VALUES (409, 45, 'brasil');
INSERT INTO `cms_tags` VALUES (410, 45, 'kkk');
INSERT INTO `cms_tags` VALUES (411, 45, 'eae');
INSERT INTO `cms_tags` VALUES (412, 45, 'men');
INSERT INTO `cms_tags` VALUES (413, 45, 'sadboys');
INSERT INTO `cms_tags` VALUES (416, 78, 'test');
COMMIT;

-- ----------------------------
-- Table structure for cms_transactions
-- ----------------------------
DROP TABLE IF EXISTS `cms_transactions`;
CREATE TABLE `cms_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `descr` text NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_transactions
-- ----------------------------
BEGIN;
INSERT INTO `cms_transactions` VALUES (1, '16-08-2016 07:16:52', '5000', 'Welcome to Holo Hotel!', 1);
INSERT INTO `cms_transactions` VALUES (2, '16-08-2016 07:21:49', '-80', 'Club subscription (6 month(s))', 1);
INSERT INTO `cms_transactions` VALUES (3, '04-09-2016 08:07:58', '25', 'Bought a collectable', 1);
INSERT INTO `cms_transactions` VALUES (4, '11-09-2016 11:29:09', '1', 'Housekeeping transfer/refund', 1);
INSERT INTO `cms_transactions` VALUES (5, '11-09-2016 11:29:47', '1', 'Housekeeping transfer/refund', 1);
INSERT INTO `cms_transactions` VALUES (6, '14-09-2016 11:24:35', '25', 'Bought a collectable', 1);
INSERT INTO `cms_transactions` VALUES (7, '14-09-2016 13:56:38', '5000', 'Welcome to Holo Hotel!', 2);
INSERT INTO `cms_transactions` VALUES (8, '15-09-2016 09:56:49', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (9, '15-09-2016 11:15:06', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (10, '15-09-2016 11:15:25', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (11, '15-09-2016 14:43:19', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (12, '15-09-2016 15:49:32', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (13, '15-09-2016 15:51:46', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (14, '15-09-2016 15:56:29', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (15, '15-09-2016 16:00:24', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (16, '15-09-2016 16:00:36', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (17, '15-09-2016 16:00:51', '-2', 'Webstore purchase', 2);
INSERT INTO `cms_transactions` VALUES (18, '16-09-2016 11:19:46', '-2', 'Webstore purchase', 1);
INSERT INTO `cms_transactions` VALUES (19, '16-09-2016 11:22:40', '-2', 'Webstore purchase', 1);
INSERT INTO `cms_transactions` VALUES (20, '21-09-2016 17:13:12', '-2', 'Webstore purchase', 1);
INSERT INTO `cms_transactions` VALUES (21, '01-10-2016 07:09:59', '-20', 'Group purchase', 1);
INSERT INTO `cms_transactions` VALUES (22, '03-10-2016 07:47:30', '-2', 'Webstore purchase', 1);
INSERT INTO `cms_transactions` VALUES (23, '31-01-2017 14:18:30', '5000', 'Welcome to Holo Hotel!', 3);
INSERT INTO `cms_transactions` VALUES (24, '31-01-2017 14:22:54', '-20', 'Group purchase', 3);
INSERT INTO `cms_transactions` VALUES (25, '31-01-2017 14:23:23', '-2', 'Webstore purchase', 3);
INSERT INTO `cms_transactions` VALUES (26, '31-01-2017 14:26:20', '-20', 'Club subscription (1 month(s))', 3);
INSERT INTO `cms_transactions` VALUES (27, '23-03-2017 21:58:57', '5000', 'Welcome to Holo Hotel!', 5);
INSERT INTO `cms_transactions` VALUES (28, '23-03-2017 19:57:31', '5000', 'Welcome to Holo Hotel!', 6);
INSERT INTO `cms_transactions` VALUES (29, '24-03-2017 05:01:26', '-80', 'Club subscription (6 month(s))', 5);
INSERT INTO `cms_transactions` VALUES (30, '06-04-2017 16:24:45', '5000', 'Welcome to Holo Hotel!', 7);
INSERT INTO `cms_transactions` VALUES (31, '06-04-2017 17:05:34', '5000', 'Welcome to Holo Hotel!', 8);
INSERT INTO `cms_transactions` VALUES (32, '21-04-2017 05:28:53', '-50', 'Club subscription (3 month(s))', 1);
INSERT INTO `cms_transactions` VALUES (33, '02-05-2017 02:09:19', '5000', 'Welcome to Holo Hotel!', 9);
INSERT INTO `cms_transactions` VALUES (34, '02-05-2017 19:35:44', '5000', 'Welcome to Holo Hotel!', 10);
INSERT INTO `cms_transactions` VALUES (35, '04-05-2017 15:23:59', '5000', 'Welcome to Holo Hotel!', 11);
INSERT INTO `cms_transactions` VALUES (36, '04-05-2017 21:11:57', '5000', 'Welcome to Holo Hotel!', 12);
INSERT INTO `cms_transactions` VALUES (37, '14-05-2017 16:34:44', '5000', 'Welcome to Holo Hotel!', 13);
INSERT INTO `cms_transactions` VALUES (38, '15-05-2017 17:41:55', '5000', 'Welcome to Holo Hotel!', 14);
INSERT INTO `cms_transactions` VALUES (39, '20-05-2017 23:43:11', '5000', 'Welcome to Holo Hotel!', 15);
INSERT INTO `cms_transactions` VALUES (40, '20-05-2017 23:44:22', '-80', 'Club subscription (6 month(s))', 15);
INSERT INTO `cms_transactions` VALUES (41, '24-05-2017 19:34:41', '5000', 'Welcome to Holo Hotel!', 16);
INSERT INTO `cms_transactions` VALUES (42, '27-05-2017 14:34:13', '5000', 'Welcome to Holo Hotel!', 17);
INSERT INTO `cms_transactions` VALUES (43, '27-05-2017 14:36:07', '-20', 'Club subscription (1 month(s))', 17);
INSERT INTO `cms_transactions` VALUES (44, '02-06-2017 13:14:20', '5000', 'Welcome to Holo Hotel!', 18);
INSERT INTO `cms_transactions` VALUES (45, '03-06-2017 00:49:01', '5000', 'Welcome to Holo Hotel!', 19);
INSERT INTO `cms_transactions` VALUES (46, '03-06-2017 06:22:18', '5000', 'Welcome to Holo Hotel!', 20);
INSERT INTO `cms_transactions` VALUES (47, '04-06-2017 09:53:25', '5000', 'Welcome to Holo Hotel!', 21);
INSERT INTO `cms_transactions` VALUES (48, '04-06-2017 17:27:02', '5000', 'Welcome to Holo Hotel!', 22);
INSERT INTO `cms_transactions` VALUES (49, '09-06-2017 22:01:36', '5000', 'Welcome to Holo Hotel!', 23);
INSERT INTO `cms_transactions` VALUES (50, '13-06-2017 08:15:54', '5000', 'Welcome to Holo Hotel!', 24);
INSERT INTO `cms_transactions` VALUES (51, '16-06-2017 16:22:25', '5000', 'Welcome to Holo Hotel!', 25);
INSERT INTO `cms_transactions` VALUES (52, '17-06-2017 20:30:58', '5000', 'Welcome to Holo Hotel!', 26);
INSERT INTO `cms_transactions` VALUES (53, '19-06-2017 05:12:25', '5000', 'Welcome to Holo Hotel!', 27);
INSERT INTO `cms_transactions` VALUES (54, '25-06-2017 03:22:50', '5000', 'Welcome to Holo Hotel!', 28);
INSERT INTO `cms_transactions` VALUES (55, '27-06-2017 20:41:35', '5000', 'Welcome to Holo Hotel!', 29);
INSERT INTO `cms_transactions` VALUES (56, '30-06-2017 18:17:43', '5000', 'Welcome to Holo Hotel!', 30);
INSERT INTO `cms_transactions` VALUES (57, '30-06-2017 18:22:44', '5000', 'Welcome to Holo Hotel!', 31);
INSERT INTO `cms_transactions` VALUES (58, '20-07-2017 13:13:31', '5000', 'Welcome to Holo Hotel!', 32);
INSERT INTO `cms_transactions` VALUES (59, '29-07-2017 02:17:15', '5000', 'Welcome to Holo Hotel!', 33);
INSERT INTO `cms_transactions` VALUES (60, '29-07-2017 02:25:07', '5000', 'Welcome to Holo Hotel!', 34);
INSERT INTO `cms_transactions` VALUES (61, '02-08-2017 15:39:19', '5000', 'Welcome to Holo Hotel!', 35);
INSERT INTO `cms_transactions` VALUES (62, '08-08-2017 19:30:40', '5000', 'Welcome to Holo Hotel!', 36);
INSERT INTO `cms_transactions` VALUES (63, '20-08-2017 20:37:33', '-80', 'Club subscription (6 month(s))', 6);
INSERT INTO `cms_transactions` VALUES (64, '21-08-2017 21:30:13', '5000', 'Welcome to Holo Hotel!', 37);
INSERT INTO `cms_transactions` VALUES (65, '01-09-2017 14:34:06', '5000', 'Welcome to Holo Hotel!', 38);
INSERT INTO `cms_transactions` VALUES (66, '10-09-2017 02:49:36', '5000', 'Welcome to Holo Hotel!', 39);
INSERT INTO `cms_transactions` VALUES (67, '10-09-2017 02:51:31', '-20', 'Group purchase', 39);
INSERT INTO `cms_transactions` VALUES (68, '10-09-2017 03:26:43', '-20', 'Club subscription (1 month(s))', 39);
INSERT INTO `cms_transactions` VALUES (69, '15-09-2017 19:35:55', '5000', 'Welcome to Holo Hotel!', 40);
INSERT INTO `cms_transactions` VALUES (70, '15-09-2017 19:37:07', '-20', 'Group purchase', 40);
INSERT INTO `cms_transactions` VALUES (71, '15-09-2017 19:37:32', '-2', 'Webstore purchase', 40);
INSERT INTO `cms_transactions` VALUES (72, '15-09-2017 19:45:02', '-80', 'Club subscription (6 month(s))', 40);
INSERT INTO `cms_transactions` VALUES (73, '15-09-2017 19:45:13', '-20', 'Group purchase', 40);
INSERT INTO `cms_transactions` VALUES (74, '15-09-2017 21:41:49', '5000', 'Welcome to Holo Hotel!', 41);
INSERT INTO `cms_transactions` VALUES (75, '22-09-2017 01:24:24', '5000', 'Welcome to Holo Hotel!', 42);
INSERT INTO `cms_transactions` VALUES (76, '24-09-2017 14:11:08', '5000', 'Welcome to Holo Hotel!', 43);
INSERT INTO `cms_transactions` VALUES (77, '24-09-2017 14:15:54', '-20', 'Group purchase', 43);
INSERT INTO `cms_transactions` VALUES (78, '24-09-2017 14:52:12', '5000', 'Welcome to Holo Hotel!', 44);
INSERT INTO `cms_transactions` VALUES (79, '24-09-2017 14:54:45', '-80', 'Club subscription (6 month(s))', 44);
INSERT INTO `cms_transactions` VALUES (80, '24-09-2017 22:51:27', '5000', 'Welcome to Holo Hotel!', 45);
INSERT INTO `cms_transactions` VALUES (81, '25-09-2017 00:54:38', '-20', 'Club subscription (1 month(s))', 45);
INSERT INTO `cms_transactions` VALUES (82, '25-09-2017 00:57:00', '-20', 'Group purchase', 45);
INSERT INTO `cms_transactions` VALUES (83, '25-09-2017 00:58:35', '-2', 'Webstore purchase', 45);
INSERT INTO `cms_transactions` VALUES (84, '25-09-2017 00:58:41', '-2', 'Webstore purchase', 45);
INSERT INTO `cms_transactions` VALUES (85, '25-09-2017 00:58:45', '-2', 'Webstore purchase', 45);
INSERT INTO `cms_transactions` VALUES (86, '25-09-2017 00:58:51', '-2', 'Webstore purchase', 45);
INSERT INTO `cms_transactions` VALUES (87, '25-09-2017 00:59:02', '-2', 'Webstore purchase', 45);
INSERT INTO `cms_transactions` VALUES (88, '25-09-2017 00:59:07', '-2', 'Webstore purchase', 45);
INSERT INTO `cms_transactions` VALUES (89, '25-09-2017 00:59:30', '-2', 'Webstore purchase', 45);
INSERT INTO `cms_transactions` VALUES (90, '25-09-2017 01:00:36', '-2', 'Webstore purchase', 45);
INSERT INTO `cms_transactions` VALUES (91, '30-09-2017 00:22:33', '5000', 'Welcome to Holo Hotel!', 46);
INSERT INTO `cms_transactions` VALUES (92, '13-10-2017 06:03:38', '5000', 'Welcome to Holo Hotel!', 47);
INSERT INTO `cms_transactions` VALUES (93, '13-10-2017 18:42:17', '5000', 'Welcome to Holo Hotel!', 48);
INSERT INTO `cms_transactions` VALUES (94, '13-10-2017 18:43:49', '-80', 'Club subscription (6 month(s))', 48);
INSERT INTO `cms_transactions` VALUES (95, '25-10-2017 02:23:08', '5000', 'Welcome to Holo Hotel!', 49);
INSERT INTO `cms_transactions` VALUES (96, '27-10-2017 20:50:03', '5000', 'Welcome to Holo Hotel!', 50);
INSERT INTO `cms_transactions` VALUES (97, '27-10-2017 20:53:20', '-20', 'Club subscription (1 month(s))', 50);
INSERT INTO `cms_transactions` VALUES (98, '03-11-2017 00:14:59', '5000', 'Welcome to Holo Hotel!', 51);
INSERT INTO `cms_transactions` VALUES (99, '05-11-2017 23:02:10', '5000', 'Welcome to Holo Hotel!', 52);
INSERT INTO `cms_transactions` VALUES (100, '13-11-2017 13:17:07', '5000', 'Welcome to Holo Hotel!', 53);
INSERT INTO `cms_transactions` VALUES (101, '13-11-2017 20:59:23', '5000', 'Welcome to Holo Hotel!', 54);
INSERT INTO `cms_transactions` VALUES (102, '17-11-2017 05:38:04', '5000', 'Welcome to Holo Hotel!', 55);
INSERT INTO `cms_transactions` VALUES (103, '25-11-2017 20:26:37', '5000', 'Welcome to Holo Hotel!', 56);
INSERT INTO `cms_transactions` VALUES (104, '27-11-2017 23:19:10', '5000', 'Welcome to Holo Hotel!', 57);
INSERT INTO `cms_transactions` VALUES (105, '01-12-2017 20:17:33', '-20', 'Club subscription (1 month(s))', 50);
INSERT INTO `cms_transactions` VALUES (106, '14-12-2017 14:10:50', '5000', 'Welcome to Holo Hotel!', 58);
INSERT INTO `cms_transactions` VALUES (107, '16-12-2017 23:09:26', '5000', 'Welcome to Holo Hotel!', 59);
INSERT INTO `cms_transactions` VALUES (108, '07-01-2018 20:33:10', '-20', 'Club subscription (1 month(s))', 41);
INSERT INTO `cms_transactions` VALUES (109, '07-01-2018 20:34:25', '-20', 'Group purchase', 41);
INSERT INTO `cms_transactions` VALUES (110, '07-01-2018 20:34:57', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (111, '07-01-2018 20:36:29', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (112, '07-01-2018 20:36:53', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (113, '07-01-2018 20:37:13', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (114, '07-01-2018 20:38:00', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (115, '07-01-2018 20:38:23', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (116, '07-01-2018 20:51:40', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (117, '07-01-2018 20:51:44', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (118, '07-01-2018 20:51:48', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (119, '07-01-2018 20:51:52', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (120, '07-01-2018 20:51:55', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (121, '07-01-2018 20:52:01', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (122, '07-01-2018 20:52:04', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (123, '07-01-2018 20:52:09', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (124, '07-01-2018 20:52:13', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (125, '07-01-2018 20:52:17', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (126, '07-01-2018 20:52:20', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (127, '07-01-2018 20:52:25', '-2', 'Webstore purchase', 41);
INSERT INTO `cms_transactions` VALUES (128, '22-01-2018 19:21:35', '5000', 'Welcome to Holo Hotel!', 60);
INSERT INTO `cms_transactions` VALUES (129, '04-02-2018 07:25:43', '5000', 'Welcome to Holo Hotel!', 61);
INSERT INTO `cms_transactions` VALUES (130, '05-02-2018 15:19:45', '5000', 'Welcome to Holo Hotel!', 62);
INSERT INTO `cms_transactions` VALUES (131, '06-02-2018 02:52:14', '-80', 'Club subscription (6 month(s))', 50);
INSERT INTO `cms_transactions` VALUES (132, '10-02-2018 23:47:01', '5000', 'Welcome to Holo Hotel!', 63);
INSERT INTO `cms_transactions` VALUES (133, '10-02-2018 23:52:31', '5000', 'Welcome to Holo Hotel!', 64);
INSERT INTO `cms_transactions` VALUES (134, '11-02-2018 00:07:59', '5000', 'Welcome to Holo Hotel!', 65);
INSERT INTO `cms_transactions` VALUES (135, '11-02-2018 18:50:47', '5000', 'Welcome to Holo Hotel!', 66);
INSERT INTO `cms_transactions` VALUES (136, '19-02-2018 10:30:03', '5000', 'Welcome to Holo Hotel!', 67);
INSERT INTO `cms_transactions` VALUES (137, '24-02-2018 17:56:17', '5000', 'Welcome to Holo Hotel!', 68);
INSERT INTO `cms_transactions` VALUES (138, '24-02-2018 17:56:40', '-20', 'Club subscription (1 month(s))', 68);
INSERT INTO `cms_transactions` VALUES (139, '24-02-2018 17:57:12', '-20', 'Group purchase', 68);
INSERT INTO `cms_transactions` VALUES (140, '24-02-2018 17:57:19', '-20', 'Group purchase', 68);
INSERT INTO `cms_transactions` VALUES (141, '25-02-2018 15:41:06', '5000', 'Welcome to Holo Hotel!', 69);
INSERT INTO `cms_transactions` VALUES (142, '16-03-2018 21:20:12', '5000', 'Welcome to Holo Hotel!', 70);
INSERT INTO `cms_transactions` VALUES (143, '16-03-2018 21:22:24', '-20', 'Group purchase', 70);
INSERT INTO `cms_transactions` VALUES (144, '17-03-2018 01:46:01', '-20', 'Group purchase', 50);
INSERT INTO `cms_transactions` VALUES (145, '17-03-2018 05:59:46', '-2', 'Webstore purchase', 50);
INSERT INTO `cms_transactions` VALUES (146, '17-03-2018 06:02:40', '-2', 'Webstore purchase', 50);
INSERT INTO `cms_transactions` VALUES (147, '20-03-2018 08:05:12', '5000', 'Welcome to Holo Hotel!', 71);
INSERT INTO `cms_transactions` VALUES (148, '25-04-2018 01:09:36', '5000', 'Welcome to Holo Hotel!', 72);
INSERT INTO `cms_transactions` VALUES (149, '25-04-2018 01:48:46', '-20', 'Club subscription (1 month(s))', 72);
INSERT INTO `cms_transactions` VALUES (150, '02-05-2018 19:43:36', '5000', 'Welcome to Holo Hotel!', 73);
INSERT INTO `cms_transactions` VALUES (151, '02-05-2018 19:59:50', '5000', 'Welcome to Holo Hotel!', 74);
INSERT INTO `cms_transactions` VALUES (152, '23-05-2018 17:12:27', '5000', 'Welcome to Holo Hotel!', 75);
INSERT INTO `cms_transactions` VALUES (153, '23-05-2018 17:12:53', '-20', 'Group purchase', 75);
INSERT INTO `cms_transactions` VALUES (154, '23-05-2018 17:13:11', '-80', 'Club subscription (6 month(s))', 75);
INSERT INTO `cms_transactions` VALUES (155, '14-06-2018 02:01:53', '5000', 'Welcome to Holo Hotel!', 76);
INSERT INTO `cms_transactions` VALUES (156, '15-06-2018 14:28:52', '5000', 'Welcome to Holo Hotel!', 77);
INSERT INTO `cms_transactions` VALUES (157, '15-06-2018 14:31:33', '-20', 'Club subscription (1 month(s))', 77);
INSERT INTO `cms_transactions` VALUES (158, '15-06-2018 15:57:35', '5000', 'Welcome to Holo Hotel!', 78);
INSERT INTO `cms_transactions` VALUES (159, '15-06-2018 16:01:15', '-20', 'Club subscription (1 month(s))', 78);
INSERT INTO `cms_transactions` VALUES (160, '15-06-2018 16:02:02', '-20', 'Group purchase', 78);
INSERT INTO `cms_transactions` VALUES (161, '15-06-2018 16:02:26', '-2', 'Webstore purchase', 78);
INSERT INTO `cms_transactions` VALUES (162, '24-06-2018 19:21:09', '5000', 'Welcome to Holo Hotel!', 79);
INSERT INTO `cms_transactions` VALUES (163, '24-06-2018 19:22:11', '-20', 'Club subscription (1 month(s))', 79);
INSERT INTO `cms_transactions` VALUES (164, '24-06-2018 22:33:45', '5000', 'Welcome to Holo Hotel!', 80);
INSERT INTO `cms_transactions` VALUES (165, '03-07-2018 13:47:37', '5000', 'Welcome to Holo Hotel!', 81);
INSERT INTO `cms_transactions` VALUES (166, '03-07-2018 16:43:54', '-50', 'Club subscription (3 month(s))', 1);
INSERT INTO `cms_transactions` VALUES (167, '03-07-2018 18:23:24', '5000', 'Welcome to Holo Hotel!', 82);
INSERT INTO `cms_transactions` VALUES (168, '03-07-2018 19:20:51', '5000', 'Welcome to Holo Hotel!', 83);
INSERT INTO `cms_transactions` VALUES (169, '03-07-2018 19:23:50', '-80', 'Club subscription (6 month(s))', 83);
INSERT INTO `cms_transactions` VALUES (170, '03-07-2018 20:48:27', '5000', 'Welcome to Holo Hotel!', 84);
INSERT INTO `cms_transactions` VALUES (171, '03-07-2018 21:30:21', '5000', 'Welcome to Holo Hotel!', 85);
INSERT INTO `cms_transactions` VALUES (172, '03-07-2018 22:45:30', '5000', 'Welcome to Holo Hotel!', 86);
INSERT INTO `cms_transactions` VALUES (173, '03-07-2018 22:46:05', '-20', 'Club subscription (1 month(s))', 86);
INSERT INTO `cms_transactions` VALUES (174, '04-07-2018 00:24:12', '5000', 'Welcome to Holo Hotel!', 87);
INSERT INTO `cms_transactions` VALUES (175, '04-07-2018 00:26:23', '-20', 'Club subscription (1 month(s))', 87);
INSERT INTO `cms_transactions` VALUES (176, '04-07-2018 00:27:08', '-20', 'Group purchase', 87);
INSERT INTO `cms_transactions` VALUES (177, '04-07-2018 03:06:00', '5000', 'Welcome to Holo Hotel!', 88);
INSERT INTO `cms_transactions` VALUES (178, '04-07-2018 14:20:31', '5000', 'Welcome to Holo Hotel!', 89);
COMMIT;

-- ----------------------------
-- Table structure for cms_verify
-- ----------------------------
DROP TABLE IF EXISTS `cms_verify`;
CREATE TABLE `cms_verify` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_wardrobe
-- ----------------------------
DROP TABLE IF EXISTS `cms_wardrobe`;
CREATE TABLE `cms_wardrobe` (
  `userid` int(11) NOT NULL,
  `slotid` varchar(1) NOT NULL,
  `figure` text NOT NULL,
  `gender` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_wardrobe
-- ----------------------------
BEGIN;
INSERT INTO `cms_wardrobe` VALUES (1, '1', 'hr-831-61.hd-180-1.ch-804-82.lg-285-110.sh-906-77.he-1604-.fa-1201-.ca-1807-.wa-2005-', 'M');
INSERT INTO `cms_wardrobe` VALUES (1, '2', 'hr-831-61.hd-180-1.ch-804-82.lg-285-110.sh-906-77.fa-1207-.ca-1807-.wa-2005-', 'M');
INSERT INTO `cms_wardrobe` VALUES (1, '3', 'hr-802-61.hd-180-1.ch-886-82.lg-285-110.sh-300-62.fa-1201-.wa-2005-.ha-1013-110.ea-1404-62', 'M');
INSERT INTO `cms_wardrobe` VALUES (1, '4', 'hr-831-61.hd-180-1.ch-804-82.lg-285-110.sh-906-77.fa-1207-.ca-1807-.wa-2005-', 'M');
INSERT INTO `cms_wardrobe` VALUES (1, '5', 'hr-802-61.hd-180-1.ch-809-82.lg-285-110.sh-906-77.fa-1201-.wa-2005-', 'M');
INSERT INTO `cms_wardrobe` VALUES (5, '1', 'hr-831-40.hd-180-9.ch-266-.lg-285-81.sh-290-77.ea-1406-.fa-1205-62.ha-1004-62', 'M');
INSERT INTO `cms_wardrobe` VALUES (44, '1', 'hd-205-28.ch-260-64.lg-270-64.sh-290-64', 'M');
INSERT INTO `cms_wardrobe` VALUES (44, '2', 'hd-205-28.ch-260-64.lg-270-64.sh-290-64', 'M');
INSERT INTO `cms_wardrobe` VALUES (45, '1', 'hr-828-61.hd-180-1.ch-806-110.lg-281-92.sh-906-92.ha-1027-.fa-1209-110.ca-1816-', 'M');
INSERT INTO `cms_wardrobe` VALUES (50, '1', 'hr-100-.hd-180-1.ch-255-66.lg-285-81.sh-290-77', 'M');
INSERT INTO `cms_wardrobe` VALUES (83, '2', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M');
COMMIT;

-- ----------------------------
-- Table structure for furniture
-- ----------------------------
DROP TABLE IF EXISTS `furniture`;
CREATE TABLE `furniture` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The ID of this item',
  `tid` int(10) NOT NULL COMMENT 'The template ID of this item',
  `ownerid` int(10) NOT NULL COMMENT 'The ID of the user that owns this item',
  `roomid` int(10) NOT NULL COMMENT 'The room ID the item is in. If it''s 0, then it''s in the hand of OWNERID, if it''s -1, then it''s in a present and not opened yet, if it''s -2, then it''s in the Recycler',
  `x` smallint(6) NOT NULL COMMENT 'The X of the item in a room',
  `y` smallint(6) NOT NULL COMMENT 'The Y of the item in a room',
  `z` smallint(6) NOT NULL COMMENT 'The Z [rotation] of the item in a room',
  `h` double(4,2) NOT NULL DEFAULT '0.00' COMMENT 'The H [height, double] of the item in a room',
  `var` text COLLATE latin1_general_ci COMMENT 'The variable of the item, specifying it''s turned on/off etc, :S',
  `wallpos` varchar(200) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Wallitems only. The location on the wall where the item is',
  `teleportid` int(10) DEFAULT NULL COMMENT 'Teleporters only. The ID of the teleporter that links to this one',
  `soundmachine_soundset` int(2) DEFAULT NULL,
  `soundmachine_machineid` int(10) DEFAULT NULL,
  `soundmachine_slot` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of furniture
-- ----------------------------
BEGIN;
INSERT INTO `furniture` VALUES (1, 1183, 1, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (2, 1196, 1, 1, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (3, 1189, 1, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (4, 977, 1, 1, 3, 1, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (5, 1152, 1, 1, 1, 2, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (6, 467, 1, 123, 6, 5, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (7, 538, 1, 123, 4, 11, 2, 0.00, 'FALSE', NULL, 8, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (8, 538, 1, 123, 9, 1, 4, 0.00, 'FALSE', NULL, 7, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (9, 1092, 1, 123, 5, 5, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (10, 1163, 1, 123, 4, 2, 0, 0.00, 'Miguel	16-08-2016	Por ser el mejor Habbo de Habbo Hotel.', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (11, 1274, 1, 123, 8, 1, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (12, 1277, 1, 123, 0, 0, 0, 0.00, '2', ':w=3,8 l=23,72 l', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (13, 1276, 1, 123, 0, 0, 0, 0.00, '2', ':w=3,3 l=22,66 l', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (14, 1278, 1, 123, 5, 8, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (15, 1109, 1, 123, 11, 1, 0, 0.00, 'ON', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (16, 1114, 1, 123, 10, 6, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (17, 1115, 1, 123, 4, 6, 0, 0.00, 'ON', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (18, 1115, 1, 123, 4, 4, 0, 0.00, 'ON', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (19, 1122, 1, 123, 10, 2, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (20, 1126, 1, 123, 10, 12, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (21, 1143, 1, 123, 7, 1, 4, 0.00, 'TRUE', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (22, 1145, 1, 123, 0, 0, 0, 0.00, NULL, ':w=4,0 l=49,61 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (25, 276, 1, 123, 4, 13, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (26, 277, 1, 123, 4, 10, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (27, 277, 1, 123, 4, 10, 2, 0.80, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (28, 277, 1, 123, 4, 10, 0, 0.40, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (29, 0, 1, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (30, 145, 1, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (31, 506, 1, 123, 4, 5, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (32, 1145, 1, 123, 0, 0, 0, 0.00, NULL, ':w=10,0 l=37,48 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (33, 93, 1, 123, 0, 0, 0, 0.00, '5', ':w=3,5 l=23,65 l', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (34, 1096, 1, 1, 1, 4, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (35, 1109, 1, 1, 1, 1, 0, 0.00, 'ON', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (36, 1068, 1, 1, 1, 3, 2, 0.00, 'O', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (37, 1004, 1, 1, 5, 1, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (38, 1141, 1, 1, 3, 4, 0, 0.00, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (39, 1132, 1, 1, 1, 5, 0, 0.00, '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (40, 1043, 1, 1, 1, 6, 6, 0.00, 'O', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (41, 1024, 1, 1, 1, 7, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (42, 0, 1, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (43, 1186, 2, 124, 1, 2, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (44, 1196, 2, 124, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (45, 1192, 2, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (46, 1184, 3, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (47, 1196, 3, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (48, 1183, 5, 126, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (49, 1196, 5, 126, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (50, 1189, 5, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (51, 1184, 10, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (52, 1196, 10, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (53, 1188, 15, 128, 3, 6, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (54, 1196, 15, 128, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (55, 1194, 15, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (56, 1184, 17, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (57, 1196, 17, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (58, 1183, 0, 130, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (59, 1196, 0, 130, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (60, 1189, 0, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (61, 1183, 20, 131, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (62, 1196, 20, 131, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (63, 1189, 20, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (64, 1183, 21, 132, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (65, 1196, 21, 132, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (66, 1189, 21, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (67, 1183, 23, 133, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (68, 1196, 23, 133, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (69, 1189, 23, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (70, 1183, 25, 134, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (71, 1196, 25, 134, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (72, 1189, 25, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (73, 1183, 26, 135, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (74, 1196, 26, 135, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (75, 1189, 26, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (76, 1183, 27, 136, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (77, 1196, 27, 136, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (78, 1189, 27, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (79, 1183, 28, 137, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (80, 1196, 28, 137, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (81, 1189, 28, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (82, 1184, 29, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (83, 1196, 29, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (84, 1188, 30, 139, 3, 6, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (85, 1196, 30, 139, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (86, 1194, 30, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (87, 1184, 32, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (88, 1196, 32, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (89, 1183, 34, 141, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (90, 1196, 34, 141, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (91, 1189, 34, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (92, 1183, 35, 142, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (93, 1196, 35, 142, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (94, 1189, 35, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (95, 1187, 36, 143, 3, 6, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (96, 1196, 36, 143, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (97, 1193, 36, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (98, 1185, 6, 144, 2, 2, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (99, 1196, 6, 144, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (100, 1191, 6, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (101, 1185, 38, 145, 2, 2, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (102, 1196, 38, 145, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (103, 1191, 38, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (104, 1184, 39, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (105, 1196, 39, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (106, 1183, 40, 147, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (107, 1196, 40, 147, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (108, 1189, 40, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (109, 1183, 41, 148, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (110, 1196, 41, 148, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (111, 1189, 41, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (112, 1186, 42, 149, 1, 2, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (113, 1196, 42, 149, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (114, 1192, 42, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (115, 1184, 43, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (116, 1196, 43, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (117, 1183, 44, 151, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (118, 1196, 44, 151, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (119, 1189, 44, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (120, 1184, 45, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (121, 1196, 45, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (122, 1184, 50, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (123, 1196, 50, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (124, 1184, 53, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (125, 1196, 53, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (126, 1186, 54, 155, 1, 2, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (127, 1196, 54, 155, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (128, 1192, 54, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (129, 1185, 59, 156, 2, 2, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (130, 1196, 59, 156, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (131, 1191, 59, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (132, 1184, 61, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (133, 1196, 61, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (134, 1184, 63, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (135, 1196, 63, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (136, 1183, 65, 159, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (137, 1196, 65, 159, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (138, 1189, 65, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (139, 1183, 66, 160, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (140, 1196, 66, 160, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (141, 1189, 66, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (142, 1183, 69, 161, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (143, 1196, 69, 161, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (144, 1189, 69, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (145, 1184, 71, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (146, 1196, 71, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (147, 1185, 76, 163, 2, 2, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (148, 1196, 76, 163, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (149, 1191, 76, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (150, 1183, 77, 164, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (151, 1196, 77, 164, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (152, 1189, 77, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (153, 1183, 78, 165, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (154, 1196, 78, 165, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (155, 1189, 78, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (156, 1185, 79, 166, 2, 2, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (157, 1196, 79, 166, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (158, 1191, 79, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (159, 1183, 80, 167, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (160, 1196, 80, 167, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (161, 1189, 80, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (162, 1186, 81, 168, 1, 2, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (163, 1196, 81, 168, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (164, 1192, 81, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (165, 1184, 82, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (166, 1196, 82, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (167, 1184, 83, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (168, 1196, 83, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (169, 1184, 85, 0, 3, 6, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (170, 1196, 85, 0, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (171, 1183, 86, 172, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (172, 1196, 86, 172, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (173, 1189, 86, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (174, 1185, 87, 173, 2, 2, 4, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (175, 1196, 87, 173, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (176, 1191, 87, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (177, 1183, 89, 174, 1, 6, 2, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (178, 1196, 89, 174, 0, 0, 0, 0.00, NULL, ':w=3,0 l=13,71 r', NULL, NULL, NULL, NULL);
INSERT INTO `furniture` VALUES (179, 1189, 89, 0, 0, 0, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for furniture_moodlight
-- ----------------------------
DROP TABLE IF EXISTS `furniture_moodlight`;
CREATE TABLE `furniture_moodlight` (
  `id` int(11) NOT NULL,
  `roomid` int(11) NOT NULL,
  `preset_cur` int(1) NOT NULL DEFAULT '0',
  `preset_1` varchar(75) COLLATE latin1_general_ci DEFAULT NULL,
  `preset_2` varchar(75) COLLATE latin1_general_ci DEFAULT NULL,
  `preset_3` varchar(75) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`roomid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for furniture_presents
-- ----------------------------
DROP TABLE IF EXISTS `furniture_presents`;
CREATE TABLE `furniture_presents` (
  `id` int(10) NOT NULL,
  `itemid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for furniture_stickies
-- ----------------------------
DROP TABLE IF EXISTS `furniture_stickies`;
CREATE TABLE `furniture_stickies` (
  `id` int(10) NOT NULL,
  `text` text COLLATE latin1_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for games_lobbies
-- ----------------------------
DROP TABLE IF EXISTS `games_lobbies`;
CREATE TABLE `games_lobbies` (
  `id` int(10) NOT NULL,
  `type` enum('bb') COLLATE latin1_general_ci NOT NULL DEFAULT 'bb',
  `rank` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `bb_allowedpowerups` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of games_lobbies
-- ----------------------------
BEGIN;
INSERT INTO `games_lobbies` VALUES (113, 'bb', 'Noob', '1,2,3,4,5,6,7,8');
INSERT INTO `games_lobbies` VALUES (114, 'bb', 'Amateur', '1,2,3,4,5,6,7,8');
INSERT INTO `games_lobbies` VALUES (115, 'bb', 'Intermediate', '1,2,3,4,5,6,7,8');
INSERT INTO `games_lobbies` VALUES (116, 'bb', 'Expert', '1,2,3,4,5,6,7,8');
INSERT INTO `games_lobbies` VALUES (117, 'bb', 'Leet', '1,2,3,4,5,6,7,8');
INSERT INTO `games_lobbies` VALUES (118, '', 'noob', '1,2,3,4,5,6,7,8');
INSERT INTO `games_lobbies` VALUES (119, '', 'Amateur', '1,2,3,4,5,6,7,8');
INSERT INTO `games_lobbies` VALUES (120, '', 'Intermediate', '1,2,3,4,5,6,7,8');
INSERT INTO `games_lobbies` VALUES (121, '', 'Intermediate', '1,2,3,4,5,6,7,8');
INSERT INTO `games_lobbies` VALUES (122, '', 'Expert', '1,2,3,4,5,6,7,8');
COMMIT;

-- ----------------------------
-- Table structure for games_maps
-- ----------------------------
DROP TABLE IF EXISTS `games_maps`;
CREATE TABLE `games_maps` (
  `type` enum('ss','bb') COLLATE latin1_general_ci NOT NULL,
  `id` enum('6','5','4','3','2','1') COLLATE latin1_general_ci NOT NULL DEFAULT '1',
  `heightmap` text COLLATE latin1_general_ci NOT NULL,
  `bb_tilemap` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of games_maps
-- ----------------------------
BEGIN;
INSERT INTO `games_maps` VALUES ('bb', '5', 'xxxx000000000000000xxxx\rxxxx000000000000000xxxx\rxxxx000000000000000xxxx\rxxxx000000000000000xxxx\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\r00000000000000000000000\rxxxx000000000000000xxxx\rxxxx000000000000000xxxx\rxxxx000000000000000xxxx\rxxxx000000000000000xxxx\r', '00001111111111111110000\r00001111111111111110000\r00001111111111111110000\r00001111111111111110000\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r11111111111111111111111\r00001111111111111110000\r00001111111111111110000\r00001111111111111110000\r00001111111111111110000\r');
INSERT INTO `games_maps` VALUES ('bb', '3', '0000000x000x0000xxxxxxxxxxxxxxxxx\r0xx00x0x0x0000000111000xxxxxxxxxx\r0xx00x0x0x00000001110000xxxxxxxxx\r0000xx000xxx0000xxxxxx000xxxxxxxx\r000xxxxxxxxxxxxxxxxxxxx000xxxxxxx\r0xxxxxxxxxxxxxxxxxxxxxxx000xxxxxx\r0000xxxxxxxxxxxxxxxxxxxxx000xxxxx\rxxx0xxx111111111111111xxx0x0xxxxx\r0000xxx111111111111111xxx0x0x0xxx\r0xxxxxx111111111111111xxx0x0x0xxx\r000xxxx1111111111111111000x00000x\rx00xxxx1111111111111111000x0x0xxx\r0000xxx111112222211111xxxxxxx0000\r0000xxx111112222211111xxx000xxxx0\r0000xxx111112222211111xxx000000x0\r0000xxx111112222211111xxx000xx0x0\rx00xxxx111112222211111xxxxxxx0000\rx11xxxx11111111111111110000000xxx\rx11xxxx11111111111111110000000xxx\rx11xxxx111111111111111xxx0xxxxxxx\rx00xxxx111111111111111xxx000xxxxx\rx00xxxx111111111111111xxxxxxxxxxx\rx000xxxxxx11xxxxx11xxxxxxxxxxxxxx\rxx000xxxxx00xxxxx00xxxxxxxxxxxxxx\rxxx000xxxx00xxxxx00xxxxxxxxxxxxxx\rxxxx00000000x000x0000xxxxxxxxxxxx\rxxxxx00xxxxxx000x00x0xxxxxxxxxxxx\rxxxxxx000000x000x00x0xxxxxxxxxxxx\rxxxxxxxxxx0xxx0xx00xxxxxxxxxxxxxx\rxxxxxxxx00000x0x000xxxxxxxxxxxxxx\rxxxxxxxxxx0x0x000xxxxxxxxxxxxxxxx\rxxxxxxxxxx0x0xxx0xxxxxxxxxxxxxxxx\rxxxxxxxxxxxx00000xxxxxxxxxxxxxxxx\r', '111100000000111100000000000000000\r100100000000111100000000000000000\r100100000000111100000000000000000\r111100000000111100000000000000000\r000000000000000000000000000000000\r000000000000000000000000000000000\r000000000000000000000000000000000\r000000011111110111111100000000000\r000000011111110111111100000000000\r000000011111110111111100000000000\r000000011111110111111100000000000\r000000011110000000111100000000000\r111100011110000000111100000000000\r111100011110011100111100011100000\r111100000000011100000000011100000\r111100011110011100111100011100000\r000000011110000000111100000000000\r000000011110000000111100000000000\r000000011111110111111100000000000\r000000011111110111111100000000000\r000000011111110111111100000000000\r000000011111110111111100000000000\r000000000000000000000000000000000\r000000000000000000000000000000000\r000000000000000000000000000000000\r000000000000011100000000000000000\r000000000000011100000000000000000\r000000000000011100000000000000000\r000000000000000000000000000000000\r000000000000000000000000000000000\r000000000000000000000000000000000\r000000000000000000000000000000000\r000000000000000000000000000000000\r');
INSERT INTO `games_maps` VALUES ('bb', '1', 'xxxxxxxxxxxxx444444xxxxxxxxx\rxxxxxxxxxxxxx444444xxxxxxxxx\rxxxxxxxxxxxxx444444xxxxxxxxx\rxxx22222222xx444444xxxxxxxxx\rxxx22222222xx444444xxxxxxxxx\rxxx22222222xx333333xxxxxxxxx\rxxx22222222xx222222xxxxxxxxx\rxxx222222222222222222xxxxxxx\rxxx222222222222222222xxxxxxx\rxxx2222222222222222222100000\rxxx2222222222222222222100000\rxxxxxxx222222222222222100000\rxxxxxxx222222222222222100000\r4444432222222222222222100000\r4444432222222222222222100000\r444443222222222222222xxxxxxx\r444443222222222222222xxxxxxx\r4444432222222222222222222xxx\r4444432222222222222222222xxx\rxxxxxxx222222222222222222xxx\rxxxxxxx222222222222222222xxx\rxxxxxxxxx222222xx22222222xxx\rxxxxxxxxx111111xx22222222xxx\rxxxxxxxxx000000xx22222222xxx\rxxxxxxxxx000000xx22222222xxx\rxxxxxxxxx000000xxxxxxxxxxxxx\rxxxxxxxxx000000xxxxxxxxxxxxx\rxxxxxxxxx000000xxxxxxxxxxxxx\r', '0000000000000111111000000000\r0000000000000111111000000000\r0000000000000111111000000000\r0001111111100111111000000000\r0001111111100000000000000000\r0001111111100000000000000000\r0001111111100000000000000000\r0001111111111111111110000000\r0001111111111111111110000000\r0001111111111111111110001111\r0001111111111111111110001111\r0000000111111111111110001111\r0000000111111111111110001111\r1111000111111111111110001111\r1111000111111111111110001111\r1111000111111111111110000000\r1111000111111111111110000000\r1111000111111111111111110000\r1111000111111111111111110000\r0000000111111111111111111000\r0000000111111111111111111000\r0000000000000000011111111000\r0000000000000000011111111000\r0000000000000000011111111000\r0000000001111110011111111000\r0000000001111110000000000000\r0000000001111110000000000000\r0000000001111110000000000000\r');
INSERT INTO `games_maps` VALUES ('bb', '2', 'xxxxxxx00000000xxx00000000xxxxxxx\rxxxxxxx00000000xxx00000000xxxxxxx\rxxxxxxx00000000xxx00000000xxxxxxx\rxxxxxxx0000000000000000000xxxxxxx\rxxxxxxx0000000000000000000xxxxxxx\rxxxxxxx0000000000000000000xxxxxxx\rxxxxxxx00000000xxx00000000xxxxxxx\r2222xxx00000000xxx00000000xxx2222\r2222xxx00000000xxx00000000xxx2222\r222221000000000xxx000000000122222\r222221000000000xxx000000000122222\r2222xxx00000000xxx00000000xxx2222\r2222xxx00000000xxx00000000xxx2222\rxxxxxxx00000000xxx00000000xxxxxxx\rxxxxxxx0000000000000000000xxxxxxx\rxxxxxxx0000000000000000000xxxxxxx\rxxxxxxx0000000000000000000xxxxxxx\rxxxxxxx00000000xxx00000000xxxxxxx\rxxxxxxx00000000xxx00000000xxxxxxx\rxxxxxxx00000000xxx00000000xxxxxxx\r', '000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r111100011111111000111111110001111\r111100011111111000111111110001111\r111100011111111000111111110001111\r111100011111111000111111110001111\r111100011111111000111111110001111\r111100011111111000111111110001111\r000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r000000011111111000111111110000000\r');
INSERT INTO `games_maps` VALUES ('bb', '4', 'xxxxxxx222222222222222xxxxxxxx\rxxxxxxx222222222222222xxxxxxxx\rxxxxxxx222222222222222xxxxxxxx\rxxxxxxx222222222222222xxxxxxxx\rxxxxxxx222222222222222xxxxxxxx\r00012222222222222222222211111x\r00012222222222222222222211111x\r00012222222222222222222211111x\r00012222222222222222222211111x\r00xxxxx222222222222222xxx1111x\r000xxxx222222222222222xxx0000x\r0000xxx222222222222222x0000000\r0000xxx22222222222222210000000\r0000xxx22222222222222210000000\r0000xxx222222222222222x0000000\r0000xxx222222222222222xxxxxxxx\r00000xx222222222222222xxxxxxxx\r000000xxxx11xx11xx11xxxxxxxxxx\rx0000000000000000000000xxxxxxx\rxx000000000000000000000xxxxxxx\rxxx00000000000000000000xxxxxxx\rxxxx0000000000000000000xxxxxxx\r', '000000011111111111111100000000\r000000011111111111111100000000\r000000011111111111111100000000\r000000011111111111111100000000\r000000011111111111111100000000\r000000011111111111111100011110\r000000011111111111111100011110\r000000011111111111111100011110\r000000011111111111111100011110\r110000011111111111111100000000\r111000011111111111111100000000\r111100011111111111111101111111\r111100011111111111111101111111\r111100011111111111111101111111\r111100011111111111111101111111\r111100011111111111111100000000\r111110011111111111111100000000\r111111000000000000000000000000\r011111111111111111111110000000\r001111111111111111111110000000\r000111111111111111111110000000\r000011111111111111111110000000\r');
COMMIT;

-- ----------------------------
-- Table structure for games_maps_playerspawns
-- ----------------------------
DROP TABLE IF EXISTS `games_maps_playerspawns`;
CREATE TABLE `games_maps_playerspawns` (
  `type` enum('ss','bb') COLLATE latin1_general_ci NOT NULL DEFAULT 'bb',
  `mapid` enum('6','5','4','3','2','1') COLLATE latin1_general_ci NOT NULL,
  `teamid` enum('3','2','1','0') COLLATE latin1_general_ci NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` enum('9','8','7','6','5','4','3','2','1','0') COLLATE latin1_general_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of games_maps_playerspawns
-- ----------------------------
BEGIN;
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '5', '0', 22, 11, '6');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '5', '1', 0, 11, '2');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '5', '2', 11, 22, '0');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '5', '3', 11, 0, '4');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '1', '0', 0, 15, '2');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '1', '1', 27, 12, '6');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '1', '2', 12, 27, '0');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '1', '3', 15, 0, '4');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '2', '0', 0, 9, '2');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '2', '1', 32, 10, '6');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '2', '2', 14, 9, '6');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '2', '3', 18, 9, '2');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '4', '3', 21, 8, '6');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '4', '2', 7, 8, '2');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '4', '1', 14, 0, '4');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '4', '0', 14, 16, '0');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '3', '0', 21, 14, '6');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '3', '1', 7, 14, '2');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '3', '2', 14, 21, '0');
INSERT INTO `games_maps_playerspawns` VALUES ('bb', '3', '3', 14, 7, '4');
COMMIT;

-- ----------------------------
-- Table structure for games_ranks
-- ----------------------------
DROP TABLE IF EXISTS `games_ranks`;
CREATE TABLE `games_ranks` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `type` enum('ss','bb') COLLATE latin1_general_ci NOT NULL DEFAULT 'bb',
  `title` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `minpoints` int(10) NOT NULL,
  `maxpoints` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of games_ranks
-- ----------------------------
BEGIN;
INSERT INTO `games_ranks` VALUES (1, 'bb', 'Noob', 0, 10000);
INSERT INTO `games_ranks` VALUES (2, 'bb', 'Amateur', 10001, 100000);
INSERT INTO `games_ranks` VALUES (3, 'bb', 'Intermediate', 100001, 500000);
INSERT INTO `games_ranks` VALUES (4, 'bb', 'Expert', 500001, 10000000);
INSERT INTO `games_ranks` VALUES (5, 'bb', 'Leet', 10000001, 0);
INSERT INTO `games_ranks` VALUES (6, 'ss', 'Noob', 0, 10000);
INSERT INTO `games_ranks` VALUES (7, 'ss', 'Amateur', 10001, 100000);
INSERT INTO `games_ranks` VALUES (8, 'ss', 'Intermediate', 100001, 500000);
INSERT INTO `games_ranks` VALUES (9, 'ss', 'Expert', 500001, 10000000);
INSERT INTO `games_ranks` VALUES (10, 'ss', 'Leet', 10000001, 0);
COMMIT;

-- ----------------------------
-- Table structure for groups_details
-- ----------------------------
DROP TABLE IF EXISTS `groups_details`;
CREATE TABLE `groups_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `ownerid` int(10) NOT NULL,
  `roomid` int(10) NOT NULL,
  `created` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `badge` text COLLATE latin1_general_ci NOT NULL,
  `type` int(1) NOT NULL DEFAULT '0',
  `recommended` int(1) NOT NULL DEFAULT '0',
  `views` int(15) NOT NULL,
  `pane` smallint(1) NOT NULL DEFAULT '0',
  `topics` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of groups_details
-- ----------------------------
BEGIN;
INSERT INTO `groups_details` VALUES (1, 'HoloCMS Staff', 'This group is for HoloCMS Staff only.', 1, 0, '01-10-2016 07:09:59', 'b0106Xs54114s29098', 1, 0, 205, 0, 0);
INSERT INTO `groups_details` VALUES (2, 'teste', 'sdasdsadsa', 3, 0, '31-01-2017 14:22:54', 'b0803Xs09114s07013s07035s03014', 0, 0, 216, 0, 0);
INSERT INTO `groups_details` VALUES (3, 'jbuib', 'gfgf', 39, 0, '10-09-2017 02:51:31', 'b0503Xs09114s05013s05015', 0, 0, 10, 0, 0);
INSERT INTO `groups_details` VALUES (4, 'xsds', 'sdsdsdds', 40, 0, '15-09-2017 19:37:07', 'b0503Xs09114s05013s05015', 0, 0, 16, 0, 0);
INSERT INTO `groups_details` VALUES (5, 'asds', 'asdasd', 40, 0, '15-09-2017 19:45:13', 'b0503Xs09114s05013s05015', 0, 0, 11, 0, 0);
INSERT INTO `groups_details` VALUES (6, 'kk', 'kkk', 43, 0, '24-09-2017 14:15:54', 'b0503Xs09114s05013s05015', 0, 0, 10, 0, 0);
INSERT INTO `groups_details` VALUES (7, 'Brasileiros', 'Criado para o publico brasileiro', 45, 0, '25-09-2017 00:57:00', 'b0503Xs09114s05013s05015', 0, 0, 11, 0, 0);
INSERT INTO `groups_details` VALUES (8, 'Nightbox', 'Nightbox.no', 41, 0, '07-01-2018 20:34:25', 'b0503Xs09114s05013s05015', 0, 0, 7, 0, 0);
INSERT INTO `groups_details` VALUES (9, 'gdh', 'dgdg', 68, 0, '24-02-2018 17:57:12', 'b0503Xs09114s05013s05015', 0, 0, 7, 0, 0);
INSERT INTO `groups_details` VALUES (10, 'fdgfdg', 'fgfdgdfg', 68, 0, '24-02-2018 17:57:19', 'b0503Xs09114s05013s05015', 0, 0, 2, 0, 0);
INSERT INTO `groups_details` VALUES (11, 'txt', 'xdsdsds', 70, 0, '16-03-2018 21:22:24', 'b0503Xs09114s05013s05015', 0, 0, 4, 0, 0);
INSERT INTO `groups_details` VALUES (12, 'Habbz', 'Melhor hotel!', 50, 0, '17-03-2018 01:46:01', 'b1113Xs19114', 0, 0, 23, 0, 0);
INSERT INTO `groups_details` VALUES (13, 'MakeMe', 'Heloo, Enjoy this', 75, 0, '23-05-2018 17:12:53', 'b0503Xs09114s05013s05015', 0, 0, 4, 0, 0);
INSERT INTO `groups_details` VALUES (14, 'test', 'test', 78, 0, '15-06-2018 16:02:02', 'b0503Xs09114s05013s05015', 0, 0, 11, 0, 0);
INSERT INTO `groups_details` VALUES (15, 'Gell', 'hola q tal test', 87, 0, '04-07-2018 00:27:08', 'b0503Xs09114s05013s05015', 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for groups_memberships
-- ----------------------------
DROP TABLE IF EXISTS `groups_memberships`;
CREATE TABLE `groups_memberships` (
  `userid` int(10) NOT NULL,
  `groupid` int(10) NOT NULL,
  `member_rank` enum('3','2','1') COLLATE latin1_general_ci NOT NULL DEFAULT '3',
  `is_current` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `is_pending` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of groups_memberships
-- ----------------------------
BEGIN;
INSERT INTO `groups_memberships` VALUES (1, 1, '2', '1', '0');
INSERT INTO `groups_memberships` VALUES (2, 1, '1', '1', '0');
INSERT INTO `groups_memberships` VALUES (3, 2, '2', '1', '0');
INSERT INTO `groups_memberships` VALUES (16, 2, '1', '0', '0');
INSERT INTO `groups_memberships` VALUES (6, 1, '1', '0', '1');
INSERT INTO `groups_memberships` VALUES (39, 3, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (40, 4, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (40, 5, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (43, 6, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (45, 7, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (52, 1, '1', '0', '1');
INSERT INTO `groups_memberships` VALUES (41, 8, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (50, 1, '1', '0', '1');
INSERT INTO `groups_memberships` VALUES (68, 9, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (68, 10, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (70, 11, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (50, 12, '2', '1', '0');
INSERT INTO `groups_memberships` VALUES (75, 13, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (75, 12, '1', '1', '0');
INSERT INTO `groups_memberships` VALUES (78, 14, '2', '0', '0');
INSERT INTO `groups_memberships` VALUES (87, 15, '2', '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for messenger_friendrequests
-- ----------------------------
DROP TABLE IF EXISTS `messenger_friendrequests`;
CREATE TABLE `messenger_friendrequests` (
  `userid_from` int(10) NOT NULL DEFAULT '0',
  `userid_to` int(10) NOT NULL DEFAULT '0',
  `requestid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`requestid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of messenger_friendrequests
-- ----------------------------
BEGIN;
INSERT INTO `messenger_friendrequests` VALUES (1, 2, 1);
INSERT INTO `messenger_friendrequests` VALUES (3, 2, 2);
INSERT INTO `messenger_friendrequests` VALUES (38, 45, 3);
INSERT INTO `messenger_friendrequests` VALUES (50, 4, 4);
INSERT INTO `messenger_friendrequests` VALUES (1, 50, 5);
COMMIT;

-- ----------------------------
-- Table structure for messenger_friendships
-- ----------------------------
DROP TABLE IF EXISTS `messenger_friendships`;
CREATE TABLE `messenger_friendships` (
  `userid` bigint(20) NOT NULL,
  `friendid` bigint(20) NOT NULL,
  KEY `index extreme` (`userid`),
  KEY `extreme the 2nd` (`friendid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for messenger_messages
-- ----------------------------
DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE `messenger_messages` (
  `userid` int(15) NOT NULL,
  `friendid` int(15) NOT NULL,
  `messageid` int(11) NOT NULL,
  `sent_on` text COLLATE latin1_general_ci NOT NULL,
  `message` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`userid`,`messageid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for poll
-- ----------------------------
DROP TABLE IF EXISTS `poll`;
CREATE TABLE `poll` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thanks` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pid` (`pid`,`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for poll_answers
-- ----------------------------
DROP TABLE IF EXISTS `poll_answers`;
CREATE TABLE `poll_answers` (
  `aid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `answer` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for poll_questions
-- ----------------------------
DROP TABLE IF EXISTS `poll_questions`;
CREATE TABLE `poll_questions` (
  `qid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `type` enum('1','2','3') NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  UNIQUE KEY `qid` (`qid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for poll_results
-- ----------------------------
DROP TABLE IF EXISTS `poll_results`;
CREATE TABLE `poll_results` (
  `pid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `answers` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for rank_fuserights
-- ----------------------------
DROP TABLE IF EXISTS `rank_fuserights`;
CREATE TABLE `rank_fuserights` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `minrank` int(1) NOT NULL,
  `fuseright` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`,`fuseright`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of rank_fuserights
-- ----------------------------
BEGIN;
INSERT INTO `rank_fuserights` VALUES (1, 1, 'default');
INSERT INTO `rank_fuserights` VALUES (2, 1, 'fuse_login');
INSERT INTO `rank_fuserights` VALUES (3, 1, 'fuse_buy_credits');
INSERT INTO `rank_fuserights` VALUES (4, 1, 'fuse_trade');
INSERT INTO `rank_fuserights` VALUES (5, 1, 'fuse_room_queue_default');
INSERT INTO `rank_fuserights` VALUES (6, 2, 'fuse_extended_buddylist');
INSERT INTO `rank_fuserights` VALUES (7, 2, 'fuse_habbo_chooser');
INSERT INTO `rank_fuserights` VALUES (8, 2, 'fuse_furni_chooser');
INSERT INTO `rank_fuserights` VALUES (9, 2, 'fuse_room_queue_club');
INSERT INTO `rank_fuserights` VALUES (10, 2, 'fuse_priority_access');
INSERT INTO `rank_fuserights` VALUES (11, 2, 'fuse_use_special_room_layouts');
INSERT INTO `rank_fuserights` VALUES (12, 2, 'fuse_use_club_dance');
INSERT INTO `rank_fuserights` VALUES (13, 3, 'fuse_enter_full_rooms');
INSERT INTO `rank_fuserights` VALUES (14, 4, 'fuse_enter_locked_rooms');
INSERT INTO `rank_fuserights` VALUES (16, 4, 'fuse_kick');
INSERT INTO `rank_fuserights` VALUES (17, 4, 'fuse_mute');
INSERT INTO `rank_fuserights` VALUES (18, 5, 'fuse_ban');
INSERT INTO `rank_fuserights` VALUES (19, 5, 'fuse_room_mute');
INSERT INTO `rank_fuserights` VALUES (20, 5, 'fuse_room_kick');
INSERT INTO `rank_fuserights` VALUES (21, 5, 'fuse_receive_calls_for_help');
INSERT INTO `rank_fuserights` VALUES (22, 5, 'fuse_remove_stickies');
INSERT INTO `rank_fuserights` VALUES (23, 6, 'fuse_mod');
INSERT INTO `rank_fuserights` VALUES (24, 6, 'fuse_superban');
INSERT INTO `rank_fuserights` VALUES (25, 6, 'fuse_pick_up_any_furni');
INSERT INTO `rank_fuserights` VALUES (26, 6, 'fuse_ignore_room_owner');
INSERT INTO `rank_fuserights` VALUES (27, 6, 'fuse_any_room_controller');
INSERT INTO `rank_fuserights` VALUES (28, 3, 'fuse_room_alert');
INSERT INTO `rank_fuserights` VALUES (29, 6, 'fuse_moderator_access');
INSERT INTO `rank_fuserights` VALUES (30, 7, 'fuse_administrator_access');
INSERT INTO `rank_fuserights` VALUES (31, 7, 'fuse_see_flat_ids');
COMMIT;

-- ----------------------------
-- Table structure for ranks
-- ----------------------------
DROP TABLE IF EXISTS `ranks`;
CREATE TABLE `ranks` (
  `rankid` int(1) NOT NULL,
  `rankname` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `ignoreFilter` int(1) NOT NULL,
  `receiveCFH` int(1) NOT NULL,
  `enterAllRooms` int(1) NOT NULL,
  `seeAllOwners` int(1) NOT NULL,
  `adminCatalogue` int(1) NOT NULL,
  `staffFloor` int(1) NOT NULL,
  `rightsEverywhere` int(4) NOT NULL,
  PRIMARY KEY (`rankid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for room_ads
-- ----------------------------
DROP TABLE IF EXISTS `room_ads`;
CREATE TABLE `room_ads` (
  `roomid` int(10) NOT NULL,
  `img` text COLLATE latin1_general_ci NOT NULL,
  `uri` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for room_bans
-- ----------------------------
DROP TABLE IF EXISTS `room_bans`;
CREATE TABLE `room_bans` (
  `roomid` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `ban_expire` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for room_categories
-- ----------------------------
DROP TABLE IF EXISTS `room_categories`;
CREATE TABLE `room_categories` (
  `id` int(3) NOT NULL DEFAULT '0',
  `parent` int(3) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '1',
  `name` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT 'Non-named category',
  `access_rank_min` int(2) NOT NULL,
  `access_rank_hideforlower` enum('0','1') COLLATE latin1_general_ci NOT NULL,
  `trading` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of room_categories
-- ----------------------------
BEGIN;
INSERT INTO `room_categories` VALUES (0, 1, 2, 'No category', 1, '0', '0');
INSERT INTO `room_categories` VALUES (3, 0, 0, 'Public Spaces', 1, '0', '0');
INSERT INTO `room_categories` VALUES (4, 0, 2, 'Guestrooms', 1, '0', '0');
INSERT INTO `room_categories` VALUES (6, 4, 2, 'HOT - Rooms of the Month', 1, '0', '1');
INSERT INTO `room_categories` VALUES (5, 3, 0, 'Outside Spaces', 1, '0', '0');
INSERT INTO `room_categories` VALUES (7, 3, 0, 'Entertainment', 1, '0', '0');
INSERT INTO `room_categories` VALUES (8, 5, 0, 'The Park & Infobus', 1, '0', '0');
INSERT INTO `room_categories` VALUES (9, 7, 0, 'Clubs & bars', 1, '0', '0');
INSERT INTO `room_categories` VALUES (10, 4, 2, 'Staff Recommended Room\'s', 7, '0', '1');
INSERT INTO `room_categories` VALUES (11, 3, 0, 'Battleball & Snowstorm', 1, '1', '0');
INSERT INTO `room_categories` VALUES (12, 22, 0, 'Battleball For noobs', 1, '1', '0');
INSERT INTO `room_categories` VALUES (13, 22, 0, 'Battleball For Amateurs', 1, '1', '0');
INSERT INTO `room_categories` VALUES (14, 22, 0, 'Battleball For Intermediate', 1, '1', '0');
INSERT INTO `room_categories` VALUES (15, 22, 0, 'Battleball For Experts', 1, '1', '0');
INSERT INTO `room_categories` VALUES (16, 22, 0, 'Battleball For Leets', 1, '1', '0');
INSERT INTO `room_categories` VALUES (17, 23, 0, 'Snowstorm For noobs', 1, '0', '0');
INSERT INTO `room_categories` VALUES (18, 23, 0, 'Snowstorm For Amateurs', 1, '0', '0');
INSERT INTO `room_categories` VALUES (19, 23, 0, 'Snowstorm For Intermediate', 1, '0', '0');
INSERT INTO `room_categories` VALUES (20, 23, 0, 'Snowstorm For Experts', 1, '0', '0');
INSERT INTO `room_categories` VALUES (21, 23, 0, 'Snowstorm For Leets', 1, '0', '0');
INSERT INTO `room_categories` VALUES (22, 11, 0, 'Battleball', 1, '0', '0');
INSERT INTO `room_categories` VALUES (23, 11, 0, 'Snowstorm', 1, '0', '0');
INSERT INTO `room_categories` VALUES (25, 4, 2, 'Games & Mazes', 1, '0', '1');
INSERT INTO `room_categories` VALUES (26, 4, 2, 'Helpdesks & Information', 1, '0', '0');
INSERT INTO `room_categories` VALUES (27, 4, 2, 'Nightclubs & Restaurants', 1, '0', '1');
INSERT INTO `room_categories` VALUES (28, 4, 2, 'Chilling & Chatting', 1, '0', '0');
INSERT INTO `room_categories` VALUES (29, 4, 2, 'Theme & Parks', 1, '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for room_modeldata
-- ----------------------------
DROP TABLE IF EXISTS `room_modeldata`;
CREATE TABLE `room_modeldata` (
  `model` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `roomomatic_subscr_only` int(1) NOT NULL DEFAULT '0',
  `door_x` int(3) NOT NULL,
  `door_y` int(3) NOT NULL,
  `door_h` int(3) NOT NULL,
  `door_z` int(1) NOT NULL,
  `heightmap` text COLLATE latin1_general_ci NOT NULL,
  `publicroom_items` text COLLATE latin1_general_ci NOT NULL,
  `swimmingpool` enum('1','0') COLLATE latin1_general_ci NOT NULL,
  `specialcast_emitter` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `specialcast_interval` int(10) DEFAULT NULL,
  `specialcast_rnd_min` int(10) DEFAULT NULL,
  `specialcast_rnd_max` int(10) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of room_modeldata
-- ----------------------------
BEGIN;
INSERT INTO `room_modeldata` VALUES ('a', 0, 3, 5, 0, 0, 'xxxxxxxxxxxx\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxx00000000\rxxxxxxxxxxxx\rxxxxxxxxxxxx\r', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('b', 0, 0, 5, 0, 0, 'xxxxxxxxxxxx\rxxxxx0000000\rxxxxx0000000\rxxxxx0000000\rxxxxx0000000\rx00000000000\rx00000000000\rx00000000000\rx00000000000\rx00000000000\rx00000000000\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\r', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('c', 0, 4, 7, 0, 0, 'xxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('d', 0, 4, 7, 0, 0, 'xxxxxxxxxxxx\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxx000000x\rxxxxxxxxxxxx\r', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('e', 0, 1, 5, 0, 0, 'xxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxx0000000000\rxx0000000000\rxx0000000000\rxx0000000000\rxx0000000000\rxx0000000000\rxx0000000000\rxx0000000000\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\r', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('f', 0, 2, 5, 0, 0, 'xxxxxxxxxxxx\rxxxxxxx0000x\rxxxxxxx0000x\rxxx00000000x\rxxx00000000x\rxxx00000000x\rxxx00000000x\rx0000000000x\rx0000000000x\rx0000000000x\rx0000000000x\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx\r', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('g', 0, 1, 7, 1, 0, 'xxxxxxxxxxxxx\rxxxxxxxxxxxxx\rxxxxxxx00000x\rxxxxxxx00000x\rxxxxxxx00000x\rxx1111000000x\rxx1111000000x\rxx1111000000x\rxx1111000000x\rxx1111000000x\rxxxxxxx00000x\rxxxxxxx00000x\rxxxxxxx00000x\rxxxxxxxxxxxxx\rxxxxxxxxxxxxx\rxxxxxxxxxxxxx\rxxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('h', 0, 4, 4, 1, 0, 'xxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxx111111x\rxxxxx111111x\rxxxxx111111x\rxxxxx111111x\rxxxxx111111x\rxxxxx000000x\rxxxxx000000x\rxxx00000000x\rxxx00000000x\rxxx00000000x\rxxx00000000x\rxxxxxxxxxxxx\rxxxxxxxxxxxx\rxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('i', 0, 0, 10, 0, 0, 'xxxxxxxxxxxxxxxxx\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rx0000000000000000\rxxxxxxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('j', 0, 0, 10, 0, 0, 'xxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxx0000000000\rxxxxxxxxxxx0000000000\rxxxxxxxxxxx0000000000\rxxxxxxxxxxx0000000000\rxxxxxxxxxxx0000000000\rxxxxxxxxxxx0000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx0000000000xxxxxxxxxx\rx0000000000xxxxxxxxxx\rx0000000000xxxxxxxxxx\rx0000000000xxxxxxxxxx\rx0000000000xxxxxxxxxx\rx0000000000xxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxx\r', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('k', 0, 0, 13, 0, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx00000000\r\nxxxxxxxxxxxxxxxxx00000000\r\nxxxxxxxxxxxxxxxxx00000000\r\nxxxxxxxxxxxxxxxxx00000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nx000000000000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxx0000000000000000\r\nxxxxxxxxxxxxxxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('l', 0, 0, 16, 0, 0, 'xxxxxxxxxxxxxxxxxxxxx\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rx00000000xxxx00000000\rxxxxxxxxxxxxxxxxxxxxx\r', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('m', 0, 0, 15, 1, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rx0000000000000000000000000000\rx0000000000000000000000000000\rx0000000000000000000000000000\rx0000000000000000000000000000\rx0000000000000000000000000000\rx0000000000000000000000000000\rx0000000000000000000000000000\rx0000000000000000000000000000\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxx00000000xxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('n', 0, 0, 16, 0, 0, 'xxxxxxxxxxxxxxxxxxxxx\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx000000xxxxxxxx000000\rx000000x000000x000000\rx000000x000000x000000\rx000000x000000x000000\rx000000x000000x000000\rx000000x000000x000000\rx000000x000000x000000\rx000000xxxxxxxx000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rx00000000000000000000\rxxxxxxxxxxxxxxxxxxxxx\r', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('o', 0, 0, 18, 1, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxx11111111xxxx\rxxxxxxxxxxxxx11111111xxxx\rxxxxxxxxxxxxx11111111xxxx\rxxxxxxxxxxxxx11111111xxxx\rxxxxxxxxxxxxx11111111xxxx\rxxxxxxxxxxxxx11111111xxxx\rxxxxxxxxxxxxx11111111xxxx\rxxxxxxxxxxxxx00000000xxxx\rxxxxxxxxx0000000000000000\rxxxxxxxxx0000000000000000\rxxxxxxxxx0000000000000000\rxxxxxxxxx0000000000000000\rxxxxxxxxx0000000000000000\rxxxxxxxxx0000000000000000\rx111111100000000000000000\rx111111100000000000000000\rx111111100000000000000000\rx111111100000000000000000\rx111111100000000000000000\rx111111100000000000000000\rx111111100000000000000000\rx111111100000000000000000\rxxxxxxxxx0000000000000000\rxxxxxxxxx0000000000000000\rxxxxxxxxx0000000000000000\rxxxxxxxxx0000000000000000\rxxxxxxxxxxxxxxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('p', 0, 0, 23, 2, 0, 'xxxxxxxxxxxxxxxxxxx\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx222222222222\r\nxxxxxxx22222222xxxx\r\nxxxxxxx11111111xxxx\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx222221111111111111\r\nx2222xx11111111xxxx\r\nx2222xx00000000xxxx\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nx2222xx000000000000\r\nxxxxxxxxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('q', 0, 10, 4, 2, 0, 'xxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxx22222222\rxxxxxxxxxxx22222222\rxxxxxxxxxxx22222222\rxxxxxxxxxxx22222222\rxxxxxxxxxxx22222222\rxxxxxxxxxxx22222222\rx222222222222222222\rx222222222222222222\rx222222222222222222\rx222222222222222222\rx222222222222222222\rx222222222222222222\rx2222xxxxxxxxxxxxxx\rx2222xxxxxxxxxxxxxx\rx2222211111xx000000\rx222221111110000000\rx222221111110000000\rx2222211111xx000000\rxx22xxx1111xxxxxxxx\rxx11xxx1111xxxxxxxx\rx1111xx1111xx000000\rx1111xx111110000000\rx1111xx111110000000\rx1111xx1111xx000000\rxxxxxxxxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('r', 0, 10, 4, 3, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxx33333333333333\rxxxxxxxxxxx33333333333333\rxxxxxxxxxxx33333333333333\rxxxxxxxxxxx33333333333333\rxxxxxxxxxxx33333333333333\rxxxxxxxxxxx33333333333333\rxxxxxxx333333333333333333\rxxxxxxx333333333333333333\rxxxxxxx333333333333333333\rxxxxxxx333333333333333333\rxxxxxxx333333333333333333\rxxxxxxx333333333333333333\rx4444433333xxxxxxxxxxxxxx\rx4444433333xxxxxxxxxxxxxx\rx44444333333222xx000000xx\rx44444333333222xx000000xx\rxxx44xxxxxxxx22xx000000xx\rxxx33xxxxxxxx11xx000000xx\rxxx33322222211110000000xx\rxxx33322222211110000000xx\rxxxxxxxxxxxxxxxxx000000xx\rxxxxxxxxxxxxxxxxx000000xx\rxxxxxxxxxxxxxxxxx000000xx\rxxxxxxxxxxxxxxxxx000000xx\rxxxxxxxxxxxxxxxxxxxxxxxxx', '', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('newbie_lobby', 0, 2, 11, 0, 2, 'xxxxxxxxxxxxxxxx000000\rxxxxx0xxxxxxxxxx000000\rxxxxx00000000xxx000000\rxxxxx000000000xx000000\r0000000000000000000000\r0000000000000000000000\r0000000000000000000000\r0000000000000000000000\r0000000000000000000000\rxxxxx000000000000000xx\rxxxxx000000000000000xx\rx0000000000000000000xx\rx0000000000000000xxxxx\rxxxxxx00000000000xxxxx\rxxxxxxx0000000000xxxxx\rxxxxxxxx000000000xxxxx\rxxxxxxxx000000000xxxxx\rxxxxxxxx000000000xxxxx\rxxxxxxxx000000000xxxxx\rxxxxxxxx000000000xxxxx\rxxxxxxxx000000000xxxxx\rxxxxxx00000000000xxxxx\rxxxxxx00000000000xxxxx\rxxxxxx00000000000xxxxx\rxxxxxx00000000000xxxxx\rxxxxxx00000000000xxxxx\rxxxxx000000000000xxxxx\rxxxxx000000000000xxxxx\r', 'a160 crl_lamp 16 0 0 0 1\r\ny170 crl_sofa2c 17 0 0 4 2\r\nw180 crl_sofa2b 18 0 0 4 2\r\nv190 crl_sofa2a 19 0 0 4 2\r\na200 crl_lamp 20 0 0 0 1\r\nb161 crl_chair 16 1 0 2 2\r\na72 crl_lamp 7 2 0 0 1\r\na112 crl_lamp 11 2 0 0 1\r\nb162 crl_chair 16 2 0 2 2\r\nc53 crl_pillar 5 3 0 0 1\r\nb73 crl_chair 7 3 0 2 2\r\nu93 crl_table1b 9 3 0 0 1\r\ns113 crl_sofa1c 11 3 0 6 2\r\nb163 crl_chair 16 3 0 2 2\r\nA193 crl_table2b 19 3 0 0 1\r\nz203 crl_table2a 20 3 0 0 1\r\na04 crl_lamp 0 4 0 0 1\r\ny14 crl_sofa2c 1 4 0 4 2\r\nw24 crl_sofa2b 2 4 0 4 2\r\nv34 crl_sofa2a 3 4 0 4 2\r\na44 crl_lamp 4 4 0 0 1\r\nt94 crl_table1a 9 4 0 0 1\r\nr114 crl_sofa1b 11 4 0 6 2\r\nh154 crl_wall2a 15 4 0 0 1\r\na164 crl_lamp 16 4 0 0 1\r\nb05 crl_chair 0 5 0 2 2\r\nb75 crl_chair 7 5 0 2 2\r\nq115 crl_sofa1a 11 5 0 6 2\r\nA26 crl_table2b 2 6 0 0 1\r\nz36 crl_table2a 3 6 0 0 1\r\na116 crl_lamp 11 6 0 0 1\r\nb07 crl_chair 0 7 0 2 2\r\na08 crl_lamp 0 8 0 0 1\r\nD18 crl_sofa3c 1 8 0 0 2\r\nC28 crl_sofa3b 2 8 0 0 2\r\nB38 crl_sofa3a 3 8 0 0 2\r\na48 crl_lamp 4 8 0 0 1\r\no198 crl_barchair2 19 8 0 0 2\r\np208 crl_tablebar 20 8 0 0 1\r\no218 crl_barchair2 21 8 0 0 2\r\nE59 crl_pillar2 5 9 0 0 1\r\nc99 crl_pillar 9 9 0 0 1\r\nP815 crl_desk1a 8 15 0 0 1\r\nO915 crl_deski 9 15 0 0 1\r\nN1015 crl_deskh 10 15 0 0 1\r\nM1016 crl_deskg 10 16 0 0 1\r\nL1017 crl_deskf 10 17 0 0 1\r\nK1018 crl_deske 10 18 0 0 1\r\nK1019 crl_deske 10 19 0 0 1\r\nK1020 crl_deske 10 20 0 0 1\r\nK1021 crl_deske 10 21 0 0 1\r\nK1022 crl_deske 10 22 0 0 1\r\nK1023 crl_deske 10 23 0 0 1\r\nG724 crl_wallb 7 24 0 0 1\r\nK1024 crl_deske 10 24 0 0 1\r\nF725 crl_walla 7 25 0 0 1\r\nH825 crl_desk1b 8 25 0 0 1\r\nI925 crl_desk1c 9 25 0 0 1\r\nJ1025 crl_desk1d 10 25 0 0 1\r\nd1227 crl_lamp2 12 27 0 0 1\r\nf1327 crl_cabinet2 13 27 0 0 1\r\ne1427 crl_cabinet1 14 27 0 0 1\r\nd1527 crl_lamp2 15 27 0 0 1', '', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('theater', 0, 20, 27, 0, 0, 'XXXXXXXXXXXXXXXXXXXXXXX\rXXXXXXXXXXXXXXXXXXXXXXX\rXXXXXXXXXXXXXXXXXXXXXXX\rXXXXXXXXXXXXXXXXXXXXXXX\rXXXXXXXXXXXXXXXXXXXXXXX\rXXXXXXXXXXXXXXXXXXXXXXX\rXXXXXXX111111111XXXXXXX\rXXXXXXX11111111100000XX\rXXXX00X11111111100000XX\rXXXX00x11111111100000XX\r4XXX00X11111111100000XX\r4440000XXXXXXXXX00000XX\r444000000000000000000XX\r4XX000000000000000000XX\r4XX0000000000000000000X\r44400000000000000000000\r44400000000000000000000\r44X0000000000000000O000\r44X11111111111111111000\r44X11111111111111111000\r33X11111111111111111000\r22X11111111111111111000\r22X11111111111111111000\r22X11111111111111111000\r22X11111111111111111000\r22X11111111111111111000\r22211111111111111111000\r22211111111111111111000\rXXXXXXXXXXXXXXXXXXXX00X\rXXXXXXXXXXXXXXXXXXXX00X\r', 'm1110 mic 11 10 1 0 1\r\nd211 thchair2 2 11 4 2 2\r\nd212 thchair2 2 12 4 2 2\r\nd215 thchair2 2 15 4 2 2\r\nc615 thchair1 6 15 0 0 2\r\nc715 thchair1 7 15 0 0 2\r\nc815 thchair1 8 15 0 0 2\r\nc915 thchair1 9 15 0 0 2\r\nc1015 thchair1 10 15 0 0 2\r\nc1215 thchair1 12 15 0 0 2\r\nc1315 thchair1 13 15 0 0 2\r\nc1415 thchair1 14 15 0 0 2\r\nc1515 thchair1 15 15 0 0 2\r\nc1615 thchair1 16 15 0 0 2\r\nd216 thchair2 2 16 4 2 2\r\nc620 thchair1 6 20 1 0 2\r\nc720 thchair1 7 20 1 0 2\r\nc820 thchair1 8 20 1 0 2\r\nc920 thchair1 9 20 1 0 2\r\nc1020 thchair1 10 20 1 0 2\r\nc1220 thchair1 12 20 1 0 2\r\nc1320 thchair1 13 20 1 0 2\r\nc1420 thchair1 14 20 1 0 2\r\nc1520 thchair1 15 20 1 0 2\r\nc1620 thchair1 16 20 1 0 2\r\nc623 thchair1 6 23 1 0 2\r\nc723 thchair1 7 23 1 0 2\r\nc823 thchair1 8 23 1 0 2\r\nc923 thchair1 9 23 1 0 2\r\nc1023 thchair1 10 23 1 0 2\r\nc1223 thchair1 12 23 1 0 2\r\nc1323 thchair1 13 23 1 0 2\r\nc1423 thchair1 14 23 1 0 2\r\nc1523 thchair1 15 23 1 0 2\r\nc1623 thchair1 16 23 1 0 2\r\nc626 thchair1 6 26 1 0 2\r\nc726 thchair1 7 26 1 0 2\r\nc826 thchair1 8 26 1 0 2\r\nc926 thchair1 9 26 1 0 2\r\nc1026 thchair1 10 26 1 0 2\r\nc1226 thchair1 12 26 1 0 2\r\nc1326 thchair1 13 26 1 0 2\r\nc1426 thchair1 14 26 1 0 2\r\nc1526 thchair1 15 26 1 0 2\r\nc1626 thchair1 16 26 1 0 2', '', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('library', 0, 20, 3, 1, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxx11111xx1xx1x111111x\rxxxxxxxxxxxx111111xx1xx11111111x\rxx111xxxxxxx111111xx1xx11111111x\rxx111xxxxxxx1111111111111111111x\rxx111xxxxxxx1111111111111111111x\rxx111xxxxxxx1111111111111111111x\rxx111xxxxxxx1111111111111xxxxxxx\rxx111xxxxxx11111111111111111111x\rxx111xxxxxx11111111111111111111x\rxx111xxxxxx11111111111111111111x\rxx111xxxxxx11111111111111xxxxxxx\rxx111xxxxxxxx111111111111111111x\rxx111xx11111x111111111111111111x\rxx111xx11111x111111111111111111x\rxx111xxxxx11x11111111x111xxxxxxx\rxx111xxxxxxxx11111111xx11111111x\rxx111xxx1111111111111xxx1111111x\rxx111xxx1111111111111xxxx111111x\rxxx111xx1111111111x11xxxx000000x\rxxxxx1111xx1111111x11xxxx000000x\rxxxxxxxxxxxx111111x11xxxx000000x\rxxxxxxxxxxxx11xx11x11xxxx000000x\rxxxxxxxxxxxx11xx11x11xxxx000000x\rxxxxxxxxxxxx11xx11x11xxxx000000x\rxxxxxxxxxxxx11xx11x11xxxx000000x\rxxxxxxxxxxxx11xx11x11xxxx000000x\rxxxxxxxxxxxx11xx11x111xxx000000x\rxxxxxxxxxxxxxxxxxxxx11xxx000000x\rxxxxxxxxxxxxxxxxxxxx11xxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxx22222xxxxxxx\rxxxxxxxxxxxxxxxxxxxx22222xxxxxxx\rxxxxxxxxxxxxxxxxxxxx22222xxxxxxx\rxxxxxxxxxxxxxxxxxxxx22222xxxxxxx\rxxxxxxxxxxxxxxxxxxxx22222xxxxxxx\rxxxxxxxxxxxxxxxxxxxx22222xxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r', 'a142 libchair 14 2 1 4 2\r\na162 libchair 16 2 1 4 2\r\na262 libchair 26 2 1 4 2\r\na243 libchair 24 3 1 2 2\r\na124 libchair 12 4 1 2 2\r\na126 libchair 12 6 1 2 2\r\nb1314 libstool 13 14 1 6 2\r\nb1315 libstool 13 15 1 6 2\r\nb1316 libstool 13 16 1 6 2\r\na2827 libchair 28 27 0 4 2\r\na2729 libchair 27 29 0 2 2\r\nb2433 libstool 24 33 2 6 2\r\nb2434 libstool 24 34 2 6 2\r\nb2435 libstool 24 35 2 6 2\r\nb2136 libstool 21 36 2 0 2\r\nb2236 libstool 22 36 2 0 2\r\nb2336 libstool 23 36 2 0 2', '', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('floatinggarden', 0, 2, 21, 5, 0, 'xxxxxxxxxxxxxxxx333333xxxxxxxxx\rxxxxxxxxxxxxxxxx3xxxx3xxxxxxxxx\rxxxxxxxxxxxxxxxx3xxxx3xxxxxxxxx\rxxxxxxxxxxxxxxxx3xxxx3xxxxxxxxx\rxxxxxxxxxxxxxxx223xxx33xxxxxxxx\rxxxxxxxxxxxxxxx11xxx33333xxxxxx\rxxxxxxxxxxxxxxxx11xx3333333xxxx\rxxxxxxxxxxxxxxxx11xx33333333xxx\rxxxxxxxxxxxxxxxxx11xxxxxxxx3xxx\rxxxxxxxxxxxxxxxxxx11xxxx3333xxx\rxxxxxxxxxxxxxxxxxxx1xxxx33333xx\rxxxxxxxxxxxxxxxxxxx1xxx3333333x\r555xxxxxxxxxxx1111111x333333333\r555xxxxxxxxxxx21111111xxxxxx333\r555xxxxxxxxxxx22111111111xxxxxx\r555xxxxxxxxxxx222xxxxxxx111xxxx\r555xxxxxxxxxxx22xxxxxxxxxx1xxxx\r555xxxxxxxxxxx23333333333x111xx\r555xxxxxxxx33333333333333x111xx\r555xxxxxxxx333333x3333333x111xx\r555xxxxxxxx33333333333333x111xx\r555xxxxxxxx33x33333333333x111xx\r555xxxxxxxx33x33x33333333x111xx\r555xxxxxxxx33x33x33333333x111xx\r5554333333333x333x3333333x111xx\rx554333333xxxx33xxxxxxxxxx111xx\rxxxxxxxxx3xxxx333221111111111xx\rxxxxxxxxx3xxxx333221111111111xx\rxxxxxxxxx33333333xx1111x11x11xx\rxxxxxxxxx33333333111xxx11xxxxxx\rxxxxxxxxxxxxxx33311xxxx11xxxxxx\rxxxxxxxxxxxxxx33311xxxx11xxxxxx\rxxxxxxxxxxxxxx333x1xxxx11xxxxxx\rxxxxxxxxxxxxxx333x1xx111111xxxx\rxxxxxxxxxxxxxx33311xx111111xxxx\rxxxxxxxxxx333333311xx111111xxxx\rxxxxxxxxxxx33333311xx111111xxxx\rxxxxxxxxxxxxxxxx111xxxxxxxxxxxx\rxxxxxxxxxxxxxxx111xxxxxxxxxxxxx\r', 'a249 float_dummychair 24 9 3 4 2\r\na259 float_dummychair 25 9 3 4 2\r\nb2813 float_dummychair2 28 13 3 4 2\r\nb2913 float_dummychair2 29 13 3 4 2\r\ne1717 floatbench2 17 17 3 2 2\r\ne1917 floatbench2 19 17 3 6 2\r\ne2117 floatbench2 21 17 3 2 2\r\ne2317 floatbench2 23 17 3 6 2\r\ne2717 floatbench2 27 17 1 4 2\r\nd2817 floatbench1 28 17 1 4 2\r\nd1718 floatbench1 17 18 3 2 2\r\nd1918 floatbench1 19 18 3 6 2\r\nd2118 floatbench1 21 18 3 2 2\r\nd2318 floatbench1 23 18 3 6 2\r\ne2719 floatbench2 27 19 1 0 2\r\nd2819 floatbench1 28 19 1 0 2\r\ne1723 floatbench2 17 23 3 2 2\r\ne1923 floatbench2 19 23 3 6 2\r\ne2123 floatbench2 21 23 3 2 2\r\ne2323 floatbench2 23 23 3 6 2\r\ne2723 floatbench2 27 23 1 4 2\r\nd2823 floatbench1 28 23 1 4 2\r\nd1724 floatbench1 17 24 100000 2 2\r\nd1924 floatbench1 19 24 3 6 2\r\nd2124 floatbench1 21 24 3 2 2\r\nd2324 floatbench1 23 24 3 6 2\r\ne2725 floatbench2 27 25 1 0 2\r\nd2825 floatbench1 28 25 1 0 2\r\na1729 float_dummychair 17 29 1 2 2\r\na1730 float_dummychair 17 30 1 2 2\r\na1731 float_dummychair 17 31 1 2 2\r\na2133 float_dummychair 21 33 1 2 2\r\na2633 float_dummychair 26 33 1 6 2\r\na2134 float_dummychair 21 34 1 2 2\r\na2634 float_dummychair 26 34 1 6 2\r\na1735 float_dummychair 17 35 1 2 2\r\na2135 float_dummychair 21 35 1 2 2\r\na2635 float_dummychair 26 35 1 6 2\r\na1736 float_dummychair 17 36 1 2 2\r\na2136 float_dummychair 21 36 1 2 2\r\na2636 float_dummychair 26 36 1 6 2\r\na1537 float_dummychair 15 37 100000 4 2\r\na1637 float_dummychair 16 37 1 4 2', '', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('sunset_cafe', 0, 34, 40, 0, 4, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000000xxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxx00000xx00000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx00000000xxx0000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx00000000xxxx000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx0000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\n', 'd3221 chairup4 32 21 0 3 2\r\nf3321 chairup6 33 21 0 4 2\r\nf3421 chairup6 34 21 0 4 2\r\nf3521 chairup6 35 21 0 4 2\r\nf3621 chairup6 36 21 0 4 2\r\ng3721 chairup7 37 21 0 4 2\r\nb3222 chairup2 32 22 0 2 2\r\ne2523 chairup5 25 23 0 4 2\r\nf2623 chairup6 26 23 0 4 2\r\nf2723 chairup6 27 23 0 4 2\r\nf2823 chairup6 28 23 0 4 2\r\ng2923 chairup7 29 23 0 4 2\r\na3223 chairup1 32 23 0 2 2\r\nA2424 counter5 24 24 0 7 1\r\nr2524 table2 25 24 0 7 1\r\nq2624 table1 26 24 0 7 1\r\np2425 counter3 24 25 0 7 1\r\nz2426 counter4 24 26 0 7 1\r\np2427 counter3 24 27 0 7 1\r\np2428 counter3 24 28 0 7 1\r\ny2928 palms4 29 28 0 7 1\r\np2429 counter3 24 29 0 7 1\r\nx2929 palms3 29 29 0 7 1\r\np2430 counter3 24 30 0 7 1\r\nw2930 palms2 29 30 0 7 1\r\nn2231 counter1 22 31 0 7 1\r\nn2331 counter1 23 31 0 7 1\r\no2431 counter2 24 31 0 7 1\r\nv2931 palms1 29 31 0 7 1\r\ne3031 chairup5 30 31 0 4 2\r\nf3131 chairup6 31 31 0 4 2\r\nf3231 chairup6 32 31 0 4 2\r\nf3331 chairup6 33 31 0 4 2\r\nf3431 chairup6 34 31 0 4 2\r\nf3531 chairup6 35 31 0 4 2\r\nf3631 chairup6 36 31 0 4 2\r\nj3731 chairright3 37 31 0 5 2\r\nc2132 chairup3 21 32 0 2 2\r\nt2232 table4 22 32 0 7 1\r\nr3032 table2 30 32 0 7 1\r\nq3132 table1 31 32 0 7 1\r\nr3332 table2 33 32 0 7 1\r\nq3432 table1 34 32 0 7 1\r\ni3732 chairright2 37 32 0 6 2\r\nb2133 chairup2 21 33 0 2 2\r\ns2233 table3 22 33 0 7 1\r\ni3733 chairright2 37 33 0 6 2\r\nb2134 chairup2 21 34 0 2 2\r\nt3634 table4 36 34 0 7 1\r\ni3734 chairright2 37 34 0 6 2\r\nb2135 chairup2 21 35 0 2 2\r\nr2435 table2 24 35 0 7 1\r\nq2535 table1 25 35 0 7 1\r\nr2735 table2 27 35 0 7 1\r\nq2835 table1 28 35 0 7 1\r\nu3335 palm 33 35 0 7 1\r\ns3635 table3 36 35 0 7 1\r\ni3735 chairright2 37 35 0 6 2\r\nm2136 chairleft3 21 36 0 1 2\r\nl2236 chairleft2 22 36 0 0 2\r\nl2336 chairleft2 23 36 0 0 2\r\nl2436 chairleft2 24 36 0 0 2\r\nl2536 chairleft2 25 36 0 0 2\r\nl2636 chairleft2 26 36 0 0 2\r\nl2736 chairleft2 27 36 0 0 2\r\nk2836 chairleft1 28 36 0 0 2\r\ni3736 chairright2 37 36 0 6 2\r\nt3637 table4 36 37 0 7 1\r\ni3737 chairright2 37 37 0 6 2\r\ns3638 table3 36 38 0 7 1\r\nh3738 chairright1 37 38 0 6 2', '', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('pool_a', 0, 2, 25, 7, 2, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxx7xxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxx777xxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxx7777777xxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxx77777777xxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx77777777xxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx777777777xxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx7xxx777777xxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx7x777777777xxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx7xxx77777777xxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx7x777777777x7xxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx7xxx7777777777xxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx777777777777xxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx77777777777x2111xxxxxxxxxxxx\rxxxxxxxxxxxxxxx7777777777x221111xxxxxxxxxxx\rxxxxxxxxx7777777777777777x2211111xxxxxxxxxx\rxxxxxxxxx7777777777777777x22211111xxxxxxxxx\rxxxxxxxxx7777777777777777x222211111xxxxxxxx\rxxxxxx77777777777777777777x222211111xxxxxxx\rxxxxxx7777777xx777777777777x222211111xxxxxx\rxxxxxx7777777xx77777777777772222111111xxxxx\rxxxxxx777777777777777777777x22221111111xxxx\rxx7777777777777777777777x322222211111111xxx\r77777777777777777777777x33222222111111111xx\r7777777777777777777777x333222222211111111xx\rxx7777777777777777777x333322222222111111xxx\rxx7777777777777777777333332222222221111xxxx\rxx777xxx777777777777733333222222222211xxxxx\rxx777x7x77777777777773333322222222222xxxxxx\rxx777x7x7777777777777x33332222222222xxxxxxx\rxxx77x7x7777777777777xx333222222222xxxxxxxx\rxxxx77777777777777777xxx3222222222xxxxxxxxx\rxxxxx777777777777777777xx22222222xxxxxxxxxx\rxxxxxx777777777777777777x2222222xxxxxxxxxxx\rxxxxxxx777777777777777777222222xxxxxxxxxxxx\rxxxxxxxx7777777777777777722222xxxxxxxxxxxxx\rxxxxxxxxx77777777777777772222xxxxxxxxxxxxxx\rxxxxxxxxxx777777777777777222xxxxxxxxxxxxxxx\rxxxxxxxxxxx77777777777777x2xxxxxxxxxxxxxxxx\rxxxxxxxxxxxx77777777777777xxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxx777777777777xxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxx7777777777xxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx77777777xxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxx777777xxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxx7777xxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxx77xxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r', 'u184 umbrella2 18 4 7 0 1\r\nb185 pool_2sofa2 18 5 7 2 2\r\nB186 pool_2sofa1 18 6 7 2 2\r\nu720 umbrella2 7 20 7 0 1\r\nc820 pool_chair2 8 20 7 4 2\r\nu2420 umbrella2 24 20 7 0 1\r\nc2520 pool_chair2 25 20 7 4 2\r\nc721 pool_chair2 7 21 7 2 2\r\nt821 pool_table2 8 21 7 0 2\r\nc921 pool_chair2 9 21 7 6 2\r\nc2421 pool_chair2 24 21 7 2 2\r\nt2521 pool_table2 25 21 7 0 1\r\nc822 pool_chair2 8 22 7 0 2\r\nR228 flower2b 2 28 7 0 1\r\nr229 flower2a 2 29 7 0 1\r\nL632 box 6 32 7 0 1\r\nf1333 flower1 13 33 7 0 1\r\ny1034 pool_chairy 10 34 7 4 2\r\n8835 umbrellay 8 35 7 0 1\r\ny935 pool_chairy 9 35 7 2 2 2\r\nQ1035 pool_tabley 10 35 7 0 1\r\ny1135 pool_chairy 11 35 7 6 2\r\n91535 umbrellap 15 35 7 0 1\r\n72135 umbrellao 21 35 7 0 1\r\ny1036 pool_chairy 10 36 7 0 2\r\nP1536 pool_chairp 15 36 7 4 2\r\no2136 pool_chairo 21 36 7 4 2\r\no2236 pool_chairo 22 36 7 4 2\r\nP1437 pool_chairp 14 37 7 2 2\r\nZ1537 pool_tablep 15 37 7 0 1\r\nP1637 pool_chairp 16 37 7 6 2\r\nK2137 pool_tabo 21 37 7 6 1\r\nk2237 pool_tabo2 22 37 7 6 1\r\nP1438 pool_chairp 14 38 7 2 2\r\nz1538 pool_tablep2 15 38 7 0 1\r\nP1638 pool_chairp 16 38 7 6 2\r\no2138 pool_chairo 21 38 7 0 2\r\no2238 pool_chairo 22 38 7 0 2\r\nP1539 pool_chairp 15 39 7 0 2\r\ng2041 pool_chairg 20 41 7 4 2\r\ng2141 pool_chairg 21 41 7 4 2\r\nW2042 pool_tablg 20 42 7 6 1\r\nw2142 pool_tablg2 21 42 7 6 1\r\nG1943 umbrellag 19 43 7 0 1\r\ng2043 pool_chairg 20 43 7 0 2\r\ng2143 pool_chairg 21 43 7 0 2', '1', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('pub_a', 0, 15, 25, 0, 6, 'xxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxx2222222211111xxx\rxxxxxxxxx2222222211111xxx\rxxxxxxxxx2222222211111xxx\rxxxxxxxxx2222222211111xxx\rxxxxxxxxx2222222222111xxx\rxxxxxxxxx2222222222111xxx\rxxxxxxxxx2222222222000xxx\rxxxxxxxxx2222222222000xxx\rxxxxxxxxx2222222222000xxx\rxxxxxxxxx2222222222000xxx\rx333333332222222222000xxx\rx333333332222222222000xxx\rx333333332222222222000xxx\rx333333332222222222000xxx\rx333333332222222222000xxx\rx333332222222222222000xxx\rx333332222222222222000xxx\rx333332222222222222000xxx\rx333332222222222222000xxx\rx333333332222222222000xxx\rxxxxx31111112222222000xxx\rxxxxx31111111000000000xxx\rxxxxx31111111000000000xxx\rxxxxx31111111000000000xxx\rxxxxx31111111000000000xxx\rxxxxxxxxxxxxxxx00xxxxxxxx\rxxxxxxxxxxxxxxx00xxxxxxxx\rxxxxxxxxxxxxxxx00xxxxxxxx\rxxxxxxxxxxxxxxx00xxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxx\r', 'S191 pub_sofa2 19 1 1 4 1\r\ns201 pub_sofa 20 1 1 4 2\r\ns211 pub_sofa 21 1 1 4 2\r\nq112 bardesk1 11 2 2 0 1\r\nc122 pub_chair 12 2 2 6 2\r\nQ113 bardesk2 11 3 2 0 1\r\nq114 bardesk1 11 4 2 0 1\r\nc124 pub_chair 12 4 2 6 2\r\nQ115 bardesk2 11 5 2 0 1\r\nf185 pub_fence 18 5 2 1 1\r\nq116 bardesk1 11 6 2 0 1\r\nc126 pub_chair 12 6 2 6 2\r\nf186 pub_fence 18 6 2 0 1\r\nQ117 bardesk2 11 7 2 0 1\r\nf187 pub_fence 18 7 2 0 1\r\nq118 bardesk1 11 8 2 0 1\r\nc128 pub_chair 12 8 2 6 2\r\nf188 pub_fence 18 8 2 0 1\r\nw109 bardesk4 10 9 2 0 1\r\nW119 bardesk3 11 9 2 0 1\r\nf189 pub_fence 18 9 2 0 1\r\nf1810 pub_fence 18 10 2 0 1\r\nC211 pub_chair2 2 11 3 4 2\r\nC311 pub_chair2 3 11 3 4 2\r\nC511 pub_chair2 5 11 3 4 2\r\nC611 pub_chair2 6 11 3 4 2\r\nf811 pub_fence 8 11 3 1 1\r\nf1811 pub_fence 18 11 2 0 1\r\nf812 pub_fence 8 12 3 0 1\r\nf1812 pub_fence 18 12 2 0 1\r\nf813 pub_fence 8 13 3 0 1\r\nC913 pub_chair2 9 13 2 2 2\r\nk1413 pub_chair3 14 13 2 2 2\r\nT1513 pub_table2 15 13 2 1 1\r\nk1613 pub_chair3 16 13 2 6 2\r\nf1813 pub_fence 18 13 2 0 1\r\nf814 pub_fence 8 14 3 2 1\r\nC914 pub_chair2 9 14 2 2 2\r\nk1414 pub_chair3 14 14 2 2 2\r\nT1514 pub_table2 15 14 2 2 1\r\nk1614 pub_chair3 16 14 2 6 2\r\nf1814 pub_fence 18 14 2 0 1\r\nt115 pub_table 1 15 3 0 1\r\nf515 pub_fence 5 15 3 1 1\r\nf1815 pub_fence 18 15 2 0 1\r\nS116 pub_sofa2 1 16 3 2 2\r\nf516 pub_fence 5 16 3 0 1\r\nf1816 pub_fence 18 16 2 0 1\r\ns117 pub_sofa 1 17 3 2 2\r\nf517 pub_fence 5 17 3 0 1\r\nk1317 pub_chair3 13 17 2 4 2\r\nk1417 pub_chair3 14 17 2 4 2\r\nk1517 pub_chair3 15 17 2 4 2\r\nk1617 pub_chair3 16 17 2 4 2\r\nf1817 pub_fence 18 17 2 0 1\r\ns118 pub_sofa 1 18 3 2 2\r\nf518 pub_fence 5 18 3 0 1\r\nT1318 pub_table2 13 18 2 5 1\r\nT1418 pub_table2 14 18 2 6 1\r\nT1518 pub_table2 15 18 2 6 1\r\nT1618 pub_table2 16 18 2 4 1\r\nf1818 pub_fence 18 18 2 0 1\r\ns219 pub_sofa 2 19 3 0 2\r\nS319 pub_sofa2 3 19 3 0 2\r\nf519 pub_fence 5 19 3 0 1\r\nk1319 pub_chair3 13 19 2 0 2\r\nk1419 pub_chair3 14 19 2 0 2\r\nk1519 pub_chair3 15 19 2 0 2\r\nk1619 pub_chair3 16 19 2 0 2\r\nf1819 pub_fence 18 19 2 0 1\r\nf120 pub_fence 1 20 3 5 1\r\nf220 pub_fence 2 20 3 6 1\r\nf320 pub_fence 3 20 3 6 1\r\nf420 pub_fence 4 20 3 6 1\r\nf520 pub_fence 5 20 3 3 1\r\nf1820 pub_fence 18 20 2 0 1\r\nS721 pub_sofa2 7 21 1 4 2\r\ns821 pub_sofa 8 21 1 4 2\r\nf1221 pub_fence 12 21 2 5 1\r\nf1321 pub_fence 13 21 2 6 1\r\nf1421 pub_fence 14 21 2 6 1\r\nf1521 pub_fence 15 21 2 6 1\r\nf1621 pub_fence 16 21 2 6 1\r\nf1721 pub_fence 17 21 2 6 1\r\nf1821 pub_fence 18 21 2 3 1\r\nS622 pub_sofa2 6 22 1 2 2\r\nt1522 pub_table 15 22 0 0 1\r\nC1622 pub_chair2 16 22 0 4 2\r\nC1722 pub_chair2 17 22 0 4 2\r\ns623 pub_sofa 6 23 1 2 2\r\nT823 pub_table2 8 23 1 1 1\r\ns624 pub_sofa 6 24 1 2 2\r\nT824 pub_table2 8 24 1 0 1\r\ns625 pub_sofa 6 25 1 2 2\r\nT825 pub_table2 8 25 1 2 1', '', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('md_a', 0, 1, 5, 7, 2, 'xxxxxxxx77xxxxxxxxxxxxxxxx\rxxxxxxxx77xxxxxxxxxxxxxxxx\rxxxxxx77777x77xxxxxxxxxxxx\rxxx77777777777xxx44xxxxxxx\r77777777777777xx444444444x\r777777777777777xx44444444x\rxxx777777777777xx44444444x\rxxxx7777777777xxx44444444x\r7777777777777777744448444x\r7777777777777x4x744448444x\r777777777777x444444448444x\r7777777777774444444448444x\r7777777777774444444448444x\r777777777777x444444448444x\r7777777777777x44444448444x\rxxx777777777777x444448444x\rxxx7777777777777444448444x\rxxx7777777777777444448444x\rxxx777777777777x444448444x\rxxx77777777777x4444444444x\rxxxx777777777444444444444x\rxxxxxxxxxxxxxxxxxxxxxxxxxx\r', 'A43 mntdwchair 4 3 7 4 2\r\nA53 mntdwchair 5 3 7 4 2\r\nM28 barmask 2 8 7 0 1\r\ns78 mntdwsofa2 7 8 7 2 2\r\nt88 mntdwtable2 8 8 7 0 2\r\ns98 mntdwsofa2 9 8 7 6 2\r\ny218 paalu5 21 8 8 0 1\r\nM29 barmask 2 9 7 0 1\r\nS79 mntdwsofa1 7 9 7 2 2\r\nT89 mntdwtable1 8 9 7 0 2\r\nS99 mntdwsofa1 9 9 7 6 2\r\ny219 paalu5 21 9 8 0 1\r\nM210 barmask 2 10 7 0 1\r\ny2110 paalu5 21 10 8 0 1\r\nM211 barmask 2 11 7 0 1\r\ny2111 paalu5 21 11 8 0 1\r\nM212 barmask 2 12 7 0 1\r\ns712 mntdwsofa2 7 12 7 4 2\r\nS812 mntdwsofa1 8 12 7 4 2\r\ne2112 paalu3 21 12 8 0 1\r\nM213 barmask 2 13 7 0 1\r\nt713 mntdwtable2 7 13 7 2 1\r\nT813 mntdwtable1 8 13 7 2 1\r\ne2113 paalu3 21 13 8 0 1\r\nM214 barmask 2 14 7 0 1\r\ns714 mntdwsofa2 7 14 7 0 2\r\nS814 mntdwsofa1 8 14 7 0 2\r\ne2114 paalu3 21 14 8 0 1\r\nM215 barmask 2 15 100000 0 1\r\nq2115 paalu1 21 15 8 0 1\r\nM216 barmask 2 16 100000 0 1\r\ns1216 mntdwsofa2 12 16 7 4 2\r\nS1316 mntdwsofa1 13 16 7 4 2\r\nq2116 paalu1 21 16 8 0 1\r\nA317 mntdwchair 3 17 7 2 2\r\ns617 mntdwsofa2 6 17 7 2 2\r\nt717 mntdwtable2 7 17 7 0 1\r\ns817 mntdwsofa2 8 17 7 6 2\r\nt1217 mntdwtable2 12 17 7 2 1\r\nT1317 mntdwtable1 13 17 7 2 1\r\nq2117 paalu1 21 17 8 0 1\r\nA318 mntdwchair 3 18 7 2 2\r\nS618 mntdwsofa1 6 18 7 2 2\r\nT718 mntdwtable1 7 18 7 0 1\r\nS818 mntdwsofa1 8 18 7 6 2\r\ns1218 mntdwsofa2 12 18 7 0 2\r\nS1318 mntdwsofa1 13 18 7 0 2\r\nq2118 paalu1 21 18 8 0 1', '1', 'cam1', 4500, 1, 4);
INSERT INTO `room_modeldata` VALUES ('picnic', 0, 16, 5, 2, 4, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxx22222xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r22xxxxxxxxxxxxx22xxxxxxxxxxxxxxxxxxxxx\r2222222222222222222x222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222xxx222222222222222222222222\r2222222222xx33x22222222222222222222222\r222222222xx3333x2222222222222222222222\r222222222x333333x222222222222222222222\r222222222x333333x222222222222222222222\r2222222222x3332x2222222222222222222222\r22222222222x33x22222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222x22222xxxx22222222222222222222\r22222222222222xxxx22222222222222222222\r22222222222222xxx222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r22222222222222222222222222222222222222\r', 'h107 hedge7 10 7 2 4 1\r\nh117 hedge7 11 7 2 4 1\r\nh127 hedge7 12 7 2 4 1\r\nh137 hedge7 13 7 2 4 1\r\ny147 hedge8 14 7 2 4 1\r\ns187 hedge2 18 7 2 4 1\r\nh197 hedge7 19 7 2 4 1\r\nh207 hedge7 20 7 2 4 1\r\nh217 hedge7 21 7 2 4 1\r\nz148 hedge9 14 8 2 4 1\r\nz188 hedge9 18 8 2 4 1\r\nv39 hedge5 3 9 2 4 1\r\nz310 hedge9 3 10 2 4 1\r\nc1211 picnic_dummychair1 12 11 3 4 2\r\nc1311 picnic_dummychair1 13 11 3 4 2\r\nc1411 picnic_dummychair1 14 11 100000 4 2\r\nc1013 picnic_dummychair1 10 13 3 2 2\r\nc1513 picnic_dummychair1 15 13 3 6 2\r\nb2113 picnic_ground 21 13 2 4 2\r\nb714 picnic_ground 7 14 2 4 2\r\nc1014 picnic_dummychair1 10 14 3 2 2\r\nc1514 picnic_dummychair1 15 14 3 6 2\r\nb1915 picnic_ground 19 15 2 2 2\r\nb2315 picnic_ground 23 15 2 6 2\r\nb516 picnic_ground 5 16 2 2 2\r\nb916 picnic_ground 9 16 2 6 2\r\nL2016 picnic_cloth1 20 16 2 2 1\r\nL617 picnic_cloth1 6 17 2 2 1\r\nb2117 picnic_ground 21 17 2 0 2\r\nb718 picnic_ground 7 18 2 0 2\r\na019 picnic_redbench2 0 19 2 2 2\r\nA020 picnic_redbench1 0 20 2 2 2\r\nw1120 hedge6 11 20 2 4 1\r\nh1220 hedge7 12 20 2 4 1\r\nh1320 hedge7 13 20 2 4 1\r\nt1420 hedge3 14 20 2 4 1\r\nu1720 hedge4 17 20 2 4 1\r\nh1820 hedge7 18 20 2 4 1\r\nh1920 hedge7 19 20 2 4 1\r\ny2020 hedge8 20 20 2 4 1\r\nv1121 hedge5 11 21 2 4 1\r\nM1221 picnic_bench1 12 21 2 4 2\r\nN1321 picnic_bench2 13 21 2 4 2\r\nO1421 picnic_bench3 14 21 2 4 2\r\nM1721 picnic_bench1 17 21 2 4 2\r\nN1821 picnic_bench2 18 21 2 4 2\r\nO1921 picnic_bench3 19 21 2 4 2\r\nv2021 hedge5 20 21 2 4 1\r\na022 picnic_redbench2 0 22 2 2 2\r\nv1122 hedge5 11 22 2 4 1\r\nv2022 hedge5 20 22 2 4 1\r\nb2522 picnic_ground 25 22 2 4 1\r\nA023 picnic_redbench1 0 23 2 2 2\r\nv1123 hedge5 11 23 2 4 1\r\nM1223 picnic_bench1 12 23 2 2 2\r\nM1923 picnic_bench1 19 23 2 6 2\r\nv2023 hedge5 20 23 2 4 1\r\nc624 picnic_dummychair1 6 24 2 4 2\r\nd724 picnic_dummychair4 7 24 2 4 2\r\ne824 picnic_dummychair6 8 24 2 4 2\r\nv1124 hedge5 11 24 2 4 1\r\nN1224 picnic_bench2 12 24 2 2 2\r\nN1924 picnic_bench2 19 24 2 6 2\r\nv2024 hedge5 20 24 2 4 1\r\nb2324 picnic_ground 23 24 2 2 2\r\nb2724 picnic_ground 27 24 2 6 2\r\nK525 picnic_stump 5 25 2 2 2\r\nv1125 hedge5 11 25 2 4 1\r\nN1225 picnic_bench2 12 25 2 2 2\r\nN1925 picnic_bench2 19 25 2 6 2\r\nv2025 hedge5 20 25 2 4 1\r\nG2425 picnic_cloth2 24 25 2 2 1\r\nK726 picnic_stump 7 26 2 0 2\r\nv1126 hedge5 11 26 2 4 1\r\nO1226 picnic_bench3 12 26 2 2 2\r\nH1426 picnic_fireplace1 14 26 2 0 1\r\nI1626 picnic_fireplace2 16 26 2 2 1\r\nO1926 picnic_bench3 19 26 2 6 2\r\nv2026 hedge5 20 26 2 4 1\r\nb2526 picnic_ground 25 26 2 0 1\r\nz1127 hedge9 11 27 2 4 1\r\nQ1227 picnic_lemonade 12 27 2 4 1\r\nz2027 hedge9 20 27 2 4 1\r\nE829 picnic_firewood2 8 29 2 0 1\r\na030 picnic_redbench2 0 30 2 2 2\r\nD830 picnic_firewood1 8 30 2 0 1\r\nA031 picnic_redbench1 0 31 2 2 2\r\nD831 picnic_firewood1 8 31 2 0 1\r\nM1231 picnic_bench1 12 31 2 4 2\r\nN1331 picnic_bench2 13 31 2 4 2\r\nO1431 picnic_bench3 14 31 2 4 2\r\nM1831 picnic_bench1 18 31 2 4 2\r\nN1931 picnic_bench2 19 31 2 4 2\r\nO2031 picnic_bench3 20 31 2 4 2\r\nf2731 picnic_carrot 27 31 2 0 1\r\nf2831 picnic_carrot 28 31 2 0 1\r\nf2931 picnic_carrot 29 31 2 0 1\r\nf3031 picnic_carrot 30 31 2 0 1\r\nf3131 picnic_carrot 31 31 2 0 1\r\nD832 picnic_firewood1 8 32 2 0 1\r\nF1232 picnic_table2 12 32 2 2 1\r\nP1432 picnic_table 14 32 2 2 1\r\nF1832 picnic_table2 18 32 2 2 1\r\nP2032 picnic_table 20 32 2 2 1\r\nr333 hedge1 3 33 2 4 1\r\nD833 picnic_firewood1 8 33 2 0 1\r\nM1233 picnic_bench1 12 33 2 0 2\r\nN1333 picnic_bench2 13 33 2 0 2\r\nO1433 picnic_bench3 14 33 2 0 2\r\nM1833 picnic_bench1 18 33 2 0 2\r\nN1933 picnic_bench2 19 33 2 0 2\r\nO2033 picnic_bench3 20 33 2 0 2\r\ng2733 picnic_cabbage 27 33 2 0 1\r\ng2833 picnic_cabbage 28 33 2 0 1\r\ng2933 picnic_cabbage 29 33 2 0 1\r\nv334 hedge5 3 34 2 4 1\r\nD834 picnic_firewood1 8 34 2 0 1\r\nv335 hedge5 3 35 2 4 1\r\nD835 picnic_firewood1 8 35 2 0 1\r\nv336 hedge5 3 36 2 4 1\r\nD836 picnic_firewood1 8 36 2 0 1\r\nD837 picnic_firewood1 8 37 2 0 1\r\nM1237 picnic_bench1 12 37 2 4 2\r\nN1337 picnic_bench2 13 37 2 4 2\r\nO1437 picnic_bench3 14 37 2 4 2\r\nM1837 picnic_bench1 18 37 2 4 2\r\nN1937 picnic_bench2 19 37 2 4 2\r\nO2037 picnic_bench3 20 37 2 4 2\r\nD838 picnic_firewood1 8 38 2 0 1\r\nF1238 picnic_table2 12 38 2 2 1\r\nP1438 picnic_table 14 38 2 2 1\r\nF1838 picnic_table2 18 38 2 2 1\r\nP2038 picnic_table 20 38 2 2 1\r\nJ839 picnic_firewood3 8 39 2 0 1\r\nM1239 picnic_bench1 12 39 2 0 2\r\nN1339 picnic_bench2 13 39 2 0 2\r\nO1439 picnic_bench3 14 39 2 0 2\r\nM1839 picnic_bench1 18 39 2 0 2\r\nN1939 picnic_bench2 19 39 2 0 2\r\nO2039 picnic_bench3 20 39 2 0 2', '', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('park_a', 0, 2, 15, 0, 6, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00xxxxxxxxxxxx\rxxxxxxxxxxxxx0x00xxxxxxxxxxx0x000xxxxxxxxxxx\rxxxxxxxxxxxx0000000000000000000000xxxxxxxxxx\rxxxxxxxxxxx000000000000000000000000xxxxxxxxx\rxxxxxxxxxxx0000000000000000000000000xxxxxxxx\rxxxxxxxxxxx00000000000000000000000000xxxxxxx\rxxxxxxxx000000000000000000000000000000xxxxxx\rxxxxxxx00000000000000000000000000000000xxxxx\rxxxxxxx000000000000000000000000000000000xxxx\rxxxxxxx0000000000000000000000000000000000xxx\rxxxxxxxxx000000000000000000000000000000000xx\r00000000000000000000xx00000000000000000000xx\r0000000000000000000xxxx00000000000xxxxxxx0xx\r0000000000000000000xxxx00000000000x00000xxxx\rxxxxx00x0000000000xxxxx0xxxxxx0000x0000000xx\rxxxxx0000000000000xxxxx0xx000x0000x000000xxx\rxxxxx0000000000000xxxxx0x000000000x00000xxxx\rxxxxx000000x0000000xxxx0x000000000xxx00xxxxx\rxxxxxxxx000x0000000xxx00xxx000000x0000xxxxxx\rxxxxxxxx000x000000xxxx0x0000000000000xxxxxxx\rxxxxxxxx000x000000011100000000000000xxxxxxxx\rxxxxxxxx000x00000001110000000000000xxxxxxxxx\rxxxxxxxxx00x0000000111x00000000x00xxxxxxxxxx\rxxxxxxxxxx0x0000000xxx0000000xxxxxxxxxxxxxxx\rxxxxxxxxxxxx000000xxxx0000000xxxxxxxxxxxxxxx\rxxxxxxxxxxxx000000xxx00xxxxx00xxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxx0xxx0xx000x00xxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxx0xxx0x000000xxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxx0xxx0x00000xxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxx0xxxxx00xxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxx0xxxxx0xxxxxxxxxxxxxxxxxxxx\r', 'L89 bench2 8 9 0 4 2\r\nK99 bench 9 9 0 4 2\r\nL711 bench2 7 11 0 2 2\r\nK712 bench 7 12 0 2 2\r\nL3516 bench2 35 16 0 2 2\r\nL3716 bench2 37 16 0 4 2\r\nK3816 bench 38 16 0 4 2\r\nK3517 bench 35 17 0 2 2\r\nL2718 bench2 27 18 0 4 2\r\nK2818 bench 28 18 0 4 2\r\nL3518 bench2 35 18 0 2 2\r\nL2519 bench2 25 19 0 2 2\r\nK3519 bench 35 19 0 2 2\r\nK2520 bench 25 20 0 2 2\r\nL2529 bench2 25 29 0 4 2\r\nK2629 bench 26 29 0 4 2\r\nL2330 bench2 23 30 0 2 2\r\nK2331 bench 23 31 0 2 2', '', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('park_b', 0, 11, 2, 0, 6, '0000x0000000\r0000xx000000\r000000000000\r00000000000x\r000000000000\r00x0000x0000\r', 'C00 cornerchair2 0 0 0 4 2\r\nB10 cornerchair1 1 0 0 4 2\r\nA20 chair1 2 0 0 4 2\r\nA30 chair1 3 0 0 4 2\r\nH50 table1 5 0 0 4 1\r\nE60 chair1line 6 0 0 4 2\r\nA70 chair1 7 0 0 4 2\r\nF80 chair1frontend 8 0 0 4 2\r\nJ100 hububar 10 0 0 4 1\r\nB01 cornerchair1 0 1 0 2 2\r\nA02 chair1 0 2 0 2 2\r\nA03 chair1 0 3 0 2 2\r\nA04 chair1 0 4 0 2 2\r\nF05 chair1frontend 0 5 0 2 2\r\nI35 table2 3 5 0 4 1\r\nD55 modchair 5 5 0 0 2\r\nI85 table2 8 5 0 4 1', '', 'sf', 5000, 1, 6);
INSERT INTO `room_modeldata` VALUES ('pool_b', 0, 9, 21, 7, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx7xxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx777xxxxxxxxxxx\rxxxxxxxxxxxxxxxxxx8888888x7xxx77777xxxxxxxxxx\rxxxxxxxxxxxxxxxxxx8888888x7xxx777777xxxxxxxxx\rxxxxxxxxxxxxxxxx88xxxxx77x7x777777777xxxxxxxx\rxxxxxxxxxxxxxxxx88x7777777777777777777xxxxxxx\rxxxxxxxxxxxxxxxx88x77777777777777777777xxxxxx\rxxxxxxxxxxxxxx9988x77777777777777777777xxxxxx\rxxxxxxxxxxxxxx9988x7777777777777777777x00xxxx\rxxxxxxxxxxxxxx9988x777777777777777777x0000xxx\rxxxxxxxxxxxxxx9988x7777777x0000000000000000xx\rxxxxxxxxxxxxxx9988x777777x000000000000000000x\r7777777777xxxx9988777777x0x0000000000000000xx\rx7777777777xxx998877777x000x00000000000000xxx\rxx7777777777xx99887777x00000x000000000000xxxx\rxxx7777777777x9988777x0000000x0000000000xxxxx\rxxxx777777777x777777x00000000x000000000xxxxxx\rxxxxx777777777777777000000000x00000000xxxxxxx\rxxxxxx77777777777777000000000x0000000xxxxxxxx\rxxxxxxx777777x7777770000000000xxxx00xxxxxxxxx\rxxxxxxxx77777777777xx0000000000000xxxxxxxxxxx\rxxxxxxxxx777777110000x000000000000xxxxxxxxxxx\rxxxxxxxxxx7x77x1100000x0000000000xxxxxxxxxxxx\rxxxxxxxxxxx777x11000000x00000000xxxxxxxxxxxxx\rxxxxxxxxxxxx771110000000x000000xxxxxxxxxxxxxx\rxxxxxxxxxxxxx111100000000x0000xxxxxxxxxxxxxxx\rxxxxxxxxxxxxxx11100000000x000xxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxx1100000000x00xxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxx110000000x0xxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxx110000000xxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxx1100000xxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxx11000xxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxx110xxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxx1xxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'u332 umbrella2 33 2 7 0 1\r\nb183 pool_2sofa2 18 3 8 4 2\r\nB193 pool_2sofa1 19 3 8 4 2\r\nb203 pool_2sofa2 20 3 8 4 2\r\nB213 pool_2sofa1 21 3 8 4 2\r\nb223 pool_2sofa2 22 3 8 4 2\r\nB233 pool_2sofa1 23 3 8 4 2\r\nc333 pool_chair2 33 3 7 4 2\r\nc324 pool_chair2 32 4 7 2 2\r\nt334 pool_table2 33 4 7 0 1\r\nc344 pool_chair2 34 4 7 6 2\r\nb165 pool_2sofa2 16 5 8 2 2\r\nc335 pool_chair2 33 5 7 0 2\r\nB166 pool_2sofa1 16 6 8 2 2\r\nb167 pool_2sofa2 16 7 8 2 2\r\nc357 pool_chair2 35 7 7 4 2\r\nf148 flower1 14 8 9 0 1\r\nB168 pool_2sofa1 16 8 8 2 2\r\nu338 umbrella2 33 8 7 0 1\r\nc348 pool_chair2 34 8 7 2 2\r\nt358 pool_table2 35 8 7 0 1\r\nc368 pool_chair2 36 8 7 6 2\r\nb149 pool_2sofa2 14 9 9 2 2\r\nb169 pool_2sofa2 16 9 8 2 2\r\nc359 pool_chair2 35 9 7 0 2\r\nB1410 pool_2sofa1 14 10 9 2 2\r\nB1610 pool_2sofa1 16 10 8 2 2\r\nb1411 pool_2sofa2 14 11 9 2 2\r\nb1611 pool_2sofa2 16 11 8 2 2\r\nB1412 pool_2sofa1 14 12 9 2 2\r\nB1612 pool_2sofa1 16 12 8 2 2\r\nR313 flower2b 3 13 7 2 1\r\nr413 flower2a 4 13 7 2 1\r\nb1413 pool_2sofa2 14 13 9 2 2\r\nb1613 pool_2sofa2 16 13 8 2 2\r\nB1414 pool_2sofa1 14 14 9 2 2\r\nB1614 pool_2sofa1 16 14 8 2 2', '1', 'cam1', 4500, 1, 4);
INSERT INTO `room_modeldata` VALUES ('bb_lobby_1', 0, 14, 19, 0, 0, 'xxx2222222222222222x\r\nxxx2222222222222222x\r\nxxx2222222222222222x\r\nxxx2222222222222222x\r\nxxx11111111111111111\r\n11x11111111111111111\r\n11x11111111111111111\r\n11x11111111111111111\r\nx1x11111111111111111\r\nxxx11111111111111111\r\nxxx11111111111111111\r\nxxx11111111111111111\r\nxxx11111111111111111\r\nxxx11111111111111111\r\nxxxxxxxxx00000000000\r\nxxxxxxxxx00000000000\r\nxxxxxxxxx00000000000\r\nxxxxxxxxx00000000000\r\nxxxxxxxxx00000000000\r\nxxxxxxxxx00000000000\r\nxxxxxxxxxxxxx000xxxx\r\nxxxxxxxxxxxxx000xxxx\r\nxxxxxxxxxxxxx000xxxx', 'n30 bb_crossrd 3 0 2 2 1\r\nb40 bb_bench1 4 0 2 4 2\r\nc50 bb_bench2 5 0 2 4 2\r\nh80 bb_plant1 8 0 2 0 1\r\nd90 bb_sofa1 9 0 2 4 2\r\ne100 bb_sofa2 10 0 2 4 2\r\nh110 bb_plant1 11 0 2 0 1\r\nd120 bb_sofa1 12 0 2 4 2\r\ne130 bb_sofa2 13 0 2 4 2\r\nh140 bb_plant1 14 0 2 0 1\r\nb160 bb_bench1 16 0 2 4 2\r\nc170 bb_bench2 17 0 2 4 2\r\nk180 bb_corner1out 18 0 2 0 1\r\nb31 bb_bench1 3 1 2 2 2\r\no181 bb_wallend1in 18 1 2 2 1\r\nc32 bb_bench2 3 2 2 2 2\r\no182 bb_wallend1in 18 2 2 2 1\r\nj33 bb_plant3 3 3 2 0 1\r\nt73 bb_special 7 3 2 6 1\r\no83 bb_wallend1in 8 3 2 6 1\r\no93 bb_wallend1in 9 3 2 6 1\r\no103 bb_wallend1in 10 3 2 6 1\r\no113 bb_wallend1in 11 3 2 6 1\r\nn123 bb_crossrd 12 3 2 2 1\r\nn163 bb_crossrd 16 3 2 0 1\r\no173 bb_wallend1in 17 3 2 6 1\r\nn183 bb_crossrd 18 3 2 2 1\r\np34 bb_wallend2in 3 4 1 4 1\r\no74 bb_wallend1in 7 4 1 4 1\r\nb84 bb_bench1 8 4 1 4 2\r\nc94 bb_bench2 9 4 1 4 2\r\nb104 bb_bench1 10 4 1 4 2\r\nc114 bb_bench2 11 4 1 4 2\r\np124 bb_wallend2in 12 4 1 4 1\r\no164 bb_wallend1in 16 4 1 4 1\r\nb174 bb_bench1 17 4 1 4 2\r\nc184 bb_bench2 18 4 1 4 2\r\nm194 bb_wallendout 19 4 1 4 1\r\na75 bb_stool 7 5 1 2 2\r\na125 bb_stool 12 5 1 6 2\r\nb195 bb_bench1 19 5 1 6 2\r\na36 bb_stool 3 6 1 6 2\r\nc196 bb_bench2 19 6 1 6 2\r\nf97 bb_chair 9 7 1 4 2\r\nf107 bb_chair 10 7 1 4 2\r\nb177 bb_bench1 17 7 1 0 2\r\nc187 bb_bench2 18 7 1 0 2\r\nm197 bb_wallendout 19 7 1 0 1\r\na38 bb_stool 3 8 1 6 2\r\nu178 bb_extra 17 8 1 4 1\r\nu188 bb_extra 18 8 1 2 1\r\nn198 bb_crossrd 19 8 1 6 1\r\na39 bb_stool 3 9 1 6 2\r\nf99 bb_chair 9 9 1 0 2\r\nf109 bb_chair 10 9 1 0 2\r\nb179 bb_bench1 17 9 1 4 2\r\nc189 bb_bench2 18 9 1 4 2\r\nm199 bb_wallendout 19 9 1 4 1\r\nb1910 bb_bench1 19 10 1 6 2\r\na711 bb_stool 7 11 1 2 2\r\na1211 bb_stool 12 11 1 6 2\r\nc1911 bb_bench2 19 11 1 6 2\r\no712 bb_wallend1in 7 12 1 0 1\r\nb812 bb_bench1 8 12 1 0 2\r\nc912 bb_bench2 9 12 1 0 2\r\nb1012 bb_bench1 10 12 1 0 2\r\nc1112 bb_bench2 11 12 1 0 2\r\np1212 bb_wallend2in 12 12 1 0 1\r\nb1712 bb_bench1 17 12 1 0 2\r\nc1812 bb_bench2 18 12 1 0 2\r\nm1912 bb_wallendout 19 12 1 0 1\r\nk713 bb_corner1out 7 13 1 4 1\r\nl813 bb_wallout 8 13 1 6 1\r\nl913 bb_wallout 9 13 1 6 1\r\nl1013 bb_wallout 10 13 1 6 1\r\nl1113 bb_wallout 11 13 1 6 1\r\nt1213 bb_special 12 13 1 2 1\r\nm1613 bb_wallendout 16 13 1 6 1\r\nl1713 bb_wallout 17 13 1 6 1\r\nl1813 bb_wallout 18 13 1 6 1\r\nk1913 bb_corner1out 19 13 1 2 1\r\ng914 bb_plant0 9 14 0 6 1\r\nd1014 bb_sofa1 10 14 0 4 2\r\ne1114 bb_sofa2 11 14 0 4 2\r\ni1214 bb_plant2 12 14 0 0 1\r\ni1614 bb_plant2 16 14 0 6 1\r\nd1714 bb_sofa1 17 14 0 4 2\r\ne1814 bb_sofa2 18 14 0 4 2\r\ng1914 bb_plant0 19 14 0 0 1\r\nd915 bb_sofa1 9 15 0 2 2\r\nd1915 bb_sofa1 19 15 0 6 2\r\ne916 bb_sofa2 9 16 0 2 2\r\ne1916 bb_sofa2 19 16 0 6 2\r\nd917 bb_sofa1 9 17 0 2 2\r\nd1917 bb_sofa1 19 17 0 6 2\r\ne918 bb_sofa2 9 18 0 2 2\r\ne1918 bb_sofa2 19 18 0 6 2\r\ng919 bb_plant0 9 19 0 4 1\r\nd1019 bb_sofa1 10 19 0 0 2\r\ne1119 bb_sofa2 11 19 0 0 2\r\nj1219 bb_plant3 12 19 0 2 1\r\nj1619 bb_plant3 16 19 0 4 1\r\nd1719 bb_sofa1 17 19 0 0 2\r\ne1819 bb_sofa2 18 19 0 0 2\r\ng1919 bb_plant0 19 19 0 2 1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('snowwar_lobby_1', 0, 41, 36, 1, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx11111xx1xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx11111xx1111xxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx111111xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxx111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxx1111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxx111111111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxx1111x1111111111xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'a3118 sw_barrellchair 31 18 1 6 2\r\na3119 sw_barrellchair 31 19 1 6 2\r\na3020 sw_barrellchair 30 20 1 0 2\r\na3720 sw_barrellchair 37 20 1 0 2\r\na3920 sw_barrellchair 39 20 1 0 2\r\na4120 sw_barrellchair 41 20 1 0 2\r\nd3024 sw_chair1 30 24 1 4 2\r\nc3124 sw_chair2 31 24 1 4 2\r\nc3224 sw_chair2 32 24 1 4 2\r\nc3324 sw_chair2 33 24 1 4 2\r\nb3424 sw_chair3 34 24 1 4 2\r\ni3025 sw_table1 30 25 1 0 1\r\nh3125 sw_table2 31 25 1 0 1\r\ng3225 sw_table3 32 25 1 0 1\r\nf3325 sw_table4 33 25 1 0 1\r\ne3425 sw_table5 34 25 1 0 1\r\nd3026 sw_chair1 30 26 1 0 2\r\nc3126 sw_chair2 31 26 1 0 2\r\nc3226 sw_chair2 32 26 1 0 2\r\nc3326 sw_chair2 33 26 1 0 2\r\nb3426 sw_chair3 34 26 1 0 2\r\nd3029 sw_chair1 30 29 1 4 2\r\nc3129 sw_chair2 31 29 1 4 2\r\nc3229 sw_chair2 32 29 1 4 2\r\nc3329 sw_chair2 33 29 1 4 2\r\nb3429 sw_chair3 34 29 1 4 2\r\ni3030 sw_table1 30 30 1 0 1\r\nh3130 sw_table2 31 30 1 0 1\r\ng3230 sw_table3 32 30 1 0 1\r\nf3330 sw_table4 33 30 1 0 1\r\ne3430 sw_table5 34 30 1 0 1\r\nd3031 sw_chair1 30 31 1 0 2\r\nc3131 sw_chair2 31 31 1 0 2\r\nc3231 sw_chair2 32 31 1 0 2\r\nc3331 sw_chair2 33 31 1 0 2\r\nb3431 sw_chair3 34 31 1 0 2\r\nx2732 invisichair 27 32 1 2 2\r\nx2733 invisichair 27 33 1 2 2\r\nx2734 invisichair 27 34 1 2 2\r\nx2836 invisichair 28 36 1 0 2\r\nx2936 invisichair 29 36 1 0 2\r\nx3036 invisichair 30 36 1 0 2\r\nx3136 invisichair 31 36 1 0 2', '0', NULL, NULL, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('cafe_gold0', 0, 9, 29, 0, 0, 'xxxxxxxxxx1111xxxxxxx\r\nxxxxxxxxxx11111xxxxxx\r\nxxxxxxxxxx111111xxxxx\r\nxx111111111111111xxxx\r\nx11111111111111111xxx\r\n1111111111111111111xx\r\n11111111111111111111x\r\n111111111111111111111\r\n111111111111111111111\r\n1111111111111x1111111\r\n1111111000000x1111111\r\n1111111000000x1111111\r\n1111111000000x1111111\r\n1111111000000x1111111\r\n1111111000000x1111111\r\n1111111000000x1111111\r\n1111111000000x1111111\r\n1111111000000x1111111\r\n1111111000000x1111111\r\n1111111000000xxx00000\r\n111111100000000000000\r\n111111100000000000000\r\n111111100000000000000\r\n111111100000000xxxxx0\r\n11111110000000xxxxxx0\r\n11111110000000xxxxxx0\r\n11111110000000xxxxxxx\r\nx1111110000000xxxxxxx\r\nxxxxxxxx0000000000xxx\r\nxxxxxxxx000xxxxxxxxxx\r\nxxxxxxxx000xxxxxxxxxx\r\nxxxxxxxx000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx', 'c53 gold_chair 5 3 1 2 2\r\nt63 gold_table_small1 6 3 1 6 1\r\nc73 gold_chair 7 3 1 6 2\r\n5103 gold_bardesk5 10 3 1 0 1\r\n4113 gold_bardesk4 11 3 1 0 1\r\n3123 gold_bardesk3 12 3 1 0 1\r\n2133 gold_bardesk2 13 3 1 0 1\r\n1143 gold_bardesk1 14 3 1 0 1\r\nc54 gold_chair 5 4 1 2 2\r\ny64 gold_table_small2 6 4 1 6 1\r\nc74 gold_chair 7 4 1 6 2\r\nc05 gold_chair 0 5 1 2 2\r\nt15 gold_table_small1 1 5 1 6 1\r\nc25 gold_chair 2 5 1 6 2\r\nc06 gold_chair 0 6 1 2 2\r\ny16 gold_table_small2 1 6 1 6 1\r\nc26 gold_chair 2 6 1 6 2\r\nc56 gold_chair 5 6 1 2 2\r\nt66 gold_table_small1 6 6 1 6 1\r\nc76 gold_chair 7 6 1 6 2\r\nc57 gold_chair 5 7 1 2 2\r\ny67 gold_table_small2 6 7 1 6 1\r\nc77 gold_chair 7 7 1 6 2\r\nc08 gold_chair 0 8 1 2 2\r\nt18 gold_table_small1 1 8 1 6 1\r\nc28 gold_chair 2 8 1 6 2\r\nc198 gold_chair 19 8 1 4 2\r\nc208 gold_chair 20 8 1 4 2\r\nc09 gold_chair 0 9 1 2 2\r\ny19 gold_table_small2 1 9 1 6 1\r\nc29 gold_chair 2 9 1 6 2\r\nc149 gold_chair 14 9 1 4 2\r\nc159 gold_chair 15 9 1 4 2\r\nt1910 gold_table_small1 19 10 1 0 1\r\ny2010 gold_table_small2 20 10 1 0 1\r\nt1411 gold_table_small1 14 11 1 0 1\r\ny1511 gold_table_small2 15 11 1 0 1\r\np012 gold_plant 0 12 1 0 2\r\nc112 gold_chair 1 12 1 0 2\r\nc212 gold_chair 2 12 1 0 2\r\nc312 gold_chair 3 12 1 0 2\r\nc1912 gold_chair 19 12 1 0 2\r\nc2012 gold_chair 20 12 1 0 2\r\np013 gold_plant 0 13 1 0 1\r\nc113 gold_chair 1 13 1 4 2\r\nc213 gold_chair 2 13 1 4 2\r\nc313 gold_chair 3 13 1 4 2\r\nc1413 gold_chair 14 13 1 0 2\r\nc1513 gold_chair 15 13 1 0 2\r\nc014 gold_chair 0 14 1 2 2\r\nc1414 gold_chair 14 14 1 4 2\r\nc1514 gold_chair 15 14 1 4 2\r\nc015 gold_chair 0 15 1 2 2\r\nt215 gold_table_small1 2 15 1 0 1\r\ny315 gold_table_small2 3 15 1 0 1\r\nc016 gold_chair 0 16 1 2 2\r\nt1416 gold_table_small1 14 16 1 0 1\r\ny1516 gold_table_small2 15 16 1 0 1\r\np017 gold_plant 0 17 1 0 1\r\nc117 gold_chair 1 17 1 0 2\r\nc217 gold_chair 2 17 1 0 2\r\nc317 gold_chair 3 17 1 0 2\r\np018 gold_plant 0 18 1 0 1\r\nc118 gold_chair 1 18 1 4 2\r\nc218 gold_chair 2 18 1 4 2\r\nc318 gold_chair 3 18 1 4 2\r\nc1418 gold_chair 14 18 1 0 2\r\nc1518 gold_chair 15 18 1 0 2\r\nc019 gold_chair 0 19 1 2 2\r\nc020 gold_chair 0 20 1 2 2\r\nt220 gold_table_small1 2 20 1 0 1\r\ny320 gold_table_small2 3 20 1 0 1\r\nc021 gold_chair 0 21 1 2 2\r\np022 gold_plant 0 22 1 0 1\r\nc122 gold_chair 1 22 1 0 2\r\nc222 gold_chair 2 22 1 0 2\r\nc322 gold_chair 3 22 1 0 2\r\np023 gold_plant 0 23 1 0 1\r\nc123 gold_chair 1 23 1 4 2\r\nc223 gold_chair 2 23 1 4 2\r\nc323 gold_chair 3 23 1 4 2\r\nc024 gold_chair 0 24 1 2 2\r\nc025 gold_chair 0 25 1 2 2\r\nt225 gold_table_small1 2 25 1 0 1\r\ny325 gold_table_small2 3 25 1 0 1\r\nc026 gold_chair 0 26 1 2 2\r\nc127 gold_chair 1 27 1 0 2\r\nc227 gold_chair 2 27 1 0 2\r\nc327 gold_chair 3 27 1 0 2', '1', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('cafe', 0, 30, 40, 0, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000000xxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxx00000xx00000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx00000000xxx0000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx00000000xxxx000000xxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx0000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxx00000000000000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000000xxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0000xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'd3221 chairup4 32 21 0 3\r\nf3321 chairup6 33 21 0 4\r\nf3421 chairup6 34 21 0 4\r\nf3521 chairup6 35 21 0 4\r\nf3621 chairup6 36 21 0 4\r\ng3721 chairup7 37 21 0 4\r\nb3222 chairup2 32 22 0 2\r\ne2523 chairup5 25 23 0 4\r\nf2623 chairup6 26 23 0 4\r\nf2723 chairup6 27 23 0 4\r\nf2823 chairup6 28 23 0 4\r\ng2923 chairup7 29 23 0 4\r\na3223 chairup1 32 23 0 2\r\nA2424 counter5 24 24 0 7\r\nr2524 table2 25 24 0 7\r\nq2624 table1 26 24 0 7\r\np2425 counter3 24 25 0 7\r\nz2426 counter4 24 26 0 7\r\np2427 counter3 24 27 0 7\r\np2428 counter3 24 28 0 7\r\ny2928 palms4 29 28 0 7\r\np2429 counter3 24 29 0 7\r\nx2929 palms3 29 29 0 7\r\np2430 counter3 24 30 0 7\r\nw2930 palms2 29 30 0 7\r\nn2231 counter1 22 31 0 7\r\nn2331 counter1 23 31 0 7\r\no2431 counter2 24 31 0 7\r\nv2931 palms1 29 31 0 7\r\ne3031 chairup5 30 31 0 4\r\nf3131 chairup6 31 31 0 4\r\nf3231 chairup6 32 31 0 4\r\nf3331 chairup6 33 31 0 4\r\nf3431 chairup6 34 31 0 4\r\nf3531 chairup6 35 31 0 4\r\nf3631 chairup6 36 31 0 4\r\nj3731 chairright3 37 31 0 5\r\nc2132 chairup3 21 32 0 2\r\nt2232 table4 22 32 0 7\r\nr3032 table2 30 32 0 7\r\nq3132 table1 31 32 0 7\r\nr3332 table2 33 32 0 7\r\nq3432 table1 34 32 0 7\r\ni3732 chairright2 37 32 0 6\r\nb2133 chairup2 21 33 0 2\r\ns2233 table3 22 33 0 7\r\ni3733 chairright2 37 33 0 6\r\nb2134 chairup2 21 34 0 2\r\nt3634 table4 36 34 0 7\r\ni3734 chairright2 37 34 0 6\r\nb2135 chairup2 21 35 0 2\r\nr2435 table2 24 35 0 7\r\nq2535 table1 25 35 0 7\r\nr2735 table2 27 35 0 7\r\nq2835 table1 28 35 0 7\r\nu3335 palm 33 35 0 7\r\ns3635 table3 36 35 0 7\r\ni3735 chairright2 37 35 0 6\r\nm2136 chairleft3 21 36 0 1\r\nl2236 chairleft2 22 36 0 0\r\nl2336 chairleft2 23 36 0 0\r\nl2436 chairleft2 24 36 0 0\r\nl2536 chairleft2 25 36 0 0\r\nl2636 chairleft2 26 36 0 0\r\nl2736 chairleft2 27 36 0 0\r\nk2836 chairleft1 28 36 0 0\r\ni3736 chairright2 37 36 0 6\r\nt3637 table4 36 37 0 7\r\ni3737 chairright2 37 37 0 6\r\ns3638 table3 36 38 0 7\r\nh3738 chairright1 37 38 0 6', '0', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('cinema', 0, 20, 27, 1, 0, 'xxxxxxx1xx11111111xxxxxx\r\nxxx1111111111111111xxxxx\r\nxxx111xxxx1111111111xxxx\r\nxxxx2xxxxxxxxxxxxxxxxxxx\r\nxx3x3x333311xxxxxxxxxx11\r\nxx3333333311111111111111\r\nxx3333333311111111111111\r\nxx3333333311111111122111\r\nxx3333333311x22222222111\r\nxx3333333311x22222222111\r\nxx3333333311xxxxxxxxx111\r\nxx3333333311111111111111\r\nxx3333333311111111111111\r\nxx3333333311111111111111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\nxx3333333311111xxxx11111\r\n333333332111111xxxx11111\r\n333333332111111111111111\r\n333333332111111111111111\r\n333333332111111111111111\r\nxx3333332111111111111111\r\nxxxxxxxxxxxxxxxxxxx11111\r\nxxxxxxxxxxxxxxxxxxx11111\r\nxxxxxxxxxxxxxxxxxxx11111', 'C24 orange 2 4 3 0\r\nA74 loungey_chair 7 4 3 2\r\nV84 loungey_tablebigb 8 4 3 0\r\nA94 loungey_chair 9 4 3 6\r\nA25 loungey_chair 2 5 3 4\r\nA75 loungey_chair 7 5 3 2\r\nU85 loungey_tablebiga 8 5 3 0\r\nA95 loungey_chair 9 5 3 6\r\nB26 loungey_table 2 6 3 0\r\nA27 loungey_chair 2 7 3 0\r\nh137 theater_chair 13 7 1 0\r\nh147 theater_chair 14 7 1 0\r\nh157 theater_chair 15 7 1 0\r\nh167 theater_chair 16 7 1 0\r\nh177 theater_chair 17 7 1 0\r\nh187 theater_chair 18 7 1 0\r\nz217 stair 21 7 1 0\r\nL98 lightpole 9 8 3 0\r\nq138 pomomaski 13 8 2 2\r\nq148 pomomaski 14 8 2 0\r\nq158 pomomaski 15 8 2 0\r\nq168 pomomaski 16 8 2 0\r\nq178 pomomaski 17 8 2 0\r\nq188 pomomaski 18 8 2 0\r\nq198 pomomaski 19 8 2 1\r\nz218 stair 21 8 1 0\r\nC29 orange 2 9 3 0\r\nh139 theater_chair 13 9 2 0\r\nh149 theater_chair 14 9 2 0\r\nh159 theater_chair 15 9 2 0\r\nh169 theater_chair 16 9 2 0\r\nh179 theater_chair 17 9 2 0\r\nh189 theater_chair 18 9 2 0\r\nh199 theater_chair 19 9 2 0\r\nh209 theater_chair 20 9 2 0\r\nz219 stair 21 9 1 0\r\nA210 loungey_chair 2 10 3 4\r\nA910 loungey_chair 9 10 3 4\r\nB211 loungey_table 2 11 3 0\r\nB911 loungey_table 9 11 3 0\r\nA212 loungey_chair 2 12 3 0\r\nA912 loungey_chair 9 12 3 0\r\nd1712 cubicb_chair 17 12 1 6\r\nc1912 cubico_chair 19 12 1 2\r\nd1513 cubicb_chair 15 13 1 2\r\nL1913 lightpole 19 13 1 0\r\nd2013 cubicb_chair 20 13 1 6\r\nL914 lightpole 9 14 3 0\r\nA215 loungey_chair 2 15 3 4\r\nd1415 cubicb_chair 14 15 1 4\r\nc1915 cubico_chair 19 15 1 4\r\nB216 loungey_table 2 16 3 0\r\nA716 loungey_chair 7 16 3 2\r\nB816 loungey_table 8 16 3 2\r\nA916 loungey_chair 9 16 3 6\r\nd1316 cubicb_chair 13 16 1 2\r\nd1416 cubicb_chair 14 16 1 6\r\nC1916 orange 19 16 1 0\r\nA217 loungey_chair 2 17 3 0\r\nA717 loungey_chair 7 17 3 2\r\nB817 loungey_table 8 17 3 2\r\nA917 loungey_chair 9 17 3 6\r\nd1917 cubicb_chair 19 17 1 2\r\nC218 orange 2 18 3 0\r\nd1418 cubicb_chair 14 18 1 4\r\nK219 bardesque 2 19 3 0\r\nK220 bardesque 2 20 3 1\r\nb320 bar_chair 3 20 3 6\r\nL920 lightpole 9 20 3 0\r\nd1420 cubicb_chair 14 20 1 0\r\nd1920 cubicb_chair 19 20 1 2\r\nc2020 cubico_chair 20 20 1 6\r\nK221 bardesque 2 21 3 1\r\nb321 bar_chair 3 21 3 6\r\nd1921 cubicb_chair 19 21 1 0\r\nK222 bardesque 2 22 3 1\r\nb322 bar_chair 3 22 3 6\r\nL1622 lightpole 16 22 1 0\r\nc1822 cubico_chair 18 22 1 0\r\nK223 bardesque 2 23 3 1\r\nb323 bar_chair 3 23 3 6\r\nK224 bardesque 2 24 3 1\r\nb324 bar_chair 3 24 3 6\r\nK225 bardesque 2 25 3 2', '0', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('den', 0, 3, 22, 0, 0, '00000000xxxxxxxx\r\n0000000000000000\r\n0000000000000000\r\n000000000000xx00\r\n0000000000000000\r\n0000000000000000\r\n0000000000000000\r\nx000000000000000\r\n0000000000000000\r\n0000000000000000\r\n0000000000000000\r\n0000000000000000\r\nx000000000000000\r\nx000000000000000\r\nx000000000000000\r\nx000000000000000\r\nx000000000000000\r\nx000000000000000\r\nx000000000000000\r\nx000000000000000\r\nxxx00xxxxxxxxxxx\r\nxxx00xxxxxxxxxxx\r\nxxx00xxxxxxxxxxx', 'l70 crs_lamptable 7 0 0 0\r\ng141 tvtable 14 1 0 2\r\nt02 crs_trash 0 2 0 0\r\ns22 crs_sofag_start 2 2 0 4\r\nm32 crs_sofag_mid 3 2 0 4\r\nm42 crs_sofag_mid 4 2 0 4\r\nS52 crs_sofag_end 5 2 0 4\r\nR124 crs_roundwoodtable 12 4 0 2 2\r\nW154 crs_woodchair 15 4 0 6\r\nW105 crs_woodchair 10 5 0 2\r\nW156 crs_woodchair 15 6 0 6\r\nW77 crs_woodchair 7 7 0 4\r\nW138 crs_woodchair 13 8 0 4\r\nW158 crs_woodchair 15 8 0 4\r\nW59 crs_woodchair 5 9 0 2\r\nF010 crs_fridge 0 10 0 0\r\nV710 ctable2 7 10 0 2\r\nY1310 crs_woodtable_end 13 10 0 1 2\r\ny1410 crs_woodtable_start 14 10 0 2 2\r\nW511 crs_woodchair 5 11 0 2\r\nB112 crs_box 1 12 0 2\r\nB113 crs_box 1 13 0 2\r\nv713 ctable1 7 13 0 2\r\nW1313 crs_woodchair 13 13 0 0\r\nW1513 crs_woodchair 15 13 0 0\r\nB115 crs_box 1 15 0 2\r\nP117 crs_boxopen 1 17 0 2\r\ni1517 crs_stomp 15 17 0 0\r\nB118 crs_box 1 18 0 2\r\ni1518 crs_stomp 15 18 0 0\r\nb119 crs_boxtwo 1 19 0 2', '0', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('gardens', 0, 2, 15, 0, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00xxxxxxxxxxxx\r\nxxxxxxxxxxxxx0x00xxxxxxxxxxx0x000xxxxxxxxxxx\r\nxxxxxxxxxxxx0000000000000000000000xxxxxxxxxx\r\nxxxxxxxxxxx000000000000000000000000xxxxxxxxx\r\nxxxxxxxxxxx0000000000000000000000000xxxxxxxx\r\nxxxxxxxxxxx00000000000000000000000000xxxxxxx\r\nxxxxxxxx000000000000000000000000000000xxxxxx\r\nxxxxxxx00000000000000000000000000000000xxxxx\r\nxxxxxxx000000000000000000000000000000000xxxx\r\nxxxxxxx0000000000000000000000000000000000xxx\r\nxxxxxxxxx000000000000000000000000000000000xx\r\n00000000000000000000xx00000000000000000000xx\r\n0000000000000000000xxxx00000000000xxxxxxx0xx\r\n0000000000000000000xxxx00000000000x00000xxxx\r\nxxxxx00x0000000000xxxxx0xxxxxx0000x0000000xx\r\nxxxxx0000000000000xxxxx0xx000x0000x000000xxx\r\nxxxxx0000000000000xxxxx0x000000000x00000xxxx\r\nxxxxx000000x0000000xxxx0x000000000xxx00xxxxx\r\nxxxxxxxx000x0000000xxx00xxx000000x0000xxxxxx\r\nxxxxxxxx000x000000xxxx0x0000000000000xxxxxxx\r\nxxxxxxxx000x000000011100000000000000xxxxxxxx\r\nxxxxxxxx000x00000001110000000000000xxxxxxxxx\r\nxxxxxxxxx00x0000000111x00000000x00xxxxxxxxxx\r\nxxxxxxxxxx0x0000000xxx0000000xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxx000000xxxx0000000xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxx000000xxx00xxxxx00xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx0xxx0xx000x00xxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx0xxx0x000000xxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx0xxx0x00000xxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx0xxxxx00xxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxx0xxxxx0xxxxxxxxxxxxxxxxxxxx', 'L89 bench2 8 9 0 4\r\nK99 bench 9 9 0 4\r\nL711 bench2 7 11 0 2\r\nK712 bench 7 12 0 2\r\nL3516 bench2 35 16 0 2\r\nL3716 bench2 37 16 0 4\r\nK3816 bench 38 16 0 4\r\nK3517 bench 35 17 0 2\r\nL2718 bench2 27 18 0 4\r\nK2818 bench 28 18 0 4\r\nL3518 bench2 35 18 0 2\r\nL2519 bench2 25 19 0 2\r\nK3519 bench 35 19 0 2\r\nK2520 bench 25 20 0 2\r\nL2529 bench2 25 29 0 4\r\nK2629 bench 26 29 0 4\r\nL2330 bench2 23 30 0 2\r\nK2331 bench 23 31 0 2', '0', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('square_1', 0, 17, 26, 0, 0, 'xxxxxxxxx222xx222222xxx222xxxxxx\r\nxxxxxxxxx222xx2222222xx222xxxxxx\r\nxxxxxxxxx22222222222222222xxxxxx\r\nxxxxxxxxx22222222222222222xxxxxx\r\nxxxxxxxxx22222222222222222xxxxxx\r\nxxxxxxxxx22222x22222x22222xxxxxx\r\nxxxxxxxxx11111x22222x11111xxxxxx\r\n0000000xx00000x22222x00000xxxxxx\r\n0000000xx00000000000000000xxxxxx\r\n000000000000000000000000000xx00x\r\n000000000000xxx00000xxx00000000x\r\n000000000000xxx00000xxx00000000x\r\n000000000000xxx00000xxx000000000\r\n00000000000000000000000000000000\r\nx0000000000000000000000000000000\r\nxxx00000000000000000000000000000\r\nxxxxx000000000000000000000000000\r\nxxxxx000000000000000000000000000\r\nxxxxx000000000000000000000000xxx\r\nxxxxxx00000000000000000000000xxx\r\nxxxxxxx000000000000000000000xxxx\r\nxxxxxxxxxx00000000000000000xxxxx\r\nxxxxxxxxxx0000000000000000xxxxxx\r\nxxxxxxxxxx000000000000000xxxxxxx\r\nxxxxxxxxxxxxx00000000000xxxxxxxx\r\nxxxxxxxxxxxxxx000000000xxxxxxxxx\r\nxxxxxxxxxxxxxxxx000xxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxx000xxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxx000xxxxxxxxxxxxx', 'd155 gate_table1 15 5 2 2\r\nd195 gate_table1 19 5 2 6\r\ne156 gate_table2 15 6 2 2\r\ne196 gate_table2 19 6 2 6\r\nd27 gate_table1 2 7 0 4\r\ne37 gate_table2 3 7 0 4\r\nf47 gate_table3 4 7 0 4\r\nf157 gate_table3 15 7 2 2\r\nf197 gate_table3 19 7 2 6\r\nd210 gate_table1 2 10 0 0\r\ne310 gate_table2 3 10 0 0\r\nf410 gate_table3 4 10 0 0\r\nd211 gate_table1 2 11 0 4\r\ne311 gate_table2 3 11 0 4\r\nf411 gate_table3 4 11 0 4\r\nb2913 gate_drumchair 29 13 0 4\r\nb3013 gate_drumchair 30 13 0 4\r\nd214 gate_table1 2 14 0 0\r\ne314 gate_table2 3 14 0 0\r\nf414 gate_table3 4 14 0 0\r\nb1214 gate_drumchair 12 14 0 4\r\nb1714 gate_drumchair 17 14 0 4\r\nb2214 gate_drumchair 22 14 0 4\r\nh815 gate_lantern 8 15 0 0\r\nb1115 gate_drumchair 11 15 0 2\r\nc1215 gate_table 12 15 0 0\r\nb1315 gate_drumchair 13 15 0 6\r\nb1615 gate_drumchair 16 15 0 2\r\nc1715 gate_table 17 15 0 0\r\nb1815 gate_drumchair 18 15 0 6\r\nb2115 gate_drumchair 21 15 0 2\r\nc2215 gate_table 22 15 0 0\r\nb2315 gate_drumchair 23 15 0 6\r\nh2615 gate_lantern 26 15 0 0\r\nb1216 gate_drumchair 12 16 0 0\r\nb1716 gate_drumchair 17 16 0 0\r\nb2216 gate_drumchair 22 16 0 0\r\nb2917 gate_drumchair 29 17 0 0\r\nb3017 gate_drumchair 30 17 0 0\r\ni1018 gate_rockchair1 10 18 0 2\r\ni1418 gate_rockchair1 14 18 0 6\r\na2018 gate_trashcan 20 18 0 0\r\nk2118 gate_rockchair3 21 18 0 4\r\nj2218 gate_rockchair2 22 18 0 4\r\ni2318 gate_rockchair1 23 18 0 4\r\nj1019 gate_rockchair2 10 19 0 2\r\nk1419 gate_rockchair3 14 19 0 6\r\nj2019 gate_rockchair2 20 19 0 2\r\nk1020 gate_rockchair3 10 20 0 2\r\nj1420 gate_rockchair2 14 20 0 6\r\nk2020 gate_rockchair3 20 20 0 2\r\ni1021 gate_rockchair1 10 21 0 2\r\ni2021 gate_rockchair1 20 21 0 2\r\ng1022 gate_talltree 10 22 0 0\r\ng1023 gate_talltree 10 23 0 0', '0', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('square_2', 0, 17, 23, 0, 0, 'xxxxxxxxxxx111111111111xxxxxxxxxxxx\r\nxxxxxxxxxx11111111111111xxxxxxxxxxx\r\nxxxxxxxxxx11111111111111xxxxxxxxxxx\r\nxxxxxxxxxx11xxxx11xxxx11xxxxxxxxxxx\r\nxxxxxxxxxx00xxxx00xxxx00xxxxxxxxxxx\r\nxxxxxxx0000000000000000000xxxxxxxxx\r\nxxxxxx000000000000000000000xxxxxxxx\r\nxxxxx0000000000000000000x000xxxxxxx\r\nxxxx00000000000000000000xx000xxxxxx\r\nxxxx00000000000000000000xxx000xxxxx\r\nxxxx00000000000000000000xxxx00xxxxx\r\n000000000000000000000000000000xxxxx\r\n0000000000000000000000000000000xxxx\r\n000000000000000000000000000000xxxxx\r\n000000000000000000000000000000xxxxx\r\n000000000000000000000000000000xxxxx\r\nxx00000000000000000000000000000000x\r\nxxx000xxxx00000000000000xxxx0000000\r\nxxx0000xxx00000000000000xxx00000000\r\nxxxx0000xx00000000000000xx000000000\r\nxxxxx0000x00000000000000x00000000xx\r\nxxxxxx00000000000000000000000xxxxxx\r\nxxxxxxx00000x000000000000000x0xxxxx\r\nxxxxxxxx0000xxx0000xxx000000xxxxxxx\r\nxxxxxxxxx000xxx0000xxx000000xxxxxxx\r\nxxxxxxxxxxxxxxx0000xxx000000xxxxxxx\r\nxxxxxxxxxxxxxxxx000xxx000000xxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxx00000xxxxxxxx', 'd120 gate_table1 12 0 1 4\r\ne130 gate_table2 13 0 1 4\r\nf140 gate_table3 14 0 1 4\r\nd160 gate_table1 16 0 1 4\r\nf170 gate_table3 17 0 1 4\r\nd190 gate_table1 19 0 1 4\r\ne200 gate_table2 20 0 1 4\r\nf210 gate_table3 21 0 1 4\r\ng97 gate_talltree 9 7 0 0\r\nb148 gate_drumchair 14 8 0 4\r\nb198 gate_drumchair 19 8 0 4\r\ng99 gate_talltree 9 9 0 0\r\nb139 gate_drumchair 13 9 0 2\r\nc149 gate_table 14 9 0 0\r\nb159 gate_drumchair 15 9 0 6\r\nb189 gate_drumchair 18 9 0 2\r\nc199 gate_table 19 9 0 0\r\nb209 gate_drumchair 20 9 0 6\r\ng610 gate_talltree 6 10 0 0\r\ng810 gate_talltree 8 10 0 0\r\nb1410 gate_drumchair 14 10 0 0\r\nb1910 gate_drumchair 19 10 0 0\r\nk611 gate_rockchair3 6 11 0 2\r\nj811 gate_rockchair2 8 11 0 6\r\nb112 gate_drumchair 1 12 0 4\r\nb212 gate_drumchair 2 12 0 4\r\ni612 gate_rockchair1 6 12 0 2\r\ng2712 gate_talltree 27 12 0 0\r\ng3012 gate_talltree 30 12 0 0\r\nb114 gate_drumchair 1 14 0 0\r\nb214 gate_drumchair 2 14 0 0\r\ni615 gate_rockchair1 6 15 0 2\r\na2715 gate_trashcan 27 15 0 0\r\nj616 gate_rockchair2 6 16 0 2\r\nk816 gate_rockchair3 8 16 0 6\r\nd3116 gate_table1 31 16 0 4\r\nf3216 gate_table3 32 16 0 4\r\nb1417 gate_drumchair 14 17 0 4\r\nb1917 gate_drumchair 19 17 0 4\r\nb1318 gate_drumchair 13 18 0 2\r\nc1418 gate_table 14 18 0 0\r\nb1518 gate_drumchair 15 18 0 6\r\nb1818 gate_drumchair 18 18 0 2\r\nc1918 gate_table 19 18 0 0\r\nb2018 gate_drumchair 20 18 0 6\r\nb1419 gate_drumchair 14 19 0 0\r\nb1919 gate_drumchair 19 19 0 0\r\nd3119 gate_table1 31 19 0 0\r\nf3219 gate_table3 32 19 0 0\r\nh2922 gate_lantern 29 22 0 0\r\na823 gate_trashcan 8 23 0 0\r\nd2324 gate_table1 23 24 0 2\r\nd2624 gate_table1 26 24 0 6\r\nf2325 gate_table3 23 25 0 2\r\nf2625 gate_table3 26 25 0 6', '', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('rumble', 0, 1, 5, 7, 0, 'xxxxxxxx77xxxxxxxxxxxxxxxx\r\nxxxxxxxx77xxxxxxxxxxxxxxxx\r\nxxxxxx77777x77xxxxxxxxxxxx\r\nxxx77777777777xxx44xxxxxxx\r\n77777777777777xx444444444x\r\n777777777777777xx44444444x\r\nxxx777777777777xx44444444x\r\nxxxx7777777777xxx44444444x\r\n7777777777777777744448444x\r\n7777777777777x4x744448444x\r\n777777777777x444444448444x\r\n7777777777774444444448444x\r\n7777777777774444444448444x\r\n777777777777x444444448444x\r\n7777777777777x44444448444x\r\nxxx777777777777x444448444x\r\nxxx7777777777777444448444x\r\nxxx7777777777777444448444x\r\nxxx777777777777x444448444x\r\nxxx77777777777x4444444444x\r\nxxxx777777777444444444444x\r\nxxxxxxxxxxxxxxxxxxxxxxxxxx', 'A43 mntdwchair 4 3 7 4\r\nA53 mntdwchair 5 3 7 4\r\nM28 barmask 2 8 7 0\r\ns78 mntdwsofa2 7 8 7 2\r\nt88 mntdwtable2 8 8 7 0\r\ns98 mntdwsofa2 9 8 7 6\r\ny218 paalu5 21 8 8 0\r\nM29 barmask 2 9 7 0\r\nS79 mntdwsofa1 7 9 7 2\r\nT89 mntdwtable1 8 9 7 0\r\nS99 mntdwsofa1 9 9 7 6\r\ny219 paalu5 21 9 8 0\r\nM210 barmask 2 10 7 0\r\ny2110 paalu5 21 10 8 0\r\nM211 barmask 2 11 7 0\r\ny2111 paalu5 21 11 8 0\r\nM212 barmask 2 12 7 0\r\ns712 mntdwsofa2 7 12 7 4\r\nS812 mntdwsofa1 8 12 7 4\r\ne2112 paalu3 21 12 8 0\r\nM213 barmask 2 13 7 0\r\nt713 mntdwtable2 7 13 7 2\r\nT813 mntdwtable1 8 13 7 2\r\ne2113 paalu3 21 13 8 0\r\nM214 barmask 2 14 7 0\r\ns714 mntdwsofa2 7 14 7 0\r\nS814 mntdwsofa1 8 14 7 0\r\ne2114 paalu3 21 14 8 0\r\nM215 barmask 2 15 100000 0\r\nq2115 paalu1 21 15 8 0\r\nM216 barmask 2 16 100000 0\r\ns1216 mntdwsofa2 12 16 7 4\r\nS1316 mntdwsofa1 13 16 7 4\r\nq2116 paalu1 21 16 8 0\r\nA317 mntdwchair 3 17 7 2\r\ns617 mntdwsofa2 6 17 7 2\r\nt717 mntdwtable2 7 17 7 0\r\ns817 mntdwsofa2 8 17 7 6\r\nt1217 mntdwtable2 12 17 7 2\r\nT1317 mntdwtable1 13 17 7 2\r\nq2117 paalu1 21 17 8 0\r\nA318 mntdwchair 3 18 7 2\r\nS618 mntdwsofa1 6 18 7 2\r\nT718 mntdwtable1 7 18 7 0\r\nS818 mntdwsofa1 8 18 7 6\r\ns1218 mntdwsofa2 12 18 7 0\r\nS1318 mntdwsofa1 13 18 7 0\r\nq2118 paalu1 21 18 8 0', '0', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('terace', 0, 9, 17, 0, 0, 'xxxxxx21000000000xxxxxxxx\r\nxxxxxx3xxx000xx000xxxxxxx\r\nxxxxxx4xxx000xxx000xxxxxx\r\nxxxxxx44xx000x00x000xxxxx\r\nxxxxxx44xx0000xx00000xxxx\r\nxxxxxx44xx000000000000xxx\r\nxxxxxx44xx0000000000000xx\r\nxxxxxxx4xxxxxxx00000000xx\r\nxxxxxxx4xxxxxxx0000000xxx\r\nxxxxxx444432222xxx00xxxxx\r\nxxxxxx444432222x0000000xx\r\nxxxxxx444432222x0000000xx\r\nxxxxxx44400x222x0000000xx\r\nxxxxxx444000x11x0000000xx\r\nxxxxxx444000000x0000000xx\r\nxxxxxx444000000x0000000xx\r\nxxxxxx440000000000000000x\r\nxxxxxx4400000000000000000\r\nx8876x444000000x000000000\r\nx8xx6x444000000x000000000\r\nx9xx6x444000000x000000000\r\n999x65444000000x000000000\r\n999xxx444xxxxxxxxxx000000\r\n999xxx444xxxxxxxxxxx00000\r\n999xxx333xxxxxxxxxxxx0000\r\n999xxx222222222222222x000\r\nxxxxxx222222222222222xx00\r\nxxxxxx222222222222222xxx0\r\nxxxxxx222222222222222xxxx\r\nxxxxxxx22222222222222xxxx\r\nxxxxxxxx2222222222222xxxx', 'a1611 sun_chair 16 11 0 2\r\na2011 sun_chair 20 11 0 2\r\na1612 sun_chair 16 12 0 2\r\na2012 sun_chair 20 12 0 2\r\nb1013 blusun_chair 10 13 0 4\r\na1613 sun_chair 16 13 0 2\r\na2013 sun_chair 20 13 0 2\r\nc1014 sun_table 10 14 0 0\r\na2014 sun_chair 20 14 0 2\r\nb1015 blusun_chair 10 15 0 0\r\na118 sun_chair 1 18 8 2\r\na418 sun_chair 4 18 6 2\r\nb1118 blusun_chair 11 18 0 4\r\nb1019 blusun_chair 10 19 0 2\r\nc1119 sun_table 11 19 0 0\r\nb1219 blusun_chair 12 19 0 6\r\na1819 sun_chair 18 19 0 2\r\na2219 sun_chair 22 19 0 2\r\nb1120 blusun_chair 11 20 0 0\r\na1820 sun_chair 18 20 0 2\r\na2220 sun_chair 22 20 0 2\r\na421 sun_chair 4 21 6 2\r\na621 sun_chair 6 21 4 2\r\na1821 sun_chair 18 21 0 2\r\na2221 sun_chair 22 21 0 2\r\nb222 blusun_chair 2 22 9 4\r\na2222 sun_chair 22 22 0 2\r\nb123 blusun_chair 1 23 9 2\r\nd223 sun_table2 2 23 9 0\r\nb224 blusun_chair 2 24 9 0\r\na1125 sun_chair 11 25 2 4\r\na1225 sun_chair 12 25 2 4\r\na1325 sun_chair 13 25 2 4\r\nc1425 sun_table 14 25 2 0\r\na1525 sun_chair 15 25 2 4\r\na1625 sun_chair 16 25 2 4\r\na1725 sun_chair 17 25 2 4\r\na1329 sun_chair 13 29 2 2\r\na1529 sun_chair 15 29 2 2\r\na1729 sun_chair 17 29 2 2\r\na1330 sun_chair 13 30 2 2\r\na1530 sun_chair 15 30 2 2\r\na1730 sun_chair 17 30 2 2', '0', '0', 1, NULL, NULL);
INSERT INTO `room_modeldata` VALUES ('s', 0, 0, 3, 0, 2, 'xxxxxxxxx\r\n000000xx\r\n000000xx\r\n0000A0xx\r\n000000xx\r\n000000xx\r\n000A00xx\r\n000000xx\r\nxxxxxxxx', '', '1', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for room_modeldata_triggers
-- ----------------------------
DROP TABLE IF EXISTS `room_modeldata_triggers`;
CREATE TABLE `room_modeldata_triggers` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `model` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `object` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `x` int(5) NOT NULL DEFAULT '0',
  `y` int(5) NOT NULL DEFAULT '0',
  `stepx` int(5) NOT NULL,
  `stepy` int(5) NOT NULL,
  `goalx` int(5) NOT NULL,
  `goaly` int(5) NOT NULL,
  `roomid` int(10) NOT NULL DEFAULT '0',
  `state` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for room_rights
-- ----------------------------
DROP TABLE IF EXISTS `room_rights`;
CREATE TABLE `room_rights` (
  `roomid` int(11) NOT NULL,
  `userid` int(10) NOT NULL,
  KEY `index` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for room_votes
-- ----------------------------
DROP TABLE IF EXISTS `room_votes`;
CREATE TABLE `room_votes` (
  `roomid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `vote` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of room_votes
-- ----------------------------
BEGIN;
INSERT INTO `room_votes` VALUES (1, 1, 1);
INSERT INTO `room_votes` VALUES (123, 1, 1);
INSERT INTO `room_votes` VALUES (1, 1, 1);
INSERT INTO `room_votes` VALUES (123, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for roombots
-- ----------------------------
DROP TABLE IF EXISTS `roombots`;
CREATE TABLE `roombots` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `roomid` int(10) NOT NULL,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `mission` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `figure` text COLLATE latin1_general_ci NOT NULL,
  `x` int(5) NOT NULL,
  `y` int(5) NOT NULL,
  `z` int(1) NOT NULL,
  `freeroam` enum('1','0') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `message_noshouting` varchar(200) COLLATE latin1_general_ci NOT NULL DEFAULT 'Shouting is not neccessary.',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for roombots_coords
-- ----------------------------
DROP TABLE IF EXISTS `roombots_coords`;
CREATE TABLE `roombots_coords` (
  `id` int(10) NOT NULL,
  `x` int(5) NOT NULL,
  `y` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for roombots_texts
-- ----------------------------
DROP TABLE IF EXISTS `roombots_texts`;
CREATE TABLE `roombots_texts` (
  `id` int(10) NOT NULL,
  `type` enum('shout','say') COLLATE latin1_general_ci NOT NULL,
  `text` varchar(255) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for roombots_texts_triggers
-- ----------------------------
DROP TABLE IF EXISTS `roombots_texts_triggers`;
CREATE TABLE `roombots_texts_triggers` (
  `id` int(10) NOT NULL,
  `words` text COLLATE latin1_general_ci NOT NULL,
  `replies` text COLLATE latin1_general_ci NOT NULL,
  `serve_replies` text COLLATE latin1_general_ci NOT NULL,
  `serve_item` varchar(20) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(125) COLLATE latin1_general_ci DEFAULT NULL,
  `owner` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `category` int(3) NOT NULL DEFAULT '0',
  `model` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `ccts` text COLLATE latin1_general_ci,
  `floor` int(3) NOT NULL DEFAULT '0',
  `wallpaper` int(3) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0 = open, 1 = closed, 2 = password, 3 = hc only, 4 = staff',
  `password` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `showname` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '1',
  `superusers` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `visitors_now` int(3) NOT NULL DEFAULT '0',
  `visitors_max` int(3) NOT NULL DEFAULT '25',
  `landscape` decimal(2,1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of rooms
-- ----------------------------
BEGIN;
INSERT INTO `rooms` VALUES (1, 'Miguel\'s room', 'Miguel has entered the building', 'Miguel', 6, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (101, 'Welcome Lounge', 'welcome_lounge', NULL, 3, 'newbie_lobby', 'hh_room_nlobby', 0, 0, 0, '', '1', '0', 0, 35, 0.0);
INSERT INTO `rooms` VALUES (103, 'Holoween theatre', 'theatredrome_halloween', NULL, 7, 'theater', 'hh_room_theater_halloween', 0, 0, 0, NULL, '1', '0', 0, 40, 0.0);
INSERT INTO `rooms` VALUES (102, 'Pool - A', 'habbo_lido', NULL, 5, 'pool_a', 'hh_room_pool,hh_people_pool', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (104, 'The Library', 'library', NULL, 7, 'library', 'hh_room_library_twr_trr', 0, 0, 0, NULL, '1', '0', 0, 20, 0.0);
INSERT INTO `rooms` VALUES (105, 'The Sunset Cafe', 'sunset_cafe', NULL, 9, 'sunset_cafe', 'hh_room_sunsetcafe', 0, 0, 0, NULL, '1', '0', 0, 20, 0.0);
INSERT INTO `rooms` VALUES (107, 'Pool - B', 'habbo_lido_ii', NULL, 5, 'pool_b', 'hh_room_pool,hh_people_pool', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (106, 'The Pub', 'the_dirty_duck_pub', NULL, 9, 'pub_a', 'hh_room_pub', 0, 0, 0, NULL, '1', '0', 0, 35, 0.0);
INSERT INTO `rooms` VALUES (108, 'Floatinggarden', 'floatinggarden', NULL, 5, 'floatinggarden', 'hh_room_floatinggarden', 0, 0, 0, NULL, '1', '0', 0, 30, 0.0);
INSERT INTO `rooms` VALUES (109, 'Rooftop Rumble', 'rooftop_rumble', NULL, 5, 'md_a', 'hh_room_terrace,hh_paalu,hh_people_pool,hh_people_paalu', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (110, 'Picnic Fields', 'picnic', NULL, 5, 'picnic', 'hh_room_picnic', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (111, 'The Park', 'park', NULL, 8, 'park_a', 'hh_room_park_general,hh_room_park', 0, 0, 0, NULL, '1', '0', 0, 30, 0.0);
INSERT INTO `rooms` VALUES (112, 'The Infobus', 'park', NULL, 8, 'park_b', 'hh_room_park_general,hh_room_park', 0, 0, 0, NULL, '1', '0', 0, 15, 0.0);
INSERT INTO `rooms` VALUES (113, 'BattleBall noobs', 'bb_lobby_beginner_0', NULL, 12, 'bb_lobby_1', 'hh_game_bb,hh_game_bb_room,hh_game_bb_ui,hh_gamesys', 0, 0, 0, '', '1', '0', 0, 20, 0.0);
INSERT INTO `rooms` VALUES (114, 'BattleBall amateurs', 'bb_lobby_amateur_0', NULL, 13, 'bb_lobby_1', 'hh_game_bb,hh_game_bb_room,hh_game_bb_ui,hh_gamesys', 0, 0, 0, '', '1', '0', 0, 20, 0.0);
INSERT INTO `rooms` VALUES (115, 'BattleBall Intermediate', 'bb_lobby_intermediate_0', NULL, 14, 'bb_lobby_1', 'hh_game_bb,hh_game_bb_room,hh_game_bb_ui,hh_gamesys', 0, 0, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (116, 'BattleBall Expert', 'bb_lobby_expert_0', NULL, 15, 'bb_lobby_1', 'hh_game_bb,hh_game_bb_room,hh_game_bb_ui,hh_gamesys', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (117, 'BattleBall Leet', 'bb_lobby_expert_0', NULL, 16, 'bb_lobby_1', 'hh_game_bb,hh_game_bb_room,hh_game_bb_ui,hh_gamesys', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (118, 'Snowstorm noobs', 'sw_lobby_beginner_0', NULL, 17, 'snowwar_lobby_1', 'hh_gamesys,hh_game_snowwar,hh_game_snowwar_room,hh_game_snowwar_ui', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (119, 'Snowstorm amateurs', 'sw_lobby_amateur_0', NULL, 18, 'snowwar_lobby_1', 'hh_gamesys,hh_game_snowwar,hh_game_snowwar_room,hh_game_snowwar_ui', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (120, 'Snowstorm Intermediate', 'sw_lobby_intermediate_0', NULL, 19, 'snowwar_lobby_1', 'hh_gamesys,hh_game_snowwar,hh_game_snowwar_room,hh_game_snowwar_ui', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (121, 'Snowstorm Expert', 'sw_lobby_intermediate_0', NULL, 20, 'snowwar_lobby_1', 'hh_gamesys,hh_game_snowwar,hh_game_snowwar_room,hh_game_snowwar_ui', 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (122, 'Snowstorm Leet', 'sw_lobby_intermediate_0', NULL, 21, 'snowwar_lobby_1', NULL, 0, 0, 0, NULL, '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (123, 'Otra sala', '', 'Miguel', 10, 'a', NULL, 201, 106, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (124, 'Meth0d\'s room', 'Meth0d has entered the building', 'Meth0d', 0, 's', NULL, 110, 1801, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (125, 'leo\'s room', 'leo has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (126, 'pedxz\'s room', 'pedxz has entered the building', 'pedxz', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (127, 'testje1\'s room', 'testje1 has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (128, 'mehdi\'s room', 'mehdi has entered the building', 'mehdi', 0, 's', NULL, 107, 804, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (129, 'Ricky\'s room', 'Ricky has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (130, '\'s room', ' has entered the building', '', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (131, 'Holos\'s room', 'Holos has entered the building', 'Holos', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (132, 'jaman\'s room', 'jaman has entered the building', 'jaman', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (133, 'Maxime\'s room', 'Maxime has entered the building', 'Maxime', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (134, 'Dion\'s room', 'Dion has entered the building', 'Dion', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (135, 'Hahn\'s room', 'Hahn has entered the building', 'Hahn', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (136, 'mehid\'s room', 'mehid has entered the building', 'mehid', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (137, 'Koch\'s room', 'Koch has entered the building', 'Koch', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (138, 'Piet\'s room', 'Piet has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (139, 'emoskate27\'s room', 'emoskate27 has entered the building', 'emoskate27', 0, 's', NULL, 107, 804, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (140, 'habbo\'s room', 'habbo has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (141, 'vccvc\'s room', 'vccvc has entered the building', 'vccvc', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (142, 'Ciao\'s room', 'Ciao has entered the building', 'Ciao', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (143, 'Masako\'s room', 'Masako has entered the building', 'Masako', 0, 's', NULL, 104, 503, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (144, 'poko\'s room', 'poko has entered the building', 'poko', 0, 's', NULL, 301, 1901, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (145, 'T0E\'s room', 'T0E has entered the building', 'T0E', 0, 's', NULL, 301, 1901, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (146, 'mercuryfr\'s room', 'mercuryfr has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (147, 'test\'s room', 'test has entered the building', 'test', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (148, 'TheOman\'s room', 'TheOman has entered the building', 'TheOman', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (149, 'Holo\'s room', 'Holo has entered the building', 'Holo', 0, 's', NULL, 110, 1801, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (150, 'vini\'s room', 'vini has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (151, 'vina\'s room', 'vina has entered the building', 'vina', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (152, 'Richard\'s room', 'Richard has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (153, 'David\'s room', 'David has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (154, 'dsaf43545\'s room', 'dsaf43545 has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (155, 'PloX\'s room', 'PloX has entered the building', 'PloX', 0, 's', NULL, 110, 1801, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (156, 'rickandress\'s room', 'rickandress has entered the building', 'rickandress', 0, 's', NULL, 301, 1901, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (157, 'ttest\'s room', 'ttest has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (158, '111A\'s room', '111A has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (159, 'aq\'s room', 'aq has entered the building', 'aq', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (160, 'hhhh\'s room', 'hhhh has entered the building', 'hhhh', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (161, 'Glowwer\'s room', 'Glowwer has entered the building', 'Glowwer', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (162, 'qweasdzxc4564545\'s room', 'qweasdzxc4564545 has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (163, 'Jean\'s room', 'Jean has entered the building', 'Jean', 0, 's', NULL, 301, 1901, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (164, 'holoryzonender\'s room', 'holoryzonender has entered the building', 'holoryzonender', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (165, 'phprewrite\'s room', 'phprewrite has entered the building', 'phprewrite', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (166, 'frank\'s room', 'frank has entered the building', 'frank', 0, 's', NULL, 301, 1901, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (167, 'cacata\'s room', 'cacata has entered the building', 'cacata', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (168, 'nepe33\'s room', 'nepe33 has entered the building', 'nepe33', 0, 's', NULL, 110, 1801, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (169, 'Leooo\'s room', 'Leooo has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (170, 'Claushgg\'s room', 'Claushgg has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (171, 'jack\'s room', 'jack has entered the building', '{rawname}', 0, 's', NULL, 0, 607, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (172, 'Penezolano\'s room', 'Penezolano has entered the building', 'Penezolano', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (173, 'Vernichtungsgedanke\'s room', 'Vernichtungsgedanke has entered the building', 'Vernichtungsged', 0, 's', NULL, 301, 1901, 0, '', '1', '0', 0, 25, 0.0);
INSERT INTO `rooms` VALUES (174, 'gsegseg@eg.fr\'s room', 'gsegseg@eg.fr has entered the building', 'gsegseg@eg.fr', 0, 's', NULL, 601, 1501, 0, '', '1', '0', 0, 25, 0.0);
COMMIT;

-- ----------------------------
-- Table structure for soundmachine_playlists
-- ----------------------------
DROP TABLE IF EXISTS `soundmachine_playlists`;
CREATE TABLE `soundmachine_playlists` (
  `machineid` int(10) NOT NULL,
  `songid` int(10) NOT NULL,
  `pos` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for soundmachine_songs
-- ----------------------------
DROP TABLE IF EXISTS `soundmachine_songs`;
CREATE TABLE `soundmachine_songs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `title` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `machineid` int(10) NOT NULL,
  `length` int(3) NOT NULL,
  `data` text COLLATE latin1_general_ci NOT NULL,
  `burnt` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `onlinecount` int(3) NOT NULL DEFAULT '0',
  `onlinecount_peak` int(10) NOT NULL,
  `connections_accepted` int(10) NOT NULL,
  `activerooms` int(10) NOT NULL,
  `activerooms_peak` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of system
-- ----------------------------
BEGIN;
INSERT INTO `system` VALUES (0, 0, 0, 0, 0);
INSERT INTO `system` VALUES (0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for system_chatlog
-- ----------------------------
DROP TABLE IF EXISTS `system_chatlog`;
CREATE TABLE `system_chatlog` (
  `username` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `roomid` int(10) NOT NULL,
  `mtime` time NOT NULL DEFAULT '00:00:00',
  `message` varchar(200) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `skey` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `sval` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of system_config
-- ----------------------------
BEGIN;
INSERT INTO `system_config` VALUES (1, 'server_game_port', '21');
INSERT INTO `system_config` VALUES (2, 'server_game_maxconnections', '4000');
INSERT INTO `system_config` VALUES (4, 'server_mus_port', '20');
INSERT INTO `system_config` VALUES (5, 'server_mus_maxconnections', '50000');
INSERT INTO `system_config` VALUES (6, 'server_mus_host', '127.0.0.1');
INSERT INTO `system_config` VALUES (3, 'server_game_backlog', '25000');
INSERT INTO `system_config` VALUES (7, 'server_mus_backlog', '5000');
INSERT INTO `system_config` VALUES (8, 'lang', 'en');
INSERT INTO `system_config` VALUES (9, 'welcomemessage_enable', '0');
INSERT INTO `system_config` VALUES (10, 'wordfilter_enable', '0');
INSERT INTO `system_config` VALUES (11, 'wordfilter_censor', '');
INSERT INTO `system_config` VALUES (12, 'chatanims_enable', '1');
INSERT INTO `system_config` VALUES (13, 'trading_enable', '1');
INSERT INTO `system_config` VALUES (14, 'recycler_enable', '1');
INSERT INTO `system_config` VALUES (15, 'recycler_minownertime', '43200');
INSERT INTO `system_config` VALUES (16, 'recycler_session_length', '60');
INSERT INTO `system_config` VALUES (17, 'recycler_session_expirelength', '10080');
INSERT INTO `system_config` VALUES (18, 'rooms_loadadvertisement_img', 'http://ads.habbohotel.co.uk/max/adview.php?zoneid=325&n=hhuk');
INSERT INTO `system_config` VALUES (19, 'rooms_loadadvertisement_uri', 'http://www.holographemulator.com/');
INSERT INTO `system_config` VALUES (20, 'statuses_wave_duration', '1500');
INSERT INTO `system_config` VALUES (21, 'statuses_carryitem_sipamount', '10');
INSERT INTO `system_config` VALUES (22, 'statuses_carryitem_sipinterval', '9000');
INSERT INTO `system_config` VALUES (23, 'statuses_carryitem_sipduration', '1000');
INSERT INTO `system_config` VALUES (24, 'rooms_roomban_duration', '15');
INSERT INTO `system_config` VALUES (25, 'items_stacking_maxstackheight', '20');
INSERT INTO `system_config` VALUES (28, 'navigator_roomsearch_maxresults', '30');
INSERT INTO `system_config` VALUES (27, 'navigator_createroom_maxrooms', '50');
INSERT INTO `system_config` VALUES (26, 'events_categorycount', '11');
INSERT INTO `system_config` VALUES (29, 'navigator_opencategory_maxresults', '30');
INSERT INTO `system_config` VALUES (30, 'navigator_favourites_maxrooms', '30');
INSERT INTO `system_config` VALUES (31, 'events_deadevents_removeinterval', '120');
INSERT INTO `system_config` VALUES (32, 'soundmachine_burntodisk_disktid', '1355');
INSERT INTO `system_config` VALUES (35, 'game_bb_gamelength_seconds', '180');
INSERT INTO `system_config` VALUES (34, 'game_scorewindow_restartgame_seconds', '1200');
INSERT INTO `system_config` VALUES (33, 'game_countdown_seconds', '15');
INSERT INTO `system_config` VALUES (36, 'spectator_bar_enabled', '0');
COMMIT;

-- ----------------------------
-- Table structure for system_fuserights
-- ----------------------------
DROP TABLE IF EXISTS `system_fuserights`;
CREATE TABLE `system_fuserights` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `minrank` int(1) NOT NULL,
  `fuseright` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`,`fuseright`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of system_fuserights
-- ----------------------------
BEGIN;
INSERT INTO `system_fuserights` VALUES (1, 1, 'default');
INSERT INTO `system_fuserights` VALUES (2, 1, 'fuse_login');
INSERT INTO `system_fuserights` VALUES (3, 1, 'fuse_buy_credits');
INSERT INTO `system_fuserights` VALUES (4, 1, 'fuse_trade');
INSERT INTO `system_fuserights` VALUES (5, 1, 'fuse_room_queue_default');
INSERT INTO `system_fuserights` VALUES (6, 2, 'fuse_extended_buddylist');
INSERT INTO `system_fuserights` VALUES (7, 2, 'fuse_habbo_chooser');
INSERT INTO `system_fuserights` VALUES (8, 2, 'fuse_furni_chooser');
INSERT INTO `system_fuserights` VALUES (9, 2, 'fuse_room_queue_club');
INSERT INTO `system_fuserights` VALUES (10, 2, 'fuse_priority_access');
INSERT INTO `system_fuserights` VALUES (11, 2, 'fuse_use_special_room_layouts');
INSERT INTO `system_fuserights` VALUES (12, 2, 'fuse_use_club_dance');
INSERT INTO `system_fuserights` VALUES (13, 3, 'fuse_enter_full_rooms');
INSERT INTO `system_fuserights` VALUES (14, 4, 'fuse_enter_locked_rooms');
INSERT INTO `system_fuserights` VALUES (16, 4, 'fuse_kick');
INSERT INTO `system_fuserights` VALUES (17, 4, 'fuse_mute');
INSERT INTO `system_fuserights` VALUES (18, 5, 'fuse_ban');
INSERT INTO `system_fuserights` VALUES (19, 5, 'fuse_room_mute');
INSERT INTO `system_fuserights` VALUES (20, 5, 'fuse_room_kick');
INSERT INTO `system_fuserights` VALUES (21, 5, 'fuse_receive_calls_for_help');
INSERT INTO `system_fuserights` VALUES (22, 5, 'fuse_remove_stickies');
INSERT INTO `system_fuserights` VALUES (23, 6, 'fuse_mod');
INSERT INTO `system_fuserights` VALUES (24, 6, 'fuse_superban');
INSERT INTO `system_fuserights` VALUES (25, 6, 'fuse_pick_up_any_furni');
INSERT INTO `system_fuserights` VALUES (26, 6, 'fuse_ignore_room_owner');
INSERT INTO `system_fuserights` VALUES (27, 6, 'fuse_any_room_controller');
INSERT INTO `system_fuserights` VALUES (28, 3, 'fuse_room_alert');
INSERT INTO `system_fuserights` VALUES (29, 6, 'fuse_moderator_access');
INSERT INTO `system_fuserights` VALUES (30, 7, 'fuse_administrator_access');
INSERT INTO `system_fuserights` VALUES (31, 7, 'fuse_see_flat_ids');
INSERT INTO `system_fuserights` VALUES (35, 5, 'fuse_chat_log');
INSERT INTO `system_fuserights` VALUES (33, 6, 'fuse_performance_panel');
INSERT INTO `system_fuserights` VALUES (34, 4, 'fuse_alert');
INSERT INTO `system_fuserights` VALUES (36, 5, 'fuse_see_all_roomowners');
INSERT INTO `system_fuserights` VALUES (37, 6, 'fuse_hotelalert');
INSERT INTO `system_fuserights` VALUES (38, 6, 'fuse_teleport');
INSERT INTO `system_fuserights` VALUES (39, 7, 'fuse_guide');
INSERT INTO `system_fuserights` VALUES (40, 7, 'fuse_freeze');
INSERT INTO `system_fuserights` VALUES (41, 6, 'fuse_chat_log');
COMMIT;

-- ----------------------------
-- Table structure for system_recycler
-- ----------------------------
DROP TABLE IF EXISTS `system_recycler`;
CREATE TABLE `system_recycler` (
  `rclr_cost` int(5) NOT NULL,
  `rclr_reward` int(10) NOT NULL,
  PRIMARY KEY (`rclr_cost`,`rclr_reward`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for system_stafflog
-- ----------------------------
DROP TABLE IF EXISTS `system_stafflog`;
CREATE TABLE `system_stafflog` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `action` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `message` text COLLATE latin1_general_ci,
  `note` text COLLATE latin1_general_ci,
  `userid` int(11) NOT NULL,
  `targetid` int(11) DEFAULT NULL,
  `timestamp` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of system_stafflog
-- ----------------------------
BEGIN;
INSERT INTO `system_stafflog` VALUES (1, 'Housekeeping', 'Staff Log pruned (emptied)', 'logs.php', 1, 0, '11-09-2016 20:43:35');
INSERT INTO `system_stafflog` VALUES (2, 'Housekeeping', 'Updated Server Settings (Welcome Message Options)', 'welcomemsg.php', 1, 0, '11-09-2016 21:56:36');
INSERT INTO `system_stafflog` VALUES (3, 'Housekeeping', 'Updated CMS Settings (Turn your site on/off)', 'maintenance.php', 1, 0, '11-09-2016 22:23:48');
INSERT INTO `system_stafflog` VALUES (4, 'Housekeeping', 'Updated CMS Settings (Turn your site on/off)', 'maintenance.php', 1, 0, '12-09-2016 02:09:49');
INSERT INTO `system_stafflog` VALUES (5, 'Housekeeping', 'Gave credits to every user,  total users: 1 (Amount 1)', 'massa.php', 1, 0, '12-09-2016 05:21:02');
INSERT INTO `system_stafflog` VALUES (6, 'Housekeeping', 'Gave badge to every user (for 2016-09-14 days),  total users: 1 (Badge id: HC2).', 'massa.php', 1, NULL, '11-09-2016 06:32:15');
INSERT INTO `system_stafflog` VALUES (7, 'Housekeeping', 'Gave badge to every user (for 2016-09-14 days),  total users: 1 (Badge id: HC2).', 'massa.php', 1, NULL, '11-09-2016 06:40:08');
INSERT INTO `system_stafflog` VALUES (8, 'Housekeeping', 'Gave badge to every user (for 2016-09-14 days),  total users: 1 (Badge id: HC2).', 'massa.php', 1, NULL, '11-09-2016 06:40:36');
INSERT INTO `system_stafflog` VALUES (9, 'Housekeeping', 'Gave badge to every user (for 2016-09-14 days),  total users: 1 (Badge id: HC2).', 'massa.php', 1, NULL, '11-09-2016 06:40:55');
INSERT INTO `system_stafflog` VALUES (10, 'Housekeeping', 'Miguel authenticated from 127.0.0.1', 'login.php', 1, 0, '11-09-2016 22:12:34');
INSERT INTO `system_stafflog` VALUES (11, 'Housekeeping', 'Miguel authenticated from 127.0.0.1', 'login.php', 1, 0, '12-09-2016 07:54:43');
INSERT INTO `system_stafflog` VALUES (12, 'Housekeeping', 'Edited user', 'edituser.php', 1, 1, '13-09-2016 02:22:48');
INSERT INTO `system_stafflog` VALUES (13, 'Housekeeping', 'Edited user', 'edituser.php', 1, 1, '13-09-2016 02:22:53');
INSERT INTO `system_stafflog` VALUES (14, 'Housekeeping', 'Edited user', 'edituser.php', 1, 1, '13-09-2016 02:23:53');
INSERT INTO `system_stafflog` VALUES (15, 'Housekeeping', '(Mass) Unban performed [Query: 1]', 'unbantool.php', 1, 0, '13-09-2016 03:23:48');
INSERT INTO `system_stafflog` VALUES (16, 'Housekeeping', 'Miguel authenticated from ::1', 'login.php', 1, 0, '20-09-2016 04:22:05');
INSERT INTO `system_stafflog` VALUES (17, 'Housekeeping', 'Picked up help query (ID: 114)', 'helper.php', 1, 0, '20-09-2016 04:24:26');
INSERT INTO `system_stafflog` VALUES (18, 'Housekeeping', 'Sent alert to user', 'alert.php', 1, 1, '20-09-2016 04:25:43');
INSERT INTO `system_stafflog` VALUES (19, 'Housekeeping', 'Picked up help query (ID: 115)', 'helper.php', 1, 0, '20-09-2016 07:20:18');
INSERT INTO `system_stafflog` VALUES (20, 'Housekeeping', 'Deleted help query (ID: 114)', 'helper.php', 1, 0, '20-09-2016 07:20:44');
INSERT INTO `system_stafflog` VALUES (21, 'Housekeeping', 'Deleted help query (ID: 115)', 'helper.php', 1, 0, '20-09-2016 07:20:46');
INSERT INTO `system_stafflog` VALUES (22, 'Housekeeping', 'Miguel authenticated from 127.0.0.1', 'login.php', 1, 0, '24-09-2016 08:35:58');
INSERT INTO `system_stafflog` VALUES (23, 'Housekeeping', 'Miguel authenticated from 127.0.0.1', 'login.php', 1, 0, '28-09-2016 10:49:32');
INSERT INTO `system_stafflog` VALUES (24, 'Housekeeping', 'Miguel authenticated from 127.0.0.1', 'login.php', 1, 0, '28-09-2016 11:02:13');
INSERT INTO `system_stafflog` VALUES (25, 'Housekeeping', 'Picked up help query (ID: 116)', 'helper.php', 1, 0, '28-09-2016 11:03:03');
INSERT INTO `system_stafflog` VALUES (26, 'Housekeeping', 'Deleted help query (ID: 113)', 'helper.php', 1, 0, '28-09-2016 11:03:22');
INSERT INTO `system_stafflog` VALUES (27, 'Housekeeping', 'Deleted help query (ID: 116)', 'helper.php', 1, 0, '28-09-2016 11:03:48');
INSERT INTO `system_stafflog` VALUES (28, 'Housekeeping', 'Miguel authenticated from 10.184.200.150', 'login.php', 1, 0, '07-10-2016 23:15:32');
INSERT INTO `system_stafflog` VALUES (29, 'Housekeeping', 'Miguel authenticated from 10.71.223.81', 'login.php', 1, 0, '07-10-2016 23:31:13');
INSERT INTO `system_stafflog` VALUES (30, 'Housekeeping', 'Dark authenticated from 10.43.180.138', 'login.php', 4, 0, '20-02-2017 01:19:46');
INSERT INTO `system_stafflog` VALUES (31, 'Housekeeping', 'Gabriel authenticated from 127.0.0.1', 'login.php', 8, 0, '06-04-2017 17:06:27');
INSERT INTO `system_stafflog` VALUES (32, 'Housekeeping', 'Changed user rank to 7', 'ranktool.php', 8, 8, '06-04-2017 17:31:05');
INSERT INTO `system_stafflog` VALUES (33, 'Housekeeping', 'Gabriel authenticated from 127.0.0.1', 'login.php', 8, 0, '06-04-2017 17:37:47');
INSERT INTO `system_stafflog` VALUES (34, 'Housekeeping', 'Gabriel authenticated from 10.158.177.57', 'login.php', 8, 0, '06-04-2017 21:02:21');
INSERT INTO `system_stafflog` VALUES (35, 'Housekeeping', 'Updated CMS Settings (Turn your site on/off)', 'maintenance.php', 8, 0, '06-04-2017 21:03:43');
INSERT INTO `system_stafflog` VALUES (36, 'Housekeeping', 'Gabriel authenticated from 10.168.65.231', 'login.php', 8, 0, '18-06-2017 02:28:30');
INSERT INTO `system_stafflog` VALUES (37, 'Housekeeping', 'Mass Alert to all users on site', 'massalert.php', 8, 0, '18-06-2017 02:30:36');
INSERT INTO `system_stafflog` VALUES (38, 'Housekeeping', 'Updated CMS Settings (Turn your site on/off)', 'maintenance.php', 8, 0, '18-06-2017 02:48:25');
INSERT INTO `system_stafflog` VALUES (39, 'Housekeeping', 'Updated CMS Settings (Turn your site on/off)', 'maintenance.php', 8, 0, '18-06-2017 02:48:42');
INSERT INTO `system_stafflog` VALUES (40, 'Housekeeping', 'Updated CMS Settings (Turn your site on/off)', 'maintenance.php', 8, 0, '18-06-2017 02:49:12');
INSERT INTO `system_stafflog` VALUES (41, 'Housekeeping', 'Gabriel authenticated from 10.178.64.67', 'login.php', 8, 0, '29-07-2017 02:19:57');
INSERT INTO `system_stafflog` VALUES (42, 'Housekeeping', 'Edited user', 'edituser.php', 8, 33, '29-07-2017 02:24:28');
INSERT INTO `system_stafflog` VALUES (43, 'Housekeeping', 'Gabriel authenticated from 10.164.78.133', 'login.php', 8, 0, '29-07-2017 02:28:18');
INSERT INTO `system_stafflog` VALUES (44, 'Housekeeping', 'Access Denied to Rank Tool; Only the system administrator may give out rank 7!', 'ranktool.php', 8, 34, '29-07-2017 02:29:10');
INSERT INTO `system_stafflog` VALUES (45, 'Housekeeping', 'Access Denied to Rank Tool; Only the system administrator may give out rank 7!', 'ranktool.php', 8, 34, '29-07-2017 02:29:45');
INSERT INTO `system_stafflog` VALUES (46, 'Housekeeping', 'Changed user rank to 6', 'ranktool.php', 8, 34, '29-07-2017 02:29:58');
INSERT INTO `system_stafflog` VALUES (47, 'Housekeeping', 'vccvc authenticated from 10.13.211.115', 'login.php', 34, 0, '29-07-2017 02:30:55');
INSERT INTO `system_stafflog` VALUES (48, 'Housekeeping', 'Mass Alert to all users on site', 'massalert.php', 34, 0, '29-07-2017 02:35:45');
INSERT INTO `system_stafflog` VALUES (49, 'Housekeeping', 'Mass Alert to all users on site', 'massalert.php', 34, 0, '29-07-2017 02:37:03');
INSERT INTO `system_stafflog` VALUES (50, 'Housekeeping', 'Miguel authenticated from 10.69.185.81', 'login.php', 1, 0, '03-07-2018 18:14:22');
INSERT INTO `system_stafflog` VALUES (51, 'Housekeeping', 'Edited user', 'edituser.php', 1, 8, '03-07-2018 18:15:15');
INSERT INTO `system_stafflog` VALUES (52, 'Housekeeping', 'Edited user', 'edituser.php', 1, 4, '03-07-2018 18:17:57');
INSERT INTO `system_stafflog` VALUES (53, 'Housekeeping', 'Edited user', 'edituser.php', 1, 81, '03-07-2018 18:18:05');
INSERT INTO `system_stafflog` VALUES (54, 'Housekeeping', 'Edited user', 'edituser.php', 1, 4, '03-07-2018 18:18:12');
INSERT INTO `system_stafflog` VALUES (55, 'Housekeeping', 'Edited user', 'edituser.php', 1, 4, '03-07-2018 18:18:54');
INSERT INTO `system_stafflog` VALUES (56, 'Housekeeping', 'Edited user', 'edituser.php', 1, 4, '03-07-2018 18:19:18');
INSERT INTO `system_stafflog` VALUES (57, 'Housekeeping', 'Edited user', 'edituser.php', 1, 4, '03-07-2018 18:19:20');
INSERT INTO `system_stafflog` VALUES (58, 'Housekeeping', 'Edited user', 'edituser.php', 1, 4, '03-07-2018 18:19:25');
INSERT INTO `system_stafflog` VALUES (59, 'Housekeeping', 'Changed user rank to 1', 'ranktool.php', 1, 4, '03-07-2018 18:22:10');
INSERT INTO `system_stafflog` VALUES (60, 'Housekeeping', 'Changed user rank to 1', 'ranktool.php', 1, 8, '03-07-2018 18:22:15');
INSERT INTO `system_stafflog` VALUES (61, 'Housekeeping', 'Changed user rank to 1', 'ranktool.php', 1, 34, '03-07-2018 18:22:20');
INSERT INTO `system_stafflog` VALUES (62, 'Housekeeping', 'Updated CMS Settings (Turn your site on/off)', 'maintenance.php', 1, 0, '03-07-2018 18:32:56');
INSERT INTO `system_stafflog` VALUES (63, 'Housekeeping', 'Updated Server Settings (Wordfilter Options)', 'wordfilter.php', 1, 0, '03-07-2018 18:34:49');
INSERT INTO `system_stafflog` VALUES (64, 'Housekeeping', 'Updated Server Settings (Welcome Message Options)', 'welcomemsg.php', 1, 0, '03-07-2018 18:34:51');
COMMIT;

-- ----------------------------
-- Table structure for system_strings
-- ----------------------------
DROP TABLE IF EXISTS `system_strings`;
CREATE TABLE `system_strings` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stringid` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT 'null',
  `var_en` text COLLATE latin1_general_ci,
  `var_de` text COLLATE latin1_general_ci,
  `var_nl` text COLLATE latin1_general_ci,
  PRIMARY KEY (`id`,`stringid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of system_strings
-- ----------------------------
BEGIN;
INSERT INTO `system_strings` VALUES (1, 'console_onhotelview', 'On Hotel View', 'auf Hotelansicht', 'In hoteloverzicht');
INSERT INTO `system_strings` VALUES (2, 'modtool_accesserror', 'Sorry, but you do not have access to this feature of the MOD-Tool.\\rIf you think you should have access to this feature, then please contact the Hotel staff.\\rIf not, gtfo.', NULL, 'Sorry, but you do not have access to this feature of the MOD-Tool.\\rIf you think you should have access to this feature, then please contact the Hotel staff.\\rIf not, gtfo.');
INSERT INTO `system_strings` VALUES (3, 'modtool_actionfail', 'Action failed.', NULL, 'Command mislukt');
INSERT INTO `system_strings` VALUES (4, 'modtool_rankerror', 'You do not have the rights for this action on this user!', NULL, 'You do not have the rights for this action on this user!');
INSERT INTO `system_strings` VALUES (5, 'modtool_usernotfound', 'Probably the user is offline or does not exist.', NULL, 'Probably the user is offline or does not exist.');
INSERT INTO `system_strings` VALUES (6, 'room_rightsreset', 'The roomowner has reset all the roomrights.<br>Please re-enter the room.', NULL, 'The roomowner has reset all the roomrights.<br>Please re-enter the room.');
INSERT INTO `system_strings` VALUES (7, 'trading_disabled', 'Sorry, but the Hotel staff has disabled trading.\\rPlease try later!', NULL, 'Sorry, de hotel staff heeft ruilen uitgezet');
INSERT INTO `system_strings` VALUES (8, 'trading_nottradeable', 'Sorry, but you can\'t trade this item!', NULL, 'Sorry, je kan dit niet ruilen');
INSERT INTO `system_strings` VALUES (9, 'welcomemessage_text', '', NULL, 'Koop nog geen landscape (error) (console werkt buggy) KIjk op het nieuws voor de album');
INSERT INTO `system_strings` VALUES (10, 'console_inpublicroom', 'In Public Room', NULL, 'In openbare ruimte');
INSERT INTO `system_strings` VALUES (11, 'room_stafflocked', 'Sorry, but only Staff is allowed to enter this room.', NULL, 'Sorry, but only Staff is allowed to enter this room.');
INSERT INTO `system_strings` VALUES (12, 'room_full', 'Sorry, but this publicroom is full.', NULL, 'Sorry, but this publicroom is full.');
INSERT INTO `system_strings` VALUES (13, 'room_infobus_closed', 'Sorry, but the Infobus is closed at the moment.', NULL, 'Sorry, but the Infobus is closed at the moment.');
INSERT INTO `system_strings` VALUES (14, 'scommand_hotelalert', 'Message from the Hotel management:', NULL, 'Bericht van het beheer van het Hotel:');
INSERT INTO `system_strings` VALUES (15, 'scommand_failed', 'Unable to process speech command.\r\nCheck your parameters and/or make sure that the target user is in room. (if any)', NULL, 'Unable to process speech command.\r\nCheck your parameters and/or make sure that the target user is in room. (if any)');
INSERT INTO `system_strings` VALUES (16, 'scommand_success', 'Speech command processed, action performed.', NULL, 'Verwerkte het bevel van de toespraak, uitgevoerde actie.');
INSERT INTO `system_strings` VALUES (17, 'scommand_muted', 'You have been muted for the following reason:', '', 'U bent gedempt om de volgende reden:');
INSERT INTO `system_strings` VALUES (18, 'scommand_unmuted', 'You have been unmuted.', '', 'U bent unmuted geweest.');
INSERT INTO `system_strings` VALUES (19, 'scommand_rankalert', 'Message from a staffmember with same rank:', NULL, 'Bericht van een staffmember met zelfde rang:');
INSERT INTO `system_strings` VALUES (20, 'banreport_header', 'Ban report for', NULL, 'Ban rapport voor');
INSERT INTO `system_strings` VALUES (21, 'common_userrank', 'Rank', NULL, 'Rang');
INSERT INTO `system_strings` VALUES (22, 'common_ip', 'IP address', NULL, 'Ip adres');
INSERT INTO `system_strings` VALUES (23, 'banreport_banner', 'Banned by', NULL, 'Verbannen bij');
INSERT INTO `system_strings` VALUES (24, 'banreport_posted', 'Date of ban posting', NULL, 'Datum van ban lengte');
INSERT INTO `system_strings` VALUES (25, 'banreport_expires', 'Date of ban expire', NULL, 'De datum van verbod verloopt');
INSERT INTO `system_strings` VALUES (29, 'banreport_affectedusernames', 'Usernames affected by this ban', NULL, 'Deze mensen zijn ook verbannen');
INSERT INTO `system_strings` VALUES (26, 'banreport_reason', 'Reason', NULL, 'Reden');
INSERT INTO `system_strings` VALUES (27, 'banreport_ipbanflag', 'IP ban applied', NULL, 'IP ban applied');
INSERT INTO `system_strings` VALUES (28, 'banreport_staffnote', 'Staff note from banner', NULL, 'Staff bericht van banner');
INSERT INTO `system_strings` VALUES (29, 'userinfo_header', 'Virtual user information', NULL, 'Gebruiksinfomatie');
INSERT INTO `system_strings` VALUES (30, 'userinfo_accesserror', 'Sorry, but you haven\'t got access to this user\'s details.\r\n- It can be possible that the user doesn\'t exist\r\n- It can be possible that the user has got a higher rank than you', NULL, 'Sorry, but you haven\'t got access to this user\'s details.\r\n- It can be possible that the user doesn\'t exist\r\n- It can be possible that the user has got a higher rank than you');
INSERT INTO `system_strings` VALUES (31, 'common_usernotfound', 'The user was not found.', NULL, 'Deze gebruiker is niet gevonden');
INSERT INTO `system_strings` VALUES (32, 'common_userid', 'User ID', NULL, 'GebruikersID');
INSERT INTO `system_strings` VALUES (33, 'common_username', 'Username', NULL, 'Gebruikersnaam');
INSERT INTO `system_strings` VALUES (34, 'common_usermission', 'Mission', NULL, 'Missie');
INSERT INTO `system_strings` VALUES (35, 'common_email', 'Email address', NULL, 'Emailadres');
INSERT INTO `system_strings` VALUES (36, 'common_credits', 'Credits', NULL, 'Credits');
INSERT INTO `system_strings` VALUES (37, 'common_tickets', 'Tickets', NULL, 'Tickets');
INSERT INTO `system_strings` VALUES (38, 'common_birth', 'Birth date', NULL, 'Geboortedatum');
INSERT INTO `system_strings` VALUES (39, 'common_hbirth', 'Registered at', NULL, 'Registeerd bij');
INSERT INTO `system_strings` VALUES (40, 'common_online', 'Online', NULL, 'Online');
INSERT INTO `system_strings` VALUES (41, 'common_yes', 'Yes', NULL, 'Ja');
INSERT INTO `system_strings` VALUES (42, 'common_no', 'No', NULL, 'Nee');
INSERT INTO `system_strings` VALUES (43, 'common_location', 'Location', NULL, 'Locatie');
INSERT INTO `system_strings` VALUES (44, 'common_owner', 'Owner', NULL, 'Eigenaar');
INSERT INTO `system_strings` VALUES (45, 'common_room', 'Room', NULL, 'Kamer');
INSERT INTO `system_strings` VALUES (46, 'common_hotelview', 'Hotel View', NULL, 'Hotel overzicht');
INSERT INTO `system_strings` VALUES (47, 'common_lastaccess', 'Last access', NULL, 'Laaste inlog');
INSERT INTO `system_strings` VALUES (48, 'cfh_picked_up', 'Picked up', NULL, 'Opgepakt');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `rank` int(1) NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `birth` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `hbirth` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `figure` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `sex` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `mission` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `consolemission` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `credits` int(7) NOT NULL DEFAULT '0',
  `tickets` int(5) NOT NULL DEFAULT '0',
  `badge_status` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '1',
  `lastvisit` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `figure_swim` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `user` text COLLATE latin1_general_ci,
  `postcount` bigint(20) NOT NULL DEFAULT '0',
  `ticket_sso` varchar(39) COLLATE latin1_general_ci DEFAULT NULL,
  `ipaddress_last` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `noob` int(1) NOT NULL DEFAULT '0',
  `online` mediumint(30) NOT NULL DEFAULT '1',
  `bb_totalpoints` int(30) DEFAULT '0',
  `bb_playedgames` int(30) DEFAULT '0',
  `screen` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `rea` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `gift` smallint(2) DEFAULT NULL,
  `sort` smallint(1) DEFAULT NULL,
  `roomid` int(15) DEFAULT NULL,
  `lastgift` smallint(2) DEFAULT NULL,
  `visibility` int(1) DEFAULT '1',
  `hc_before` int(1) DEFAULT NULL,
  `guideavailable` int(1) NOT NULL,
  `shockwaveid` text COLLATE latin1_general_ci NOT NULL,
  `guide` int(1) NOT NULL,
  `guide-allowed` int(1) NOT NULL,
  `window` int(3) NOT NULL,
  `newsletter` int(1) NOT NULL DEFAULT '1',
  `email_verified` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'Miguel', 'e64f621dc067653f36ec5e4ae5bbaacab7626cdb', 7, 'miguel.gonzalez.93@gmail.com', '15-11-1993', '16-08-2016', 'hr-802-61.hd-180-1.ch-886-82.lg-285-110.sh-300-62.fa-1201-.wa-2005-.ha-1013-110.ea-1404-62', 'M', 'I love HoloCMS!', NULL, 4011, 96, '0', '04-07-2018 13:49:32', NULL, NULL, 5, 'ST-731935-45184376324739947547-holo-fe3', '10.65.204.162', 1, 8388607, 1920, 2, NULL, NULL, NULL, 1, 1, 16, 1, 0, 0, '', 0, 0, 0, 1, -1);
INSERT INTO `users` VALUES (2, 'Meth0d', 'fa8e41b699b42da9a77bf23d4ba85e85b3d6e4fd', 1, 'meth0d@meth0d.org', '1-1-1980', '14-09-2016', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', 'HoloCMS Rulz!', NULL, 4978, 100, '1', '03-10-2016 13:51:45', NULL, NULL, 0, 'ST-824336-37649921525321155735-holo-fe1', '127.0.0.1', 1, 8388607, 0, 0, NULL, NULL, NULL, 4, 124, 14, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (3, 'leo', '1c3fd301eb89781fb72e7e25e362dacfa1ef6499', 1, 'lol@a.com', '1-1-1998', '31-01-2017', 'hr-110-37.hd-200-6.ch-210-81.lg-281-70.sh-305-63.he-1601-', 'M', ':cricket:', NULL, 4958, 100, '0', '31-01-2017 14:18:30', NULL, NULL, 1, 'ST-460421-74934720080683317802-holo-fe3', '10.41.203.70', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (4, 'Dark', '923e4a99f001272b38ce5cb1193b496903763eac', 1, 'lol@fuckyou.pleb', '1-1-1990', '1-1-1990', 'hr-110-37.hd-200-6.ch-210-81.lg-281-70.sh-305-63.he-1601-', 'M', '', NULL, 9999, 9999, '1', NULL, NULL, NULL, 0, 'ST-fuckyou', '10.231.231.232', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 1);
INSERT INTO `users` VALUES (5, 'pedxz', '7282acb85b55a1f430d61477bdec488c2cd066bd', 1, 'pedxzdesign@gmail.com', '6-7-1997', '23-03-2017', 'hr-125-40.hd-180-9.ch-266-.lg-285-81.sh-290-77.ea-1406-.fa-1205-62.ha-1004-62', 'M', 'hh', NULL, 4920, 100, '0', '28-03-2017 13:19:41', NULL, NULL, 0, 'ST-309860-99752027723853749309-holo-fe5', '95.92.11.98', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 126, 23, 1, 1, 0, '', 0, 0, 0, 1, -1);
INSERT INTO `users` VALUES (6, 'poko', 'aa901f39f656dc468a5dc4311d28afc1256dcead', 1, 'pedxzdesign@gmail.com', '6-6-1986', '23-03-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4920, 100, '0', '20-08-2017 20:33:24', NULL, NULL, 4, NULL, '10.178.162.66', 1, 8388607, 0, 0, NULL, NULL, NULL, 3, 144, 17, 1, 1, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (7, 'Muusi', '361ae19f7b119fbc8dd312cfd0443ad9a117d531', 1, 'gabriel_henry@live.com', '6-6-2001', '06-04-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', 'Array', NULL, 5000, 100, '1', '06-04-2017 16:24:45', NULL, NULL, 0, NULL, '127.0.0.1', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (8, 'Gabriel', '84b557988a2a018343804be4416eb63769932c89', 1, 'biellss@gmail.com', '5-8-2000', '06-04-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '29-07-2017 02:26:36', NULL, NULL, 0, NULL, '10.93.229.188', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (9, 'AndrezHit', '8e27c83152e17cf484f0708ef3ec3ed7fc8849d8', 1, 'aromanchenko6@gmail.com', '12-8-2001', '02-05-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '24-12-2017 21:44:10', NULL, NULL, 0, NULL, '10.30.205.116', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (10, 'testje1', '430c162f9db1ffac53f818d062543eb89f85480c', 1, 'hallo@hallo.nl', '1-1-1994', '02-05-2017', 'hr-165-33.hd-185-1.ch-245-87.lg-280-79.sh-908-65.ha-1020-', 'M', NULL, NULL, 5000, 100, '1', '02-05-2017 19:35:44', NULL, NULL, 0, NULL, '10.45.73.26', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (11, 'Pabloacigh', 'c8933bb9effcf6ba497b667e58e641ae43fdeb96', 1, 'demidorehov402@mail.ru', '12-9-1925', '04-05-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '25-12-2017 00:14:24', NULL, NULL, 0, NULL, '10.155.162.52', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (12, 'Asketsjed', '776e0b69de6777f44ccf252cba296a2de2fb6de9', 1, 'milangorshkov841@mail.ru', '30-11-1940', '04-05-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '07-05-2017 22:09:55', NULL, NULL, 0, NULL, '10.169.124.243', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (13, 'HarrisVal', 'c7434bd139db39641d0ac1098689f26ae6123c6d', 1, 'nefedevanat4@gmail.com', '15-3-1951', '14-05-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '19-05-2017 03:34:21', NULL, NULL, 0, NULL, '10.140.231.210', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (14, 'pedro', '42aa2e38137302c99827b190c120309f16b56290', 1, 'pjj@gmail.com', '5-7-1996', '15-05-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '15-05-2017 18:50:50', NULL, NULL, 0, NULL, '10.171.119.12', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (15, 'mehdi', '057048c836ff7be895474a4adf1d1396355652ce', 1, 'mehdigfx@gmail.com', '8-6-1999', '20-05-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4920, 100, '0', '20-05-2017 23:43:11', NULL, NULL, 0, NULL, '10.81.172.78', 1, 8388607, 0, 0, NULL, NULL, NULL, 6, 128, 20, 1, 1, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (16, 'elvisnaomorreu', 'f91365aa706c5fc67b662dc3ab9e54815baeaf30', 1, 'elvisnaomorreu@elvisnaomorreu.com', '30-12-1993', '24-05-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '24-05-2017 19:34:41', NULL, NULL, 0, NULL, '10.97.160.245', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (17, 'Ricky', '410399442063f1b5cb876ab201787876e9ee9d93', 1, 'a@b.com', '1-1-1989', '27-05-2017', 'hr-678-53.hd-195-1.ch-887-62.lg-285-81.sh-300-64.ha-1012-62', 'M', NULL, NULL, 4980, 100, '0', '27-05-2017 14:34:13', NULL, NULL, 0, NULL, '10.167.67.198', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (18, 'cookerA2!', '7030deced2234f0026d29377a1ae1baab741fdec', 1, 'forcer_v@mail.ru', '3-4-1991', '02-06-2017', 'hr-135-.hd-206-1.ch-267-66.lg-281-81.sh-290-77.ha-1005-62.ea-1401-62.fa-1211-', 'M', NULL, NULL, 5000, 100, '1', '02-06-2017 13:14:20', NULL, NULL, 0, NULL, '10.63.30.96', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (19, 'Alinkyequope', '2a0ce92c04bc64f441b6486a129b040b6658f5e0', 1, 'kucherenkoalena6@gmail.com', '26-12-1932', '03-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '03-06-2017 00:49:01', NULL, NULL, 0, NULL, '10.30.24.121', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (20, 'Holos', '88e51da13e4d4d39ae4d39295e76ab44c1449b20', 1, 'Ded@dedmail.se', '29-4-1991', '03-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', 'Homo', NULL, 5000, 100, '1', '03-06-2017 06:22:18', NULL, NULL, 0, 'ST-991891-10355903812950017922-holo-fe3', '10.81.172.78', 1, 0, 0, 0, NULL, NULL, NULL, 1, 131, 3, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (21, 'jaman', '29663683dfe58159e4d9d009b18c40932c5871b0', 1, 'hoi@hoi.nl', '30-9-1990', '04-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '04-06-2017 09:53:25', NULL, NULL, 0, NULL, '10.93.232.18', 1, 0, 0, 0, NULL, NULL, NULL, 1, 132, 4, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (22, 'kako', '9239a79f24e2feef8b358511e64aca9986a07910', 1, 'kakogb@gmail.com', '7-3-1977', '04-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '04-06-2017 17:27:02', NULL, NULL, 0, NULL, '10.71.208.240', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (23, 'Maxime', 'b2e20e4da5ed7a41488a362d17a1dbf27f4a1a6f', 1, 'ddddd@live.fr', '18-9-1990', '09-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '09-06-2017 22:04:39', NULL, NULL, 0, 'ST-657827-31669507636656952358-holo-fe3', '10.230.176.210', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 133, 9, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (24, 'Verkicled', '8ee5cfb124c7b91eb94ffc892eab9ba80d6a3d9b', 1, 'mikulsem7@gmail.com', '19-8-1983', '13-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '13-06-2017 08:15:54', NULL, NULL, 0, NULL, '10.142.142.206', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (25, 'Dion', 'c841675daf50f7de5886b792a679972173c33908', 1, 'dedesrd@desdsed.be', '2-5-2003', '16-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '16-06-2017 16:22:25', NULL, NULL, 0, NULL, '10.16.187.240', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 134, 16, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (26, 'Hahn', '3ec747923013e57bc790ecfe088bd2e09bf8674d', 1, 'hahn@hotmail.com', '3-4-1995', '17-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '17-06-2017 20:30:58', NULL, NULL, 0, NULL, '10.93.229.188', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 135, 17, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (27, 'mehid', 'cbb244b084208b60e054a875b33829ed389ae508', 1, 'mehid@me.com.br', '1-4-2004', '19-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '19-06-2017 05:12:25', NULL, NULL, 0, NULL, '10.63.100.77', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 136, 19, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (28, 'Koch', '1b0ae4f0e7e412a4de92465bc8df64f102aae8c1', 1, 'kochk@gmail.com', '19-5-1999', '25-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '25-06-2017 03:22:50', NULL, NULL, 0, NULL, '10.157.160.84', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 137, 25, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (29, 'Piet', '6f4284d1b0b5e70be3a66468c05f29d4ea186756', 1, 'test@live.nl', '2-6-1991', '27-06-2017', 'hr-170-36.hd-195-2.ch-245-83.lg-270-85.sh-290-90.ea-1403-65', 'M', NULL, NULL, 5000, 100, '1', '27-06-2017 20:41:35', NULL, NULL, 0, NULL, '10.63.211.204', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (30, 'emoskate27', '01e011d9bb5e04e225c4ec86b7e49ea02d60fedd', 1, 'emoskate_27@hotmail.com', '27-6-1990', '30-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '30-06-2017 18:17:43', NULL, NULL, 0, NULL, '10.43.185.17', 1, 8388607, 0, 0, NULL, NULL, NULL, 6, 139, 30, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (31, 'emoskate3', '6ab2a1df34d6291a4eafdb426713f87a83e1d354', 1, 'gilberto_villanueva@hotmail.com', '16-2-1990', '30-06-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '30-06-2017 18:22:44', NULL, NULL, 0, NULL, '10.169.124.243', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (32, 'habbo', 'afd611befe9f11633b27008fa0d42f3f84080740', 1, 'jokps42@gmail.com', '1-4-1984', '20-07-2017', 'hr-100-.hd-180-7.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '20-07-2017 13:13:31', NULL, NULL, 0, 'ST-037259-05759779238232894257-holo-fe1', '10.69.198.55', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (33, 'Biell', 'f0696c4c0ea3d5851d81c9b5c6cd0c0a508eea53', 1, 'asdadadsww@live.com', '7-4-2005', '29-07-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '29-07-2017 02:17:15', NULL, NULL, 0, NULL, '10.183.102.41', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (34, 'vccvc', 'e974ea64a4d58b12f6f1b2a377ce5a3580563dcf', 1, 'klklklklklkl', '3-6-1999', '29-07-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '29-07-2017 02:25:07', NULL, NULL, 0, NULL, '10.61.164.249', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 141, 29, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (35, 'Ciao', '5dfb83e78e5c9fc4255ebe55d858a764121762f5', 1, 'cjccc@asd.it', '5-6-1973', '02-08-2017', 'hr-100-.hd-180-9.ch-875-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '02-08-2017 15:39:19', NULL, NULL, 0, NULL, '10.111.221.243', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 142, 2, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (36, 'Masako', '35dc43aaf0ef909fee66ff5f98f0285d9c81a1c7', 1, 'Masako@outlook.fr', '4-3-1998', '08-08-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '08-08-2017 19:30:40', NULL, NULL, 0, NULL, '10.13.226.198', 1, 8388607, 0, 0, NULL, NULL, NULL, 5, 143, 8, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (37, 'Mikeuyz', 'b5ee70edcf722362fa95a3b654daa042615b590a', 1, 'mikeeeyz@gmail.com', '16-1-1995', '21-08-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '21-08-2017 21:35:39', NULL, NULL, 0, NULL, '10.141.27.204', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (38, 'T0E', '9dfcd1118f0309b7581b87b2d6084d9ce6e5ae8f', 1, 'toeoficial@Outlook.com', '19-6-1999', '01-09-2017', 'hr-145-41.hd-206-9.ch-267-72.lg-281-76.sh-908-89.wa-2004-80', 'M', NULL, NULL, 5000, 100, '1', '20-10-2017 00:30:00', NULL, NULL, 0, 'ST-133170-21732459355496728039-holo-fe4', '10.30.39.212', 1, 8388607, 0, 0, NULL, NULL, NULL, 3, 145, 1, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (39, 'mercuryfr', 'd58de514d589236ce7e50111255d76a8bdeec3e9', 1, 'volodia@fff.fr', '2-3-1999', '10-09-2017', 'hr-100-.hd-205-1.ch-875-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4960, 100, '0', '10-09-2017 02:49:36', NULL, NULL, 1, NULL, '10.93.232.18', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (40, 'test', '7d641aa2bb36312d466ff84d4f61ded1b326eb0b', 2, 'asd@asd.com', '3-4-1978', '15-09-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', 'ppokkpok', NULL, 4878, 100, '0', '18-09-2017 17:42:40', NULL, NULL, 0, NULL, '10.71.207.7', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 147, 15, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (41, 'TheOman', 'ff8bb52f06f92d872ceb71601282aae9874cb96a', 1, 'daniel@danhost.no', '24-8-1993', '15-09-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4924, 100, '0', '07-01-2018 20:32:52', NULL, NULL, 0, NULL, '10.99.208.227', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 148, 15, 1, 1, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (42, 'Holo', '3bf219bdd5cd475d869842034d4b79070af4dc95', 1, 'imgustavo@Outlook.com', '2-5-1998', '22-09-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '22-09-2017 01:24:24', NULL, NULL, 0, NULL, '10.13.226.198', 1, 8388607, 0, 0, NULL, NULL, NULL, 4, 149, 22, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (43, 'vini', '5a52c26e661f5867672025811d93cc48806cc5be', 1, 'jhgjgjghj46@gg.com', '3-4-1999', '24-09-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4980, 100, '1', '24-09-2017 14:11:08', NULL, NULL, 0, NULL, '10.145.25.250', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (44, 'vina', '8b972a77def8c5461cb01af88a1db6cc31f7b433', 1, 'fhh747645@hotmail.com', '5-8-1999', '24-09-2017', 'hd-205-28.ch-260-110.lg-270-110.sh-290-110.fa-1203-', 'M', NULL, NULL, 4920, 100, '0', '24-09-2017 14:52:12', NULL, NULL, 0, NULL, '10.13.194.229', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 151, 24, 1, 1, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (45, 'Richard', '34fe306c60e7773e10bd8d279c1da4913d76a12f', 1, 'richard@richard.com', '27-4-1997', '24-09-2017', 'hr-828-61.hd-180-1.ch-806-110.lg-281-92.sh-906-92.ha-1027-.fa-1209-110.ca-1816-', 'M', 'crickey', NULL, 4944, 100, '0', '04-10-2017 23:58:52', NULL, NULL, 1, 'ST-319753-71856952115892169179-holo-fe3', '10.99.212.2', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (46, 'mobboy', '7812017dd9db3005f0a478d75d0f16481cf912ce', 1, 'mob@mob.nl', '1-1-1992', '30-09-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '30-09-2017 00:37:52', NULL, NULL, 0, NULL, '10.229.95.34', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (47, 'Leg4cy', '733bad5f0e6f1e5d14acb5e9a4f82d132c3a9991', 1, 'asas@sas.conm', '1-1-1999', '13-10-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '13-10-2017 06:03:38', NULL, NULL, 0, NULL, '10.71.204.252', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (48, 'Claush', '5e25437dd72efa35ffd3957dc49046f3a6c09d69', 1, 'edfdwdwdwdw@wddwdw.com', '1-3-1999', '13-10-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4920, 100, '0', '13-10-2017 18:42:17', NULL, NULL, 0, NULL, '10.93.229.188', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (49, 'nn', '0d0f56593bad000c3625a9428438dda4f8c291a8', 1, 'jhhjjh@jkjjkjk.net', '4-3-1997', '25-10-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', '&lt;script&gt;alert(123)&lt;/script&gt;', NULL, 5000, 100, '1', '25-10-2017 02:23:08', NULL, NULL, 0, NULL, '10.30.78.62', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (50, 'David', 'cf30f6e8ad5877287d0743767401939b46292639', 2, 'davidlemos98@outlook.com', '30-6-1998', '27-10-2017', 'hr-100-.hd-180-1.ch-255-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4856, 100, '0', '09-04-2018 21:49:33', NULL, NULL, 2, 'ST-047644-95457172726867104596-holo-fe1', '10.69.110.126', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (51, 'Herba', '3ac7b99031e63f938f4e3c5c2771a9990851e40c', 1, 'herbretro@gmail.com', '5-1-1999', '03-11-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '03-11-2017 00:14:59', NULL, NULL, 0, NULL, '10.30.238.250', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (52, 'Davidd', '9198b3ef550f579564cbee287bb0848dab8ba72d', 1, 'davidlemos98@outlook.com', '30-6-1998', '05-11-2017', 'hr-100-.hd-190-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '05-11-2017 23:02:10', NULL, NULL, 0, NULL, '10.146.211.141', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (53, 'dsaf43545', '1c56072ae8fea833f70a2c7a55fcd5469883125a', 1, 'dsafds@hotmail.com', '16-6-1984', '13-11-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '13-11-2017 13:17:07', NULL, NULL, 0, NULL, '10.65.79.7', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (54, 'PloX', 'b22cf46285ce4c806a11c6bfca86585867e6eb61', 1, 'jesper@arlehall.se', '29-3-1990', '13-11-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '13-11-2017 20:59:23', NULL, NULL, 0, NULL, '10.16.202.50', 1, 8388607, 0, 0, NULL, NULL, NULL, 4, 155, 13, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (55, 'RogerWaype', '24a121884c2ec17a3e5940c0f4b0709db2770916', 1, 'roggers@mister-vig.ru', '17-6-1966', '17-11-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '05-12-2017 23:32:14', NULL, NULL, 0, NULL, '10.111.223.252', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (56, 'DavidLemos', '7da2f3a98683960c7a7e74a68516a9e9be502bb0', 1, 'davidlemos@live.com', '30-6-1998', '25-11-2017', 'hr-100-.hd-190-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '25-11-2017 20:26:37', NULL, NULL, 0, NULL, '10.137.126.90', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (57, '1232', '57ddd23c9fe26d73a2f5062dfdfb66fdae44406d', 1, 'fsdfd43@gg.com', '4-8-1999', '27-11-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '27-11-2017 23:19:10', NULL, NULL, 0, NULL, '10.79.178.35', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (58, 'AccTest', '34daf7e1ba3fcb4bc4e942603801654bfa9c4e20', 1, 'root@live.co', '27-3-1995', '14-12-2017', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '14-12-2017 14:10:50', NULL, NULL, 0, NULL, '10.11.225.73', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (59, 'rickandress', '123bed7fe9d1be0b57ae9177a0257760d340fcc2', 1, 'lolsuperscratch@gmail.com', '1-1-1994', '16-12-2017', 'hr-893-42.hd-180-1.ch-210-64.lg-270-64.sh-290-64', 'M', NULL, NULL, 5000, 100, '1', '16-12-2017 23:09:26', NULL, NULL, 0, 'ST-160649-24976753475161679897-holo-fe5', '10.30.205.116', 1, 0, 0, 0, NULL, NULL, NULL, 3, 156, 16, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (60, 'Borgan', '76146844ae3439fae8f3a8bfe61e3e5d47635f94', 1, 'whataboutlove@bol.com.br', '4-7-2000', '22-01-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '22-01-2018 19:21:35', NULL, NULL, 0, NULL, '10.152.237.144', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (61, 'ttest', 'b7493fae5b34ce15de052808d6da7ae36126f0d6', 1, 'cihanwizard12@gmail.com', '8-5-2002', '04-02-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '04-02-2018 07:25:43', NULL, NULL, 0, NULL, '10.63.133.165', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (62, 'MOD-Pekka893', 'd82fd6880a079c422cceec2cae6ec2dc2c6fb27b', 1, 'admin@pekka893.com', '22-9-1998', '05-02-2018', 'hr-100-.hd-180-1.ch-225-89.lg-285-82.sh-300-64.ha-1023-82', 'M', NULL, NULL, 5000, 100, '1', '05-02-2018 15:25:46', NULL, NULL, 0, 'ST-560957-17594932280376357833-holo-fe0', '10.5.186.67', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (63, '111A', '7532c7fa7bfecd693f49d8cbbc7da81b99ab7670', 1, 'cihanwizard12@gmail.com', '2-1-1953', '10-02-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '10-02-2018 23:47:01', NULL, NULL, 0, NULL, '10.146.44.229', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (64, '11111111', '747417f2206148a3118d02f3adf20b5e4139baac', 1, '111@web.de', '4-4-2001', '10-02-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '10-02-2018 23:52:31', NULL, NULL, 0, NULL, '10.35.228.180', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (65, 'aq', '7704ddb27817acfccb52fb532c30d14c5c8ac97f', 1, '12@web.de', '6-5-1954', '11-02-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '11-02-2018 00:07:59', NULL, NULL, 0, 'ST-166367-37554956059155934650-holo-fe5', '10.79.192.24', 1, 0, 0, 0, NULL, NULL, NULL, 1, 159, 11, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (66, 'hhhh', 'da866345536209d7827b0b2eb35588d20afc8a0b', 1, '1@1.com', '1-1-1995', '11-02-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '11-02-2018 18:50:47', NULL, NULL, 0, 'ST-378066-32454220539962394791-holo-fe5', '10.5.185.134', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 160, 11, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (67, 'prueba', '39d3352bf94e94003648b1477e4739036c9c22c8', 1, 'kajhsjiaishu@gmail.com', '3-2-2005', '19-02-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '19-02-2018 10:30:03', NULL, NULL, 0, NULL, '10.45.77.75', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (68, 'Rasmus', '2800f8fdf9b14578188a5947bd3126411ea4f05a', 2, 'hej@hej.se', '24-6-1996', '24-02-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4940, 100, '0', '24-02-2018 17:56:17', NULL, NULL, 0, NULL, '10.69.109.160', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (69, 'Glowwer', 'e4ca5ca1b99cb4c975557a99dac9a95bb7eb06ca', 1, 'fghfgh@gmail.com', '2-4-1996', '25-02-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '25-02-2018 15:41:06', NULL, NULL, 0, NULL, '10.69.110.126', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 161, 25, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (70, 'juico', 'ebaf18f5c32e964b386ec01ecf0570a6d3802980', 1, 'juicooooooooo@gmail.com', '3-4-2007', '16-03-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4980, 100, '1', '16-03-2018 21:20:12', NULL, NULL, 0, NULL, '10.45.100.228', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (71, 'qweasdzxc4564545', '5528028eff3ada0d9dc92d0dd23fb12c04e7c11d', 1, 'qweqweqwe123123123@qweqwe.com', '1-4-1958', '20-03-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '20-03-2018 08:05:12', NULL, NULL, 0, NULL, '10.5.207.142', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (72, 'stownizi', 'b1958ae168d64232bb3dedc9ba5c0f22bcf41a1f', 2, 'alan@gmail.com', '3-4-2001', '25-04-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4980, 100, '0', '26-04-2018 15:43:34', NULL, NULL, 0, NULL, '10.51.175.26', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (73, 'namabo', 'fd12d9aba952eaf6c88a2bff5fd8ed687ad61f5b', 1, 'dudunas@gmail.com', '3-4-2001', '02-05-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '02-05-2018 19:43:36', NULL, NULL, 0, NULL, '10.142.195.245', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (74, 'namabs', '4e62a9c8495c4540eb352f3ccc512ee624c30db3', 1, 'nanams@gmail.com', '4-3-2000', '02-05-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '02-05-2018 19:59:50', NULL, NULL, 0, NULL, '10.142.180.61', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (75, 'rtiag0', 'daa53cdf0084c6f5e07e287947a6d241e6fee53d', 2, 'rtiag0@outlook.com', '3-8-2007', '23-05-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4900, 100, '0', '23-05-2018 17:12:27', NULL, NULL, 1, NULL, '10.13.221.137', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (76, 'Jean', 'b71b50db6cda6c7645584f044dae7428b25ac2f1', 1, 'jeanropke@ymail.com', '12-3-1949', '14-06-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '14-06-2018 02:01:53', NULL, NULL, 0, NULL, '10.41.206.209', 1, 8388607, 0, 0, NULL, NULL, NULL, 3, 163, 14, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (77, 'holoryzonender', '1ebdc038eeb5fca5f20df23b165a82fabd930040', 2, 'ryzonender@gmail.com', '31-10-2002', '15-06-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4980, 100, '0', '15-06-2018 14:28:52', NULL, NULL, 0, 'ST-145071-61255864509097223274-holo-fe3', '10.97.211.167', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 164, 15, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (78, 'phprewrite', 'df77d6bd84aed8e296a3f255e3a1cce3e591e704', 2, 'rvx@openholo.net', '4-6-2004', '15-06-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4958, 100, '0', '15-06-2018 15:57:35', NULL, NULL, 1, NULL, '10.181.69.210', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 165, 15, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (79, 'frank', 'c6c8b1a0d76aa9aa88e1772b1de43a0e5df36fa2', 2, 'frank@teucu.com', '1-1-1995', '24-06-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', 'dfsfsdf', NULL, 4980, 100, '0', '24-06-2018 19:21:09', NULL, NULL, 1, 'ST-652332-28142926702513637934-holo-fe4', '10.65.52.34', 1, 8388607, 0, 0, NULL, NULL, NULL, 3, 166, 24, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (80, 'cacata', '9b559b40fc312fb61b88d6f596490f414b468efe', 1, 'cacata@de.de', '5-4-1972', '24-06-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '24-06-2018 22:33:45', NULL, NULL, 0, 'ST-461914-29762891615768554688-holo-fe2', '10.7.140.114', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 167, 24, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (81, 'nepe33', '70878c531d059724642c34822d7cd0a46d6d1919', 1, 'pene@pene.com', '12-2-2000', '03-07-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '03-07-2018 13:47:37', NULL, NULL, 0, 'ST-999117-12699689323391481997-holo-fe3', '10.186.178.253', 1, 8388607, 0, 0, NULL, NULL, NULL, 4, 168, 3, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (82, 'Leooo', 'abadb8f270d75f7ed5af7033db2d186f9b16b63f', 1, 'leoo@gmail.com', '10-10-1990', '03-07-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '03-07-2018 18:23:24', NULL, NULL, 1, NULL, '10.13.156.79', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (83, 'Claushgg', '6729299e5f6e3f0243f3b6036a9fc0a832d6df16', 2, 'doomgd@fghj.com', '4-7-2000', '03-07-2018', 'hr-165-.hd-185-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4920, 100, '0', '03-07-2018 19:20:51', NULL, NULL, 0, 'ST-685279-72333156361050857646-holo-fe3', '10.81.225.141', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (84, 'demo', '9226e50b81bc9f4c9dda6c5c71648f9814d1fa5c', 1, 'info@sulake.com', '1-1-1990', '03-07-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '03-07-2018 20:48:27', NULL, NULL, 0, NULL, '10.61.167.239', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (85, 'jack', '177bd5c1fd04ca7f4aef9e322ed3123ddf3ce347', 1, 'j@f.com', '6-3-2006', '03-07-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 5000, 100, '1', '03-07-2018 21:30:21', NULL, NULL, 0, 'ST-740539-26733854437597160271-holo-fe5', '10.111.200.83', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 0, '', 0, 0, 0, 0, 0);
INSERT INTO `users` VALUES (86, 'Penezolano', '32a785f53607b3a1ce8b91fe0289b87602614ae3', 2, 'sdas@skd.com', '5-10-2002', '03-07-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', NULL, NULL, 4980, 100, '0', '03-07-2018 22:45:30', NULL, NULL, 0, 'ST-132026-00884193933169343526-holo-fe3', '10.45.41.181', 1, 0, 0, 0, NULL, NULL, NULL, 1, 172, 3, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (87, 'Vernichtungsgedanke', 'd7ad939dff56745b184c19717b64b001086fc622', 2, 'ver.@mail.es', '15-1-1994', '04-07-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', 'crikey', NULL, 4960, 100, '0', '04-07-2018 00:24:12', NULL, NULL, 0, 'ST-694367-00029033000212374596-holo-fe1', '10.123.227.73', 1, 8388607, 0, 0, NULL, NULL, NULL, 3, 173, 4, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (88, 'hacker', '425b77928fe1d04864a4cb01eb41b4f5b7b91e26', 1, 'hacker@gmail.com', '2-2-1991', '04-07-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', 'Wow!', NULL, 5000, 100, '1', '04-07-2018 03:06:00', NULL, NULL, 0, NULL, '10.37.157.4', 0, 8388607, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '', 0, 0, 0, 1, 0);
INSERT INTO `users` VALUES (89, 'gsegseg@eg.fr', '0cc2481ab563811a5c5745d5696783dc64a7b991', 1, 'gsegseg@eg.fr', '3-3-1999', '04-07-2018', 'hr-100-.hd-180-1.ch-210-66.lg-285-81.sh-290-77', 'M', '55', NULL, 5000, 100, '1', '04-07-2018 14:20:31', NULL, NULL, 0, 'ST-867104-22478363148854074374-holo-fe4', '10.29.242.27', 1, 8388607, 0, 0, NULL, NULL, NULL, 1, 174, 4, 1, NULL, 0, '', 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for users_badges
-- ----------------------------
DROP TABLE IF EXISTS `users_badges`;
CREATE TABLE `users_badges` (
  `userid` int(15) NOT NULL,
  `badgeid` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `iscurrent` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`badgeid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of users_badges
-- ----------------------------
BEGIN;
INSERT INTO `users_badges` VALUES (1, 'HC1', '0');
INSERT INTO `users_badges` VALUES (1, 'HC2', '0');
INSERT INTO `users_badges` VALUES (3, 'HC1', '1');
INSERT INTO `users_badges` VALUES (5, 'HC1', '1');
INSERT INTO `users_badges` VALUES (8, '', '0');
INSERT INTO `users_badges` VALUES (15, 'HC1', '1');
INSERT INTO `users_badges` VALUES (17, 'HC1', '1');
INSERT INTO `users_badges` VALUES (34, '', '0');
INSERT INTO `users_badges` VALUES (6, 'HC1', '1');
INSERT INTO `users_badges` VALUES (39, 'HC1', '1');
INSERT INTO `users_badges` VALUES (40, 'HC1', '1');
INSERT INTO `users_badges` VALUES (44, 'HC1', '1');
INSERT INTO `users_badges` VALUES (45, 'HC1', '1');
INSERT INTO `users_badges` VALUES (48, 'HC1', '1');
INSERT INTO `users_badges` VALUES (50, 'HC1', '1');
INSERT INTO `users_badges` VALUES (41, 'HC1', '1');
INSERT INTO `users_badges` VALUES (68, 'HC1', '1');
INSERT INTO `users_badges` VALUES (72, 'HC1', '1');
INSERT INTO `users_badges` VALUES (75, 'HC1', '1');
INSERT INTO `users_badges` VALUES (77, 'HC1', '1');
INSERT INTO `users_badges` VALUES (78, 'HC1', '1');
INSERT INTO `users_badges` VALUES (79, 'HC1', '1');
INSERT INTO `users_badges` VALUES (4, '', '0');
INSERT INTO `users_badges` VALUES (83, 'HC1', '1');
INSERT INTO `users_badges` VALUES (86, 'HC1', '1');
INSERT INTO `users_badges` VALUES (87, 'HC1', '1');
COMMIT;

-- ----------------------------
-- Table structure for users_bans
-- ----------------------------
DROP TABLE IF EXISTS `users_bans`;
CREATE TABLE `users_bans` (
  `userid` varchar(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ipaddress` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `date_expire` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `descr` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for users_club
-- ----------------------------
DROP TABLE IF EXISTS `users_club`;
CREATE TABLE `users_club` (
  `userid` bigint(6) NOT NULL,
  `months_expired` int(4) DEFAULT NULL,
  `months_left` int(4) DEFAULT NULL,
  `date_monthstarted` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of users_club
-- ----------------------------
BEGIN;
INSERT INTO `users_club` VALUES (72, 0, 1, '25-04-2018');
INSERT INTO `users_club` VALUES (68, 0, 1, '24-02-2018');
INSERT INTO `users_club` VALUES (78, 0, 1, '15-06-2018');
INSERT INTO `users_club` VALUES (77, 0, 1, '15-06-2018');
INSERT INTO `users_club` VALUES (40, 0, 6, '15-09-2017');
INSERT INTO `users_club` VALUES (50, 0, 6, '06-02-2018');
INSERT INTO `users_club` VALUES (75, 0, 6, '23-05-2018');
INSERT INTO `users_club` VALUES (79, 0, 1, '24-06-2018');
INSERT INTO `users_club` VALUES (1, 0, 3, '03-07-2018');
INSERT INTO `users_club` VALUES (83, 0, 6, '03-07-2018');
INSERT INTO `users_club` VALUES (86, 0, 1, '03-07-2018');
INSERT INTO `users_club` VALUES (87, 0, 1, '04-07-2018');
COMMIT;

-- ----------------------------
-- Table structure for users_favouriterooms
-- ----------------------------
DROP TABLE IF EXISTS `users_favouriterooms`;
CREATE TABLE `users_favouriterooms` (
  `userid` int(10) NOT NULL,
  `roomid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for users_recycler
-- ----------------------------
DROP TABLE IF EXISTS `users_recycler`;
CREATE TABLE `users_recycler` (
  `userid` int(10) NOT NULL,
  `session_started` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `session_reward` int(10) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers` (
  `voucher` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `type` enum('item','credits') COLLATE latin1_general_ci NOT NULL DEFAULT 'credits',
  `credits` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`voucher`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for wordfilter
-- ----------------------------
DROP TABLE IF EXISTS `wordfilter`;
CREATE TABLE `wordfilter` (
  `word` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
