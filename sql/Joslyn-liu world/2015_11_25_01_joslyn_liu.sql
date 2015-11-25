-- Dawnblade HawkRiders casted WAY to often, and attacked players/npcs. should only attack players from what I remember of TBC.

-- Should not be able to come down and attack npc's
UPDATE `creature_template` SET `flags_extra` = 2 WHERE (entry = 25063);

-- "Fix" the spam casting and player targeting.
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 25063;

DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 25063);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(25063, 0, 0, 0, 10, 0, 30, 0, 0, 70, 20000, 20000, 11, 45189, 0, 0, 0, 0, 0, 19, 24938, 0, 0, 0, 0, 0, 0, 'Dawnblade Hawkrider - Within 0-70 Range Out of Combat LoS - Cast \'Dawnblade Attack\''),
(25063, 0, 1, 0, 10, 0, 30, 0, 0, 70, 20000, 20000, 11, 45189, 0, 0, 0, 0, 0, 19, 24994, 0, 0, 0, 0, 0, 0, 'Dawnblade Hawkrider - Within 0-70 Range Out of Combat LoS - Cast \'Dawnblade Attack\''),
(25063, 0, 2, 0, 10, 0, 30, 0, 0, 70, 20000, 20000, 11, 45189, 0, 0, 0, 0, 0, 19, 26253, 0, 0, 0, 0, 0, 0, 'Dawnblade Hawkrider - Within 0-70 Range Out of Combat LoS - Cast \'Dawnblade Attack\''),
(25063, 0, 3, 0, 10, 0, 30, 0, 0, 70, 20000, 20000, 11, 45189, 0, 0, 0, 0, 0, 19, 25046, 0, 0, 0, 0, 0, 0, 'Dawnblade Hawkrider - Within 0-70 Range Out of Combat LoS - Cast \'Dawnblade Attack\''),
(25063, 0, 4, 0, 10, 0, 30, 0, 0, 70, 20000, 20000, 11, 45189, 0, 0, 0, 0, 0, 19, 25115, 0, 0, 0, 0, 0, 0, 'Dawnblade Hawkrider - Within 0-70 Range Out of Combat LoS - Cast \'Dawnblade Attack\''),
(25063, 0, 5, 0, 10, 0, 30, 0, 0, 70, 20000, 20000, 11, 45189, 0, 0, 0, 0, 0, 19, 25108, 0, 0, 0, 0, 0, 0, 'Dawnblade Hawkrider - Within 0-70 Range Out of Combat LoS - Cast \'Dawnblade Attack\'');
