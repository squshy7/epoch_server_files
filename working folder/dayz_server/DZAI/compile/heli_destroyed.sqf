/*
		DZAI_heliDestroyed
		
		Description: Called when AI air vehicle is destroyed by collision damage.
		
		Last updated: 1:49 PM 12/18/2013
*/

private ["_helicopter","_unitGroup","_cleanupTime","_deleteQueue","_units"];
_helicopter = _this select 0;

if (_helicopter getVariable ["heli_disabled",false]) exitWith {};
_helicopter setVariable ["heli_disabled",true];

_unitGroup = _helicopter getVariable "unitGroup";
_helicopter removeAllEventHandlers "GetOut";
_helicopter removeAllEventHandlers "HandleDamage";
_helicopter removeAllEventHandlers "Killed";

_units = (units _unitGroup);
{
	if (alive _x) then {
		_x setDamage 1;
	};
} forEach _units;

_deleteQueue = _units;
_deleteQueue set [(count _deleteQueue),_helicopter];

DZAI_curHeliPatrols = DZAI_curHeliPatrols - 1;

_cleanupTime = 900;	//seconds to despawn helicopter and crew.
if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Helicopter patrol destroyed. Cleanup in %1 seconds.",_cleanupTime];};
[_deleteQueue,_cleanupTime] spawn DZAI_deleteObject;
0 = ["air"] spawn fnc_respawnHandler;
