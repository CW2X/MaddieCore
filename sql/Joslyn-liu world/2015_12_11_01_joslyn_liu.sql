-- "Fix" for quest "I sence a disturbance" It's "works" But the waypoints are messy and sometimes it does not complete.
-- Usually works after doing it a second time.
-- And.. now it doesn't work at all.. wierd.
UPDATE `smart_scripts` SET `action_type`=85 WHERE `entryorguid`=28401 AND`source_type`=0 AND`id`=0 AND`link`=1