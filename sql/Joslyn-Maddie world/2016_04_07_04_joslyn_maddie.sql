-- Respawn Wretched Hooligans falling though the floor

DELETE FROM `creature` 	WHERE `guid` = '56755' ;
DELETE FROM `creature` 	WHERE `guid` = '56759' ;
DELETE FROM `creature` 	WHERE `guid` = '56770' ;
DELETE FROM `creature` 	WHERE `guid` = '56756' ;

INSERT  INTO `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) VALUES (15001531,15644,530,0,0,1,1,0,1,9830.5,-6678.63,2.99845,5.91414,300,0,0,83,104,0,0,0,0,0,-1); 
INSERT  INTO `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) VALUES (15001532,15644,530,0,0,1,1,0,1,9806.09,-6694.4,2.59231,3.64434,300,0,0,98,115,0,0,0,0,0,-1);
INSERT  INTO `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) VALUES (15001533,15644,530,0,0,1,1,0,1,9808.02,-6729,19.1896,1.75547,300,0,0,83,104,0,0,0,0,0,-1);
INSERT  INTO `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) VALUES (15001539,16162,530,0,0,1,1,0,1,8770.82,-6177.82,6.92961,0.654643,300,0,0,115,126,0,0,0,0,0,-1);









