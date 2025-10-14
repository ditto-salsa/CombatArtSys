#include "CombatArts.h"

u8 BigAtkArtUsability(){
    return CombatArtGeneralAttackingUsability();
}

u8 BigAtkArtEffect(struct MenuProc* menu, struct MenuItemProc* menuItem){
    
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}