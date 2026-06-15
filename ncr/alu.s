	.arch armv8-a
	.file	"alu.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"maximum value of n can be 67 when r = n/2, othrwise the overflow occurs"
	.align	3
.LC1:
	.string	"Enter n: "
	.align	3
.LC2:
	.string	"%lld"
	.align	3
.LC3:
	.string	"Enter r: "
	.align	3
.LC4:
	.string	"nCr = 0"
	.align	3
.LC5:
	.string	"nCr = 1"
	.align	3
.LC6:
	.string	"nCr = %lld\n"
	.align	3
.LC7:
	.string	"Time taken = %.9f seconds\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB11:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	bl	puts
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	add	x1, sp, 48
	adrp	x20, .LC2
	add	x19, x20, :lo12:.LC2
	mov	x0, x19
	bl	__isoc99_scanf
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	printf
	add	x1, sp, 56
	mov	x0, x19
	bl	__isoc99_scanf
	ldp	x0, x1, [sp, 48]
	cmp	x1, x0
	bgt	.L16
	cmp	x1, 0
	ccmp	x1, x0, 4, ne
	beq	.L17
	sub	x0, x0, x1
	str	d8, [sp, 32]
	.cfi_offset 72, -64
	cmp	x1, x0
	bgt	.L18
.L5:
	add	x1, sp, 64
	mov	w0, 4
	bl	clock_gettime
	ldp	x3, x2, [sp, 48]
	mov	x4, 38528
	movk	x4, 0x98, lsl 16
	sub	x3, x3, x2
	.p2align 3,,7
.L10:
	cmp	x2, 0
	ble	.L6
	add	x2, x2, 1
	.p2align 3,,7
.L8:
	mov	x19, 1
	mov	x0, x19
	.p2align 3,,7
.L7:
	add	x1, x3, x0
	mul	x19, x1, x19
	sdiv	x19, x19, x0
	add	x0, x0, 1
	cmp	x0, x2
	bne	.L7
	subs	x4, x4, #1
	bne	.L8
.L9:
	add	x1, sp, 80
	mov	w0, 4
	bl	clock_gettime
	ldp	x4, x3, [sp, 64]
	mov	x0, 225833675390976
	ldr	x2, [sp, 88]
	movk	x0, 0x41cd, lsl 48
	fmov	d1, x0
	mov	x1, x19
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	sub	x2, x2, x3
	ldr	x3, [sp, 80]
	scvtf	d0, x2
	sub	x3, x3, x4
	fdiv	d0, d0, d1
	scvtf	d1, x3
	fadd	d8, d0, d1
	bl	printf
	fmov	d0, d8
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	printf
	mov	x1, 38528
	add	x0, x20, :lo12:.LC2
	movk	x1, 0x98, lsl 16
	bl	printf
	ldr	d8, [sp, 32]
	.cfi_restore 72
.L3:
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L6:
	.cfi_def_cfa_offset 96
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	.cfi_offset 72, -64
	subs	x4, x4, #1
	bne	.L10
	mov	x19, 1
	b	.L9
.L18:
	str	x0, [sp, 56]
	b	.L5
.L17:
	.cfi_restore 72
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	b	.L3
.L16:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	b	.L3
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
