@Call 0x08069378 FE7U
@r0 ram unit
@
@
@�Ȃ���CC���́A���Q�Ƃ����Ă���̂ŕ␳����.
@

.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

.thumb
.org 0x00

mov r0,r1
blh 0x08018bd8       @FE7U GetUnitPortraitId
mov r4,r0

ldr r0,=0x080693C0   @FE7U LDR���A�h���X���Q�Ƃ��邱�ƂŃ��|�C���g�ɑς���.
ldr r0,[r0]

blh 0x08006b50       @FE7U SetupFaceGfxData

Exit:
ldr r3,=0x08069380+1 @FE7U �߂�A�h���X
bx  r3

.ltorg
.align
Table:
