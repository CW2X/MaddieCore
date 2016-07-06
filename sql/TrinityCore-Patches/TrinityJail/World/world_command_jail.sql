-- TrinityJail World command

DELETE FROM `command` WHERE NAME IN ('jail player','jail info''jail reload');
INSERT INTO `command` (NAME, permission, HELP) VALUES
('jail', 0, 'Syntax: .jail'),
('jail player', 1, 'Syntax: .jail player character hours reason\nJailed the \'character\' for \'hours\' with the \'reason\'.'),
('jail info', 1, 'Syntax: .jailinfo\nShows your jail status.'),
('jail reload', 3, 'Syntax: .jailreload\nLoads the jail config new.');