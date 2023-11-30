		org 100h

		xchg bx, bx
		push	cs
		pop	ds
		jmp	loc_CAD 

; ���������������������������������������������������������������������������

byte_16F	db 1			
byte_175	db 0				
		    db 0
byte_177	db 0			
word_178	dw 700h			
		db    5
		db    7
		db    7
		db    7
		db    6
		db    7
word_180	dw 300h			
word_182	dw 0E000h		

			db  "---stack base---ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
stk_base	db 0

str_3A3h	db  0Ah,0Dh,"Cannot access the PCturbo-286e Card. Please check all",0Ah,0Dh,"board jumpers and try again.",0Ah,0Dh,24h
str_6D2		db  "Already executing on the PCturbo-286!",0Ah,0Dh,24h
str_80Bh	db  "PCturbo-286"
str_9D0h	db  0Ah,0Dh,"Ready to load bios...",0Ah,0Dh,24h
str_0A33h	db  "Unexpected Result",0Ah,0Dh,24h

byte_C06	db 0	
byte_C1E	db 0			
str_0C1Fh	db    0
			db    0
			db    0
			db    0
			db    0
			db    0

byte_CA7	db 20h			
byte_CA9	db 0			
byte_CAB	db 0			

; ���������������������������������������������������������������������������

loc_CAD:				
		mov	ax, cs
		mov	ds, ax
		mov	es, ax

		mov	ax, cs
		cli
		mov	ss, ax
		mov	sp, stk_base
		sti
		cld
		

		jmp loc_1059 

		mov	si, str_6D2
		call	sub_1789 ; print Already executing on the PCturbo 286!
		int	20h		; DOS -	PROGRAM	TERMINATION
					; returns to DOS--identical to INT 21/AH=00h

loc_1059:				
		cli
		in	al, 21h		; Interrupt controller,	8259A.
		mov	byte [byte_C1E], al
		push	ds
		mov	si, 0
		mov	ds, si
		mov	di, str_0C1Fh
		push	cs
		pop	es

		mov	cx, 4h
		rep movsb
		pop	ds
		sti
		cmp	byte [byte_CAB], 1
		jz	short loc_10C4

		mov	dx, cs:word_180
		mov	al, 0FFh
		out	dx, al
	
	
	
		mov	al, 0Fh
		
		mov	dx, cs:word_180
		add	dl, 4
		out	dx, al
		mov	cs:byte_C06, al
		


		mov	es, [word_182]

		mov	si, str_80Bh  ; PCturbo 286
		mov	di, 0E00Ah
		mov	cx, 0Bh
		repe cmpsb
		jnz	short loc_10C4
		mov	cx, 64h
		mov	byte  es:0FFFDh, 0A5h

loc_109D:				
		cmp	byte es:0FFFDh, 5Ah
		loopne	loc_109D
		jnz	short loc_10C4
		mov	byte es:0FFFDh, 0F0h

loc_10AD:				
		cmp	byte es:0FFFDh, 0Fh
		loopne	loc_10AD
		jnz	short loc_10C4
		mov	byte [byte_CA9], 1
		or	byte [byte_CA7], 80h
		jmp	loc_12D9

loc_10C4:				
		mov	dx, cs:word_180
		add	dl, 4
		mov	al, 0
		out	dx, al
		mov	dx, cs:word_180
		add	dl, 3
		mov	al, cs:byte_CA7
		out	dx, al
	
		
		mov	dx, [word_178]
		add	dl, 7
		out	dx, al
		mov	dx, [word_178]
		add	dl, 6
		in	al, dx
		mov	dx, [word_178]
		add	dl, 0
		in	al, dx
		mov	dx, [word_178]
		add	dl, 1
		mov	al, 0
		out	dx, al

		mov	dx, cs:word_180
		mov	al, 0FFh
		out	dx, al


		mov	al, 0Fh


		mov	dx, cs:word_180
		add	dl, 4
		out	dx, al
		mov	cs:byte_C06, al		
		

		mov	es, [word_182]
		mov	word es:0, 5AA5h
		mov	word es:2, 0A55Ah
		cmp	word es:0, 5AA5h
		jnz	short loc_1118
		cmp	word es:2, 0A55Ah
		jnz	short loc_1118
		jmp	short loc_1120

loc_1118:				
		mov	si, str_3A3h  
		call	sub_1789  ; Cannot access the PCturbo 286e Card. Please check all board jumpers and try again.
		int	20h		; DOS -	PROGRAM	TERMINATION
					; returns to DOS--identical to INT 21/AH=00h

loc_1120:
		mov	si, str_9D0h;
		call	sub_1789	; Ready to load bios
		int	20h		; DOS -	PROGRAM	TERMINATION
					; returns to DOS--identical to INT 21/AH=00h						

loc_12D9:

		mov	si, str_0A33h;
		call	sub_1789	; Unexpected result
		int	20h		; DOS -	PROGRAM	TERMINATION
					; returns to DOS--identical to INT 21/AH=00h						

; ���������������������������������������������������������������������������

sub_1789:
		push	ax
		push	bx
		push	si
		push	bp
		mov	bx, 7

loc_1790:
		mov	al, cs:[si]
		cmp	al, 24h
		jz	short loc_179E
		mov	ah, 0Eh
		int	10h		; - VIDEO - WRITE CHARACTER AND	ADVANCE	CURSOR (TTY WRITE)
					; AL = character, BH = display page (alpha modes)
					; BL = foreground color	(graphics modes)
		inc	si
		jmp	short loc_1790

loc_179E:
		pop	bp
		pop	si
		pop	bx
		pop	ax
		retn
;sub_1789	endp


byte_2123	db 9	
byte_212F	db 9	
