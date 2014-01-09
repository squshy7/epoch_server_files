//Bandit Supply Heli Crash by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
//Edited for EMS by Fuchs

private ["_coords","_MainMarker","_chopper","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";

WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,30,0,20,0] call BIS_fnc_findSafePos;

diag_log "EMS: Major Mission Created (SM4)";

//Mission start
[nil,nil,rTitleText,"A bandit supply helicopter has crash landed! Check your map for the location!", "PLAIN",10] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_chopper = ["UH1H_DZE","Mi17_DZE"] call BIS_fnc_selectRandom;

_hueychop = createVehicle [_chopper,_coords,[], 0, "NONE"];
_hueychop setVariable ["Sarge",1,true];
_hueychop setFuel 0.55;
_hueychop setVehicleAmmo 0.00;

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaloot",true];

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) + 6, _coords select 1,0],[], 90, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaloot",true];

_crate3 = createVehicle ["RULaunchersBox",[(_coords select 0) - 14, (_coords select 1) -10,0],[], 0, "CAN_COLLIDE"];
[_crate3] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesH.sqf";
_crate3 setVariable ["permaLoot",true];

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,80,6,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance _hueychop < 30  } count playableunits > 0}; 

//Mission accomplished
[nil,nil,rTitleText,"The helicopter has been taken by survivors!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";


SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
