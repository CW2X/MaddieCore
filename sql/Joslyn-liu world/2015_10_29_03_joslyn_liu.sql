-- respawned jumping kobalds in northshire

DELETE FROM `creature` 
	WHERE
	`guid` = '80060' ;

DELETE FROM `creature` 
	WHERE
	`guid` = '80059' ;


DELETE FROM `creature` 
	WHERE
	`guid` = '80057' ;


insert  into `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) values (15001146,257,0,0,0,1,1,0,1,-8679.62,-113.652,90.9866,4.08015,300,0,0,71,0,0,0,0,0,0,-1),(15001147,257,0,0,0,1,1,0,1,-8668.91,-119.683,92.1768,5.74126,300,0,0,71,0,0,0,0,0,0,-1),(15001149,257,0,0,0,1,1,0,1,-8685.38,-127.791,90.4827,2.14805,300,0,0,71,0,0,0,0,0,0,-1);
