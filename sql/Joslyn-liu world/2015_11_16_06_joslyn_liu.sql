-- Spawn Dark Iron Mole Machine Reckage, lets you turn in the quest and get the "Down With Dark Iron Achivement".


DELETE FROM `world`.`gameobject` 
	WHERE
	`guid` = '9365271' ;

DELETE FROM `world`.`gameobject` 
	WHERE
	`guid` = '9365272' ;

INSERT  INTO `gameobject`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`,`size`) VALUES (9365271,189989,0,0,0,1,1,-5163.4,-594.742,398.149,2.17209,0,0,0.884791,0.465989,300,0,1,0,-1),(9365272,189990,1,0,0,1,1,1202.43,-4305.15,21.2285,1.83768,0,0,0.794897,0.606745,300,0,1,0,-1);

