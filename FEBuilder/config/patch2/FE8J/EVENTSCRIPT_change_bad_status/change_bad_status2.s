@���N��Ԃ̕ύX
@
@40 0D [UNIT] [SICK] [ASM+1]
@41 0D 00 [SICK] [ASM+1]  (Load SVAL1 ID)
@4B 0D 00 [SICK] [ASM+1]  (Load SVALB coord)
@
@Author 7743
@
.align 4
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm
@
@
.thumb
	push	{r4,lr}

	ldr  r4, [r0, #0x38]      @�C�x���g���߂ɃA�N�Z�X�炵�� [r0,#0x38] �ŃC�x���g���߂������Ă���A�h���X�̏ꏊ��

	ldrb r0, [r4, #0x0]       @����0 [FLAG]

	mov  r1,#0xf
	and  r0,r1

	cmp  r0,#0x1
	beq  GetUnitInfoBySVAL1
	cmp  r0,#0xB
	beq  GetUnitInfoByCoord
	cmp  r0,#0xF
	beq  GetUnitInfoByCurrent

	ldrb r0, [r4, #0x2]       @����1 [UNIT]
	b   GetUnitInfo

GetUnitInfoByCurrent:
	ldr  r0,=#0x03004DF0
	ldr  r0,[r0]
	b   GetUnitInfo

GetUnitInfoBySVAL1:
	ldr  r0,=#0xFFFFFFFF
	b   GetUnitInfo

GetUnitInfoByCoord:
	ldr  r0,=#0xFFFFFFFE
	@b   GetUnitInfo

GetUnitInfo:
	blh  0x0800bf3c           @UNITID�̉���
	                          @RAM UNIT POINTER�̎擾
	cmp  r0,#0x00
	beq  Term                 @�擾�ł��Ȃ�������I��

	ldrb r1, [r4, #0x3]       @����2
	mov  r3,r1
	mov  r2,#0x0f             @check bad status
	and  r1,r2                
	cmp  r1,#0x00
	beq  Change               @��ԂȂ��ɂ���炵��

	ldrb r1, [r4, #0x3]       @����2
	mov  r2,#0xf0             @check turn
	and  r2,r3                
	cmp  r2,#0x00
	bne  Change               @�^�[���w�肳��Ă���̂ł��̂܂܍̗p.

	mov  r2,#0x30             @�^�[���������Ă��Ȃ��̂ŁA3�^�[���Ɏ����ݒ�
	orr  r1,r2
	@b    Change

Change:
	@r0  ram unit pointer
	@r1  status.
	mov  r2,#0x30
	strb r1,[r0,r2]

Term:
	blh  0x08019ecc   @RefreshFogAndUnitMaps 
	blh  0x08027144   @SMS_UpdateFromGameData 
	blh  0x08019914   @UpdateGameTilesGraphics 

	mov	r0, #0
	pop {pc,r4}
