//Medical Ural Attack by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
//Edited for EMS by Fuchs

private ["_coords","_MainMarker","_chopper","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";

WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,30,0,20,0] call BIS_fnc_findSafePos;

diag_log "EMS: Major Mission Created (SM5)";

//Mission start
[nil,nil,rTitleText,"Bandits have destroyed a Ural carrying medical supplies and are securing the cargo! Check your map for the location!", "PLAIN",10] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_uralcrash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];
_uralcrash setVariable ["Sarge",1,true];

_hummer = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 20, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer1 = createVehicle ["HMMWV_DZ",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_hummer setVariable ["Sarge",1,true];
_hummer1 setVariable ["Sarge",1,true];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesM.sqf";
_crate setVariable ["permaloot",true];

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;

waitUntil{{isPlayer _x && _x distance _uralcrash < 5  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,"The medical supplies have been secured by survivors!", "PLAIN",6] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";


SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
