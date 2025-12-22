.model small
.stack 100h
.data
.code

main proc
    mov ax, @data
    mov ds, ax
    
       
    ;ADD
    mov al, 12h
    add al, 25h
    ;output: al = 37h : no carry 0
    
    mov bl, 23h
    mov cl, 18h
    add bl, cl
    ;ouput bl = 3B : no carry 0
    
    
    stc ; set carry 1
    mov al, 37h
    adc al, 25h
    ; al = 37 + 25 + 1 = 5B : no carray generated
    
    clc ; clear carry 0
    mov bl, 3bh
    mov cl, 18h
    adc bl,cl
    ; bl = 3b+18+0 = 53h: no carry
    
    
    ;SUB
    mov al, 37h
    sub al, 25h
    ;al = 37-25 = 12h : no borrow, cf = 0
    
    mov bl, 3bh
    mov cl, 18h
    sub bl, cl
    ;bl = 3b - 18 = 23h : no borrow, cf = 0
    
    
    ;SUB with borrow
    stc
    mov al, 12h
    sbb al, 25h
    ; al = 12h - 25h - 1 
    ; al = 12h + DBh + FFh = ECh : borrow, cf =1
    
    clc
    mov bl, 23h
    mov cl, 18h
    sbb bl,cl
    ;bl = 23 - 18 - 0 
    ;bl = 23 + E8 + 0 = 0B : no borrow 
     
     
    ; INC : Increment
    mov bl, 3bh
    inc bl
    ; bl = bl + 1 = 23 + 1 = 24h
    ; doesn't effect on CF
    
    mov bx, 0023h
    inc bx
    ; bx = bx + 1 = 0023 + 1 = 0024h
    
    
    
    ;DEC : Decrement
    mov bl, 3ch
    dec bl
    ; bl = bl - 1 = 3C - 1
    ; bl = 3c + FF = 3B
    ; does not effect CF
    
    mov bx, 0024h
    dec bx 
    ; bx = 0024 - 1
    ; bx = 0024 + FF
          
          
          
    ;-------------------------------------------------------------------
    
    ; MUL : unsigned multiplication
    ; Always multiply with [al] or [ax]
    
    mov al, 37h
    mov bl, 23h
    mul bl   
    
    ; ax <-- al * bl
    ; ax <-- 37 * 23 = 0785h 
    
    ;   n byte
    ; x n byte
    ;-------
    ;  2n byte
    
    ; therefore 2n can't store in al (1 byte)
    ; 2n can store in ax (2 byte) 
    
    mov ax, 85h
    mov bl, 49h ; it is unused
    mov cl, 65h
    mul cl
    ; ax <-- al * cl
    ; ax <-- 85 * 65 = 3479h
    ; ****************************always store in ax
     
    
    
    ;*** 
    mov ax, 3333h
    mov bx, 2040h
    mov cx, 7595h
    mul cx
    ;dx-ax <-- ax * cx = 3333 * 7595 = 1784 1BAF [4 byte]
    
    ;   2 byte
    ; X 2 byte
    ;------------
    ;   4 byte
    
    ; ax (2 byte : lower): 1BAF
    ; wx (2 byte : higher): 1784  
                                 
        
        
    ;------------------------------------------------------------------------
    ;setting ax bx 00 00
    mov ax, 0000h
    mov bx, 0000h
    
    ;IMUL : signed multiplication
    mov al, 37h ; signed value: +/-
    mov bl, 23h ; signed value: +/-
    imul bl
    
    ;ax <-- al * bl = 37 * 23 = 07 85h
    
    mov al, -2h ; signed value: -2 : FE
    mov bl, 9h  ; signed value: +9 : 09
    imul bl    
   
    ;ax <-- al * bl = -2 * 9 = FE * 09 = FF EE
    
    
    ;------------------------------------------------------------------------
    mov ax, 0000h
    mov bx, 0000h
    
    
    ;DIV: divisior
    mov ax, 0785h
    mov bl, 23h
    div bl 
    
    ; For 8 bit divisor
    ; al = ax / bl = 0785 / 23 = 37
    ; quotient store at AL: 37
    ; remainder store at AH:
                       
                       
    
    mov dx, 0h
    mov ax, 2710h
    mov bx, 012ch
    div bx              
                       
    ; For 16 bit divisor
    ; dx <-- ax / bx = 2710 / 012c
    ; quotient store at AX: 00 21h
    ; remainder store at DX: 00 64h
    
    
    ;------------------------------------------------------------------------
    mov ax, 0000h
    mov bx, 0000h
    
    ;IDIV : operand
    ; similar to DIV, but signed
              
    ; overflow
    ;mov ax, -2h     ; -2h = FFFE ---> des (65534)
    ;mov bl, 23h     ; 23h =   23 ---> des (35)
    ;div bl
    
    ; 65534 / 35 = 1872  which is out of range (0-255) des for unsigned operation
    
    ; al <-- FFFE / 23 = 07 50 (2 byte) which is out of range 
    ; al is 1 byte but output want to store 2 byte
    ; overflow occured
    
    
    
    mov ax, 0000h
    mov bx, 0000h
    
    mov ax, -2h     ; -2h
    mov bl, 23h     ; 23h =   35
    idiv bl
    
    ; -2 / 35 = 0 = 0h
    ; al = 0h 
    ; ah = -2h = FEh 
    
         
    mov ax, -40h
    mov bl, 23h
    idiv bl 
    
    ; al = -40 / 23 = FFh
    ; ah = E3 h
         
         
    ;------------------------------------------------------------------------
    mov ax, 0000h
    mov bx, 0000h
    
    
    ; CBW: convert byte to word
    mov al, 37h
    cbw
    ; ax = 00 37 h (1 word = 2 byte)
       
       
    mov bl, -22h ; -22 = DE
    cbw          ; bx = 00 DE
    
    
    
    
    ;------------------------------------------------------------------------
    mov ax, 0000h
    mov bx, 0000h
    
    
    ; CWD : convert word to dubleword
    ; this is meaningful only signed value
    ; it sign-extends ax into dx
    mov ax, 0037h   ; (sign bit = 0)000 0000 0011 0111
    cwd
    
    
    
    mov ax, 8001h   ; AX = 1000 0000 0000 0001b
    cwd
    
    ; AX in binary: 1000 0000 0000 0001 ? sign bit = 1
    ; CWD sets every bit of DX to the sign bit:
    ; DX = 1111 1111 1111 1111b = FFFFh

    
    
    
    ;------------------------------------------------------------------------
    ; Demo 13: CMP operand1, operand2 (compare)
    mov bl, 3bh
    mov cl, 18h
    cmp bl, cl      
    ; BL - CL = 3BH - 18H = 23H (sets flags: ZF=0, SF=0, CF=0, etc.)
    
    
    ;------------------------------------------------------------------------
    ; Demo 14: NEG operand (negate)
    mov bl, 3bh     ; BL=3BH (59 dec)
    neg bl          ; BL = -BL (two's complement) = -59 = C5H (signed)
    
    
    
    
    
    
    main endp
end main




