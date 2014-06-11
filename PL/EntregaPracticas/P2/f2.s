	.file	"suma.c"
	.comm	b,4,4
.LC0:
	.string	"%d + %d * 3 = %d\n"
	.type	f, @function
f:
.LFB0:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %ebx
	movl 12(%ebp), %eax
	imul $3, %eax
	addl	%ebx, %eax
	movl	%ebp, %esp
	popl	%ebp
	ret

	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	
	movl	$5, 24(%ebp)
	movl	$9, b
	
	push 	24(%ebp)
	push	b
	call f
	
	push	%eax
	push	b
	push	24(%ebp)
	push	$.LC0
	call 	printf
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
