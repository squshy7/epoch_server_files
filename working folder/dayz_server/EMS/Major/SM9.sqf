//Firebase mission Created by TheSzerdi Edited by Falcyn [QF]
//Modified by Mimic for Epoch Mission System

private ["_coords","_dummymarker","_base","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,50,0,20,0] call BIS_fnc_findSafePos;

diag_log "EMS: Major Mission Created (SM9)";

//Mission accomplished
[nil,nil,rTitleText,"A firebase is being constructed! Stop the bandits and secure the construction materials for yourself!", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_base = ["land_fortified_nest_big","Land_Fort_Watchtower"] call BIS_fnc_selectRandom;
baserunover = createVehicle [_base,[(_coords select 0) - 20, (_coords select 1) - 10,-0.2],[], 0, "NONE"];

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 2, (_coords select 1),0],[], 0, "NONE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillConstructionMajor.sqf";
_crate setVariable ["permaLoot",true];

_aispawn = [_coords,20,3,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards
sleep 2;
_aispawn = [_coords,40,3,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards
sleep 2;
_aispawn = [_coords,60,4,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards
sleep 2;
_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance baserunover < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,"Survivors have secured the construction materials.", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
