-- Respawn mana Wyrm
DELETE FROM `creature` WHERE `guid` = '54934' ;

INSERT  INTO `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) VALUES (15001525,15274,530,0,0,1,1,0,0,10213.9,-6351.84,30.8414,1.58928,300,0,0,41,60,0,0,0,0,0,-1);
