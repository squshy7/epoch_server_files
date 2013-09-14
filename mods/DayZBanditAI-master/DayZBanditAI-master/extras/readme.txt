DZAI Extra Files
------------------

These files contained inside this folder are not required to run DZAI, but can be useful to server admins.

1. DZAI Static Trigger Files
	
	Contains .biedi files that can be used by the ArmA2 3D Editor to view and modify DZAI's static AI spawns on a per-map basis. 
	To import your changes to DZAI, copy the triggers from the .sqf produced by the 3D editor (not the .biedi file!) and replace the preset triggers in the appropriate file inside DZAI's world_map_configs folder. 
	Be careful not to accidentally copy over any markers present inside the .sqf file.
	
2. PBO Prefix File

	If you encounter problems entering the game after repacking your dayz_server.pbo, copy the $PBOPREFIX$ file into your dayz_server folder and repack the folder into .pbo format. 
	