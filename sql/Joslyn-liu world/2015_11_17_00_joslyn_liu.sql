-- "Fix" quest 5713 (One shot. One kill.). Made it a kill quest since I could not manage to get a script working for it.

UPDATE `world`.`quest_template` 
	SET
	
	
	`LogDescription` = "Clear the way for Sentinel Aynasha, then speak with Onaeya at Maestra's Post in Ashenvale." , 
	`QuestDescription` = "I was traveling to Auberdine with an important message when I was attacked by the furbolg Marosh and his trackers. During the attack I was poisoned, leaving me barely able to stand. I can make an antidote, but I will be to weak to defend myself from the creatures ahead.$B$BI would ask that you would clear the path so I may return safely. If you do this task, I will be able to deliver my message to Auberdine. I am sure Onaeya at Maestra's Post would be pleased to hear about you helping me." , 
	`AreaDescription` = "(NULL)" , 
	
	`RequiredNpcOrGo1` = 2323 , 
	`RequiredNpcOrGoCount1` = 4 , 
	`RequiredNpcOrGo2` = 2237 , 
	`RequiredNpcOrGoCount2` = 4
	
	
	 
	
	WHERE `ID` = 5713


