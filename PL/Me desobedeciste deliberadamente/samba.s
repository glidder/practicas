	.section	.rodata
.cad:
	.string:	"El resultado es = %d\n"
	.text
	.global main
main:
	pushl %ebp
	movl %esp, %ebp
	pushl %eax
	movl %eax, %ebx
	popl %eax
addl %ebx, %eax
	pushl %eax
	pushl $.cadena
	call printf
	addl $8, %esp
