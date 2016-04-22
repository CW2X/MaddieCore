 -- Move copper ore vein that was in the center of a cave.
 
DELETE FROM `gameobject` WHERE `guid` = '4979' ;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`, `size`) VALUES('4979','1731','0','0','0','1','1','381.478','1049.26','105.797','2.618','0','0','0.965926','0.258819','900','100','1','0','-1');
