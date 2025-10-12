#include "CombatArts.h"

// Main Combat Art internals to do with. various things honestly. could maybe do with being split up into multiple files.

extern struct CombatArt CombatArtList[];

// Function iterators to be put into calc loops
void CombatArtPrebattleFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget){
    for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
        if (CombatArtList[i].preBattleFunction == NULL) continue;

        CombatArtList[i].preBattleFunction(BattleActor, BattleTarget);
    }
}

void CombatArtPostbattleFuncIterator(struct Unit* actor, struct Unit* target, struct ActionData* ad){
    for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
        if (CombatArtList[i].postBattleFunction == NULL) continue;

        CombatArtList[i].postBattleFunction(actor, target, ad);
    }
}

void CombatArtBattleProcFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget, struct BattleHit* bhIterator, struct BattleStats* bs){
    for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
        if (CombatArtList[i].battleProcFunction == NULL) continue;

        CombatArtList[i].battleProcFunction(BattleActor, BattleTarget, bhIterator, bs);
    }
}

int CombatArtRangeFuncIterator(struct Unit* unit, int itemID, int rangeWord){
    int returnedRangeWord = rangeWord; // we LOVE item range fix in this house
    
    for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
        if (CombatArtList[i].rangeFunction == NULL) continue;

        returnedRangeWord = CombatArtList[i].rangeFunction(unit, itemID, returnedRangeWord);
    }

    return returnedRangeWord;
}

// Menu routines

u8 UM_CombatArtsMenuUsability(const struct MenuItemDef* def, int number){

    bool anyArtsUsable = FALSE;

    for (int i = 0; (int)CombatArtList[i].menuUsability != (-1); i++){

        if (CombatArtList[i].menuUsability == NULL) continue;

        if (CombatArtList[i].menuUsability() == TRUE){
            anyArtsUsable = TRUE;
            break;
        }
    }

    return anyArtsUsable ? MENU_ENABLED : MENU_NOTSHOWN;
}

extern const struct MenuDef CAMenuDef;
extern const struct MenuItemDef CAMenu_FillerItemDef;

u8 UM_CombatArtsMenuEffect(struct MenuProc* menu, struct MenuItemProc* menuItem){

    // Filling up the menu items in RAM, firstly these 5 actual options
    for (int i = 0; i < 5; i++){
        MemCpy(&CAMenu_FillerItemDef, (struct MenuItemDef*)((&CAMenuDef)->menuItems + (sizeof(struct MenuItemDef) * i)), sizeof(struct MenuItemDef));
    }
    
    // Then the terminator, which is all zeroes but I am not sure if ram is wiped to 0 on startup
    struct MenuItemDef terminator = MenuItemsEnd;
    MemCpy(&terminator, (struct MenuItemDef*)((&CAMenuDef)->menuItems + (sizeof(struct MenuItemDef) * 5)), sizeof(struct MenuItemDef));

    // Finally actually make the menu and pray everything works as intended
    StartOrphanMenu(&CAMenuDef);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}


u8 CA_MenuArtFillerEntryUsability(const struct MenuItemDef* def, int number){
    return MENU_ENABLED;
}

int CA_MenuArtFillerEntryDraw(struct MenuProc* menu, struct MenuItemProc* menuItem){
    return 0;
}

u8 CA_MenuArtFillerEntryEffect(struct MenuProc* menu, struct MenuItemProc* menuItem){
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}

int CA_MenuArtFillerEntrySwitchIn(struct MenuProc* menu, struct MenuItemProc* menuItem){
    return 0;
}

int CA_MenuArtFillerEntrySwitchOut(struct MenuProc* menu, struct MenuItemProc* menuItem){
    return 0;
}