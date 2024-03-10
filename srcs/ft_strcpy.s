section	.text
	global	ft_strcpy

ft_strcpy:							; dst = rdi, src = rsi
	xor		rcx, rcx				; i = 0
	xor		rdx, rdx				; tmp = 0
	cmp		rsi, 0					; !rsi
	jz		return                  ; jz = jump if zero (if rsi is null)
	jmp		copy
increment:
	inc		rcx
copy:
	mov		dl, BYTE [rsi + rcx]    ; Copie le caractère de src à dst. Le caractère
	mov		BYTE [rdi + rcx], dl    ; à l'index rcx dans src (rsi + rcx) est chargé
	cmp		dl, 0                   ; dans dl (partie basse de rdx) puis stocké à
	jnz		increment               ; l'index rcx dans dst (rdi + rcx). puis compare
                                    ; si dl = 0 (fin de la copie) et jnz remonte a increment
return:
	mov		rax, rdi				; moove rdi sur rax (=valeur de retour) et donc return dst
	ret