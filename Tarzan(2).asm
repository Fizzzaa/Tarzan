[org 0x100]

jmp start
coinTick: dw 0
carTick: dw 0
fuelTick: dw 0
footPathTick: dw 0
lineTick: dw 0
roadTick: dw 0

roadBuffer dw 240 dup(0x0720)
lane : dw 0
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
		cmp bx, 124
		je Line
		mov bx, 124
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
		mov di, 3246
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
    
    mov si, di 
    
    mov ax, ds
    mov es, ax
    lea di, [roadBuffer]
    add di, si          
    
    mov ax, 0x13DC
    stosw
    stosw
    stosw
    stosw
    
    add di, 152
    mov ax, 0x1320
    stosw
    mov ax, 0x7320
    stosw
    stosw
    mov ax, 0x1320
    stosw
    
    add di, 152
    mov ax, 0x1320
    stosw
    mov ax, 0x7320
    stosw
    stosw
    mov ax, 0x1320
    stosw
    
    mov ax, 0xB800
    mov es, ax
    mov di, si 
    mov ax, 0x1E7C
    stosw
    mov ax, 0x13DC
    stosw
    stosw
    mov ax, 0x1E7C
    stosw
    
    ret	
		
		
drawCoins:
	
	mov ax, cx
    sub ax, [coinTick]
    cmp ax, 55
    jb return
    mov [coinTick], cx

	mov ah, 0x00
    int 0x1A
    mov ax, dx
    xor ah, ah
    mov bl, 3
    div bl    
    cmp ah, 0
    je coinLine1
    cmp ah, 1
    je coinLine2
    jmp coinLine3
	
	
	coinLine1:
		mov di, 48
		jmp printingCoin
	coinLine2:
		mov di, 78
		jmp printingCoin
	coinLine3:
		mov di, 108
	
printingCoin:
	mov ax,0x6E20
	stosw
	mov ax,0xEE24
	stosw
	mov ax,0x6E20
	stosw
		
return:
		ret
		

drawCar:
	
	mov ax, cx
    sub ax, [carTick]
    cmp ax, 91
    jb return
    mov [carTick], cx

	mov ah, 0x00
    int 0x1A
    mov ax, dx
    xor ah, ah
    mov bl, 3
    div bl    
    cmp ah, 0
    je carLine1
    cmp ah, 1
    je carLine2
    jmp carLine3
	
	
	carLine1:
		mov di, 46
		call BlueCar
		jmp return
	carLine2:
		mov di, 76
		call BlueCar
		jmp return
	carLine3:
		mov di, 106
		call BlueCar
	
ret

drawFuel:
	
	mov ax, cx
    sub ax, [fuelTick]
    cmp ax, 120
    jb return
    mov [fuelTick], cx

	mov ah, 0x00
    int 0x1A
    mov ax, dx
    xor ah, ah
    mov bl, 3
    div bl    
    cmp ah, 0
    je fuelLine1
    cmp ah, 1
    je fuelLine2
    jmp fuelLine3
	
	
	fuelLine1:
		mov di, 48
		jmp printingFuel
	fuelLine2:
		mov di, 78
		jmp printingFuel
	fuelLine3:
		mov di, 108
	
printingFuel:
	mov ax,0x4E20
	stosw
	mov ax,0x4E93
	stosw
	mov ax,0x4E20
	stosw
		
		ret

animateFootPath:
	
	mov ax, cx
    sub ax, [footPathTick]
    cmp ax, 2 
    jb return
    mov [footPathTick], cx
	
	mov cx, 25
    
    mov si, 32   
    mov di, 34 
	mov bx, 0
	
animatingFootPath:

    mov ax, [es:si]
    mov dx, [es:di]
    
    mov [es:si], dx
    mov [es:di], ax
    
    add si, 160   
    add di, 160   
    loop animatingFootPath
	cmp bx, 1
	je return
	mov bx, 1
	mov cx, 25
	mov si, 124
	mov di, 126
	jmp animatingFootPath
	ret

roatate:
	mov ax, 0xB800
	mov es, ax
	add di, 3840
	mov bx, es:[di]
	mov si, di
	sub si, 160
	mov cx, 24
rotateLoop:
	mov ax, es:[si]
	mov es:[di], ax
	sub di, 160
	sub si, 160
	loop rotateLoop
	mov es:[di], bx
	
	ret
	
animateLines:
	mov ax, cx
    sub ax, [lineTick]
    cmp ax, 2 
    jb return
    mov [lineTick], cx
	
	mov di,64
	call roatate
	
	mov di, 94
	call roatate
	
	ret
	

animateRoad:
	mov ax, cx
	sub ax, [roadTick]
	cmp ax, 2
	jb doneLine
	mov [roadTick], cx
	
	call rotateLane
	
doneLine:
	ret

animateLanes:
	mov ax, cx
	sub ax, [roadTick]
	cmp ax, 2
	jb doneRoad
	mov [roadTick], cx
	
	cmp word [lane], 1
	je carLane1
	cmp word [lane], 2
	je carLane2
	
	mov di, 46
	call rotateCarLane
	mov di, 48
	call rotateCarLane
	mov di, 50
	call rotateCarLane
	mov di, 52
	call rotateCarLane
	
	mov di, 76
	call rotateLane
	mov di, 78
	call rotateLane
	mov di, 80
	call rotateLane
	mov di, 82
	call rotateLane
	
	mov di, 106
	call rotateLane
	mov di, 108
	call rotateLane
	mov di, 110
	call rotateLane
	mov di, 112
	call rotateLane
	
	jmp doneRoad
	
carLane1:
	mov di, 46
	call rotateLane
	mov di, 48
	call rotateLane
	mov di, 50
	call rotateLane
	mov di, 52
	call rotateLane
	
	mov di, 76
	call rotateCarLane
	mov di, 78
	call rotateCarLane
	mov di, 80
	call rotateCarLane
	mov di, 82
	call rotateCarLane
	
	mov di, 106
	call rotateLane
	mov di, 108
	call rotateLane
	mov di, 110
	call rotateLane
	mov di, 112
	call rotateLane
	jmp doneRoad

carLane2:
	mov di, 46
	call rotateLane
	mov di, 48
	call rotateLane
	mov di, 50
	call rotateLane
	mov di, 52
	call rotateLane
	
	mov di, 76
	call rotateLane
	mov di, 78
	call rotateLane
	mov di, 80
	call rotateLane
	mov di, 82
	call rotateLane
	
	mov di, 106
	call rotateCarLane
	mov di, 108
	call rotateCarLane
	mov di, 110
	call rotateCarLane
	mov di, 112
	call rotateCarLane

doneRoad:
	ret
	

rotateLane:
	mov bx, [roadBuffer + di + 320]
	
	mov ax, [roadBuffer + di + 160]
	mov [roadBuffer + di + 320], ax
	
	mov ax, [roadBuffer + di]
	mov [roadBuffer + di + 160], ax
	
	mov word [roadBuffer + di], 0x0720
	
	mov ax, 0xB800
	mov es, ax
	add di, 3840
	
	mov si, di
	sub si, 160
	mov cx, 24
rotateLoopDisappear:
	mov ax, es:[si]
	mov es:[di], ax
	sub di, 160
	sub si, 160
	loop rotateLoopDisappear
	
	mov es:[di], bx
	ret
	


rotateCarLane:
	mov bx, [roadBuffer + di + 320]
	
	mov ax, [roadBuffer + di + 160]
	mov [roadBuffer + di + 320], ax
	
	mov ax, [roadBuffer + di]
	mov [roadBuffer + di + 160], ax
	
	mov word [roadBuffer + di], 0x0720

	mov ax, 0xB800
	mov es, ax
	add di, 3040
	
	mov si, di
	sub si, 160
	mov cx, 19
rotateLoopCar:
	mov ax, es:[si]
	mov es:[di], ax
	sub di, 160
	sub si, 160
	loop rotateLoopCar
	
	mov es:[di], bx
	ret


start:
	call clear
	call drawBackGround
	
gameLoop:

	mov ah, 00h
    int 1Ah       
    mov cx, dx
	
	call drawCoins
	
	mov ah, 00h
    int 1Ah       
    mov cx, dx
	
	call drawCar
	
	
	mov ah, 00h
    int 1Ah       
    mov cx, dx
	
	call drawFuel
	
	mov ah, 00h
    int 1Ah       
    mov cx, dx
	
	call animateFootPath
	
	mov ah, 00h
    int 1Ah       
    mov cx, dx
	
	call animateLines
	
	mov ah, 00h
    int 1Ah       
    mov cx, dx
	
	call animateLanes
	
jmp gameLoop
	
	exit:
	mov ax, 0x4C00
	int 0x21