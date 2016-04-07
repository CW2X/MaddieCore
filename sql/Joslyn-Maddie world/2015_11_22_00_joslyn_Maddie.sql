-- make hogger less nasty for solo play, just barely beat him on a lvl 10 prot pally in full boa gear..
UPDATE `world`.`creature_template` 
	SET
	 `DamageModifier` = '1.2' 
	
	
	WHERE
	`entry` = '448' ;



-- respawn knolls that where jumping all around.


DELETE FROM `creature` 
	WHERE
	`guid` = '80499' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80500' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80501' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80506' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80508' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80526' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80523' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80525' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80512' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80513' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80514' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80521' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80520' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80518' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80534' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80535' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80536' ;


insert  into `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) values (15001486,97,0,0,0,1,1,0,1,-9944.78,616.6,37.2241,3.06542,300,0,0,176,0,0,0,0,0,0,-1),(15001487,478,0,0,0,1,1,0,1,-9949.3,615.854,37.208,0.995892,300,0,0,198,0,0,0,0,0,0,-1),(15001488,478,0,0,0,1,1,0,1,-9948.11,623.198,37.2089,5.16244,300,0,0,176,0,0,0,0,0,0,-1),(15001489,97,0,0,0,1,1,0,1,-9933.47,573.181,36.9081,1.82842,300,0,0,156,0,0,0,0,0,0,-1),(15001490,97,0,0,0,1,1,0,1,-9931.04,579.02,37.2968,3.37958,300,0,0,156,0,0,0,0,0,0,-1),(15001491,478,0,0,0,1,1,0,1,-9986.38,571.261,37.6629,5.43338,300,0,0,198,0,0,0,0,0,0,-1),(15001492,97,0,0,0,1,1,0,1,-9983.78,575.101,37.6629,5.02498,300,0,0,156,0,0,0,0,0,0,-1),(15001494,97,0,0,0,1,1,0,1,-10007.7,658.524,36.1668,0.422543,300,0,0,156,0,0,0,0,0,0,-1),(15001493,478,0,0,0,1,1,0,1,-9981.32,563.357,37.6629,1.2747,300,0,0,176,0,0,0,0,0,0,-1),(15001495,478,0,0,0,1,1,0,1,-10002.2,656.235,36.4245,1.69882,300,0,0,198,0,0,0,0,0,0,-1),(15001496,478,0,0,0,1,1,0,1,-10005.5,663.619,35.726,5.21739,300,0,0,198,0,0,0,0,0,0,-1),(15001497,478,0,0,0,1,1,0,1,-10070.6,633.418,39.2644,5.72004,300,0,0,176,0,0,0,0,0,0,-1),(15001498,478,0,0,0,1,1,0,1,-10071.2,629.052,39.2644,0.0416004,300,0,0,198,0,0,0,0,0,0,-1),(15001499,97,0,0,0,1,1,0,1,-10062,625.793,39.2644,2.07186,300,0,0,176,0,0,0,0,0,0,-1),(15001500,97,0,0,0,1,1,0,1,-10106.7,690.496,31.8971,3.60338,300,0,0,176,0,0,0,0,0,0,-1),(15001501,478,0,0,0,1,1,0,1,-10109.9,692.566,31.8954,4.16887,300,0,0,198,0,0,0,0,0,0,-1),(15001502,478,0,0,0,1,1,0,1,-10117.6,686.417,31.8954,6.28158,300,0,0,198,0,0,0,0,0,0,-1);
