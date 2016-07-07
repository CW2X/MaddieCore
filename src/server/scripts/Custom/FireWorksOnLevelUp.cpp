#include "Config.h"
#include "ScriptMgr.h"
#include "Player.h"

class FireWorksOnLevelUp : public PlayerScript
{
public:
	FireWorksOnLevelUp() : PlayerScript("FireWorksOnLevelUp") { }
	void OnLevelChanged(Player * player, uint8 oldLevel)
	{
		if (sConfigMgr->GetBoolDefault("FireWorksOnLevelUp", true))
		{
			uint8 level = player->getLevel();
			if (level <81)
				player->CastSpell(player, 55420, true);
			    player->CastSpell(player, 11541, true);
				player->CastSpell(player, 11541, true);
				player->CastSpell(player, 11541, true);
				player->CastSpell(player, 11541, true);
				player->CastSpell(player, 11541, true);
			
			//if (oldLevel == 3)
				//player->CastSpell(player, 11541, true);
			//if (oldLevel == 2)
				//player->CastSpell(player, 11541, true);
		//	if (oldLevel == 1)
		//		player->CastSpell(player, 11541, true);
		}
	}
};

void AddSC_FireWorksOnLevelUp()
{
	new FireWorksOnLevelUp();
}