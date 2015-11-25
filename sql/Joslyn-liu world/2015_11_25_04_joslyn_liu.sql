-- delete double spawned blood elf commoners (pilgrims bounty) in dalaran

DELETE FROM `world`.`creature` 
	WHERE
	`guid` = '142235' ;

DELETE FROM `world`.`creature` 
	WHERE
	`guid` = '142236' ;

