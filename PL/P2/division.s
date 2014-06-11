	.file	"suma.c"
	.comm	a,4,4
	.comm	b,4,4
	.comm	c,8,8
	.section	.rodata
.LC0:
	.string	"%d / %d = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	$5, a
	movl	$7, b
	movl	a, %eax
	movl	b, %ebx
	cdq
	idivl	%ebx, %eax
	movl	%eax, c
	movl	c, %ecx
	movl	b, %edx
	movl	a, %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
