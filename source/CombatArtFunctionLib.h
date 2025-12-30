#ifndef COMBAT_ARTS_FUNCTION_LIB_H
#define COMBAT_ARTS_FUNCTION_LIB_H

#include "../_include/gbafe.h"

#define ART_ID_FROM_MENUITEM(item) ( (u16)((u32)((item)->def->name) & 0xFFFF) )
#define ART_ID_FROM_MENUDEF(def) ( (u16)((u32)((def)->name) & 0xFFFF) )

u8 CombatArtGeneralAttackingUsability();

void TargetOtherDef(struct BattleUnit* actor, struct BattleUnit* target);
void TryDealEffectiveDamage(struct BattleUnit* actor, struct BattleUnit* target, const u8* effectivenessPtr);

#endif // COMBAT_ARTS_FUNCTION_LIB_H