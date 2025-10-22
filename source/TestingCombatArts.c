#include "CombatArts.h"

// bool
u8 BigAtkArtUsability(){
    return CombatArtGeneralAttackingUsability();
}

u8 BigAtkArtMenuUsability(const struct MenuItemDef* def, int number){
    return CombatArtGeneralAttackingUsability() ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 BigAtkArtEffect(struct MenuProc* menu, struct MenuItemProc* menuItem){
    
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}