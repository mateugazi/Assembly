bits	32
global	main

extern	printf
extern	scanf

section	.data
	format_out	db	'%s', 10, 0	
	format_in	db	'%s', 0

section	.bss
	outputstring	resb	1024
	inputstring	resb	1024

section	.text
main:
	push	inputstring
	push	format_in
	call	scanf 
	add	esp, 8

	mov	esi, inputstring
	mov	edi, outputstring

	strcpy:
		mov	al, [esi]
		mov	[edi], al
		inc	esi
		inc	edi
		cmp	al, 0
		jne	strcpy

	push	outputstring
	push	format_out
	call	printf 
	add	esp, 8 

	sub	eax, eax
	ret

