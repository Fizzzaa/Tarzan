;Fizza Khalid 24L-0671
;Saba Siddiq 24L-0540


[org 0x100]

jmp entry_point

; ==========================================
;  GLOBAL VARIABLES
; ==========================================
coinTick: dw 0
carTick: dw 0
fuelTick: dw 0
footPathTick: dw 0
lineTick: dw 0
roadTick: dw 0
scoreTick: dw 0
numBuf: times 9 db 0  

nameBuffer: times 20 dw 0x0020
rollnoBuffer: times 8 dw 0x0020

roadBuffer: times 240 dw 0x0720
lane : dw 1
row : dw 19

; Strings
dev : db'Developers:',0
dev1: db 'Fizza Khalid [24L-0671]',0
dev2: db 'Saba Siddiq [24L-0540]',0
askName: db'Name: ',0
askRollno: db'Roll Number: ',0

; Enemy car positions
enemyCars: times 6 dw 0  
numEnemyCars: dw 0

; Coin positions
coinPositions: times 6 dw 0  
numCoins: dw 0

; Fuel positions
fuelPositions: times 4 dw 0
numFuel: dw 0

; Collision state
collisionDetected: db 0
crashMsg: db 'CRASH! Press any key...', 0
pausedMsg: db 'PAUSED', 0

; Game Over Reasons
gameReason: db 0        ; 0=Exit, 1=Crash, 2=Fuel
rMsgExit:  db 'Reason: YOU EXITED', 0
rMsgCrash: db 'Reason: CAR CRASHED', 0
rMsgFuel:  db 'Reason: OUT OF FUEL', 0

; ==========================================
;  MUSIC ENGINE VARIABLES
; ==========================================
oldIsr: dd 0            
musicTick: dw 1         
currentNote: dw music_data 
isMuted: db 0           

music_data:
    ; --- Fast Racing Arpeggio ---
    dw 4063, 3, 2031, 3, 2711, 3, 1355, 3
    dw 3416, 3, 1708, 3, 2031, 3, 1015, 3
    dw 4063, 3, 2031, 3, 2711, 3, 1355, 3
    dw 3416, 3, 1708, 3, 2031, 3, 1015, 3
    dw 3043, 3, 1521, 3, 2415, 3, 1207, 3
    dw 4063, 3, 2031, 3, 1521, 3, 3043, 3
    dw 0xFFFF, 0

; ==========================================
;  LOGOS
; ==========================================
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
exitGameMsg: db ' Exit Game? [Y/N] ',0 ; Aligned

insTittle1: db '----- BASIC INSTRUCTIONS -----',0
ins1: db '1] Your Car is Red',0
ins2: db '2] You Have to Avoid the Blue Cars',0
ins3: db '3] Collect Coins',0
ins4: db '4] Collect Fuel So That You Will Not Run Out of It!',0
ins5: db '5] You Can Quit The Game By Pressing Esc',0
ins6: db '6] Rash Driving is Allowed!',0

insTittle2: db '----- How To Play? -----',0
ins7: db '1] Left/Right to Move, Up/Down to shift row',0
ins8: db '2] Press P to Pause Game',0
ins9: db '3] Press M to Mute Music',0
ins10: db '4] Have Fun!',0
thnx : db 'Thanks For Playing!',0
playAgain: db 'Press A to Play Again!',0

; Game state variables
coin : dw 0
score : dw 0
fuel : dw 100
gameOver: db 0
coinTxt: db 'Coins:',0
scoreTxt: db 'Score:',0
fuelTxt: db 'Fuel:',0

; ============================================
; MUSIC ISR
; ============================================
timer_isr:
    push ax
    push bx
    push ds
    push si
    push cs
    pop ds
    cmp byte [gameOver], 1
    je mute_speaker
    cmp byte [isMuted], 1
    je mute_speaker
    dec word [musicTick]
    jnz isr_done
    mov si, [currentNote]
    lodsw
    mov bx, ax
    cmp bx, 0xFFFF
    jne play_music
    mov si, music_data
    mov [currentNote], si
    lodsw
    mov bx, ax
play_music:
    lodsw
    mov [musicTick], ax
    mov [currentNote], si
    mov al, 182
    out 43h, al
    mov ax, bx
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 3
    out 61h, al
    jmp isr_done
mute_speaker:
    in al, 61h
    and al, 0FCh
    out 61h, al
isr_done:
    pop si
    pop ds
    pop bx
    pop ax
    jmp far [cs:oldIsr]

clear:
	mov ax, 0xB800
	mov es, ax
	mov ax, 0x0720 
	mov cx, 2000
	mov di, 0
	rep stosw
	ret

; ============================================
; ENTRY POINT
; ============================================
entry_point:
    xor ax, ax
    mov es, ax
    mov ax, [es:0x1C*4]
    mov [oldIsr], ax
    mov ax, [es:0x1C*4+2]
    mov [oldIsr+2], ax
    cli
    mov word [es:0x1C*4], timer_isr
    mov [es:0x1C*4+2], cs
    sti
    jmp start_game_logic

start_game_logic:
    mov word [score], 0
    mov word [coin], 0
    mov word [fuel], 100
    mov byte [gameOver], 0
    mov byte [collisionDetected], 0
    mov word [lane], 1
    mov word [row], 19
    mov word [numEnemyCars], 0
    mov word [numCoins], 0
    mov word [numFuel], 0
    mov byte [gameReason], 0
    mov word [currentNote], music_data
    mov word [musicTick], 1
	call clear
	call introScreen
	call inputScreen
	call insScreen
	call drawBackGround
    call drawHUD            
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
    
; ============================================
; MAIN GAME LOOP
; ============================================
gameLoop:
    cmp byte [gameOver], 1
    je gameOverJump
    
    call updateScore
    call checkCollisions ; Check 1: Catch stationary collision
    cmp byte [gameOver], 1
    je gameOverJump
    
    call drawHUD
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
	call animateLanes ; Moves cars down
    
    ; *** CRITICAL FIX: CHECK COLLISION IMMEDIATELY AFTER MOVEMENT ***
    call checkCollisions 
    cmp byte [gameOver], 1
    je gameOverJump
	
	mov ah, 0x01
	int 0x16
	jz gameLoop
	
	mov ah, 0x0
	int 0x16
	
    cmp al, 'm'
    je toggleMute
    cmp al, 'M'
    je toggleMute
    cmp al, 'p'
    je pauseGame
    cmp al, 'P'
    je pauseGame
	cmp al, 27
	je escCheckGame
	
	cmp ah, 0x4D
	je rightKey
	cmp ah, 0x4B
	je leftKey
	cmp ah, 0x48
	je upKey
	cmp ah, 0x50
	je downKey
	jmp gameLoop

gameOverJump:
    jmp exitGame

toggleMute:
    xor byte [isMuted], 1
    jmp gameLoop

pauseGame:
    call SaveBoxState
    call drawPauseBox
pauseLoop:
    mov ah, 0x00
    int 0x16
    cmp al, 'p'
    je unpause
    cmp al, 'P'
    je unpause
    jmp pauseLoop
unpause:
    call RestoreBoxState
    jmp gameLoop

drawPauseBox:
    push ax
    push es
    push di
    push si
    mov ax, 0xB800
    mov es, ax
    mov di, 1990
    mov si, pausedMsg
    mov ah, 0xCF
    call txtPrintingSafe
    pop si
    pop di
    pop es
    pop ax
    ret

rightKey:
	cmp word [lane], 2
	je gameLoop
	call earaseCar
	add word [lane], 1
	call RedCar
    call checkCollisions    
    cmp byte [gameOver], 1
    je gameOverJump
	jmp gameLoop

leftKey:
	cmp word [lane], 0
	je gameLoop
	call earaseCar
	sub word [lane], 1
	call RedCar
    call checkCollisions    
    cmp byte [gameOver], 1
    je gameOverJump
	jmp gameLoop

upKey:
	cmp word [row], 1
	je gameLoop
	call earaseCar
	sub word [row], 1
	call RedCar
    call checkCollisions    
    cmp byte [gameOver], 1
    je gameOverJump
	jmp gameLoop
	
downKey:
	cmp word [row], 20
	je gameLoop
	call earaseCar
	add word [row], 1
	call RedCar
    call checkCollisions    
    cmp byte [gameOver], 1
    je gameOverJump
	jmp gameLoop
	
escCheckGame:
	call ShowexitGameMenu
	jmp gameLoop
	
; =================================================
; EXIT & CLEANUP
; =================================================
exitGame:
	call clear
    
    ; *** CRITICAL: UNHOOK ***
    

	call gameOverScreen
	
	in al, 61h
    and al, 0FCh
    out 61h, al
    xor ax, ax
    mov es, ax
    cli
    mov ax, [oldIsr]
    mov [es:0x1C*4], ax
    mov ax, [oldIsr+2]
    mov [es:0x1C*4+2], ax
    sti
	
	mov ax, 0x4C00
	int 0x21

checkSpawnClear:
    push es
    push di
    mov ax, 0xB800
    mov es, ax
    mov ax, [es:di]
    cmp ax, 0x0720
    pop di
    pop es
    ret

drawCoins:
	mov ax, cx
    sub ax, [coinTick]
    cmp ax, 55
    jb returnCoins
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
        call checkSpawnClear
        jne returnCoins
        mov word [coinPositions], 0      
		jmp printingCoin
	coinLine2:
		mov di, 78
        call checkSpawnClear
        jne returnCoins
        mov word [coinPositions], 1      
		jmp printingCoin
	coinLine3:
		mov di, 108
        call checkSpawnClear
        jne returnCoins
        mov word [coinPositions], 2      
printingCoin:
    mov word [coinPositions + 2], 0      
    mov word [numCoins], 1
	mov ax,0x6E20
	stosw
	mov ax,0xEE24
	stosw
	mov ax,0x6E20
	stosw
returnCoins:
		ret
		
drawCar:
	mov ax, cx
    sub ax, [carTick]
    cmp ax, 35
    jb returnCar
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
        call checkSpawnClear
        jne returnCar
        mov word [enemyCars], 0          
		call BlueCar
		jmp storeCarPos
	carLine2:
		mov di, 76
        call checkSpawnClear
        jne returnCar
        mov word [enemyCars], 1          
		call BlueCar
		jmp storeCarPos
	carLine3:
		mov di, 106
        call checkSpawnClear
        jne returnCar
        mov word [enemyCars], 2          
		call BlueCar
storeCarPos:
    mov word [enemyCars + 2], 0          
    mov word [numEnemyCars], 1
returnCar:
ret

drawFuel:
	mov ax, cx
    sub ax, [fuelTick]
    cmp ax, 120
    jb returnFuel
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
        call checkSpawnClear
        jne returnFuel
        mov word [fuelPositions], 0      
		jmp printingFuel
	fuelLine2:
		mov di, 78
        call checkSpawnClear
        jne returnFuel
        mov word [fuelPositions], 1      
		jmp printingFuel
	fuelLine3:
		mov di, 108
        call checkSpawnClear
        jne returnFuel
        mov word [fuelPositions], 2      
printingFuel:
    mov word [fuelPositions + 2], 0      
    mov word [numFuel], 1
	mov ax,0x4E20
	stosw
	mov ax,0x4E93
	stosw
	mov ax,0x4E20
	stosw
returnFuel:
		ret

drawHUD:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    mov ax, 0xB800
    mov es, ax
    mov di, 2    
    mov si, scoreTxt
    mov ah, 0x2E  
    call txtPrintingSafe
    mov ax, [score]
    mov si, numBuf
    call number_to_string
    mov di, 162  
    mov si, numBuf
    mov ah, 0x2F  
    call txtPrintingSafe
    mov di, 482  
    mov si, coinTxt
    mov ah, 0x2E  
    call txtPrintingSafe
    mov ax, [coin]
    mov si, numBuf
    call number_to_string
    mov di, 642  
    mov si, numBuf
    mov ah, 0x2F  
    call txtPrintingSafe
    mov di, 962  
    mov si, fuelTxt
    mov ah, 0x2E  
    call txtPrintingSafe
    mov ax, [fuel]
    mov si, numBuf
    call number_to_string
    mov di, 1122  
    mov si, numBuf
    mov ah, 0x2F  
    call txtPrintingSafe
    mov di, 1282  
    mov cx, 8     
    mov ax, [fuel]
    mov bl, 13    
drawFuelBar:
    cmp ax, 0
    jle fuelBarEmpty
    push ax
    mov ax, 0x24DB  
    stosw
    pop ax
    sub ax, 13
    loop drawFuelBar
    jmp fuelBarDone
fuelBarEmpty:
    mov ax, 0x20B0  
    stosw
    loop fuelBarEmpty
fuelBarDone:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

updateScore:
    push ax
    push cx
    mov ah, 00h
    int 1Ah
    mov cx, dx
    mov ax, cx
    sub ax, [scoreTick]
    cmp ax, 18      
    jb skipScoreUpdate
    mov [scoreTick], cx
    add word [score], 10
    cmp word [fuel], 0
    je fuelEmpty
    sub word [fuel], 1
    jmp skipScoreUpdate
fuelEmpty:
    mov byte [gameOver], 1
    mov byte [gameReason], 2 ; 2 = Fuel
skipScoreUpdate:
    pop cx
    pop ax
    ret

checkCollisions:
    push ax
    push bx
    push cx
    push dx
    push si
    mov ax, [lane]
    mov bx, 15
    mul bx
    add ax, 16          
    mov [playerLeft], ax
    add ax, 3           
    mov [playerRight], ax
    mov ax, [row]
    add ax, 2           
    mov [playerTop], ax
    add ax, 4           
    mov [playerBottom], ax
    mov cx, [numEnemyCars]
    cmp cx, 0
    je checkCollisions_Coin
    mov si, enemyCars
checkCarLoop:
    push cx
    mov ax, [si]        
    mov bx, [si + 2]    
    cmp bx, 0
    jl noCarCollision
    cmp bx, 24
    jg noCarCollision
    
    ; *** FIXED: Logic Check ***
    ; If lanes are equal, proceed. If logic says lanes diff, we skip
    cmp ax, [lane]
    jne noCarCollision

    push ax
    mov cx, 15
    mul cx
    add ax, 16          
    mov [enemyLeft], ax
    add ax, 3           
    mov [enemyRight], ax
    pop ax
    
    ; *** FIXED: Hitbox Height Calculation ***
    ; Visual car is 4 rows high.
    ; Enemy Top = bx
    ; Enemy Bottom = bx + 3
    mov ax, bx          
    mov [enemyTop], ax
    add ax, 3           
    mov [enemyBottom], ax
    
    mov ax, [playerLeft]
    cmp ax, [enemyRight]
    jg noCarCollision
    mov ax, [playerRight]
    cmp ax, [enemyLeft]
    jl noCarCollision
    mov ax, [playerTop]
    cmp ax, [enemyBottom]
    jg noCarCollision
    mov ax, [playerBottom]
    cmp ax, [enemyTop]
    jl noCarCollision
    
    mov byte [collisionDetected], 1
    call freezeOnCollision
    mov byte [gameOver], 1
    mov byte [gameReason], 1 ; 1 = Crash
    jmp collisionDone
noCarCollision:
    add si, 4         
    pop cx
    loop checkCarLoop

checkCollisions_Coin:
    mov cx, [numCoins]
    cmp cx, 0
    je checkCollisions_Fuel
    mov si, coinPositions
checkCoinLoop:
    push cx
    mov ax, [si]      
    mov bx, [si + 2]  
    cmp bx, -1
    je noCoinCollision
    cmp ax, [lane]
    jne noCoinCollision
    mov cx, [row]
    cmp bx, cx
    jl noCoinCollision
    add cx, 3
    cmp bx, cx
    jg noCoinCollision
    add word [coin], 1
    add word [score], 50
    mov word [si + 2], -1
    call coinSound
noCoinCollision:
    add si, 4
    pop cx
    loop checkCoinLoop

checkCollisions_Fuel:
    mov cx, [numFuel]
    cmp cx, 0
    je collisionCheckDone
    mov si, fuelPositions
checkFuelLoop:
    push cx
    mov ax, [si]      
    mov bx, [si + 2]  
    cmp bx, -1
    je noFuelCollision
    cmp ax, [lane]
    jne noFuelCollision
    mov cx, [row]
    cmp bx, cx
    jl noFuelCollision
    add cx, 3
    cmp bx, cx
    jg noFuelCollision
    add word [fuel], 25
    cmp word [fuel], 100
    jle fuelOk
    mov word [fuel], 100
fuelOk:
    add word [score], 25
    mov word [si + 2], -1
    call fuelSound
noFuelCollision:
    add si, 4
    pop cx
    loop checkFuelLoop

collisionCheckDone:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    jmp collisionReturn

collisionDone:
    pop cx            
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
collisionReturn:
    ret

playerLeft: dw 0
playerRight: dw 0
playerTop: dw 0
playerBottom: dw 0
enemyLeft: dw 0
enemyRight: dw 0
enemyTop: dw 0
enemyBottom: dw 0

freezeOnCollision:
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    call crashSound
    mov cx, 3
flashLoop:
    push cx
    call flashPlayerCar
    mov bx, 0x1FFF
flashDelay1:
    dec bx
    jnz flashDelay1
    call RedCar
    mov bx, 0x1FFF
flashDelay2:
    dec bx
    jnz flashDelay2
    pop cx
    loop flashLoop
    call drawCrashBox
waitForKeyFreeze:
    mov ah, 0x01
    int 0x16
    jz waitForKeyFreeze
    mov ah, 0x00
    int 0x16
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

flashPlayerCar:
    push ax
    push di
    push cx
    mov ax, 0xB800
    mov es, ax
    mov di, [row]
    add di, 1
    mov ax, 80
    mul di
    mov cx, [lane]
    add cx, 1
    add ax, 8
flashAdding:
    add ax, 15
    loop flashAdding
    mov di, ax
    shl di, 1
    mov ax, 0xCFDB      
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
    pop cx
    pop di
    pop ax
    ret

drawCrashBox:
    push ax
    push cx
    push di
    push si
    mov ax, 0xB800
    mov es, ax
    mov di, 160 * 10 + 50   
    mov cx, 5               
drawCrashBoxBg:
    push cx
    push di
    mov cx, 30              
    mov ax, 0x4C20          
drawCrashBoxRow:
    stosw
    loop drawCrashBoxRow
    pop di
    add di, 160             
    pop cx
    loop drawCrashBoxBg
    mov di, 160 * 10 + 50
    mov cx, 30
    mov ax, 0x4CCD          
drawTopBorder:
    stosw
    loop drawTopBorder
    mov di, 160 * 14 + 50
    mov cx, 30
    mov ax, 0x4CCD          
drawBottomBorder:
    stosw
    loop drawBottomBorder
    mov di, 160 * 12 + 56   
    mov si, crashMsg
    mov ah, 0x4F            
    call txtPrintingSafe
    pop si
    pop di
    pop cx
    pop ax
    ret

coinSound:
    push ax
    push cx
    mov al, 182
    out 43h, al
    mov ax, 2000
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 3
    out 61h, al
    mov cx, 1000
coinSoundDelay:
    loop coinSoundDelay
    in al, 61h
    and al, 0FCh
    out 61h, al
    pop cx
    pop ax
    ret

fuelSound:
    push ax
    push cx
    mov al, 182
    out 43h, al
    mov ax, 1500
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 3
    out 61h, al
    mov cx, 1500
fuelSoundDelay:
    loop fuelSoundDelay
    in al, 61h
    and al, 0FCh
    out 61h, al
    pop cx
    pop ax
    ret

crashSound:
    push ax
    push cx
    mov al, 182
    out 43h, al
    mov ax, 300         
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 3
    out 61h, al
    mov cx, 0xFFFF
crashSoundDelay:
    loop crashSoundDelay
    mov ax, 200
    out 42h, al
    mov al, ah
    out 42h, al
    mov cx, 0xFFFF
crashSoundDelay2:
    loop crashSoundDelay2
    in al, 61h
    and al, 0FCh
    out 61h, al
    pop cx
    pop ax
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
		je callRedCar
		mov si, 94
		jmp drawLine
	
callRedCar:
call RedCar
ret
	
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

animateFootPath:
	mov ax, cx
    sub ax, [footPathTick]
    cmp ax, 2 
    jb returnFootpath
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
	je returnFootpath
	mov bx, 1
	mov cx, 25
	mov si, 124
	mov di, 126
	jmp animatingFootPath
returnFootpath:
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
    jb returnLines
    mov [lineTick], cx
	mov di,64
	call roatate
	mov di, 94
	call roatate
returnLines:
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
    call updateObjectPositions
	cmp word [lane], 1
	je carLane1_
	cmp word [lane], 2
	je carLane2_
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
carLane1_:
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
carLane2_:
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

updateObjectPositions:
    push ax
    push cx
    push si
    mov cx, [numEnemyCars]
    cmp cx, 0
    je updateCoins
    mov si, enemyCars
updateEnemyLoop:
    add word [si + 2], 1    
    cmp word [si + 2], 25   
    jl nextEnemy
    mov word [si + 2], 0    
nextEnemy:
    add si, 4
    loop updateEnemyLoop
updateCoins:
    mov cx, [numCoins]
    cmp cx, 0
    je updateFuelPos
    mov si, coinPositions
updateCoinLoop:
    cmp word [si + 2], -1   
    je nextCoin
    add word [si + 2], 1
    cmp word [si + 2], 25
    jl nextCoin
    mov word [si + 2], -1   
nextCoin:
    add si, 4
    loop updateCoinLoop
updateFuelPos:
    mov cx, [numFuel]
    cmp cx, 0
    je updateDone
    mov si, fuelPositions
updateFuelLoop:
    cmp word [si + 2], -1
    je nextFuelItem
    add word [si + 2], 1
    cmp word [si + 2], 25
    jl nextFuelItem
    mov word [si + 2], -1
nextFuelItem:
    add si, 4
    loop updateFuelLoop
updateDone:
    pop si
    pop cx
    pop ax
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

ShowexitGameMenu:
    call SaveBoxState       
    call DrawexitGameBox        
WaitForKey:
    mov ah, 0x00
    int 0x16                
    cmp al, 27              
    je DismissMenu
    or al, 0x20             
    cmp al, 'n'
    je DismissMenu
    cmp al, 'y'
    je exitGameToDos            
    jmp WaitForKey
DismissMenu:
    call RestoreBoxState    
    ret                     
exitGameToDos:
    ; When exiting via ESC menu, we mark as gameOver
    ; and let the main loop handle the cleanup
    mov byte [gameOver], 1
    mov byte [gameReason], 0 ; Reason: Exit
    ret
    
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

DrawexitGameBox:
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
    mov si, exitGameMsg
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
	je returnTxt
	stosw
	add si, 1
	jmp txtPrinting
returnTxt:
    ret

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
	je exitGameCheckInput
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
exitGameCheckInput:
	call ShowexitGameMenu
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
	call ShowexitGameMenu
	jmp escKey
nextScr:	
	call clear
	popa
	ret

gameOverScreen:
    in al, 61h
    and al, 0FCh
    out 61h, al
    cmp byte [collisionDetected], 1
    je skipCrashSoundGameOver
    call crashSound
skipCrashSoundGameOver:
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
	
    ; --- START REASON PRINTING LOGIC ---
    mov di, 160*12 + 58
    cmp byte [gameReason], 0
    je printReasonExit
    cmp byte [gameReason], 1
    je printReasonCrash
    cmp byte [gameReason], 2
    je printReasonFuel
    jmp printStats
    
printReasonExit:
    mov si, rMsgExit
    mov ah, 0x0E ; Yellow
    call txtPrintingSafe
    jmp printStats
printReasonCrash:
    mov si, rMsgCrash
    mov ah, 0x0C ; Red
    call txtPrintingSafe
    jmp printStats
printReasonFuel:
    mov si, rMsgFuel
    mov ah, 0x0C ; Red
    call txtPrintingSafe
    ; -----------------------------------

printStats:
	mov di, 160*13 + 58 
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
    mov si, numBuf  
    call number_to_string
	mov si, numBuf
	mov ah, 0x0F
	call txtPrintingSafe
	mov di, 160*17 + 130 
	mov si, coinTxt
	mov ah, 0x0D
	call txtPrintingSafe
	mov ax, [coin]          
    mov si, numBuf  
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
	je restartGame
    cmp al, 'A'
    je restartGame
    cmp al, 27 ; ESC to quit
    je exitGame_from_gameover
	ret

exitGame_from_gameover:
    jmp exitGame

restartGame:
    jmp start_game_logic

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
Car.asm
Displaying Car.asm. 
Phase 6 - Music
Abdul Moeed Maan BSCS 2023 FAST NU LHR
•
Nov 28 (Edited Nov 28)
Due Dec 5
COAL Semester Project - Phase6
Google Docs

Class comments
