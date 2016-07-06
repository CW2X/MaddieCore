#include "Player.h"
#include "Chat.h"
#include "ScriptMgr.h"
#define Welcome_Name "MaddieCore"

class Player_Boa : public PlayerScript
 {
	
		public:
			Player_Boa() : PlayerScript("Player_Boa") { }
			
				void OnLogin(Player* player, bool firstLogin) override
				 {
				if (!firstLogin) // Run script only on first login
					 return;
			//	std::ostringstream ss;
			//	ss << "|cffFF0000[" << Welcome_Name << "]|r Welcome " << player->GetName() << " to the server! ";
			//	sWorld->SendServerMessage(SERVER_MSG_STRING, ss.str().c_str());
				// Uncomment above lines to re enable new player welcome broadcast.
				uint32 shoulders = 0, chest = 0, ring = 0, trinket = 0, weapon = 0, weapon2 = 0, weapon3 = 0, weapon4 = 0, shoulders2 = 0, chest2 = 0, trinket2 = 0, bag = 0;
				

				bag = 41600;
				ring = 50255;
				
				switch (player->getClass())
					 {

					case CLASS_WARRIOR:
						                  //Warrior
					    shoulders = 42949;
						chest = 48685;
						trinket = 42991;
						weapon = 42945;
						weapon2 = 44096;
						weapon3 = 42943;

						break;
						
					case CLASS_PALADIN:
							              //Paladin
						shoulders = 42949;
						chest = 48685;
						trinket = 42991;
						weapon = 42945;
						weapon2 = 44096;
						weapon3 = 42943;
						break;

					case CLASS_HUNTER:

								          //Hunter
						shoulders = 42950;
						chest = 48677;
						trinket = 42991;
						weapon = 42943;
						weapon2 = 42946;
						weapon3 = 44093;
						break;
								
					case CLASS_ROGUE:
									      //Rogue
						shoulders = 42952;
						chest = 48689;
						trinket = 42991;
						weapon = 42944;
						weapon2 = 42944;
						break;

									
					case CLASS_PRIEST:
										  //Priest
						shoulders = 42985;
						chest = 48691;
						trinket = 42992;
						weapon = 42947;
						break;
									  
					case CLASS_DEATH_KNIGHT:
                                          //Death Knight
						shoulders = 42949;
						chest = 48685;
						trinket = 42991;
						weapon = 42945;
						weapon2 = 42943;
						weapon3 = 44096;
						break;
											
					case CLASS_SHAMAN:
										 //Shaman
						shoulders = 42951;
						chest = 48683;
						trinket = 42992;
					    weapon = 42948;
						shoulders2 = 42951;
						chest2 = 48683;
						weapon2 = 48716;
						weapon3 = 48716;
						weapon4 = 42947;
						break;
												
					case CLASS_MAGE:
									      //Mage
						shoulders = 42985;
						chest = 48691;
						trinket = 42992;
						weapon = 42947;
						break;
						
					case CLASS_WARLOCK:
										  //Warlock
						shoulders = 42985;
					    chest = 48691;
						trinket = 42992;
						weapon = 42947;
						break;
														
					case CLASS_DRUID:
									      //Druid
						shoulders = 42984;
						chest = 48687;
						trinket = 42992;
						weapon = 42948;
						shoulders2 = 42952;
						chest2 = 48689;
						trinket2 = 42991;
						weapon2 = 48718;
						weapon3 = 42947;
						break;

						default:

						  return;
					}

				switch (player->getClass())
					 {

					case CLASS_HUNTER:

						player->AddItem(shoulders, 1);
						player->AddItem(trinket, 2);
						player->AddItem(ring, 1);
						player->AddItem(chest, 1);
						player->AddItem(weapon, 1);
						player->AddItem(weapon2, 1);
						player->AddItem(weapon3, 1);
						player->AddItem(bag, 4);
						break;

						case CLASS_ROGUE:
						player->AddItem(shoulders, 1);
						player->AddItem(trinket, 2);
						player->AddItem(ring, 1);
						player->AddItem(chest, 1);
						player->AddItem(weapon, 1);
						player->AddItem(weapon2, 1);
						player->AddItem(bag, 4);
						break;

						case CLASS_DRUID:
						player->AddItem(shoulders, 1);
						player->AddItem(trinket, 2);
						player->AddItem(ring, 1);
						player->AddItem(chest, 1);
						player->AddItem(weapon, 1);
						player->AddItem(shoulders2, 1);
						player->AddItem(chest2, 1);
						player->AddItem(trinket2, 2);
						player->AddItem(weapon2, 1);
						player->AddItem(weapon3, 1);
						player->AddItem(bag, 4);
						break;

						case CLASS_SHAMAN:
						player->AddItem(shoulders, 1);
						player->AddItem(trinket, 2);
						player->AddItem(ring, 1);
						player->AddItem(chest, 1);
						player->AddItem(weapon, 1);
						player->AddItem(shoulders2, 1);
						player->AddItem(chest2, 1);
						player->AddItem(weapon2, 1);
						player->AddItem(weapon3, 1);
						player->AddItem(weapon4, 1);
						player->AddItem(bag, 4);
						break;

						case CLASS_WARRIOR:
					    player->AddItem(shoulders, 1);
					    player->AddItem(trinket, 2);
						player->AddItem(ring, 1);
						player->AddItem(chest, 1);
						player->AddItem(weapon, 1);
						player->AddItem(weapon2, 1);
						player->AddItem(weapon3, 1);
						player->AddItem(bag, 4);

						case CLASS_PALADIN:
						player->AddItem(shoulders, 1);
						player->AddItem(trinket, 2);
						player->AddItem(ring, 1);
						player->AddItem(chest, 1);
						player->AddItem(weapon, 1);
						player->AddItem(weapon2, 1);
						player->AddItem(weapon3, 1);
						player->AddItem(bag, 4);

						case CLASS_DEATH_KNIGHT:
						player->AddItem(shoulders, 1);
						player->AddItem(trinket, 2);
						player->AddItem(ring, 1);
						player->AddItem(chest, 1);
						player->AddItem(weapon, 1);
						player->AddItem(weapon2, 1);
						player->AddItem(weapon3, 1);
						player->AddItem(bag, 4);

						default:
						player->AddItem(shoulders, 1);
						player->AddItem(trinket, 2);
						player->AddItem(ring, 1);
						player->AddItem(chest, 1);
						player->AddItem(weapon, 1);
						player->AddItem(bag, 4);

					}
				}
			};

void AddSC_Player_BoA()
 {
	new Player_Boa();
	}