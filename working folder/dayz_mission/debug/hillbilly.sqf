//Created by TheSzerdi
while {MissionGoMinor == 1} do {
waitUntil{{isPlayer _x && _x distance Mcoords < 200  } count playableunits > 0};
_nul = [objNull, player, rSAY, "hillbilly"] call RE;
sleep 30;
playSound "hillbilly";
sleep 2;
cutText ["The Slender comes", "PLAIN DOWN", 3]; titleFadeOut 4;
};
