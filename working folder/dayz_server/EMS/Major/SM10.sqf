//Helicopter Mission Created by TheSzerdi Edited by Falcyn [QF]
//Edited for EMS by Fuchs

private ["_coords","_dummymarker","_chopper","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,100,0,20,0] call BISfnc_findSafePos;

diag_log "EMS: Major Mission Created (SM10)";

//Mission accomplished
[nil,nil,rTitleText,"A helicopter has crash landed! Secure it's firepower for yourself!", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_chopper = ["CH_47F_EP1_DZE","UH1H_DZE"] call BIS_fnc_selectRandom;

hueychop = createVehicle [_chopper,_coords,[], 0, "NONE"];
hueychop setVariable ["Sarge",1,true];
hueychop setFuel 0.50;
hueychop setVehicleAmmo 0.00;

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,80,6,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards


waitUntil{{isPlayer _x && _x distance hueychop < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,"The Helicopters were under survivor control!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
