//Axe murderer script Created by TheSzerdi Edited by Falcyn [QF]

private ["_coords","_wait","_dummymarker","_grouparray","_group"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords = [getMarkerPos "center",0,7000,2,0,2000,0] call BIS_fnc_findSafePos;

diag_log "EMS: Minor mission created (SM13)";

//Mission start
[nil,nil,rTitleText,"A psychotic axe murderer has escaped from the hospital!", "PLAIN",6] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

[_coords,80,4,1,2] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 1;
waitUntil{({alive _x} count (units AxeMurderer)) < 1};

//Mission completed
[nil,nil,rTitleText,"Finally! He died! Check the body for medical supplies!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\Minor\SMfinder.sqf";
