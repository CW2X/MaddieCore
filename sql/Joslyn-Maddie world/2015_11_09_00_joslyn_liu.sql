-- fix smartai db error for Knot Thimblejack

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14338;