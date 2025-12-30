#include "CombatArts.h"

// Main Combat Art internals to do with. various things honestly. could maybe do with being split up into multiple files.

// Function iterators to be put into calc loops
void CombatArtPrebattleFuncWrapper(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget){
    if (CombatArtList[gActiveArtID].preBattleFunction != NULL) CombatArtList[gActiveArtID].preBattleFunction(BattleActor, BattleTarget);
}

void CombatArtPostbattleFuncWrapper(struct Unit* actor, struct Unit* target, struct ActionData* ad){
    if (CombatArtList[gActiveArtID].postBattleFunction != NULL) CombatArtList[gActiveArtID].postBattleFunction(actor, target, ad);
}

void CombatArtBattleProcFuncWrapper(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget, struct BattleHit* bhIterator, struct BattleStats* bs){
    if (CombatArtList[gActiveArtID].postBattleFunction != NULL) CombatArtList[gActiveArtID].battleProcFunction(BattleActor, BattleTarget, bhIterator, bs);
}

int CombatArtRangeFuncWrapper(struct Unit* unit, int itemID, int rangeWord){
    return CombatArtList[gActiveArtID].rangeFunction == NULL ? rangeWord : CombatArtList[gActiveArtID].rangeFunction(unit, itemID, rangeWord);
}

// bool
u8 ArtTester(struct Unit* unit, u16 artID){
    return CombatArtList[artID].usability(unit);
}

// Builds a list of u16 in RAM of active unit's usable arts, sizeof(gActiveUnitUsableArts[]) should be equal to NumberOfUsableArtsAtOnce + 1
void BuildUsableArtsList(void){
    u16 i;

    for (i = 0; i < NumberOfUsableArtsAtOnce; i++){
        gUsableArts[i] = 0;
    }
    gUsableArts[NumberOfUsableArtsAtOnce] = 0xFFFF;

    u16 j = 0;

    for (i = 0; ; i++){
        if (CombatArtList[i].nameTextID == 0xFFFF){
            gUsableArts[j] = 0xFFFF;
            return;
        }

        if (ArtTester(gActiveUnit,i)){
            gUsableArts[j] = i;
            j++;
            if (j >= NumberOfUsableArtsAtOnce){
                return;
            }
        }
    }
}

