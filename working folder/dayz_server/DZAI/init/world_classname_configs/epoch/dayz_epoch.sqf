/*
	DayZ Epoch configuration
	
	Description: Adds DayZ Epoch-specific items to DZAI loot tables if Epoch mode is on.
	
	Last updated: 5:10 PM 9/8/2013
	
*/

DZAI_metalBars = [["ItemSilverBar",0.20],["ItemSilverBar10oz",0.10],["ItemGoldBar",0.03],["ItemGoldBar10oz",0.015]];
DZAI_metalBarNum = 2;		//Maximum number of metal bars to generate

DZAI_BanditTypes = [DZAI_BanditTypes,["UN_CDF_Soldier_Crew_EP1","UN_CDF_Soldier_Guard_EP1","UN_CDF_Soldier_Light_EP1","UN_CDF_Soldier_Officer_EP1","UN_CDF_Soldier_Pilot_EP1","UN_CDF_Soldier_SL_EP1"]] call DZAI_append;
DZAI_MiscItemS = [DZAI_MiscItemS,["ItemZombieParts"]] call DZAI_append;

diag_log "DayZ Epoch loot tables loaded.";
