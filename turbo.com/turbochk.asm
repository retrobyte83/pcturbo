		org 100h

		push cs
		pop	ds
		jmp	loc_CAD 
	
port_300h	dw 300h			
addr_E000h	dw 0E000h	

			db  "---stack base---sssssssssssssssssssssssssssss"
stk_base	db 0

str_bad		db  0Ah,0Dh,"Cannot access the PCturbo-286e Card. Please check all",0Ah,0Dh,"board jumpers and try again.",0Ah,0Dh,24h
str_ok		db  0Ah,0Dh,"Ready to load bios...",0Ah,0Dh,24h
	
byte_store	db 20h					

loc_CAD:				
		mov	ax, cs
		mov	ds, ax
		mov	es, ax

		cli
		mov	ss, ax
		mov	sp, stk_base
		sti
		cld		
	
		mov	ax, [addr_E000h]
		mov	cl, 4
		shr	ah, cl
		sub	ah, 8
		or	byte [byte_store], ah
		or	byte [byte_store], 10h	
		
		mov	dx, cs:port_300h
		add	dl, 4
		mov	al, 0
		out	dx, al
		mov	dx, cs:port_300h
		add	dl, 3
		mov	al, cs:byte_store
		out	dx, al						
		mov	dx, cs:port_300h
		mov	al, 0FFh
		out	dx, al							
		
		; Now do the memory read/write check
		mov	es, [addr_E000h]
		mov	word es:0, 5AA5h
		mov	word es:2, 0A55Ah
		cmp	word es:0, 5AA5h
		jnz	short loc_1118
		cmp	word es:2, 0A55Ah
		jnz	short loc_1118
		jmp	short loc_1120

loc_1118:				
		mov	si, str_bad  
		call	sub_1789  ; Cannot access the PCturbo 286e Card. Please check all board jumpers and try again.
		int	20h		; DOS -	PROGRAM	TERMINATION
					; returns to DOS--identical to INT 21/AH=00h

loc_1120:
		mov	si, str_ok;
		call	sub_1789	; Ready to load bios
		int	20h		; DOS -	PROGRAM	TERMINATION
					; returns to DOS--identical to INT 21/AH=00h									

; ------------------------------------------------------------------

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
