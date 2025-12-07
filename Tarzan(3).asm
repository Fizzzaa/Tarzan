[org 0x100]

jmp start
coinTick: dw 0
carTick: dw 0
fuelTick: dw 0
footPathTick: dw 0
lineTick: dw 0
roadTick: dw 0

roadBuffer: times 240 dw 0x0720
lane : dw 1
row : dw 19

startMsg: db 'Press Any Key To Start!',0
txtBoxBuffer: times 100 dw 0
exitMsg: dw 'Want to Exit (Y/N)?',0
clear:
	mov ax, 0xB800
	mov es, ax
	
	mov ax, 0x0720 
	mov cx, 2000
	mov di, 0
	rep stosw
	ret

earaseCar:	
		mov di, [row]
		add di, 1
		mov ax, 80
		mul di
		mov cx, [lane]
		add cx, 1
		add ax, 8
adding:
		add ax, 15
		loop adding
		mov di, ax
		
		shl ax, 1
		mov di,ax
		
		mov ax,0x0020
		stosw
		stosw
		stosw
		stosw
		
		add di, 152
		stosw
		stosw
		stosw
		stosw
		
		add di, 152
		stosw
		stosw
		stosw
		stosw
		
		add di, 152
		stosw
		stosw
		stosw
		stosw
		
		ret


RedCar:	
		mov di, [row]
		add di, 1
		mov al, 80
		mul di
		mov cx, [lane]
		add cx, 1
		add ax, 8
adding2:
		add ax, 15
		loop adding2
		mov di, ax
		
		shl ax, 1
		mov di,ax
		
		mov ax,0x43DC
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
		xor ah, 0x30   
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
		je RedCar
		mov si, 94
		jmp drawLine
	
	call RedCar

		
		
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
    
    push ax  
    push dx
    
    mov ax, 160        
    mul word [row]  
    add di, ax         
    
    pop dx             
    pop ax
    push di             
    mov si, di
    sub si, 160
    mov cx, [row]   
    
rotateLoopCar:
    mov ax, es:[si]
    mov es:[di], ax
    sub di, 160
    sub si, 160
    loop rotateLoopCar
    
    mov es:[di], bx

    pop di     
    push di    
    push cx             
    push si

    mov cx, 24          
    sub cx, [row]
    sub cx, 5           
    cmp cx, 0           
    jle skipBottomLoop

    push ax             
    push dx
    
    mov ax, 160
    mov dx, 24
    sub dx, [row]    
    mul dx              
    add di, ax          
    
    pop dx
    pop ax

    mov si, di
    sub si, 160

bottomScrollLoop:
    mov ax, es:[si]     
    mov es:[di], ax     
    sub di, 160         
    sub si, 160
    loop bottomScrollLoop

skipBottomLoop:
    pop si
    pop cx
    
    pop di       
    mov word es:[di + 800], 0x0020 
    ret

ShowExitMenu:
    call SaveBoxState       
    call DrawExitBox        
WaitForKey:
    mov ah, 0x00
    int 0x16                
    cmp al, 27              
    je DismissMenu
    
    or al, 0x20             
    cmp al, 'n'
    je DismissMenu
    
    cmp al, 'y'
    je ExitToDos            
    jmp WaitForKey

DismissMenu:
    call RestoreBoxState    
    ret                     
ExitToDos:
    jmp exit                
SaveBoxState:
    push ax
    push cx
    push si
    push di
    push ds
    push es

    mov ax, 0xB800
    mov ds, ax              
    mov si, 1660            
    mov ax, cs
    mov es, ax              
    mov di, txtBoxBuffer    

    mov cx, 5               
save_loop:
    push cx
    mov cx, 20              
    rep movsw
    
    add si, 120             
    pop cx
    loop save_loop

    pop es
    pop ds
    pop di
    pop si
    pop cx
    pop ax
    ret

RestoreBoxState:
    push ax
    push cx
    push si
    push di
    push ds
    push es

    mov ax, cs
    mov ds, ax              
    mov si, txtBoxBuffer    
    
    mov ax, 0xB800
    mov es, ax              
    mov di, 1660            

    mov cx, 5               
restore_loop:
    push cx
    mov cx, 20
    rep movsw
    
    add di, 120             
	
    pop cx
    loop restore_loop

    pop es
    pop ds
    pop di
    pop si
    pop cx
    pop ax
    ret

DrawExitBox:
    push ax
    push cx
    push di
    push si
    push es
    
    mov ax, 0xB800
    mov es, ax
    mov di, 1660
    mov cx, 5
    
draw_box_bg:                
    push cx
    mov cx, 20
    mov ax, 0x9F20          
    rep stosw
    add di, 120
    pop cx
    loop draw_box_bg

    mov di, 1982            
    mov si, exitMsg
    mov ah, 0x9E            
    call txtPrintingSafe
    
    pop es
    pop si
    pop di
    pop cx
    pop ax
    ret

txtPrintingSafe:
    lodsb                   
    cmp al, 0               
    je done_print
    stosw                   
    jmp txtPrintingSafe
done_print:
    ret

txtPrinting:
	mov bx, [si]
	mov al, bl
	cmp al, 0
	je return
	stosw
	mov byte [si], 0x20
	add si, 1
	jmp txtPrinting

start:
	call clear
	call drawBackGround
	mov si, startMsg
	mov ah, 0x8E
	mov di, 2458
	call txtPrinting
	mov ah, 0x00
	int 0x16
	mov si, startMsg
	mov ah, 0x8E
	mov di, 2458
	call txtPrinting
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
	
	mov ah, 0x01
	int 0x16
	jz gameLoop
	
	mov ah, 0x0
	int 0x16
	cmp al, 0
	jne escCheck
	
	cmp ah, 0x4D
	je rightKey
	cmp ah, 0x4B
	je leftKey
	cmp ah, 0x48
	je upKey
	cmp ah, 0x50
	je downKey
	jne gameLoop
	
rightKey:
	cmp word [lane], 2
	je gameLoop
	call earaseCar
	add word [lane], 1
	call RedCar
	jmp gameLoop

leftKey:
	cmp word [lane], 0
	je gameLoop
	call earaseCar
	sub word [lane], 1
	call RedCar
	jmp gameLoop

upKey:
	cmp word [row], 1
	je gameLoop
	call earaseCar
	sub word [row], 1
	call RedCar
	jmp gameLoop
	
downKey:
	cmp word [row], 20
	je gameLoop
	call earaseCar
	add word [row], 1
	call RedCar
	jmp gameLoop
	
escCheck:
	cmp al, 27
	jne gameLoop

	call ShowExitMenu
	
jmp gameLoop
	
	exit:
	mov ax, 0x4C00
	int 0x21
Car.asm
Displaying Car.asm.
Phase 3 - Hardware Interrupts
Abdul Moeed Maan BSCS 2023 FAST NU LHR
•
Nov 17 (Edited Nov 17)
Due Nov 23, 10:59 AM
COAL Semester Project - Phase3
Google Docs

Class comments
