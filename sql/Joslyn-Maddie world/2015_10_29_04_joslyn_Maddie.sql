-- respawn jumping kobalds in elwynn forest

DELETE FROM `creature` 
	WHERE
	`guid` = '80601' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80582' ;


DELETE FROM `creature` 
	WHERE
	`guid` = '80976' ;


insert  into `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) values (15001311,475,0,0,0,1,1,0,1,-9820.62,181.998,22.823,1.38905,300,0,0,102,0,0,0,0,0,0,-1),(15001312,475,0,0,0,1,1,0,1,-9845.17,198.786,14.2127,1.84851,300,0,0,120,0,0,0,0,0,0,-1),(15001315,40,0,0,0,1,1,0,1,-9170,-597.557,62.5957,0.917668,300,0,0,137,0,0,0,0,0,0,-1);

