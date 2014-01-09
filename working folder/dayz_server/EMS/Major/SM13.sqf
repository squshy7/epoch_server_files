// Construction Mission Created by TheSzerdi
//Edited for EMS by Fuchs

private ["_coords","_dummymarker","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,100,0,20,0] call BISfnc_findSafePos;

diag_log "EMS: Major Mission Created (SM13)";

//Mission start
[nil,nil,rTitleText,"Intel suggests bandits may be trying to build a base nearby, locate and terminate before they get fortified.", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 3, (_coords select 1) - 3,0],[], 0, "NONE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillConstructionMajor.sqf";
_crate setVariable ["permaLoot",true];

_aispawn = [_coords,20,3,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 2;
_aispawn = [_coords,40,3,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 2;
_aispawn = [_coords,60,4,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 2;
_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
   
waitUntil{{isPlayer _x && _x distance _crate < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,"Survivors have eliminated the bandit construction team.", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
