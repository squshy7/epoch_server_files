/*
	DayZ Epoch configuration
	
	Description: Adds DayZ Epoch-specific items to DZAI loot tables if Epoch mode is on.
	
	Last updated: 5:10 PM 9/8/2013
	
*/
private ["_newItems"];

DZAI_metalBars = [["ItemSilverBar",0.20],["ItemSilverBar10oz",0.10],["ItemGoldBar",0.03],["ItemGoldBar10oz",0.015]];
DZAI_metalBarNum = 2;		//Maximum number of metal bars to generate

DZAI_BanditTypes = [DZAI_BanditTypes,["Bandit1_DZ","BanditW1_DZ","BanditW2_DZ","Camo1_DZ","Rocket_DZ","Sniper1_DZ","Soldier1_DZ","Survivor2_DZ","Survivor3_DZ","SurvivorW2_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","RU_Policeman_DZ","Pilot_EP1_DZ","Haris_Press_EP1_DZ","Ins_Soldier_GL_DZ","GUE_Commander_DZ","Functionary1_EP1_DZ","Priest_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","TK_INS_Warlord_EP1_DZ","TK_INS_Soldier_EP1_DZ","Soldier_Sniper_PMC_DZ","Soldier_TL_PMC_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ","Bandit2_DZ","SurvivorWcombat_DZ"]] call DZAI_append;
DZAI_MiscItemS = [DZAI_MiscItemS,["ItemZombieParts"]] call DZAI_append;

diag_log "DayZ Epoch loot tables loaded.";
