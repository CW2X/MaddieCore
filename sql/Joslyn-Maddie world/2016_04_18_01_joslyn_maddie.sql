-- move a Mottled Worg, was in a tree.

DELETE FROM `creature` 
	WHERE
	`guid` = '17952' ;

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`, `size`) VALUES('17952','1766','0','0','0','1','1','246','0','1030.87','1483.5','38.0906','2.43867','275','5','0','222','0','1','0','0','0','0','-1');
