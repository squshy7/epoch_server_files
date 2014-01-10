_crate2 = _this select 0;

clearWeaponCargoGlobal _crate2;
clearMagazineCargoGlobal _crate2;

// RIFLES
_crate2 addWeaponCargoGlobal ["M4A1_RCO_GL", 2];
_crate2 addWeaponCargoGlobal ["M16A4_GL", 2];
_crate2 addWeaponCargoGlobal ["M4A3_CCO_EP1", 2];
_crate2 addWeaponCargoGlobal ["M4SPR", 2];
_crate2 addWeaponCargoGlobal ["SVD", 1];

// PISTOLS
_crate2 addWeaponCargoGlobal ["glock17_EP1", 2];
_crate2 addWeaponCargoGlobal ["MakarovSD", 1];

// AMMUNITION
_crate2 addMagazineCargoGlobal ["17Rnd_9x19_glock17", 10];
_crate2 addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", 10];
_crate2 addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 10];
_crate2 addMagazineCargoGlobal ["10Rnd_762x54_SVD", 10];

// ITEMS
_crate2 addWeaponCargoGlobal ["ItemToolbox", 5];
_crate2 addWeaponCargoGlobal ["ItemMatchbox_DZE", 5];
_crate2 addWeaponCargoGlobal ["ChainSaw", 5];

// BACKPACKS
_crate2 addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];
