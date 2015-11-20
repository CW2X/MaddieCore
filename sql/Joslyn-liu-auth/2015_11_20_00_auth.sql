-- RBAC for reloading creature_template, creature_template_addon and item_template.

INSERT INTO `rbac_permissions` VALUES 
(1020, 'reload item_template'),
(1021, 'reload creature_template'),
(1022, 'reload creature_template_addon'),
(1023, 'reload gameobject_template');

INSERT INTO `rbac_linked_permissions` VALUES
(192, 1020),
(192, 1021),
(192, 1022),
(192, 1023);
