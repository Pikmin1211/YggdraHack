@Call 0x08076244 FE8J
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
blh 0x08018FCC       @FE8J GetUnitPortraitId
mov r4,r0

ldr r0,=0x0807628C   @FE8J LDR���A�h���X���Q�Ƃ��邱�ƂŃ��|�C���g�ɑς���.
ldr r0,[r0]

blh 0x0800544c       @FE8J SetupFaceGfxData

Exit:
ldr r3,=0x0807624C+1 @FE8J �߂�A�h���X
bx  r3

.ltorg
.align
Table:
