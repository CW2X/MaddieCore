-- speed up the flying machine for the quest "Where in  World is Hemet Nesingwary"
-- It took around 20 min to actually get the the dismount spot..

UPDATE `creature_template` SET `speed_walk` = 10, `speed_run` = 10 WHERE (entry = 28192);