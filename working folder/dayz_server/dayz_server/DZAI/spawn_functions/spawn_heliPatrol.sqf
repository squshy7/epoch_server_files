/*
	spawn_heliPatrol
	
	Description:
	
	Last updated:	1:29 AM 9/29/2013
	
*/

if (DZAI_curHeliPatrols >= DZAI_maxHeliPatrols) exitWith {};

for "_i" from 1 to (DZAI_maxHeliPatrols - DZAI_curHeliPatrols) do {
	private ["_heliType","_startPos","_helicopter","_unitGroup","_pilot","_banditType","_turretCount","_crewCount"];
	_heliType = DZAI_heliTypes call BIS_fnc_selectRandom2;
	
	//If chosen classname isn't an air-type vehicle, then use UH1H as default.
	if !(_heliType isKindOf "Air") then {_heliType = "UH1H_DZ"};
	_startPos = [(getMarkerPos "DZAI_centerMarker"),(600 + random((getMarkerSize "DZAI_centerMarker") select 0)),random(360),false] call SHK_pos;

	//Create the patrol group
	_unitGroup = createGroup (call DZAI_getFreeSide);
	//diag_log format ["Created group %1",_unitGroup];
	
	//Create helicopter crew
	_banditType = (DZAI_BanditTypes call BIS_fnc_selectRandom2);
	_pilot = _unitGroup createUnit [_banditType, [0,0,0], [], 1, "NONE"];
	[_pilot] joinSilent _unitGroup;
		
	//Create the helicopter and set variables
	_helicopter = createVehicle [_heliType, [_startPos select 0, _startPos select 1, 180], [], 0, "FLY"];
	_helicopter setFuel 1;
	_helicopter engineOn true;
	if (_heliType isKindOf "Plane") then {
		private ["_heliDir","_heliSpd"];
		_heliDir = random 360;
		_heliSpd = 120;
		_helicopter setPos [_startPos select 0, _startPos select 1, 180];
		_helicopter setDir _heliDir;
		_helicopter setVelocity [(sin _heliDir * _heliSpd),(cos _heliDir * _heliSpd), 0];
	};
	_helicopter setVariable ["DZAI",1];
	_helicopter setVariable ["ObjectID",""];
	_helicopter setVariable ["unitGroup",_unitGroup];
	if (DZAI_debugLevel > 0) then {diag_log format ["Spawned helicopter type %1 for group %2 at %3.",_heliType,_unitGroup,mapGridPosition _helicopter];};

	//Add helicopter pilot
	_crewCount = 1;
	_pilot assignAsDriver _helicopter;
	_pilot action ["getInPilot",_helicopter];
	
	//Fill all available helicopter gunner seats.
	_heliTurrets = configFile >> "CfgVehicles" >> _heliType >> "turrets";
	if ((count _heliTurrets) > 0) then {
		for "_i" from 0 to ((count _heliTurrets) - 1) do {
			private["_gunner"];
			_gunner = _unitGroup createUnit [_banditType, [0,0,0], [], 1, "NONE"];
			_gunner assignAsGunner _helicopter;
			_gunner action ["getInTurret",_helicopter,[_i]];
			[_gunner] joinSilent _unitGroup;
			_crewCount = _crewCount + 1;
			//diag_log format ["DEBUG :: Assigned gunner %1 of %2 to AI %3.",(_i+1),(count _heliTurrets),_heliType];
		};
	} else {
		if (((count (weapons _helicopter)) < 1) && (_heliType isKindOf "Plane")) then {
			_helicopter addWeapon "M240_veh";
			_helicopter addMagazine "100Rnd_762x51_M240";
			diag_log format ["DEBUG :: Added weapon to AI plane %1.",_heliType];
		};
	};
	//Add eventhandlers and init statement
	_helicopter addEventHandler ["Killed",{_this spawn fnc_heliDespawn;}];					//Begin despawn process when heli is destroyed.
	_helicopter addEventHandler ["LandedStopped",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];			//Destroy helicopter if it is forced to land.
	_helicopter setVariable ["crewCount",_crewCount];
	_helicopter setVehicleAmmo 1;
	[_helicopter] spawn fnc_heliResupply;

	{
		0 = [_x,"helicrew"] spawn DZAI_setSkills;
		_x addWeapon "NVGoggles";
		_x addEventHandler ["HandleDamage",{_this call fnc_damageAI;}];
		_x addEventHandler ["Killed",{[_this,"banditKills"] call local_eventKill;(_this select 0) setDamage 1;(_this select 0) removeWeapon "NVGoggles";}];
		_x setVariable ["unconscious",true];	//Prevent AI heli crew from being knocked unconscious
	} forEach (units _unitGroup);

	//Set group behavior and waypoint
	_unitGroup allowFleeing 0;
	_unitGroup setBehaviour "AWARE";
	_unitGroup setSpeedMode "FULL";
	_unitGroup setCombatMode "RED";
	
	//AI behavior settings for testing
	/*
	_unitGroup allowFleeing 0;
	_unitGroup setBehaviour "SAFE";
	_unitGroup setSpeedMode "FULL";
	_unitGroup setCombatMode "BLUE";
	*/

	//diag_log format ["DEBUG :: Helicopter group: %1",(units _unitGroup)];

	//Set initial waypoint and begin patrol
	[_unitGroup,0] setWaypointType "MOVE";
	[_unitGroup,0] setWaypointTimeout [5,10,15];
	[_unitGroup,0] setWaypointCompletionRadius 150;
	[_unitGroup,0] setWaypointStatements ["true","[(group this)] spawn DZAI_heliRandomPatrol;"];
	[_unitGroup] spawn DZAI_heliRandomPatrol;

	DZAI_curHeliPatrols = DZAI_curHeliPatrols + 1;
	//DZAI_actHeliGroups set [(count DZAI_actHeliGroups),_unitGroup];
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Created AI helicopter crew group %1 is now active and patrolling.",_unitGroup];};

	if (_i <= (DZAI_maxHeliPatrols - DZAI_curHeliPatrols)) then {sleep 20};
};
