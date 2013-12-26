/*
	DZAI Functions
	
	Last Updated: 7:49 PM 10/30/2013
*/

waituntil {!isnil "bis_fnc_init"};
diag_log "[DZAI] Compiling DZAI functions.";

//Compile general functions.
if (isNil "SHK_pos_getPos") then {call compile preprocessFile "\z\addons\dayz_server\DZAI\SHK_pos\shk_pos_init.sqf";};
BIS_fnc_selectRandom2 = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\fn_selectRandom.sqf";
if (DZAI_zombieEnemy && (DZAI_weaponNoise > 0)) then { // Optional Zed-to-AI aggro functions
	ai_fired = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\ai_fired.sqf";
};
if (DZAI_zombieEnemy && (DZAI_passiveAggro || (DZAI_weaponNoise > 0))) then {
	ai_alertzombies = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\ai_alertzombies.sqf";
};
DZAI_AI_killed_all = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\ai_killed_all.sqf";
DZAI_AI_killed_static = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\ai_killed_static.sqf";
DZAI_AI_killed_dynamic = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\ai_killed_dynamic.sqf";
DZAI_unitDeath = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\ai_death.sqf";
if (isNil "fnc_selectRandomWeighted") then {
	fnc_selectRandomWeighted = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\fn_selectRandomWeighted.sqf";
};
DZAI_setup_AI = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\fn_createGroup.sqf";
DZAI_AI_handledamage = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\fn_damageHandlerAI2.sqf";
DZAI_BIN_taskPatrol = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\BIN_taskPatrol.sqf";
if (DZAI_debugMarkers < 1) then {
	DZAI_autoRearm_unit = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\unit_resupply.sqf";
} else {
	DZAI_autoRearm_unit = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\unit_resupply_debug.sqf";
};
if (DZAI_findKiller) then {
	DZAI_huntKiller = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\fn_findKiller.sqf";
};
DZAI_dyn_huntPlayer = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\fn_seekPlayer.sqf";
DZAI_addLoot = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\ai_generate_loot.sqf";
DZAI_setupLoadout = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\ai_setup_loadout.sqf";
	
//Compile spawn scripts
fnc_spawnBandits = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\spawnBandits.sqf";
fnc_spawnBandits_custom	= compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\spawnBandits_custom.sqf";
fnc_respawnBandits = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\respawnBandits.sqf";
fnc_respawnHandler = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\respawnHandler2.sqf";
fnc_despawnBandits = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\despawnBandits.sqf";

if (DZAI_dynAISpawns) then {
	fnc_spawnBandits_dynamic = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\spawnBandits_dynamicV2.sqf";
	fnc_despawnBandits_dynamic = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\despawnBandits_dynamicV2.sqf";
};

//Helicopter patrol scripts
if (DZAI_maxHeliPatrols > 0) then {
	if (DZAI_debugMarkers < 1) then {
		DZAI_autoRearm_heli = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\heli_resupply.sqf";
	} else {
		DZAI_autoRearm_heli = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\heli_resupply_debug.sqf";
	};
	DZAI_spawnHeliPatrol = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\spawn_heliPatrol.sqf";
	DZAI_airLanding = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\heli_airlanding.sqf";
	DZAI_heliGetOut = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\heli_getout.sqf";
	DZAI_hHandleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\heli_handledamage.sqf";
	DZAI_heliDestroyed = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\heli_destroyed.sqf";
	
	//Reveals nearby player units upon arriving at a waypoint
	DZAI_heliDetectPlayers = {
		private ["_unitGroup","_nearUnits","_detectBase","_detectFactor","_detectRange","_heli"];
		_unitGroup = _this select 0;

		_heli = vehicle (leader _unitGroup);
		_detectRange = if (_unitGroup getVariable ["DetectPlayersWide",false]) then {_unitGroup setVariable ["DetectPlayersWide",false]; 350} else {250};
		_nearUnits = (waypointPosition [_unitGroup,(currentWaypoint _unitGroup)]) nearEntities [["AllVehicles","CAManBase"],_detectRange];
		if ((count _nearUnits) > 0) then {
			private ["_nearPlayerUnits"];
			_nearPlayerUnits = [];
			{
				if (isPlayer _x) then {
					_nearPlayerUnits set [count _nearPlayerUnits,_x];
				};
			} forEach _nearUnits;
			
			if ((count _nearPlayerUnits) > 0) then {
				{
					if (isPlayer _x) then {
						private ["_heliAimPos","_playerAimPos"];
						_heliAimPos = aimPos _heli;
						_playerAimPos = aimPos _x;
						if !(terrainIntersectASL [_heliAimPos,_playerAimPos]) then {
							if !(lineIntersects [_heliAimPos,_playerAimPos,_heli,_x]) then {
								_unitGroup reveal [_x,3];
							};
						};
					};
					sleep 0.1;
				} forEach _nearPlayerUnits;
			};
		};
	};
	
	//Selects a random dynamic trigger to use as AI helicopter's next waypoint
	DZAI_heliRandomPatrol = {
		private ["_unitGroup","_tooClose","_wpSelect"];
		_unitGroup = _this select 0;

		_tooClose = true;
		while {_tooClose} do {
			_wpSelect = (DZAI_locations call BIS_fnc_selectRandom2) select 1;
			if (((waypointPosition [_unitGroup,0]) distance _wpSelect) > 300) then {
				_tooClose = false;
			} else {
				sleep 0.1;
			};
		};
		_wpSelect = [_wpSelect,50+(random 300),(random 360),true] call SHK_pos;
		[_unitGroup,0] setWPPos _wpSelect; 
		[_unitGroup,1] setWPPos _wpSelect;
		if ((waypointType [_unitGroup,1]) == "MOVE") then {
			if ((random 1) < 0.275) then {
				[_unitGroup,1] setWaypointType "SAD";
				[_unitGroup,1] setWaypointTimeout [20,25,30];
				_unitGroup setVariable ["DetectPlayersWide",true];
			};
		} else {
			[_unitGroup,1] setWaypointType "MOVE";
			[_unitGroup,1] setWaypointTimeout [3,6,9];
		};
		//[_unitGroup,0] setWaypointCompletionRadius 150;
		_unitGroup setCurrentWaypoint [_unitGroup,0];
		(vehicle (leader _unitGroup)) flyInHeight (100 + (random 40));
	};
};

if (DZAI_maxLandPatrols > 0) then {
	//Land vehicle patrol scripts
	DZAI_vehDespawn = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\veh_despawn.sqf";
	if (DZAI_debugMarkers < 1) then {
		DZAI_autoRearm_veh = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\veh_autorearm.sqf";
	} else {
		DZAI_autoRearm_veh = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\veh_autorearm_debug.sqf";
	};
	DZAI_spawnVehPatrol	= compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\spawn_functions\spawn_vehpatrol.sqf";
	DZAI_vehGetOut = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\veh_getout.sqf";
	DZAI_vHandleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\compile\veh_handledamage.sqf";
	
	DZAI_vehPatrol = {
		private ["_unitGroup","_tooClose","_wpSelect"];
		_unitGroup = _this select 0;

		_tooClose = true;
		while {_tooClose} do {
			_wpSelect = (DZAI_locations call BIS_fnc_selectRandom2) select 1;
			if (((waypointPosition [_unitGroup,0]) distance _wpSelect) > 0) then {
				_tooClose = false;
			};
		};

		_wpSelect = [_wpSelect,150 + random(150),random(360),false,[1,300]] call SHK_pos;
		[_unitGroup,0] setWPPos _wpSelect; 
		[_unitGroup,0] setWaypointCompletionRadius 150;
		_unitGroup setCurrentWaypoint [_unitGroup,0];
	};
};

//DZAI custom spawns function.
DZAI_spawn = {
	private ["_spawnMarker","_patrolRadius","_trigStatements","_trigger","_respawn","_weapongrade","_totalAI"];
	
	_spawnMarker = _this select 0;
	if ((typeName _spawnMarker) != "STRING") exitWith {diag_log "DZAI Error: Marker string not given!"};
	_totalAI = if ((typeName (_this select 1)) == "SCALAR") then {_this select 1} else {1};
	_weapongrade = if ((typeName (_this select 2)) == "SCALAR") then {_this select 2} else {1};
	_respawn = if ((count _this) > 3) then {if ((typeName (_this select 3)) == "BOOL") then {_this select 3} else {true}} else {true};

	_patrolRadius = ((((getMarkerSize _spawnMarker) select 0) min ((getMarkerSize _spawnMarker) select 1)) min 300);

	_trigStatements = format ["0 = [%1,0,%2,thisTrigger,%3,%4] call fnc_spawnBandits_custom;",_totalAI,_patrolRadius,_weapongrade,_spawnMarker];
	_trigger = createTrigger ["EmptyDetector", getMarkerPos(_spawnMarker)];
	_trigger setTriggerArea [600, 600, 0, false];
	_trigger setTriggerActivation ["ANY", "PRESENT", true];
	_trigger setTriggerTimeout [5, 5, 5, true];
	_trigger setTriggerText _spawnMarker;
	_trigger setTriggerStatements ["{isPlayer _x} count thisList > 0;",_trigStatements,"0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger setVariable ["respawn",_respawn];
	_trigger setVariable ["spawnmarker",_spawnMarker];
	//diag_log format ["DEBUG :: %1",_trigStatements];
	
	if ((markerAlpha _spawnMarker) > 0) then {
		_spawnMarker setMarkerAlpha 0;
	};
	/*
	if ((markerShape _spawnMarker) == "ELLIPSE") then {
		_spawnMarker setMarkerShape "RECTANGLE";
	};
	*/
	
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Created custom spawn area %1 at %2 with %3 AI units, weapongrade %4, respawn %5.",_spawnMarker,mapGridPosition _trigger,_totalAI,_weapongrade,_respawn];};
	true
};

//Miscellaneous functions 
//------------------------------------------------------------------------------------------------------------------------

//DZAI group side assignment function. Detects when East side has too many groups, then switches to Resistance side.
DZAI_getFreeSide = {
	private["_groupSide"];
	_groupSide = (if (({(side _x) == east} count allGroups) <= 140) then {east} else {resistance});
	//diag_log format ["Assigned side %1 to AI group",_groupSide];
	
	_groupSide
};

//Sets skills for unit based on their weapongrade value.
DZAI_setSkills = {
	private["_unit","_weapongrade","_skillArray"];
	_unit = _this select 0;
	_weapongrade = _this select 1;

	_skillArray = switch (_weapongrade) do {
		case -1;
		case 0: {DZAI_skill0};
		case 1: {DZAI_skill1};
		case 2: {DZAI_skill2};
		case 3: {DZAI_skill3};
		case 4: {if (isNil "DZAI_skill4") then {DZAI_skill3} else {DZAI_skill4}};
		case 5: {if (isNil "DZAI_skill5") then {DZAI_skill3} else {DZAI_skill5}};
		case 6: {if (isNil "DZAI_skill6") then {DZAI_skill3} else {DZAI_skill6}};
		case 7: {if (isNil "DZAI_skill7") then {DZAI_skill3} else {DZAI_skill7}};
		case 8: {if (isNil "DZAI_skill8") then {DZAI_skill3} else {DZAI_skill8}};
		case 9: {if (isNil "DZAI_skill9") then {DZAI_skill3} else {DZAI_skill9}};
		case "helicrew": {DZAI_heliCrewSkills};
		case default {DZAI_skill2};
	};
	{
		_unit setskill [_x select 0,(((_x select 1) + random ((_x select 2)-(_x select 1))) min 1)];
	} forEach _skillArray;
};

//Spawns flies on AI corpse
DZAI_deathFlies = {
	private ["_soundFlies"];
	_soundFlies = createSoundSource["Sound_Flies",getPosATL _this,[],0];
	_soundFlies attachTo [_this,[0,0,0]];
	_this setVariable ["sound_flies",_soundFlies];
};

//Returns probabilities of generating different grades of weapons based on equipType value
/*
DZAI_getGradeChances = {
	private ["_equipType", "_gradeChances"];
	_equipType = _this select 0;

	_gradeChances = switch (_equipType) do {
		case -1: {DZAI_gradeChancesNewbie};
		case 0: {DZAI_gradeChances0};
		case 1: {DZAI_gradeChances1};
		case 2: {DZAI_gradeChances2};
		case 3: {DZAI_gradeChances3};
		case default {DZAI_gradeChancesDyn};
	};
	
	_gradeChances
};
*/

//Convert server uptime in seconds to formatted time (days/hours/minutes/seconds)
DZAI_getUptime = {
	private ["_iS","_oS","_oM","_oH","_oD"];

	_iS = time;
	
	_oS = floor (_iS % 60);
	_oM = floor ((_iS % 3600)/60);
	_oH = floor ((_iS % 86400)/3600);
	_oD = floor ((_iS % 2592000)/86400);
	
	[_oD,_oH,_oM,_oS]
};

//Combines two arrays and returns the combined array. Does not add duplicate values. Second array is appended to first array.
DZAI_append = {
	{
		if !(_x in (_this select 0)) then {
			(_this select 0) set [(count (_this select 0)),_x];
		};
	} forEach (_this select 1);
	
	(_this select 0)
};

//Knocks an AI unit unconscious for x seconds - determines the correct animation to use, and returns unit to standing state after waking.
DZAI_unconscious = {
	private ["_unit","_anim","_hit","_sleep"];
	_unit = _this select 0;
	_hit = _this select 1;
	
	if ((animationState _unit) in ["amovppnemrunsnonwnondf","amovppnemstpsnonwnondnon","amovppnemstpsraswrfldnon","amovppnemsprslowwrfldf","aidlppnemstpsnonwnondnon0s","aidlppnemstpsnonwnondnon01"]) then {
		_anim = "adthppnemstpsraswpstdnon_2";
	} else {
		_anim = "adthpercmstpslowwrfldnon_4";
	};
	_unit switchMove _anim;
	_nul = [objNull, _unit, rSWITCHMOVE, _anim] call RE;  
	//diag_log "DEBUG :: AI unit is unconscious.";

	_sleep = if (_hit == "head_hit") then {25} else {12.5};
	//diag_log format ["DEBUG :: Knocked out AI %1 for %2 seconds.",_unit,_sleep];
	sleep _sleep;

	if (alive _unit) then {
		_nul = [objNull, _unit, rSWITCHMOVE, "amovppnemrunsnonwnondf"] call RE;
		sleep 0.5;
		_unit switchMove "amovppnemrunsnonwnondf";
		//diag_log "DEBUG :: AI unit is conscious.";
		_unit setVariable ["unconscious",false];
	};
};

//Generic function to delete a specified object (or array of objects) after a specified time (seconds).
DZAI_deleteObject = {
	private["_obj","_delay"];
	_obj = _this select 0;
	_delay = if ((count _this) > 1) then {_this select 1} else {300};
	
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Deleting object(s) %1 in %2 seconds.",_obj,_delay];};
	sleep _delay;
	
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Deleting object(s) %1 now.",_obj];};
	
	if ((typeName _obj) == "ARRAY") then {
		{
			deleteVehicle _x;
		} forEach _obj;
	} else {
		deleteVehicle _obj;
	};
};

//If a trigger's calculated totalAI value is zero, then add new group to respawn queue to retry spawn until a nonzero value is found.
DZAI_retrySpawn = {
	private ["_trigger","_unitGroup","_dummy","_grpArray"];

	_trigger = _this select 0;

	waitUntil {sleep 0.1; (_trigger getVariable ["initialized",false])};

	//Create placeholder dummy unit.
	_unitGroup = createGroup (call DZAI_getFreeSide);
	_dummy = _unitGroup createUnit ["Survivor1_DZ",[0,0,0],[],0,"FORM"];
	[_dummy] joinSilent _unitGroup;
	_dummy setVehicleInit "this hideObject true;this allowDamage false;this enableSimulation false;"; processInitCommands;
	_dummy disableAI "FSM";
	_dummy disableAI "ANIM";
	_dummy disableAI "MOVE";
	_dummy disableAI "TARGET";
	_dummy disableAI "AUTOTARGET";

	//Initialize group variables.
	_unitGroup setVariable ["dummyUnit",_dummy];
	_unitGroup setVariable ["GroupSize",0];
	_unitGroup setVariable ["trigger",_trigger];
	_unitGroup setVariable ["unitType","static"];
	_unitGroup allowFleeing 0;

	//Add new group to trigger's group array.
	_grpArray = _trigger getVariable "GroupArray";
	_grpArray set [(count _grpArray),_unitGroup];

	0 = [_trigger,_unitGroup,true] spawn fnc_respawnHandler;

	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Inserted group %1 into respawn queue. (retryRespawn)",_unitGroup];};
};

//Refreshes position of debug markers of active static triggers for JIP players. Terminates once trigger is marked inactive.
DZAI_updateSpawnMarker = {
	private ["_trigger","_markername","_marker"];
	_trigger = _this select 0;

	_marker = str (_trigger);

	while {(getMarkerColor _marker) != "ColorGreen"} do {
		_marker setMarkerPos (getMarkerPos _marker);
		sleep 30;
	};
};

//Finds a position that does not have a player within a certain distance.
DZAI_findSpawnPos = {
	private ["_spawnPos","_attempts","_continue","_spawnpool"];
	
	_attempts = 0;
	_continue = true;
	_spawnpool = [] + _this;
	while {((_attempts <= 5)&&_continue)} do {
		_spawnPos = _spawnpool select floor (random count _spawnpool);
		_spawnpool = _spawnpool - _spawnPos;	//Prevent this position from being reused if player distance check fails.
		if ((({isPlayer _x} count (_spawnPos nearEntities [["AllVehicles","CAManBase"],50])) == 0) or ((count _spawnpool) == 0)) then {_continue = false};
		_attempts = _attempts + 1;
		if ((DZAI_debugLevel > 0)&&(_attempts > 1)) then {diag_log format ["DZAI Debug: Player found within 50m of chosen spawn position. (attempt %1/5).",_attempts];};
	};
	_spawnPos
};

//Creates static spawn trigger (in development)
/*Syntax: 	[
				_spawnMarker, 		//Circular marker defining patrol radius.
				[_minAI,_addAI],	//(Optional, default [1,1]) Minimum and maximum bonus amount of AI units per group.
				_positionArray,		//(Optional, default []): Array of markers defining possible spawn points. If omitted or left empty, nearby buildings within 250m radius will be used as spawn points.
				_equipType,			//(Optional, default 1): Number between 0-3. Defines AI weapon selection and skill parameters.
				_numGroups			//(Optional, default 1): Number of AI groups to spawn using the above parameters.			
			] call DZAI_static_spawn;
*/

//called version			
DZAI_static_spawn = {
	private ["_spawnMarker","_minAI","_addAI","_positionArray","_equipType","_numGroups","_patrolRadius","_trigStatements","_trigger"];
	
	if ((count _this) < 1) exitWith {diag_log format ["DZAI Error: DZAI_static_spawn expected at least 1 argument, found %1.",(count _this)]; false};
	_spawnMarker = _this select 0;
	_spawnMarker setMarkerAlpha 0;
	
	if ((count _this) > 1) then {
		_minAI = (_this select 1) select 0;
		_addAI = (_this select 1) select 1;
	} else {
		_minAI = 1;
		_addAI = 1;
	};
	_positionArray = if ((count _this) > 2) then {_this select 2} else {[]};
	_equipType = if ((count _this) > 3) then {_this select 3} else {1};
	_numGroups = if ((count _this) > 4) then {_this select 4} else {1};
	
	_patrolRadius = (getMarkerSize _spawnMarker) select 0;
	
	_trigStatements = format ["_nul = [%1,%2,%3,thisTrigger,%4,%5,%6] call fnc_spawnBandits;",_minAI,_addAI,_patrolRadius,_positionArray,_equipType,_numGroups];
	_trigger = createTrigger ["EmptyDetector", getMarkerPos(_spawnMarker)];
	_trigger setTriggerArea [600, 600, 0, false];
	_trigger setTriggerActivation ["ANY", "PRESENT", true];
	_trigger setTriggerTimeout [10, 15, 20, true];
	_trigger setTriggerText _spawnMarker;
	_trigger setTriggerStatements ["{isPlayer _x} count thisList > 0;",_trigStatements,"_nul = [thisTrigger] spawn fnc_despawnBandits;"];
	
	true
};

//spawned version
/*
	_nul = [
		[_spawnMarker,[_minAI,_addAI],_positionArray,_equipType,_numGroups],
		[_spawnMarker,[_minAI,_addAI],_positionArray,_equipType,_numGroups],
		[_spawnMarker,[_minAI,_addAI],_positionArray,_equipType,_numGroups]
	] spawn DZAI_static_spawn2;
*/
/*
DZAI_static_spawn2 = {
	{
		private ["_spawnMarker","_minAI","_addAI","_positionArray","_equipType","_numGroups","_patrolRadius","_trigStatements","_trigger"];
		_spawnMarker = _x select 0;
		_spawnMarker setMarkerAlpha 0;
		
		if ((count _x) > 1) then {
			_minAI = (_x select 1) select 0;
			_addAI = (_x select 1) select 1;
		} else {
			_minAI = 1;
			_addAI = 1;
		};
		_positionArray = if ((count _x) > 2) then {_x select 2} else {[]};
		_equipType = if ((count _x) > 3) then {_x select 3} else {1};
		_numGroups = if ((count _x) > 4) then {_x select 4} else {1};
		
		_patrolRadius = (getMarkerSize _spawnMarker) select 0;
		
		_trigStatements = format ["_nul = [%1,%2,%3,thisTrigger,%4,%5,%6] call fnc_spawnBandits;",_minAI,_addAI,_patrolRadius,_positionArray,_equipType,_numGroups];
		_trigger = createTrigger ["EmptyDetector", getMarkerPos(_spawnMarker)];
		_trigger setTriggerArea [600, 600, 0, false];
		_trigger setTriggerActivation ["ANY", "PRESENT", true];
		_trigger setTriggerTimeout [10, 15, 20, true];
		_trigger setTriggerText _spawnMarker;
		_trigger setTriggerStatements ["{isPlayer _x} count thisList > 0;",_trigStatements,"_nul = [thisTrigger] spawn fnc_despawnBandits;"];
		sleep 0.05;
	} forEach _this;
};
*/

DZAI_findLootPile = {
	private ["_lootPiles","_lootPos","_unitGroup","_searchRange"];
	_unitGroup = _this select 0;
	_searchRange = _this select 1;
	
	_lootPiles = (getPosATL (leader _unitGroup)) nearObjects ["ReammoBox",_searchRange];
	if ((count _lootPiles) > 0) then {
		_lootPos = getPosATL (_lootPiles call BIS_fnc_selectRandom2);
		if ((behaviour (leader _unitGroup)) != "AWARE") then {_unitGroup setBehaviour "AWARE"};
		(units _unitGroup) doMove _lootPos;
		{_x moveTo _lootPos} forEach (units _unitGroup);
		//diag_log format ["DEBUG :: AI group %1 is investigating a loot pile at %2.",_unitGroup,_lootPos];
	};
};

DZAI_shuffleWP = {
	private ["_unitGroup","_locationArray","_newWPPos","_wp"];
	_unitGroup = _this select 0;
	_locationArray = (_unitGroup getVariable "trigger") getVariable "locationArray";
	_newWPPos = _locationArray call BIS_fnc_selectRandom2;
	//diag_log format ["DEBUG :: Chosen position: %1.",_newWPPos];
	_wp = (currentWaypoint _unitGroup);
	if (DZAI_debugMarkers > 0) then {
		private["_markername"];
		_markername = format ["[%1,%2]",_unitGroup,_wp];
		//diag_log format ["DEBUG :: Relocating marker %1.",_markername];
		_markername setMarkerPos _newWPPos;
	};
	[_unitGroup,_wp] setWPPos _newWPPos;
};

DZAI_bldgPatrol = {
	private ["_unitGroup","_locationArray"];
	_unitGroup = _this select 0;
	_locationArray = _this select 1;

	//diag_log format ["DEBUG :: Counted %1 spawn positions.",count _locationArray];
	
	for "_i" from 1 to 5 do {
		private ["_loc","_wp"];
		_loc = _locationArray call BIS_fnc_selectRandom2;
		//diag_log format ["DEBUG :: Chosen position: %1.",_loc];
		_wp = _unitGroup addWaypoint [_loc,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointCompletionRadius 35;
		_wp setWaypointTimeout [0,2,15];
		_wp setWaypointStatements ["true", "if ((random 3) > 2) then {_nul = [(group this)] spawn DZAI_shuffleWP;} else {_nul = [(group this),100] spawn DZAI_findLootPile;};"];
		if (DZAI_debugMarkers > 0) then {
			private["_markername","_marker"];
			_markername = str (_wp);
			if ((getMarkerColor _markername) != "") then {deleteMarker _markername};
			_marker = createMarker [_markername,[_loc select 0,_loc select 1]];
			//diag_log format ["DEBUG :: Creating marker %1.",_markername];
			_marker setMarkerShape "ELLIPSE";
			_marker setMarkerType "Dot";
			_marker setMarkerColor "ColorOrange";
			_marker setMarkerBrush "SolidBorder";
			_marker setMarkerSize [20, 20];
		};
		if (_i == 5) then {
			_wp = _unitGroup addWaypoint [_loc, 0];
			_wp setWaypointType "CYCLE";
			_wp setWaypointCompletionRadius 100;
		};
		sleep 0.5;
	};
};

DZAI_setTrigVars = {
	private["_trigger"];

	_trigger = _this select 0;
	_trigger setVariable ["isCleaning",false];
	_trigger setVariable ["GroupArray",(_this select 1)];
	if ((count _this) > 3) then {
		_trigger setVariable ["patrolDist",(_this select 2)];
		_trigger setVariable ["equipType",(_this select 3)];
		_trigger setVariable ["locationArray",(_this select 4)];
		_trigger setVariable ["maxUnits",(_this select 5)];
		_trigger setVariable ["initialized",true];
		DZAI_actTrigs = DZAI_actTrigs + 1;
		if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Initialized static trigger at %1. GroupArray: %2, PatrolDist: %3. equipType: %4. %LocationArray %5 positions, MaxUnits %6.",triggerText(_this select 0),(_this select 1),(_this select 2),(_this select 3),count (_this select 4),(_this select 5)];};
		} else {
		DZAI_actDynTrigs = DZAI_actDynTrigs + 1;
		if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Initialized dynamic trigger at %1. GroupArray: %2.",getPosATL (_this select 0),(_this select 1)];};
	};

	true
};


DZAI_getObjMon = {
	private ["_objectMonitor"];
	_objectMonitor = switch (true) do {
		case ((!isNil "dayz_serverObjectMonitor")&&(isNil "PVDZE_serverObjectMonitor")): {dayz_serverObjectMonitor};
		case (!isNil "PVDZE_serverObjectMonitor"): {PVDZE_serverObjectMonitor};
		case default {[]};
	};
	
	_objectMonitor
};

DZAI_protectObject = {
	private ["_objectMonitor","_object"];
	_object = _this;
	
	_objectMonitor = switch (true) do {
		case ((!isNil "dayz_serverObjectMonitor")&&(isNil "PVDZE_serverObjectMonitor")): {dayz_serverObjectMonitor};
		case (!isNil "PVDZE_serverObjectMonitor"): {PVDZE_serverObjectMonitor};
		case default {[]};
	};
	
	_objectMonitor set [count _objectMonitor,_object];
	_object setVariable ["ObjectID",""];
	
	true
};

DZAI_getWeapongrade = {
	private ["_indexWeighted","_index"];

	_indexWeighted = switch (_this) do {
		case -1: {DZAI_gradeIndicesNewbie};
		case 0: {DZAI_gradeIndices0};
		case 1: {DZAI_gradeIndices1};
		case 2: {DZAI_gradeIndices2};
		case 3: {DZAI_gradeIndices3};
		case 4: {DZAI_gradeIndicesDyn};
		case 5: {DZAI_gradeIndicesHeli};
	};
	
	_index = _indexWeighted call BIS_fnc_selectRandom2;
	
	DZAI_weaponGrades select _index
};
