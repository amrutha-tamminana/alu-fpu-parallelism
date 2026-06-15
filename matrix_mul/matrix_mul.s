	.arch armv8-a
	.file	"matrix_mul.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d"
	.align	3
.LC1:
	.string	"Execution time: %.6f seconds\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB11:
	.cfi_startproc
	stp	x29, x30, [sp, -144]!
	.cfi_def_cfa_offset 144
	.cfi_offset 29, -144
	.cfi_offset 30, -136
	adrp	x0, .LC0
	mov	x29, sp
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -128
	.cfi_offset 20, -120
	add	x19, x0, :lo12:.LC0
	mov	x0, x19
	stp	x21, x22, [sp, 32]
	add	x1, x29, 132
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 21, -112
	.cfi_offset 22, -104
	.cfi_offset 23, -96
	.cfi_offset 24, -88
	.cfi_offset 25, -80
	.cfi_offset 26, -72
	.cfi_offset 27, -64
	.cfi_offset 28, -56
	bl	__isoc99_scanf
	mov	x0, x19
	add	x1, x29, 136
	bl	__isoc99_scanf
	mov	x0, x19
	add	x1, x29, 140
	bl	__isoc99_scanf
	ldp	w21, w23, [x29, 132]
	ldr	w3, [x29, 140]
	str	w3, [x29, 116]
	sbfiz	x0, x23, 2, 32
	smull	x2, w23, w21
	str	x0, [x29, 120]
	sxtw	x0, w3
	smull	x1, w23, w3
	str	x0, [x29, 96]
	smull	x0, w21, w3
	lsl	x2, x2, 2
	add	x2, x2, 15
	sbfiz	x26, x3, 2, 32
	lsl	x1, x1, 2
	and	x2, x2, -16
	add	x1, x1, 15
	lsl	x0, x0, 2
	sub	sp, sp, x2
	and	x1, x1, -16
	add	x0, x0, 15
	mov	x20, sp
	and	x0, x0, -16
	sub	sp, sp, x1
	mov	x19, sp
	sub	sp, sp, x0
	mov	x6, sp
	str	x6, [x29, 104]
	cmp	w21, 0
	ble	.L2
	cmp	w3, 0
	ble	.L3
	ubfiz	x22, x3, 2, 32
	mov	w24, 0
	.p2align 3,,7
.L4:
	mov	x0, x6
	mov	x2, x22
	mov	w1, 0
	add	w24, w24, 1
	bl	memset
	add	x6, x0, x26
	cmp	w21, w24
	bne	.L4
.L3:
	ldr	x0, [x29, 120]
	mov	x25, 0
	mov	w24, 0
	lsr	x27, x0, 2
	adrp	x0, .LC0
	add	x22, x0, :lo12:.LC0
	cmp	w23, 0
	ble	.L32
.L8:
	add	x28, x20, x25, lsl 2
	mov	w21, 0
	.p2align 3,,7
.L6:
	mov	x1, x28
	mov	x0, x22
	bl	__isoc99_scanf
	ldr	w23, [x29, 136]
	add	w21, w21, 1
	add	x28, x28, 4
	cmp	w23, w21
	bgt	.L6
	ldr	w21, [x29, 132]
	add	w24, w24, 1
	cmp	w24, w21
	bge	.L2
	add	x25, x25, x27
	cmp	w23, 0
	bgt	.L8
.L32:
	add	w24, w24, 1
	cmp	w21, w24
	ble	.L10
.L2:
	cmp	w23, 0
	ble	.L10
	ldr	w0, [x29, 140]
	adrp	x1, .LC0
	lsr	x25, x26, 2
	add	x21, x1, :lo12:.LC0
	mov	x24, 0
	mov	w22, 0
	cmp	w0, 0
	ble	.L10
.L13:
	add	x23, x19, x24, lsl 2
	mov	w27, 0
	.p2align 3,,7
.L12:
	mov	x1, x23
	mov	x0, x21
	bl	__isoc99_scanf
	add	w27, w27, 1
	ldr	w0, [x29, 140]
	add	x23, x23, 4
	cmp	w0, w27
	bgt	.L12
	ldr	w1, [x29, 136]
	add	w22, w22, 1
	cmp	w22, w1
	bge	.L10
	add	x24, x24, x25
	cmp	w0, 0
	bgt	.L13
.L10:
	bl	clock
	mov	x21, x0
	ldr	w18, [x29, 132]
	cmp	w18, 0
	ble	.L14
	ldr	x0, [x29, 120]
	lsr	x13, x26, 2
	ldp	w10, w16, [x29, 136]
	lsr	x22, x0, 2
	cmp	w16, 0
	ble	.L14
	ldp	x0, x23, [x29, 96]
	mov	w5, 12
	lsr	w24, w10, 2
	mov	x15, x20
	sub	w17, w10, #1
	lsl	x6, x13, 4
	lsl	x24, x24, 4
	and	w14, w10, -4
	mov	w25, 0
	lsl	x7, x0, 3
	ldr	w0, [x29, 116]
	smull	x5, w0, w5
	.p2align 3,,7
.L16:
	sxtw	x12, w25
	mov	x11, x19
	add	x4, x15, x24
	mov	x8, x23
	mov	w9, 0
	mul	x12, x12, x22
	.p2align 3,,7
.L23:
	cmp	w10, 0
	ble	.L22
	ldr	w2, [x8]
	cmp	w17, 2
	bls	.L24
	movi	v1.4s, 0
	mov	x0, x11
	mov	x1, x15
	.p2align 3,,7
.L18:
	ldr	s5, [x0, x26]
	ldr	s0, [x0]
	ldr	s4, [x0, x7]
	ldr	s3, [x0, x5]
	add	x0, x0, x6
	ins	v0.s[1], v5.s[0]
	ldr	q2, [x1], 16
	ins	v0.s[2], v4.s[0]
	ins	v0.s[3], v3.s[0]
	mla	v1.4s, v0.4s, v2.4s
	cmp	x4, x1
	bne	.L18
	addv	s0, v1.4s
	fmov	w0, s0
	add	w2, w2, w0
	mov	w0, w14
	cmp	w10, w14
	beq	.L19
.L17:
	sxtw	x28, w0
	sxtw	x27, w9
	add	x30, x28, x12
	add	w1, w0, 1
	madd	x28, x28, x13, x27
	ldr	w30, [x20, x30, lsl 2]
	ldr	w28, [x19, x28, lsl 2]
	madd	w2, w30, w28, w2
	cmp	w1, w10
	bge	.L19
	sxtw	x1, w1
	add	w0, w0, 2
	add	x28, x1, x12
	madd	x1, x1, x13, x27
	ldr	w28, [x20, x28, lsl 2]
	ldr	w1, [x19, x1, lsl 2]
	madd	w2, w28, w1, w2
	cmp	w10, w0
	ble	.L19
	sxtw	x0, w0
	add	x1, x0, x12
	madd	x0, x0, x13, x27
	ldr	w1, [x20, x1, lsl 2]
	ldr	w0, [x19, x0, lsl 2]
	madd	w2, w0, w1, w2
.L19:
	str	w2, [x8]
.L22:
	add	w9, w9, 1
	add	x8, x8, 4
	add	x11, x11, 4
	cmp	w9, w16
	bne	.L23
	ldr	x0, [x29, 120]
	add	w25, w25, 1
	add	x23, x23, x26
	add	x15, x15, x0
	cmp	w25, w18
	bne	.L16
.L14:
	bl	clock
	sub	x1, x0, x21
	mov	x0, 145685290680320
	scvtf	d0, x1
	movk	x0, 0x412e, lsl 48
	fmov	d1, x0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	fdiv	d0, d0, d1
	bl	printf
	mov	sp, x29
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
.L24:
	.cfi_restore_state
	mov	w0, 0
	b	.L17
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
