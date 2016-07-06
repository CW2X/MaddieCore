-- TrinityJail Characters

DROP TABLE IF EXISTS `jail`;
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for jail
-- ----------------------------
CREATE TABLE `jail` (
  `guid` INT(11) UNSIGNED NOT NULL COMMENT 'GUID of the jail brother',
  `char` VARCHAR(13) NOT NULL COMMENT 'Jailed charname',
  `release` INT(11) UNSIGNED NOT NULL COMMENT 'Release time for the char',
  `amnestietime` INT(11) NOT NULL,
  `reason` VARCHAR(255) NOT NULL COMMENT 'Reason for the jail',
  `times` INT(11) UNSIGNED NOT NULL COMMENT 'How many times this char already was jailed',
  `gmacc` INT(11) UNSIGNED NOT NULL COMMENT 'Used GM acc to jail this char',
  `gmchar` VARCHAR(13) NOT NULL COMMENT 'Used GM char to jail this char',
  `lasttime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last time jailed',
  `duration` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Duration of the jail',
  PRIMARY KEY  (`guid`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COMMENT='Jail table for Trinitycore by WarHead Edited by SPGM';

-- ----------------------------
-- Records
-- ----------------------------
DROP TABLE IF EXISTS `jail_conf`;
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for jail_conf
-- ----------------------------

CREATE TABLE `jail_conf` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `obt` VARCHAR(50) DEFAULT NULL,
  `jail_conf` INT(11) DEFAULT NULL,
  `jail_tele` FLOAT DEFAULT NULL,
  `help_ger` VARCHAR(255) CHARACTER SET latin1 DEFAULT '',
  `help_enq` VARCHAR(255) DEFAULT '',
  PRIMARY KEY  (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `jail_conf` VALUES ('1', 'm_jailconf_max_jails', '3', NULL, 'Hier legst ihre fest nach wie fielen Jails der Char gelöscht werden \r\nStandart = 3\r\n ', 'How many time the characters can be Jailed before being deleted\r\nDefault = 3');
INSERT INTO `jail_conf` VALUES ('2', 'm_jailconf_max_duration', '672', NULL, 'Hier legst ihre fest wie hoch der maximale Jail Time in Stunden \r\nStandart = 672\r\n', 'Here put how high the maximum Jail Time in hours\r\nDefault = 672');
INSERT INTO `jail_conf` VALUES ('3', 'm_jailconf_min_reason', '25', NULL, 'Hier legst ihre die minimalen Zeichen fest die als Grund angeben müsst  \r\nStandart = 25\r\n\r\n', 'Here list how many characters are needed as the minimum reason\r\nDefault = 25');
INSERT INTO `jail_conf` VALUES ('4', 'm_jailconf_warn_player', '1', NULL, 'Hier legst ihre fest wann der Char gewarnt wirt  bevor er gelöscht wird \r\nStandart = 1\r\n', 'How many time to warn the player before jailing them\r\nDefault = 1');
INSERT INTO `jail_conf` VALUES ('5', 'm_jailconf_amnestie', '180', NULL, 'Hier legst ihre in Tagen fest wann der Jail Status  auf 0 zurückgesetzt wird   \r\nStandart = 180 Tage (das entspricht ca. ½ Jahr)  \r\n                     0  Tage (Aus)\r\n', 'This is how many in days when the Jail is status is set to 0\r\nStandard = 180 days (approximately ½ year)\r\n                     0 days (off)');
INSERT INTO `jail_conf` VALUES ('6', 'm_jailconf_ally_x', NULL, '31.7282', 'Teleport Alliance  X Achse \r\nStandart = 31,7282\r\n', 'Teleport Alliance  X Axis \r\nStandart = 31,7282\r\n');
INSERT INTO `jail_conf` VALUES ('7', 'm_jailconf_ally_y', NULL, '135.794', 'Teleport Alliance  Y Achse \r\nStandart = 135,794\r\n', 'Teleport Alliance  Y Axis \r\nStandart = 135,794\r\n');
INSERT INTO `jail_conf` VALUES ('8', 'm_jailconf_ally_z', NULL, '-40.0508', 'Teleport Alliance  Z Achse \r\nStandart = -40,0508', 'Teleport Alliance  Z Axis \r\nStandart = -40,0508');
INSERT INTO `jail_conf` VALUES ('9', 'm_jailconf_ally_o', NULL, '4.73516', 'Teleport Alliance  blickrichtung\r\nStandart = 4,73516', 'Teleport Alliance  Orientation\r\nStandart = 4,73516');
INSERT INTO `jail_conf` VALUES ('10', 'm_jailconf_ally_m', '35', NULL, 'Teleport Alliance  Mape\r\nStandart = 35', 'Teleport Alliance  Map\r\nStandart = 35');
INSERT INTO `jail_conf` VALUES ('11', 'm_jailconf_horde_x', NULL, '2179.85', 'Teleport Horde  X Achse \r\nStandart = \r\n', 'Teleport Horde  X Axis \r\nStandart = \r\n');
INSERT INTO `jail_conf` VALUES ('12', 'm_jailconf_horde_y', NULL, '-4763.96', 'Teleport Horde  Y Achse \r\nStandart = -4763,96', 'Teleport Horde  Y Axis \r\nStandart = -4763,96');
INSERT INTO `jail_conf` VALUES ('13', 'm_jailconf_horde_z', NULL, '54.911', 'Teleport Horde  Z Achse \r\nStandart = 54,911', 'Teleport Horde  Z Axis \r\nStandart = 54,911');
INSERT INTO `jail_conf` VALUES ('14', 'm_jailconf_horde_o', NULL, '4.44216', 'Teleport  Horde  blickrichtung\r\nStandart = 4,44216', 'Teleport  Horde  Orientation\r\nStandart = 4,44216');
INSERT INTO `jail_conf` VALUES ('15', 'm_jailconf_horde_m', '1', NULL, 'Teleport Horde  Mape\r\nStandart = 1', 'eleport Horde  Map\r\nStandart = 1');
INSERT INTO `jail_conf` VALUES ('16', 'm_jailconf_ban', '0', NULL, 'Nach wie vielen Jail soll der  Account Gebant werden\r\nStandart = 0  (aus)\r\n', 'After how many jails the account will be Banned\r\nDefault = 0 (off)');
INSERT INTO `jail_conf` VALUES ('17', 'm_jailconf_radius', '10', NULL, 'Legt den Bewegung Radius in Metern waren des Jails fest\r\nStandart = 10\r\n', 'Sets the range of motion in meters of the jail\r\nDefault = 10');
