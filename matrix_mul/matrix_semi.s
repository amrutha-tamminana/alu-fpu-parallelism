	.arch armv8-a
	.file	"matrix_semi.c"
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
	ldr	w26, [x29, 140]
	ldp	w27, w0, [x29, 132]
	sxtw	x1, w26
	str	x1, [x29, 96]
	sbfiz	x19, x26, 2, 32
	smull	x4, w0, w27
	sbfiz	x22, x0, 2, 32
	smull	x3, w0, w26
	smull	x2, w27, w26
	lsl	x4, x4, 2
	add	x4, x4, 15
	lsl	x3, x3, 2
	and	x4, x4, -16
	add	x3, x3, 15
	lsl	x2, x2, 2
	sub	sp, sp, x4
	and	x3, x3, -16
	add	x2, x2, 15
	mov	x21, sp
	and	x2, x2, -16
	sub	sp, sp, x3
	mov	x20, sp
	sub	sp, sp, x2
	mov	x1, sp
	str	x1, [x29, 104]
	cmp	w27, 0
	ble	.L2
	cmp	w26, 0
	ble	.L3
	mov	x3, x1
	ubfiz	x24, x26, 2, 32
	mov	w23, w0
	mov	w25, 0
	.p2align 3,,7
.L4:
	mov	x0, x3
	mov	x2, x24
	mov	w1, 0
	add	w25, w25, 1
	bl	memset
	add	x3, x0, x19
	cmp	w27, w25
	bne	.L4
	mov	w0, w23
.L3:
	str	x19, [x29, 120]
	adrp	x1, .LC0
	lsr	x28, x22, 2
	add	x24, x1, :lo12:.LC0
	mov	x25, 0
	mov	w23, 0
	cmp	w0, 0
	ble	.L52
.L8:
	add	x19, x21, x25, lsl 2
	mov	w27, 0
	.p2align 3,,7
.L6:
	mov	x1, x19
	mov	x0, x24
	bl	__isoc99_scanf
	add	w27, w27, 1
	ldr	w0, [x29, 136]
	add	x19, x19, 4
	cmp	w0, w27
	bgt	.L6
	ldr	w27, [x29, 132]
	add	w23, w23, 1
	cmp	w23, w27
	bge	.L46
	add	x25, x25, x28
	cmp	w0, 0
	bgt	.L8
.L52:
	add	w2, w23, 1
	ldr	x19, [x29, 120]
	cmp	w27, w2
	ble	.L10
.L2:
	cmp	w0, 0
	ble	.L10
	ldr	w0, [x29, 140]
	adrp	x1, .LC0
	str	x19, [x29, 120]
	add	x23, x1, :lo12:.LC0
	lsr	x28, x19, 2
	mov	x25, 0
	mov	w24, 0
	cmp	w0, 0
	ble	.L47
.L13:
	add	x19, x20, x25, lsl 2
	mov	w27, 0
	.p2align 3,,7
.L12:
	mov	x1, x19
	mov	x0, x23
	bl	__isoc99_scanf
	add	w27, w27, 1
	ldr	w0, [x29, 140]
	add	x19, x19, 4
	cmp	w0, w27
	bgt	.L12
	ldr	w1, [x29, 136]
	add	w24, w24, 1
	cmp	w24, w1
	bge	.L47
	add	x25, x25, x28
	cmp	w0, 0
	bgt	.L13
.L47:
	ldr	x19, [x29, 120]
.L10:
	bl	clock
	ldr	w1, [x29, 132]
	mov	x28, x0
	cmp	w1, 0
	add	w12, w1, 3
	csel	w12, w12, w1, lt
	asr	w12, w12, 2
	cmp	w1, 3
	ble	.L14
	ldp	w10, w18, [x29, 136]
	lsr	x14, x19, 2
	lsr	x25, x22, 2
	cmp	w18, 0
	ble	.L14
	ldp	x0, x23, [x29, 96]
	mov	w4, 12
	lsr	w24, w10, 2
	mov	x17, x21
	smull	x4, w26, w4
	sub	w30, w10, #1
	lsl	x24, x24, 4
	lsl	x6, x14, 4
	and	w15, w10, -4
	mov	w16, 0
	lsl	x5, x0, 3
	stp	x25, x22, [x29, 112]
	.p2align 3,,7
.L16:
	sxtw	x27, w16
	ldr	x0, [x29, 112]
	mov	x13, x20
	add	x7, x17, x24
	mov	x8, x23
	mov	w9, 0
	mul	x27, x27, x0
	.p2align 3,,7
.L23:
	cmp	w10, 0
	ble	.L22
	ldr	w2, [x8]
	cmp	w30, 2
	bls	.L34
	movi	v1.4s, 0
	mov	x0, x13
	mov	x3, x17
	.p2align 3,,7
.L18:
	ldr	s5, [x0, x19]
	ldr	s0, [x0]
	ldr	s4, [x0, x5]
	ldr	s3, [x0, x4]
	add	x0, x0, x6
	ins	v0.s[1], v5.s[0]
	ldr	q2, [x3], 16
	ins	v0.s[2], v4.s[0]
	ins	v0.s[3], v3.s[0]
	mla	v1.4s, v0.4s, v2.4s
	cmp	x7, x3
	bne	.L18
	addv	s0, v1.4s
	fmov	w0, s0
	add	w2, w2, w0
	mov	w0, w15
	cmp	w10, w15
	beq	.L19
.L17:
	sxtw	x11, w0
	sxtw	x22, w9
	add	x25, x11, x27
	add	w3, w0, 1
	madd	x11, x11, x14, x22
	ldr	w25, [x21, x25, lsl 2]
	ldr	w11, [x20, x11, lsl 2]
	madd	w2, w11, w25, w2
	cmp	w10, w3
	ble	.L19
	sxtw	x3, w3
	add	w0, w0, 2
	add	x11, x3, x27
	madd	x3, x3, x14, x22
	ldr	w11, [x21, x11, lsl 2]
	ldr	w3, [x20, x3, lsl 2]
	madd	w2, w11, w3, w2
	cmp	w10, w0
	ble	.L19
	sxtw	x0, w0
	add	x3, x0, x27
	madd	x0, x0, x14, x22
	ldr	w3, [x21, x3, lsl 2]
	ldr	w0, [x20, x0, lsl 2]
	madd	w2, w3, w0, w2
.L19:
	str	w2, [x8]
.L22:
	add	w9, w9, 1
	add	x8, x8, 4
	add	x13, x13, 4
	cmp	w9, w18
	bne	.L23
	ldr	x0, [x29, 120]
	add	w16, w16, 1
	add	x23, x23, x19
	add	x17, x17, x0
	cmp	w16, w12
	blt	.L16
	mov	x22, x0
.L14:
	cmp	w12, w1
	bge	.L24
	ldp	w15, w23, [x29, 136]
	lsr	x16, x19, 2
	lsr	x13, x22, 2
	cmp	w23, 0
	ble	.L24
	ldr	x0, [x29, 96]
	sbfiz	x18, x12, 2, 32
	lsr	w17, w15, 2
	mov	w5, 12
	sub	w24, w15, #1
	lsl	x6, x16, 4
	lsl	x7, x0, 3
	smull	x5, w26, w5
	ldr	x0, [x29, 104]
	lsl	x17, x17, 4
	and	w25, w15, -4
	and	w26, w15, 3
	mov	x10, x28
	str	x22, [x29, 120]
	madd	x27, x16, x18, x0
	madd	x18, x13, x18, x21
	.p2align 3,,7
.L26:
	sxtw	x28, w12
	mov	x11, x20
	add	x4, x18, x17
	mov	x8, x27
	mov	w9, 0
	mul	x28, x28, x13
	.p2align 3,,7
.L33:
	cmp	w15, 0
	ble	.L32
	ldr	w2, [x8]
	cmp	w24, 2
	bls	.L35
	movi	v2.4s, 0
	mov	x0, x11
	mov	x3, x18
	.p2align 3,,7
.L28:
	ldr	s5, [x0, x19]
	ldr	s0, [x0]
	ldr	s4, [x0, x7]
	ldr	s3, [x0, x5]
	add	x0, x0, x6
	ins	v0.s[1], v5.s[0]
	ldr	q1, [x3], 16
	ins	v0.s[2], v4.s[0]
	scvtf	v1.4s, v1.4s
	ins	v0.s[3], v3.s[0]
	scvtf	v0.4s, v0.4s
	fmul	v0.4s, v0.4s, v1.4s
	fcvtzs	v0.4s, v0.4s
	add	v2.4s, v2.4s, v0.4s
	cmp	x4, x3
	bne	.L28
	addv	s0, v2.4s
	fmov	w0, s0
	add	w2, w2, w0
	mov	w0, w25
	cbz	w26, .L29
.L27:
	sxtw	x14, w0
	sxtw	x22, w9
	add	x30, x14, x28
	add	w3, w0, 1
	madd	x14, x14, x16, x22
	ldr	s1, [x21, x30, lsl 2]
	ldr	s0, [x20, x14, lsl 2]
	scvtf	s1, s1
	scvtf	s0, s0
	fmul	s0, s0, s1
	fcvtzs	w14, s0
	add	w2, w2, w14
	cmp	w15, w3
	ble	.L29
	sxtw	x3, w3
	add	w0, w0, 2
	add	x14, x3, x28
	madd	x3, x3, x16, x22
	ldr	s0, [x21, x14, lsl 2]
	ldr	s1, [x20, x3, lsl 2]
	scvtf	s0, s0
	scvtf	s1, s1
	fmul	s0, s0, s1
	fcvtzs	w3, s0
	add	w2, w2, w3
	cmp	w15, w0
	ble	.L29
	sxtw	x0, w0
	add	x3, x0, x28
	madd	x0, x0, x16, x22
	ldr	s0, [x21, x3, lsl 2]
	ldr	s1, [x20, x0, lsl 2]
	scvtf	s0, s0
	scvtf	s1, s1
	fmul	s0, s0, s1
	fcvtzs	w0, s0
	add	w2, w2, w0
.L29:
	str	w2, [x8]
.L32:
	add	w9, w9, 1
	add	x8, x8, 4
	add	x11, x11, 4
	cmp	w9, w23
	bne	.L33
	ldr	x0, [x29, 120]
	add	w12, w12, 1
	add	x27, x27, x19
	add	x18, x18, x0
	cmp	w12, w1
	bne	.L26
	mov	x28, x10
.L24:
	bl	clock
	sub	x1, x0, x28
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
.L35:
	.cfi_restore_state
	mov	w0, 0
	b	.L27
.L34:
	mov	w0, 0
	b	.L17
.L46:
	ldr	x19, [x29, 120]
	b	.L2
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
