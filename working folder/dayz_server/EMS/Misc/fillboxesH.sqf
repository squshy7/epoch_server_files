_crate3 = _this select 0;

clearWeaponCargoGlobal _crate3;
clearMagazineCargoGlobal _crate3;

// SNIPERRIFLES
_crate3 addWeaponCargoGlobal ["M40A3", 1];
_crate3 addWeaponCargoGlobal ["M24_des_EP1", 1];
_crate3 addWeaponCargoGlobal ["SVD_CAMO", 1];
_crate3 addWeaponCargoGlobal ["SVD", 1];
_crate3 addWeaponCargoGlobal ["SVD_des_EP1", 1];

// PISTOLS
_crate3 addWeaponCargoGlobal ["M9SD", 2];
_crate3 addWeaponCargoGlobal ["MakarovSD", 2];

// AMMUNITION
_crate3 addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 10];
_crate3 addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", 2];
_crate3 addMagazineCargoGlobal ["10Rnd_762x54_SVD", 10];

// CLOTHING
_crate3 addMagazineCargoGlobal ["Skin_Sniper1_DZ", 2];

// BACKPACKS
_crate3 addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];
