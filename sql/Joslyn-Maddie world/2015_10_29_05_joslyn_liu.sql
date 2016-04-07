-- replace hogger sign with a working one, during wotlk both signs had the quest

DELETE FROM `gameobject` 
	WHERE
	`guid` = '26846' ;



insert  into `gameobject`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`,`size`) values (500223,68,0,0,0,1,1,-9749.42,682.543,27.0264,3.82604,0,0,0.942011,-0.335583,300,0,1,0,-1);
