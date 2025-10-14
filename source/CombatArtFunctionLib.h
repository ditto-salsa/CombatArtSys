#ifndef COMBAT_ARTS_FUNCTION_LIB_H
#define COMBAT_ARTS_FUNCTION_LIB_H

#include "../_include/gbafe.h"

u8 CombatArtGeneralAttackingUsability();

void TargetOtherDef(struct BattleUnit* actor, struct BattleUnit* target);
void TryDealEffectiveDamage(struct BattleUnit* actor, struct BattleUnit* target, const u8* effectivenessPtr);

#endif // COMBAT_ARTS_FUNCTION_LIB_H