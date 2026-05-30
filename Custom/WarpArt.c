#include "../source/CombatArts.h"

u8 WarpArtUsability(struct Unit* unit, u16 artID)
{
    return HasSelectTarget(unit, MakeTargetListForWarp) ;//&& ArtItemCheckInventory(unit, artID);
}

u8 WarpArtMenuUsability(const struct MenuItemDef* def, int number)
{
    return WarpArtUsability(gActiveUnit, ART_ID_FROM_MENUDEF(def)) ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 WarpArtMenuEffect(struct MenuProc* menu, struct MenuItemProc* menuItem)
{
    SetActiveArt(gActiveUnit, ART_ID_FROM_MENUDEF(menuItem->def));
    StartUnitItemSelect(menu, menuItem);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 WarpArtItemSelectUsability(u16 artID, u16 item)
{
    return GetItemType(item) == ITYPE_STAFF;
}

void WarpArtItemSelectEffect(u16 artID, struct Unit* unit)
{
    DoUseWarpStaff(unit);
}

