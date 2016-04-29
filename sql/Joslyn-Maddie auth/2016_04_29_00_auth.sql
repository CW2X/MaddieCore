-- Barbershop command

INSERT INTO `rbac_permissions` 
	(`id`, 
	`name`
	)
	VALUES
	('799', 
	'Command: barbershop'
	);

INSERT INTO `rbac_linked_permissions` 
	(`id`, 
	`linkedId`
	)
	VALUES
	('192', 
	'799'
	);