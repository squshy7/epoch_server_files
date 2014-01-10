//Created by TheSzerdi
_ai = _this select 0;
_ai_type = typeof _ai;

_aikiller = _this select 1;
_aikiller_name = name _aikiller;
_humanityBoost = 200; //Set this to whatever you want the humanity to increase by

_humanity = _aikiller getVariable ["humanity",0];
_humanity = _humanity + _humanityBoost;
_aikiller setVariable["humanity", _humanity,true];

_killsB = _aikiller getVariable["banditKills",0];
_killsB = _killsB + 1;
_aikiller setVariable["banditKills",_killsB,true];

diag_log format ["EMS: AI %1 was killed by %2 (+%3 humanity, new total %4)",_ai_type,_aikiller_name,_humanityBoost,_humanity];

sleep 600;
deletevehicle _ai;

