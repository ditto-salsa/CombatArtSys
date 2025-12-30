#include "CombatArts.h"

// Menu routines

u8 UM_CombatArtsMenuUsability(const struct MenuItemDef* def, int number){

    u8 anyArtsUsable = FALSE;

    for (int i = 0; (int)CombatArtList[i].usability != (-1); i++){

        if (CombatArtList[i].usability == NULL) continue;

        if (ArtTester(gActiveUnit, i)){
            anyArtsUsable = TRUE;
            break;
        }
    }

    return anyArtsUsable ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 UM_CombatArtsMenuEffect(struct MenuProc* menu, struct MenuItemProc* menuItem){

    BuildUsableArtsList();

    gMenu_FirstUsableArtID = 0;

    // Filling up the initial menu items in RAM
    for (u16 i = 0; ; i++) {
        
        // "iterate through" gUsableArts

        if (gUsableArts[i] == 0xFFFF || i == NumberOfArtsInMenuAtOnce || CombatArtList[gUsableArts[i]].nameTextID == 0xFFFF){
            // write the terminator
            MemCpy(&(struct MenuItemDef)MenuItemsEnd, (struct MenuItemDef*)(CAMenuDef.menuItems + i), sizeof(struct MenuItemDef));

            gMenu_LastUsableArtID = i - 1;
            break;
        }

        BuildCombatArtsMenuItemDef(i, (struct MenuItemDef*)(CAMenuDef.menuItems + i));
    }

    if (CAMenuDef.menuItems[0].nameMsgId){ // Checking that there is at least one menu item present
        StartSemiCenteredOrphanMenu(&CAMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 22);
    }

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}

void BuildCombatArtsMenuItemDef(u8 usableArtIndex, struct MenuItemDef* loc){

    #define x CombatArtList[gUsableArts[usableArtIndex]]

    struct MenuItemDef def = {
        .name = (char *)(u32)gUsableArts[usableArtIndex], // this is a horrible hack to store the art's ID in its def
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

// Replaces vanilla function - wasn't able to get it to work when trying to copy and edit menu code, maybe try later? idc too much
void ProcessMenuDpadInput(struct MenuProc* proc)
{
    proc->itemPrevious = proc->itemCurrent;

    // Handle Up keyin

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->itemCurrent == 0)
        {
            if (proc->def == &CAMenuDef){ // absolutely beautiful isn't it :(
                CAMenu_ScrollMenuDefsUp(proc);
            } else {

                if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                    return;

                proc->itemCurrent = proc->itemCount - 1;
            }

        } else {
            proc->itemCurrent--;
        }
    } 

    // Handle down keyin

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->itemCurrent == (proc->itemCount - 1))
        {
            if (proc->def == &CAMenuDef){ // absolutely beautiful isn't it :(
                CAMenu_ScrollMenuDefsDown(proc);       
            } else {

                if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                    return;

                proc->itemCurrent = 0;
            }

        } else {
            proc->itemCurrent++;
        }
    }

    // Update hover display

    if (proc->itemPrevious != proc->itemCurrent)
    {
        DrawMenuItemHover(proc, proc->itemPrevious, FALSE);
        DrawMenuItemHover(proc, proc->itemCurrent, TRUE);

        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
    }

    // Call def's switch in/out funcs

    if (HasMenuChangedItem(proc))
    {
        if (proc->menuItems[proc->itemPrevious]->def->onSwitchOut)
            proc->menuItems[proc->itemPrevious]->def->onSwitchOut(proc, proc->menuItems[proc->itemPrevious]);

        if (proc->menuItems[proc->itemCurrent]->def->onSwitchIn)
            proc->menuItems[proc->itemCurrent]->def->onSwitchIn(proc, proc->menuItems[proc->itemCurrent]);
    }
}

void CAMenu_ScrollMenuDefsUp(struct MenuProc* proc){

    if (proc->itemCount >= NumberOfArtsInMenuAtOnce &&
        (int)(proc->menuItems[proc->itemCurrent]->def->name) != gUsableArts[0]){

        // shift menu defs down by one
        for (int i = NumberOfArtsInMenuAtOnce - 1; i > 0; i--){
            MemCpy((struct MenuItemDef*)(CAMenuDef.menuItems + (i - 1)),(struct MenuItemDef*)(CAMenuDef.menuItems + i), sizeof(struct MenuItemDef));
        }

        gMenu_FirstUsableArtID--; gMenu_LastUsableArtID--;

        BuildCombatArtsMenuItemDef(gMenu_FirstUsableArtID,(struct MenuItemDef*)(CAMenuDef.menuItems));

        for (int i = 0; i < NumberOfArtsInMenuAtOnce; i++){
            ClearText(&(proc->menuItems[i]->text));
        }

        RedrawMenu(proc);

        DrawMenuItemHover(proc, 1, FALSE);
        DrawMenuItemHover(proc, 0, TRUE);

        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

        if (proc->menuItems[1]->def->onSwitchOut){
            proc->menuItems[1]->def->onSwitchOut(proc, proc->menuItems[1]);
        }

        if (proc->menuItems[0]->def->onSwitchIn){
            proc->menuItems[0]->def->onSwitchIn(proc, proc->menuItems[0]);
        }

        if (proc->proc_idleCb == (ProcFunc)0x0804F4A1 /* Menu_AutoHelpBox_OnLoop */){ 
            proc->def->onHelpBox(proc, proc->menuItems[0]);
        }
    }
}

void CAMenu_ScrollMenuDefsDown(struct MenuProc* proc){

    if (proc->itemCount >= NumberOfArtsInMenuAtOnce &&
                (int)(proc->menuItems[proc->itemCurrent]->def->name) != gUsableArts[NumberOfUsableArtsAtOnce] &&
                gUsableArts[gMenu_LastUsableArtID + 1] != 0xFFFF){

        // shift menu defs up by one
        for (int i = 0; i < NumberOfArtsInMenuAtOnce - 1; i++){
            MemCpy((struct MenuItemDef*)(CAMenuDef.menuItems + (i + 1)),(struct MenuItemDef*)(CAMenuDef.menuItems + i), sizeof(struct MenuItemDef));
        }

        gMenu_FirstUsableArtID++; gMenu_LastUsableArtID++;

        BuildCombatArtsMenuItemDef(gMenu_LastUsableArtID,(struct MenuItemDef*)(CAMenuDef.menuItems + (NumberOfArtsInMenuAtOnce - 1)));

        for (int i = 0; i < NumberOfArtsInMenuAtOnce; i++){
            ClearText(&(proc->menuItems[i]->text));
        }

        RedrawMenu(proc);

        DrawMenuItemHover(proc, NumberOfArtsInMenuAtOnce - 2, FALSE);
        DrawMenuItemHover(proc, NumberOfArtsInMenuAtOnce - 1, TRUE);

        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

        if (proc->menuItems[NumberOfArtsInMenuAtOnce - 2]->def->onSwitchOut){
            proc->menuItems[NumberOfArtsInMenuAtOnce - 2]->def->onSwitchOut(proc, proc->menuItems[NumberOfArtsInMenuAtOnce - 2]);
        }

        if (proc->menuItems[NumberOfArtsInMenuAtOnce - 1]->def->onSwitchIn){
            proc->menuItems[NumberOfArtsInMenuAtOnce - 1]->def->onSwitchIn(proc, proc->menuItems[NumberOfArtsInMenuAtOnce - 1]);
        }

        if (proc->proc_idleCb == (ProcFunc)0x0804F4A1 /* Menu_AutoHelpBox_OnLoop */){
            proc->def->onHelpBox(proc, proc->menuItems[NumberOfArtsInMenuAtOnce - 1]);
        }

    }
}
