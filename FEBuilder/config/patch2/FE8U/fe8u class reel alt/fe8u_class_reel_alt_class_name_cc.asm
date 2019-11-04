.thumb
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

@Call 080CCB54
@CC����Ƃ��̃N���X��
@r0 class id -> result class name str
@sp���Q�Ƃ���̂�push/pop�͍T���悤.

mov  r1,r0
lsl  r1,#0x1
ldr  r2,fe8u_class_reel_alt_class_name_table    @Alt Class Name (Text ID)
add  r2,r1
ldrh r1,[r2]

cmp  r1, #0x00
beq  Orignal


mov  r0, r1
b    GetText

Orignal:              @ �e�L�X�g���ݒ肳��Ă��Ȃ��ꍇ�A�I���W�i���̃��[�`�����đ�
blh  0x08019444       @GetROMClassStruct
ldrh r0, [r0, #0x0]

GetText:
add  r1,sp, #0x4
blh  0x0800a280       @GetStringFromIndexInBuffer 
add  r0,sp, #0x4

Exit:
ldr  r3,=0x080CCB62+1
bx   r3

.ltorg
.align
fe8u_class_reel_alt_class_name_table:
@POIN fe8u_class_reel_alt_class_name_table
