#include "CombatArts.h"

// Menu routines

u8 UM_CombatArtsMenuUsability(const struct MenuItemDef* def, int number){

    u8 anyArtsUsable = FALSE;

    for (int i = 0; IsNotCombatArtListTerminator(i); i++){

        if (CombatArtList[i].usability == NULL) continue;

        if (CombatArtList[i].usability(gActiveUnit) == TRUE){
            anyArtsUsable = TRUE;
            break;
        }
    }

    return anyArtsUsable ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 UM_CombatArtsMenuEffect(struct MenuProc* menu, struct MenuItemProc* menuItem){

    BuildActiveUnitsArtsList();

    // Filling up the initial menu items in RAM
    for (u16 i = 0; ; i++) {
        
        // "iterate through" gActiveUnitUsableArts

        if (gActiveUnitUsableArts[i] == 0xFFFF || i == NumberOfArtsInMenuAtOnce || IsCombatArtListTerminator(gActiveUnitUsableArts[i])){
            // write the terminator
            MemCpy(&(struct MenuItemDef)MenuItemsEnd, (struct MenuItemDef*)(CAMenuDef.menuItems + i), sizeof(struct MenuItemDef));
            break;
        }

        BuildCombatArtsMenuItemDef(i, (struct MenuItemDef*)(CAMenuDef.menuItems + i));
    }

    if (CAMenuDef.menuItems->nameMsgId){ // Checking that there is at least one menu item present

        // Finally actually make the menu and pray everything works as intended
        StartOrphanMenu(&CAMenuDef);
    }

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}

void BuildCombatArtsMenuItemDef(u8 usableArtIndex, struct MenuItemDef* loc){

    #define x CombatArtList[gActiveUnitUsableArts[usableArtIndex]]

    struct MenuItemDef def = {
        .name = (char *)(u32)gActiveUnitUsableArts[usableArtIndex], // this is a horrible hack to store the art's ID in its def
        .nameMsgId = x.nameTextID,
        .helpMsgId = x.descTextID,
        .color = 0,
        .overrideId = 0,
        .isAvailable = x.menuUsability,
        .onDraw = x.menuDraw,
        .onSelected = x.menuEffect,
        .onIdle = NULL,
        .onSwitchIn = NULL,
        .onSwitchOut = NULL
    };

    #undef x

    MemCpy(&def, loc, sizeof(struct MenuItemDef));
}
