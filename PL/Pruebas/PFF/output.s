
.LC3:
	.string "%d %d %d\n"
.LC12:
	.string "%d es menor o igual que %d\n"
.LC5:
	.string "%d"
.LC11:
	.string "(%d + %d )* 2 = %d\n"
.LC16:
	.string "Comparacion con and correcta.\n"
.LC15:
	.string "Comparacion con and incorrecta.\n"
.LC14:
	.string "Comparacion con or correcta.\n"
.LC9:
	.string "Dame otro entero : "
.LC4:
	.string "Dame un entero : "
.LC7:
	.string "El factorial = %d\n"
.LC2:
	.string "Este es l: %d\n"
.LC1:
	.string "Este es m: %d\n"
.LC0:
	.string "Este es n: %d\n"
.LC13:
	.string "Otro printf porque si.\n"
.LC8:
	.string "\n------------------Factorial iterativo-----------------\n"
.LC6:
	.string "\n------------------Factorial recursivo-----------------\n"
.LC10:
	.string "\n----Aritmeticos, asignacion, relacionales y logicos----\n"


	.globl	factr
	.type	factr, @function
factr:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
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

	call factr
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

	.globl	fact
	.type	fact, @function
fact:
.LFB1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp

	movl	$1, %eax

	movl	%eax, -4(%ebp)
.L8:
	movl	8(%ebp), %eax

	movl	%eax, %ebx
	movl	$1, %eax
	cmpl	%eax, %ebx
	jg	.L5
	jmp	.L6
.L5:
	movl	$1, %eax
	jmp	.L7
.L6:
	movl	$0, %eax
.L7:

	cmpl	$0, %eax
	je	.L9

	movl	-4(%ebp), %eax
	pushl	%eax
	movl	8(%ebp), %eax
	movl	%eax, %ebx
	popl	%eax
	imull	%ebx, %eax

	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	pushl	%eax
	movl	$1, %eax
	movl	%eax, %ebx
	popl	%eax
	subl	%ebx, %eax

	movl	%eax, 8(%ebp)
jmp	.L8
.L9:
	movl	-4(%ebp), %eax

	movl	%ebp, %esp
	popl	%ebp
	ret

	movl	%ebp, %esp
	popl	%ebp
	ret

	.globl	fun
	.type	fun, @function
fun:
.LFB2:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	%eax

	pushl	$.LC0
	call	printf
	movl	12(%ebp), %eax
	pushl	%eax

	pushl	$.LC1
	call	printf
	movl	16(%ebp), %eax
	pushl	%eax

	pushl	$.LC2
	call	printf
	movl	16(%ebp), %eax
	pushl	%eax
	movl	12(%ebp), %eax
	pushl	%eax
	movl	8(%ebp), %eax
	pushl	%eax

	pushl	$.LC3
	call	printf
	movl	$0, %eax

	movl	%ebp, %esp
	popl	%ebp
	ret

	movl	%ebp, %esp
	popl	%ebp
	ret


	.comm numero,4,4
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp

	pushl	$.LC4
	call	printf

	movl	$numero, %eax
	pushl	%eax
	pushl	$.LC5
	call	__isoc99_scanf

	pushl	$.LC6
	call	printf

	movl	numero, %eax
	pushl	%eax

	call factr
	addl	$4, %esp
	pushl	%eax

	pushl	$.LC7
	call	printf

	pushl	$.LC8
	call	printf

	movl	numero, %eax
	pushl	%eax

	call fact
	addl	$4, %esp
	pushl	%eax

	pushl	$.LC7
	call	printf

	movl	$15, %eax
	pushl	%eax
	movl	$10, %eax
	pushl	%eax

	movl	$5, %eax
	pushl	%eax

	call fun
	addl	$12, %esp

	movl	%eax, -4(%ebp)

	pushl	$.LC9
	call	printf


	leal	-8(%ebp), %eax
	pushl	%eax
	pushl	$.LC5
	call	__isoc99_scanf

	pushl	$.LC10
	call	printf

	movl	numero, %eax
	pushl	%eax
	movl	-8(%ebp), %eax
	movl	%eax, %ebx
	popl	%eax
	addl	%ebx, %eax

	movl	%eax, -12(%ebp)
	movl	$2, %eax

	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	pushl	%eax
	movl	-16(%ebp), %eax
	movl	%eax, %ebx
	popl	%eax
	imull	%ebx, %eax
	pushl	%eax
	movl	-8(%ebp), %eax
	pushl	%eax
	movl	numero, %eax
	pushl	%eax

	pushl	$.LC11
	call	printf
	movl	numero, %eax

	movl	%eax, %ebx
	movl	-12(%ebp), %eax
	cmpl	%eax, %ebx
	jle	.L10
	jmp	.L11
.L10:
	movl	$1, %eax
	jmp	.L12
.L11:
	movl	$0, %eax
.L12:

	cmpl	$0, %eax
	je	.L14

	movl	-12(%ebp), %eax
	pushl	%eax
	movl	numero, %eax
	pushl	%eax

	pushl	$.LC12
	call	printf

	pushl	$.LC13
	call	printf
.L14:
	movl	-12(%ebp), %eax

	movl	%eax, %ebx
	movl	$1, %eax
	cmpl	%eax, %ebx
	jne	.L15
	jmp	.L16
.L15:
	movl	$1, %eax
	jmp	.L17
.L16:
	movl	$0, %eax
.L17:

	movl	%eax, %ebx
	movl	-12(%ebp), %eax

	movl	%eax, %ebx
	movl	$0, %eax
	cmpl	%eax, %ebx
	je	.L18
	jmp	.L19
.L18:
	movl	$1, %eax
	jmp	.L20
.L19:
	movl	$0, %eax
.L20:
	cmpl	$0, %eax
jne	.L21
	cmpl	$0, %ebx
jne	.L21
jmp	.L22
.L21:
	movl	$1, %eax
	jmp	.L23
.L22:
	movl	$0, %eax
.L23:

	cmpl	$0, %eax
	je	.L25

	pushl	$.LC14
	call	printf
.L25:
	movl	-16(%ebp), %eax

	movl	%eax, %ebx
	movl	$1, %eax
	cmpl	%eax, %ebx
	jne	.L26
	jmp	.L27
.L26:
	movl	$1, %eax
	jmp	.L28
.L27:
	movl	$0, %eax
.L28:

	movl	%eax, %ebx
	movl	-16(%ebp), %eax

	movl	%eax, %ebx
	movl	$2, %eax
	cmpl	%eax, %ebx
	jne	.L29
	jmp	.L30
.L29:
	movl	$1, %eax
	jmp	.L31
.L30:
	movl	$0, %eax
.L31:
	cmpl	$0, %eax
jne	.L34
jmp	.L33
.L34:
	cmpl	$0, %ebx
jne	.L32
jmp	.L33
.L32:
	movl	$1, %eax
	jmp	.L35
.L33:
	movl	$0, %eax
.L35:

	cmpl	$0, %eax
	jne	.L36


	pushl	$.LC16
	call	printf

	jmp	.L37
.L36:


	pushl	$.LC15
	call	printf
.L37:
	movl	$0, %eax

	movl	%ebp, %esp
	popl	%ebp
	ret
