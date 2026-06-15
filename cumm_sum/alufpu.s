	.arch armv8-a
	.file	"alufpu.c"
	.text
	.align	2
	.p2align 4,,11
	.global	now
	.type	now, %function
now:
.LFB11:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	w0, 4
	mov	x29, sp
	add	x1, sp, 16
	bl	clock_gettime
	ldp	d1, d0, [sp, 16]
	adrp	x0, .LC0
	ldr	d2, [x0, #:lo12:.LC0]
	scvtf	d1, d1
	scvtf	d0, d0
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	fmadd	d0, d0, d2, d1
	ret
	.cfi_endproc
.LFE11:
	.size	now, .-now
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"%d"
	.align	3
.LC2:
	.string	"sum=%lld\n"
	.align	3
.LC3:
	.string	"Dummy=%lld\n"
	.align	3
.LC4:
	.string	"Time=%.9lf\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB12:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	add	x1, x29, 92
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	adrp	x22, .LC1
	add	x22, x22, :lo12:.LC1
	mov	x0, x22
	stp	d8, d9, [sp, 48]
	.cfi_offset 72, -64
	.cfi_offset 73, -56
	bl	__isoc99_scanf
	ldr	w1, [x29, 92]
	sbfiz	x0, x1, 2, 32
	add	x0, x0, 15
	and	x0, x0, -16
	sub	sp, sp, x0
	mov	x19, sp
	cmp	w1, 0
	ble	.L5
	mov	x21, x19
	mov	w20, 0
.L6:
	mov	x1, x21
	mov	x0, x22
	bl	__isoc99_scanf
	add	w20, w20, 1
	ldr	w0, [x29, 92]
	add	x21, x21, 4
	cmp	w0, w20
	bgt	.L6
.L5:
	add	x20, x29, 96
	mov	w0, 4
	mov	x1, x20
	bl	clock_gettime
	ldp	d8, d0, [x29, 96]
	adrp	x1, .LC0
	ldr	w6, [x29, 92]
	mov	x0, 4
	ldr	d1, [x1, #:lo12:.LC0]
	mov	w3, 34464
	scvtf	d8, d8
	scvtf	d0, d0
	sub	w8, w6, #1
	sub	w10, w6, #2
	and	w11, w8, -4
	movk	w3, 0x1, lsl 16
	lsr	w2, w8, 2
	add	w11, w11, 1
	fmadd	d8, d0, d1, d8
	add	x2, x0, w2, uxtw 4
	add	x2, x19, x2
	.p2align 3,,7
.L7:
	cmp	w6, 1
	ble	.L23
	and	w8, w8, 3
	add	x9, x19, 4
	.p2align 3,,7
.L13:
	cmp	w10, 2
	bls	.L15
.L10:
	movi	v1.4s, 0
	mov	x0, x9
	.p2align 3,,7
.L9:
	ldr	q2, [x0], 16
	saddw	v1.2d, v1.2d, v2.2s
	saddw2	v1.2d, v1.2d, v2.4s
	cmp	x0, x2
	bne	.L9
	addp	d1, v1.2d
	cbz	w8, .L25
	mov	w0, w11
.L8:
	ldrsw	x7, [x19, w0, sxtw 2]
	add	w4, w0, 1
	fmov	d0, x7
	add	x5, x19, w0, sxtw 2
	add	d1, d1, d0
	cmp	w4, w6
	bge	.L12
	ldrsw	x4, [x5, 4]
	add	w0, w0, 2
	fmov	d0, x4
	add	d1, d1, d0
	cmp	w6, w0
	ble	.L12
	ldrsw	x0, [x5, 8]
	fmov	d0, x0
	add	d1, d1, d0
.L12:
	subs	w3, w3, #1
	bne	.L13
.L11:
	mov	x1, x20
	mov	w0, 4
	str	d1, [x29, 72]
	bl	clock_gettime
	ldr	d1, [x29, 72]
	adrp	x0, .LC0
	ldp	d0, d2, [x29, 96]
	fmov	x1, d1
	ldr	d3, [x0, #:lo12:.LC0]
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	scvtf	d1, d2
	scvtf	d0, d0
	fmadd	d9, d1, d3, d0
	bl	printf
	mov	x1, 34464
	adrp	x0, .LC3
	movk	x1, 0x1, lsl 16
	add	x0, x0, :lo12:.LC3
	bl	printf
	fsub	d0, d9, d8
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	mov	sp, x29
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	d8, d9, [sp, 48]
	ldp	x29, x30, [sp], 112
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa 31, 0
	ret
	.p2align 2,,3
.L25:
	.cfi_restore_state
	subs	w3, w3, #1
	bne	.L10
	b	.L11
	.p2align 2,,3
.L23:
	subs	w3, w3, #1
	bne	.L7
	fmov	d1, xzr
	b	.L11
	.p2align 2,,3
.L15:
	mov	w0, 1
	fmov	d1, xzr
	b	.L8
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	-400107883
	.word	1041313291
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
