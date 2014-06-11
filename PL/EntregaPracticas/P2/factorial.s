	.comm n,4,4
.LC0:
	.string "Introduzca un entero : "
.LC1:
	.string "El factorial es %d\n"
.LC2:
	.string "%d"


	.globl	factorial
	.type	factorial, @function
factorial:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp

	cmpl	$1, 8(%ebp)	
	jle	.base
	movl	8(%ebp), %eax
	subl	$1, %eax
	pushl	%eax
	call	factorial
	imul	8(%ebp), %eax
	jmp		.fin
.base:
	movl	$1, %eax
.fin:
	movl	%ebp, %esp
	popl	%ebp
	ret

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

	movl	$n, %eax
	pushl	%eax
	pushl	$.LC2
	call	__isoc99_scanf

	movl	n, %eax
	pushl	%eax
	call 	factorial
	pushl	%eax

	pushl	$.LC1
	call	printf
	movl	$0, %eax

	movl	%ebp, %esp
	popl	%ebp
	ret
