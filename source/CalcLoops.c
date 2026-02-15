#include "CombatArts.h"

void CombatArtPrebattleFuncWrapper(struct BattleUnit* actor, struct BattleUnit* target){
    if (GetActiveArt(&actor->unit) == 0) return;

    if (CombatArtList[GetActiveArt(&actor->unit)].preBattleFunction != NULL)
        CombatArtList[GetActiveArt(&actor->unit)].preBattleFunction(GetActiveArt(&actor->unit), actor, target);
}

void CombatArtPostbattleFuncWrapper(struct Unit* actor, struct Unit* target, struct ActionData* actionData){
    if (GetActiveArt(actor) == 0) return;

    if (CombatArtList[GetActiveArt(actor)].postBattleFunction != NULL){
        CombatArtList[GetActiveArt(actor)].postBattleFunction(GetActiveArt(actor), actor, target, actionData);
    } else {
        // As default, clear the active art (choice whether to do this in a custom postbattle func)
		SetActiveArt(actor, 0);
	}
}

void CombatArtBattleProcFuncWrapper(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hitIterator, struct BattleStats* stats){
    if (GetActiveArt(&actor->unit) == 0) return;

    if (CombatArtList[GetActiveArt(&actor->unit)].battleProcFunction != NULL)
        CombatArtList[GetActiveArt(&actor->unit)].battleProcFunction(GetActiveArt(&actor->unit), actor, target, hitIterator, stats);

    actor->weapon = ApplyCombatArtDurabilityCosts(actor->weapon, CombatArtDurabilityList[GetActiveArt(&actor->unit)]);
}

int CombatArtRangeFuncWrapper(struct Unit* unit, int itemID, int rangeWord){
	
    if (GetActiveArt(unit) == 0) return rangeWord;

    return CombatArtList[GetActiveArt(unit)].rangeFunction == NULL 
        ? rangeWord 
        : CombatArtList[GetActiveArt(unit)].rangeFunction(GetActiveArt(unit), unit, itemID, rangeWord);
}
