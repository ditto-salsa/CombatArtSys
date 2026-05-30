//throw this in prebattle calc loop
void InitializeMultihitArtTracker(struct BattleUnit* attacker, struct BattleUnit* defender) {
	attacker->multihitArtTracker = 0;
}
/* in battleunit, you need to have 
    55 u8 terrainId;
    56 s8 terrainDefense;
    57 s8 terrainAvoid;
    58 s8 terrainResistance;
    59 u8 multihitArtTracker;
*/
//alternatively, find a bit in ram somewhere ig if you don't wanna edit the struct

//for arts with multihits
//editable if you want brave weapons to double art hits
int GetBattleUnitHitCount(struct BattleUnit* attacker) {
    int result = 1;
	
	if ((attacker == &gBattleActor) && (GetActiveArt(&attacker->unit) != 0x0)) {
		if (CombatArtList[GetActiveArt(&attacker->unit)].strikeCountFunction != NULL) {
			result = CombatArtList[GetActiveArt(&attacker->unit)].strikeCountFunction(attacker);
		}
	}	
	else {
		result <<= BattleCheckBraveEffect(attacker);
	}
    return result;
}

//fix battlehit max uses
//BATTLE_HIT_MAX i think i got working up to 20
//i used EA to fix ram stuff because editing that many C functions made me morose
void ClearBattleHits(void) {
    int i;

    for (i = 0; i < BATTLE_HIT_MAX; ++i) {
        gBattleHitArray[i].attributes = 0;
        gBattleHitArray[i].info = 0;
        gBattleHitArray[i].hpChange = 0;
    }

    gBattleHitIterator = gBattleHitArray;
}

//durability
u16 GetItemAfterArtUse(int item, int cost) {
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return item; // unbreakable items don't loose uses!

    item -= (cost << 8); // lose cost uses

    if (item < (1 << 8))
        return 0; // return no item if uses < 0

    return item; // return used item
}

//hook this in to replace vanilla durability
void BattleProcessArtDurability(struct BattleUnit* attacker, struct BattleUnit* defender) {
    attacker->wexpMultiplier++;

	//might need to edit this slightly for different uses of activeart
	if ((attacker == &gBattleActor) && (GetActiveArt(&attacker->unit) != 0x0)) {
		if (attacker->multihitArtTracker == 0) {
			int artCost = CombatArtDurabilityList[GetActiveArt(&attacker->unit)];	
			attacker->weapon = GetItemAfterArtUse(attacker->weapon, artCost);
			attacker->multihitArtTracker = 1;
			if (!attacker->weapon)
				attacker->weaponBroke = TRUE;
		}
	}
	
	else if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS) || attacker->weaponAttributes & (IA_UNCOUNTERABLE | IA_MAGIC)) {
        attacker->weapon = GetItemAfterUse(attacker->weapon);

        if (!attacker->weapon) {
            attacker->weaponBroke = TRUE;
		}
    }
}


//spell anim stuff
extern struct SpellAssoc SpellAssociationTable[];
//get spell anim
s16 GetArtSpellAnimId(struct BattleUnit* bu, u16 weapon)
{
    u16 ret;
    u16 item = GetItemIndex(weapon);
    const struct SpellAssoc * it;
    for (it = SpellAssociationTable; it->item != 0xFFFF; it++)
    {
        if (it->item == item)
            break;
    }
    ret = it->efx;
	
	//possible todo: copy vanilla jav type code (but also vanilla jav code's so hardcoded to be useless anyway
	if (GetActiveArt(&bu->unit) != 0) {
		if (CombatArtList[GetActiveArt(&bu->unit)].spellAnim != 0) {
			ret = CombatArtList[GetActiveArt(&bu->unit)].spellAnim;
		}
	}
    return ret;
}

void StartSpellAnimFunction(struct BattleUnit* bu1,struct BattleUnit* bu2,int valid_l, int valid_r) {
	if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
		{
			gEkrSpellAnimIndex[POS_R] = 1;
			gEkrSpellAnimIndex[POS_L] = 1;
		}
		else
		{
			if (valid_l)
				gEkrSpellAnimIndex[POS_L] = GetArtSpellAnimId(bu1, bu1->weaponBefore);

			if (valid_r)
				gEkrSpellAnimIndex[POS_R] = GetArtSpellAnimId(bu2, bu2->weaponBefore);

			if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
				if (!IsItemDisplayedInBattle(bu2->weaponBefore))
					//maybe edit this to not be hardcoded
					if (bu2->unit.pClassData->number == CLASS_DANCER)
						gEkrSpellAnimIndex[POS_R] = 0xF;
		}
}