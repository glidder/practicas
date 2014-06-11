	.file	"suma.c"
.LC0:
	.string	"%d * 3 = %d\n"
	.type	f, @function
f:
.LFB0:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax
	imul $3, %eax
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
	movl	$5, %ebx
	push 	%ebx
	call f
	push 	%eax
	push	%ebx
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
