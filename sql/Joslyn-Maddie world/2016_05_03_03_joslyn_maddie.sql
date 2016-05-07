-- cherrypicks from Sunwellcores item.sql
-- Some still need work.

-- Steam Tonk Controller (22728)
-- Battered Steam Tonk Controller (31666)
UPDATE creature_template SET spell1=24933, spell2=25024, spell3=0, spell4=27746 WHERE entry=19405; -- Steam Tonk
UPDATE creature_template SET unit_flags=4|131072, flags_extra=2, AIName='SmartAI', ScriptName='' WHERE entry=15368; -- Tonk Mine
DELETE FROM smart_scripts WHERE entryorguid=15368 AND source_type=0;
INSERT INTO smart_scripts VALUES (15368, 0, 0, 1, 60, 0, 100, 0, 3000, 3000, 1, 1, 11, 25099, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell'); -- 3 sec arming time
INSERT INTO smart_scripts VALUES (15368, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Despawn Self');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry IN(24933, 25099, 27745);
INSERT INTO conditions VALUES(13, 1, 24933, 0, 0, 31, 0, 3, 19405, 0, 0, 0, 0, "", "Target Steam Tonk");
INSERT INTO conditions VALUES(13, 1, 25099, 0, 0, 31, 0, 3, 19405, 0, 0, 0, 0, "", "Target Steam Tonk");
INSERT INTO conditions VALUES(13, 1, 27745, 0, 0, 31, 0, 3, 19405, 0, 0, 0, 0, "", "Target Steam Tonk");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND sourceEntry=15368;
INSERT INTO conditions VALUES(22, 1, 15368, 0, 0, 29, 1, 19405, 2, 0, 0, 0, 0, "", "Requires Steam Tonk nearby");

-- Goblin Bomb Dispenser (10587), trinket
-- Explosive Sheep (4384)
UPDATE creature_template SET AIName="", ScriptName="npc_pet_gen_target_following_bomb" WHERE entry IN(2675, 8937); -- sheep, bomb

-- does not blow up, follows player.

-- Goblin Land Mine (4395)
DELETE FROM creature_text WHERE entry=7527;
INSERT INTO creature_text VALUES (7527, 0, 0, '%s will be armed in 10 seconds!', 16, 0, 100, 0, 0, 0,0,  0, 'Goblin Land Mine');
INSERT INTO creature_text VALUES (7527, 1, 0, '%s will be armed in 5 seconds!', 16, 0, 100, 0, 0, 0, 5871, 0, 'Goblin Land Mine');
INSERT INTO creature_text VALUES (7527, 2, 0, '%s is now armed!', 16, 0, 100, 0, 0, 0, 0, 0, 'Goblin Land Mine');
UPDATE creature_template SET unit_flags = unit_flags|4|131072, AIName='SmartAI', ScriptName='' WHERE entry=7527;
DELETE FROM smart_scripts WHERE entryorguid=7527 AND source_type=0;
INSERT INTO smart_scripts VALUES (7527, 0, 0, 1, 60, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goblin Land Mine - On Update - Say Line 0");
INSERT INTO smart_scripts VALUES (7527, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 11816, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goblin Land Mine - On Update - Cast Land Mine Arming");
INSERT INTO smart_scripts VALUES (7527, 0, 2, 0, 60, 0, 100, 1, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goblin Land Mine - On Update - Say Line 1");
INSERT INTO smart_scripts VALUES (7527, 0, 3, 4, 60, 0, 100, 1, 10000, 10000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goblin Land Mine - On Update - Say Line 2");
INSERT INTO smart_scripts VALUES (7527, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 28, 11816, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goblin Land Mine - On Update - Remove Aura Land Mine Arming");
INSERT INTO smart_scripts VALUES (7527, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goblin Land Mine - Out of Combat - Set Event Phase");
INSERT INTO smart_scripts VALUES (7527, 0, 6, 7, 9, 1, 100, 0, 0, 6, 0, 0, 11, 4043, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goblin Land Mine - Within 0-6 Range - Cast Spell");
INSERT INTO smart_scripts VALUES (7527, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goblin Land Mine - Within 0-6 Range - Despawn");

-- only explodes if your attacking a target, follows player.
 -- Sai for Explosive Sheep
    UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`  IN(2675);
    DELETE FROM `smart_scripts` WHERE `entryorguid` IN(2675) AND `source_type`=0;
    INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
    (2675, 0, 0, 0, 9,  0, 100, 1, 0, 1, 0, 0, 11, 4050 , 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Explosive Sheep - On Range - Cast Explosive sheep'),
    (2675, 0, 1, 0, 1,  0, 100, 1, 180000, 180000, 0, 0, 41, 0 , 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Explosive Sheep - OOC - Despawn');
    
    -- Vanquished Clutches of Yogg-Saron (46312)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry IN(34264, 34265, 34266);
DELETE FROM smart_scripts WHERE entryorguid IN(34264, 34265, 34266) AND source_type=0;
INSERT INTO smart_scripts VALUES (34264, 0, 0, 0, 0, 0, 100, 0, 2000, 3000, 4000, 4000, 11, 65038, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cast spell on current Victim');
INSERT INTO smart_scripts VALUES (34265, 0, 0, 0, 0, 0, 100, 0, 2000, 3000, 4000, 4000, 11, 65035, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cast spell on current Victim');
INSERT INTO smart_scripts VALUES (34266, 0, 0, 0, 0, 0, 100, 0, 2000, 3000, 4000, 4000, 11, 65033, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cast spell on current Victim');

-- Instant Statue Pedestal (54212)
UPDATE creature_template SET VehicleId=732, AIName='NullCreatureAI', ScriptName='' WHERE entry=40246;
DELETE FROM spell_linked_spell WHERE spell_trigger IN(74890, 75731, -75731);
INSERT INTO spell_linked_spell VALUES(74890, 75055, 1, 'Instant Statue Pedestal');
INSERT INTO spell_linked_spell VALUES(-75731, -75055, 0, 'Instant Statue Pedestal');

-- Foror's Fabled Steed (20221)
REPLACE INTO item_template VALUES (20221, 15, 5, -1, "Foror\'s Fabled Steed", 32728, 5, 0, 0, 1, 0, 0, 0, -1, -1, 40, 40, 762, 150, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55884, 0, -1, 0, -1, 330, 3000, 24576, 6, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Teaches you how to summon this mount.  This is a very fast mount.', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1);


-- Blackblade of Shahram (12592)
DELETE FROM disables WHERE sourceType=0 AND entry=16602;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=10718;
DELETE FROM smart_scripts WHERE entryorguid=10718 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(10718*100, 10718*100+1, 10718*100+2, 10718*100+3, 10718*100+4, 10718*100+5) AND source_type=9;
INSERT INTO smart_scripts VALUES (10718, 0, 0, 1, 60, 0, 100, 1, 1000, 1000, 0, 0, 41, 20000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shahram - On Update - Despawn in 20secs');
INSERT INTO smart_scripts VALUES (10718, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Shahram - On Update - Follow Owner');
INSERT INTO smart_scripts VALUES (10718, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 87, 10718*100, 10718*100+1, 10718*100+2, 10718*100+3, 10718*100+4, 10718*100+5, 1, 0, 0, 0, 0, 0, 0, 0, 'Shahram - On Update - Start Random Script');
INSERT INTO smart_scripts VALUES (10718*100+0, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 16597, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shahram - Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (10718*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 16600, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shahram - Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (10718*100+2, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 16601, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shahram - Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (10718*100+3, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 16599, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shahram - Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (10718*100+4, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 16598, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shahram - Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (10718*100+5, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 16596, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shahram - Script9 - Cast Spell');

-- Sylvanas' Music Box (52253)
SET @LAMENTER := 39048;
UPDATE `creature_template` SET `AIName`='SmartAI', `InhabitType`=4 WHERE `entry`=@LAMENTER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@LAMENTER AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@LAMENTER*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@LAMENTER, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @LAMENTER*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas'' Lamenter - On Summoned - Action list'),
(@LAMENTER*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 37090, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas'' Lamenter - Action list - Cast Lament of the Highborne: Highborne Aura'),
(@LAMENTER*100, 9, 1, 0, 0, 0, 100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sylvanas'' Lamenter - Action list - Set run off"),
(@LAMENTER*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 114, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas'' Lamenter - Action list - Rise up'),
(@LAMENTER*100, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 4, 15095, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas'' Lamenter - Action list - Play Sound Lament of the Highborne');

-- does not work yet, needs cpp
-- Fetch Ball (37431)
UPDATE creature_template SET AIName='', ScriptName='npc_pet_gen_fetch_ball' WHERE entry=27407;
DELETE FROM spell_script_names WHERE spell_id IN(48649);
INSERT INTO spell_script_names VALUES(48649, "spell_item_fetch_ball");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=48649;
INSERT INTO conditions VALUES(13, 1, 48649, 0, 0, 31, 0, 3, 7394, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 1, 31, 0, 3, 7547, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 2, 31, 0, 3, 7565, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 3, 31, 0, 3, 7383, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 4, 31, 0, 3, 21056, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 5, 31, 0, 3, 21010, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 6, 31, 0, 3, 7385, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 7, 31, 0, 3, 14421, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 8, 31, 0, 3, 20472, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 9, 31, 0, 3, 7562, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 10, 31, 0, 3, 32591, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 11, 31, 0, 3, 7395, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 12, 31, 0, 3, 7384, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 13, 31, 0, 3, 7567, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 14, 31, 0, 3, 7544, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 15, 31, 0, 3, 7543, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 16, 31, 0, 3, 23258, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 17, 31, 0, 3, 7545, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 18, 31, 0, 3, 28883, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 19, 31, 0, 3, 29147, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 20, 31, 0, 3, 21055, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 21, 31, 0, 3, 7553, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 22, 31, 0, 3, 7387, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 23, 31, 0, 3, 7555, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 24, 31, 0, 3, 7391, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 25, 31, 0, 3, 14878, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 26, 31, 0, 3, 12419, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 27, 31, 0, 3, 18839, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 28, 31, 0, 3, 20408, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 29, 31, 0, 3, 8376, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 30, 31, 0, 3, 2671, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 31, 31, 0, 3, 22445, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 32, 31, 0, 3, 7382, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 33, 31, 0, 3, 16085, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 34, 31, 0, 3, 32595, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 35, 31, 0, 3, 32592, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 36, 31, 0, 3, 21064, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 37, 31, 0, 3, 21009, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 38, 31, 0, 3, 7389, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 39, 31, 0, 3, 7380, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 40, 31, 0, 3, 21063, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 41, 31, 0, 3, 7381, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 42, 31, 0, 3, 23909, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 43, 31, 0, 3, 10598, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 44, 31, 0, 3, 7560, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 45, 31, 0, 3, 16547, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 46, 31, 0, 3, 16701, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 47, 31, 0, 3, 9662, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 48, 31, 0, 3, 23274, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 49, 31, 0, 3, 32589, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 50, 31, 0, 3, 32590, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 51, 31, 0, 3, 21008, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 52, 31, 0, 3, 7549, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 53, 31, 0, 3, 30379, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 54, 31, 0, 3, 16549, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 55, 31, 0, 3, 7386, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 56, 31, 0, 3, 21018, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 57, 31, 0, 3, 7550, 0, 0, 0, 0, "", "Target Non-Combat Pet");
INSERT INTO conditions VALUES(13, 1, 48649, 0, 58, 31, 0, 3, 10259, 0, 0, 0, 0, "", "Target Non-Combat Pet");

-- Blue Ogre Brew (32783)
-- Red Ogre Brew (32784)
-- Make them only usable in correct area.
DELETE FROM spell_area WHERE spell IN(41304, 41306);
INSERT INTO spell_area VALUES (41304, 3522, 0, 0, 0, 0, 2, 0, 0, 0);
INSERT INTO spell_area VALUES (41306, 3522, 0, 0, 0, 0, 2, 0, 0, 0);

-- Autumnal Acorn Ale (37497)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=27867;
DELETE FROM smart_scripts WHERE entryorguid=27867 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(27867*100, 27867*100+1, 27867*100+2) AND source_type=9;
INSERT INTO smart_scripts VALUES (27867, 0, 0, 1, 60, 0, 100, 1, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Squirel - On Update - Move Follow');
INSERT INTO smart_scripts VALUES (27867, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 87, 27867*100, 27867*100+1, 27867*100+2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Squirel - On Update - Random Action List');
INSERT INTO smart_scripts VALUES (27867*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 49757, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell Squirel Love Aura');
INSERT INTO smart_scripts VALUES (27867*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 46, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Move Forward');
INSERT INTO smart_scripts VALUES (27867*100+1, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 4000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Despawn');
INSERT INTO smart_scripts VALUES (27867*100+2, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 11, 49764, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell Squirel Hate');
INSERT INTO smart_scripts VALUES (27867*100+2, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Despawn');

-- Bartlett's Bitter Brew (37498)
DELETE FROM spell_linked_spell WHERE spell_trigger IN(49869, -49869, 24919, -24919, 49870, -49870);
INSERT INTO spell_linked_spell VALUES (-49869, 24919, 0, 'Nauseous - trigger Stun');
INSERT INTO spell_linked_spell VALUES (-24919, 49867, 0, 'Nauseous Stun - trigger vomit');
INSERT INTO spell_linked_spell VALUES (49870, 49869, 1, 'Slimed! - trigger Nauseous');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND sourceEntry=49869;
INSERT INTO conditions VALUES(17, 0, 49869, 0, 0, 1, 0, 50056, 0, 0, 1, 27, 0, "", "Allow cast on targets without 50056 aura");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=49870;
INSERT INTO conditions VALUES(13, 1, 49870, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, "", "Target all players");
INSERT INTO conditions VALUES(13, 1, 49870, 0, 0, 1, 0, 50056, 0, 0, 1, 0, 0, "", "Target units without 50056 aura");

-- Izzard's Ever Flavor (37489)
DELETE FROM spell_linked_spell WHERE spell_trigger IN(49864, -49864);
INSERT INTO spell_linked_spell VALUES (-49864, 49860, 0, 'Gassy - trigger BOTM Belch Visual');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=49862;
INSERT INTO conditions VALUES(13, 1, 49862, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, "", "Target all players");

-- Blackrock Lager (37493)
DELETE FROM spell_linked_spell WHERE spell_trigger IN(49738, -49738);
INSERT INTO spell_linked_spell VALUES (-49738, 49737, 0, 'BOTM - Fire Brew - Belch Fire Visual');

-- Stranglethorn Brew (37494)
DELETE FROM spell_linked_spell WHERE spell_trigger IN(49962, -49962);
INSERT INTO spell_linked_spell VALUES (49962, 50010, 0, 'BOTM - Jungle Brew - Jungle Madness Vision Effect');
REPLACE INTO creature_template_addon VALUES (27908, 0, 0, 0, 0, 0, '50008');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=27908;
DELETE FROM smart_scripts WHERE entryorguid=27908 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=27908*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (27908, 0, 0, 1, 54, 0, 100, 1, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Angry Jungle Gnome - Just Summoned - Set Orientation');
INSERT INTO smart_scripts VALUES (27908, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 27908*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Angry Jungle Gnome - Just Summoned - Script9');
INSERT INTO smart_scripts VALUES (27908*100, 9, 0, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 46, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Angry Jungle Gnome - Script9 - Move Forward');
INSERT INTO smart_scripts VALUES (27908*100, 9, 1, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 11, 49965, 0, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 'Angry Jungle Gnome - Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (27908*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 25, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Angry Jungle Gnome - Script9 - Play Emote');
INSERT INTO smart_scripts VALUES (27908*100, 9, 3, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, 11, 50048, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Angry Jungle Gnome - Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (27908*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 1200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Angry Jungle Gnome - Script9 - Despawn');

-- Plaguehound Cage (33221)
UPDATE item_template SET spellcooldown_1=60000 WHERE spellid_1=42769;

-- X-52 Rocket Helmet (30847)
DELETE FROM spell_linked_spell WHERE spell_trigger=37896;
INSERT INTO spell_linked_spell VALUES (37896, 37897, 1, 'X-52 Rocket Helmet - Trigger Parachute');

-- Ruby Sanctum items not disenchantable
UPDATE item_template SET DisenchantID=68 WHERE RequiredDisenchantSkill=375 AND entry > 53000 AND Quality=4 AND ItemLevel>=258 AND RequiredLevel=80;

-- Wrathful Gladiator's Frost Wyrm (50435)
REPLACE INTO item_template VALUES (50435, 15, 5, -1, 'Wrathful Gladiator''s Frost Wyrm', 59504, 4, 0, 0, 1, 2000000, 0, 0, -1, -1, 70, 70, 762, 300, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55884, 0, -1, 0, -1, 330, 3000, 71810, 6, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is an extremely fast mount.', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340);
