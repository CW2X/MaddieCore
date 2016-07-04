-- Aerial Command Unit(33670) fix

-- Stops ACU from moving around and following players.

-- ACU on retail does not move.

UPDATE `creature_template` SET `unit_flags` = 33554692 WHERE (entry = 33670);
