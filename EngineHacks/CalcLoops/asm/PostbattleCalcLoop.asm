.thumb

.set gActiveUnit, LiteralPool
.set gActionData, LiteralPool+4
.set GetUnit, LiteralPool+8
.set GetUnitCurrentHp, LiteralPool+12
.set ReturnAddress, LiteralPool+16
.set FunctionList, EALiterals

// passing in gActiveUnit in r0, GetUnit(gActionData.targetIndex) in r1, gActionData in r2
push {r4, r5, r6, r7}

ldr r4, gActiveUnit
ldr r5, FunctionList
mov r6, #0
ldr r7, gActionData

Loop:
mov r1, #0xD
ldr r0, [r7, r1] // targetIndex
ldr r3, GetUnit
bl bx_r3
mov r1, r0
ldr r0, [r4]
mov r2, r7

ldr r3, [r5, r6]
cmp r3, #0
beq End
bl bx_r3
add r6, #4
b Loop

End:
// returning to the hooked function, need 0x3004E50 in r4, result of GetUnitCurrentHp when passing in dereference to r4, in r0
// return address is 0x37750
ldr r3, GetUnitCurrentHp
ldr r0, [r4]
bl bx_r3

pop {r4, r5, r6, r7}

ldr r3, ReturnAddress
bx_r3:
bx r3

.align
LiteralPool:
.word 0x03004E50
.word 0x0203A958
.word 0x08019431
.word 0x08019151
.word 0x08037751
EALiterals:
