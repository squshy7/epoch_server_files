/*
	Namalsk Classname Configuration
	
	Last updated: 10:53 AM 9/14/2013
	
*/

private ["_newItems"];

DZAI_Backpacks1 set [count DZAI_Backpacks1,"BAF_AssaultPack_DZN"];
DZAI_Backpacks2 set [count DZAI_Backpacks2,"BAF_AssaultPack_DZN"];
DZAI_gadgets0 set [1,["NVGoggles",0.005]];	//Reduce probability of functional NVGs
DZAI_tools0 set [9,["ItemGPS",0.005]];		//Reduce probability of functional GPS
_newItems = [["BrokenItemGPS",0.04],["BrokenNVGoggles",0.04],["BrokenItemRadio",0.02],["ItemSolder",0.01],["APSI",0.01]];
for "_i" from 0 to ((count _newItems) - 1) do {DZAI_tools0 set [(count DZAI_tools0),(_newItems select _i)];};
diag_log "Namalsk classnames loaded.";
