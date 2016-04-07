-- Chat Filter table

DROP TABLE IF EXISTS `chat_filter`;
CREATE TABLE `chat_filter`
(
    `id` int(2) NOT NULL,
    `word` CHAR(64) NOT NULL,
    `punishment` int(10) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
);

DELETE FROM `chat_filter`;
INSERT INTO `chat_filter` (`id`,`word`,`punishment`) VALUES
(0,"asshole",2), -- CHAT_FILTER_PUNISHMENT_MUTE_30_SEC
(1,"retard",3), -- CHAT_FILTER_PUNISHMENT_MUTE_30_SEC + CHAT_FILTER_PUNISHMENT_MUTE_10_SEC
(2,"fuck",1), -- CHAT_FILTER_PUNISHMENT_MUTE_10_SEC
(3,"fucking",2), -- CHAT_FILTER_PUNISHMENT_MUTE_30_SEC
(4,"nigger",2048); -- CHAT_FILTER_PUNISHMENT_KICK_PLAYER

-- Self Stun removes the stun visual when it expires
DELETE FROM `spell_linked_spell` WHERE `spell_effect`=-18970;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-65256,-18970,0,"Self Stun removal removes Self Stun - (Visual Only)");