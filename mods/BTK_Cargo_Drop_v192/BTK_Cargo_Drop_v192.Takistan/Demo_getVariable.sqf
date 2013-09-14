

////  THIS FILE IS FOR THE DEMO MISSION ONLY !


//// If not yet set, set true or false

//// IMPORTANT to avoid RPT errors !!!
Demo_Box setVariable ["BTK_CargoDrop_ObjectLoaded", false];
Demo_LittleBird setVariable ["BTK_CargoDrop_TransporterLoaded", false];


//// Wait until loaded

waitUntil {(Demo_Box getVariable "BTK_CargoDrop_ObjectLoaded") && (Demo_LittleBird getVariable "BTK_CargoDrop_TransporterLoaded")};
Demo_Loaded = true;


//// Wait until UNloaded

waitUntil {!(Demo_Box getVariable "BTK_CargoDrop_ObjectLoaded") && !(Demo_LittleBird getVariable "BTK_CargoDrop_TransporterLoaded")};
Demo_Unloaded = true;