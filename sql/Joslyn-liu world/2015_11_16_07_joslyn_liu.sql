-- some brewfest things.

-- Misc.
DELETE FROM `gameobject` WHERE `id`=186881; -- Dark Iron Sabotage Plans were used for the event in 2007
DELETE FROM `game_event_gameobject` WHERE `guid` IN (11140,18015); -- Dark Iron Sabotage Plans
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|256 WHERE `entry`=23706; -- Gordok Festive Keg
UPDATE `creature_model_info` SET `BoundingRadius`=0.9,`CombatReach`=1.8,`gender`=2 WHERE `DisplayID`=24860; -- Gordok Festive Keg
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry` IN (23702,23700,23706,24373,24372); -- Festive Kegs










-- Fix the equipment templates of the brewers
DELETE FROM `creature_equip_template` WHERE `CreatureID`=2478;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`,`ItemID2`,`ItemID3`) VALUES
(2478,1,33161,33161,0);





-- Make the Dark Iron Mole Machine Wreckage give the quests
DELETE FROM `gameobject_queststarter` WHERE `id` IN (189990,189989);
INSERT INTO `gameobject_queststarter` (`id`,`quest`) VALUES
(189990,12192), -- Horde
(189989,12020); -- Alliance



-- Brewfest Chick Chucks Mug should also add an Complimentary Brewfest Sampler
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=42535 AND `spell_effect`=42518;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(42535,42518,1,'Brewfest Chick Chucks Mug should also add an Complimentary Brewfest Sampler');








-- [Q] [A/H] This One Time, When I Was Drunk...
-- Shouldn't be related to Chug and Chuck! quest at all
UPDATE `quest_template_addon` SET `PrevQuestId`=0 WHERE `ID`=12020;








-- Brewfest Reveler SAI
SET @ENTRY := 24484;
SET @SPELL_THROW_MUG := 50696;
SET @SPELL_CREATE_MUG := 42518;
SET @SPELL_TOAST := 41586;
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100,@ENTRY*100+1); -- We are adding new lines so don't remove complete SAI
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_CREATE_MUG,2,0,0,0,0,7,0,0,0,0,0,0,0,"Brewfest Reveler - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,22,0,100,0,34,5000,5000,0,11,@SPELL_TOAST,2,0,0,0,0,7,0,0,0,0,0,0,0,"Brewfest Reveler - Emote Receive 'Dance' - Cast Brewfest Toast"),
(@ENTRY,0,2,0,1,0,100,0,4000,11000,15000,20000,10,92,1,4,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - Out of Combat - Play Random Emote"),
-- Dun Morogh
(@ENTRY,0,3,0,38,0,100,0,2,2,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Data Set - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,53,1,@ENTRY,0,0,0,2,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Start WP"),
(@ENTRY*100,9,1,0,0,0,100,0,1000,5000,5000,5000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Say Line 0 (random)"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,11,@SPELL_THROW_MUG,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Cast Throw Mug"),
(@ENTRY,0,4,0,58,0,100,0,3,@ENTRY,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On WP 3 - Despawn"),
-- Durotar
(@ENTRY,0,5,0,38,0,100,0,3,3,0,0,80,@ENTRY*100+1,0,2,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Data Set - Run Script"),
(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,53,1,@ENTRY*10,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Start WP"),
(@ENTRY*100+1,9,1,0,0,0,100,0,1000,5000,5000,5000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Say Line 0 (random)"),
(@ENTRY*100+1,9,2,0,0,0,100,0,1000,3000,3000,3000,11,@SPELL_THROW_MUG,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Cast Throw Mug"),
(@ENTRY,0,6,0,58,0,100,0,4,@ENTRY*10,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On WP 4 - Despawn");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Dark Iron dwarves!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,1,"Run! It's the Dark Iron dwarves!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,2,"They're after the beer!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,3,"Someone has to save the beer!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,4,"If you value your beer, run for it!",12,0,100,0,0,0,"Brewfest Reveler");
-- Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY,@ENTRY*10);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
-- Dun Morogh
(@ENTRY,1,-5184.680176,-562.372009,397.260010,'Brewfest Reveler'),
(@ENTRY,2,-5192.152832,-547.358459,397.177094,'Brewfest Reveler'),
(@ENTRY,3,-5198.825684,-530.586243,392.940155,'Brewfest Reveler'),
-- Durotar
(@ENTRY*10,1,1209.775879,-4342.093750,21.295063,'Brewfest Reveler'),
(@ENTRY*10,2,1203.770874,-4356.925781,21.967909,'Brewfest Reveler'),
(@ENTRY*10,3,1202.042725,-4370.892578,24.852894,'Brewfest Reveler'),
(@ENTRY*10,4,1199.489868,-4389.286621,23.865566,'Brewfest Reveler');

-- Gordok Brew Barker SAI
SET @ENTRY := 23685;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-88864,-88955,@ENTRY);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Dun Morogh version
(-88864,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Gordok Brew Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(-88864,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 0 (random)"),
(-88864,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - On Data Set - Set Phase 1"),
(-88864,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Say Line 2 (random) (P1)"),
(-88864,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 1 (P1)"),
(-88864,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,-5149.791992,-590.198792,397.323730,4.39,"Gordok Brew Barker - On Text Over - Summon Super Brew Stein Trap (P1)"),
(-88864,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - On Data Set - Set Phase 0"), -- Event is over, so set phase 0

-- Durotar version
(-88955,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Gordok Brew Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(-88955,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 0 (random)"),
(-88955,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - On Data Set - Set Phase 1"),
(-88955,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Say Line 2 (random) (P1)"),
(-88955,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 1 (P1)"),
(-88955,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,1216.599976,-4284.270020,21.290300,3.787360,"Gordok Brew Barker - On Text Over - Summon Super Brew Stein Trap (P1)"),
(-88955,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"YOU TRY DA' BEST, NOW TRY DA' REST! OGRE BREW!",14,0,100,0,0,0,"Gordok Brew Barker"),
(@ENTRY,0,1,"HEY YOU! DRINK OGRE BREWS! MAKE YOU BIG AND STRONG!",14,0,100,0,0,0,"Gordok Brew Barker"),
(@ENTRY,0,2,"YOU WANT DRINK? WE GOT DRINK!",14,0,100,0,0,0,"Gordok Brew Barker"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Gordok Brew Barker");



-- Maeve Barleybrew SAI
SET @ENTRY := 23683;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Maeve Barleybrew - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Maeve Barleybrew - Out of Combat - Yell Line 0 (random)"),

(@ENTRY,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maeve Barleybrew - On Data Set - Set Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Maeve Barleybrew - Out of Combat - Say Line 2 (random) (P1)"),
(@ENTRY,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maeve Barleybrew - Out of Combat - Yell Line 1 (P1)"),
(@ENTRY,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,-5161.600586,-611.307861,397.917419,2.39,"Maeve Barleybrew - On Text Over - Summon Super Brew Stein Trap (P1)"),
(@ENTRY,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maeve Barleybrew - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Come try our Barleybrew Dark!",12,0,100,0,0,0,"Maeve Barleybrew"),
(@ENTRY,0,1,"Barleybrew, finest brewery in Azeroth!",12,0,100,0,0,0,"Maeve Barleybrew"),
(@ENTRY,0,2,"The Barleybrews have always been leaders in brewery innovation. Check out our newest creation, Barleybrew Clear!",12,0,100,0,0,0,"Maeve Barleybrew"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Maeve Barleybrew"),

(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,0,0,0,"Maeve Barleybrew"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,0,0,0,"Maeve Barleybrew");


-- Ita Thunderbrew SAI
SET @ENTRY := 23684;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Ita Thunderbrew - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Ita Thunderbrew - Out of Combat - Yell Line 0 (random)"),

(@ENTRY,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ita Thunderbrew - On Data Set - Set Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Ita Thunderbrew - Out of Combat - Say Line 2 (random) (P1)"),
(@ENTRY,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ita Thunderbrew - Out of Combat - Yell Line 1 (P1)"),
(@ENTRY,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,-5149.791992,-590.198792,397.323730,4.39,"Ita Thunderbrew - On Text Over - Summon Super Brew Stein Trap (P1)"),
(@ENTRY,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ita Thunderbrew - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Thunderbrew, finest brewery in all the realms.",12,0,100,0,0,0,"Ita Thunderbrew"),
(@ENTRY,0,1,"THUNDER! THUNDER! THUNDER! THUNDERBREW, HO!",12,0,100,0,0,0,"Ita Thunderbrew"),
(@ENTRY,0,2,"You look like you could use a cold one. Thunderbrew's got ya covered!",12,0,100,0,0,0,"Ita Thunderbrew"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Ita Thunderbrew"),

(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,0,0,0,"Ita Thunderbrew"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,0,0,0,"Ita Thunderbrew");


-- Drohn's Distillery Barker SAI
SET @ENTRY := 24492;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Out of Combat - Yell Line 0 (random)"),

(@ENTRY,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Distillery Barker - On Data Set - Set Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Out of Combat - Say Line 2 (random) (P1)"),
(@ENTRY,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Out of Combat - Yell Line 1 (P1)"),
(@ENTRY,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,1191.014404,-4299.663574,21.381546,4.39,"Drohn's Distillery Barker - On Text Over - Summon Super Brew Stein Trap (P1)"),
(@ENTRY,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Distillery Barker - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Drohn's brew is the stuff legends are made of! Come taste the legend!",12,0,100,0,0,0,"Drohn's Distillery Barker"),
(@ENTRY,0,1,"We drink for the Horde! Do you drink for the Horde? Come show us at Drohn's Distillery!",12,0,100,0,0,0,"Drohn's Distillery Barker"),
(@ENTRY,0,2,"Hey you, the tall one... Want to put some hair on your chest? Drohn's Distillery can help you out!",12,0,100,0,0,0,"Drohn's Distillery Barker"),
(@ENTRY,0,3,"Hey you! T'chali's Voodoo Brewers have got a brew that won't kill you! But they've also got a brew that might...",12,0,100,0,0,0,"Drohn's Distillery Barker"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Drohn's Distillery Barker"),

(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,0,0,0,"Drohn's Distillery Barker"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,0,0,0,"Drohn's Distillery Barker");


-- T'chali's Voodoo Brewery Barker SAI
SET @ENTRY := 24493;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Out of Combat - Yell Line 0 (random)"),

(@ENTRY,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - On Data Set - Set Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Out of Combat - Say Line 2 (random) (P1)"),
(@ENTRY,0,4,0,1,1,100,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Out of Combat - Yell Line 1 (P1)"),
(@ENTRY,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,1190.705688,-4285.604004,21.193674,4.39,"T'chali's Voodoo Brewery Barker - On Text Over - Summon Super Brew Stein Trap (P1)"),
(@ENTRY,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"If you wanna live life to the fullest, you gotta try T'chali's Voodoo Brew!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,0,1,"T'chali's Voodoo Brews helps keep the party going! Check out the party at Brewfest!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,0,2,"Hey you! T'chali's Voodoo Brewers have got a brew that won't kill you! But they've also got a brew that might...",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,0,3,"T'chali's Voodoo Brewery has the best brew you can find! They were voted 'Best Brew' by the Goblin Brew Weekly!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),

(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker");


-- Drunken Brewfest Reveler SAI
SET @ENTRY := 23698;
SET @SPELL_VOMIT := 67468;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-88896,-88960);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Alliance
(-88896,0,0,0,1,0,100,0,10000,45000,180000,240000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Say Line 0 (random)"),
(-88896,0,1,0,1,0,100,0,10000,45000,180000,240000,11,@SPELL_VOMIT,2,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Cast Drunken Vomit"),
-- Horde
(-88960,0,0,0,1,0,100,0,10000,45000,180000,240000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Say Line 1 (random)"),
(-88960,0,1,0,1,0,100,0,10000,45000,180000,240000,11,@SPELL_VOMIT,2,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Cast Drunken Vomit");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
-- Alliance
(@ENTRY,0,0,"Uh oh...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,1,"Good times! <hic>",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,2,"What's all the fuss about here?",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,3,"The besht part about drinking is pretending to be drunk... I'm jusht pretending guys.",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,4,"Hey fellas! How's it going?",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,5,"Hey! Anyone shee that cute blond dwarf? I shwear they were jusht here...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,6,"Hey! Lishten up! I've got... I have something important to talk about! Shee... Wait... What wash I shaying? Something aboutsh boats and floating... Yeah! Sho don't float on a boat... Thank you...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
-- Horde
(@ENTRY,1,0,"Uh oh...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,1,"Good times! <hic>",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,2,"What's all the fuss about here?",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,3,"The besht part about drinking is pretending to be drunk... I'm jusht pretending guys.",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,4,"You guys have gotta try thish...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,5,"Hey! You for the Horde? <hic> I'm for the Horde!",12,0,100,0,0,0,"Drunken Brewfest Reveler");

