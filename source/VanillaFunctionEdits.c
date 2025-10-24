#include "CombatArts.h"

void ProcessMenuDpadInput(struct MenuProc* proc)
{
    int i;

    proc->itemPrevious = proc->itemCurrent;

    // Handle Up keyin

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->itemCurrent == 0)
        {

                // Despite my best efforts (which there were zero attempts using) I require implementing this specifically for combat arts,
                // which means you will need your own implementation for your own scrolling menu to track each option. Sorry.

            if (proc->def == &CAMenuDef){
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

                    proc->unk68 = FALSE;

                } else {
                    if (!proc->unk68){
                        PlaySoundEffect(0x6C);
                        proc->unk68 = TRUE;
                    }
                }

            } else {

                if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                    return;

                proc->itemCurrent = proc->itemCount - 1;
            }

        } else {
            proc->itemCurrent--;

            proc->unk68 = FALSE;
        }
    } 

    // Handle down keyin

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->itemCurrent == (proc->itemCount - 1))
        {

            if (proc->def == &CAMenuDef){
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

                    proc->unk68 = FALSE;

                } else {
                    if (!proc->unk68){
                        PlaySoundEffect(0x6C);
                        proc->unk68 = TRUE;
                    }
                }
            
            } else {

                if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                    return;

                proc->itemCurrent = 0;
            }

        } else {
            proc->itemCurrent++;

            proc->unk68 = FALSE;
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
