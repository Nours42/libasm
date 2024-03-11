	section .text
	global	ft_read

ft_read:
	xor	rax, rax
	mov rax, 0
	syscall
	ret