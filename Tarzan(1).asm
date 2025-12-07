[org 0x100]

jmp start

clear:
	mov ax, 0xB800
	mov es, ax
	
	mov ax, 0x0720
	mov cx, 2000
	mov di, 0
	rep stosw
	ret

drawBackGround:
	mov ah, 0x2A	
	mov al, 22
	mov dx, 0
	add bx, 0
	Drawgrass:
		mov di, bx
		add di, dx
		add di, dx
		mov cx, 25
	grassing:
		stosw
		add di, 158
		loop grassing
		add dx, 1
		cmp dx, 16
		jne Drawgrass
		mov dx, 0
		cmp bx, 128
		je footPath
		mov bx, 128
		jmp Drawgrass
		
	footPath:
		mov ax, 0x4020 
		mov bx, 32
		mov dx, 0
		
	drawFootpath:   
		mov di, bx
		add di, dx
		add di, dx
		mov cx, 25
	pathing:
		
		stosw
		xor ah, 0x30  ; 
		add di, 158 
		loop pathing
		add dx, 1
		cmp dx, 2
		jne drawFootpath
		mov dx, 0
		cmp bx, 126
		je Line
		mov bx, 126
		jmp drawFootpath
		
	
	Line:
		mov si, 64
	drawLine:
		mov di, si
		add di, 160
		mov dx, 3
		mov ax, 0x7020
	printingLine:
		mov cx, dx
	lining:
		stosw
		add di, 158
		cmp di, 4000
		jae nextLine
		loop lining
		
		xor ah, 0x70  
		xor dx, 1
		jmp printingLine
		
	nextLine:
		cmp si, 94
		je Redcar
		mov si, 94
		jmp drawLine
	
	Redcar:	
		mov ax,0x43DC
		mov di, 3086
		stosw
		mov ax,0x43DC
		stosw
		stosw
		mov ax,0x43DC
		stosw
		
		add di, 152
		mov ax,0x4320
		stosw
		mov ax,0x7320
		stosw
		stosw
		mov ax,0x4320
		stosw
		
		add di, 152
		mov ax,0x4320
		stosw
		mov ax,0x7320
		stosw
		stosw
		mov ax,0x4320
		stosw
		
		add di, 152
		mov ax,0x4E7C
		stosw
		mov ax,0x43DC
		stosw
		stosw
		mov ax,0x4E7C
		stosw
		
		
	mov ah, 0x00
    int 0x1A

    mov ax, dx
    xor ah, ah
    mov bl, 3
    div bl    
    cmp ah, 0
    je lane1
    cmp ah, 1
    je lane2
    jmp lane3
	
	
	lane1:
		mov di, 46
		jmp BlueCar
	lane2:
		mov di, 76
		jmp BlueCar
	lane3:
		mov di, 106
	
	BlueCar:
		mov ax,0x13DC
		stosw
		mov ax,0x13DC
		stosw
		stosw
		mov ax,0x13DC
		stosw
		
		add di, 152
		mov ax,0x1320
		stosw
		mov ax,0x7320
		stosw
		stosw
		mov ax,0x1320
		stosw
		
		add di, 152
		mov ax,0x1320
		stosw
		mov ax,0x7320
		stosw
		stosw
		mov ax,0x1320
		stosw
		
		add di, 152
		mov ax,0x1E7C
		stosw
		mov ax,0x13DC
		stosw
		stosw
		mov ax,0x1E7C
		stosw
		
		ret

start:
	call clear
	call drawBackGround
	mov ax, 0x4C00
	int 0x21