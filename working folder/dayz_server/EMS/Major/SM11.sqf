//Humvee Mission Created by TheSzerdi Edited by Falcyn [QF]
//Edited for EMS by Fuchs

private ["_coords","_dummymarker","_chopper","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,3200,100,0,20,0] call BISfnc_findSafePos;

diag_log "EMS: Major Mission Created (SM11)";

//Mission start
[nil,nil,rTitleText,"A humvee has broken down! Secure it's firepower for yourself!", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_chopper = ["HMMWV_Ambulance_CZ_DES_EP1","HMMWV_M1151_M2_CZ_DES_EP1"] call BIS_fnc_selectRandom;

hueychop = createVehicle [_chopper,_coords,[], 0, "NONE"];
hueychop setVariable ["Sarge",1,true];
hueychop setFuel 0.50;
hueychop setVehicleAmmo 0.00;

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards


waitUntil{{isPlayer _x && _x distance hueychop < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,"The humvee is under survivor control!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
