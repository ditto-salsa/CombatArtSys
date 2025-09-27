	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 1	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"CombatArtFunctionLib.c"
@ GNU C17 (devkitARM release 64) version 14.1.0 (arm-none-eabi)
@	compiled by GNU C version 10.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -O3
	.text
	.align	1
	.p2align 2,,3
	.global	TargetOtherDef
	.syntax unified
	.code	16
	.thumb_func
	.type	TargetOtherDef, %function
TargetOtherDef:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ source/CombatArtFunctionLib.c:8:     if ((GetItemAttributes(target->weapon) & IA_MAGICDAMAGE) || (GetItemAttributes(target->weapon) & IA_MAGIC)){
	movs	r7, #72	@ tmp158,
@ source/CombatArtFunctionLib.c:7: void TargetOtherDef(struct BattleUnit* actor, struct BattleUnit* target){
	movs	r4, r0	@ actor, tmp220
@ source/CombatArtFunctionLib.c:8:     if ((GetItemAttributes(target->weapon) & IA_MAGICDAMAGE) || (GetItemAttributes(target->weapon) & IA_MAGIC)){
	ldr	r6, .L9	@ tmp160,
	ldrh	r0, [r1, r7]	@ _2,
@ source/CombatArtFunctionLib.c:7: void TargetOtherDef(struct BattleUnit* actor, struct BattleUnit* target){
	movs	r5, r1	@ target, tmp221
@ source/CombatArtFunctionLib.c:8:     if ((GetItemAttributes(target->weapon) & IA_MAGICDAMAGE) || (GetItemAttributes(target->weapon) & IA_MAGIC)){
	bl	.L11		@
@ source/CombatArtFunctionLib.c:8:     if ((GetItemAttributes(target->weapon) & IA_MAGICDAMAGE) || (GetItemAttributes(target->weapon) & IA_MAGIC)){
	lsls	r0, r0, #25	@ tmp224, tmp222,
	bpl	.L2		@,
.L4:
@ source/CombatArtFunctionLib.c:9:         actor->battleDefense += (actor->terrainDefense + actor->unit.def);
	movs	r3, #86	@ tmp163,
@ source/CombatArtFunctionLib.c:9:         actor->battleDefense += (actor->terrainDefense + actor->unit.def);
	movs	r2, #23	@ tmp167,
@ source/CombatArtFunctionLib.c:9:         actor->battleDefense += (actor->terrainDefense + actor->unit.def);
	ldrsb	r3, [r4, r3]	@ tmp165,
@ source/CombatArtFunctionLib.c:9:         actor->battleDefense += (actor->terrainDefense + actor->unit.def);
	ldrsb	r2, [r4, r2]	@ tmp167,
@ source/CombatArtFunctionLib.c:9:         actor->battleDefense += (actor->terrainDefense + actor->unit.def);
	adds	r3, r3, r2	@ tmp168, tmp165, tmp167
@ source/CombatArtFunctionLib.c:9:         actor->battleDefense += (actor->terrainDefense + actor->unit.def);
	movs	r2, #92	@ tmp169,
@ source/CombatArtFunctionLib.c:9:         actor->battleDefense += (actor->terrainDefense + actor->unit.def);
	ldrh	r2, [r4, r2]	@ tmp172,
	adds	r3, r3, r2	@ tmp173, tmp168, tmp172
@ source/CombatArtFunctionLib.c:10:         actor->battleDefense -= (actor->terrainResistance + actor->unit.res);
	movs	r2, #88	@ tmp174,
@ source/CombatArtFunctionLib.c:10:         actor->battleDefense -= (actor->terrainResistance + actor->unit.res);
	movs	r1, #24	@ tmp178,
@ source/CombatArtFunctionLib.c:10:         actor->battleDefense -= (actor->terrainResistance + actor->unit.res);
	ldrsb	r2, [r4, r2]	@ tmp176,
.L7:
@ source/CombatArtFunctionLib.c:20: }
	@ sp needed	@
@ source/CombatArtFunctionLib.c:13:         actor->battleDefense -= (actor->terrainDefense + actor->unit.def);
	ldrsb	r1, [r4, r1]	@ tmp203,
@ source/CombatArtFunctionLib.c:13:         actor->battleDefense -= (actor->terrainDefense + actor->unit.def);
	adds	r2, r2, r1	@ tmp204, tmp201, tmp203
@ source/CombatArtFunctionLib.c:13:         actor->battleDefense -= (actor->terrainDefense + actor->unit.def);
	subs	r3, r3, r2	@ tmp207, tmp198, tmp204
	lsls	r3, r3, #16	@ _25, tmp207,
	asrs	r3, r3, #16	@ _25, _25,
@ source/CombatArtFunctionLib.c:16:     if (actor->battleDefense < 0)
	mvns	r2, r3	@ tmp215, _25
	asrs	r2, r2, #31	@ tmp219, tmp215,
	ands	r3, r2	@ tmp218, tmp219
@ source/CombatArtFunctionLib.c:17:         actor->battleDefense = 0;
	movs	r2, #92	@ tmp213,
	strh	r3, [r4, r2]	@ tmp218, actor_51(D)->battleDefense
@ source/CombatArtFunctionLib.c:20: }
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L2:
@ source/CombatArtFunctionLib.c:8:     if ((GetItemAttributes(target->weapon) & IA_MAGICDAMAGE) || (GetItemAttributes(target->weapon) & IA_MAGIC)){
	ldrh	r0, [r5, r7]	@ _6,
	bl	.L11		@
@ source/CombatArtFunctionLib.c:8:     if ((GetItemAttributes(target->weapon) & IA_MAGICDAMAGE) || (GetItemAttributes(target->weapon) & IA_MAGIC)){
	lsls	r0, r0, #30	@ tmp225, tmp223,
	bmi	.L4		@,
@ source/CombatArtFunctionLib.c:12:         actor->battleDefense += (actor->terrainResistance + actor->unit.res);
	movs	r3, #88	@ tmp188,
@ source/CombatArtFunctionLib.c:12:         actor->battleDefense += (actor->terrainResistance + actor->unit.res);
	movs	r2, #24	@ tmp192,
@ source/CombatArtFunctionLib.c:12:         actor->battleDefense += (actor->terrainResistance + actor->unit.res);
	ldrsb	r3, [r4, r3]	@ tmp190,
@ source/CombatArtFunctionLib.c:12:         actor->battleDefense += (actor->terrainResistance + actor->unit.res);
	ldrsb	r2, [r4, r2]	@ tmp192,
@ source/CombatArtFunctionLib.c:12:         actor->battleDefense += (actor->terrainResistance + actor->unit.res);
	adds	r3, r3, r2	@ tmp193, tmp190, tmp192
@ source/CombatArtFunctionLib.c:12:         actor->battleDefense += (actor->terrainResistance + actor->unit.res);
	movs	r2, #92	@ tmp194,
@ source/CombatArtFunctionLib.c:12:         actor->battleDefense += (actor->terrainResistance + actor->unit.res);
	ldrh	r2, [r4, r2]	@ tmp197,
	adds	r3, r3, r2	@ tmp198, tmp193, tmp197
@ source/CombatArtFunctionLib.c:13:         actor->battleDefense -= (actor->terrainDefense + actor->unit.def);
	movs	r2, #86	@ tmp199,
@ source/CombatArtFunctionLib.c:13:         actor->battleDefense -= (actor->terrainDefense + actor->unit.def);
	movs	r1, #23	@ tmp203,
@ source/CombatArtFunctionLib.c:13:         actor->battleDefense -= (actor->terrainDefense + actor->unit.def);
	ldrsb	r2, [r4, r2]	@ tmp201,
	b	.L7		@
.L10:
	.align	2
.L9:
	.word	GetItemAttributes
	.size	TargetOtherDef, .-TargetOtherDef
	.align	1
	.p2align 2,,3
	.global	TryDealEffectiveDamage
	.syntax unified
	.code	16
	.thumb_func
	.type	TryDealEffectiveDamage, %function
TryDealEffectiveDamage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ source/CombatArtFunctionLib.c:23: void TryDealEffectiveDamage(struct BattleUnit* actor, struct BattleUnit* target, const u8* effectivenessPtr){
	movs	r4, r0	@ actor, tmp141
@ source/CombatArtFunctionLib.c:24:     if (!effectivenessPtr) return;
	cmp	r2, #0	@ effectivenessPtr,
	beq	.L12		@,
@ source/CombatArtFunctionLib.c:26:     for (; *effectivenessPtr; ++effectivenessPtr){
	ldrb	r3, [r2]	@ _11, *effectivenessPtr_14(D)
	cmp	r3, #0	@ _11,
	beq	.L12		@,
@ source/CombatArtFunctionLib.c:27:         if (*effectivenessPtr == target->unit.pClassData->number){
	ldr	r1, [r1, #4]	@ target_16(D)->unit.pClassData, target_16(D)->unit.pClassData
	ldrb	r1, [r1, #4]	@ _2,
	b	.L15		@
.L14:
@ source/CombatArtFunctionLib.c:26:     for (; *effectivenessPtr; ++effectivenessPtr){
	ldrb	r3, [r2, #1]	@ _11, MEM[(const u8 *)effectivenessPtr_17]
@ source/CombatArtFunctionLib.c:26:     for (; *effectivenessPtr; ++effectivenessPtr){
	adds	r2, r2, #1	@ effectivenessPtr,
@ source/CombatArtFunctionLib.c:26:     for (; *effectivenessPtr; ++effectivenessPtr){
	cmp	r3, #0	@ _11,
	beq	.L12		@,
.L15:
@ source/CombatArtFunctionLib.c:27:         if (*effectivenessPtr == target->unit.pClassData->number){
	cmp	r1, r3	@ _2, _11
	bne	.L14		@,
@ source/CombatArtFunctionLib.c:28:             actor->battleAttack += GetItemMight(actor->weapon) * 2;
	movs	r3, #72	@ tmp130,
@ source/CombatArtFunctionLib.c:28:             actor->battleAttack += GetItemMight(actor->weapon) * 2;
	ldrh	r0, [r4, r3]	@ _4,
	ldr	r3, .L23	@ tmp132,
	bl	.L25		@
@ source/CombatArtFunctionLib.c:28:             actor->battleAttack += GetItemMight(actor->weapon) * 2;
	movs	r2, #90	@ tmp133,
@ source/CombatArtFunctionLib.c:28:             actor->battleAttack += GetItemMight(actor->weapon) * 2;
	ldrh	r3, [r4, r2]	@ tmp136,
@ source/CombatArtFunctionLib.c:28:             actor->battleAttack += GetItemMight(actor->weapon) * 2;
	lsls	r0, r0, #1	@ _20, tmp144,
@ source/CombatArtFunctionLib.c:28:             actor->battleAttack += GetItemMight(actor->weapon) * 2;
	adds	r3, r3, r0	@ tmp138, tmp136, _20
	strh	r3, [r4, r2]	@ tmp138, actor_18(D)->battleAttack
.L12:
@ source/CombatArtFunctionLib.c:34: }
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L24:
	.align	2
.L23:
	.word	GetItemMight
	.size	TryDealEffectiveDamage, .-TryDealEffectiveDamage
	.ident	"GCC: (devkitARM release 64) 14.1.0"
	.code 16
	.align	1
.L25:
	bx	r3
.L11:
	bx	r6
