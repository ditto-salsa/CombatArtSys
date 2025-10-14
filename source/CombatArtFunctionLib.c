#include "CombatArts.h"

// Contains "helper" functions to be used in user code for combat arts

extern const u8 CombatArtDurabilityList[];

u8 CombatArtGeneralAttackingUsability() {
    
    // AttackCommandUsability but modified
    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_IN_BALLISTA) {
        return MENU_NOTSHOWN;
    }

    for (int i = 0; i < UNIT_ITEM_COUNT; i++) {
        int item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (!(GetItemAttributes(item) & IA_WEAPON)) {
            continue;
        }

        if (!CanUnitUseWeaponNow(gActiveUnit, item)) {
            continue;
        }
        // Durability cost check for art
        //if (CombatArtDurabilityList[gCurrentArtID] > ITEM_USES(item)){}

        MakeTargetListForWeapon(gActiveUnit, item);
        if (GetSelectTargetCount() == 0) {
            continue;
        }

        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}


// Use in Prebattle Functions

// Changes which defensive stat this attack is targetting
void TargetOtherDef(struct BattleUnit* actor, struct BattleUnit* target){
    if ((GetItemAttributes(target->weapon) & IA_MAGICDAMAGE) || (GetItemAttributes(target->weapon) & IA_MAGIC)){
        actor->battleDefense += (actor->terrainDefense + actor->unit.def);
        actor->battleDefense -= (actor->terrainResistance + actor->unit.res);
    } else {
        actor->battleDefense += (actor->terrainResistance + actor->unit.res);
        actor->battleDefense -= (actor->terrainDefense + actor->unit.def);
    }

    if (actor->battleDefense < 0)
        actor->battleDefense = 0;

    return;
}

// If target's class is in effectivenessPtr's list, deal effective damage to target from actor
void TryDealEffectiveDamage(struct BattleUnit* actor, struct BattleUnit* target, const u8* effectivenessPtr){
    if (effectivenessPtr == NULL) return;

    for (; *effectivenessPtr; ++effectivenessPtr){
        if (*effectivenessPtr == target->unit.pClassData->number){
            actor->battleAttack += GetItemMight(actor->weapon) * 2;
            return;
        }
    }

    return;
}
