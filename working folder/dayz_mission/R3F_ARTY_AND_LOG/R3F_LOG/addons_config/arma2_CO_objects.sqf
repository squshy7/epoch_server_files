/**
 * English and French comments
 * Commentaires anglais et français
 * 
 * This file adds the ArmA 2 and Arrowhead objetcs in the configuration variables of the logistics system.
 * Fichier ajoutant les objets d'ArmA 2 et Arrowhead dans la configuration du système de logistique.
 * 
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 * Note importante : Tous les noms de classes dérivant de celles utilisées dans les variables de configuration seront aussi valables.
 */

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of vehicles which can tow towable objects.
 * This is the list of Vehicles that are ABLE to tow.
 */
R3F_LOG_CFG_remorqueurs = R3F_LOG_CFG_remorqueurs +
[
	"UralRepair_CDF",
	"UralRepair_INS",
	"UralRefuel_CDF",
	"UralRefuel_INS",
	"Ural_CDF",
	"Ural_INS",
	"UralOpen_INS",
	"UralCivil",
	"UralCivil2",
	"V3S_Civ",
	"MTVR",
	"Ural_TK_CIV_EP1",
	"Ural_UN_EP1",
	"MtvrRefuel_DES_EP1_DZ",
	"V3S_Refuel_TK_GUE_EP1_DZ",
	"V3S_Open_TK_CIV_EP1",
	"V3S_Open_TK_EP1",
	"UralRefuel_TK_EP1_DZ",
	"IL_transit_truck",
	"Kamaz",
	"KamazOpen",
	"KamazRepair",
	"KamazRefuel_DZ",
	"MTVR_DES_EP1"
		
];

/**
 * List of class names of towables objects.
 * This is the list of vehicles that ARE towable
 */
R3F_LOG_CFG_objets_remorquables = R3F_LOG_CFG_objets_remorquables +
[
	"ATV_CZ_EP1",
	"C130J_US_EP1",
	"GAZ_Vodnik_HMG",
	"BTR90_HQ",
	"HMMWV_Ambulance_DZ",
	"GAZ_Vodnik",
	"GAZ_Vodnik_DZ_LM",
	"GAZ_Vodnik_DZ_VLM",
	"GAZ_Vodnik_MedEvac",
	"HMMWV",
	"HMMWV_DES_EP1",
	"S1203_TK_CIV_EP1",
	"Tractor",
	"SUV_PMC",
	"tractorOld",
	"Ikarus",
	"Ikarus_TK_CIV_EP1",
	"SUV_TK_CIV_EP1",
	"HMMWV_DZ",
	"S1203_TK_CIV_EP1",
	"SUV_TK_CIV_EP1",
	"SUV_TK_EP1",
	"Skoda",
	"SkodaBlue",
	"SkodaGreen",
	"SkodaRed",
	"VolhaLimo_TK_CIV_EP1",
	"Volha_1_TK_CIV_EP1",
	"Volha_2_TK_CIV_EP1",
	"VWGolf",
	"car_hatchback",
	"car_sedan",
	"Lada1",
	"Lada1_TK_CIV_EP1",
	"Lada2",
	"Lada2_TK_CIV_EP1",
	"LadaLM",
	"policecar",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open_EP1",
	"SUV_Blue",
	"SUV_Charcoal",
	"SUV_Green",
	"SUV_Orange",
	"SUV_Pink",
	"SUV_Red",
	"SUV_Silver",
	"SUV_White",
	"SUV_Yellow",
	"S1203_ambulance_EP1",
	"Pickup_PK_TK_GUE_EP1",
	"UAZ_CDF",
	"UAZ_CDF",
	"UAZ_INS",
	"UAZ_RU",
	"HMMWV_Ambulance",
	"Offroad_DSHKM_Gue",
	"LandRover_MG_TK_EP1",
	"ArmoredSUV_PMC_DZ",
	"HMMWV_M998A2_SOV_DES_EP1",
	"HMMWV_M1035_DES_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1",
	"VIL_vivaro_amb",
	"VIL_vwt4_civ",
	"VIL_berlingo",
	"VIL_bmw7_civilvip",
	"VIL_bmw7_civil1",
	"VIL_bmw7_civil",
	"VIL_bmw7_civil2",
	"VIL_vivaro_civ",
	"VIL_asistvan",
	"VIL_transit_civ",
	"VIL_ducato_bus",
	"VIL_hilux1_civil",
	"VIL_hilux1_civi2",
	"VIL_hilux1_civi3",
	"VIL_hilux1_police",
	"VIL_bmw7_civilvip",
	"VIL_bmw7_civil",
	"VIL_bmw7_civil1",
	"VIL_bmw7_civil2",
	"VIL_alfa_civil",
	"VIL_alfa_civil1",
	"VIL_alfa_civil2",
	"VIL_citrone_civil",
	"VIL_citrone_civil1",
	"VIL_citrone_civil2",
	"VIL_citrone_civil3",
	"VIL_passat_civil",
	"VIL_passat_civil1",
	"VIL_passat_civil2",
	"VIL_passat_civil3",
	"VIL_passat_civil4",
	"VIL_passat_civil5",
	"VIL_smart_civil",
	"VIL_smart_civil1",
	"VIL_smart_civil2",
	"VIL_smart_civil3",
	"VIL_smart_civil4",
	"VIL_smart_civil5",
	"VIL_panda_civil1",
	"VIL_panda_civil",
	"VIL_kia_ceeddwa",
	"VIL_kia_ceeddwa2",
	"VIL_kia_ceed",
	"VIL_kia_ceed2",
	"VIL_mondeo_civil",
	"VIL_mondeo_civil1",
	"VIL_mondeo_civil3",
	"VIL_octavia_civil",
	"VIL_octavia_civil2",
	"VIL_octavia_civil3",
	"VIL_fobia_civil",
	"VIL_fobia_civil1",
	"VIL_fobia_civil2",
	"VIL_fobia_civil3",
	"VIL_fobia_civil4",
	"VIL_fobia_civil5",
	"VIL_mondeo_civil4",
	"VIL_mondeo_civil5",
	"VIL_octavia_civil4",
	"VIL_kia_ceed3",
	"VIL_kia_ceed4",
	"VIL_kia_ceeddwa3",
	"VIL_kia_ceeddwa4",
	"VIL_kia_ceeddwa5",
	"VIL_kia_ceeddwa6",
	"VIL_lublin_freez",
	"VIL_volvofl",
	"VIL_Star_S2000o",
	"VIL_Star_S2000",
	"VIL_sprinter_cargo",
	"VIL_karoca_civil_red",
	"VIL_karoca_civil",
	"VIL_ducato_cargo",
	"VIL_ducato_cargo2",
	"VIL_vwt4_banksec",
	"CSJ_GyroC",
	"CSJ_GyroCover",
	"CSJ_GyroP"
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftable objects.
 * This is the list of HELICOPTERS that can lift
 */
R3F_LOG_CFG_heliporteurs = R3F_LOG_CFG_heliporteurs +
[
	"UH60M_MEV_EP1"
	
];

/**
 * List of class names of liftable objects.
 * This is the list of vehicles that CAN be lifted
 */
R3F_LOG_CFG_objets_heliportables = R3F_LOG_CFG_objets_heliportables +
[
	"UAZ_MG_INS",
	"UralRepair_CDF",
	"UralRepair_INS",
	"GAZ_Vodnik_HMG",
	"BTR90_HQ",
	"HMMWV_Ambulance_DZ",
	"GAZ_Vodnik",
	"GAZ_Vodnik_DZ_LM",
	"GAZ_Vodnik_DZ_VLM",
	"GAZ_Vodnik_MedEvac",
	"Kamaz",
	"KamazOpen",
	"KamazRepair",
	"KamazRefuel_DZ",
	"HMMWV",
	"HMMWV_DES_EP1",
	"S1203_TK_CIV_EP1",
	"UralRefuel_CDF",
	"UralRefuel_INS",
	"Tractor",
	"Ural_CDF",
	"Ural_INS",
	"UralOpen_INS",
	"UralCivil",
	"UralCivil2",
	"SUV_PMC",
	"tractorOld",
	"Ikarus",
	"V3S_Civ",
	"Ikarus_TK_CIV_EP1",
	"SUV_TK_CIV_EP1",
	"MTVR",
	"HMMWV_DZ",
	"S1203_TK_CIV_EP1",
	"SUV_TK_CIV_EP1",
	"SUV_TK_EP1",
	"Ural_TK_CIV_EP1",
	"UAZ_MG_INS_DZ_LM",
	"UAZ_MG_INS_DZ_VLM",
	"UAZ_MG_CDF",
	"UAZ_MG_CDF_DZ_LM",
	"UAZ_MG_CDF_DZ_VLM",
	"policecar",
	"PaperCar",
	"PBX",
	"Fishing_Boat",
	"UAZ_CDF",
	"UAZ_RU",
	"Skoda",
	"SkodaBlue",
	"SkodaRed",
	"SkodaGreen",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"car_hatchback",
	"car_sedan",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"Lada_base",
	"Lada1",
	"Lada2",
	"LadaLM",
	"UAZ_Unarmed_TK_CIV_EP1",
	"UAZ_Unarmed_UN_EP1",
	"ATV_US_EP1",
	"ATV_CZ_EP1",
	"Old_bike_TK_CIV_EP1",
	"Old_bike_TK_INS_EP1",
	"PBX",
	"Volha_2_TK_CIV_EP1",
	"Volha_1_TK_CIV_EP1",
	"hilux1_civil_3_open_EP1",
	"LandRover_CZ_EP1",
	"Lada1_GDR",
	"Lada2_GDR",
	"Lada2_TK_CIV_EP1",
	"Lada4_GDR",
	"Lada5_GDR",
	"M1030_US_DES_EP1",
	"MMT_Civ",
	"BAF_Offroad_D",
	"BAF_Offroad_W",
	"PBX_DZ",
	"Lada",
	"Lada1_TK_CIV_EP1",
	"LandRover_TK_CIV_EP1",
	"AN2_DZ",
	"VolhaLimo_TK_CIV_EP1",
	"UAZ",
	"M1030",
	"TT650_Ins",
	"TT650_Gue",
	"VWGolf",
	"TT650_Civ",
	"datsun1_civil_3_open",
	"Smallboat_1",
	"Smallboat_2",
	"TT650_TK_EP1",
	"UAZ_Unarmed_TK_EP1",
	"TT650_TK_CIV_EP1",
	"Old_moto_TK_Civ_EP1",
	"GNT_C185U",
	"GNT_C185",
	"GNT_C185R",
	"GNT_C185C",
	"Offroad_DSHKM_Gue",
	"LandRover_MG_TK_EP1",
	"ArmoredSUV_PMC_DZ",
	"HMMWV_M998A2_SOV_DES_EP1",
	"HMMWV_M1035_DES_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1",
	"VIL_vivaro_amb",
	"VIL_vwt4_civ",
	"VIL_berlingo",
	"VIL_bmw7_civilvip",
	"VIL_bmw7_civil1",
	"VIL_bmw7_civil",
	"VIL_bmw7_civil2",
	"VIL_vivaro_civ",
	"VIL_asistvan",
	"VIL_transit_civ",
	"VIL_ducato_bus",
	"VIL_hilux1_civil",
	"VIL_hilux1_civi2",
	"VIL_hilux1_civi3",
	"VIL_hilux1_police",
	"VIL_bmw7_civilvip",
	"VIL_bmw7_civil",
	"VIL_bmw7_civil1",
	"VIL_bmw7_civil2",
	"VIL_alfa_civil",
	"VIL_alfa_civil1",
	"VIL_alfa_civil2",
	"VIL_citrone_civil",
	"VIL_citrone_civil1",
	"VIL_citrone_civil2",
	"VIL_citrone_civil3",
	"VIL_passat_civil",
	"VIL_passat_civil1",
	"VIL_passat_civil2",
	"VIL_passat_civil3",
	"VIL_passat_civil4",
	"VIL_passat_civil5",
	"VIL_smart_civil",
	"VIL_smart_civil1",
	"VIL_smart_civil2",
	"VIL_smart_civil3",
	"VIL_smart_civil4",
	"VIL_smart_civil5",
	"VIL_panda_civil1",
	"VIL_panda_civil",
	"VIL_kia_ceeddwa",
	"VIL_kia_ceeddwa2",
	"VIL_kia_ceed",
	"VIL_kia_ceed2",
	"VIL_mondeo_civil",
	"VIL_mondeo_civil1",
	"VIL_mondeo_civil3",
	"VIL_octavia_civil",
	"VIL_octavia_civil2",
	"VIL_octavia_civil3",
	"VIL_fobia_civil",
	"VIL_fobia_civil1",
	"VIL_fobia_civil2",
	"VIL_fobia_civil3",
	"VIL_fobia_civil4",
	"VIL_fobia_civil5",
	"VIL_mondeo_civil4",
	"VIL_mondeo_civil5",
	"VIL_octavia_civil4",
	"VIL_kia_ceed3",
	"VIL_kia_ceed4",
	"VIL_kia_ceeddwa3",
	"VIL_kia_ceeddwa4",
	"VIL_kia_ceeddwa5",
	"VIL_kia_ceeddwa6",
	"VIL_lublin_freez",
	"VIL_volvofl",
	"VIL_Star_S2000o",
	"VIL_Star_S2000",
	"VIL_sprinter_cargo",
	"VIL_karoca_civil_red",
	"VIL_karoca_civil",
	"VIL_ducato_cargo",
	"VIL_ducato_cargo2",
	"IL_transit_truck",
	"VIL_vwt4_banksec",
	"V3S_Refuel_TK_GUE_EP1_DZ",
	"V3S_Open_TK_EP1",
	"V3S_Open_TK_CIV_EP1",
	"Ural_UN_EP1",
	"Ural_TK_CIV_EP1",
	"UralRefuel_TK_EP1_DZ",
	"ATV_CZ_EP1",
	"C130J_US_EP1",
	"CSJ_GyroC",
	"CSJ_GyroCover",
	"CSJ_GyroP"
	
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USSpecialWeaponsBox "weights" 5 units.
 * 
 * Cette section utilise une quantification du volume et/ou poids des objets.
 * Le référentiel arbitraire utilisé est : une caisse de munition de type USSpecialWeaponsBox "pèse" 5 unités.
 * 
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 * 
 * Note : la priorité d'une déclaration de capacité sur une autre correspond à leur ordre dans les tableaux.
 *   Par exemple : la classe "Truck" appartient à la classe "Car" (voir http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   Si "Truck" est déclaré avec une capacité de 140 avant "Car". Et que "Car" est déclaré après "Truck" avec une capacité de 40,
 *   Alors toutes les sous-classes appartenant à "Truck" auront une capacité de 140. Et toutes les sous-classes appartenant
 *   à "Car", exceptées celles de "Truck", auront une capacité de 40.
 */

/**
 * List of class names of (ground or air) vehicles which can transport transportable objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * [Vehicle Name, Capacity],
 * ["Ikarus", 50],
 */
R3F_LOG_CFG_transporteurs = R3F_LOG_CFG_transporteurs +
[
	
];

/**
 * List of class names of transportable objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * [VEHICLE NAME, COST CAPACITY],
 * ["ATV_Base_EP1", 20],
 */
R3F_LOG_CFG_objets_transportables = R3F_LOG_CFG_objets_transportables +
[
	
];


/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects moveable by player.
 * "MASH",
 */
R3F_LOG_CFG_objets_deplacables = R3F_LOG_CFG_objets_deplacables +
[

];