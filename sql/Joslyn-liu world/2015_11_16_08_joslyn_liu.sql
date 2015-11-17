
-- Temp fix for Sentry Totem

DELETE FROM `world`.`spell_linked_spell` 
	WHERE
	`spell_trigger` = '6277'  ;


INSERT INTO `world`.`spell_linked_spell` 
	(`spell_trigger`, 
	`spell_effect`, 
	`type`, 
	`comment`
	)
	VALUES
	('6277', 
	'6277', 
	'0', 
	'Sentry Totem Temp Fix'
	);
