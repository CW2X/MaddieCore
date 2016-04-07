-- delete jumping kobald laborer in northshire.

DELETE FROM `world`.`creature` 
	WHERE
	`guid` = '80075' ;


insert  into `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) values (15001471,80,0,0,0,1,1,0,1,-8611.24,-170.528,85.4622,4.87671,300,0,0,71,0,0,0,0,0,0,-1);

