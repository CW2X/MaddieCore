-- quest "Fields of Grief" npc just stood there after turning into a zombie.

-- add smartAI name
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 1931;

-- Change faction after turns into zombie
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 1931);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1931, 0, 0, 0, 20, 0, 100, 0, 407, 0, 0, 0, 80, 193100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - On Quest \'Fields of Grief\' Finished - Run Script'),
(1931, 0, 1, 0, 23, 0, 100, 0, 3287, 1, 0, 0, 2, 67, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'set faction 67 on aura 3287');



-- change around some events so He says All lines before turning into a goul so they dont break on faction change.
DELETE FROM `smart_scripts` WHERE (source_type = 9 AND entryorguid = 193100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(193100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - On Script - Say Line 0'),
(193100, 9, 5, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 11, 3287, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - On Script - Cast \'Ghoul Form\''),
(193100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2292, 239.481, 27.0892, 0.693878, 'Captured Scarlet Zealot - On Script - Move To Position'),
(193100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2287.97, 236.253, 27.0892, 2.6613, 'Captured Scarlet Zealot - On Script - Move To Position'),
(193100, 9, 4, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - On Script - Say Line 1'),
(193100, 9, 6, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2292.52, 235.226, 27.0892, 4.8345, 'Captured Scarlet Zealot - On Script - Move To Position'),
(193100, 9, 7, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2288.96, 237.96, 27.0892, 2.48773, 'Captured Scarlet Zealot - On Script - Move To Position'),
(193100, 9, 8, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 11, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - On Script - Cast \'Death Touch\'');

-- remove civilian flag from npc 1931, couldn't attack him.


UPDATE `creature_template` SET `flags_extra` = '0' WHERE `entry` = '1931' ;
