#ifndef COMBAT_ARTS_H
#define COMBAT_ARTS_H

#include "../_include/gbafe.h"

struct CombatArt {
    /* 00 */ u16 nameTextID;
    /* 02 */ u16 descTextID;
    /* 04 */ u8 (*usability)(struct Unit* unit);
    /* 08 */ u8 (*menuUsability)(const struct MenuItemDef*, int number);
    /* 0C */ int(*menuDraw)(struct MenuProc* menu, struct MenuItemProc* menuItem);
    /* 10 */ u8 (*menuEffect)(struct MenuProc* menu, struct MenuItemProc* menuItem);
    /* 14 */ void (*preBattleFunction)(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget);
    /* 18 */ void (*postBattleFunction)(struct Unit* actor, struct Unit* target, struct ActionData* ad);
    /* 1C */ void (*battleProcFunction)(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget, struct BattleHit* bhIterator, struct BattleStats* bs);
    /* 20 */ int (*rangeFunction)(struct Unit* unit, int itemID, int rangeWord); // Returns modified rangeWord
};

extern struct CombatArt CombatArtList[];
extern u8 CombatArtDurabilityList[];

extern const struct MenuDef CAMenuDef;
extern const int NumberOfArtsInMenuAtOnce;
extern const int NumberOfUsableArtsAtOnce;

// RAM Locations
// RAM start is located at CAMenuDef.menuItems because it draws the options from RAM
#define ActiveUnitUsableArts_ADDRESS ((int)(CAMenuDef.menuItems) + ((NumberOfArtsInMenuAtOnce + 1) * sizeof(struct MenuItemDef)))
#define gActiveUnitUsableArts ((u16*)(ActiveUnitUsableArts_ADDRESS))
#define ActiveArtID_ADDRESS (ActiveUnitUsableArts_ADDRESS + ((NumberOfUsableArtsAtOnce + 1) * sizeof(u16))
#define gActiveArtID (*((u8*)ActiveArtID_ADDRESS))

// CombatArts.c functions
void CombatArtPrebattleFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget);
void CombatArtPostbattleFuncIterator(struct Unit* actor, struct Unit* target, struct ActionData* ad);
void CombatArtBattleProcFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget, struct BattleHit* bhIterator, struct BattleStats* bs);
int CombatArtRangeFuncIterator(struct Unit* unit, int itemID, int rangeWord);

u8 ArtTester(struct Unit* unit, u16 artID);
void BuildActiveUnitsArtsList(void);

// CombatArtMenus.c functions
u8 UM_CombatArtsMenuUsability(const struct MenuItemDef* def, int number);
u8 UM_CombatArtsMenuEffect(struct MenuProc* menu, struct MenuItemProc* menuItem);
void BuildCombatArtsMenuItemDef(u8 usableArtIndex, struct MenuItemDef* loc);

// CombatArtFunctionLib.c functions
#include "CombatArtFunctionLib.h"

#endif // COMBAT_ARTS_H