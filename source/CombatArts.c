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
	if (artID > MaxIDOfArtsInList) return 0;
    return  artID; 
}

void SetActiveArt(struct Unit* unit, u16 artID){
    if (unit->index >= NumberOfActiveArtsAtOnce) return;
    gActiveArts[unit->index] = artID;
}

u16 ApplyCombatArtDurabilityCosts(u16 item, u8 cost){
    if (GetItemAttributes(item) & IA_UNBREAKABLE) return item;

    // if the item would be reduced to below 0 durability, return it with only 1 durability.
    return (item - (cost << 8) < (1 << 8)) ? (item - (cost << 8) + (1 << 8)) : (item - (cost << 8));
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