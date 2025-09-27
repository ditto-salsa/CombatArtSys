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
@ GNU C17 (devkitARM release 64) version 14.1.0 (arm-none-eabi)
@	compiled by GNU C version 10.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

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
@ source/CombatArts.c:7:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	ldr	r4, .L16	@ tmp123,
	ldr	r3, [r4, #16]	@ _20, CombatArtList[0].preBattleFunction
@ source/CombatArts.c:6: void CombatArtPrebattleFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget){
	movs	r5, r0	@ BattleActor, tmp124
	movs	r6, r1	@ BattleTarget, tmp125
@ source/CombatArts.c:7:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	adds	r2, r3, #1	@ tmp126, _20,
	beq	.L1		@,
	adds	r4, r4, #48	@ ivtmp.19,
.L5:
@ source/CombatArts.c:8:         if (CombatArtList[i].preBattleFunction == NULL) continue;
	cmp	r3, #0	@ _20,
	beq	.L3		@,
@ source/CombatArts.c:10:         CombatArtList[i].preBattleFunction(BattleActor, BattleTarget);
	movs	r1, r6	@, BattleTarget
	movs	r0, r5	@, BattleActor
	bl	.L18		@
@ source/CombatArts.c:7:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	ldr	r3, [r4]	@ _20,* ivtmp.19
@ source/CombatArts.c:7:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	adds	r4, r4, #32	@ ivtmp.19,
	adds	r2, r3, #1	@ tmp127, _20,
	bne	.L5		@,
.L1:
@ source/CombatArts.c:12: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L3:
@ source/CombatArts.c:7:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	ldr	r3, [r4]	@ _20,* ivtmp.19
@ source/CombatArts.c:7:     for (int i = 0; (int)CombatArtList[i].preBattleFunction != (-1); i++){
	adds	r4, r4, #32	@ ivtmp.19,
	adds	r2, r3, #1	@ tmp128, _20,
	bne	.L5		@,
	b	.L1		@
.L17:
	.align	2
.L16:
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
@ source/CombatArts.c:15:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	ldr	r4, .L33	@ tmp124,
	ldr	r3, [r4, #20]	@ _21, CombatArtList[0].postBattleFunction
@ source/CombatArts.c:14: void CombatArtPostbattleFuncIterator(struct Unit* actor, struct Unit* target, struct ActionData* ad){
	movs	r5, r0	@ actor, tmp125
	movs	r6, r1	@ target, tmp126
	movs	r7, r2	@ ad, tmp127
@ source/CombatArts.c:15:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	adds	r2, r3, #1	@ tmp128, _21,
	beq	.L19		@,
	adds	r4, r4, #52	@ ivtmp.29,
.L23:
@ source/CombatArts.c:16:         if (CombatArtList[i].postBattleFunction == NULL) continue;
	cmp	r3, #0	@ _21,
	beq	.L21		@,
@ source/CombatArts.c:18:         CombatArtList[i].postBattleFunction(actor, target, ad);
	movs	r2, r7	@, ad
	movs	r1, r6	@, target
	movs	r0, r5	@, actor
	bl	.L18		@
@ source/CombatArts.c:15:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	ldr	r3, [r4]	@ _21,* ivtmp.29
@ source/CombatArts.c:15:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	adds	r4, r4, #32	@ ivtmp.29,
	adds	r2, r3, #1	@ tmp129, _21,
	bne	.L23		@,
.L19:
@ source/CombatArts.c:20: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L21:
@ source/CombatArts.c:15:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	ldr	r3, [r4]	@ _21,* ivtmp.29
@ source/CombatArts.c:15:     for (int i = 0; (int)CombatArtList[i].postBattleFunction != (-1); i++){
	adds	r4, r4, #32	@ ivtmp.29,
	adds	r2, r3, #1	@ tmp130, _21,
	bne	.L23		@,
	b	.L19		@
.L34:
	.align	2
.L33:
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
@ source/CombatArts.c:23:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	ldr	r5, .L49	@ tmp125,
	ldr	r4, [r5, #24]	@ _22, CombatArtList[0].battleProcFunction
@ source/CombatArts.c:22: void CombatArtBattleProcFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget, struct BattleHit* bhIterator, struct BattleStats* bs){
	push	{r7, lr}	@
@ source/CombatArts.c:22: void CombatArtBattleProcFuncIterator(struct BattleUnit* BattleActor, struct BattleUnit* BattleTarget, struct BattleHit* bhIterator, struct BattleStats* bs){
	movs	r6, r0	@ BattleActor, tmp126
	movs	r7, r1	@ BattleTarget, tmp127
	mov	r8, r2	@ bhIterator, tmp128
	mov	r9, r3	@ bs, tmp129
@ source/CombatArts.c:23:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	adds	r3, r4, #1	@ tmp130, _22,
	beq	.L35		@,
	adds	r5, r5, #56	@ ivtmp.38,
.L39:
@ source/CombatArts.c:24:         if (CombatArtList[i].battleProcFunction == NULL) continue;
	cmp	r4, #0	@ _22,
	beq	.L37		@,
@ source/CombatArts.c:26:         CombatArtList[i].battleProcFunction(BattleActor, BattleTarget, bhIterator, bs);
	mov	r3, r9	@, bs
	mov	r2, r8	@, bhIterator
	movs	r1, r7	@, BattleTarget
	movs	r0, r6	@, BattleActor
	bl	.L51		@
@ source/CombatArts.c:23:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	ldr	r4, [r5]	@ _22,* ivtmp.38
@ source/CombatArts.c:23:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	adds	r5, r5, #32	@ ivtmp.38,
	adds	r3, r4, #1	@ tmp131, _22,
	bne	.L39		@,
.L35:
@ source/CombatArts.c:28: }
	@ sp needed	@
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L37:
@ source/CombatArts.c:23:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	ldr	r4, [r5]	@ _22,* ivtmp.38
@ source/CombatArts.c:23:     for (int i = 0; (int)CombatArtList[i].battleProcFunction != (-1); i++){
	adds	r5, r5, #32	@ ivtmp.38,
	adds	r3, r4, #1	@ tmp132, _22,
	bne	.L39		@,
	b	.L35		@
.L50:
	.align	2
.L49:
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
@ source/CombatArts.c:33:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	ldr	r4, .L63	@ tmp125,
	ldr	r3, [r4, #28]	@ _14, CombatArtList[0].rangeFunction
@ source/CombatArts.c:30: int CombatArtRangeFuncIterator(struct Unit* unit, int itemID, int rangeWord){
	movs	r5, r0	@ unit, tmp127
	movs	r6, r1	@ itemID, tmp128
@ source/CombatArts.c:33:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	adds	r1, r3, #1	@ tmp131, _14,
	beq	.L52		@,
	adds	r4, r4, #60	@ ivtmp.47,
.L56:
@ source/CombatArts.c:34:         if (CombatArtList[i].rangeFunction == NULL) continue;
	cmp	r3, #0	@ _14,
	beq	.L54		@,
@ source/CombatArts.c:36:         returnedRangeWord = CombatArtList[i].rangeFunction(unit, itemID, returnedRangeWord);
	movs	r1, r6	@, itemID
	movs	r0, r5	@, unit
	bl	.L18		@
@ source/CombatArts.c:33:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	ldr	r3, [r4]	@ _14,* ivtmp.47
@ source/CombatArts.c:36:         returnedRangeWord = CombatArtList[i].rangeFunction(unit, itemID, returnedRangeWord);
	movs	r2, r0	@ <retval>, tmp130
@ source/CombatArts.c:33:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	adds	r4, r4, #32	@ ivtmp.47,
	adds	r1, r3, #1	@ tmp132, _14,
	bne	.L56		@,
.L52:
@ source/CombatArts.c:40: }
	@ sp needed	@
	movs	r0, r2	@, <retval>
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L54:
@ source/CombatArts.c:33:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	ldr	r3, [r4]	@ _14,* ivtmp.47
@ source/CombatArts.c:33:     for (int i = 0; (int)CombatArtList[i].rangeFunction != (-1); i++){
	adds	r4, r4, #32	@ ivtmp.47,
	adds	r1, r3, #1	@ tmp133, _14,
	bne	.L56		@,
	b	.L52		@
.L64:
	.align	2
.L63:
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
@ source/CombatArts.c:47:     if (CombatArtList[0].menuUsability == NULL) return MENU_ENABLED;
	ldr	r4, .L83	@ tmp123,
	ldr	r3, [r4, #4]	@ _3, CombatArtList[0].menuUsability
@ source/CombatArts.c:47:     if (CombatArtList[0].menuUsability == NULL) return MENU_ENABLED;
	cmp	r3, #0	@ _3,
	beq	.L66		@,
	adds	r4, r4, #36	@ ivtmp.56,
@ source/CombatArts.c:51:     for (int i = 0; (int)CombatArtList[i].menuUsability != (-1); i++){
	adds	r2, r3, #1	@ tmp128, _3,
	beq	.L68		@,
.L71:
@ source/CombatArts.c:53:         if (CombatArtList[i].menuUsability == NULL) continue;
	cmp	r3, #0	@ _3,
	beq	.L72		@,
@ source/CombatArts.c:55:         if (CombatArtList[i].menuUsability(NULL, 0) == TRUE){
	movs	r1, #0	@,
	movs	r0, #0	@,
	bl	.L18		@
@ source/CombatArts.c:55:         if (CombatArtList[i].menuUsability(NULL, 0) == TRUE){
	cmp	r0, #1	@ tmp127,
	beq	.L66		@,
.L72:
@ source/CombatArts.c:51:     for (int i = 0; (int)CombatArtList[i].menuUsability != (-1); i++){
	ldr	r3, [r4]	@ _3, MEM[(u8 (*<Ta8e>) (const struct MenuItemDef *, int) *)_8]
@ source/CombatArts.c:51:     for (int i = 0; (int)CombatArtList[i].menuUsability != (-1); i++){
	adds	r4, r4, #32	@ ivtmp.56,
	adds	r2, r3, #1	@ tmp129, _3,
	bne	.L71		@,
.L68:
@ source/CombatArts.c:61:     return anyArtsUsable ? MENU_ENABLED : MENU_NOTSHOWN;
	movs	r0, #3	@ <retval>,
	b	.L69		@
.L66:
@ source/CombatArts.c:47:     if (CombatArtList[0].menuUsability == NULL) return MENU_ENABLED;
	movs	r0, #1	@ <retval>,
.L69:
@ source/CombatArts.c:62: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L84:
	.align	2
.L83:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ source/CombatArts.c:68:     StartOrphanMenu(&CAMenuDef);
	ldr	r0, .L86	@ tmp117,
@ source/CombatArts.c:71: }
	@ sp needed	@
@ source/CombatArts.c:68:     StartOrphanMenu(&CAMenuDef);
	ldr	r3, .L86+4	@ tmp118,
	bl	.L18		@
@ source/CombatArts.c:71: }
	movs	r0, #55	@,
	pop	{r4}
	pop	{r1}
	bx	r1
.L87:
	.align	2
.L86:
	.word	CAMenuDef
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
@ source/CombatArts.c:76: }
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
@ source/CombatArts.c:80: }
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
@ source/CombatArts.c:84: }
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
	.ident	"GCC: (devkitARM release 64) 14.1.0"
	.code 16
	.align	1
.L18:
	bx	r3
.L51:
	bx	r4
