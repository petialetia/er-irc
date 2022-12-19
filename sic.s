	.file	"sic.c"
	.text
	.globl	argv0
	.bss
	.align 8
	.type	argv0, @object
	.size	argv0, 8
argv0:
	.zero	8
	.section	.rodata
.LC0:
	.string	"irc.oftc.net"
	.section	.data.rel.local,"aw"
	.align 8
	.type	host, @object
	.size	host, 8
host:
	.quad	.LC0
	.section	.rodata
.LC1:
	.string	"6667"
	.section	.data.rel.local
	.align 8
	.type	port, @object
	.size	port, 8
port:
	.quad	.LC1
	.local	password
	.comm	password,8,8
	.local	nick
	.comm	nick,32,32
	.local	bufin
	.comm	bufin,4096,32
	.local	bufout
	.comm	bufout,4096,32
	.local	channel
	.comm	channel,256,32
	.local	trespond
	.comm	trespond,8,8
	.local	srv
	.comm	srv,8,8
	.text
	.globl	strlcpy
	.type	strlcpy, @function
strlcpy:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L2
	jmp	.L3
.L4:
	movq	-16(%rbp), %rdx
	leaq	1(%rdx), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -24(%rbp)
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L9
.L3:
	subq	$1, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L4
	jmp	.L2
.L9:
	nop
.L2:
	cmpq	$0, -8(%rbp)
	jne	.L5
	cmpq	$0, -56(%rbp)
	je	.L10
	movq	-24(%rbp), %rax
	movb	$0, (%rax)
.L10:
	nop
.L7:
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L7
.L5:
	movq	-16(%rbp), %rax
	subq	-48(%rbp), %rax
	subq	$1, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	strlcpy, .-strlcpy
	.section	.rodata
.LC2:
	.string	" %s\n"
	.text
	.type	eprint, @function
eprint:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%rdi, -216(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L12
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L12:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movl	$8, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	-208(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$4096, %esi
	leaq	bufout(%rip), %rax
	movq	%rax, %rdi
	call	vsnprintf@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	leaq	bufout(%rip), %rax
	movq	%rax, %rdi
	call	fputs@PLT
	movq	-216(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L13
	movq	-216(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	-1(%rax), %rdx
	movq	-216(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L13
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L13:
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE7:
	.size	eprint, .-eprint
	.section	.rodata
	.align 8
.LC3:
	.string	"error: cannot resolve hostname '%s':"
	.align 8
.LC4:
	.string	"error: cannot connect to host '%s'\n"
	.text
	.type	dial, @function
dial:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-64(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -60(%rbp)
	movl	$1, -56(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	movq	-112(%rbp), %rsi
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	getaddrinfo@PLT
	testl	%eax, %eax
	je	.L16
	movq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	eprint
.L16:
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	jmp	.L17
.L22:
	movq	-72(%rbp), %rax
	movl	12(%rax), %edx
	movq	-72(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	socket@PLT
	movl	%eax, -84(%rbp)
	cmpl	$-1, -84(%rbp)
	je	.L26
	movq	-72(%rbp), %rax
	movl	16(%rax), %edx
	movq	-72(%rbp), %rax
	movq	24(%rax), %rcx
	movl	-84(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	je	.L27
	movl	-84(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L19
.L26:
	nop
.L19:
	movq	-72(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -72(%rbp)
.L17:
	cmpq	$0, -72(%rbp)
	jne	.L22
	jmp	.L21
.L27:
	nop
.L21:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo@PLT
	cmpq	$0, -72(%rbp)
	jne	.L23
	movq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	eprint
.L23:
	movl	-84(%rbp), %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	dial, .-dial
	.type	eat, @function
eat:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	jmp	.L29
.L31:
	addq	$1, -8(%rbp)
.L29:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L30
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movq	-16(%rbp), %rdx
	movl	%eax, %edi
	call	*%rdx
	cmpl	%eax, -20(%rbp)
	je	.L31
.L30:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	eat, .-eat
	.type	skip, @function
skip:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, %eax
	movb	%al, -12(%rbp)
	jmp	.L34
.L36:
	addq	$1, -8(%rbp)
.L34:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, -12(%rbp)
	je	.L35
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L36
.L35:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L37
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$0, (%rax)
.L37:
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	skip, .-skip
	.type	trim, @function
trim:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	-24(%rbp), %rdx
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	.L40
.L42:
	subq	$1, -8(%rbp)
.L40:
	movq	-8(%rbp), %rax
	cmpq	%rax, -24(%rbp)
	jnb	.L41
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	subq	$1, %rdx
	movzbl	(%rdx), %edx
	movzbl	%dl, %edx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	testl	%eax, %eax
	jne	.L42
.L41:
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	trim, .-trim
	.section	.rodata
.LC5:
	.string	"%Y-%m-%d %R"
.LC6:
	.string	"%-12s: %s %s\n"
	.text
	.type	pout, @function
pout:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$240, %rsp
	movq	%rdi, -232(%rbp)
	movq	%rsi, -240(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L44
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L44:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movl	$16, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	-208(%rbp), %rdx
	movq	-240(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$4096, %esi
	leaq	bufout(%rip), %rax
	movq	%rax, %rdi
	call	vsnprintf@PLT
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -216(%rbp)
	leaq	-216(%rbp), %rax
	movq	%rax, %rdi
	call	localtime@PLT
	movq	%rax, %rcx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdx
	movl	$80, %esi
	leaq	timestr.0(%rip), %rax
	movq	%rax, %rdi
	call	strftime@PLT
	movq	stdout(%rip), %rax
	movq	-232(%rbp), %rdx
	leaq	bufout(%rip), %r8
	leaq	timestr.0(%rip), %rcx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	nop
	movq	-184(%rbp), %rax
	subq	%fs:40, %rax
	je	.L45
	call	__stack_chk_fail@PLT
.L45:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	pout, .-pout
	.section	.rodata
.LC7:
	.string	"%s\r\n"
	.text
	.type	sout, @function
sout:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%rdi, -216(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L47
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L47:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movl	$8, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	-208(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$4096, %esi
	leaq	bufout(%rip), %rax
	movq	%rax, %rdi
	call	vsnprintf@PLT
	movq	srv(%rip), %rax
	leaq	bufout(%rip), %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	nop
	movq	-184(%rbp), %rax
	subq	%fs:40, %rax
	je	.L48
	call	__stack_chk_fail@PLT
.L48:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	sout, .-sout
	.section	.rodata
.LC8:
	.string	"PING %s"
	.text
	.globl	ping
	.type	ping, @function
ping:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	host(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sout
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	ping, .-ping
	.section	.rodata
.LC9:
	.string	"No channel to send to"
.LC10:
	.string	""
.LC11:
	.string	"<%s> %s"
.LC12:
	.string	"PRIVMSG %s :%s"
	.text
	.globl	privmsg
	.type	privmsg, @function
privmsg:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L51
	leaq	.LC9(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	pout
	jmp	.L50
.L51:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rcx
	leaq	nick(%rip), %rdx
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	pout
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sout
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	privmsg, .-privmsg
	.section	.rodata
.LC13:
	.string	"JOIN %s"
.LC14:
	.string	"sic - 250 LOC are too much!"
.LC15:
	.string	"PART %s :%s"
.LC16:
	.string	"%s"
	.text
	.globl	parsein
	.type	parsein, @function
parsein:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L67
	movq	-24(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	skip
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	je	.L56
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	channel(%rip), %rax
	movq	%rax, %rdi
	call	privmsg
	jmp	.L53
.L56:
	addq	$1, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	cmpb	$0, -9(%rbp)
	je	.L57
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	movzbl	(%rdx), %edx
	movzbl	%dl, %edx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	testl	%eax, %eax
	je	.L57
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movq	%rax, -8(%rbp)
	movsbl	-9(%rbp), %eax
	cmpl	$115, %eax
	je	.L58
	cmpl	$115, %eax
	jg	.L57
	cmpl	$109, %eax
	je	.L59
	cmpl	$109, %eax
	jg	.L57
	cmpl	$106, %eax
	je	.L60
	cmpl	$108, %eax
	je	.L61
	jmp	.L57
.L60:
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sout
	movzbl	channel(%rip), %eax
	testb	%al, %al
	jne	.L68
	movq	-8(%rbp), %rax
	movl	$256, %edx
	movq	%rax, %rsi
	leaq	channel(%rip), %rax
	movq	%rax, %rdi
	call	strlcpy
	jmp	.L68
.L61:
	movq	-8(%rbp), %rax
	movl	$1, %edx
	movq	isspace@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	eat
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movq	isspace@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	eat
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L63
	leaq	channel(%rip), %rax
	movq	%rax, -24(%rbp)
.L63:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L64
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$0, (%rax)
.L64:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L65
	leaq	.LC14(%rip), %rax
	movq	%rax, -8(%rbp)
.L65:
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sout
	jmp	.L53
.L59:
	movq	-8(%rbp), %rax
	movl	$1, %edx
	movq	isspace@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	eat
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movq	isspace@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	eat
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L66
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$0, (%rax)
.L66:
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	privmsg
	jmp	.L53
.L58:
	movq	-8(%rbp), %rax
	movl	$256, %edx
	movq	%rax, %rsi
	leaq	channel(%rip), %rax
	movq	%rax, %rdi
	call	strlcpy
	jmp	.L53
.L57:
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sout
	jmp	.L53
.L67:
	nop
	jmp	.L53
.L68:
	nop
.L53:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	parsein, .-parsein
	.section	.rodata
.LC17:
	.string	"PONG"
.LC18:
	.string	"PRIVMSG"
.LC19:
	.string	"PING"
.LC20:
	.string	"PONG %s"
.LC21:
	.string	">< %s (%s): %s"
.LC22:
	.string	"NICK"
	.text
	.globl	parsesrv
	.type	parsesrv, @function
parsesrv:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	host(%rip), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L78
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L78
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L73
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	skip
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L79
	movq	-24(%rbp), %rax
	movl	$33, %esi
	movq	%rax, %rdi
	call	skip
.L73:
	movq	-40(%rbp), %rax
	movl	$13, %esi
	movq	%rax, %rdi
	call	skip
	movq	-40(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	skip
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	skip
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	trim
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L80
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L76
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	pout
	jmp	.L69
.L76:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L77
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sout
	jmp	.L69
.L77:
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	pout
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L69
	movq	-24(%rbp), %rax
	leaq	nick(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L69
	movq	-8(%rbp), %rax
	movl	$32, %edx
	movq	%rax, %rsi
	leaq	nick(%rip), %rax
	movq	%rax, %rdi
	call	strlcpy
	jmp	.L69
.L78:
	nop
	jmp	.L69
.L79:
	nop
	jmp	.L69
.L80:
	nop
.L69:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	parsesrv, .-parsesrv
	.section	.rodata
	.align 8
.LC23:
	.string	"usage: sic [-h host] [-p port] [-n nick] [-k keyword] [-v]\n"
	.text
	.type	usage, @function
usage:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	argv0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	eprint
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	usage, .-usage
	.globl	get_stdin
	.type	get_stdin, @function
get_stdin:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movq	stdin(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	get_stdin, .-get_stdin
	.globl	fd_zero
	.type	fd_zero, @function
fd_zero:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L85
.L86:
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -12(%rbp)
.L85:
	cmpl	$15, -12(%rbp)
	jbe	.L86
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	fd_zero, .-fd_zero
	.globl	fd_set_
	.type	fd_set_, @function
fd_set_:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-4(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movq	-16(%rbp), %rax
	movslq	%esi, %rdx
	movq	(%rax,%rdx,8), %rax
	movl	-4(%rbp), %edx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	orq	%rdx, %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	movslq	%esi, %rdx
	movq	%rcx, (%rax,%rdx,8)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	fd_set_, .-fd_set_
	.globl	fd_isset
	.type	fd_isset, @function
fd_isset:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-4(%rbp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rdx
	movl	-4(%rbp), %eax
	andl	$63, %eax
	movl	$1, %esi
	movl	%eax, %ecx
	salq	%cl, %rsi
	movq	%rsi, %rax
	andq	%rdx, %rax
	testq	%rax, %rax
	setne	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	fd_isset, .-fd_isset
	.section	.rodata
.LC24:
	.string	"USER"
.LC25:
	.string	"unknown"
.LC26:
	.string	"r+"
.LC27:
	.string	"fdopen:"
.LC28:
	.string	"PASS %s"
.LC29:
	.string	"NICK %s"
.LC30:
	.string	"USER %s localhost %s :%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movl	%edi, -196(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	getenv@PLT
	movq	%rax, -176(%rbp)
	cmpq	$0, -176(%rbp)
	je	.L91
	movq	-176(%rbp), %rax
	jmp	.L92
.L91:
	leaq	.LC25(%rip), %rax
.L92:
	movl	$32, %edx
	movq	%rax, %rsi
	leaq	nick(%rip), %rax
	movq	%rax, %rdi
	call	strlcpy
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, argv0(%rip)
	addq	$8, -208(%rbp)
	subl	$1, -196(%rbp)
	jmp	.L93
.L120:
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L94
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L94
	addq	$8, -208(%rbp)
	subl	$1, -196(%rbp)
	jmp	.L95
.L94:
	movl	$0, -180(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-208(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-208(%rbp), %rax
	movq	%rax, -168(%rbp)
	jmp	.L96
.L119:
	movq	-168(%rbp), %rax
	cmpq	-208(%rbp), %rax
	jne	.L98
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movb	%al, -181(%rbp)
	movsbl	-181(%rbp), %eax
	subl	$104, %eax
	cmpl	$14, %eax
	ja	.L99
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L101(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L101(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L101:
	.long	.L105-.L101
	.long	.L99-.L101
	.long	.L99-.L101
	.long	.L104-.L101
	.long	.L99-.L101
	.long	.L99-.L101
	.long	.L103-.L101
	.long	.L99-.L101
	.long	.L102-.L101
	.long	.L99-.L101
	.long	.L99-.L101
	.long	.L99-.L101
	.long	.L99-.L101
	.long	.L99-.L101
	.long	.L125-.L101
	.text
.L105:
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L106
	movq	-208(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L106
	call	usage
	call	abort@PLT
.L106:
	movl	$1, -180(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L107
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	jmp	.L108
.L107:
	subl	$1, -196(%rbp)
	addq	$8, -208(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
.L108:
	movq	%rax, host(%rip)
	jmp	.L109
.L102:
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L110
	movq	-208(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L110
	call	usage
	call	abort@PLT
.L110:
	movl	$1, -180(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L111
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	jmp	.L112
.L111:
	subl	$1, -196(%rbp)
	addq	$8, -208(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
.L112:
	movq	%rax, port(%rip)
	jmp	.L109
.L103:
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L113
	movq	-208(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L113
	call	usage
	call	abort@PLT
.L113:
	movl	$1, -180(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L114
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	jmp	.L115
.L114:
	subl	$1, -196(%rbp)
	addq	$8, -208(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
.L115:
	movl	$32, %edx
	movq	%rax, %rsi
	leaq	nick(%rip), %rax
	movq	%rax, %rdi
	call	strlcpy
	jmp	.L109
.L104:
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L116
	movq	-208(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L116
	call	usage
	call	abort@PLT
.L116:
	movl	$1, -180(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L117
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	jmp	.L118
.L117:
	subl	$1, -196(%rbp)
	addq	$8, -208(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
.L118:
	movq	%rax, password(%rip)
	jmp	.L109
.L99:
	call	usage
	jmp	.L109
.L125:
	nop
.L109:
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-208(%rbp), %rax
	movq	%rdx, (%rax)
.L96:
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L98
	cmpl	$0, -180(%rbp)
	je	.L119
.L98:
	subl	$1, -196(%rbp)
	addq	$8, -208(%rbp)
.L93:
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L95
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L95
	movq	-208(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	je	.L120
.L95:
	movq	port(%rip), %rdx
	movq	host(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	dial
	movl	%eax, %edx
	leaq	.LC26(%rip), %rax
	movq	%rax, %rsi
	movl	%edx, %edi
	call	fdopen@PLT
	movq	%rax, srv(%rip)
	movq	srv(%rip), %rax
	testq	%rax, %rax
	jne	.L121
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	eprint
.L121:
	movq	password(%rip), %rax
	testq	%rax, %rax
	je	.L122
	movq	password(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sout
.L122:
	leaq	nick(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sout
	movq	host(%rip), %rax
	leaq	nick(%rip), %rdx
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	nick(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	sout
	movq	srv(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movq	stdout(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	setbuf@PLT
	movq	srv(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	setbuf@PLT
	movq	stdin(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	setbuf@PLT
.L123:
	movq	srv(%rip), %rsi
	leaq	-144(%rbp), %rax
	leaq	bufout(%rip), %rdx
	movq	%rdx, %rcx
	leaq	bufin(%rip), %rdx
	movq	%rax, %rdi
	call	etude_handle@PLT
	jmp	.L123
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.local	timestr.0
	.comm	timestr.0,80,32
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
