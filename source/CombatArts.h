#ifndef COMBAT_ARTS_H
#define COMBAT_ARTS_H

#include "../_include/gbafe.h"

struct CombatArt {
    /* 00 */ u16 nameTextID;
    /* 02 */ u16 descTextID;
    /* 04 */ u8 (*menuUsability)(); // Passed no parameters; is called when there is no specified def or number
    /* 08 */ int(*menuDraw)(struct MenuProc* menu, struct MenuItemProc* menuItem);
    /* 0C */ u8 (*menuEffect)(struct MenuProc* menu, struct MenuItemProc* menuItem);
    /* 10 */ void (*preBattleFunction)(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget);
    /* 14 */ void (*postBattleFunction)(struct Unit* actor, struct Unit* target, struct ActionData* ad);
    /* 18 */ void (*battleProcFunction)(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget, struct BattleHit* bhIterator, struct BattleStats* bs);
    /* 1C */ int (*rangeFunction)(struct Unit* unit, int itemID, int rangeWord); // Returns modified rangeWord
};

#endif // COMBAT_ARTS_H