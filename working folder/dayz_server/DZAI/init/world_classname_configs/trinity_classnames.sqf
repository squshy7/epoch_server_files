/*
	Trinity Island Classname Configuration
	
	Last updated: 7:45 PM 8/28/2013
	
*/

private ["_modname"];
_modname = toLower format ["%1",DZAI_modName];

switch (DZAI_modName) do {
	case default {
		[DZAI_BanditTypes,["Coach_DZT","SF_Survivor_DZT","Merc_GasMask_DZT","Merc_Balaclava_DZT","Bandit_1_1_DZT","Bandit_1_2_DZT","Bandit_1_3_DZT"]] call DZAI_append;
		diag_log "Trinity Island classnames loaded.";
	};
};
