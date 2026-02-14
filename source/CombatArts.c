#include "CombatArts.h"

// Main Combat Art internals

// bool
u8 ArtTester(struct Unit* unit, u16 artID){
    return CombatArtList[artID].usability == NULL ? False : CombatArtList[artID].usability(unit, artID);
}

u16 __attribute__ ((noinline)) GetActiveArt(struct Unit* unit){
	if (unit->index == 0) return 0;
	if (unit->index >= NumberOfActiveArtsAtOnce) return 0;
	u16 artID = gActiveArts[unit->index];
	if (artID > 0x17f) return 0;
    return  artID; 
}

void SetActiveArt(struct Unit* unit, u16 artID){
    if (unit->index >= NumberOfActiveArtsAtOnce) return;
    gActiveArts[unit->index] = artID;
}

// Function iterators to be put into calc loops
void CombatArtPrebattleFuncWrapper(struct BattleUnit* actor, struct BattleUnit* target){
    if (GetActiveArt(&actor->unit) == 0) return;

    if (CombatArtList[GetActiveArt(&actor->unit)].preBattleFunction != NULL)
        CombatArtList[GetActiveArt(&actor->unit)].preBattleFunction(GetActiveArt(&actor->unit), actor, target);
}

void CombatArtPostbattleFuncWrapper(struct Unit* actor, struct Unit* target, struct ActionData* actionData){
    if (GetActiveArt(actor) == 0) return;

    if (CombatArtList[GetActiveArt(actor)].postBattleFunction != NULL)
        CombatArtList[GetActiveArt(actor)].postBattleFunction(GetActiveArt(actor), actor, target, actionData);
	//clear active art by default
    else {
		 SetActiveArt(actor, 0);
	}
}

void CombatArtBattleProcFuncWrapper(struct BattleUnit* actor, struct BattleUnit* target, struct BattleHit* hitIterator, struct BattleStats* stats){
    if (GetActiveArt(&actor->unit) == 0) return;

    if (CombatArtList[GetActiveArt(&actor->unit)].battleProcFunction != NULL) 
        CombatArtList[GetActiveArt(&actor->unit)].battleProcFunction(GetActiveArt(&actor->unit), actor, target, hitIterator, stats);
}

int CombatArtRangeFuncWrapper(struct Unit* unit, int itemID, int rangeWord){
	
    if (GetActiveArt(unit) == 0) return rangeWord;

    return CombatArtList[GetActiveArt(unit)].rangeFunction == NULL 
        ? rangeWord 
        : CombatArtList[GetActiveArt(unit)].rangeFunction(GetActiveArt(unit), unit, itemID, rangeWord);
}

// Builds a list of u16 in RAM of active unit's usable arts, sizeof(gUsableArts[]) should be equal to NumberOfUsableArtsAtOnce + 1
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
            if (j >= NumberOfUsableArtsAtOnce) return;
        }
    }
}

void CAS_EMS_WriteActiveArts(void* target, u32 size){
    WriteAndVerifySramFast((void*)gActiveArts, target, size);
}

void CAS_EMS_ReadActiveArts(void* target, u32 size){
    ReadSramFast(target, (void*)gActiveArts, size);
}