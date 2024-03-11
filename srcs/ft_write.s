	section .text
	global	ft_write

ft_write:
	xor rax, rax	;
	mov	rax, 1		; 1 correspond a la fonction write, je la place en rax
	syscall			; je l'execute
	ret				; c'est fini ;)