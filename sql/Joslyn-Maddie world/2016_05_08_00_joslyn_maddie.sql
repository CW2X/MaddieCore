-- reduce the damage Amani Berserkers do, could not kill them without boa gear.

UPDATE `creature_template` SET `DamageModifier` = '0.5'  WHERE `entry` = '15643' ;
