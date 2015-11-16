-- Chat filter stuff


ALTER TABLE `characters`.`characters`
        ADD COLUMN `FreezeTimer` int(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `deleteDate`,
        ADD COLUMN `StunTimer` int(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `FreezeTimer`;