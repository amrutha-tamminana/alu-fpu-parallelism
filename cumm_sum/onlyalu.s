	.arch armv8-a
	.file	"onlyalu.c"
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
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	adrp	x23, .LC1
	add	x23, x23, :lo12:.LC1
	mov	x0, x23
	stp	d8, d9, [sp, 64]
	.cfi_offset 72, -48
	.cfi_offset 73, -40
	bl	__isoc99_scanf
	ldr	w1, [x29, 92]
	sbfiz	x0, x1, 2, 32
	add	x0, x0, 15
	and	x0, x0, -16
	sub	sp, sp, x0
	mov	x19, sp
	sub	sp, sp, x0
	mov	x22, sp
	cmp	w1, 0
	ble	.L5
	mov	x21, x19
	mov	x20, 0
.L6:
	mov	x1, x21
	mov	x0, x23
	bl	__isoc99_scanf
	ldr	w1, [x21], 4
	ldr	w0, [x29, 92]
	str	w1, [x22, x20, lsl 2]
	add	x20, x20, 1
	cmp	w0, w20
	bgt	.L6
.L5:
	add	x24, x29, 96
	mov	w0, 4
	mov	x1, x24
	bl	clock_gettime
	ldp	d8, d0, [x29, 96]
	adrp	x0, .LC0
	ldr	w20, [x29, 92]
	mov	w21, 34464
	ldr	d1, [x0, #:lo12:.LC0]
	movk	w21, 0x1, lsl 16
	scvtf	d8, d8
	scvtf	d0, d0
	sub	w23, w20, #1
	add	x23, x23, 1
	fmadd	d8, d0, d1, d8
	lsl	x23, x23, 2
	.p2align 3,,7
.L7:
	cmp	w20, 0
	ble	.L12
	.p2align 3,,7
.L11:
	mov	x2, x23
	mov	x1, x22
	mov	x0, x19
	bl	memcpy
	cmp	w20, 1
	beq	.L12
	ldr	w1, [x19]
	mov	x0, 1
	.p2align 3,,7
.L10:
	ldr	w2, [x19, x0, lsl 2]
	add	w1, w1, w2
	str	w1, [x19, x0, lsl 2]
	add	x0, x0, 1
	cmp	w20, w0
	bgt	.L10
	subs	w21, w21, #1
	bne	.L11
.L9:
	mov	x1, x24
	mov	w0, 4
	bl	clock_gettime
	ldp	d0, d1, [x29, 96]
	adrp	x0, .LC0
	ldr	w1, [x29, 92]
	ldr	d2, [x0, #:lo12:.LC0]
	adrp	x0, .LC2
	scvtf	d1, d1
	scvtf	d0, d0
	sub	w1, w1, #1
	add	x0, x0, :lo12:.LC2
	fmadd	d9, d1, d2, d0
	ldr	w1, [x19, w1, sxtw 2]
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
	ldp	x23, x24, [sp, 48]
	ldp	d8, d9, [sp, 64]
	ldp	x29, x30, [sp], 112
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
	.cfi_def_cfa 31, 0
	ret
.L12:
	.cfi_restore_state
	subs	w21, w21, #1
	bne	.L7
	b	.L9
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
