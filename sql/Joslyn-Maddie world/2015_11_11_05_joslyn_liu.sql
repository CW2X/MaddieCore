-- respawn jumping kobald laborer in northshire.

DELETE FROM `world`.`creature` 
	WHERE
	`guid` = '80066' ;


insert  into `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) values (15001473,80,0,0,0,1,1,0,1,-8641.75,-144.976,86.796,1.56232,300,0,0,71,0,0,0,0,0,0,-1);

