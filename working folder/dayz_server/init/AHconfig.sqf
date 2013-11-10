/*  Key to open the menu  */ _OpenMenuKey = 0x3C;    /* google DIK_KeyCodes (0x3C is F2) */
/*  AdminPassword         */ _AdminPassword = "Samsunn1";

/*  Mod OverWatch ?       */ _MOW = false;   /* true or false */
/*  Mod EPOCH ?           */ _MEH =  true;   /* true or false */

/*  LOW ADMIN HERE        */ _LowLevel_List = 	["0","0","0"]; //do not have a , at the end.
/*  NORMAL ADMIN HERE     */ _NormalLevel_List =["0","0","0"]; //do not have a , at the end.
/*  SUPER ADMIN HERE      */ _SuperLevel_List = ["113806150","114320838","114331270"]; //do not have a , at the end.
/*  BANNED PLAYER HERE    */ _BLOCKED =			["0","0","0"]; //do not have a , at the end.

/*  Top esc menu TXT      */ _TopOfESC = 'KoN'; //do not use ' or " in this text.
/*  Bottom esc menu TXT   */ _LowerTop = 'KoN'; //do not use ' or " in this text.
/*  Bottom esc menu TXT2  */ _LowerBottom = 'Knights of Nom'; //do not use ' or " in this text.
/*  Color esc menu TXT    */ _EscColor = [0.68,0.03,0.17,1];

/*  DebugMonitor TXT      */ _BottomDebug = 'Knights of Nom'; //do not use ' or " in this text.
/*  DebugMonitor Key      */ _ODK =  0xCF;	/* google DIK_KeyCodes (0xCF is END) */
/*  Use DebugMonitor      */ _DMS =  true;	/* true or false */	/* starts up with debugmonitor ON if true */
/*  DebugMonitor Action   */ _DMW = false;	/* true or false */	/* "Debug" option on mousewheel */
/*  DebugMonitor ITEM     */ _DBI = false;	/* item or false */	/* _DBI = 'your item choice'; */

/*  BLOCK ALL CMDMenus    */ _BCM =  true;   /* true or false */	/* we don't need commandingMenus. */
/*  Check Actions ?       */ _CSA =  true;   /* true or false */	/* tested mods: DayZ/Epoch/OverWatch */
/*  Use AUTOBAN HACKER    */ _UAB =  true;   /* true or false */	/* recommended to use - we always used this. */
/*  Use FileScan ?        */ _UFS =  true;   /* true or false */	/* spams the rpt but often finds hackers */
/*  Use _AdminPassword ?  */ _APW = false;   /* true or false */	/* admins need to insert a password on load in */
/*  Use cut-scene ?       */ _UCS =  true;   /* true or false */	/* dynamicText ~ often colored, animated or used in credits */
/*  Use SafeZones ?       */ _USZ =  true;   /* true or false */	/* if you have a zone where people get godmode/anti zombie aggro */
/*  Forbid VON Sidechat   */ _VON = false;   /* true or false */	/* talking on sidechat will put out a warning and kick if continue */
/*  Use vehicle check?    */ _UVC = false;   /* true or false */	/* using _ALLOWED_Vehicles and _FORBIDDEN_Vehicles lists */
/*  Vehicle WHITELIST     */ _UVW = false;   /* true or false */	/* if false - _ALLOWED_Vehicles won't not be used */
/* ********************************************************************************* */
/*  Player that have one of the items in _ForbiddenWeapons in their inventory will get punished!  */
/*  FORBIDDEN Weapons     */ _ForbiddenWeapons = ['RAILGUN','P00PGUN','LEAKTUBE'];
/* ********************************************************************************* */
/*  If _UVC = true; and _UVW = true; this check will start and delete all vehicles that are not in _ALLOWED_Vehicles  */
/*  ALLOWED  Vehicles     */ _ALLOWED_Vehicles = ['ALL IF _UVW = false','Tractor','Policecar'];
/* ********************************************************************************* */
/*  If _UVC = true; this check will start and delete all vehicles that are in _FORBIDDEN_Vehicles  */
/*  FORBIDDEN Vehicles    */ _FORBIDDEN_Vehicles = ['A10','AH1Z','AH64D','T90'];
/* ********************************************************************************* */
/*  ALLOWED CMDMenus      */ _cMenu = 
[
	'','RscMainMenu','RscMoveHigh','#WATCH','#WATCH0',
	'RscWatchDir','RscDisplayClassSelecter','RscDisplayGenderSelect',
	'RscDisplaySpawnSelecter','RscWatchMoreDir','#GETIN','RscStatus',
	'RscCombatMode','RscFormations','RscTeam','RscSelectTeam','RscReply',
	'RscCallSupport','#ACTION','#CUSTOM_RADIO','RscRadio','RscGroupRootMenu'
];