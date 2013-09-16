/*
	Taviana Classname Configuration
	
	Last updated:
	
*/

private ["_modname"];
_modname = toLower format ["%1",DZAI_modName];

switch (DZAI_modName) do {
	case "epoch":
	{
		#include "mod_configs\epoch_classnames.sqf"
	};
	default {
		diag_log "DayZ Taviana config selected.";
	};
};
