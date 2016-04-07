-- Fix quest 9528 (A Cry For Help) Magwin fell though the dock, set InhabitType to 1.

UPDATE `creature_template`  SET `InhabitType` = '1'  WHERE `entry` = 'entry' ;
