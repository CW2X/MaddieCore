-- delete an "Unleashed Hellion" on the Isle of Quel'Danas. 
-- caused problems with shattered sun senterys

DELETE FROM `world`.`creature` 
	WHERE
	`guid` = '93982' ;
