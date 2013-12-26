/*
		DZAI_heliGetOut
		
		Description: Called when AI air vehicle suffers critical damage. Onboard units are ejected if the vehicle is not above water.
		
		Last updated: 1:49 PM 12/18/2013
*/

private ["_vehicle","_vehPos","_unitGroup"];
_vehicle = _this select 0;

if (_vehicle getVariable ["heli_disabled",false]) exitWith {};
_vehicle setVariable ["heli_disabled",true];

//_vehicle removeAllEventHandlers "Killed";
//_vehicle removeAllEventHandlers "GetOut";
//_vehicle removeAllEventHandlers "HandleDamage";

_vehPos = getPosATL _vehicle;
_unitGroup = _vehicle getVariable "unitGroup";

if ((!surfaceIsWater _vehPos)&&(!isNil "_unitGroup")) then {
	private ["_unitsAlive","_trigger","_weapongrade","_units"];
	_weapongrade = [DZAI_weaponGrades,DZAI_gradeChancesHeli] call fnc_selectRandomWeighted;
	_units = units _unitGroup;
	if ((_vehPos select 2) > 60) then {
		{
			if (alive _x) then {
				0 = [_x, _weapongrade] call DZAI_setSkills;
				0 = [_x, _weapongrade] spawn DZAI_autoRearm_unit;
				_x setVariable ["unconscious",false];
				_x setVariable ["unithealth",[12000,0,0,false,false]];
				_x setHit["hands",0];
				_x setHit["legs",0];
			} else {
				0 = [_x,_weapongrade] spawn DZAI_addLoot;
			};
			_x action ["eject",_vehicle];
			unassignVehicle _x;
		} forEach _units;
		
		_unitsAlive = {alive _x} count _units;
		if (_unitsAlive > 0) then {
			{
				deleteWaypoint _x;
			} forEach (waypoints _unitGroup);
			
			0 = [_unitGroup,_vehPos,75,DZAI_debugMarkers] spawn DZAI_BIN_taskPatrol;
			
			_unitGroup allowFleeing 0;

			//Create area trigger
			_trigger = createTrigger ["EmptyDetector",_vehPos];
			_trigger setTriggerArea [600, 600, 0, false];
			_trigger setTriggerActivation ["ANY", "PRESENT", true];
			_trigger setTriggerTimeout [15, 15, 15, true];
			_trigger setTriggerText (format ["HeliGetOut_%1",mapGridPosition _vehicle]);
			_trigger setTriggerStatements ["{isPlayer _x} count thisList > 0;","","0 = [thisTrigger] spawn fnc_despawnBandits;"];
			0 = [_trigger,[_unitGroup],75,DZAI_gradeChancesHeli,[],[_unitsAlive,0]] call DZAI_setTrigVars;
			_trigger setVariable ["respawn",false];
			_trigger setVariable ["permadelete",true];

			_unitGroup setVariable ["unitType","static"];
			_unitGroup setVariable ["trigger",_trigger];
			_unitGroup setVariable ["groupSize",_unitsAlive];
			
			0 = [_trigger] spawn fnc_despawnBandits;
		};
	} else {
		{
			_x action ["eject",_vehicle];
			_nul = [_x,_x] call DZAI_unitDeath;
			0 = [_x,_weapongrade] spawn DZAI_addLoot;
		} forEach _units;
	};
};

[_vehicle,900] spawn DZAI_deleteObject;
DZAI_curHeliPatrols = DZAI_curHeliPatrols - 1;
0 = ["air"] spawn fnc_respawnHandler;
if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: AI helicopter %1 evacuated at %2.",typeOf _vehicle,mapGridPosition _vehicle];};
	