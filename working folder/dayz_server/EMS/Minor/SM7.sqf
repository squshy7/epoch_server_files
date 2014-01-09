//Sniper team script Created by TheSzerdi Edited by Falcyn [QF]

private ["_coords","_wait","_dummymarker"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords = [getMarkerPos "center",0,7000,2,0,2000,0] call BIS_fnc_findSafePos;

diag_log "EMS: Minor mission created (SM7)";

//Mission start
[nil,nil,rTitleText,"A sniper team has been spotted!Kill'em all", "PLAIN",6] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

[_coords,80,4,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 1;
waitUntil{({alive _x} count (units SniperTeam)) < 1};

//Mission completed
[nil,nil,rTitleText,"Snipers killed by survivors! Now loot the corpses!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
