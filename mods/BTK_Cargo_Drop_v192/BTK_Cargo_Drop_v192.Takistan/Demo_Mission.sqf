

////  THIS FILE IS FOR THE DEMO MISSION ONLY !


//// Monitor variables
nul = execVM "Demo_getVariable.sqf";


//// Mission variables
_Unit = _this select 1;
_Action = _this select 2;
Demo_Loaded = false;
Demo_Unloaded = false;
Demo_Near = false;
Demo_End = false;


//// Mission flow
_Unit removeAction _Action;
sleep 2;
Demo_Arrow1a setPos [(getPos Demo_Arrow1a select 0),(getPos Demo_Arrow1a select 1),1];
Demo_Arrow1 setPos [(getPos Demo_Arrow1 select 0),(getPos Demo_Arrow1 select 1),5];
hintC "Mission - Deliver Explosives\n\nA special forces team near Bastam needs explosives!\n\nGo to the Little Bird at 12 and select the LOAD CARGO action to load the box!";
sleep 1;
Task1 = player createSimpleTask ["Task1DeliverExplosives"];
Task1 setSimpleTaskDescription ["Deliver Explosives","Deliver Explosives","Deliver Explosives"];
Task1 setSimpleTaskDestination (getPos Demo_LittleBird);
Task1 setTaskState "Created";
nul = [objNull, ObjNull, Task1, "Created"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 1;
player setCurrentTask Task1;
waitUntil {Demo_Loaded};
sleep 3; deleteVehicle Demo_Arrow1; deleteVehicle Demo_Arrow1a;
sleep 3; hintC "Mission - Deliver Explosives\n\nGood, the box has been loaded. Now bring it to the sf team!\n\nInfo\nThe Little Bird is a small vehicle, it can only carry ammoboxes, small objects and static weapons.";
sleep 1;
Task1 setSimpleTaskDestination (getPos Demo_H);
Task1 setTaskState "Assigned";
nul = [objNull, ObjNull, Task1, "Current"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
sleep 1;
player setCurrentTask Task1;
waitUntil {Demo_Near};
sleep 5; hintC "Mission - Deliver Explosives\n\nDrop zone in sight, the special forces are throwing green smoke to mark their position.\nTry to drop the box right onto the green smoke!\n\nInfo\nYou should fly above 60m and faster than 20kph for a good drop.\nYou can also land (or hover below 1m) and unload the box without parachute.";
waitUntil {Demo_Unloaded};
sleep 2; deleteVehicle Demo_Arrow2; deleteVehicle Demo_Arrow3; deleteVehicle Demo_Arrow4; Demo_SFLeader sideChat "Thanks!";
sleep 4; hintC "Mission - Deliver Explosives\n\nPackage dropped! Now the special forces can blow shit up! Wait for the explosion, then you can return to base to try more vehicles...";
waitUntil {Demo_End};
sleep 10; titleText ["Hooah!","Plain Down"];
sleep 1;
nul = [objNull, ObjNull, Task1, "Succeeded"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
Task1 setTaskState "Succeeded";