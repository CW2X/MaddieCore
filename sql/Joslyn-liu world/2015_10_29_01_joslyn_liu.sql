-- a temp fix for deathgrip, this makes grip pull the target quicker and not high up in the air.

INSERT INTO `world`.`spell_linked_spell` 
	(`spell_trigger`, 
	`spell_effect`, 
	`type`, 
	`comment`
	)
	VALUES
	('49576', 
	'30010', 
	'0', 
	'DK grip temp fix'
	);