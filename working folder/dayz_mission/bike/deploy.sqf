if (false) then {
    cutText [format["You are in combat and cannot build a bike."], "PLAIN DOWN"];
} else {
    player removeAction s_player_deploybike;
    player playActionNow "Medic";
    r_interrupt = false;
    player removeWeapon "ItemToolbox";
    _dis=10;
    _sfx = "repair";
    [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
    [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
 
    sleep 6;
 
    _object = "Old_bike_TK_INS_EP1" createVehicle (position player);
    _object setVariable ["ObjectID", "1", true];
    _object setVariable ["ObjectUID", "1", true];
 
    player reveal _object;
 
    cutText [format["You've used your toolbox to build a bike! Isn't that magical!?"], "PLAIN DOWN"];
 
    r_interrupt = false;
    player switchMove "";
    player playActionNow "stop";
 
    sleep 10;
 
    cutText [format["Warning: Spawned bikes DO NOT SAVE after server restart!"], "PLAIN DOWN"];
 
};
//bike deploy script by Player2 - OpenDayz Release Coming Soon!