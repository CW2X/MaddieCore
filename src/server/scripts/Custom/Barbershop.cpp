/*## Custom Barbershop Command..*/

#include "Chat.h"
#include "ScriptMgr.h"
#include "Player.h"
#include "Config.h"
#include "Map.h"
#include "MapManager.h"
#include "Language.h"

class CustomBarbershopCommand : public CommandScript
{
public:
	CustomBarbershopCommand() : CommandScript("CustomBarbershopCommand") { }

	std::vector<ChatCommand> GetCommands() const override
	{
		static std::vector<ChatCommand> commandTable =
		{
			{ "barbershop", rbac::RBAC_PERM_COMMAND_BARBERSHOP, false, &HandleBarbershopCommand, "" },
			
		};
		return commandTable;
	}

	static bool HandleBarbershopCommand(ChatHandler* handler, char const* /*args*/)
	{
		Player* player = handler->GetSession()->GetPlayer();

		char msg[1028];

		snprintf(msg, 1028, "This command is currently disabled by the server. To enable this feature edit worldserver.conf");

		if (sConfigMgr->GetBoolDefault("EnableBarbershopEverywhere", false))
		{
			WorldPacket data(SMSG_ENABLE_BARBER_SHOP, 0);
			player->SendDirectMessage(&data);
		}
		else
			handler->GetSession()->SendAreaTriggerMessage(msg);

		return true;
	}

};

void AddSC_CustomBarbershopCommand()
{
	new CustomBarbershopCommand();
}
