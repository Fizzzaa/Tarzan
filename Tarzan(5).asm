[org 0x100]

jmp start
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
dev : db'Developers:',0
dev1: db 'Fizza Khalid [24L-0671]',0
dev2: db 'Saba Siddiq [24L-0540]',0
askName: db'Name: ',0
askRollno: db'Roll Number: ',0

; Enemy car positions (lane, row) - up to 3 cars
enemyCars: times 6 dw 0  ; [lane0, row0, lane1, row1, lane2, row2]
numEnemyCars: dw 0

; Coin positions (lane, row) - up to 3 coins
coinPositions: times 6 dw 0  ; [lane0, row0, lane1, row1, lane2, row2]
numCoins: dw 0

; Fuel positions (lane, row) - up to 2 fuel
fuelPositions: times 4 dw 0
numFuel: dw 0

; Collision state
collisionDetected: db 0
crashMsg: db 'CRASH! Press any key...', 0

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

; Game state variables
coin : dw 0
score : dw 0
fuel : dw 100
gameOver: db 0
coinTxt: db 'Coins:',0
scoreTxt: db 'Score:',0
fuelTxt: db 'Fuel:',0
hudLine: db '----------------',0

clear:
	mov ax, 0xB800
	mov es, ax
	
	mov ax, 0x0720 
	mov cx, 2000
	mov di, 0
	rep stosw
	ret

; ============================================
; HUD DISPLAY IN STATIC GRASS AREA
; ============================================
drawHUD:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    
    mov ax, 0xB800
    mov es, ax
    
    ; Draw HUD background in left grass (columns 0-7)
    ; Row 1: Score label
    mov di, 2    ; Row 0, Col 1
    mov si, scoreTxt
    mov ah, 0x2E  ; Yellow on green
    call txtPrintingSafe
    
    ; Row 2: Score value
    mov ax, [score]
    mov si, numBuf
    call number_to_string
    mov di, 162  ; Row 1, Col 1
    mov si, numBuf
    mov ah, 0x2F  ; White on green
    call txtPrintingSafe
    
    ; Row 4: Coins label
    mov di, 482  ; Row 3, Col 1
    mov si, coinTxt
    mov ah, 0x2E  ; Yellow on green
    call txtPrintingSafe
    
    ; Row 5: Coins value
    mov ax, [coin]
    mov si, numBuf
    call number_to_string
    mov di, 642  ; Row 4, Col 1
    mov si, numBuf
    mov ah, 0x2F  ; White on green
    call txtPrintingSafe
    
    ; Row 7: Fuel label
    mov di, 962  ; Row 6, Col 1
    mov si, fuelTxt
    mov ah, 0x2E  ; Yellow on green
    call txtPrintingSafe
    
    ; Row 8: Fuel value
    mov ax, [fuel]
    mov si, numBuf
    call number_to_string
    mov di, 1122  ; Row 7, Col 1
    mov si, numBuf
    mov ah, 0x2F  ; White on green
    call txtPrintingSafe
    
    ; Draw fuel bar (visual representation)
    mov di, 1282  ; Row 8, Col 1
    mov cx, 8     ; Max 8 blocks
    mov ax, [fuel]
    mov bl, 13    ; Each block = ~13% fuel
    
drawFuelBar:
    cmp ax, 0
    jle fuelBarEmpty
    
    push ax
    mov ax, 0x24DB  ; Full block, green on green (bright)
    stosw
    pop ax
    sub ax, 13
    loop drawFuelBar
    jmp fuelBarDone
    
fuelBarEmpty:
    mov ax, 0x20B0  ; Empty block
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

; ============================================
; UPDATE SCORE (called periodically)
; ============================================
updateScore:
    push ax
    push cx
    
    mov ah, 00h
    int 1Ah
    mov cx, dx
    
    mov ax, cx
    sub ax, [scoreTick]
    cmp ax, 18      ; Update score every ~1 second
    jb skipScoreUpdate
    mov [scoreTick], cx
    
    ; Increase score
    add word [score], 10
    
    ; Decrease fuel over time
    cmp word [fuel], 0
    je fuelEmpty
    sub word [fuel], 1
    jmp skipScoreUpdate
    
fuelEmpty:
    mov byte [gameOver], 1
    
skipScoreUpdate:
    pop cx
    pop ax
    ret

; ============================================
; IMPROVED COLLISION DETECTION
; ============================================
checkCollisions:
    push ax
    push bx
    push cx
    push dx
    push si
    
    ; Get player car bounding box
    ; Player car: 4 columns wide, 4 rows tall
    ; Player car is drawn at row+1, so actual top = row+1
    
    mov ax, [lane]
    mov bx, 15
    mul bx
    add ax, 16          ; Player left column (screen position)
    mov [playerLeft], ax
    add ax, 3           ; Player right column (4 wide)
    mov [playerRight], ax
    
    mov ax, [row]
    add ax, 1           ; Player top row (car drawn at row+1)
    mov [playerTop], ax
    add ax, 3           ; Player bottom row (4 tall)
    mov [playerBottom], ax
    
    ; Check collision with enemy cars
    mov cx, [numEnemyCars]
    cmp cx, 0
    je checkCoinCollision
    
    mov si, enemyCars
    
checkCarLoop:
    push cx
    
    ; Get enemy car position
    mov ax, [si]        ; Enemy lane
    mov bx, [si + 2]    ; Enemy row (tracked position)
    
    ; Skip if enemy car is off screen (row = -1 or > 24)
    cmp bx, 0
    jl noCarCollision
    cmp bx, 24
    jg noCarCollision
    
    ; Check if same lane first (quick rejection)
    cmp ax, [lane]
    jne noCarCollision
    
    ; Calculate enemy bounding box
    ; Enemy car is also drawn with similar offset
    ; The tracked row needs +1 adjustment to match visual position
    
    push ax
    mov cx, 15
    mul cx
    add ax, 16          ; Enemy left column
    mov [enemyLeft], ax
    add ax, 3           ; Enemy right column
    mov [enemyRight], ax
    pop ax
    
    ; FIXED: Enemy top row - add 1 to match actual display position
    mov ax, bx          ; Enemy tracked row
    sub ax, 2           ; CORRECTION: Actual display row is tracked_row + 1
    mov [enemyTop], ax
    add ax, 3           ; Enemy bottom row (4 tall)
    mov [enemyBottom], ax
    
    ; AABB Collision Detection
    ; Check if boxes overlap:
    ; playerLeft <= enemyRight AND playerRight >= enemyLeft AND
    ; playerTop <= enemyBottom AND playerBottom >= enemyTop
    
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
    
    ; COLLISION DETECTED!
    mov byte [collisionDetected], 1
    
    ; Freeze screen and show crash message
    call freezeOnCollision
    
    mov byte [gameOver], 1
    jmp collisionDone
    
noCarCollision:
    add si, 4         ; Next enemy car (2 words)
    pop cx
    loop checkCarLoop
    jmp checkCoinCollision
    
collisionDone:
    pop cx            ; Balance stack from push cx in loop
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; Temporary variables for collision detection
playerLeft: dw 0
playerRight: dw 0
playerTop: dw 0
playerBottom: dw 0
enemyLeft: dw 0
enemyRight: dw 0
enemyTop: dw 0
enemyBottom: dw 0

; ============================================
; FREEZE SCREEN ON COLLISION
; ============================================
freezeOnCollision:
    push ax
    push bx
    push cx
    push dx
    push di
    push si
    
    ; Play crash sound
    call crashSound
    
    ; Flash the screen red a few times
    mov cx, 3
flashLoop:
    push cx
    
    ; Flash player car to white
    call flashPlayerCar
    
    ; Delay
    mov bx, 0x1FFF
flashDelay1:
    dec bx
    jnz flashDelay1
    
    ; Restore player car color
    call RedCar
    
    ; Delay
    mov bx, 0x1FFF
flashDelay2:
    dec bx
    jnz flashDelay2
    
    pop cx
    loop flashLoop
    
    ; Draw crash message box in center of screen
    call drawCrashBox
    
    ; Wait for any key press
waitForKeyFreeze:
    mov ah, 0x01
    int 0x16
    jz waitForKeyFreeze
    
    ; Clear the key from buffer
    mov ah, 0x00
    int 0x16
    
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; ============================================
; FLASH PLAYER CAR (White color)
; ============================================
flashPlayerCar:
    push ax
    push di
    push cx
    
    mov ax, 0xB800
    mov es, ax
    
    ; Calculate player car position
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
    
    ; Draw white flashing car
    mov ax, 0xCFDB      ; White on bright white
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

; ============================================
; DRAW CRASH MESSAGE BOX
; ============================================
drawCrashBox:
    push ax
    push cx
    push di
    push si
    
    mov ax, 0xB800
    mov es, ax
    
    ; Draw box background (center of screen)
    ; Row 10-14, Column 25-55
    mov di, 160 * 10 + 50   ; Starting position
    mov cx, 5               ; 5 rows
    
drawCrashBoxBg:
    push cx
    push di
    mov cx, 30              ; 30 columns
    mov ax, 0x4C20          ; Red background
drawCrashBoxRow:
    stosw
    loop drawCrashBoxRow
    pop di
    add di, 160             ; Next row
    pop cx
    loop drawCrashBoxBg
    
    ; Draw border
    mov di, 160 * 10 + 50
    mov cx, 30
    mov ax, 0x4CCD          ; Top border
drawTopBorder:
    stosw
    loop drawTopBorder
    
    mov di, 160 * 14 + 50
    mov cx, 30
    mov ax, 0x4CCD          ; Bottom border
drawBottomBorder:
    stosw
    loop drawBottomBorder
    
    ; Draw crash message
    mov di, 160 * 12 + 56   ; Center of box
    mov si, crashMsg
    mov ah, 0x4F            ; White on red
    call txtPrintingSafe
    
    pop si
    pop di
    pop cx
    pop ax
    ret

checkCoinCollision:
    ; Check collision with coins
    mov cx, [numCoins]
    cmp cx, 0
    je checkFuelCollision
    
    mov si, coinPositions
    
checkCoinLoop:
    push cx
    
    mov ax, [si]      ; Coin lane
    mov bx, [si + 2]  ; Coin row
    
    ; Skip if already collected
    cmp bx, -1
    je noCoinCollision
    
    ; Check if same lane as player
    cmp ax, [lane]
    jne noCoinCollision
    
    ; Check if coin row is within player car (rows row to row+3)
    mov cx, [row]
    cmp bx, cx
    jl noCoinCollision
    add cx, 3
    cmp bx, cx
    jg noCoinCollision
    
    ; COIN COLLECTED!
    add word [coin], 1
    add word [score], 50
    
    ; Remove this coin (set row to -1)
    mov word [si + 2], -1
    
    ; Play collection sound
    call coinSound
    
noCoinCollision:
    add si, 4
    pop cx
    loop checkCoinLoop

checkFuelCollision:
    ; Check collision with fuel
    mov cx, [numFuel]
    cmp cx, 0
    je collisionCheckDone
    
    mov si, fuelPositions
    
checkFuelLoop:
    push cx
    
    mov ax, [si]      ; Fuel lane
    mov bx, [si + 2]  ; Fuel row
    
    ; Skip if already collected
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
    
    ; FUEL COLLECTED!
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
    ret

; ============================================
; SOUND EFFECTS
; ============================================
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
    
    ; Play a longer, more dramatic crash sound
    mov al, 182
    out 43h, al
    mov ax, 300         ; Low frequency for crash
    out 42h, al
    mov al, ah
    out 42h, al
    
    in al, 61h
    or al, 3
    out 61h, al
    
    mov cx, 0xFFFF
crashSoundDelay:
    loop crashSoundDelay
    
    ; Second tone
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
        mov word [coinPositions], 0      ; Lane 0
		jmp printingCoin
	coinLine2:
		mov di, 78
        mov word [coinPositions], 1      ; Lane 1
		jmp printingCoin
	coinLine3:
		mov di, 108
        mov word [coinPositions], 2      ; Lane 2
	
printingCoin:
    mov word [coinPositions + 2], 0      ; Row 0 (top)
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
        mov word [enemyCars], 0          ; Lane 0
		call BlueCar
		jmp storeCarPos
	carLine2:
		mov di, 76
        mov word [enemyCars], 1          ; Lane 1
		call BlueCar
		jmp storeCarPos
	carLine3:
		mov di, 106
        mov word [enemyCars], 2          ; Lane 2
		call BlueCar

storeCarPos:
    mov word [enemyCars + 2], 0          ; Row 0 (top)
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
        mov word [fuelPositions], 0      ; Lane 0
		jmp printingFuel
	fuelLine2:
		mov di, 78
        mov word [fuelPositions], 1      ; Lane 1
		jmp printingFuel
	fuelLine3:
		mov di, 108
        mov word [fuelPositions], 2      ; Lane 2
	
printingFuel:
    mov word [fuelPositions + 2], 0      ; Row 0
    mov word [numFuel], 1
    
	mov ax,0x4E20
	stosw
	mov ax,0x4E93
	stosw
	mov ax,0x4E20
	stosw
		
returnFuel:
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
    
    ; Update object positions as they scroll down
    call updateObjectPositions
	
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

; Update positions of all objects as they scroll
updateObjectPositions:
    push ax
    push cx
    push si
    
    ; Update enemy car positions
    mov cx, [numEnemyCars]
    cmp cx, 0
    je updateCoins
    mov si, enemyCars
    
updateEnemyLoop:
    add word [si + 2], 1    ; Increment row
    cmp word [si + 2], 25   ; Off screen?
    jl nextEnemy
    mov word [si + 2], 0    ; Reset to top
nextEnemy:
    add si, 4
    loop updateEnemyLoop
    
updateCoins:
    ; Update coin positions
    mov cx, [numCoins]
    cmp cx, 0
    je updateFuelPos
    mov si, coinPositions
    
updateCoinLoop:
    cmp word [si + 2], -1   ; Already collected?
    je nextCoin
    add word [si + 2], 1
    cmp word [si + 2], 25
    jl nextCoin
    mov word [si + 2], -1   ; Mark as gone
nextCoin:
    add si, 4
    loop updateCoinLoop
    
updateFuelPos:
    ; Update fuel positions
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
	je exitCheckInput
	
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

exitCheckInput:
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
    ; Play crash sound (if not already played)
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
	
	ret

restartGame:
    ; Reset game state
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
    jmp start

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
    ; Initialize game state
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
    
	call clear
	call introScreen
	call inputScreen
	
	call insScreen
	
	call drawBackGround
    call drawHUD            ; Draw initial HUD
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
    ; Check if game over
    cmp byte [gameOver], 1
    je gameOverJump
    
    ; Update score
    call updateScore
    
    ; Check collisions
    call checkCollisions
    
    ; Check again if game over (collision might have set it)
    cmp byte [gameOver], 1
    je gameOverJump
    
    ; Update HUD display
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
	
	call animateLanes
	
	mov ah, 0x01
	int 0x16
	jz gameLoop
	
	mov ah, 0x0
	int 0x16
	cmp al, 0
	jne escCheckGame
	
	cmp ah, 0x4D
	je rightKey
	cmp ah, 0x4B
	je leftKey
	cmp ah, 0x48
	je upKey
	cmp ah, 0x50
	je downKey
	jne gameLoop

gameOverJump:
    jmp exit
	
rightKey:
	cmp word [lane], 2
	je gameLoop
	call earaseCar
	add word [lane], 1
	call RedCar
    call checkCollisions    ; Check collision after move
    cmp byte [gameOver], 1
    je gameOverJump
	jmp gameLoop

leftKey:
	cmp word [lane], 0
	je gameLoop
	call earaseCar
	sub word [lane], 1
	call RedCar
    call checkCollisions    ; Check collision after move
    cmp byte [gameOver], 1
    je gameOverJump
	jmp gameLoop

upKey:
	cmp word [row], 1
	je gameLoop
	call earaseCar
	sub word [row], 1
	call RedCar
    call checkCollisions    ; Check collision after move
    cmp byte [gameOver], 1
    je gameOverJump
	jmp gameLoop
	
downKey:
	cmp word [row], 20
	je gameLoop
	call earaseCar
	add word [row], 1
	call RedCar
    call checkCollisions    ; Check collision after move
    cmp byte [gameOver], 1
    je gameOverJump
	jmp gameLoop
	
escCheckGame:
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
Phase 5 - Timer/Collision
Abdul Moeed Maan BSCS 2023 FAST NU LHR
•
Nov 21 (Edited Nov 28)
Due Nov 28
COAL Semester Project - Phase5
Google Docs

Class comments
