
.LC1:
	.string "%d"
.LC0:
	.string "Dame un entero : "
.LC2:
	.string "El factorial = %d\n"


	.globl	fact
	.type	fact, @function
fact:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$0, %esp
	movl	8(%ebp), %eax

	movl	%eax, %ebx
	movl	$1, %eax
	cmpl	%eax, %ebx
	jle	.L0
	jmp	.L1
.L0:
	movl	$1, %eax
	jmp	.L2
.L1:
	movl	$0, %eax
.L2:

	cmpl	$0, %eax
	jne	.L3
	movl	8(%ebp), %eax
	pushl	%eax
	movl	8(%ebp), %eax
	pushl	%eax
	movl	$1, %eax
	movl	%eax, %ebx
	popl	%eax
	subl	%ebx, %eax

	pushl	%eax

	call fact
	addl	$4, %esp
	movl	%eax, %ebx
	popl	%eax
	imull	%ebx, %eax

	movl	%ebp, %esp
	popl	%ebp
	ret

	jmp	.L4
.L3:
	movl	$1, %eax

	movl	%ebp, %esp
	popl	%ebp
	ret
.L4:

	movl	%ebp, %esp
	popl	%ebp
	ret


	.comm numero,4,4
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp

	pushl	$.LC0
	call	printf

	movl	$numero, %eax
	pushl	%eax
	pushl	$.LC1
	call	__isoc99_scanf

	movl	numero, %eax

	pushl	%eax

	call fact
	addl	$4, %esp
	pushl	%eax
	pushl	$.LC2
	call	printf
	movl	$0, %eax

	movl	%ebp, %esp
	popl	%ebp
	ret
