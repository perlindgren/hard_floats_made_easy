
cm_test:	file format elf32-littlearm

Disassembly of section .text:

08000400 <__stext>:
 8000400: f000 f82d    	bl	0x800045e <__pre_init>  @ imm = #0x5a
 8000404: 480e         	ldr	r0, [pc, #0x38]         @ 0x8000440 <__stext+0x40>
 8000406: 490f         	ldr	r1, [pc, #0x3c]         @ 0x8000444 <__stext+0x44>
 8000408: 2200         	movs	r2, #0x0
 800040a: 4281         	cmp	r1, r0
 800040c: d001         	beq	0x8000412 <__stext+0x12> @ imm = #0x2
 800040e: c004         	stm	r0!, {r2}
 8000410: e7fb         	b	0x800040a <__stext+0xa> @ imm = #-0xa
 8000412: 480d         	ldr	r0, [pc, #0x34]         @ 0x8000448 <__stext+0x48>
 8000414: 490d         	ldr	r1, [pc, #0x34]         @ 0x800044c <__stext+0x4c>
 8000416: 4a0e         	ldr	r2, [pc, #0x38]         @ 0x8000450 <__stext+0x50>
 8000418: 4281         	cmp	r1, r0
 800041a: d002         	beq	0x8000422 <__stext+0x22> @ imm = #0x4
 800041c: ca08         	ldm	r2!, {r3}
 800041e: c008         	stm	r0!, {r3}
 8000420: e7fa         	b	0x8000418 <__stext+0x18> @ imm = #-0xc
 8000422: 480c         	ldr	r0, [pc, #0x30]         @ 0x8000454 <__stext+0x54>
 8000424: f44f 0170    	mov.w	r1, #0xf00000
 8000428: 6802         	ldr	r2, [r0]
 800042a: ea42 0201    	orr.w	r2, r2, r1
 800042e: 6002         	str	r2, [r0]
 8000430: f3bf 8f4f    	dsb	sy
 8000434: f3bf 8f6f    	isb	sy
 8000438: f000 f80e    	bl	0x8000458 <main>        @ imm = #0x1c
 800043c: de00         	udf	#0x0
 800043e: 0000         	movs	r0, r0
 8000440: 00 00 00 20  	.word	0x20000000
 8000444: 00 00 00 20  	.word	0x20000000
 8000448: 00 00 00 20  	.word	0x20000000
 800044c: 00 00 00 20  	.word	0x20000000
 8000450: 6c 04 00 08  	.word	0x0800046c
 8000454: 88 ed 00 e0  	.word	0xe000ed88

08000458 <main>:
 8000458: b580         	push	{r7, lr}
 800045a: 466f         	mov	r7, sp
 800045c: e7fe         	b	0x800045c <main+0x4>    @ imm = #-0x4

0800045e <__pre_init>:
 800045e: b580         	push	{r7, lr}
 8000460: 466f         	mov	r7, sp
 8000462: bd80         	pop	{r7, pc}

08000464 <HardFault_>:
 8000464: b580         	push	{r7, lr}
 8000466: 466f         	mov	r7, sp
 8000468: e7fe         	b	0x8000468 <HardFault_+0x4> @ imm = #-0x4
 800046a: d4d4         	bmi	0x8000416 <__stext+0x16> @ imm = #-0x58
