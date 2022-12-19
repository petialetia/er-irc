.text
.globl send_messagef3IrcdSessionPcPc
send_messagef3IrcdSessionPcPc:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	pushq %rbx
	movq %rsi, %rbx
	movq %rdi, %rdx
	movq 56(%rbp), %rdi
	leaq strdata.0(%rip), %rsi
	callq fprintf
	movq %rbx, %rdx
	movq 56(%rbp), %rdi
	leaq strdata.1(%rip), %rsi
	callq fprintf
	popq %rbx
	leave
	ret
.type send_messagef3IrcdSessionPcPc, @function
.size send_messagef3IrcdSessionPcPc, .-send_messagef3IrcdSessionPcPc
/* end function send_messagef3IrcdSessionPcPc */

.text
.globl join_channelf2IrcdSessionPc
join_channelf2IrcdSessionPc:
	pushq %rbp
	movq %rsp, %rbp
	movq %rdi, %rdx
	movq 56(%rbp), %rdi
	leaq strdata.2(%rip), %rsi
	callq fprintf
	leave
	ret
.type join_channelf2IrcdSessionPc, @function
.size join_channelf2IrcdSessionPc, .-join_channelf2IrcdSessionPc
/* end function join_channelf2IrcdSessionPc */

.text
.globl register_userf1IrcdSession
register_userf1IrcdSession:
	pushq %rbp
	movq %rsp, %rbp
	subq $40, %rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	movq 56(%rbp), %rdi
	movq %rdi, -24(%rbp)
	movq 32(%rbp), %r12
	movq %r12, -16(%rbp)
	movq 16(%rbp), %rdx
	movq %rdx, -8(%rbp)
	movq %rdx, %r13
	movq %r12, %rdx
	leaq strdata.3(%rip), %rsi
	movq %rdi, %rbx
	callq fprintf
	movq %r13, %rdx
	movq %rbx, %rdi
	movq %rdx, %r13
	movq %r12, %rdx
	leaq strdata.4(%rip), %rsi
	movq %rdi, %rbx
	callq fprintf
	movq %r13, %rdx
	movq %rbx, %rdi
	leaq strdata.5(%rip), %rsi
	movq %rdi, %rbx
	callq fprintf
	movq %r12, %rdx
	movq %rbx, %rdi
	leaq strdata.6(%rip), %rsi
	callq fprintf
	popq %r13
	popq %r12
	popq %rbx
	leave
	ret
.type register_userf1IrcdSession, @function
.size register_userf1IrcdSession, .-register_userf1IrcdSession
/* end function register_userf1IrcdSession */

.text
.globl init_sessionf1Pc
init_sessionf1Pc:
	pushq %rbp
	movq %rsp, %rbp
	subq $56, %rsp
	pushq %rbx
	movq %rdi, %rax
	leaq strdata.7(%rip), %rcx
	movq %rcx, -48(%rbp)
	movq %rax, %rbx
	leaq strdata.8(%rip), %rax
	movq %rax, -40(%rbp)
	movq %rsi, -32(%rbp)
	movl $32768, %edi
	callq malloc
	movq %rax, -24(%rbp)
	movl $32768, %edi
	callq malloc
	movq %rax, -16(%rbp)
	leaq strdata.8(%rip), %rsi
	leaq strdata.7(%rip), %rdi
	callq dial
	movl %eax, %edi
	leaq strdata.9(%rip), %rsi
	callq fdopen
	movq %rax, %rcx
	movq %rbx, %rax
	movq %rcx, -8(%rbp)
	movq -8(%rbp), %rcx
	movq %rcx, 40(%rax)
	movq -16(%rbp), %rcx
	movq %rcx, 32(%rax)
	movq -24(%rbp), %rcx
	movq %rcx, 24(%rax)
	movq -32(%rbp), %rcx
	movq %rcx, 16(%rax)
	movq -40(%rbp), %rcx
	movq %rcx, 8(%rax)
	movq -48(%rbp), %rcx
	movq %rcx, 0(%rax)
	popq %rbx
	leave
	ret
.type init_sessionf1Pc, @function
.size init_sessionf1Pc, .-init_sessionf1Pc
/* end function init_sessionf1Pc */

.text
.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq 8(%rsi), %rsi
	leaq -96(%rbp), %rdi
	callq init_sessionf1Pc
	movq (%rax), %rcx
	movq %rcx, -48(%rbp)
	movq 8(%rax), %rcx
	movq %rcx, -40(%rbp)
	movq 16(%rax), %rcx
	movq %rcx, -32(%rbp)
	movq 24(%rax), %rcx
	movq %rcx, -24(%rbp)
	movq 32(%rax), %rcx
	movq %rcx, -16(%rbp)
	movq 40(%rax), %rax
	movq %rax, -8(%rbp)
	movl $2, %edi
	callq sleep
	subq $48, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 40(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 32(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 24(%rcx)
	movq -32(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -40(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -48(%rbp), %rax
	movq %rax, 0(%rcx)
	callq register_userf1IrcdSession
	subq $-48, %rsp
	movl $2, %edi
	callq sleep
	subq $48, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 40(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 32(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 24(%rcx)
	movq -32(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -40(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -48(%rbp), %rax
	movq %rax, 0(%rcx)
	leaq strdata.10(%rip), %rdi
	callq join_channelf2IrcdSessionPc
	subq $-48, %rsp
	movl $2, %edi
	callq sleep
	subq $48, %rsp
	movq %rsp, %rcx
	movq -8(%rbp), %rax
	movq %rax, 40(%rcx)
	movq -16(%rbp), %rax
	movq %rax, 32(%rcx)
	movq -24(%rbp), %rax
	movq %rax, 24(%rcx)
	movq -32(%rbp), %rax
	movq %rax, 16(%rcx)
	movq -40(%rbp), %rax
	movq %rax, 8(%rcx)
	movq -48(%rbp), %rax
	movq %rax, 0(%rcx)
	leaq strdata.12(%rip), %rsi
	leaq strdata.11(%rip), %rdi
	callq send_messagef3IrcdSessionPcPc
	subq $-48, %rsp
	movl $0, %eax
	leave
	ret
.type main, @function
.size main, .-main
/* end function main */

.data
.balign 8
strdata.0:
	.ascii "PRIVMSG %s "
	.byte 0
/* end data */

.data
.balign 8
strdata.1:
	.ascii ":%s\r\n"
	.byte 0
/* end data */

.data
.balign 8
strdata.2:
	.ascii "JOIN %s\r\n "
	.byte 0
/* end data */

.data
.balign 8
strdata.3:
	.ascii "NICK %s\r\n"
	.byte 0
/* end data */

.data
.balign 8
strdata.4:
	.ascii "USER %s "
	.byte 0
/* end data */

.data
.balign 8
strdata.5:
	.ascii "localhost %s "
	.byte 0
/* end data */

.data
.balign 8
strdata.6:
	.ascii ":%s\r\n"
	.byte 0
/* end data */

.data
.balign 8
strdata.7:
	.ascii "irc.oftc.net"
	.byte 0
/* end data */

.data
.balign 8
strdata.8:
	.ascii "6667"
	.byte 0
/* end data */

.data
.balign 8
strdata.9:
	.ascii "r+"
	.byte 0
/* end data */

.data
.balign 8
strdata.10:
	.ascii "#etudetest"
	.byte 0
/* end data */

.data
.balign 8
strdata.11:
	.ascii "#etudetest"
	.byte 0
/* end data */

.data
.balign 8
strdata.12:
	.ascii "Hello world"
	.byte 0
/* end data */

.section .note.GNU-stack,"",@progbits

