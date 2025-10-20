#include "../_include/gbafe.h"

void RedrawMenu(struct MenuProc* proc)
{
    int i;

    if (proc->state & MENU_STATE_NOTSHOWN)
        return;

    DrawUiFrame(
        BG_GetMapBuffer(proc->backBg),
        proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h,
        proc->tileref, proc->def->style);

    ClearUiFrame(
        BG_GetMapBuffer(proc->frontBg),
        proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h);

    for (i = 0; i < proc->itemCount; ++i)
    {
        struct MenuItemProc* item = proc->menuItems[i];

        if (item->def->onDraw)
        {
            item->def->onDraw(proc, item);
            continue;
        }

        if (item->def->color)
            Text_SetColor(&item->text, item->def->color);

        if (item->availability == MENU_DISABLED)
            Text_SetColor(&item->text, TEXT_COLOR_SYSTEM_GRAY);

        if (!item->def->nameMsgId)
            Text_DrawString(&item->text, item->def->name);
        else
            Text_DrawString(&item->text, GetStringFromIndex(item->def->nameMsgId));

        PutText(
            &item->text,
            TILEMAP_LOCATED(BG_GetMapBuffer(proc->frontBg), item->xTile, item->yTile));
    }

    DrawMenuItemHover(proc, proc->itemCurrent, TRUE);
    SyncMenuBgs(proc);
}