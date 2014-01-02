/*
	fn_findKiller
	
	Description: If an AI unit is killed, surviving members of their group will aggressively pursue the killer for a set amount of time. After this amount of time has passed, the group will return to their patrol state.
	
	Last updated: 8:41 PM 11/17/2013
*/
private ["_unitGroup","_victim","_killer","_trigger","_transmitRange","_chaseDist"];

_victim = _this select 0;
_killer = _this select 1;
_unitGroup = _this select 2;

_groupSize = _unitGroup getVariable ["GroupSize",0];
if (_groupSize == 0) exitWith {if (DZAI_debugLevel > 0) then {diag_log "DZAI Debug: All units in group are dead. (fn_findKiller)";};};

//If group is already pursuing player and target player has killed another group member, then extend pursuit time.
if (((_unitGroup getVariable ["pursuitTime",0]) > 0)&&((_unitGroup getVariable ["targetKiller",objNull]) == _killer)) exitWith {
	_unitGroup setVariable ["pursuitTime",((_unitGroup getVariable ["pursuitTime",0]) + 20)];
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Pursuit time +20 sec for Group %1 (Target: %2) to %3 seconds (fn_findKiller).",_unitGroup,name _killer,(_unitGroup getVariable ["pursuitTime",0]) - time]};
};

(units _unitGroup) doTarget (vehicle _killer);
(units _unitGroup) doFire (vehicle _killer);

_trigger = _unitGroup getVariable ["trigger",_victim];
_transmitRange = 125; //distance to broadcast radio text around AI group leader
_chaseDist = 300;

if ((_trigger distance _killer) < _chaseDist) then {
	private ["_killerPos","_leader"];
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Group %1 has entered pursuit state. Target: %2. (fn_findKiller)",_unitGroup,_killer];};
	
	//Temporarily cancel patrol state.
	_unitGroup lockWP true;
	
	//Set pursuit timer
	_unitGroup setVariable ["pursuitTime",time+180];
	_unitGroup setVariable ["targetKiller",_killer];
	
	//Begin pursuit state.
	while {(time < (_unitGroup getVariable ["pursuitTime",0])) && (alive _killer) && ((_unitGroup getVariable ["GroupSize",0]) > 0) && !(isNull _killer) && ((_trigger distance _killer) < _chaseDist) && (!((vehicle _killer) isKindOf "Air"))} do {
		_killerPos = getPosATL _killer;
		(units _unitGroup) doMove _killerPos;
		{if (alive _x) then {_x moveTo _killerPos;/*diag_log "AI unit in pursuit.";*/};} forEach (units _unitGroup);
		if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: AI group %3 in pursuit state. Time: %1/%2.",time,(_unitGroup getVariable ["pursuitTime",0]),_unitGroup];};
		
		if (DZAI_radioMsgs) then {
			_leader = (leader _unitGroup);
			if (((_unitGroup getVariable ["GroupSize",0]) > 1) && !(_leader getVariable ["unconscious",false])) then {
				private ["_nearbyUnits","_radioSpeech"];
				_nearbyUnits = (getPosATL (leader _unitGroup)) nearEntities ["CAManBase",_transmitRange];
				{
					if ((isPlayer _x)&&(_x hasWeapon "ItemRadio")) then {
					//if (isPlayer _x) then {
						_radioSpeech = switch (floor (random 3)) do {
							case 0: {
								format ["[RADIO] %1 (Bandit Leader): Target's name is %2. Find him!",(name _leader),(name _killer)]
							};
							case 1: {
								format ["[RADIO] %1 (Bandit Leader): Target is a %2. Find him!",(name _leader),(typeOf _killer)]
							};
							case 2: {
								format ["[RADIO] %1 (Bandit Leader): Target's distance is %2 meters. Find him!",(name _leader),round (_leader distance _killer)]
							};
							case default {
								"ERROR"
							};
						};
						diag_log format ["DEBUG :: %1",_radioSpeech];
						[nil,_x,"loc",rTITLETEXT,_radioSpeech,"PLAIN DOWN",2] call RE;
					};
				} forEach _nearbyUnits;
			};
		};
		
		sleep 20;
	};

	//End of pursuit state. Re-enable patrol state.
	_unitGroup setVariable ["pursuitTime",0];
	_unitGroup setVariable ["targetKiller",objNull];
	_unitGroup lockWP false;
	_unitGroup setCurrentWaypoint ((waypoints _unitGroup) call BIS_fnc_selectRandom2);
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Pursuit state ended for group %1. Returning to patrol state. (fn_findKiller)",_unitGroup];};
	
	if (DZAI_radioMsgs) then {
		_leader = (leader _unitGroup);
		if (((_unitGroup getVariable ["GroupSize",0]) > 1) && !(_leader getVariable ["unconscious",false])) then {
			private ["_nearbyUnits","_radioSpeech","_radioText"];
			_radioSpeech = if (alive _killer) then {"%1 (Bandit Leader): Lost contact with target. Breaking off pursuit."} else {"%1 (Bandit Leader): Target has been eliminated."};
			_radioText = format [_radioSpeech,(name (leader _unitGroup))];
			_nearbyUnits = (getPosATL (leader _unitGroup)) nearEntities ["CAManBase",_transmitRange];
			{
				if ((isPlayer _x)&&(_x hasWeapon "ItemRadio")) then {
				//if (isPlayer _x) then {
					diag_log _radioText;
					[nil,_x,"loc",rTITLETEXT,_radioText,"PLAIN DOWN",2] call RE;
				};
			} forEach _nearbyUnits;
		};
	};
	sleep 5;
};

_unitGroup setBehaviour "COMBAT";
