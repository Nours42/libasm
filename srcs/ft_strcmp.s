; la fonction en libft est :
;
; int	ft_strcmp(char *s1, char *s2)
; {
; 	unsigned int	i;
;
; 	i = 0;
; 	while (s1[i] == s2[i] && s1[i] && s2[i])
; 	{
; 		i++;
; 	}
; 	return (s1[i] - s2[i]);
; }
;
; la fonction retourne un chiffre > 0 si s1 > s2, un < 0 si s1 < s2 et 0 si s1 == s2
; ici nous allons renvoye 1 ou -1 plutot que la difference comme en libft

	section .text
	global ft_strcmp

ft_strcmp:
	xor	rcx, rcx	; raz de rcx
	xor	rdx, rdx	; raz de rdx
	cmp	rdi, 0		; if !s1
	jz	check_null
	cmp	rsi, 0		; if !s2
	jz	check_null
	jmp	check

check_null:
	cmp	rdi, rsi
	jz	equal		; ce qui veut dire que s1 == s2 et qu'ils sont nuls
	jg	superior	; jg = jump if greater, veut dire que s1 == NULL
	jmp	inferior	; veut dire aue s2 == NULL

compare:
	mov	dl, BYTE [rsi + rcx]	; tmp = s2[i]
	cmp	BYTE [rdi + rcx], dl	; s1[i] == tmp
	jne	last_char

increment:
	inc	rcx ; ce qui vaut i++

check:
	cmp	BYTE [rdi + rcx], 0		; est-ce que s1[i] existe (0 == \0)
	je	last_char
	cmp BYTE [rsi + rcx], 0		; est-ce aue s2[i] existe
	je	last_char
	jmp	compare

last_char:
	mov	dl, BYTE [rdi + rcx]	; cmp = s1[i]
	sub	dl, BYTE [rsi + rcx]	; cmp -= s2[i]
	cmp dl, 0
	jz	equal
	jl	inferior

superior:
	mov	rax, 1 					; s2 est sup (s1 peut etre null)
	ret

inferior:
	mov rax, -1					; s1 est sup (s2 peut etre null)
	ret

equal:
	mov	rax, 0					; s1 == s2 (s1 et s2 peuvent etre null)
	ret