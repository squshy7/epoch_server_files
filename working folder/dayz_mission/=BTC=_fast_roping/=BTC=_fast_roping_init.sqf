#include "=BTC=_functions.sqf"
BTC_fast_rope_h = 50;
BTC_AI_fast_rope_on_deploy = 1;
BTC_roping_chopper = ["Mi17_Civilian_DZ","MV22_DZ","UH1H_DZE","UH1H_TK_EP1","Mi17_DZE","AH6X_DZ","MH6J_DZ","UH1Y_DZE","CH_47F_EP1_DZE","CH_47F_EP1","MH60S","Mi17_UN_CDF_EP1","UH60M_MEV_EP1","UH60M_EP1","UH60M_EP1_DZE"];
{
	_rope = _x addaction [("<t color=""#ED2744"">") + ("Deploy rope") + "</t>","=BTC=_fast_roping\=BTC=_addAction.sqf",[[],BTC_deploy_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] != ""1"" && ((getPos _target) select 2) < BTC_fast_rope_h && speed _target < 2"];
	_rope = _x addaction [("<t color=""#ED2744"">") + ("Cut rope") + "</t>","=BTC=_fast_roping\=BTC=_addAction.sqf",[[],BTC_cut_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""];
	_out  = _x addaction [("<t color=""#ED2744"">") + ("Fast rope") + "</t>","=BTC=_fast_roping\=BTC=_addAction.sqf",[[player],BTC_fast_rope],7,true,false,"","player in (assignedCargo _target) && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""];
} foreach (nearestObjects [[3000,3000,0], BTC_roping_chopper, 50000]);
	