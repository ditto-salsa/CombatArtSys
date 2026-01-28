#include "CombatArts.h"

// bool
u8 BigAtkArtUsability(struct Unit* unit, u16 artID){
    return CombatArtGeneralAttackingUsability();
}

u8 BigAtkArtMenuUsability(const struct MenuItemDef* def, int number){
    return BigAtkArtUsability(gActiveUnit, ART_ID_FROM_MENUDEF(def)) ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 BigAtkArtEffect(struct MenuProc* menu, struct MenuItemProc* menuItem){

    SetActiveArt(gActiveUnit, ART_ID_FROM_MENUDEF(menuItem->def));

    ResetIconGraphics();
    LoadIconPalettes(4);
    return StartUnitWeaponSelect(menu, menuItem);
}

void BigAtkArtPreBattle(u16 artID, struct BattleUnit* actor, struct BattleUnit* target){
    actor->battleAttack += 50;
}
