	.file	"division.c"
	.text
	.globl	dividir
	.type	dividir, @function
dividir:
	pushl 	%ebp
	movl	%esp, %ebp
	subl	$4, %esp

	movl	8(%ebp), %eax
	cdq
	idivl	12(%ebp)
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax

	movl	%ebp, %esp
	popl	%ebp
	ret
	.size	dividir, .-dividir


	.section	.rodata
.LCO:
	.string "dame dos enteros:"
.LC1:
	.string	"%d%d"
.LC2:
	.string "%d/%d = %d\n"

	.text
	.globl main
	.type main, @function
main:
	pushl 	%ebp
	movl 	%esp, %ebp
	pushl	%ebx
	subl	$8, %esp

	movl	$.LCO, %eax
	pushl	%eax
	call	printf
	popl	%ebx

	leal	-4(%ebp), %eax
	pushl	%eax
	leal	-8(%ebp), %eax
	pushl	%eax
	movl 	$.LC1, %eax
	pushl	%eax
	call	__isoc99_scanf
	popl	%ebx
	popl	%ebx
	popl	%ebx
	movl	-8(%ebp), %eax
	pushl	%eax
	movl	-4(%ebp), %eax
	pushl	%eax
	call	dividir
	popl 	%ebx
	popl	%ebx

	pushl	%eax
	pushl 	-8(%ebp)
	pushl	-4(%ebp)
	movl	$.LC2, %eax
	pushl	%eax
	call 	printf
	popl	%ebx
	popl	%ebx
	popl	%ebx
	popl	%ebx

	movl 	$0, %eax

	movl	%ebp, %esp
	popl 	%ebp
	ret
	.size	main, .-main
	.ident "GCC: (Ubuntu/Linario 4.6.3-1ubuntu5) 4.6.3"
	
