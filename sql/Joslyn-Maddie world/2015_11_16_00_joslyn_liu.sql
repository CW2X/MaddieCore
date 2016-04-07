-- fix wolf in northshire from attacking when right clicked from a distance.

UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry`=69; -- Diseased Timber Wolf
UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry`=299; -- Diseased Young Wolf