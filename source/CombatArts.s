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
	.file	"CombatArts.c"
@ GNU C23 (devkitARM release 66) version 15.1.0 (arm-none-eabi)
@	compiled by GNU C version 13.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -O3
	.text
	.align	1
	.p2align 2,,3
	.global	CombatArtPrebattleFuncIterator
	.syntax unified
	.code	16
	.thumb_func
	.type	CombatArtPrebattleFuncIterator, %function
CombatArtPrebattleFuncIterator:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ source/CombatArts.c:9:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	ldr	r4, .L21	@ tmp124,
	ldr	r3, [r4, #16]	@ _15, CombatArtList[0].preBattleFunction
@ source/CombatArts.c:8: void CombatArtPrebattleFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget){
	movs	r5, r0	@ BattleActor, BattleActor
	movs	r6, r1	@ BattleTarget, BattleTarget
@ source/CombatArts.c:9:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	adds	r2, r3, #1	@ tmp128, _15,
	beq	.L1		@,
	adds	r4, r4, #48	@ ivtmp.19,
@ source/CombatArts.c:10:         if (CombatArtList[i].preBattleFunction == NULL) continue;
	cmp	r3, #0	@ _15,
	beq	.L3		@,
.L20:
@ source/CombatArts.c:12:         CombatArtList[i].preBattleFunction(BattleActor, BattleTarget);
	movs	r1, r6	@, BattleTarget
	movs	r0, r5	@, BattleActor
	bl	.L23		@
@ source/CombatArts.c:9:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	ldr	r3, [r4]	@ _15,* ivtmp.19
@ source/CombatArts.c:9:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	adds	r2, r3, #1	@ tmp129, _15,
	beq	.L1		@,
.L18:
	adds	r4, r4, #32	@ ivtmp.19,
@ source/CombatArts.c:10:         if (CombatArtList[i].preBattleFunction == NULL) continue;
	cmp	r3, #0	@ _15,
	bne	.L20		@,
.L3:
@ source/CombatArts.c:9:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	ldr	r3, [r4]	@ _15,* ivtmp.19
@ source/CombatArts.c:9:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	adds	r2, r3, #1	@ tmp130, _15,
	bne	.L18		@,
.L1:
@ source/CombatArts.c:14: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L22:
	.align	2
.L21:
	.word	CombatArtList
	.size	CombatArtPrebattleFuncIterator, .-CombatArtPrebattleFuncIterator
	.align	1
	.p2align 2,,3
	.global	CombatArtPostbattleFuncIterator
	.syntax unified
	.code	16
	.thumb_func
	.type	CombatArtPostbattleFuncIterator, %function
CombatArtPostbattleFuncIterator:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ source/CombatArts.c:17:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	ldr	r4, .L43	@ tmp125,
	ldr	r3, [r4, #20]	@ _16, CombatArtList[0].postBattleFunction
@ source/CombatArts.c:16: void CombatArtPostbattleFuncIterator(struct Unit* actor, struct Unit* target, struct ActionData* ad){
	movs	r5, r0	@ actor, actor
	movs	r6, r1	@ target, target
	movs	r7, r2	@ ad, ad
@ source/CombatArts.c:17:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	adds	r2, r3, #1	@ tmp130, _16,
	beq	.L24		@,
	adds	r4, r4, #52	@ ivtmp.28,
@ source/CombatArts.c:18:         if (CombatArtList[i].postBattleFunction == NULL) continue;
	cmp	r3, #0	@ _16,
	beq	.L26		@,
.L42:
@ source/CombatArts.c:20:         CombatArtList[i].postBattleFunction(actor, target, ad);
	movs	r2, r7	@, ad
	movs	r1, r6	@, target
	movs	r0, r5	@, actor
	bl	.L23		@
@ source/CombatArts.c:17:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	ldr	r3, [r4]	@ _16,* ivtmp.28
@ source/CombatArts.c:17:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	adds	r2, r3, #1	@ tmp131, _16,
	beq	.L24		@,
.L41:
	adds	r4, r4, #32	@ ivtmp.28,
@ source/CombatArts.c:18:         if (CombatArtList[i].postBattleFunction == NULL) continue;
	cmp	r3, #0	@ _16,
	bne	.L42		@,
.L26:
@ source/CombatArts.c:17:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	ldr	r3, [r4]	@ _16,* ivtmp.28
@ source/CombatArts.c:17:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	adds	r2, r3, #1	@ tmp132, _16,
	bne	.L41		@,
.L24:
@ source/CombatArts.c:22: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L44:
	.align	2
.L43:
	.word	CombatArtList
	.size	CombatArtPostbattleFuncIterator, .-CombatArtPostbattleFuncIterator
	.align	1
	.p2align 2,,3
	.global	CombatArtBattleProcFuncIterator
	.syntax unified
	.code	16
	.thumb_func
	.type	CombatArtBattleProcFuncIterator, %function
CombatArtBattleProcFuncIterator:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
	mov	r7, r8	@,
	mov	lr, r9	@,
@ source/CombatArts.c:25:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	ldr	r5, .L64	@ tmp126,
	ldr	r4, [r5, #24]	@ _17, CombatArtList[0].battleProcFunction
@ source/CombatArts.c:24: void CombatArtBattleProcFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget, struct BattleHit* bhIterator, struct BattleStats* bs){
	push	{r7, lr}	@
@ source/CombatArts.c:24: void CombatArtBattleProcFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget, struct BattleHit* bhIterator, struct BattleStats* bs){
	movs	r6, r0	@ BattleActor, BattleActor
	movs	r7, r1	@ BattleTarget, BattleTarget
	mov	r8, r2	@ bhIterator, bhIterator
	mov	r9, r3	@ bs, bs
@ source/CombatArts.c:25:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	adds	r3, r4, #1	@ tmp132, _17,
	beq	.L45		@,
	adds	r5, r5, #56	@ ivtmp.36,
@ source/CombatArts.c:26:         if (CombatArtList[i].battleProcFunction == NULL) continue;
	cmp	r4, #0	@ _17,
	beq	.L47		@,
.L63:
@ source/CombatArts.c:28:         CombatArtList[i].battleProcFunction(BattleActor, BattleTarget, bhIterator, bs);
	mov	r3, r9	@, bs
	mov	r2, r8	@, bhIterator
	movs	r1, r7	@, BattleTarget
	movs	r0, r6	@, BattleActor
	bl	.L66		@
@ source/CombatArts.c:25:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	ldr	r4, [r5]	@ _17,* ivtmp.36
@ source/CombatArts.c:25:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	adds	r3, r4, #1	@ tmp133, _17,
	beq	.L45		@,
.L62:
	adds	r5, r5, #32	@ ivtmp.36,
@ source/CombatArts.c:26:         if (CombatArtList[i].battleProcFunction == NULL) continue;
	cmp	r4, #0	@ _17,
	bne	.L63		@,
.L47:
@ source/CombatArts.c:25:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	ldr	r4, [r5]	@ _17,* ivtmp.36
@ source/CombatArts.c:25:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	adds	r3, r4, #1	@ tmp134, _17,
	bne	.L62		@,
.L45:
@ source/CombatArts.c:30: }
	@ sp needed	@
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L65:
	.align	2
.L64:
	.word	CombatArtList
	.size	CombatArtBattleProcFuncIterator, .-CombatArtBattleProcFuncIterator
	.align	1
	.p2align 2,,3
	.global	CombatArtRangeFuncIterator
	.syntax unified
	.code	16
	.thumb_func
	.type	CombatArtRangeFuncIterator, %function
CombatArtRangeFuncIterator:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ source/CombatArts.c:35:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	ldr	r4, .L83	@ tmp126,
	ldr	r3, [r4, #28]	@ _20, CombatArtList[0].rangeFunction
@ source/CombatArts.c:32: int CombatArtRangeFuncIterator(struct Unit* unit, int itemID, int rangeWord){
	movs	r5, r0	@ unit, unit
	movs	r6, r1	@ itemID, itemID
@ source/CombatArts.c:35:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	adds	r1, r3, #1	@ tmp133, _20,
	beq	.L67		@,
	adds	r4, r4, #60	@ ivtmp.44,
@ source/CombatArts.c:36:         if (CombatArtList[i].rangeFunction == NULL) continue;
	cmp	r3, #0	@ _20,
	beq	.L69		@,
.L82:
@ source/CombatArts.c:38:         returnedRangeWord = CombatArtList[i].rangeFunction(unit, itemID, returnedRangeWord);
	movs	r1, r6	@, itemID
	movs	r0, r5	@, unit
	bl	.L23		@
@ source/CombatArts.c:35:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	ldr	r3, [r4]	@ _20,* ivtmp.44
@ source/CombatArts.c:38:         returnedRangeWord = CombatArtList[i].rangeFunction(unit, itemID, returnedRangeWord);
	movs	r2, r0	@ <retval>, <retval>
@ source/CombatArts.c:35:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	adds	r1, r3, #1	@ tmp134, _20,
	beq	.L67		@,
.L81:
	adds	r4, r4, #32	@ ivtmp.44,
@ source/CombatArts.c:36:         if (CombatArtList[i].rangeFunction == NULL) continue;
	cmp	r3, #0	@ _20,
	bne	.L82		@,
.L69:
@ source/CombatArts.c:35:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	ldr	r3, [r4]	@ _20,* ivtmp.44
@ source/CombatArts.c:35:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	adds	r1, r3, #1	@ tmp135, _20,
	bne	.L81		@,
.L67:
@ source/CombatArts.c:42: }
	@ sp needed	@
	movs	r0, r2	@, <retval>
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L84:
	.align	2
.L83:
	.word	CombatArtList
	.size	CombatArtRangeFuncIterator, .-CombatArtRangeFuncIterator
	.align	1
	.p2align 2,,3
	.global	UM_CombatArtsMenuUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	UM_CombatArtsMenuUsability, %function
UM_CombatArtsMenuUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ source/CombatArts.c:50:     for (int i = 0; (int)CombatArtList[i].menuUsability != (-1); i++){
	ldr	r4, .L100	@ tmp123,
	ldr	r3, [r4, #4]	@ _2, CombatArtList[0].menuUsability
@ source/CombatArts.c:50:     for (int i = 0; (int)CombatArtList[i].menuUsability != (-1); i++){
	adds	r2, r3, #1	@ tmp129, _2,
	beq	.L86		@,
	adds	r4, r4, #36	@ ivtmp.52,
.L88:
@ source/CombatArts.c:52:         if (CombatArtList[i].menuUsability == NULL) continue;
	cmp	r3, #0	@ _2,
	beq	.L90		@,
@ source/CombatArts.c:54:         if (CombatArtList[i].menuUsability() == TRUE){
	bl	.L23		@
@ source/CombatArts.c:54:         if (CombatArtList[i].menuUsability() == TRUE){
	cmp	r0, #1	@ <retval>,
	beq	.L89		@,
.L90:
@ source/CombatArts.c:50:     for (int i = 0; (int)CombatArtList[i].menuUsability != (-1); i++){
	ldr	r3, [r4]	@ _2, MEM[(u8 (*<T132f>) (void) *)_20]
@ source/CombatArts.c:50:     for (int i = 0; (int)CombatArtList[i].menuUsability != (-1); i++){
	adds	r4, r4, #32	@ ivtmp.52,
	adds	r2, r3, #1	@ tmp130, _2,
	bne	.L88		@,
.L86:
@ source/CombatArts.c:60:     return anyArtsUsable ? MENU_ENABLED : MENU_NOTSHOWN;
	movs	r0, #3	@ <retval>,
.L89:
@ source/CombatArts.c:61: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L101:
	.align	2
.L100:
	.word	CombatArtList
	.size	UM_CombatArtsMenuUsability, .-UM_CombatArtsMenuUsability
	.align	1
	.p2align 2,,3
	.global	UM_CombatArtsMenuEffect
	.syntax unified
	.code	16
	.thumb_func
	.type	UM_CombatArtsMenuEffect, %function
UM_CombatArtsMenuEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	mov	lr, r8	@,
@ source/CombatArts.c:70:         MemCpy(&CAMenu_FillerItemDef, (struct MenuItemDef*)((&CAMenuDef)->menuItems + i), sizeof(struct MenuItemDef));
	ldr	r3, .L105	@ tmp137,
	ldr	r4, [r3, #8]	@ ivtmp.63, CAMenuDef.menuItems
	movs	r6, r4	@ _6, ivtmp.63
	mov	r8, r3	@ tmp137, tmp137
@ source/CombatArts.c:66: u8 UM_CombatArtsMenuEffect(struct MenuProc* menu, struct MenuItemProc* menuItem){
	push	{lr}	@
	ldr	r7, .L105+4	@ tmp138,
	ldr	r5, .L105+8	@ tmp139,
	sub	sp, sp, #40	@,,
	adds	r6, r6, #180	@ _6,
.L103:
@ source/CombatArts.c:70:         MemCpy(&CAMenu_FillerItemDef, (struct MenuItemDef*)((&CAMenuDef)->menuItems + i), sizeof(struct MenuItemDef));
	movs	r1, r4	@, ivtmp.63
	movs	r2, #36	@,
	movs	r0, r7	@, tmp138
@ source/CombatArts.c:69:     for (int i = 0; i < 5; i++){
	adds	r4, r4, #36	@ ivtmp.63,
@ source/CombatArts.c:70:         MemCpy(&CAMenu_FillerItemDef, (struct MenuItemDef*)((&CAMenuDef)->menuItems + i), sizeof(struct MenuItemDef));
	bl	.L107		@
@ source/CombatArts.c:69:     for (int i = 0; i < 5; i++){
	cmp	r6, r4	@ _6, ivtmp.63
	bne	.L103		@,
@ source/CombatArts.c:74:     struct MenuItemDef terminator = MenuItemsEnd;
	ldr	r3, .L105+12	@ tmp128,
	movs	r2, #36	@,
	movs	r1, #0	@,
	add	r0, sp, #4	@ tmp145,,
	bl	.L23		@
@ source/CombatArts.c:75:     MemCpy(&terminator, (struct MenuItemDef*)((&CAMenuDef)->menuItems + 5), sizeof(struct MenuItemDef));
	movs	r2, #36	@,
	movs	r1, r6	@, _6
	add	r0, sp, #4	@ tmp146,,
	bl	.L107		@
@ source/CombatArts.c:78:     StartOrphanMenu(&CAMenuDef);
	mov	r0, r8	@, tmp137
	ldr	r3, .L105+16	@ tmp135,
	bl	.L23		@
@ source/CombatArts.c:81: }
	movs	r0, #55	@,
	add	sp, sp, #40	@,,
	@ sp needed	@
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L106:
	.align	2
.L105:
	.word	CAMenuDef
	.word	CAMenu_FillerItemDef
	.word	MemCpy
	.word	memset
	.word	StartOrphanMenu
	.size	UM_CombatArtsMenuEffect, .-UM_CombatArtsMenuEffect
	.align	1
	.p2align 2,,3
	.global	CA_MenuArtFillerEntryUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	CA_MenuArtFillerEntryUsability, %function
CA_MenuArtFillerEntryUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ source/CombatArts.c:86: }
	movs	r0, #1	@,
	@ sp needed	@
	bx	lr
	.size	CA_MenuArtFillerEntryUsability, .-CA_MenuArtFillerEntryUsability
	.align	1
	.p2align 2,,3
	.global	CA_MenuArtFillerEntryDraw
	.syntax unified
	.code	16
	.thumb_func
	.type	CA_MenuArtFillerEntryDraw, %function
CA_MenuArtFillerEntryDraw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ source/CombatArts.c:90: }
	movs	r0, #0	@,
	@ sp needed	@
	bx	lr
	.size	CA_MenuArtFillerEntryDraw, .-CA_MenuArtFillerEntryDraw
	.align	1
	.p2align 2,,3
	.global	CA_MenuArtFillerEntryEffect
	.syntax unified
	.code	16
	.thumb_func
	.type	CA_MenuArtFillerEntryEffect, %function
CA_MenuArtFillerEntryEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ source/CombatArts.c:94: }
	movs	r0, #55	@,
	@ sp needed	@
	bx	lr
	.size	CA_MenuArtFillerEntryEffect, .-CA_MenuArtFillerEntryEffect
	.align	1
	.p2align 2,,3
	.global	CA_MenuArtFillerEntrySwitchIn
	.syntax unified
	.code	16
	.thumb_func
	.type	CA_MenuArtFillerEntrySwitchIn, %function
CA_MenuArtFillerEntrySwitchIn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0	@,
	@ sp needed	@
	bx	lr
	.size	CA_MenuArtFillerEntrySwitchIn, .-CA_MenuArtFillerEntrySwitchIn
	.align	1
	.p2align 2,,3
	.global	CA_MenuArtFillerEntrySwitchOut
	.syntax unified
	.code	16
	.thumb_func
	.type	CA_MenuArtFillerEntrySwitchOut, %function
CA_MenuArtFillerEntrySwitchOut:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0	@,
	@ sp needed	@
	bx	lr
	.size	CA_MenuArtFillerEntrySwitchOut, .-CA_MenuArtFillerEntrySwitchOut
	.ident	"GCC: (devkitARM release 66) 15.1.0"
	.code 16
	.align	1
.L23:
	bx	r3
.L66:
	bx	r4
.L107:
	bx	r5
