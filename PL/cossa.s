	.text
	.global main
	.section	.rodata
.LC2:
	.string	"El resultado = %d\n"
	.text

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl $2, %eax
	addl $3, %eax
	movl %eax, %ebx
	pushl %ebx
	push $.LC2
	
	call	printf
	leave
	ret
