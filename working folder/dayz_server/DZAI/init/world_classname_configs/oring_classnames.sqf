/*
	Oring Classname Configuration
	
	Last updated:
	
*/

private ["_modname"];
_modname = toLower format ["%1",DZAI_modName];

DZAI_BanditTypes = DZAI_BanditTypes + ["BW1_DZ","Civilian2_DZ","Civilian3_DZ","Civilian4_DZ","Civilian5_DZ","SurvivorW2_DZ","Survivor2_DZ","Sniper1_DZ","Soldier1_DZ","Camo1_DZ","BanditW1_DZ","Bandit1_DZ","SurvivorW2_DZ"];

diag_log "Oring classnames loaded.";
