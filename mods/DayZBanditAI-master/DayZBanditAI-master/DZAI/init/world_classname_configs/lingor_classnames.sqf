/*
	Lingor Classname Configuration
	
	Last updated:
	
*/

private ["_modname","_newItems"];
_modname = toLower format ["%1",DZAI_modName];

switch (DZAI_modName) do {
	case "epoch":
	{
		#include "mod_configs\epoch_classnames.sqf"
	};
	case "huntinggrounds":
	{
		[DZAI_BanditTypes,["Gangman_Blue_DZ","Gangman_Red_DZ","HuntingGrounds1_DZ","HuntingGrounds2_DZ","HuntingGrounds3_DZ","HuntingGrounds4_DZ","HuntingGrounds5_DZ","HuntingGrounds6_DZ","HuntingGrounds7_DZ","SurvivorW2_DZ","Survivor2_DZ","Sniper1_DZ","Camo1_DZ","BanditW1_DZ","Bandit1_DZ","Bandit2_DZ","Bandit3_DZ"]] call DZAI_append;
		//[DZAI_Backpacks0,[]] call DZAI_append;	//T0 backpacks
		[DZAI_Backpacks1,["DZ_TerminalPack_EP1"]] call DZAI_append;	//T1 backpacks
		[DZAI_Backpacks2,["DZ_GunBag_EP1","DZ_LargeGunBag_EP1"]] call DZAI_append;	//T2 backpacks
		[DZAI_Backpacks3,["DZ_GunBag_EP1","DZ_LargeGunBag_EP1"]] call DZAI_append;	//T3 backpacks
	};
	case default
	{
		diag_log "DayZ Lingor classnames loaded.";
	};
};
