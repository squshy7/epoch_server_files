switch true do {
    case ((getPlayerUID player) in ["114320838","114331270","113806150"])  :  //Admins: 
        {
        DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemMorphine","ItemPainkiller","ItemBloodbag","ItemWaterbottleBoiled","FoodSteakCooked","20Rnd_762x51_SB_SCAR","20Rnd_762x51_SB_SCAR","20Rnd_762x51_SB_SCAR","20Rnd_762x51_SB_SCAR","ItemBriefcase100oz","Skin_CZ_Soldier_Sniper_EP1_DZ"];
        DefaultWeapons = ["SCAR_H_LNG_Sniper_SD","M9SD","Binocular_Vector","NVGoggles","ItemMap","ItemCompass","ItemGPS","ItemWatch","ItemKnife","ItemToolbox","ItemCrowbar","ItemEtool","ItemHatchet_DZE"];
        DefaultBackpack = "DZ_LargeGunBag_EP1";
        DefaultBackpackWeapon = "";
        };
    case ((getPlayerUID player) in ["123456780"])  : //Moderators: 
        {
        DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","17Rnd_9x19_glock17","17Rnd_9x19_glock17","ItemMorphine","ItemPainkiller","ItemBloodbag","ItemWaterbottleBoiled","ItemWaterbottleBoiled","FoodSteakCooked","8Rnd_B_Saiga12_74Slug","8Rnd_B_Saiga12_74Slug","8Rnd_B_Saiga12_Pellets","ItemGoldBar10oz"];
        DefaultWeapons = ["glock17_EP1","Saiga12K","Binocular_Vector","NVGoggles","ItemMap","ItemToolbox"];
        DefaultBackpack = "DZ_GunBag_EP1";
        DefaultBackpackWeapon = "";
        };
    case ((getPlayerUID player) in ["158151366","236741958"])  : //Pro-Donators:
        {
        DefaultMagazines = ["ItemPainkiller","FoodbeefCooked","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","15Rnd_W1866_Slug","15Rnd_W1866_Slug","ItemBandage","ItemBandage","ItemWaterbottle"];
		DefaultWeapons = ["Winchester1866","glock17_EP1","ItemCompass","ItemToolbox","ItemFlashlight","ItemMap","ItemKnife","ItemHatchet_DZE"]; 
        DefaultBackpack = "DZ_Patrol_Pack_EP1";
        DefaultBackpackWeapon = "";
        };
    case ((getPlayerUID player) in ["128082886","137861638","128750150","105449222","7440708","104158214","152882950","152250246","153017734","67053062","75474118"])  : //Founders:
        {
        DefaultMagazines = ["ItemPainkiller","FoodbeefCooked","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","15Rnd_W1866_Slug","15Rnd_W1866_Slug","ItemBandage","ItemBandage","ItemBandage","ItemSodaMdew","ItemWaterbottle"];
		DefaultWeapons = ["Winchester1866","glock17_EP1","ItemCompass","ItemToolbox","ItemFlashlight"]; 
		DefaultBackpack = "US_Assault_Pack_EP1";
		DefaultBackpackWeapon = "";
        };
    default  //Default Loadout
        {
		DefaultMagazines = ["ItemPainkiller","FoodCanBakedBeans","7Rnd_45ACP_1911","7Rnd_45ACP_1911","ItemBandage","ItemBandage","ItemWaterbottle"];
		DefaultWeapons = ["Colt1911","ItemCompass","ItemFlashlight","Binocular","ItemMap"]; 
		DefaultBackpack = "US_Assault_Pack_EP1";
        };
};