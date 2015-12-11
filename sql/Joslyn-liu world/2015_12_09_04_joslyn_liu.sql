-- Delete double spawned Prowlers in Elwynn forest.

DELETE FROM `creature` WHERE `guid` = '81231' ;
DELETE FROM `creature` WHERE `guid` = '81217' ;
