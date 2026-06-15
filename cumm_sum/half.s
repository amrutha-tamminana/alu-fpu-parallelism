w	.arch armv8-a
	.file	"half.c"
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
0.530662259	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB12:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	add	x1, x29, 76
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	adrp	x22, .LC1
	add	x22, x22, :lo12:.LC1
	mov	x0, x22
	stp	d8, d9, [sp, 48]
	.cfi_offset 72, -48
	.cfi_offset 73, -40
	bl	__isoc99_scanf
	ldr	w1, [x29, 76]
	sbfiz	x0, x1, 2, 32
	add	x0, x0, 15
	and	x0, x0, -16
	sub	sp, sp, x0
	mov	x20, sp
	cmp	w1, 0
	ble	.L5
	mov	x21, x20
	mov	w19, 0
.L6:
	mov	x1, x21
	mov	x0, x22
	bl	__isoc99_scanf
	add	w19, w19, 1
	ldr	w0, [x29, 76]
	add	x21, x21, 4
	cmp	w0, w19
	bgt	.L6
.L5:
	add	x21, x29, 80
	mov	w0, 4
	mov	x1, x21
	bl	clock_gettime
	ldp	d9, d0, [x29, 80]
	adrp	x0, .LC0
	mov	w5, 34464
	ldr	d1, [x0, #:lo12:.LC0]
	movk	w5, 0x1, lsl 16
	scvtf	d9, d9
	scvtf	d0, d0
	ldr	w0, [x29, 76]
	sub	w4, w0, #2
	fmadd	d9, d0, d1, d9
	lsr	w4, w4, 1
	add	w4, w4, 1
	add	x4, x20, w4, uxtw 3
	.p2align 3,,7
.L7:
	cmp	w0, 1
	ble	.L19
	.p2align 3,,7
.L9:
	movi	d8, #0
	mov	x0, x20
	mov	x19, 0
	.p2align 3,,7
.L8:
	ldrsw	x3, [x0, 4]
	ldr	w2, [x0], 8
	add	x19, x19, x3
	scvtf	d1, w2
	fadd	d8, d8, d1
	cmp	x4, x0
	bne	.L8
	subs	w5, w5, #1
	bne	.L9
.L10:
	mov	x1, x21
	mov	w0, 4
	bl	clock_gettime
	fcvtzs	x1, d8
	ldp	d0, d1, [x29, 80]
	adrp	x0, .LC0
	ldr	d2, [x0, #:lo12:.LC0]
	adrp	x0, .LC2
	scvtf	d8, d0
	scvtf	d0, d1
	add	x1, x1, x19
	add	x0, x0, :lo12:.LC2
	fmadd	d8, d0, d2, d8
	bl	printf
	mov	x1, 34464
	adrp	x0, .LC3
	movk	x1, 0x1, lsl 16
	add	x0, x0, :lo12:.LC3
	bl	printf
	fsub	d0, d8, d9
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	mov	sp, x29
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	d8, d9, [sp, 48]
	ldp	x29, x30, [sp], 96
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
.L19:
	.cfi_restore_state
	subs	w5, w5, #1
	bne	.L7
	movi	d8, #0
	mov	x19, 0
	b	.L10
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
