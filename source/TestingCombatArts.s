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
	.file	"TestingCombatArts.c"
@ GNU C23 (devkitARM release 66) version 15.1.0 (arm-none-eabi)
@	compiled by GNU C version 13.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -O3
	.text
	.align	1
	.p2align 2,,3
	.global	BigAtkArtUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	BigAtkArtUsability, %function
BigAtkArtUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ source/TestingCombatArts.c:4:     return CombatArtGeneralAttackingUsability();
	ldr	r3, .L3	@ tmp115,
@ source/TestingCombatArts.c:5: }
	@ sp needed	@
@ source/TestingCombatArts.c:4:     return CombatArtGeneralAttackingUsability();
	bl	.L5		@
@ source/TestingCombatArts.c:5: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L4:
	.align	2
.L3:
	.word	CombatArtGeneralAttackingUsability
	.size	BigAtkArtUsability, .-BigAtkArtUsability
	.align	1
	.p2align 2,,3
	.global	BigAtkArtEffect
	.syntax unified
	.code	16
	.thumb_func
	.type	BigAtkArtEffect, %function
BigAtkArtEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ source/TestingCombatArts.c:10: }
	movs	r0, #55	@,
	@ sp needed	@
	bx	lr
	.size	BigAtkArtEffect, .-BigAtkArtEffect
	.ident	"GCC: (devkitARM release 66) 15.1.0"
	.code 16
	.align	1
.L5:
	bx	r3
