.intel_syntax noprefix
.global _start
.global my_printf
.text


_start:
	lea rdi, [fmt]
	mov rsi, 'a'
	call my_printf
	jmp _exit


my_printf:
	/*setting up stack frame*/
	push rbp
	mov rbp, rsp
	sub rsp, 48

	mov [rbp - 48], rdi	/*First Argument*/
	mov [rbp - 40], rsi	/*Second Argument*/
	mov [rbp - 32], rdx	/*Third Argument*/
	mov [rbp - 24], rcx	/*Fourth Argument*/
	mov [rbp - 16], r8	/*Fifth Argument*/
	mov [rbp - 8], r9	/*Sixth Argument*/
	

	/*Moving the de-referenced value of [rbp - 48] into r13 for looping.*/
	mov r13, [rbp - 48]

	/*Clearing the stack frame*/
	mov rsp, rbp
	pop rbp
	ret



_exit:
	mov rax, 60
	xor rdi, rdi
	syscall


.data
	fmt: .asciz "Hi, This is %c!"
