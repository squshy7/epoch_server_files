//By Craig
//Chooses the next sidemission
if(!isServer) exitWith {};
private ["_numb","_element","_num","_firstRun"];

if(isNil {ReAccur}) then { ReAccur = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8","SM9","SM10","SM11","SM12","SM13"];};
if(isNil {SMCarray}) then { SMCarray = [];};
if (count SMarray == 0) then
{
_element = ReAccur call BIS_fnc_selectRandom;
} else {
_numb = count SMarray;
_num = floor (random _numb);
_element = SMarray select _num;
_Earray = [_element];
};

[] execVM format ["\z\addons\dayz_server\EMS\major\%1.sqf",_element];