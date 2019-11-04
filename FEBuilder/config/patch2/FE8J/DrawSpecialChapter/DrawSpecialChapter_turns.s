@.org 0x080BC380		@FE8J
.thumb

@r0 chapter.no
@r8 mapid

mov  r2, r0      @chapter.no
ldr  r3, Table

Loop:
ldr  r1, [r3]
cmp  r1,#0x0
beq  NotFound

ldrb r1, [r3]
cmp  r1,r8
beq  Found

add  r3, #0x4
b    Loop

Found:
ldrh r0, [r3,#0x02]
ldr  r3,=0xE2           @�I��
cmp  r0,r3
beq  last_chapter

ldr	r3,=0x080bc42e+1	@r0�Ŏw�肳�ꂽ�������\��
bx  r3

NotFound:
cmp r2,#0x00           @����
beq first_chapter

mov r3,#0x01
and r3,r2
bne	gaiden_chapter
lsr r2 ,r2 ,#0x1
ldr	r3,=0x080bc4ac+1	@��
bx  r3

first_chapter:
ldr	r3,=0x080bc428+1	@����
bx  r3

gaiden_chapter:
lsr r2 ,r2 ,#0x1
ldr	r3,=0x080bc468+1	@�O�`
bx  r3

last_chapter:
ldr	r3,=0x080bc42c+1	@�I��
bx  r3

.align 4
.ltorg
Table:
