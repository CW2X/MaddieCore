-- a temp fix for deathgrip, creatures could still cast when being gripped. should not happen.

INSERT INTO `world`.`spell_linked_spell` 
	(`spell_trigger`, 
	`spell_effect`, 
	`type`, 
	`comment`
	)
	VALUES
	('49576', 
	'61381', 
	'0', 
	'DK grip temp fix interupt'
	);


