@�u�Ԉړ�(REPOS)
@
@[SVALB] 40 0D [X] [Y] [ASM+1]
@[SVALB] 41 0D [X] [Y] [ASM+1]  �ړ��悪�ǂ���Ă�����NG
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

	ldrb r0, [r4, #0x2]       @����0 [FLAG]
	mov  r1,#0x1
	and  r0,r1

	cmp  r0,#0x0
	beq  SelectUnit

CheckIfBlocked:
	@
	@[1] �� [3] �̖��߃R�[�h�̏ꍇ�A�ǂ���Ă���ړ������Ȃ��̂Ń`�F�b�N����.
	@
	ldr  r0,=0x0202E4D4       @gMapUnit //*gMapUnit[y][x] = �����\ID
	ldr  r0,[r0]

	ldrb r1, [r4, #0x2]       @����1 [X]
	ldrb r2, [r4, #0x3]       @����2 [Y]
	
	lsl  r2,r2,#0x2           @ y << 2
	ldr  r0,[r0,r2]           @gMapUnit[y]
	ldrb r0,[r0,r1]           @gMapUnit[y][x]

	cmp  r0,#0x00             @���[�v��ɒN�����邩?
	bne  Term                 @�N������ꍇ�́A�ړ������Ȃ�.

SelectUnit:
	ldr  r0,=#0xFFFFFFFE
	blh  0x0800bf3c           @UNITID�̉���
	                          @RAM UNIT POINTER�̎擾
	cmp  r0,#0x00
	beq  Term                 @�擾�ł��Ȃ�������I��

Change:
	ldrb r1, [r4, #0x2]       @����1 [X]
	ldrb r2, [r4, #0x3]       @����2 [Y]

	strb r1,[r0,#0x10]        @Unit@10	byte	X	���W
	strb r2,[r0,#0x11]        @Unit@11	byte	Y	���W

	blh  0x08019ecc   @RefreshFogAndUnitMaps 
	blh  0x08027144   @SMS_UpdateFromGameData 
	blh  0x08019914   @UpdateGameTilesGraphics 

Term:
	mov	r0, #0
	pop {pc,r4}
