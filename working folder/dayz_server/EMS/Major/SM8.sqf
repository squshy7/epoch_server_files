//Aircraft crash sidemission Created by TheSzerdi Edited by Falcyn [QF]
//Edited for EMS by Fuchs

private ["_coords","_dummymarker","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,50,0,20,0] call BIS_fnc_findSafePos;

diag_log "EMS: Major Mission Created (SM8)";

//Mission start
[nil,nil,rTitleText,"A C-130 has crash landed!Survivors secure the cargo!", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

c130wreck = createVehicle ["C130J_wreck_EP1",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "NONE"];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "NONE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes1.sqf";
_crate setVariable ["permaLoot",true];

_crate2 = createVehicle ["USVehicleBox",[(_coords select 0) - 10, (_coords select 1) - 10,0],[], 0, "NONE"];
[_crate2] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesM.sqf";
_crate2 setVariable ["permaloot",true];


_aispawn = [[(_coords select 0) + 2, _coords select 1,0],80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [[(_coords select 0) + 2, _coords select 1,0],80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [[(_coords select 0) + 2, _coords select 1,0],40,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [[(_coords select 0) + 2, _coords select 1,0],40,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance c130wreck < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,"Survivors secured the C130 crash site! We'll done.", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
