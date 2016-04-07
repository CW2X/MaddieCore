-- spawn direbrew family for brewfest lfg.
UPDATE `world`.`lfg_dungeon_template` 
	SET
	`dungeonId` = '287' , 
	`name` = 'Coren Direbrew' , 
	`position_x` = '907.070618' , 
	`position_y` = '-157.495895' , 
	`position_z` = '-49.759392' , 
	`orientation` = '2.089451' , 
	`VerifiedBuild` = '0'
	
	WHERE
	`dungeonId` = '287' ;


UPDATE `world`.`creature_template` 
	SET
	
	`faction` = '14',
	`flags_extra` = '0'   
	
	WHERE
	`entry` = 23872 ;


DELETE FROM `creature` 
	WHERE
	`guid` = 15001479 ;
	
DELETE FROM `creature` 
        WHERE
	`guid` = 15001480 ; 
DELETE FROM `creature` 
        WHERE
	`guid` = 15001483 ;

INSERT  INTO `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) VALUES (15001479,23872,230,0,0,1,1,0,1,891.385,-130.234,-49.746,5.23568,300,0,0,295338,0,0,0,0,0,0,-1),(15001480,26822,230,0,0,1,1,0,1,887.867,-131.59,-49.7449,5.5302,300,0,0,36918,0,0,0,0,0,0,-1),(15001483,26764,230,0,0,1,1,0,1,894.981,-128.349,-49.7447,5.23104,300,0,0,34657,0,0,0,0,0,0,-1);



DELETE FROM `world`.`game_event_creature` 
	WHERE
	`guid` = '15001479' ;

DELETE FROM `world`.`game_event_creature` 
	WHERE
	`guid` = '15001480' ;
	
DELETE FROM `world`.`game_event_creature` 
	WHERE
	`guid` = '15001483' ;	
	
INSERT INTO `world`.`game_event_creature` 
	(`eventEntry`, 
	`guid`
	)
	VALUES
	('24', 
	'15001479'
	);
	
INSERT INTO `world`.`game_event_creature` 
	(`eventEntry`, 
	`guid`
	)
	VALUES
	('24', 
	'15001480'
	);
	
INSERT INTO `world`.`game_event_creature` 
	(`eventEntry`, 
	`guid`
	)
	VALUES
	('24', 
	'15001483'
	);		
