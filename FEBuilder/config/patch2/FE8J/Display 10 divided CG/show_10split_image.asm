;3�l�g�݂�\������֐����g�����āAED�}�G��\���ł���悤�ɂ��� �{��
;
;ED3�l�g��\������R�[�h
;221A0000
;42210000 00000200
;221A0000
;����N�Ő؂�ւ�����悤�ɂ��遫��
;221A0000
;42210[N]00 00000200
;221A0000
;
;�摜�\����A�}�b�v�����������Ȃ鎞������B
;���̎��́A�K���ɔw�i��`�悵�Ĕw�i�������Ă��������B�w�i�t����b�ł��B
;�摜�\�����Ԃ����΂������Ƃ��́A ����221A0000�̑O�ɃE�F�C�g���߂��B
;
;N=
;[0]->0x08ac0524 ED3�l�g
;[1]->0x08AC0530 �����������G�C���[�N
;[2]->0x08ac053c ���Ό���
;[3]->0x08AC0548 �h���S���i�C�g
;[4]->0x08AC0554 �[�g�ƃG�C���[�N
;[5]->0x08AC0560 �����Ɛ���
;[6]->0x08AC056C �[�g�P��
;[7]->0x08AC0578 �y�K�T�X�i�C�g
;[8]->0x08AC0584 ���[�`�F����n
;[9]->0x08AC0590 �x��q�ƒ��̐l
;
@thumb
;@org�͎g���Ă͂����܂���B 
;@org	$08E4FD50

mov r4,r5           ;r5�̃������ʒu���ǂ����Ă��K�v

mov r5,r8           ;���̏���������
push	{r5, r6, r7}
mov	r9, r0
mov	r7, r1
mov	r8, r2
mov	r10, r3         ;�����܂Ō�����

mov r0,r4           ;��r5�̃������ʒu + 0x38 = ���݂̃C�x���g���� �X�N���v�g�R�[�h�ւ̃|�C���^
add r0,#0x38

ldr r0,[r0]         ; ���݂̃C�x���g���� �X�N���v�g�R�[�h��
ldrb r6,[r0,#0x2]   ; �C�x���g���� �X�N���v�g�R�[�h�� �ԍ����Ƃ�.

mov r0,#0x0C
mul r6,r0           ; 1�� 12�o�C�g��؂� �ԍ�*12�o�C�g
ldr r0,=$0x08ac0524
add r6,r6,r0        ;$0x08ac0524 + (12�o�C�g*��)
                    ;
                    ;struct split10image_list{
                    ; split10image* table;
                    ; tsa*         tsa;
                    ; pallet*      pallet;
                    ;}; sizeof() == 4*3 = 12�o�C�g
                    ;
                    ;struct split10image{
                    ; image*    row1; //���k�摜10��
                    ; image*    row2;
                    ; image*    row3;
                    ; image*    row4;
                    ; image*    row5;
                    ; image*    row6;
                    ; image*    row7;
                    ; image*    row8;
                    ; image*    row9;
                    ; image*    row10;
                    ;};
                    ;

;���ɖ߂�.
ldr	r0, =$080bb196  ;080bb196 2500     	mov	r5, #0        //r5=0
mov	pc, r0
