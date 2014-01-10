//Outpost sidemission Created by TheSzerdi Edited by Falcyn [QF]
//Edited by Fuchs

private ["_coords","_wait","_dummymarker"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

diag_log "EMS: Minor mission created (SM8)";

//Mission start
[nil,nil,rTitleText,"A  Bandit Outpost has been spotted, clear it!", "PLAIN",6] call RE;

_coords = [getMarkerPos "center",0,2500,50,0,20,0] call BIS_fnc_findSafePos;

MCoords = _coords select 1;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_base = ["land_fortified_nest_big","Land_Fort_Watchtower"] call BIS_fnc_selectRandom;
_baserunover = createVehicle [_base,[(_coords select 0) - 20, (_coords select 1) - 10,-0.2],[], 0, "NONE"];
_baserunover2 = createVehicle ["land_fortified_nest_big",[(_coords select 0) - 20, (_coords select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover setVariable ["Sarge",1,true];
_baserunover2 setVariable ["Sarge",1,true];

_hummer = createVehicle ["HMMWV_DZ",[(_coords select 0) - 20, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer setVariable ["Sarge",1,true];
_hummer setFuel 1;

[_coords select 0,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards
sleep 3;

Outpost addVehicle _hummer;
Outpost move (_coords select 1);
waitUntil{{isPlayer _x && _x distance _hummer < 30  } count playableunits > 0};

tentloot = createVehicle ["TentStorage",_coords select 1,[], 0, "NONE"];
tentloot setVariable ["permaLoot",true];
sleep 1;

tentloot addWeaponCargoGlobal ["ItemCompass", 2];
tentloot addWeaponCargoGlobal ["ItemGPS", 3];
tentloot addWeaponCargoGlobal ["NVGoggles", 1];
tentloot addMagazineCargoGlobal ["FoodCanBakedBeans", 4];
tentloot addMagazineCargoGlobal ["ItemBandage", 4];
tentloot addMagazineCargoGlobal ["ItemMorphine", 4];
tentloot addMagazineCargoGlobal ["ItemPainkiller", 4];
tentloot addMagazineCargoGlobal ["ItemAntibiotic", 2];
tentloot addWeaponCargoGlobal ["ItemKnife", 2];
tentloot addWeaponCargoGlobal ["ItemToolbox", 2];
tentloot addWeaponCargoGlobal ["ItemMatchbox_DZE", 2];
tentloot addMagazineCargoGlobal ["ItemBloodbag", 2];
tentloot addMagazineCargoGlobal ["ItemJerryCan", 2];
tentloot addWeaponCargoGlobal ["MP5A5", 2];
tentloot addMagazineCargoGlobal ["30Rnd_9x19_MP5", 5];
tentloot addWeaponCargoGlobal ["glock17_EP1", 2];
tentloot addMagazineCargoGlobal ["17Rnd_9x19_glock17", 4];

waitUntil{{isPlayer _x && _x distance tentloot < 30  } count playableunits > 0}; 

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

//Mission accomplished
[nil,nil,rTitleText,"You've secured the Outpost! Good work.", "PLAIN",6] call RE;

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
