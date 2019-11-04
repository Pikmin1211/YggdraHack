.thumb

@r0 temp
@r1 temp
@r2 temp Unit Struct
@r3 temp default range
@r4 temp
@r5 temp
@r6 is CharStruct
@.byte jump at 17672 use r1 as hook   @FE8J

.org 0x0
push	{r4-r6}
lsl 	r0,r0,#0x1C
lsr 	r0,r0,#0x1C         @�����̎��E+�����̎��E
add 	r3,r0               @r3�����E�̒���

add		r2, #0x1C           @�����A�C�e���� 0x1E-2
mov     r5, r2

add     r2, #0x0C           @�����A�C�e���I�[
mov     r6, r2


ldr     r4,TorchWeapons_Table
sub     r4, #0x4            @�ʓ|�Ȃ̂ŁA�e�[�u���̈ʒu������炵�Ă���
LoLightLoop:
	add		r4,#0x04
	ldrb    r1,[r4]
	cmp     r1,#0x00
	beq     NotFound

	mov     r2, r5          @�A�C�e���X�L�������[�v
	
	ItemLoop:
		add		r2,#0x02
		cmp     r2,r6
		bge     LoLightLoop         @�A�C�e����5�`�F�b�N���I�����

		ldrb    r0, [r2]
		cmp     r0,#0x00            @�A�C�e���I�[
		beq     LoLightLoop

		cmp     r0,r1               @�}�b�`����
		bne     ItemLoop

        @Found:
		ldr     r0,=0x0202BCEC      @FE8J gChapterData
		ldrb    r0, [r0, #0xd]      @gChapterData->Fog
		cmp     r3,r0
		bgt     Theif               @�����}�b�v���E�����{�[�i�X�������Ă���̂ŃV�[�t���낤
			ldrb    r0,[r4, #0x1]       @���E�{�[�i�X�l
			add     r3,r0               @�����̎��E+�{�[�i�X�l
			b       Term

		Theif:
			ldrb    r0,[r4, #0x2]       @�����̎��E�{�[�i�X�l
			add     r3,r0               @�����̎��E+�{�[�i�X�l

NotFound:
Term:
		mov r0, r3
LetPlay:
pop		{r4-r6}
pop 	{r1}
bx 		r1

.ltorg
.align
TorchWeapons_Table:
@struct TorchWeapons_Table
@{
@   byte    item_id;
@   byte    add_range;
@   byte    add_range_theif;
@   byte    padding;
@} //sizeof() == 4
@
