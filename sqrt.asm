bits    32
global  main

extern  printf
extern  scanf

section .data		
	format_in	db 	'%lf', 0
    	format_out	db 	'sqrt(%f)=%f', 10, 0
	double		dq	0.0
	i		dq	0.125

section .bss
  	 end	resq	1 

section .text
main:
	push	end
        push	format_in
        call	scanf
        add	esp, 8
	fld	qword [end]
	loop1:
		fld	qword [double] 
		fucomi	st0, st1
		jae ending 
		loop2:
			fld	qword [double]
			fsqrt	
			sub	esp, 8
			fstp	qword [esp] 
			sub	esp, 8
			fstp	qword [esp] 
			push	format_out
			call	printf 
			add	esp, 20 
			fld	qword [double]
			fld	qword [i] 
			faddp 
			fstp	qword [double] 
			jmp	loop1 
	ending:	
        sub	eax, eax
        ret
