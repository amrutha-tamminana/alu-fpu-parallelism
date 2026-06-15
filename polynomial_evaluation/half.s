	.arch armv8-a
	.file	"bal_alu_fma.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%lf"
	.align	3
.LC1:
	.string	"%lld"
	.align	3
.LC2:
	.string	"%.0f\n"
	.align	3
.LC3:
	.string	"%.8f"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB22:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	adrp	x23, .LC0
	add	x23, x23, :lo12:.LC0
	add	x1, sp, 88
	mov	x0, x23
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	d8, d9, [sp, 64]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 72, -32
	.cfi_offset 73, -24
	bl	__isoc99_scanf
	add	x1, sp, 80
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__isoc99_scanf
	ldr	x21, [sp, 80]
	add	x0, x21, 1
	lsl	x0, x0, 3
	bl	malloc
	mov	x22, x0
	tbnz	x21, #63, .L2
	mov	x20, x0
	mov	x19, 0
	.p2align 3,,7
.L3:
	mov	x1, x20
	mov	x0, x23
	bl	__isoc99_scanf
	add	x19, x19, 1
	ldr	x21, [sp, 80]
	add	x20, x20, 8
	cmp	x21, x19
	bge	.L3
.L2:
	bl	clock
	add	x19, x21, x21, lsr 63
	ldr	x1, [sp, 80]
	asr	x19, x19, 1
	ldr	d0, [sp, 88]
	movi	d8, #0
	mov	x23, x0
	cmp	x19, x1
	bge	.L6
	add	x1, x22, x1, lsl 3
	add	x0, x22, x19, lsl 3
	.p2align 3,,7
.L5:
	ldr	d1, [x1], -8
	fmadd	d8, d0, d8, d1
	cmp	x0, x1
	bne	.L5
.L6:
	add	x0, x19, 1
	scvtf	d1, x0
	bl	pow
	fmov	d9, d0
	bl	clock
	mov	x20, x0
	bl	clock
	mov	x24, x0
	cmn	x21, #1
	blt	.L9
	ldr	d3, [sp, 88]
	fmov	d1, xzr
	.p2align 3,,7
.L8:
	scvtf	d1, d1
	ldr	d2, [x22, x19, lsl 3]
	sub	x19, x19, #1
	fmadd	d1, d1, d3, d2
	fcvtzs	d1, d1
	cmn	x19, #1
	bne	.L8
.L7:
	scvtf	d1, d1
	sub	x20, x20, x23
	fmadd	d8, d9, d8, d1
	bl	clock
	fmov	d0, d8
	adrp	x1, .LC2
	mov	x19, x0
	sub	x19, x19, x24
	add	x0, x1, :lo12:.LC2
	bl	printf
	scvtf	d1, x19
	scvtf	d0, x20
	mov	x0, 145685290680320
	movk	x0, 0x412e, lsl 48
	fmov	d2, x0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	fdiv	d1, d1, d2
	fdiv	d0, d0, d2
	fadd	d0, d0, d1
	bl	printf
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	d8, d9, [sp, 64]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
.L9:
	.cfi_restore_state
	fmov	d1, xzr
	b	.L7
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
