; 080160d0 ���炱�̃R�[�h�֔�΂�.

@thumb
	cmp  r0, #0x10		;BGM:�����߂�
	bne  exit			;�Ⴄ�Ȃ�I��
	
	                    ;�}�b�v�ݒ肩��擾

	ldr  r0, =$0202BCEC
	ldrb r0, [r0, #14]
	ldr  r1, =$08034520
	mov  lr, r1
	@dcw $F800
	add  r0, #0x28
	ldrh r0, [r0]
exit
	ldr r1,=$08016fdc
	mov pc,r1
