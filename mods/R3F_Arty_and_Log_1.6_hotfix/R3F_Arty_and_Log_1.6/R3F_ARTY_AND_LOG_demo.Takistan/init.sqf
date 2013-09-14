execVM "R3F_ARTY_AND_LOG\init.sqf"

// For the demo mission only : explanation about the tiny objectives
execVM "briefing.sqf";

// For the demo mission only : give a GPS and binoculars to the player
if !(isServer && isDedicated) then
{
	setViewDistance 3500;
	
	[] spawn
	{
		sleep 1;
		
		while {true} do
		{
			player addWeapon "ItemGPS";
			player addWeapon "Binocular";
			
			waitUntil {!alive player};
			waitUntil {alive player};
		};
	};
};