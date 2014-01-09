//Large Ammo Cache script Created by TheSzerdi Edited by Falcyn [QF]
//Edited for EMS by Fuchs

private ["_coords","_dummymarker","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,50,0,20,0] call BIS_fnc_findSafePos;

diag_log "EMS: Major Mission Created (SM7)";

//Mission start
[nil,nil,rTitleText,"A gear cache has been airdropped! Secure it for yourself!", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";

[] execVM "debug\addmarkers.sqf";
_crate = createVehicle ["USVehicleBox",_coords,[], 0, "NONE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes1.sqf";
_crate setVariable ["permaLoot",true];

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance _crate < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,"Gear cache cleared by survivors, nice work, enjoy the spoils.", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
