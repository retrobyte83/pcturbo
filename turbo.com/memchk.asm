org 100h

push cs
pop ds

jmp loc_CAD

str_ok		db  0Ah
		db  0Dh
		db  4Fh	; O
		db  4Bh	; K
		db  0Ah
		db  0Dh
		db  24h	; $
str_notok		db  0Ah
		db  0Dh
		db  4Eh	; N
		db  6Fh	; o
		db  74h	; t
		db  20h	;  
		db  4Fh	; O
		db  4Bh	; K
		db  0Ah
		db  0Dh
		db  24h	; $
word_182	dw 0E000h


loc_CAD:

		mov	es, [word_182]
		mov	word es:0, 5AA5h
		mov	word es:2, 0A55Ah
		cmp	word es:0, 5AA5h
		jnz	short loc_1118
		cmp	word es:2, 0A55Ah
		jnz	short loc_1118
		jmp	short loc_1120

loc_1118:
		mov	si, str_notok  
		call	sub_1789  ; print Cannot access the PCturbo 286e Card. Please check all board jumpers and try again.
		int	20h		; DOS -	PROGRAM	TERMINATION
					; returns to DOS--identical to INT 21/AH=00h


loc_1120:
		mov	si, str_ok;
		call	sub_1789	; Turbo already loaded. (/! option used. Use Alt grey+ to swap)
		int	20h		; DOS -	PROGRAM	TERMINATION
					; returns to DOS--identical to INT 21/AH=00h						


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
