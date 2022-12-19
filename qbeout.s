.text
.globl etude_handle
etude_handle:
	pushq %rbp
	movq %rsp, %rbp
	subq $24, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	movq %rsi, %r13
	movq %rdi, %r12
	movq %rdx, %rdi
	movq %rdi, %rbx
	movq %r12, %rdi
	callq fd_zero
	movq %r12, %rsi
	movq %rbx, %rdi
	movq %rsi, %r12
	movq %rdi, %rbx
	movl $0, %edi
	callq fd_set_
	movq %rbx, %rdi
	movq %rdi, %rbx
	movq %r13, %rdi
	callq fileno
	movq %r12, %rsi
	movl %eax, %edi
	movq %rsi, %r12
	callq fd_set_
	movq %rbx, %rdi
	movl $120, -8(%rbp)
	movl $0, -4(%rbp)
	movq %rdi, %rbx
	movq %r13, %rdi
	callq fileno
	movq %r13, %rdx
	movq %r12, %rsi
	movq %rbx, %rdi
	movq %rdi, %rbx
	movl %eax, %edi
	addl $1, %edi
	movl $0, %r8d
	movl $0, %ecx
	movq %rdx, %r13
	movl $0, %edx
	movq %rsi, %r12
	callq select
	movq %rbx, %rdi
	movl %eax, %esi
	cmpl $0, %esi
	jl .Lbb9
	cmpl $0, %esi
	jz .Lbb8
	movq %rdi, %rbx
	movq %r13, %rdi
	callq fileno
	movq %r12, %rsi
	movl %eax, %edi
	movq %rsi, %r12
	callq fd_isset
	movq %rbx, %rdi
	cmpl $0, %eax
	jnz .Lbb4
	movq %r12, %rsi
	jmp .Lbb5
.Lbb4:
	movq %rdi, %rbx
	leaq strdata.2(%rip), %rdi
	movl $0, %eax
	callq printf
	movq %r13, %rdx
	movq %r12, %rsi
	movq %rbx, %rdi
	movq %rsi, %r12
	movl $4096, %esi
	movq %rdi, %rbx
	callq fgets
	movq %rbx, %rdi
	movq %rdi, %rbx
	callq parsesrv
	movq %r12, %rsi
	movq %rbx, %rdi
.Lbb5:
	movq %rdi, %rbx
	movl $0, %edi
	callq fd_isset
	movq %rbx, %rdi
	cmpl $0, %eax
	jz .Lbb7
	movq %rdi, %rbx
	movl $0, %edi
	callq get_stdin
	movq %rbx, %rdi
	movq %rax, %rdx
	movl $4096, %esi
	movq %rdi, %rbx
	callq fgets
	movq %rbx, %rdi
	callq parsein
.Lbb7:
	movl $0, %eax
	jmp .Lbb10
.Lbb8:
	leaq strdata.1(%rip), %rdi
	movl $0, %eax
	callq printf
	movl $0, %edi
	callq ping
	movl $0, %eax
	jmp .Lbb10
.Lbb9:
	leaq strdata.0(%rip), %rdi
	movl $0, %eax
	callq printf
	movl $0, %eax
.Lbb10:
	popq %r13
	popq %r12
	popq %rbx
	leave
	ret
.type etude_handle, @function
.size etude_handle, .-etude_handle
/* end function etude_handle */

.text
.globl mainf2iPPc
mainf2iPPc:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	pushq %rbx
	movl $4, %edi
	callq malloc
	movq %rax, %rdi
	movq %rdi, %rbx
	movl $4, %edi
	callq malloc
	movq %rbx, %rdi
	movq %rax, %rsi
	leaq strdata.4(%rip), %rcx
	leaq strdata.3(%rip), %rdx
	callq etude_handle
	movl $0, %eax
	popq %rbx
	leave
	ret
.type mainf2iPPc, @function
.size mainf2iPPc, .-mainf2iPPc
/* end function mainf2iPPc */

.data
.balign 8
strdata.0:
	.ascii "Again %d\n"
	.byte 0
/* end data */

.data
.balign 8
strdata.1:
	.ascii "Ping"
	.byte 0
/* end data */

.data
.balign 8
strdata.2:
	.ascii "Ping"
	.byte 0
/* end data */

.data
.balign 8
strdata.3:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
strdata.4:
	.ascii ""
	.byte 0
/* end data */

.section .note.GNU-stack,"",@progbits

