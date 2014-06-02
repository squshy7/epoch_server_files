/*
	DayZ Epoch configuration
	
	Description: Adds DayZ Epoch-specific items to DZAI loot tables if Epoch mode is on.
	
	Last updated: 5:10 PM 9/8/2013
	
*/

DZAI_metalBars = [["ItemSilverBar",0.20],["ItemSilverBar10oz",0.10],["ItemGoldBar",0.03],["ItemGoldBar10oz",0.015]];
DZAI_metalBarNum = 2;		//Maximum number of metal bars to generate

DZAI_banditTypes = [DZAI_banditTypes,["UN_CDF_Soldier_Crew_EP1","UN_CDF_Soldier_Guard_EP1","UN_CDF_Soldier_Light_EP1","UN_CDF_Soldier_Officer_EP1","UN_CDF_Soldier_SL_EP1"]] call DZAI_append;
DZAI_edibles = [DZAI_edibles,["ItemSodaRabbit","ItemSodaMtngreen","ItemSodaR4z0r","ItemSodaClays","ItemSodaSmasht","ItemSodaDrwaste","ItemSodaLemonade","ItemSodaLvg","ItemSodaMzly","FoodBioMeat","FoodCanGriff","FoodCanBadguy","FoodCanBoneboy","FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanOrlok","FoodCanPowell","FoodCanTylers","FoodPumpkin","FoodSunFlowerSeed"]] call DZAI_append;
DZAI_MiscItemS = [DZAI_MiscItemS,["ItemZombieParts"]] call DZAI_append;

DZAI_Backpacks0 = [DZAI_Backpacks0,["DZ_TerminalPack_EP1"]] call DZAI_append; //Added: DZ_TerminalPack_EP1
DZAI_Backpacks1 = [DZAI_Backpacks1,["DZ_TerminalPack_EP1", "DZ_CompactPack_EP1"]] call DZAI_append; //Added: DZ_TerminalPack_EP1, DZ_CompactPack_EP1
DZAI_Backpacks2 = [DZAI_Backpacks2, ["DZ_CompactPack_EP1","DZ_GunBag_EP1"]] call DZAI_append; //Added: DZ_CompactPack_EP1, DZ_GunBag_EP1
DZAI_Backpacks3 = [DZAI_Backpacks3, ["DZ_GunBag_EP1","DZ_LargeGunBag_EP1"]] call DZAI_append; //Added: DZ_GunBag_EP1, DZ_LargeGunBag_EP1

//Replace hatchet and matchbox items with Epoch versions.
(DZAI_tools0 select 3) set [0,"ItemHatchet_DZE"];
(DZAI_tools0 select 7) set [0,"ItemMatchbox_DZE"];
(DZAI_tools1 select 3) set [0,"ItemHatchet_DZE"];
(DZAI_tools1 select 7) set [0,"ItemMatchbox_DZE"];

diag_log "[DZAI] Epoch classnames loaded.";
