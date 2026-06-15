	.arch armv8-a
	.file	"poly_int.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%lld"
	.align	3
.LC1:
	.string	"Memory allocation failed"
	.align	3
.LC2:
	.string	"%lld\n"
	.align	3
.LC3:
	.string	"%.8f\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB22:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	adrp	x21, .LC0
	add	x21, x21, :lo12:.LC0
	add	x1, sp, 72
	mov	x0, x21
	str	x23, [sp, 48]
	.cfi_offset 23, -32
	bl	__isoc99_scanf
	mov	x0, x21
	add	x1, sp, 64
	bl	__isoc99_scanf
	ldr	x23, [sp, 64]
	add	x0, x23, 1
	lsl	x0, x0, 3
	bl	malloc
	cbz	x0, .L2
	stp	x19, x20, [sp, 16]
	.cfi_offset 20, -56
	.cfi_offset 19, -64
	mov	x22, x0
	mov	x20, x0
	mov	x19, 0
	tbnz	x23, #63, .L4
	.p2align 3,,7
.L6:
	mov	x1, x20
	mov	x0, x21
	bl	__isoc99_scanf
	add	x19, x19, 1
	ldr	x1, [sp, 64]
	add	x20, x20, 8
	cmp	x1, x19
	bge	.L6
.L4:
	bl	clock
	mov	x21, x0
	ldr	x3, [sp, 64]
	ldr	x19, [x22]
	cmp	x3, 0
	ble	.L7
	ldr	x4, [sp, 72]
	add	x3, x22, x3, lsl 3
	mov	x2, x22
	.p2align 3,,7
.L8:
	ldr	x1, [x2, 8]!
	madd	x19, x4, x19, x1
	cmp	x3, x2
	bne	.L8
.L7:
	bl	clock
	mov	x20, x0
	sub	x20, x20, x21
	mov	x1, x19
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	scvtf	d0, x20
	mov	x0, 145685290680320
	movk	x0, 0x412e, lsl 48
	fmov	d1, x0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	fdiv	d0, d0, d1
	bl	printf
	mov	x0, x22
	bl	free
	ldp	x19, x20, [sp, 16]
	.cfi_restore 20
	.cfi_restore 19
	mov	w0, 0
.L1:
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_def_cfa_offset 0
	ret
.L2:
	.cfi_restore_state
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
	mov	w0, 1
	b	.L1
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
