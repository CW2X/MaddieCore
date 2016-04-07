
-- Move signs in stormwind, placement was driving me insane.


DELETE FROM `gameobject` 
	WHERE
	`guid` = '26336' ;

DELETE FROM `gameobject` 
	WHERE
	`guid` = '26335' ;

DELETE FROM `gameobject` 
	WHERE
	`guid` = '26338' ;

DELETE FROM `gameobject` 
	WHERE
	`guid` = '26416' ;

DELETE FROM `gameobject` 
	WHERE
	`guid` = '26417' ;

INSERT  INTO `gameobject`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`,`size`) VALUES (9365347,2124,0,0,0,1,1,-8800.52,580.602,96.7459,0.625401,0,0,0.307629,0.951506,300,0,1,0,-1),(9365348,2119,0,0,0,1,1,-8750.38,550.322,97.5632,4.05789,0,0,0.896874,-0.442286,300,0,1,0,-1),(9365351,2115,0,0,0,1,1,-8752.42,551.973,97.5868,0.82537,0,0,0.40107,0.916047,300,0,1,0,-1),(9365352,28036,0,0,0,1,1,-8752.45,551.908,96.684,0.916297,0,0,0.442288,0.896873,300,0,1,0,-1),(9365376,2115,0,0,0,1,1,-8723.86,517.518,96.7155,0.637046,0,0,0.313164,0.949699,300,0,1,0,-1),(9365377,28041,0,0,0,1,1,-8723.89,517.549,95.9667,0.637046,0,0,0.313164,0.949699,300,0,1,0,-1);
