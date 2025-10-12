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
	.file	"VanillaFunctionEdits.c"
@ GNU C23 (devkitARM release 66) version 15.1.0 (arm-none-eabi)
@	compiled by GNU C version 13.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -O3
	.text
	.align	1
	.p2align 2,,3
	.global	RedrawMenu
	.syntax unified
	.code	16
	.thumb_func
	.type	RedrawMenu, %function
RedrawMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	mov	r5, r8	@,
	mov	lr, fp	@,
	mov	r7, r10	@,
	mov	r6, r9	@,
@ source/VanillaFunctionEdits.c:7:     if (proc->state & MENU_STATE_NOTSHOWN)
	movs	r3, #99	@ tmp178,
@ source/VanillaFunctionEdits.c:4: {
	push	{r5, r6, r7, lr}	@
@ source/VanillaFunctionEdits.c:7:     if (proc->state & MENU_STATE_NOTSHOWN)
	ldrb	r3, [r0, r3]	@ tmp182,
@ source/VanillaFunctionEdits.c:4: {
	movs	r5, r0	@ proc, proc
	sub	sp, sp, #28	@,,
@ source/VanillaFunctionEdits.c:7:     if (proc->state & MENU_STATE_NOTSHOWN)
	lsls	r3, r3, #28	@ tmp275, tmp182,
	bpl	.L18		@,
.L1:
@ source/VanillaFunctionEdits.c:47: }
	add	sp, sp, #28	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L18:
@ source/VanillaFunctionEdits.c:11:         BG_GetMapBuffer(proc->backBg),
	movs	r3, #100	@ tmp279,
	ldrb	r0, [r0, r3]	@ *proc_64(D), *proc_64(D)
@ source/VanillaFunctionEdits.c:10:     DrawUiFrame(
	ldr	r3, .L22	@ tmp266,
@ source/VanillaFunctionEdits.c:11:         BG_GetMapBuffer(proc->backBg),
	lsls	r0, r0, #30	@ tmp194, *proc_64(D),
@ source/VanillaFunctionEdits.c:10:     DrawUiFrame(
	lsrs	r0, r0, #30	@ _3, tmp194,
	str	r3, [sp, #20]	@ tmp266, %sfp
	bl	.L24		@
	movs	r1, #43	@ tmp282,
@ source/VanillaFunctionEdits.c:12:         proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h,
	movs	r7, #42	@ tmp200,
@ source/VanillaFunctionEdits.c:13:         proc->tileref, proc->def->style);
	ldr	r4, [r5, #48]	@ proc_64(D)->def, proc_64(D)->def
@ source/VanillaFunctionEdits.c:10:     DrawUiFrame(
	ldrb	r4, [r4, #4]	@ tmp205,
	ldrsb	r3, [r5, r1]	@ _10,
@ source/VanillaFunctionEdits.c:12:         proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h,
	subs	r1, r1, #2	@ tmp202,
@ source/VanillaFunctionEdits.c:10:     DrawUiFrame(
	ldrsb	r2, [r5, r7]	@ _8,
@ source/VanillaFunctionEdits.c:12:         proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h,
	mov	r8, r1	@ tmp202, tmp202
@ source/VanillaFunctionEdits.c:10:     DrawUiFrame(
	ldrsb	r1, [r5, r1]	@ _6,
	str	r4, [sp, #8]	@ tmp205,
@ source/VanillaFunctionEdits.c:13:         proc->tileref, proc->def->style);
	movs	r4, #102	@ tmp206,
@ source/VanillaFunctionEdits.c:10:     DrawUiFrame(
	ldrh	r4, [r5, r4]	@ tmp207,
	str	r4, [sp, #4]	@ tmp207,
@ source/VanillaFunctionEdits.c:12:         proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h,
	movs	r4, #44	@ tmp208,
@ source/VanillaFunctionEdits.c:10:     DrawUiFrame(
	ldrsb	r6, [r5, r4]	@ tmp209,
	str	r6, [sp]	@ tmp209,
	ldr	r6, .L22+4	@ tmp210,
	bl	.L25		@
@ source/VanillaFunctionEdits.c:16:         BG_GetMapBuffer(proc->frontBg),
	movs	r2, #100	@ tmp287,
	ldrb	r0, [r5, r2]	@ *proc_64(D), *proc_64(D)
	lsls	r0, r0, #28	@ tmp217, *proc_64(D),
@ source/VanillaFunctionEdits.c:15:     ClearUiFrame(
	ldr	r3, [sp, #20]	@ tmp266, %sfp
	lsrs	r0, r0, #30	@ _19, tmp217,
	bl	.L24		@
	movs	r1, #43	@ tmp289,
	ldrsb	r3, [r5, r1]	@ _26,
	mov	r1, r8	@ tmp202, tmp202
	ldrsb	r4, [r5, r4]	@ tmp228,
	ldrsb	r2, [r5, r7]	@ _24,
	ldrsb	r1, [r5, r1]	@ _22,
	str	r4, [sp]	@ tmp228,
	ldr	r4, .L22+8	@ tmp229,
	bl	.L26		@
@ source/VanillaFunctionEdits.c:19:     for (i = 0; i < proc->itemCount; ++i)
	movs	r3, #96	@ tmp230,
@ source/VanillaFunctionEdits.c:19:     for (i = 0; i < proc->itemCount; ++i)
	ldrb	r3, [r5, r3]	@ tmp231,
	cmp	r3, #0	@ tmp231,
	beq	.L3		@,
	movs	r7, r5	@ ivtmp.6, proc
@ source/VanillaFunctionEdits.c:38:             Text_DrawString(&item->text, GetStringFromIndex(item->def->nameMsgId));
	ldr	r3, .L22+12	@ tmp267,
	mov	r9, r3	@ tmp267, tmp267
@ source/VanillaFunctionEdits.c:38:             Text_DrawString(&item->text, GetStringFromIndex(item->def->nameMsgId));
	ldr	r3, .L22+16	@ tmp268,
	mov	r10, r3	@ tmp268, tmp268
@ source/VanillaFunctionEdits.c:40:         PutText(
	ldr	r3, .L22+20	@ tmp269,
@ source/VanillaFunctionEdits.c:19:     for (i = 0; i < proc->itemCount; ++i)
	movs	r6, #0	@ i,
@ source/VanillaFunctionEdits.c:40:         PutText(
	mov	fp, r3	@ tmp269, tmp269
	adds	r7, r7, #52	@ ivtmp.6,
	b	.L8		@
.L19:
@ source/VanillaFunctionEdits.c:25:             item->def->onDraw(proc, item);
	movs	r1, r4	@, item
	movs	r0, r5	@, proc
	bl	.L24		@
@ source/VanillaFunctionEdits.c:19:     for (i = 0; i < proc->itemCount; ++i)
	movs	r3, #96	@ tmp259,
	ldrb	r3, [r5, r3]	@ _54,
@ source/VanillaFunctionEdits.c:19:     for (i = 0; i < proc->itemCount; ++i)
	adds	r6, r6, #1	@ i,
@ source/VanillaFunctionEdits.c:19:     for (i = 0; i < proc->itemCount; ++i)
	adds	r7, r7, #4	@ ivtmp.6,
	cmp	r3, r6	@ _54, i
	ble	.L3		@,
.L8:
@ source/VanillaFunctionEdits.c:21:         struct MenuItemProc* item = proc->menuItems[i];
	ldr	r4, [r7]	@ item, MEM[(struct MenuItemProc * *)_96]
@ source/VanillaFunctionEdits.c:23:         if (item->def->onDraw)
	ldr	r2, [r4, #48]	@ _29, item_72->def
@ source/VanillaFunctionEdits.c:23:         if (item->def->onDraw)
	ldr	r3, [r2, #16]	@ _30, _29->onDraw
@ source/VanillaFunctionEdits.c:23:         if (item->def->onDraw)
	cmp	r3, #0	@ _30,
	bne	.L19		@,
	movs	r3, #52	@ _36,
	mov	ip, r3	@ _36, _36
@ source/VanillaFunctionEdits.c:29:         if (item->def->color)
	ldrb	r1, [r2, #8]	@ _31,
	add	ip, ip, r4	@ _36, item
	mov	r8, ip	@ _36, _36
@ source/VanillaFunctionEdits.c:29:         if (item->def->color)
	cmp	r1, #0	@ _31,
	bne	.L20		@,
@ source/VanillaFunctionEdits.c:32:         if (item->availability == MENU_DISABLED)
	movs	r3, #61	@ tmp234,
@ source/VanillaFunctionEdits.c:32:         if (item->availability == MENU_DISABLED)
	ldrb	r3, [r4, r3]	@ tmp235,
	cmp	r3, #2	@ tmp235,
	beq	.L21		@,
.L7:
@ source/VanillaFunctionEdits.c:38:             Text_DrawString(&item->text, GetStringFromIndex(item->def->nameMsgId));
	ldr	r3, [r4, #48]	@ item_72->def, item_72->def
@ source/VanillaFunctionEdits.c:38:             Text_DrawString(&item->text, GetStringFromIndex(item->def->nameMsgId));
	ldrh	r0, [r3, #4]	@ _39,
	bl	.L27		@
	movs	r1, r0	@ _40,
@ source/VanillaFunctionEdits.c:38:             Text_DrawString(&item->text, GetStringFromIndex(item->def->nameMsgId));
	mov	r0, r8	@, _36
	bl	.L28		@
@ source/VanillaFunctionEdits.c:42:             TILEMAP_LOCATED(BG_GetMapBuffer(proc->frontBg), item->xTile, item->yTile));
	movs	r3, #100	@ tmp244,
	ldrb	r0, [r5, r3]	@ *proc_64(D), *proc_64(D)
	lsls	r0, r0, #28	@ tmp248, *proc_64(D),
	ldr	r3, [sp, #20]	@ tmp266, %sfp
	lsrs	r0, r0, #30	@ _42, tmp248,
	bl	.L24		@
@ source/VanillaFunctionEdits.c:42:             TILEMAP_LOCATED(BG_GetMapBuffer(proc->frontBg), item->xTile, item->yTile));
	movs	r2, #44	@ tmp277,
	ldrsh	r3, [r4, r2]	@ _45, item, tmp277
	movs	r1, #42	@ tmp278,
	ldrsh	r2, [r4, r1]	@ _48, item, tmp278
	lsls	r3, r3, #5	@ _46, _45,
	adds	r3, r3, r2	@ _49, _46, _48
	lsls	r3, r3, #1	@ _51, _49,
@ source/VanillaFunctionEdits.c:40:         PutText(
	adds	r1, r0, r3	@ _52, _43, _51
	mov	r0, r8	@, _36
	bl	.L29		@
@ source/VanillaFunctionEdits.c:19:     for (i = 0; i < proc->itemCount; ++i)
	movs	r3, #96	@ tmp259,
	ldrb	r3, [r5, r3]	@ _54,
@ source/VanillaFunctionEdits.c:19:     for (i = 0; i < proc->itemCount; ++i)
	adds	r6, r6, #1	@ i,
@ source/VanillaFunctionEdits.c:19:     for (i = 0; i < proc->itemCount; ++i)
	adds	r7, r7, #4	@ ivtmp.6,
	cmp	r3, r6	@ _54, i
	bgt	.L8		@,
.L3:
@ source/VanillaFunctionEdits.c:45:     DrawMenuItemHover(proc, proc->itemCurrent, TRUE);
	movs	r3, #97	@ tmp261,
@ source/VanillaFunctionEdits.c:45:     DrawMenuItemHover(proc, proc->itemCurrent, TRUE);
	movs	r0, r5	@, proc
	ldrb	r1, [r5, r3]	@ _56,
	movs	r2, #1	@,
	ldr	r3, .L22+24	@ tmp263,
	bl	.L24		@
@ source/VanillaFunctionEdits.c:46:     SyncMenuBgs(proc);
	movs	r0, r5	@, proc
	ldr	r3, .L22+28	@ tmp264,
	bl	.L24		@
	b	.L1		@
.L20:
@ source/VanillaFunctionEdits.c:30:             Text_SetColor(&item->text, item->def->color);
	ldr	r3, .L22+32	@ tmp233,
	mov	r0, ip	@, _36
	bl	.L24		@
@ source/VanillaFunctionEdits.c:32:         if (item->availability == MENU_DISABLED)
	movs	r3, #61	@ tmp234,
@ source/VanillaFunctionEdits.c:32:         if (item->availability == MENU_DISABLED)
	ldrb	r3, [r4, r3]	@ tmp235,
	cmp	r3, #2	@ tmp235,
	bne	.L7		@,
.L21:
@ source/VanillaFunctionEdits.c:33:             Text_SetColor(&item->text, TEXT_COLOR_SYSTEM_GRAY);
	movs	r1, #1	@,
	mov	r0, r8	@, _36
	ldr	r3, .L22+32	@ tmp237,
	bl	.L24		@
	b	.L7		@
.L23:
	.align	2
.L22:
	.word	BG_GetMapBuffer
	.word	DrawUiFrame
	.word	ClearUiFrame
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	PutText
	.word	DrawMenuItemHover
	.word	SyncMenuBgs
	.word	Text_SetColor
	.size	RedrawMenu, .-RedrawMenu
	.ident	"GCC: (devkitARM release 66) 15.1.0"
	.code 16
	.align	1
.L24:
	bx	r3
.L26:
	bx	r4
.L25:
	bx	r6
.L27:
	bx	r9
.L28:
	bx	r10
.L29:
	bx	fp
