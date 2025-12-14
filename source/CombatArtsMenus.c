#include "CombatArts.h"

// Menu routines

u8 UM_CombatArtsMenuUsability(const struct MenuItemDef* def, int number){

    u8 anyArtsUsable = FALSE;

    for (int i = 0; (int)CombatArtList[i].usability != (-1); i++){

        if (CombatArtList[i].usability == NULL) continue;

        if (CombatArtList[i].usability(gActiveUnit) == TRUE){
            anyArtsUsable = TRUE;
            break;
        }
    }

    return anyArtsUsable ? MENU_ENABLED : MENU_NOTSHOWN;
}

static u8 sItemCountYOffsetLookup[12] = { 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 3, 3 };
u8 UM_CombatArtsMenuEffect(struct MenuProc* menu, struct MenuItemProc* menuItem){

    BuildActiveUnitsArtsList();

    gFirstMenuItemActiveArtID = 0;

    // Filling up the initial menu items in RAM
    for (u16 i = 0; ; i++) {
        
        // "iterate through" gActiveUnitUsableArts

        if (gActiveUnitUsableArts[i] == 0xFFFF || i == NumberOfArtsInMenuAtOnce || CombatArtList[gActiveUnitUsableArts[i]].nameTextID == 0xFFFF){
            // write the terminator
            MemCpy(&(struct MenuItemDef)MenuItemsEnd, (struct MenuItemDef*)(CAMenuDef.menuItems + i), sizeof(struct MenuItemDef));

            gLastMenuItemActiveArtID = i - 1;
            break;
        }

        BuildCombatArtsMenuItemDef(i, (struct MenuItemDef*)(CAMenuDef.menuItems + i));
    }

    if (CAMenuDef.menuItems[0].nameMsgId){ // Checking that there is at least one menu item present

        // Finally actually make the menu and pray everything works as intended
        //StartSemiCenteredOrphanMenu(&CAMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 22); would be the vanilla line, but we need to modify it to be scrollable
        
        struct MenuRect rect = CAMenuDef.rect;
        if (gBmSt.cursorTarget.x - gBmSt.camera.x < 120){
            rect.x = 22;
        } else {
            rect.x = 1;
        }
        
        struct MenuProc* proc = StartScrollableMenuCore(&CAMenuDef, rect, 1, TILEREF(0,0), 0, 0, NULL);

        if (proc->itemCount > 6){
            proc->rect.y -= sItemCountYOffsetLookup[proc->itemCount];

            for (u8 i = 0; i < proc->itemCount; ++i){
                proc->menuItems[i]->yTile -= sItemCountYOffsetLookup[proc->itemCount];
            }
        }
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

const struct ProcCmd sProc_CAMenu_MenuMain[] = {
    PROC_REPEAT(CAMenu_Menu_OnIdle),

    PROC_CALL(EndGreenText),
    PROC_END
};

const struct ProcCmd sProc_CAMenu_Menu[] = {
    PROC_YIELD,

    PROC_WHILE_EXISTS((ProcPtr)0x0859A548/* ProcScr_CamMove */),

    PROC_CALL(StartGreenText),

    PROC_CALL(RedrawMenu),
    PROC_CALL(Menu_OnInit),

    PROC_JUMP(sProc_CAMenu_MenuMain),
    PROC_END
};

const struct ProcCmd sProc_CAMenu_MenuAutoHelpBox[] = {
    PROC_CALL((ProcFunc)0x0804F475/* Menu_AutoHelpBox_OnInit */),
    PROC_REPEAT(CAMenu_Menu_AutoHelpBox_OnLoop),
    PROC_END
};

struct MenuProc* StartScrollableMenuCore(
    const struct MenuDef* def,
    struct MenuRect rect,
    int backBg,
    int tileref,
    int frontBg,
    int unk,
    ProcPtr parent)
{
    struct MenuProc* proc;
    int i, itemCount;

    int xTileInner = rect.x + 1;
    int yTileInner = rect.y + 1;

    BG_SetPosition(frontBg, 0, 0);
    BG_SetPosition(backBg, 0, 0);

    PlaySoundEffect(SONG_68);

    if (parent)
    {
        proc = Proc_StartBlocking(sProc_CAMenu_Menu, parent);
        proc->state = 0;
    }
    else
    {
        LockGame();

        proc = Proc_Start(sProc_CAMenu_Menu, PROC_TREE_3);
        proc->state = MENU_STATE_GAMELOCKING;
    }

    if (rect.h < 0)
        proc->state |= MENU_STATE_NOTSHOWN;

    for (i = 0, itemCount = 0; def->menuItems[i].isAvailable; ++i)
    {
        int availability = OverriddenMenuAvailability(&def->menuItems[i], i);

        if (!availability)
            availability = def->menuItems[i].isAvailable(&def->menuItems[i], i);

        if (availability != MENU_NOTSHOWN)
        {
            struct MenuItemProc* item = Proc_Start((struct ProcCmd*)0x085B6510/* sProc_MenuItem */, proc);
            proc->menuItems[itemCount++] = item;

            item->def = &def->menuItems[i];
            item->itemNumber = i;
            item->availability = availability;

            item->xTile = xTileInner;
            item->yTile = yTileInner;

            if (!(proc->state & MENU_STATE_NOTSHOWN))
                InitText(&item->text, rect.w - 1);

            yTileInner += 2;
        }
    }

    proc->def = def;
    proc->rect = rect;
    proc->itemCount = itemCount;
    proc->itemCurrent = 0;
    proc->itemPrevious = -1;

    if (rect.y + rect.h < yTileInner)
        proc->rect.h = yTileInner + 1 - rect.y;

    proc->backBg  = backBg & 3;
    proc->tileref = tileref;
    proc->frontBg = frontBg & 3;
    proc->unk68   = unk;

    gKeyStatusPtr->newKeys = 0;

    return proc;
}

void CAMenu_Menu_OnIdle(struct MenuProc* proc)
{
    int x, y, actions;

    if (proc->state & MENU_STATE_FROZEN)
    {
        GetMenuCursorPosition(proc, &x, &y);
        DisplayFrozenUiHand(x, y);

        return;
    }

    if (proc->state & MENU_STATE_DOOMED)
    {
        EndMenu(proc);
        return;
    }

    CAMenu_ProcessMenuDpadInput(proc);
    actions = ProcessMenuSelectInput(proc);

    if (actions & MENU_ACT_END)
        EndMenu(proc);

    if (actions & MENU_ACT_SND6A)
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

    if (actions & MENU_ACT_SND6B)
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

    if (actions & MENU_ACT_CLEAR)
        ClearMenuBgs(proc);

    if (actions & MENU_ACT_ENDFACE)
        EndFaceById(0);

    if (actions & MENU_ACT_DOOM)
        proc->state |= MENU_STATE_DOOMED;

    if (actions & MENU_ACT_SKIPCURSOR)
        return;

    if (proc->state & MENU_STATE_NOCURSOR)
        return;

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayUiHand(x, y);
}

u8 CAMenu_MenuAutoHelpBoxSelect(struct MenuProc* menu)
{
    Proc_GotoScript(menu, sProc_CAMenu_MenuAutoHelpBox);
    return 0;
}

void CAMenu_Menu_AutoHelpBox_OnLoop(struct MenuProc* proc)
{
    int x, y;

    CAMenu_ProcessMenuDpadInput(proc);

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayUiHand(x, y);

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        CloseHelpBox();
        Proc_GotoScript(proc, sProc_CAMenu_MenuMain);

        return;
    }

    if (HasMenuChangedItem(proc))
    {
        proc->def->onHelpBox(proc, proc->menuItems[proc->itemCurrent]);
    }
}

void CAMenu_ProcessMenuDpadInput(struct MenuProc* proc){
    u16 i;

    proc->itemPrevious = proc->itemCurrent;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->itemCurrent == 0)
        {
            if (proc->itemCount >= NumberOfArtsInMenuAtOnce &&
            (int)(proc->menuItems[proc->itemCurrent]->def->name) != gActiveUnitUsableArts[0]){

                // shift menu defs down by one
                for (i = NumberOfArtsInMenuAtOnce - 1; i > 0; i--){
                    MemCpy((struct MenuItemDef*)(CAMenuDef.menuItems + (i - 1)),(struct MenuItemDef*)(CAMenuDef.menuItems + i), sizeof(struct MenuItemDef));
                }

                gFirstMenuItemActiveArtID--; gLastMenuItemActiveArtID--;

                BuildCombatArtsMenuItemDef(gFirstMenuItemActiveArtID,(struct MenuItemDef*)(CAMenuDef.menuItems));

                for (i = 0; i < NumberOfArtsInMenuAtOnce; i++){
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

                if (proc->proc_idleCb == (ProcFunc)0x0804F4A1){ // Menu_AutoHelpBox_OnLoop
                    proc->def->onHelpBox(proc, proc->menuItems[0]);
                }

                proc->unk68 = 0;

            } else {
                if (proc->unk68 == 1){
                    PlaySoundEffect(0x6C);
                }

                proc->unk68++;
            }
        } else {
            proc->itemCurrent--;

            proc->unk68 = 0;
        }
    } 
    
    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->itemCurrent == (proc->itemCount - 1))
        {
            if (proc->itemCount >= NumberOfArtsInMenuAtOnce &&
            (int)(proc->menuItems[proc->itemCurrent]->def->name) != gActiveUnitUsableArts[NumberOfUsableArtsAtOnce] &&
            gActiveUnitUsableArts[gLastMenuItemActiveArtID + 1] != 0xFFFF){

                // shift menu defs up by one
                for (i = 0; i < NumberOfArtsInMenuAtOnce - 1; i++){
                    MemCpy((struct MenuItemDef*)(CAMenuDef.menuItems + (i + 1)),(struct MenuItemDef*)(CAMenuDef.menuItems + i), sizeof(struct MenuItemDef));
                }

                gFirstMenuItemActiveArtID++; gLastMenuItemActiveArtID++;

                BuildCombatArtsMenuItemDef(gLastMenuItemActiveArtID,(struct MenuItemDef*)(CAMenuDef.menuItems + (NumberOfArtsInMenuAtOnce - 1)));

                for (i = 0; i < NumberOfArtsInMenuAtOnce; i++){
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

                if (proc->proc_idleCb == (ProcFunc)0x0804F4A1){ // Menu_AutoHelpBox_OnLoop
                    proc->def->onHelpBox(proc, proc->menuItems[NumberOfArtsInMenuAtOnce - 1]);
                }

                proc->unk68 = 0;

            } else {
                if (proc->unk68 == 1){
                    PlaySoundEffect(0x6C);
                }

                proc->unk68++;
            }
        } else {
            proc->itemCurrent++;

            proc->unk68 = 0;
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
