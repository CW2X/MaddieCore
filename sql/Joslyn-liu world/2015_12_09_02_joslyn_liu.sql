-- A "Fix" for Monte Muzzleshot's animation, the parashoot breaks it and locks him in palce. 
-- This looks better.

-- A new bunny that holds the parachute
DELETE FROM `creature_template` WHERE (entry = 998888);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(998888, 0, 0, 0, 0, 0, 17519, 11686, 0, 0, 'Monte Muzzleshot Invisible parachute holder', NULL, NULL, 0, 80, 80, 0, 114, 0, 1, 1.14286, 1, 0, 0, 2000, 2000, 1, 1, 1, 33587968, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 1, 1, 0, 0, 1, 0, 130, '', 12340);


-- spawn the bunny
DELETE FROM `creature` WHERE (guid = 15001515);
INSERT  INTO `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`,`size`) VALUES (15001515,998888,571,0,0,1,1,17612,0,5584.02,5200.42,-129.900,0.593412,300,0,0,7212,0,0,0,0,0,0,-1);

-- spell aura for the parachute
DELETE FROM `creature_addon` WHERE (guid = 15001515);
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES ('15001515', '50544');


-- Remove parachute from Monte Muzzleshot
DELETE FROM `creature_addon` WHERE `guid` = '103289' ;


-- add "swim death" emote to Monte Muzzleshot
INSERT INTO `creature_addon` (`guid`, `emote`) VALUES ('103289', '383');


