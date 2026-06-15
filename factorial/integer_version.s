	.arch armv8-a
	.file	"factint.c"
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
	.string	"Dummy=%lld\n"
	.align	3
.LC3:
	.string	"%lld\n"
	.align	3
.LC4:
	.string	"%.9lf\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB12:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	mov	x29, sp
	add	x1, sp, 60
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	add	x20, sp, 64
	stp	d8, d9, [sp, 32]
	.cfi_offset 72, -48
	.cfi_offset 73, -40
	bl	__isoc99_scanf
	mov	x1, x20
	mov	w0, 4
	bl	clock_gettime
	ldp	d8, d0, [sp, 64]
	adrp	x0, .LC0
	ldr	w1, [sp, 60]
	mov	w2, 38528
	ldr	d1, [x0, #:lo12:.LC0]
	movk	w2, 0x98, lsl 16
	scvtf	d8, d8
	scvtf	d0, d0
	fmadd	d8, d0, d1, d8
	.p2align 3,,7
.L5:
	cmp	w1, 0
	ble	.L16
	mov	x19, 1
	.p2align 3,,7
.L7:
	mov	x0, 1
	.p2align 3,,7
.L6:
	mul	x19, x19, x0
	add	x0, x0, 1
	cmp	w1, w0
	bge	.L6
	subs	w2, w2, #1
	bne	.L7
.L8:
	mov	x1, x20
	mov	w0, 4
	bl	clock_gettime
	ldp	d0, d1, [sp, 64]
	adrp	x0, .LC0
	mov	x1, 38528
	ldr	d2, [x0, #:lo12:.LC0]
	movk	x1, 0x98, lsl 16
	scvtf	d1, d1
	scvtf	d0, d0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	fmadd	d9, d1, d2, d0
	bl	printf
	mov	x1, x19
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	printf
	fsub	d0, d9, d8
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	d8, d9, [sp, 32]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
.L16:
	.cfi_restore_state
	subs	w2, w2, #1
	bne	.L5
	mov	x19, 1
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
