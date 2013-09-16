/*
	Namalsk Classname Configuration
	
	Last updated: 1:14 PM 6/3/2013
	
*/

private ["_modname","_newItems"];
_modname = toLower format ["%1",DZAI_modName];

//Setting common between Namalsk and Namalsk 2017
DZAI_invmedicals = 1; 	//Number of selections of medical items (Inventory)
DZAI_invedibles = 1;	//Number of selections of edible items (Inventory)
DZAI_bpmedicals = 1; 	//Number of selections of medical items (Backpack)
DZAI_bpedibles = 0;		//Number of selections of edible items (Backpack)

DZAI_BanditTypes = DZAI_BanditTypes + ["CamoWinterW_DZN", "CamoWinter_DZN", "Sniper1W_DZN"];
if (DZAI_tempNVGs) then {DZAI_tempNVGs = false};	//Disable temporary NVG chance for DayZ Namalsk.

switch (_modname) do {
	case "epoch":
	{
		#include "mod_configs\epoch_classnames.sqf"
	};
	case "2017" :
	{
		DZAI_gradeChances0 = [0.90,0.10,0.00,0.00];
		DZAI_gradeChances1 = [0.65,0.30,0.05,0.00];
		DZAI_gradeChances2 = [0.30,0.45,0.15,0.00];
		DZAI_gradeChances3 = [0.25,0.55,0.20,0.00];
		//Reduce gadget probabilities
		DZAI_gadgets0 set [0,["binocular",0.50]];
		DZAI_gadgets0 set [1,["NVGoggles",0.000]];	//Reduce probability of functional NVGs
		DZAI_gadgets1 set [0,["binocular",0.50]];
		DZAI_gadgets1 set [1,["NVGoggles",0.000]];	//Reduce probability of functional NVGs
		//Reduce tool probabilities
		DZAI_tools0 set [0,["ItemFlashlight",0.00]];
		DZAI_tools0 set [2,["ItemKnife",0.65]];
		DZAI_tools0 set [3,["ItemHatchet",0.60]];
		DZAI_tools0 set [4,["ItemCompass",0.40]];
		DZAI_tools0 set [5,["ItemMap",0.30]];
		DZAI_tools0 set [7,["ItemFlint",0.20]];		//Replace ItemMatchbox with ItemFlint
		DZAI_tools0 set [8,["ItemFlashlightRed",0.00]];
		DZAI_tools0 set [9,["ItemGPS",0.000]];		//Reduce probability of functional GPS
		DZAI_tools1 set [0,["ItemFlashlight",0.00]];
		DZAI_tools1 set [2,["ItemKnife",0.65]];
		DZAI_tools1 set [3,["ItemHatchet",0.60]];
		DZAI_tools1 set [4,["ItemCompass",0.40]];
		DZAI_tools1 set [5,["ItemMap",0.30]];
		DZAI_tools1 set [7,["ItemFlint",0.20]];		//Replace ItemMatchbox with ItemFlint
		DZAI_tools1 set [8,["ItemFlashlightRed",0.00]];
		DZAI_tools1 set [9,["ItemGPS",0.000]];		//Reduce probability of functional GPS
		//Overwrite default backpack tables
		DZAI_Backpacks0 = ["ice_apo_pack3"];
		DZAI_Backpacks1 = ["ice_apo_pack3","ice_apo_pack1"];
		DZAI_Backpacks2 = ["ice_apo_pack1","ice_apo_pack4","ice_apo_pack2"];
		DZAI_Backpacks3 = ["ice_apo_pack4","ice_apo_pack2"];
		diag_log "Namalsk 2017 classnames loaded.";
	};
	default {
		DZAI_Backpacks1 set [count DZAI_Backpacks1,"BAF_AssaultPack_DZN"];
		DZAI_Backpacks2 set [count DZAI_Backpacks2,"BAF_AssaultPack_DZN"];
		DZAI_gadgets0 set [1,["NVGoggles",0.005]];	//Reduce probability of functional NVGs
		DZAI_tools0 set [9,["ItemGPS",0.005]];		//Reduce probability of functional GPS
		_newItems = [["BrokenItemGPS",0.04],["BrokenNVGoggles",0.04],["BrokenItemRadio",0.02],["ItemSolder",0.01],["APSI",0.01]];
		for "_i" from 0 to ((count _newItems) - 1) do {DZAI_tools0 set [(count DZAI_tools0),(_newItems select _i)];};
		diag_log "Namalsk classnames loaded.";
	};
};
