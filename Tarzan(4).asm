[org 0x100]

jmp start
coinTick: dw 0
carTick: dw 0
fuelTick: dw 0
footPathTick: dw 0
lineTick: dw 0
roadTick: dw 0
numBuf: times 9 db 0  

nameBuffer: times 20 dw 0x0020
rollnoBuffer: times 8 dw 0x0020

roadBuffer: times 240 dw 0x0720
lane : dw 1
row : dw 19
dev : db'Developers:',0
dev1: db 'Fizza Khalid [24L-0671]',0
dev2: db 'Saba Siddiq [24L-0540]',0
askName: db'Name: ',0
askRollno: db'Roll Number: ',0
tarzanLogo:
dw 0xDB16,0xDB16,0xDB16,0xDB16,0xDB16, 00000h,00000h, 0xDB16,0xDB16,0xDB16, 00000h,00000h
dw 0xDB16,0xDB16,0xDB16,0xDB16, 00000h,00000h, 0xDB16,0xDB16,0xDB16,0xDB16,0xDB16, 00000h,00000h
dw 0xDB16,0xDB16,0xDB16, 00000h,00000h, 0xDB16, 00000h,00000h,00000h, 0xDB16   

dw 00000h,00000h, 0xDB16, 00000h,00000h, 00000h, 0xDB16, 00000h,00000h,00000h
dw 0xDB16, 00000h, 0xDB16, 00000h,00000h, 00000h, 0xDB16, 00000h,00000h,00000h
dw 00000h,00000h, 0xDB16, 00000h,00000h, 0xDB16, 00000h,00000h,00000h, 0xDB16
dw 00000h, 0xDB16, 0xDB16, 00000h, 0xDB16

dw 00000h,00000h, 0xDB16, 00000h,00000h, 00000h, 0xDB16, 0xDB16, 0xDB16, 0xDB16
dw 0xDB16, 00000h, 0xDB16, 0xDB16, 0xDB16, 0xDB16, 00000h,00000h,00000h,00000h
dw 0xDB16, 00000h,00000h,00000h, 0xDB16, 0xDB16, 0xDB16, 0xDB16, 0xDB16, 00000h
dw 0xDB16, 00000h, 0xDB16, 00000h, 0xDB16

dw 00000h,00000h, 0xDB16, 00000h,00000h, 00000h, 0xDB16, 00000h,00000h,00000h
dw 0xDB16, 00000h, 0xDB16, 00000h, 0xDB16, 00000h, 00000h,00000h,00000h, 0xDB16
dw 00000h,00000h,00000h,00000h, 0xDB16, 00000h,00000h,00000h, 0xDB16, 00000h
dw 0xDB16, 00000h,00000h, 0xDB16, 0xDB16

dw 00000h,00000h, 0xDB16, 00000h,00000h, 00000h, 0xDB16, 00000h,00000h,00000h
dw 0xDB16, 00000h, 0xDB16, 00000h,00000h,00000h, 0xDB16, 00000h, 0xDB16, 0xDB16
dw 0xDB16, 0xDB16, 0xDB16, 00000h, 0xDB16, 00000h,00000h,00000h, 0xDB16, 00000h
dw 0xDB16, 00000h,00000h,00000h, 0xDB16

gameover_logo:

db 0DBh,05h, 0DBh,05h, 0DBh,05h, 00h,00h
db 0DBh,05h, 0DBh,05h, 0DBh,05h, 00h,00h
db 0DBh,05h, 00h,00h, 0DBh,05h, 00h,00h
db 0DBh,05h, 0DBh,05h, 0DBh,05h, 00h,00h
db 00h,00h, 00h,00h
db 0DBh,0Dh, 0DBh,0Dh, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 0DBh,0Dh, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 0DBh,0Dh, 00h,00h, 00h,00h, 00h,00h

db 0DBh,05h, 00h,00h, 00h,00h, 00h,00h
db 0DBh,05h, 00h,00h, 0DBh,05h, 00h,00h
db 0DBh,05h, 0DBh,05h, 0DBh,05h, 00h,00h
db 0DBh,05h, 00h,00h, 00h,00h, 00h,00h
db 00h,00h, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 00h,00h, 00h,00h, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h, 00h,00h

db 0DBh,05h, 00h,00h, 0DBh,05h, 00h,00h
db 0DBh,05h, 0DBh,05h, 0DBh,05h, 00h,00h
db 0DBh,05h, 00h,00h, 0DBh,05h, 00h,00h
db 0DBh,05h, 0DBh,05h, 0DBh,05h, 00h,00h
db 00h,00h, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 0DBh,0Dh, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 0DBh,0Dh, 00h,00h, 00h,00h, 00h,00h

db 0DBh,05h, 00h,00h, 0DBh,05h, 00h,00h
db 0DBh,05h, 00h,00h, 0DBh,05h, 00h,00h
db 0DBh,05h, 00h,00h, 0DBh,05h, 00h,00h
db 0DBh,05h, 00h,00h, 00h,00h, 00h,00h
db 00h,00h, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 00h,00h, 00h,00h, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h, 00h,00h

db 0DBh,05h, 0DBh,05h, 0DBh,05h, 00h,00h
db 0DBh,05h, 00h,00h, 0DBh,05h, 00h,00h
db 0DBh,05h, 00h,00h, 0DBh,05h, 00h,00h
db 0DBh,05h, 0DBh,05h, 0DBh,05h, 00h,00h
db 00h,00h, 00h,00h
db 0DBh,0Dh, 0DBh,0Dh, 0DBh,0Dh, 00h,00h
db 00h,00h, 0DBh,0Dh, 00h,00h, 00h,00h
db 0DBh,0Dh, 0DBh,0Dh, 0DBh,0Dh, 00h,00h
db 0DBh,0Dh, 00h,00h, 0DBh,0Dh, 00h,00h, 00h,00h


startMsg: db 'Press Any Key To Start!',0
txtBoxBuffer: times 100 dw 0
exitMsg: dw 'Want to Exit[Y/N]?',0


insTittle1: db '----- BASIC INSTRUCTIONS -----',0
ins1: db '1] Your Car is Red',0
ins2: db '2] You Have to Avoid the Blue Cars',0
ins3: db '3] Collect Coins',0
ins4: db '4] Collect Fuel So That You Will Not Run Out of It!',0
ins5: db '5] You Can Quit The Game By Pressing Esc',0
ins6: db '6] Rash Driving is Allowed!',0

insTittle2: db '----- How To Play? -----',0
ins7: db '1] Left Arrow Key For Moving to the Left Lane',0
ins8: db '2] Right Arrow Key For Moving to the Right Lane',0
ins9: db '3] UP Arrow Key For Moving 1 Row Up in the Same Lane',0
ins10: db '4] Down Arrow Key For Moving 1 Row Down in the Same Lane',0
thnx : db 'Thanks For Playing!',0
playAgain: db 'Press A to Play Again!',0
coin : dw 0
score : dw 0
coinTxt: db 'Coins: ',0
scoreTxt: db'Score: ',0

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
    mov ax, 0xDD20          
    rep stosw
    add di, 120
    pop cx
    loop draw_box_bg

    mov di, 1982            
    mov si, exitMsg
    mov ah, 0xDF            
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
	add si, 1
	jmp txtPrinting



delay:
	push cx
	mov bx,0xFFF
delayLoop:
	mov cx, 0xFFFF
	rep
	sub bx, 1
	cmp bx, 0
	jne delayLoop
	pop cx
	ret

introScreen:
mov ax, 0x0D17    
    mov di, 0
    mov cx, 80    

desinging:
    stosw            
    add di, 158      
    stosw            
    add di, 3518     
    stosw            
    add di, 158      
    stosw            
    
    sub di, 3840     
    
    call delay
    loop desinging	
	

    mov si, tarzanLogo      
    mov di, 160*7 + 44    
    mov dx, 5             

row_loop:
    push dx
    mov cx, 35             

col_loop:
	call delay
    lodsw                
    or al, al            
    jz transparent
    stosw                
    jmp next
transparent:
    inc di               
    inc di               
next:
    loop col_loop

    add di, 160 - 70       
    pop dx
    dec dx
    jnz row_loop

	mov di, 2320 
	mov si, dev
	mov ah, 0x0B
	call txtPrintingSafe
	
	
	mov di, 2500 
	mov si, dev1
	mov ah, 0x0D
	call txtPrintingSafe
	
	mov di, 2660 
	mov si, dev2
	mov ah, 0x0D
	call txtPrintingSafe
	
	mov di, 3310 
	mov si, startMsg
	mov ah, 0x8B
	call txtPrintingSafe
	
	mov ah, 0x00
	int 0x16
	call clear
	ret

inputScreen:
	pusha
	mov si, askName
	mov di, 1650
	mov ah, 0x0D
	call txtPrinting
	
	add di, 2
	mov si, nameBuffer
	mov cx, 20
	call GetInputString
	
	mov si, askRollno
	mov di, 1970 
	mov ah, 0x0D
	call txtPrinting
	add di, 2
	mov si, rollnoBuffer
	mov cx, 8
	call GetInputString
	
	call clear
	popa
	ret

GetInputString:
    push ax
    push bx             
    
    mov bx, di          

input_loop:
    mov ah, 00h
    int 16h
	
    cmp al, 0Dh
    je  end_input
	cmp al, 27
	je exitCheck
	
    cmp al, 08h
    je  do_backspace

    cmp cx, 0
    je  input_loop

  
    mov [si], al 
    inc si       

    mov ah, 0Fh   
    mov es:[di], ax 
    add di, 2   
    
    dec cx    
    jmp input_loop

do_backspace:
    cmp di, bx 
    je  input_loop

    dec si
    mov byte [si], 0    
    sub di, 2           
    mov word es:[di], 0720h 
    
    inc cx              
    jmp input_loop

exitCheck:
	call ShowExitMenu
	jmp input_loop

end_input:
    mov byte [si], 0    
    pop bx
    pop ax
    ret

insScreen:
	pusha
	
	
	mov di, 368 + 160
	mov ah, 0x0D
	mov si, insTittle1
	call txtPrintingSafe
	
	mov di, 650 + 160
	mov ah, 0x0F
	mov si, ins1
	call txtPrintingSafe
	
	mov di, 810 + 160
	mov ah, 0x0F
	mov si, ins2
	call txtPrintingSafe
	
	mov di, 970 + 160
	mov ah, 0x0F
	mov si, ins3
	call txtPrintingSafe
	
	mov di, 1130 + 160
	mov ah, 0x0F
	mov si, ins4
	call txtPrintingSafe
	
	mov di, 1290 + 160
	mov ah, 0x0F
	mov si, ins5
	call txtPrintingSafe
	
	mov di, 1450 + 160
	mov ah, 0x0F
	mov si, ins6
	call txtPrintingSafe
	
	mov di, 1814 + 160
	mov ah, 0x0D
	mov si, insTittle2
	call txtPrintingSafe
	
	mov di, 2090 + 160
	mov ah, 0x0F
	mov si, ins7
	call txtPrintingSafe
	
	mov di, 2250 + 160
	mov ah, 0x0F
	mov si, ins8
	call txtPrintingSafe
	
	mov di, 2410 + 160
	mov ah, 0x0F
	mov si, ins9
	call txtPrintingSafe
	
	mov di, 2570 + 160
	mov ah, 0x0F
	mov si, ins10
	call txtPrintingSafe
	
	mov di, 3310 
	mov si, startMsg
	mov ah, 0x8B
	call txtPrintingSafe
	
	
escKey:
	mov ax, 0x00
	int 0x16
	cmp al, 27
	jne nextScr
	
	call ShowExitMenu
	jmp escKey
	
nextScr:	
	call clear
	popa
	ret

gameOverScreen:
	
	mov si, gameover_logo 
    mov di, 160*6 + 44  
    mov dx, 5         

row_loop1:
    push dx
    mov cx, 35        

col_loop1:
	call delay
    lodsb             
    mov ah, [si]      
    inc si
    or al, al         
    jz transparent1
    stosw             
    jmp next1
transparent1:
    inc di            
    inc di            
next1:
    loop col_loop1

    add di, 160 - 70  
    pop dx
    dec dx
    jnz row_loop1
	
	mov di, 378 + 320
	mov si, thnx
	mov ah, 0x0D
	call txtPrintingSafe
	
	mov di, 160*12 + 58 
	mov si, nameBuffer
	mov ah, 0x0F
	call txtPrintingSafe
	
	mov di, 160*14 + 72 
	mov si, rollnoBuffer
	mov ah, 0x0F
	call txtPrintingSafe
	
	mov di, 160*17 + 12 
	mov si, scoreTxt
	mov ah, 0x0D
	call txtPrintingSafe
	
	mov ax, [score]          
    mov si,  numBuf  
    call number_to_string
	
	
	mov si, numBuf
	mov ah, 0x0F
	call txtPrintingSafe
	
	mov di, 160*17 + 130 
	mov si, coinTxt
	mov ah, 0x0D
	call txtPrintingSafe
	
	mov ax, [score]          
    mov si,  numBuf  
    call number_to_string
	
	
	mov si, numBuf
	mov ah, 0x0F
	call txtPrintingSafe
	
	mov di, 160*21 + 110 
	mov si, playAgain
	mov ah, 0x8B
	call txtPrintingSafe
	
	mov ah,0x00
	int 0x16
	
	cmp al, 'a'
	je start
	
	ret

number_to_string:
    push ax
    push bx
    push cx
    push dx
    push si

    mov cx, 0    
    mov bx, 10   

divide_loop:
    xor dx, dx   
    div bx       
    push dx      
    inc cx       
    
    test ax, ax       
    jnz divide_loop   

store_loop:
    pop dx            
    add dl, '0'       
    mov [si], dl      
    inc si            
    loop store_loop   

    mov byte [si], 0 
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret


start:
	call clear
	call introScreen
	call inputScreen
	
	call insScreen
	
	call drawBackGround
	mov si, startMsg
	mov ah, 0x8E
	mov di, 2458
	call txtPrinting
	mov ah, 0x00
	int 0x16
	mov si, startMsg
	mov ah, 0x00
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
	call clear
	call gameOverScreen
	
	mov ax, 0x4C00
	int 0x21
Car.asm
Displaying Car.asm. 
Phase 4 - Software Interrupts
Abdul Moeed Maan BSCS 2023 FAST NU LHR
•
Nov 17
Due Nov 23, 10:59 AM
COAL Semester Project - Phase4
Google Docs

Class comments
