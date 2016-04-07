-- delete double spawned kobald worker.

DELETE FROM `world`.`creature` 
	WHERE
	`guid` = '80089' ;
