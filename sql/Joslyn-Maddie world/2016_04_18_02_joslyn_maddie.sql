-- "Fix" for quest in blasted lands.
-- problem with items being counted when more than one of the following quests are currently in questlog

-- Balisk bite > Vultures vigor > snickerfang-jowls > A Boar's Vitality > The Decisive Striker
-- 2601        > 2603           >2581               > 2583              > 2585

-- the next group of repeatable quests may have this problem as well? 
-- Have to check.

UPDATE `quest_template_addon` SET `PrevQuestID` = '0' , `NextQuestID` = '2603'  WHERE `ID` = '2601' ;
UPDATE `quest_template_addon` SET `PrevQuestID` = '2601' , `NextQuestID` = '2581'  WHERE `ID` = '2603' ;
UPDATE `quest_template_addon` SET `PrevQuestID` = '2603' , `NextQuestID` = '2583'  WHERE `ID` = '2581' ;
UPDATE `quest_template_addon` SET `PrevQuestID` = '2581' , `NextQuestID` = '2585'  WHERE `ID` = '2583' ;
UPDATE `quest_template_addon` SET `PrevQuestID` = '2583' , `NextQuestID` = '0'  WHERE `ID` = '2585' ;