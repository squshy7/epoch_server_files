fnc_usec_selfActions = compile preprocessFileLineNumbers "dayz_code\compile\fn_selfActions.sqf";

if (!isDedicated) then {
	player_build		= compile preprocessFileLineNumbers "custom\snap_build\player_build.sqf";
	player_buildControls	= compile preprocessFileLineNumbers "custom\snap_build\player_buildControls.sqf";
	snap_object		= compile preprocessFileLineNumbers "custom\snap_build\snap_object.sqf";
};