.LC0:
	.string	"Dame un entero : "
.LC1:
	.string	"%d"
.LC2:
	.string	"El factorial = %d\n"

	.globl	fact
	.type	fact, @function
fact:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	cmpl	$1, 8(%ebp)
	jg	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	8(%ebp), %eax
	subl	$1, %eax
	movl	%eax, (%esp)
	call	fact
	imull	8(%ebp), %eax
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	fact, .-fact
	.comm	numero,4,4
	.section	.rodata
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp
	movl	$.LC0, (%esp)
	call	printf
	movl	$numero, 4(%esp)
	movl	$.LC1, (%esp)
	call	scanf
	movl	numero, %eax
	movl	%eax, (%esp)
	call	fact
	movl	%eax, 4(%esp)
	movl	$.LC2, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
