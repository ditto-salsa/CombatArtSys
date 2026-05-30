.thumb

.set gBattleHitIterator, LiteralPool
.set gBattleStats, LiteralPool+4
.set BattleRoll2RN, LiteralPool+8
.set AttributeBitmask, LiteralPool+12
.set BattleRoll1RN, LiteralPool+16
.set FunctionList, EALiterals

// things needed during the loop: FunctionList, offset tracker, gBattleActor, gBattleTarget, gBattleHitIterator, gBattleStats

push {r4, r5, r6, r7, r14}
mov r7, r10
mov r6, r9
mov r5, r8
push {r5, r6, r7}

// BattleGenerateHitAttributes start section
mov r9, r0
mov r10, r1
ldr r7, gBattleHitIterator
ldr r6, gBattleStats

mov r0, #0
strh r0, [r6, #0x4] // gBattleStats.damage = 0

ldrh r0, [r6, #0xA]
mov r1, #0x1
ldr r4, BattleRoll2RN
bl bx_r4
cmp r0, #0
bne Hit

Miss: // fallthrough
ldr r3, [r7]
ldr r2, [r3]
lsl r1, r2, #0xD
lsr r1, r1, #0xD
mov r0, #0x2 // set the miss attribute flag
orr r1, r0
ldr r0, AttributeBitmask
and r0, r2
orr r0, r1
str r0, [r3]
b LoopInit

Hit:
// gBattleStats.damage = gBattleStats.attack - gBattleStats.defense
ldrh r0, [r6, #0x6]
ldrh r1, [r6, #0x8]
sub r0, r0, r1
strh r0, [r6, #0x4]
// if (BattleRoll1RN(gBattleStats.critRate, FALSE) == TRUE)
ldr r4, BattleRoll1RN
ldrh r0, [r6, #0xC]
mov r1, #0
bl bx_r4
cmp r0, #0
beq LoopInit
// gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_CRIT
ldr r3, [r7]
ldr r2, [r3]
lsl r1, r2, #0xD
lsr r1, r1, #0xD
mov r0, #0x1 // set the crit attribute flag
orr r1, r0
ldr r0, AttributeBitmask
and r0, r2
orr r0, r1
str r0, [r3]
// gBattleStats.damage *= 3
ldrh r0, [r6, #0x4]
mov r1, #0x3
mul r0, r1
strh r0, [r6, #0x4]

LoopInit:
// r4 will be loaded with the function to run, r5 = FunctionList, r6 = offset tracker, r7 = gBattleHitIterator, r8 = gBattleStats, r9 = gBattleActor and r10 = gBattleTarget
ldr r5, FunctionList
mov r8, r6
mov r6, #0
// did a lot of this setup in the beginning, so not much here
Loop:
ldr r4, [r5, r6]
cmp r4, #0 // null terminated list
beq EndLoop
mov r0, r9
mov r1, r10
mov r2, r7
mov r3, r8
bl bx_r4
add r6, #0x4
b Loop

EndLoop:
mov r6, r8
ldrh r2, [r6, #0x4]

cmp r2, #0x7F
ble DontCapDamage
	mov r0, #0x7F
	strh r0, [r6, #0x4]
DontCapDamage:

cmp r2, #0
bge DontFloorDamage
	mov r0, #0
	strh r0, [r6, #0x4]
DontFloorDamage:

cmp r2, #0
beq End
	mov r3, r9
	mov r1, #0x7C
	mov r0, #0x1
	strb r0, [r3, r1] // attacker->nonZeroDamage = TRUE

End:
pop {r5, r6, r7}
mov r8, r5
mov r9, r6
mov r10, r7
pop {r4, r5, r6, r7}
pop {r0}
bx r0

bx_r4:
bx r4

.align
LiteralPool:
.word 0x0203A608
.word 0x0203A4D4
.word 0x0802A559
.word 0xFFF80000
.word 0x0802A52D
EALiterals:
